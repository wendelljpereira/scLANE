% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/plotModels.R
\name{plotModels}
\alias{plotModels}
\title{Plot results of \code{marge} and other models using \code{ggplot2}.}
\usage{
plotModels(
  test.dyn.res = NULL,
  gene = NULL,
  pt = NULL,
  gene.counts = NULL,
  is.gee = FALSE,
  is.glmm = FALSE,
  id.vec = NULL,
  cor.structure = "exchangeable",
  ci.alpha = 0.05,
  plot.null = TRUE,
  plot.glm = TRUE,
  plot.gam = TRUE,
  plot.marge = TRUE,
  gam.degree = 3,
  filter.lineage = NULL,
  gg.theme = ggplot2::theme_classic(base_size = 14)
)
}
\arguments{
\item{test.dyn.res}{The output from \code{\link{testDynamic}}. Defaults to NULL.}

\item{gene}{The name of the gene that's being analyzed. Used as the title of the \code{ggplot} object & to subset the counts matrix. Defaults to NULL.}

\item{pt}{A data.frame of pseudotime values for each cell. Defaults to NULL.}

\item{gene.counts}{A matrix of integer expression values for each cell & gene. Must have genes as columns & cells as rows, with column names being gene names. Defaults to NULL.}

\item{is.gee}{Should a GEE framework be used instead of the default GLM? Defaults to FALSE.}

\item{is.glmm}{Should a GLMM framework be used instead of the default GLM? Defaults to FALSE.}

\item{id.vec}{If the GEE or GLMM framework is being used, a vector of subject IDs to use as input to \code{\link[geeM]{geem}} or \code{\link[glmmTMB]{glmmTMB}}. Defaults to NULL.}

\item{cor.structure}{If the GEE framework is used, specifies the desired working correlation structure. Must be one of "ar1", "independence", or "exchangeable". Defaults to "exchangeable".}

\item{ci.alpha}{(Optional) The pre-specified Type I Error rate used in generating (\eqn{1 - \alpha})\% CIs. Defaults to good old 0.05.}

\item{plot.null}{(Optional) Should the fitted values from the intercept-only null model be plotted? Defaults to TRUE.}

\item{plot.glm}{(Optional) Should the fitted values from an NB GLM be plotted? If the data are multi-subject, the "GLM" model can be a GEE or GLMM depending on the desired framework. See Examples for more detail. Defaults to TRUE.}

\item{plot.gam}{(Optional) Should the fitted values from an NB GAM be plotted? Defaults to TRUE.}

\item{plot.marge}{(Optional) Should the fitted values from the \code{marge} model be plotted? Defaults to TRUE.}

\item{gam.degree}{(Optional) The basis spline degree used in \code{\link{nbGAM}}. Defaults to 3.}

\item{filter.lineage}{(Optional) A character vector of lineages to filter out before generating the final plot. Should be letters, i.e. lineage "A" or "B". Defaults to NULL.}

\item{gg.theme}{(Optional) A \code{ggplot2} theme to be added to the plot. Defaults to \code{theme_classic(base_size = 14)}.}
}
\value{
A \code{ggplot} object.
}
\description{
This function visualizes the fitted values of several types of models over the expression and pseudotime values of each cell.
}
\examples{
\dontrun{
plotModels(gene_stats,
           gene = "AURKA",
           pt = pt_df,
           gene.counts = count_mat)
plotModels(gene_stats,
           gene = "BRCA2",
           pt = pt_df,
           gene.counts = count_mat,
           ci.alpha = 0.1,
           filter.lineage = c("A", "C"))
plotModels(gene_stats,
           gene = "CD14",
           pt = pt_df,
           gene.counts = count_mat,
           is.glmm = TRUE,
           id.vec = subject_ids,
           plot.glm = TRUE,  # plots an NB GLMM with random intercepts & slopes per-subject
           plot.gam = TRUE,  # plots an NB GAMM with random intercepts per-subject
           gam.degree = 5,
           gg.theme = ggplot2::theme_minimal())
}
}
\author{
Jack Leary
}
