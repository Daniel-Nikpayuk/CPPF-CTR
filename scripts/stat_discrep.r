
income_file <- "CANSIM/03840037-eng.csv"
expend_file <- "CANSIM/03840038-eng.csv"
income <- read.csv(income_file, stringsAsFactors=FALSE)
row.names(income) <- income$Year
expend <- read.csv(expend_file, stringsAsFactors=FALSE)
row.names(expend) <- expend$Year

pull_income <- function(r)
{
	r_account <- income[income$GEO == gsub("_", " ", r),]

	gdp_rows <- r_account$EST == "Gross domestic product at market prices (x 1,000,000)"
	sd_rows <- r_account$EST == "Statistical discrepancy (x 1,000,000)"

	data.frame(r_account[gdp_rows,"Value"], r_account[sd_rows,"Value"])
}

pull_expend <- function(r)
{
	r_account <- expend[expend$GEO == gsub("_", " ", r),]

	current_prices_rows <- r_account$PRI == "Current prices"
	gdp_rows_est <- r_account$EST == "Gross domestic product at market prices (x 1,000,000)"
	gdp_rows <- current_prices_rows & gdp_rows_est
	sd_rows_est <- r_account$EST == "Statistical discrepancy (x 1,000,000)"
	sd_rows <- current_prices_rows & sd_rows_est

	data.frame(r_account[gdp_rows,"Value"], r_account[sd_rows,"Value"])
}

income_account <- pull_income("Alberta")
expend_account <- pull_expend("Alberta")

data.frame(income_account, expend_account)

