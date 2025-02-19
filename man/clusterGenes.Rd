% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/clusterGenes.R
\name{clusterGenes}
\alias{clusterGenes}
\title{Cluster the fitted values from a set of \code{scLANE} models.}
\usage{
clusterGenes(
  test.dyn.res = NULL,
  clust.algo = "leiden",
  use.pca = FALSE,
  n.PC = 15,
  lineages = NULL
)
}
\arguments{
\item{test.dyn.res}{The list returned by \code{\link{testDynamic}} - no extra processing required. Defaults to NULL.}

\item{clust.algo}{The clustering method to use. Can be one of "hclust", "kmeans", "leiden". Defaults to "leiden".}

\item{use.pca}{Should PCA be performed prior to clustering? Defaults to FALSE.}

\item{n.PC}{The number of principal components to use when performing dimension reduction prior to clustering. Defaults to 15.}

\item{lineages}{Should one or more lineages be isolated? If so, specify which one(s). Otherwise, all lineages will be clustered independently. Defaults to NULL.}
}
\value{
A data.frame of with three columns: \code{Gene}, \code{Lineage}, and \code{Cluster}.
}
\description{
This function takes as input the output from \code{\link{testDynamic}} and clusters the fitted values from the model for each gene using one of several user-chosen algorithms. An approximately optimal clustering is determined by iterating over reasonable hyperparameter values & choosing the value with the highest mean silhouette score.
}
\examples{
\dontrun{
clusterGenes(gene_stats, clust.algo = "leiden")
clusterGenes(gene_stats,
             clust.algo = "kmeans",
             use.pca = TRUE,
             n.PC = 10,
             lineages = "B")
clusterGenes(gene_stats, lineages = c("A", "C"))
}
}
\seealso{
\code{\link{testDynamic}}

\code{\link{plotClusteredGenes}}
}
\author{
Jack Leary
}
