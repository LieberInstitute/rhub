% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/check-cran.R
\name{check_for_cran}
\alias{check_for_cran}
\title{Check an R-package on R-hub, for a CRAN submission}
\usage{
check_for_cran(path = ".", email = NULL, check_args = "--as-cran",
  env_vars = c(`_R_CHECK_FORCE_SUGGESTS_` = "true"), ...)
}
\arguments{
\item{path}{Path to a directory containing an R package, or path to
source R package tarball built with \code{R CMD build} or
\code{devtools::build()}.}

\item{email}{Email address to send notification to about the build.
It must be a validated email address, see \code{\link[=validate_email]{validate_email()}}. If
\code{NULL}, then the email address of the maintainer is used, as defined
in the \code{DESCRIPTION} file of the package.}

\item{check_args}{Arguments for \code{R CMD check}. By default \code{--as-cran}
is used.}

\item{env_vars}{Environment variables to set on the builder. By default
\code{_R_CHECK_FORCE_SUGGESTS_=true} is set, to require all packages used.}

\item{...}{Additional arguments are passed to \code{\link[=check]{check()}}.}
}
\value{
An \link{rhub_check} object.
}
\description{
This function calls \code{\link[=check]{check()}} with arguments and platforms, that
are suggested for a CRAN submission. In particular:
\itemize{
\item It checks the package on Windows, and Linux.
\item It checks the package on R-oldrel, R-release and R-devel.
\item It uses the \code{--as-cran} argument to \code{R CMD build}.
\item It requires all dependencies, including suggested ones.
}
}
\examples{
\dontrun{
ch <- check_for_cran("package", show_status = FALSE)
ch$update()
ch$livelog(3)
}
}

