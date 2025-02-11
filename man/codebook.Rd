% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/codebook.R
\name{codebook}
\alias{codebook}
\title{Create a codebook for the oTree code}
\usage{
codebook(
  path = ".",
  fsource = "init",
  output = "both",
  output_dir = NULL,
  output_file = "codebook",
  output_format = "pdf_document_simple",
  output_open = TRUE,
  app_doc = TRUE,
  app = NULL,
  app_rm = NULL,
  doc_info = TRUE,
  sort = NULL,
  settings_replace = "global",
  user_settings = NULL,
  include_cons = TRUE,
  include_subs = FALSE,
  preamb = FALSE,
  encoding = "UTF-8",
  title = "Codebook",
  subtitle = "created with gmoTree",
  params = NULL,
  date = "today",
  splitvarname = FALSE,
  sep_list = "newline",
  initial = TRUE
)
}
\arguments{
\item{path}{Character string. Path of the oTree experiment.}

\item{fsource}{Character string. \code{"init"} if information should be taken
from the \code{init.py} files (newer oTree code with 5.x
format). \code{"models"}
(or \code{"model"}) if the information
should be taken from the \code{models.py} files
(older oTree code with 3.x format).}

\item{output}{Character string. \code{"list"} if the output should contain a
list of variables and their information. \code{"file"} if the output
should be a file such as a Word or PDF file.
\code{"both"} if the output should contain a file and a list.}

\item{output_dir}{Character string. The absolute path where
the function's output will be saved.
Only absolute paths are allowed for this parameter.
Relative paths can be specified in the \code{output_file} parameter.}

\item{output_file}{Character string.
The name of the output file generated by the function.
The file name can be provided with or without an extension.
Relative paths are also allowed in the file name.}

\item{output_format}{Character string.
Specifies the format of the file output.
This value is passed to the \code{output_format}
argument of \link[rmarkdown:render]{rmarkdown::render}.
Allowed options are: \code{"html_document"}, \code{"word_document"}, \code{
"odt_document"}, \code{"rtf_document"}, \code{"md_document"}, \code{
"latex_document"}, \code{"pdf_document"}, \code{"pdf_document_simple"},
or their short forms \code{"html"}, \code{"word"}, \code{"odt"}, \code{
"rtf"}, \code{"md"}, \code{"latex"}, \code{"pdf"}, \code{"pdf_simple"}.
Important: The \code{"pdf_document"} format uses \code{xelatex} for
PDF generation.
If your document does not require advanced LaTeX features,
it is recommended to use \code{"pdf_document_simple"}.}

\item{output_open}{Logical. \code{TRUE} if file output should
be opened after creation.}

\item{app_doc}{Logical. \code{TRUE} if app documentation should be
included in the output file.}

\item{app}{Character string or character vector.
Name of the included app(s).
Default is to use all apps.
Cannot be used simultaneously with \code{app_rm}.}

\item{app_rm}{Character string or character vector.
Name of the excluded app(s).
Default is to exclude no apps.
Cannot be used simultaneously with \code{app}.}

\item{doc_info}{Logical. \code{TRUE} if a message with information on all
variables without documentation should also be returned. \code{FALSE} if
this message should be suppressed.}

\item{sort}{Character vector. Vector that specifies the order of
the apps in the codebook.}

\item{settings_replace}{Character string or \code{NULL}.
Specifies how to handle references to settings variables.
Use \code{"global"} to replace references with the global settings variables
defined in \code{settings.py}.
Use \code{"user"} to replace references with the variables
provided in the \code{user_settings} argument.
Use \code{NULL} to leave references to settings variables unchanged.
Caution: This function does not use variables defined
in \code{SESSION_CONFIGS}.
If you vary settings variables in \code{SESSION_CONFIGS},
set \code{settings_replace} to \code{"user"} and manually replace
them using the \code{user_}\code{settings} argument.}

\item{user_settings}{List. List of variables in the \code{settings.py} file
that are used to replace setting variable references.
This is only used if \code{settings_replace = "user"} and should be used when
setting variables are defined within the \code{SESSION_CONFIGS}.}

\item{include_cons}{Logical.
\code{TRUE} if there should be a section for the \code{Constants} variables
in the codebook.}

\item{include_subs}{Logical.
\code{TRUE} if there should be a section for the \code{Subsession} variables
in the codebook.}

\item{preamb}{Deprecated. \code{preamb = TRUE} is no
longer supported. Please remove preambles from your old codebooks.}

\item{encoding}{Character string. Encoding of the created Markdown file.
As in \link[knitr:knit]{knitr::knit}, this argument is
always assumed to be \code{UTF-8}
and ignored.}

\item{title}{Character string. Title of output file.}

\item{subtitle}{Character string. Subtitle of output file.}

\item{params}{List.
List of variable name and value pairs to be passed to the RmD file.
Only relevant if argument output \code{"file"} or \code{"both"} if chosen.}

\item{date}{Character string or \code{NULL}.
Date that is passed to the Rmd file.
Either \code{"today"}, \code{NULL}, or a user defined date.
Only relevant if argument output \code{"file"} or \code{"both"} if chosen.}

\item{splitvarname}{Logical. \code{TRUE} if long variable names should be
split across multiple lines in the output file tables.
If \code{FALSE}, table columns should adjust to fit the longest
variable names.}

\item{sep_list}{Character string. Determines how sub-lists are displayed
in the file output. Use \code{"newline"} to separate sub-lists with
newline characters (\verb{\\\\n}), or \code{"vector"} to display them as
strings in \code{c(...)} format.}

\item{initial}{Logical. \code{TRUE} if initial values should be included
in the output file. \code{FALSE} if they should not be included.}
}
\value{
The function returns two main types of outputs:

(a) a list of variables along with their information

(b) a file containing the codebook for the experiment

If \code{doc_info} is \code{TRUE} it also returns a
message containing the names of
all variables that have no documentation.
}
\description{
Create a codebook of your oTree code by automatically scanning
your project folder and retrieving the information of the apps'
\code{Constants}, \code{Subsession}, \code{Group}
and \code{Player} variables.
}
\details{
This code works only when dictionaries are not used (for
example, in the session configurations in \code{settings.py}).

Caution 1: Multiline comments are ignored, meaning that all variables
commented out in this manner will nevertheless be included in the codebook.
In contrast, variables commented out with line comments will not
appear in the codebook.

Caution 2: If there are commas in the value strings, they might be
used to split the text. Please manually insert a backslash symbol
in front of the commas to avoid that (i.e., escape them).
E.g. \code{"Yes, I will"} -> \code{"Yes\, I will"}.

Caution 3: This code cannot interpret variables that were imported from other
files (for example CSV files) and that have special formatting
included (e.g., special string formatting in Python such
as \code{float(1.4)} to represent a float number).

Caution 4: This code was developed and tested with basic oTree codes
and has not been verified for compatibility with oTree versions
later than 5.4.0.
If you experience issues with newer versions or more complex code structures,
please open an issue on GitHub.

Caution 5: Custom exports and variables from
the \code{Participant} \code{Session} classes
are not part of the codebook. Also built-in variables
are not presented in the codebook.

Further info: \code{None} values are presented
as \code{"None"} (i.e. as a string)
in the list and the file output.
}
\examples{
\dontshow{if (rlang::is_installed("withr")) (if (getRversion() >= "3.4") withAutoprint else force)(\{ # examplesIf}
# The examples use a slightly modified version of the official oTree
# sample codes.

# Make a codebook and resort the apps
combined_codebook <- codebook(
  path = system.file("extdata/ocode_new", package = "gmoTree"),
  output = "list",
  fsource = "init",
  doc_info = FALSE)

# Show the structure of the codebook
str(combined_codebook, 1)
str(combined_codebook$bargaining$Player, 1)

# Make a codebook with only the "bargaining" app
combined_codebook <- codebook(
  path = system.file("extdata/ocode_new", package = "gmoTree"),
  output = "list",
  fsource = "init",
  app = "bargaining",
  doc_info = FALSE)

# Show the structure of the codebook
str(combined_codebook, 1)
str(combined_codebook$bargaining$Player, 1)

# Make a codebook with all but the "bargaining" app
combined_codebook <- codebook(
  path = system.file("extdata/ocode_new", package = "gmoTree"),
  output = "list",
  fsource = "init",
  app_rm = "bargaining",
  doc_info = FALSE)

# Show the structure of the codebook
str(combined_codebook, 1)
str(combined_codebook$bargaining$Player, 1)

# Use oTree code in 3.x format
combined_codebook <- codebook(
  path = system.file("extdata/ocode_z", package = "gmoTree"),
  fsource = "model",
  output = "list",
  doc_info = FALSE)

# Show the structure of the codebook
str(combined_codebook, 1)

# Show information on missing documentation or complex code
combined_codebook <- codebook(
  path = system.file("extdata/ocode_new", package = "gmoTree"),
  fsource = "init",
  output = "list",
  app_rm = "bargaining",
  doc_info = TRUE)

\dontrun{

# Create a codebook PDF with authors' names and todays' date
codebook(
  path = system.file("extdata/ocode_z", package = "gmoTree"),
  fsource = "init",
  doc_info = FALSE,
  output = "file",
  output_format = "pdf_document",
  date = "today",
  title = "My Codebook",
  subtitle = "codebook created with gmoTree",
  params = list(author = c("Max Mustermann", "John Doe"))
  )

# Create a codebook PDF and save it in a subfolder of the
# current folder:
# "C:/Users/username/folder/R_analyses/cb/cb.pdf"
getwd() # "C:/Users/username/folder/R_analyses"
dir.create("cb")
combined_codebook <- gmoTree::codebook(
  path = "C:/Users/username/folder/R_analyses/oTree",
  fsource = "models",
  output = "both",
  output_file = "cb/cb.pdf",
  output_format = "pdf_document")

# You can also omit *.pdf after the file name
combined_codebook <- gmoTree::codebook(
  path = "C:/Users/username/folder/R_analyses/oTree",
  fsource = "models",
  output = "both",
  output_file = "cb/cb",
  output_format = "pdf_document")
}
\dontshow{\}) # examplesIf}
}
