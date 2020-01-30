#' Simulate GWAS data
#'
#' This function serves to simulate GWAS data. The output resembles that of the 
#' PLINK output when generated using the \code{--assoc} flag for association testing.
#' The purpose of this function is mainly for debugging and testing of other 
#' scripts. Default setting is to create one significant column. This can be set 
#' in the \code{AddSigSNPs} field (logical). The parameters of the significant column 
#' are \code{SigCHR} to specify which chromosome the significant column should appear 
#' in (integer between 1 and 22), and the number of significant columns  in 
#' \code{nSigCols} (integer). 
#' Other parameters are the number of SNPs (\code{nSNPs}) in the fake dataset, and 
#' the number of individuals in the dataset. Note that these last two parameters 
#' are subject to change due to the algorithm by which random data is generated 
#' in this function.
#' A known bug is that the data can be a little "tail-heavy" towards the smaller
#' chromosomes.
#' 
#' @param nSNPs Number of SNPs in datafile (roughly)
#' @param N Number of individuals in dataset
#' @param AddSigSNPs Add significant SNPs (logical)
#' @param SigCHR Chromosome(s) with the significant SNPs
#' @param nSigCols Number of significant columns
#'
#' @usage 
#' sim.dat <- simulateGWAS()
#' sim.dat <- simulateGWAS(nSNPs = 5e5, N = 2e4, 
#'    AddSigSNPs = FALSE, SigCHR = NULL, nSigCols = NULL)
#' sim.dat <- simulateGWAS(nSNPs = 2e5, N = 6e5, 
#'    AddSigSNPs = TRUE, SigCHR = c(2,4,6,7), nSigCols = 4)
#'
#' @export

simulateGWAS <- function(nSNPs = 5e5, 
                         N = 2e4, 
                         AddSigSNPs = TRUE,
                         SigCHR = NULL,
                         nSigCols = NULL) {
  
  if (is.null(nSigCols)) nSigCols <- 1
  if (is.null(SigCHR)) SigCHR <- sample(1:16, nSigCols, replace = TRUE)
  if (length(SigCHR) != nSigCols) {
    warning("Length of SigCHR does not match nSigCols")
    SigCHR <- rep(SigCHR, 4)
  }
  SigCHR <- SigCHR[order(SigCHR)]
  
  cat("GENERATING SIMULATED GWAS DATASET\n")
  
  nCHR <- 22
  CHR <- c()
  BP <- c()
  for (i in 1:nCHR) {
    CHR <- c(CHR,rep(i,round(nSNPs/nCHR)))
    BP <- c(BP,ceiling(runif(round(nSNPs/nCHR))*(nCHR-i+1)*nSNPs))
  }
  l <- length(BP)
  
  cat("1. Generating random rs IDs\n")
  SNP <- sprintf("rs%s",sample(1e4:1e8, l, replace=FALSE))
  
  cat("2. Generate list of N per SNP\n")
  tnmiss <- round(rnorm(2*l, mean = N, sd=1e2))
  tnmiss <- tnmiss[tnmiss < (mean(tnmiss) + 0.25*sd(tnmiss))]
  NMISS <- sample(tnmiss,l, replace = TRUE)
  
  cat("3. Generating BETA\n")
  tbeta <- rnorm(l, mean = 9.25e-05, sd=0.15)
  tbeta <- tbeta * tbeta
  BETA <- c(tbeta,-1*tbeta)
  
  cat("4. Generating SE\n")
  tse <- rnorm(2*l, mean = 0.1, sd=0.25)
  tse <- tse[tse > (mean(tse) - 0.05*sd(tse))]/2
  SE <- sample(tse,l, replace = TRUE)
  
  cat("5. Generating R^2\n")
  tr2 <- rlnorm(2*l, meanlog = 2, sdlog = 1)/1.5e5
  tr2 <- tr2[tr2 < 2.5e-3]
  R2 <- sample(tr2,l, replace = FALSE)
  
  cat("6. Generating T-values\n")
  T <- rnorm(l, mean = 0, sd = 1)
  
  cat("7. Generating P-values\n")
  P <- runif(l)
  
  df <- data.frame(CHR,SNP,BP,NMISS,BETA,SE,R2,T,P)
  
  # Create budge in chromosome 9
  ch9 <- df[df$CHR == 9, ]
  l9 <- max(ch9$BP)
  r.to.rem <- (l9*40/100):(l9*45/100)
  ch9 <- ch9[!(ch9$BP > (l9*32.5/100) & ch9$BP < (l9*45/100)), ]
  
  df.min9 <- df[!(df$CHR == 9), ]
  out <- rbind(df.min9,ch9)
  out <- out[order(out$CHR), ]
  
  # Add significant hits
  if (AddSigSNPs) {
    for (i in 1:length(SigCHR)) {
      cat(sprintf("%s. Adding significant column in chromosome %s\n", 7+i, SigCHR[i]))
      temp.to.add <- out[out$CHR == SigCHR[i], ]
      sigloc <- round(sample(nrow(temp.to.add), 1))
      sigs <- temp.to.add[rep(sigloc,20), ]
      #np <- abs(rnorm(nrow(sigs), mean=2e-14, sd=1e-10)) * sigs$P
      #np <- runif(nrow(sigs),min = 1e-14, max = 1e-5)
      np <- rlnorm(nrow(sigs), meanlog = -14, sdlog = 6)
      sigs$P <- np
      sig.dat <- sigs[rev(order(sigs$P)), ]
      
      out <- rbind(out,sig.dat)
    }
  }
  
  cat("DONE!\n")
  
  return(out)
}
