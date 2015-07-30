
# Semiotics:

prov_terr <- c(
"Alberta",
"British_Columbia",
"Manitoba",
"New_Brunswick",
"Newfoundland_and_Labrador",
"Nova_Scotia",
"Ontario",
"Prince_Edward_Island",
"Quebec",
"Saskatchewan",
"Yukon"
)

all_regions <- c("Canada", prov_terr)

# Methods:

## Constructors:

make_financials <- function()
{
	financials <- read.csv("datasets/Canadian Federal and Provincial GDP by Percent.csv", stringsAsFactors=FALSE)
	financials <- sapply(financials, function(l) gsub("\t", "", l))
	row.names(financials) <- gsub("-[0-9][0-9]", "", financials[,"Year"])
	financials <- financials[,all_regions]
	financials
}

make_elections <- function(r)
{
	csv_data <- read.csv("datasets/Canadian Federal and Provincial Election Results.csv", stringsAsFactors=FALSE)
	csv_data <- sapply(csv_data, function(l) gsub("\t", "", l))
	elections <- as.data.frame(matrix(nrow=0, ncol=ncol(csv_data)), stringsAsFactors=FALSE)
	names(elections) <- names(csv_data)
	for (q in r)
	{
		rows <- csv_data[,"Region"] == q
		elections <- rbind(elections, csv_data[rows,])
	}
	elections <- sapply(elections, function(x) if (is.factor(x)) factor(x) else x)
	row.names(elections) <- seq(nrow(elections))
	elections
}

make_table <- function(parties)
{
	zeroes <- rep(0, length(parties))
	table <- data.frame(Party=parties, Years=zeroes, Surplus=zeroes, Deficit=zeroes,
		Mean.BB.GDP.Percent=zeroes, Median.BB.GDP.Percent=zeroes, row.names=parties)
	table
}

make_gdp_list <- function(elections, parties)
{
	gdp_list <- matrix(nrow=nrow(elections), ncol=length(parties))
	rownames(gdp_list) <- row.names(elections)
	colnames(gdp_list) <- parties
	gdp_list
}

## Accessors:

left <- function(date)
{
	time <- strsplit(date, "-")
	month <- as.numeric(time[[1]][[1]])
	day <- as.numeric(time[[1]][[2]])
	30*(month-1)+day
}

right <- function(date) { 365-left(date) }

# Media:

tally <- function(fin, elect, part, table)
{
	tally_assist <- function(table, row, scalar, value)
	{
		table[row,"Years"] <- table[row,"Years"] + scalar
		table[row,"Surplus"] <- table[row,"Surplus"] + scalar*sum(as.numeric(value) > 0)
		table[row,"Deficit"] <- table[row,"Deficit"] + scalar*sum(as.numeric(value) < 0)
		table
	}

	for (row in row.names(elect))
	{
		reg<- elect[row, "Region"]
		year <- elect[row, "Year"]
		date <- elect[row, "Election.Date"]
		party <- elect[row, "Party"]
		gdp <- fin[year,]

		right_scalar <- if (date == "NA") 1
		else
		{
			dissolved <- elect[row, "Dissolved"]
			left_scalar <- left(date)/365
			table <- tally_assist(table, dissolved, left_scalar, gdp[reg])

			right(date)/365
		}

		table <- tally_assist(table, party, right_scalar, gdp[reg])
	}

	table
}

gdp_tally <- function(fin, elect, part, table)
{
	gdp_list <- make_gdp_list(elect, part)

	for (row in row.names(elect))
	{
		reg<- elect[row, "Region"]
		year <- elect[row, "Year"]
		date <- elect[row, "Election.Date"]
		party <- elect[row, "Party"]
		gdp <- fin[year,]

		gdp_list[row,party] <- as.numeric(gdp[reg])
		if (date != "NA") gdp_list[row,elect[row, "Dissolved"]] <- as.numeric(gdp[reg])
	}

	leng <- sum(!is.na(gdp_list))
	simp_list <- matrix(nrow=leng, ncol=length(part))
	colnames(simp_list) <- part
	for (p in part)
	{
		rows <- !is.na(gdp_list[,p])
		simp_list[,p] <- c(gdp_list[rows,p], rep(NA, leng-sum(rows)))
	}
	simp_list
}

stat_helper <- function(stat, gdpl, name)
{
	rows <- !is.na(gdpl[,name])
	stat(gdpl[rows,name])
}

round_assist <- function(table)
{
	table[,"Years"] <- round(table[,"Years"], 2)
	table[,"Surplus"] <- round(table[,"Surplus"], 2)
	table[,"Deficit"] <- round(table[,"Deficit"], 2)
	table[,"Mean.BB.GDP.Percent"] <- round(table[,"Mean.BB.GDP.Percent"], 2)
	table[,"Median.BB.GDP.Percent"] <- round(table[,"Median.BB.GDP.Percent"], 2)
	table
}

analyze <- function(r)
{
	financials <- make_financials()
	elections <- make_elections(r)
	parties <- unique(elections[,"Party"])
	summary <- make_table(parties)

	summary <- tally(financials, elections, parties, summary)
	gdp_list <- gdp_tally(financials, elections, parties, summary)

	summary[,"Mean.BB.GDP.Percent"] <- sapply(colnames(gdp_list), function(col) stat_helper(mean, gdp_list, col))
	summary[,"Median.BB.GDP.Percent"] <- sapply(colnames(gdp_list), function(col) stat_helper(median, gdp_list, col))
	round_assist(summary)
}

firstYears <- function(party, n, r)
{
	financials <- make_financials()
	elections <- make_elections(r)
	parties <- unique(elections[,"Party"])
	summary <- make_table(parties)

	gdp_list <- matrix(nrow=0, ncol=length(parties))
	colnames(gdp_list) <- parties

	years <- unique(elections[,"Year"])
	for (year in years)
	{
		rows <- elections[,"Year"] == year
		elections_rows <- elections[rows,]
		row.names(elections_rows) <- seq(nrow(elections_rows))

		summary <- tally(financials, elections_rows, parties, summary)
		gdp_list <- rbind(gdp_list, gdp_tally(financials, elections_rows, parties, summary))

		if (as.numeric(summary[party, "Years"]) >= as.numeric(n)) break
	}

	summary[,"Mean.BB.GDP.Percent"] <- sapply(colnames(gdp_list), function(col) stat_helper(mean, gdp_list, col))
	summary[,"Median.BB.GDP.Percent"] <- sapply(colnames(gdp_list), function(col) stat_helper(median, gdp_list, col))

	round_assist(summary[party,])
}

analyze_firstYears <- function(r)
{
	summary <- analyze(r)
	print(firstYears("Conservative", summary["NDP","Years"], r))
	firstYears("Liberal", summary["NDP","Years"], r)
}

write.table(analyze(prov_terr),
	"Canadian Federal and Provincial Comparative Analysis (prov).csv",
		quote=FALSE, sep=",\t", row.names=FALSE, col.names=TRUE)

write.table(analyze("Canada"),
	"Canadian Federal and Provincial Comparative Analysis (fed).csv",
		quote=FALSE, sep=",\t", row.names=FALSE, col.names=TRUE)

write.table(analyze(all_regions),
	"Canadian Federal and Provincial Comparative Analysis (all).csv",
		quote=FALSE, sep=",\t", row.names=FALSE, col.names=TRUE)

analyze_firstYears(prov_terr)
analyze_firstYears(all_regions)

