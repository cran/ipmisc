# defining global variables and functions to appease R CMD Check

utils::globalVariables(
  names = c(".", "rowid", "df"),
  package = "ipmisc",
  add = FALSE
)
