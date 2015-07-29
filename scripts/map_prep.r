
# Setting up metadata and their variables:

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

# 13th Parliament has "Government" as the governing party. Is an outlier.

consolidated <- ""

refactor <- function(r)
{
	filename <- paste("Elections/", r, ".csv", sep="")
	if (file.exists(filename))
	{
		csv_data <- read.csv(filename, stringsAsFactors=FALSE)
		csv_data[,"Elected.Party"] <- gsub("\t", "", csv_data[,"Elected.Party"])
		consolidated <- union(consolidated, unique(csv_data[,"Elected.Party"]))
	}
	consolidated
}

for (r in region) consolidated <- refactor(r)

write.table(setdiff(consolidated,""), "parties_map_original.csv", quote=FALSE, sep=",", row.names=FALSE, col.names=FALSE)

