### Load required R modules (if not available, reinstall as admin)
library(data.table)
library(Gviz)
library(GenomicFeatures)
library(org.Hs.eg.db)
library(rlist)
library(RColorBrewer)
### SPECIFY LOCI HERE ###
#loci <- 'IFNB1'
#loci <- 'ISG15'
loci <- 'IFIT2'


if (loci == 'IFNB1') {
  myChr = "chr9"
  myStart = 21077000
  myEnd = 21078000
} else if (loci == 'ISG15') {
  myChr = "chr1"
  myStart = 1013400
  myEnd = 1014700
} else if (loci == 'IFIT2') {
  myChr = "chr10"
  myStart = 89301000
  myEnd = 89310000
}

### Set directory to work in
setwd("C:/Users/cczha/Desktop/BED/")

### Specify genome name, chromosome number, and co-ordinates for mapping
myGenome = "hg38"

### Read in UCSC genes and track 
ucscGenes <- UcscTrack(genome = myGenome, table="ncbiRefSeq", track = 'NCBI RefSeq', trackType="GeneRegionTrack",
                       chromosome=myChr, rstarts = "exonStarts", rends = "exonEnds",
                       gene = "name", symbol = 'name', transcript = "name",
                       strand = "strand", stacking = 'pack', showID = T, geneSymbol = T, background.title="transparent")

z <- ranges(ucscGenes)
mcols(z)$symbol <- mapIds(org.Hs.eg.db, gsub("\\.[1-9]$", "", mcols(z)$symbol), "SYMBOL","REFSEQ")
ucscGenes2 <- ucscGenes
ranges(ucscGenes2) <- z

### Generate genome and ideogram tracks
gtrack<-GenomeAxisTrack(col="black") 
itrack<-IdeogramTrack(genome = myGenome, chromosome = myChr)
data <- list(itrack, gtrack, ucscGenes2)
sizes <- c(0.08, 0.3, 0.1)

file_names <- c('SRR7049609','SRR7049610','SRR7049611','SRR7049612','SRR7049615','SRR7049616')
i <- 1
for (file in file_names) {
  ### Read in bedgraph files as simple text files (specify column headers)
  bedFile1 <- fread(paste('./',file,'.fwd.bedgraph',sep=''), col.names = c('chromosome', 'start', 'end', 'value'))
  bedFile2 <- fread(paste('./',file,'.rev.bedgraph',sep=''), col.names = c('chromosome', 'start', 'end', 'value'))
  bedFile3 <- fread(paste('./',file,'.sorted.bedgraph',sep=''), col.names = c('chromosome', 'start', 'end', 'value'))
  
  ### Determine the maximium depth value within the specified mapping co-ordinates
  ChrData<-bedFile3[bedFile3$chromosome==myChr,]
  ChrData2<-ChrData[ChrData$start>myStart]
  ChrData3<-ChrData2[ChrData2$end<myEnd,]
  maxV<-max(ChrData3$value)
  if (is.infinite(maxV)) {
    maxV <- 0
  }
  color_code <- brewer.pal(n=length(file_names),"Dark2")[i]
  ### Generate dataTracks - type ?DataTrack to see options
  dataTrack1 <- DataTrack(range = bedFile1, type = "a", chromosome=myChr, genome = myGenome, name = paste('Seq. Depth:\n',file,'\nFWD',sep=''), fill = "dark blue", col = "black", background.title = color_code, ylim=c(0,maxV))
  dataTrack2 <- DataTrack(range = bedFile2, type = "a", chromosome=myChr, genome = myGenome, name = paste('Seq. Depth:\n',file,'\nREV',sep=''), fill = "dark red", col = "black", background.title = color_code, ylim=c(maxV,0)) 
  dataTrack3 <- DataTrack(range = bedFile3, type = "a", chromosome=myChr, genome = myGenome, name = paste('Seq. Depth:\n',file,'\nNon-Stranded',sep=''), fill = "dark green", col = "black", background.title = color_code)
  data <- list.append(data,dataTrack1,dataTrack2,dataTrack3)
  sizes <- c(sizes, 0.3, 0.3, 0.3)
  i <- i + 1
}

### GENERATE PLOT ###
plotTracks(data, collapseTranscripts = "meta", transcriptAnnotation = "symbol", from = myStart, to = myEnd, sizes=sizes, type="hist", col.histogram=NA, cex.title=0.5, cex.axis=0.5, title.width=1.2)
