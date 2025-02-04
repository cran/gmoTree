## ----collapse=TRUE, include=FALSE---------------------------------------------
library(gmoTree)

## ----cournot codebook---------------------------------------------------------
# Create the codebook list
cbook <- codebook(path = system.file(path = "extdata/ocode_new",
                                     package = "gmoTree"),
                  output = "list",
                  doc_info = FALSE)

str(cbook, 1)  # Show all apps
print(cbook$cournot)  # Only show cournot app

## ----one app------------------------------------------------------------------
cbook <- codebook(
  path = system.file("extdata/ocode_new",
                     package = "gmoTree"),
  fsource = "init",
  output = "list",
  doc_info = FALSE,
  app = "cournot")

str(cbook)

## ----two apps-----------------------------------------------------------------
cbook <- codebook(
  path = system.file("extdata/ocode_new",
                     package = "gmoTree"),
  fsource = "init",
  output = "list",
  doc_info = FALSE,
  app = c("cournot", "dictator"))

str(cbook, 1)

## ----removing apps------------------------------------------------------------
cbook <- codebook(
  path = system.file("extdata/ocode_new", package = "gmoTree"),
  fsource = "init",
  output = "list",
  doc_info = FALSE,
  app_rm = "prisoner")

str(cbook, 1)

## ----sort apps----------------------------------------------------------------
cbook <- codebook(
  path = system.file("extdata/ocode_new", package = "gmoTree"),
  fsource = "init",
  output = "list",
  doc_info = FALSE,
  app = c("cournot", "dictator"),
  sort = c("dictator", "cournot"))

str(cbook, 1)

## ----global settings----------------------------------------------------------
cbook <- codebook(
  path = system.file("extdata/ocode_new", package = "gmoTree"),
  fsource = "init",
  output = "list",
  settings_replace = "global",
  app = "dictator")

print(cbook$dictator$Constants$Variable)

## ----do not replace settings--------------------------------------------------
cbook <- codebook(
  path = system.file("extdata/ocode_new", package = "gmoTree"),
  fsource = "init",
  output = "list",
  settings_replace = NULL,
  app = "dictator")

print(cbook$dictator$Constants$Variable)

## ----user settings------------------------------------------------------------
cbook <- codebook(
  path = system.file("extdata/ocode_new", package = "gmoTree"),
  fsource = "init",
  output = "list",
  settings_replace = "user",
  user_settings = list(variable = "someValue"),
  app = "dictator")

print(cbook$dictator$Constants$Variable)

