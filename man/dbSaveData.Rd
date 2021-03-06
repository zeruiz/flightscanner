% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/database.R
\name{dbSaveData}
\alias{dbSaveData}
\alias{dbSaveData.list}
\alias{dbSaveData.response}
\title{Save data to SQLite database.}
\usage{
dbSaveData(x, conn, ...)

\method{dbSaveData}{list}(x, conn, ...)

\method{dbSaveData}{response}(x, conn, ...)
}
\arguments{
\item{x}{An object of data to be saved.}

\item{conn}{A \code{\link[RSQLite:SQLiteConnection-class]{SQLiteConnection}} object, as returned
by \code{\link[DBI:dbConnect]{dbConnect()}}.}

\item{...}{Further arguments passed to methods.}
}
\description{
Save data to the corresponding tables in the SQLite database. Tables includes:
price, itinerary, leg, segment, carrier, agent, and place.
}
\section{Methods (by class)}{
\itemize{
\item \code{list}: Save a list of data.frames in databse.

\item \code{response}: Save data from the request response in databse.
}}

\examples{
\dontrun{
# Get data from API
apiSetKey("YOUR_API_KEY")
resp <- apiCreateSession(origin = "SFO", destination = "LHR", startDate = "2019-07-01")
resp <- apiPollSession(resp)
data <- flightGet(resp)

# Connect to SQLite database
con <- dbCreateDB(dbname = ":memory:")
dbSaveData(resp, con)  # from response
dbSaveData(data, con)  # from list
dbDisconnect(con)
}
}
