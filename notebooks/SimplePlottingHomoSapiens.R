
### Load required R modules (if not available, reinstall as admin)
library(data.table)
library(Gviz)
library(GenomicFeatures)
library(org.Hs.eg.db)

### Set directory to work in
setwd("/Users/taniagonzalezrobles/NYU-classes/bioinformatics/module-3/data")

### Specify genome name, chromosome number, and co-ordinates for mapping
myGenome = "hg38"
myChr = "chr1"  
myStart = 1013000 
myEnd = 1015000 

### Read in bedgraph files as simple text files (specify column headers)
bedFile1 <- fread('./SRR7049609_bt2.fwd.bedgraph', col.names = c('chromosome', 'start', 'end', 'value'))
bedFile2 <- fread('./sorted.reverse.bedgraph', col.names = c('chromosome', 'start', 'end', 'value'))
bedFile3 <- fread('./sorted.bedgraph', col.names = c('chromosome', 'start', 'end', 'value'))

### Determine the maximium depth value within the specified mapping co-ordinates
ChrData<-bedFile3[bedFile3$chromosome=="chr12",]
ChrData2<-ChrData[ChrData$start>myStart]
ChrData3<-ChrData2[ChrData2$end<myEnd,]
maxV<-max(ChrData3$value)

### Generate dataTracks - type ?DataTrack to see options
dataTrack1 <- DataTrack(range = bedFile1, type = "a", chromosome=myChr, genome = myGenome, name = "Seq. Depth", fill = "dark blue", col = "black", background.title = "black", ylim=c(0,maxV))
dataTrack2 <- DataTrack(range = bedFile2, type = "a", chromosome=myChr, genome = myGenome, name = "Seq. Depth", fill = "dark red", col = "black", background.title = "transparent", ylim=c(maxV,0)) 
dataTrack3 <- DataTrack(range = bedFile3, type = "a", chromosome=myChr, genome = myGenome, name = "Seq. Depth", fill = "dark green", col = "black", background.title = "transparent") 

### Generate genome and ideogram tracks
gtrack<-GenomeAxisTrack(col="black") 
itrack <- IdeogramTrack(genome = myGenome, chromosome = myChr)

### Read in UCSC genes and track 
ucscGenes <- UcscTrack(genome = myGenome, table="ncbiRefSeq", track = 'NCBI RefSeq', trackType="GeneRegionTrack",
                       chromosome=myChr, rstarts = "exonStarts", rends = "exonEnds",
                       gene = "name", symbol = 'name', transcript = "name",
                       strand = "strand", stacking = 'pack', showID = T, geneSymbol = T)

z <- ranges(ucscGenes)
mcols(z)$symbol <- mapIds(org.Hs.eg.db, gsub("\\.[1-9]$", "", mcols(z)$symbol), "SYMBOL","REFSEQ")
ucscGenes2 <- ucscGenes
ranges(ucscGenes2) <- z


### GENERATE PLOT ###
plotTracks(list(itrack,dataTrack1,dataTrack2,dataTrack3,gtrack,ucscGenes2), collapseTranscripts = "meta", transcriptAnnotation = "symbol", from = myStart, to = myEnd, sizes=c(0.05,0.2,0.2,0.2,0.1,0.2), type="hist", col.histogram=NA, cex.title=1, cex.axis=1, title.width=1.2)


### GENERATE PLOT WITH LOG2 SCALED DATA - NOTE: NEED TO CHANGE Y-LIM VALUES IN dataTrack GENERATION
#plotTracks(list(itrack,dataTrack1,gtrack,ucscGenes2,dataTrack2), collapseTranscripts = "meta", transcriptAnnotation = "symbol", from = myStart, to = myEnd, sizes=c(0.05,0.4,0.1,0.05,0.4), type="hist", col.histogram=NA, cex.title=1, cex.axis=1, title.width=1.2, transformation=function(x){log2(x+1)})


