#!/usr/bin/env Rscript

library(httr)
library(jsonlite)

## Define BitBucket API endpoint and credentials.
c.username.slug <- "mcpflow/pflow"
c.base.url <- paste0("https://api.bitbucket.org/2.0/repositories/", c.username.slug, "/issues")
c.username <- "mcpflow"
c.pw <- "XXX"

## Define function to list issues.
list_issues <- function() {
  response <- httr::GET(c.base.url, authenticate(c.username, c.pw))
  httr::stop_for_status(response)
  issues_json <- content(response, encoding = "UTF-8")
  fromJSON(issues_json)                 # Parse the JSON response.
}

## Call the list_issues function.
issues <- list_issues()

## Print the parsed JSON data.
print(issues)