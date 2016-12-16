#' STAT471 Homework Format
#'
#' @inheritParams rmarkdown::pdf_document
#' @param ... Arguments to \code{rmarkdown::pdf_document}
#'
#' @return R Markdown output format to pass to \code{\link[rmarkdown:render]{render}}
#'
#' @examples
#'
#' \dontrun{
#' library(rmarkdown)
#' draft("MyArticle.Rmd", template = "hw_471", package = "stat471")
#' }
#'
#' @export
hw_471 <- function(
    documentclass = 'hw_471', fig_width = 4, fig_height = 2.5,
    fig_crop = TRUE, dev = 'pdf', highlight = 'default',
    template =  template_resources('hw_471', 'template.tex'), ...
) {

    # resolve default highlight
    if (identical(highlight, 'default')) highlight = 'pygments'

    # call the base pdf_document format with the appropriate options
    format = rmarkdown::pdf_document(
        fig_width = fig_width, fig_height = fig_height, fig_crop = fig_crop,
        dev = dev, highlight = highlight, template = template, ...
    )

    # LaTeX document class
    documentclass = match.arg(documentclass)
    format$pandoc$args = c(
        format$pandoc$args, '--variable', paste0('documentclass:', documentclass)
    )

    # knitr::knit_engines$set(marginfigure = function(options) {
    #     options$type = 'marginfigure'
    #     eng_block = knitr::knit_engines$get('block')
    #     eng_block(options)
    # })

    # create knitr options (ensure opts and hooks are non-null)
    knitr_options = rmarkdown::knitr_options_pdf(fig_width, fig_height, fig_crop, dev)
    if (is.null(knitr_options$opts_knit))  knitr_options$opts_knit = list()
    if (is.null(knitr_options$knit_hooks)) knitr_options$knit_hooks = list()

    # set options
    # knitr_options$opts_chunk$tidy = TRUE
    # knitr_options$opts_knit$width = 45

    # set hooks for special plot output
    knitr_options$knit_hooks$plot = function(x, options) {

        # determine figure type
        if (isTRUE(options$fig.margin)) {
            options$fig.env = 'marginfigure'
            if (is.null(options$fig.cap)) options$fig.cap = ''
        } else if (isTRUE(options$fig.fullwidth)) {
            options$fig.env = 'figure*'
            if (is.null(options$fig.cap)) options$fig.cap = ''
        }

        knitr::hook_plot_tex(x, options)
    }

    # override the knitr settings of the base format and return the format
    format$knitr = knitr_options
    format$inherits = 'pdf_document'
    format
}

template_resources = function(name, ...) {
    system.file('rmarkdown', 'templates', name, 'resources', ..., package = 'stat471')
}
