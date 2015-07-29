
# Setting up metadata and their variables:

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

region <- c("Canada", prov_terr)

years <- gsub("\t", "", read.csv("datasets/Canadian Federal and Provincial GDP by Percent.csv", stringsAsFactors=FALSE)$Year)
years <- setdiff(gsub("-[0-9][0-9]", "", years), "1980")

tmp <- read.csv("datasets/parties_map.csv", stringsAsFactors=FALSE)
tmp <- sapply(tmp, function(l) gsub("\t", "", l))
map <- tmp[,2]
names(map) <- tmp[,1]

make_region <- function(r)
{
	nas <- rep(NA, length(years))
	data.frame(Region=rep(r, length(years)), Year=years, Election.Date=nas, Dissolved=nas, Party=nas, row.names=years)
}

project <- function(data, table, col)
{
	rows <- intersect(names(data), row.names(table))
	table[rows,col] <- data[rows]
	table
}

row.project <- function(data, data_col, table, col)
{
	rows <- intersect(row.names(data), row.names(table))
	table[rows,col] <- data[rows,data_col]
	table
}

sway <- function(data, col)
{
	current <- NA
	for (row in row.names(data))
	{
		if (is.na(data[row,col])) data[row,col] <- current
		else current <- data[row,col]
	}
	data
}

shift.filter <- function(data, col, n)
{
	l <- if (n < 0) c(tail(data[,col], n), rep(NA, -n))
		else c(rep(NA, n), head(data[,col], -n))
	names(l) <- row.names(data)
	l
}

refactor <- function(r)
{
	map.read <- function(filename)
	{
		csv_data <- read.csv(filename, stringsAsFactors=FALSE)
		csv_data$Election.Date <- gsub("\t", "", csv_data$Election.Date)
		csv_data$Elected.Party <- gsub("\t", "", csv_data$Elected.Party)
		for (row in row.names(csv_data)) csv_data[row, "Elected.Party"] <- map[csv_data[row, "Elected.Party"]]
		csv_data
	}

	make_dates <- function(data)
	{
		split_data <- strsplit(data, "-")
		dates <- sapply(split_data, function (l) paste(l[2], l[3], sep="-"))
		names(dates) <- sapply(split_data, function (l) l[1])
		dates
	}

	region <- make_region(r)
	filename <- paste("Elections/", r, ".csv", sep="")
	if (file.exists(filename))
	{
		csv_data <- map.read(filename)
		dates <- make_dates(csv_data$Election.Date)
		row.names(csv_data) <- names(dates)

		region <- project(dates, region, "Election.Date")
		region <- row.project(csv_data, "Elected.Party", region, "Party")
		region[1,"Party"] <- csv_data[findInterval(years[1], names(dates)),"Elected.Party"]
		region <- sway(region, "Party")
		region <- project(shift.filter(csv_data, "Elected.Party", 1), region, "Dissolved")
	}
	region
}

consolidated <- refactor("Canada")
for (r in prov_terr) consolidated <- rbind(consolidated, refactor(r))

write.table(consolidated, "Canadian Federal and Provincial Election Results.csv", quote=FALSE, sep=",\t", row.names=FALSE, col.names=TRUE)

