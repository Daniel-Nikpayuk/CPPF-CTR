
# Setting up metadata and their variables:

#[1] "Canada"                                 
#[2] "Newfoundland and Labrador"              
#[3] "Prince Edward Island"                   
#[4] "Nova Scotia"                            
#[5] "New Brunswick"                          
#[6] "Quebec"                                 
#[7] "Ontario"                                
#[8] "Manitoba"                               
#[9] "Saskatchewan"                           
#[10] "Alberta"                                
#[11] "British Columbia"                       
#[12] "Yukon"                                  
#[13] "Northwest Territories including Nunavut"
#[14] "Northwest Territories"                  
#[15] "Nunavut"                                
#[16] "Outside Canada"                         

region <- c(
"Canada",
"Alberta",
"British_Columbia",
"Manitoba",
"New_Brunswick",
"Newfoundland_and_Labrador",
"Northwest_Territories",
"Nova_Scotia",
"Nunavut",
"Ontario",
"Prince_Edward_Island",
"Quebec",
"Saskatchewan",
"Yukon"
)

default <- "Alberta"

fiscal_years <- read.csv(paste("FiscalTables/", default, ".csv", sep=""), stringsAsFactors=FALSE)$Year
years <- union(read.csv(paste("Wayback/", default, ".csv", sep=""), stringsAsFactors=FALSE)$Year, fiscal_years)
wayback_years <- setdiff(years, fiscal_years)

consolidated <- as.data.frame(matrix(data=NA, nrow=length(years), ncol=length(region)+1), row.names=years)
names(consolidated) <- c("Year", region)
consolidated$Year <- years

default <- "CANSIM/03840038-eng.csv"
cansim <- read.csv(default, stringsAsFactors=FALSE)
row.names(cansim) <- cansim$Year

# Pull deficit/surplus

deficit_or_surplus <- function(dir, r, years_type, header)
{
	filename <- paste(dir, "/", r, ".csv", sep="")
	if (file.exists(filename))
	{
		csv_data <- read.csv(filename, stringsAsFactors=FALSE)
		row.names(csv_data) <- csv_data$Year
		consolidated[years_type, r] <- csv_data[years_type, header]
	}
	consolidated
}

# Pull GDP

GDP <- function(r)
{
	r_account <- cansim[cansim$GEO == gsub("_", " ", r),]

	current_prices_rows <- r_account$PRI == "Current prices"
	gdp_rows_est <- r_account$EST == "Gross domestic product at market prices (x 1,000,000)"
	gdp_rows <- current_prices_rows & gdp_rows_est
	sd_rows_est <- r_account$EST == "Statistical discrepancy (x 1,000,000)"
	sd_rows <- current_prices_rows & sd_rows_est

	gdp_account <- r_account[gdp_rows, c("Ref_Date", "Value")]
	helper <- function(year)
	{
		l <- as.numeric(substr(year, 3, 3))
		r <- (as.numeric(substr(year, 4, 4)) + 1) %% 10
		if (r == 0) l <- (l + 1) %% 10
		year <- paste(year, "-", l, r, sep="")
	}
	row.names(gdp_account) <- sapply(gdp_account$Ref_Date, helper)
		# Statistical Discrepancy = GDP (expenditure) - GDI (income)
		# GDP data for both expenditure and income archives (csv) seems to be adjusted already,
		# so no need to adjust for statistical discrepency here.
#		gdp_account[,"Value"] <- as.numeric(gdp_account[,"Value"]) + as.numeric(r_account[sd_rows,"Value"])
	consolidated[,r] <- 100 * consolidated[,r] / as.numeric(gdp_account[years,"Value"])
	consolidated
}

# Consolidate Federal

	# order matters to save on removing "1990-91" from fiscal_years
consolidated <- deficit_or_surplus("FiscalTables", "Canada", fiscal_years, "Actual")
consolidated <- deficit_or_surplus("Wayback", "Canada", c(wayback_years, "1990-91"), "Budgetary.surplus.or.deficit")
consolidated <- GDP("Canada")

# Consolidate all

for (r in setdiff(region, c("Canada")))
{
	consolidated <- deficit_or_surplus("Wayback", r, wayback_years, "Deficit.or.surplus")
	consolidated <- deficit_or_surplus("FiscalTables", r, fiscal_years, "Deficit.or.surplus")
	consolidated <- GDP(r)
}

write.table(consolidated, "Canadian Federal and Provincial GDP by Percent.csv", quote=FALSE, sep=",\t", row.names=FALSE, col.names=TRUE)

warnings()

