#' @title Converts dataframe from long/tidy to wide format with `NA`s removed
#' @name long_to_wide_converter
#'
#' @description
#'
#' \Sexpr[results=rd, stage=render]{rlang:::lifecycle("maturing")}
#'
#' This conversion is helpful mostly for repeated measures design, where
#' removing `NA`s by participant can be a bit tedious.
#'
#' It doesn't make sense to spread the dataframe to wide format when the measure
#' is not repeated, so if `paired = TRUE`, `spread` argument will be ignored.
#'
#' @param data A dataframe (or a tibble) from which variables specified are to
#'   be taken. A matrix or a table will **not** be accepted.
#' @param x The grouping variable from the dataframe `data`.
#' @param y The response (a.k.a. outcome or dependent) variable from the
#'   dataframe `data`.
#' @param subject.id Relevant in case of repeated measures design (`paired =
#'   TRUE`, i.e.), it specifies the subject or repeated measures identifier.
#'   **Important**: Note that if this argument is `NULL` (which is the default),
#'   the function assumes that the data has already been sorted by such an id by
#'   the user and creates an internal identifier. So if your data is **not**
#'   sorted and you leave this argument unspecified, the results can be
#'   inaccurate.
#' @param paired Logical that decides whether the experimental design is
#'   repeated measures/within-subjects or between-subjects. The default is
#'   `FALSE`.
#' @param spread Logical that decides whether the dataframe needs to be
#'   converted from long/tidy to wide (default: `TRUE`). Relevant only if
#'   `paired = TRUE`.
#' @param ... Currently ignored.
#'
#' @importFrom dplyr row_number select mutate group_by ungroup arrange everything
#' @importFrom dplyr nest_by filter
#' @importFrom tidyr pivot_longer unnest
#'
#' @return A dataframe with `NA`s removed.
#'
#' @examples
#' # for reproducibility
#' library(ipmisc)
#' set.seed(123)
#'
#' # repeated measures design
#' long_to_wide_converter(
#'   data = bugs_long,
#'   x = condition,
#'   y = desire,
#'   subject.id = subject,
#'   paired = TRUE
#' )
#'
#' # independent measures design (spread argument is ignored)
#' long_to_wide_converter(
#'   data = ggplot2::msleep,
#'   x = vore,
#'   y = brainwt,
#'   paired = FALSE,
#'   spread = FALSE
#' )
#' @export

# function body
long_to_wide_converter <- function(data,
                                   x,
                                   y,
                                   subject.id = NULL,
                                   paired = TRUE,
                                   spread = TRUE,
                                   ...) {
  # make sure both quoted and unquoted arguments are allowed
  c(x, y) %<-% c(rlang::ensym(x), rlang::ensym(y))

  # for non-paired data, even if specified, ignore it
  if (isFALSE(paired)) subject.id <- NULL

  # initial cleanup
  data %<>%
    dplyr::select({{ x }}, {{ y }}, rowid = {{ subject.id }}) %>%
    dplyr::mutate({{ x }} := droplevels(as.factor({{ x }}))) %>%
    dplyr::arrange({{ x }})

  # if `subject.id` wasn't provided, create one for internal usage
  if (!"rowid" %in% names(data)) {
    # the row number needs to be assigned for each participant in paired data
    if (isTRUE(paired)) data %<>% dplyr::group_by({{ x }})

    # unique id for each participant
    data %<>% dplyr::mutate(rowid = dplyr::row_number())
  }

  # NA removal
  data %<>%
    dplyr::ungroup(.) %>%
    dplyr::nest_by(rowid, .key = "df") %>%
    dplyr::filter(sum(is.na(df)) == 0) %>%
    tidyr::unnest(cols = c(df))

  # convert to wide?
  if (spread && paired) data %<>% tidyr::pivot_wider(names_from = {{ x }}, values_from = {{ y }})

  # final clean-up
  as_tibble(dplyr::select(data, rowid, dplyr::everything()) %>% dplyr::arrange(rowid))
}
