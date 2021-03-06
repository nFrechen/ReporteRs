% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/Section.R
\name{addSection}
\alias{addSection}
\alias{addSection.docx}
\title{Add a section into a document object}
\usage{
addSection(doc, ...)

\method{addSection}{docx}(doc, landscape = FALSE, ncol = 1,
  space_between = 0.3, columns.only = FALSE, ...)
}
\arguments{
\item{doc}{document object}

\item{...}{further arguments passed to other methods}

\item{landscape}{logical value. Specify TRUE to get a section with horizontal page.}

\item{ncol}{\code{integer} number to specify how many columns the section should contains.}

\item{space_between}{width in inches of the space between columns of the section.}

\item{columns.only}{logical value, if set to TRUE, no break page will (continuous section).}
}
\value{
a document object
}
\description{
Add a section into a document object
}
\details{
\code{addSection} only works with docx documents.

It lets you change document orientation and split new
content along 2 or more columns.
The function requires you to add a section before and after
the item(s) that  you want to be on a landscape and/or
multicolumns mode page.
}
\examples{
\donttest{
doc.filename = "addSection.docx"
doc <- docx()
doc = addSection(doc, landscape = TRUE, ncol = 2 )
doc = addPlot( doc = doc, fun = function() {
		barplot( 1:8, col = 1:8 )
	}, width = 3, height = 3, pointsize = 5)

doc = addColumnBreak(doc )
doc = addFlexTable(doc, FlexTable( iris[1:10,] ) )

doc = addSection(doc, ncol = 2 )
doc = addParagraph( doc = doc, "Text 1.", "Normal" )
doc = addColumnBreak(doc )
doc = addParagraph( doc = doc, "Text 2.", "Normal" )


doc = addSection(doc, ncol = 2, columns.only = TRUE )
doc = addFlexTable(doc, FlexTable(iris[1:10,] ) )
doc = addColumnBreak(doc )
doc = addParagraph( doc = doc, "Text 3.", "Normal" )


doc = addSection( doc )
doc = addFlexTable(doc, FlexTable(mtcars, add.rownames = TRUE) )
doc = addParagraph( doc = doc, "Text 4.", "Normal" )
writeDoc(doc, doc.filename)
}
}
\seealso{
\code{\link{docx}}
}
