#!/usr/bin/env Rscript

library(httr)
library(jsonlite)

## Set up the BitBucket API endpoint and credentials.
c.username.slug <- "mcpflow/pflow"
c.base.url <- paste0("https://api.bitbucket.org/2.0/repositories/", c.username.slug, "/issues")
c.username <- "mcpflow"
c.pw <- "XXX"

## Function to list issues.
list_issues <- function() {
  response <- httr::GET(c.base.url, authenticate(c.username, c.pw))
  httr::stop_for_status(response)
  content(response, as = "text", encoding = "UTF-8")
}

## Call the list_issues function and parse the JSON response.
issues_json <- list_issues()
issues <- jsonlite::fromJSON(issues_json)

## Print the parsed JSON data.
print(issues)
