#!/usr/bin/env Rscript

library(httr)
library(jsonlite)

## Define BitBucket API endpoint and credentials.
bitbucket_slug <- "mcpflow/pflow"
bitbucket_issues_url <- paste0("https://api.bitbucket.org/2.0/repositories/", bitbucket_slug, "/issues")
bitbucket_username <- "mcpflow"
bitbucket_password <- "XXX"

## Define function to list issues.
list_issues <- function() {
  response <- httr::GET(bitbucket_issues_url, authenticate(bitbucket_username, bitbucket_password))
  httr::stop_for_status(response)
  issues_json <- content(response, encoding = "UTF-8")
  fromJSON(issues_json)                 # Parse the JSON response.
}

## Call the list_issues function.
issues <- list_issues()

## Print the parsed JSON data.
print(issues)