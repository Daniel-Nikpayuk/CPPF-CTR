
elections <- read.csv("HFER_e.csv", stringsAsFactors=FALSE)
elections[,"Election.Date"] <- gsub("/", "-", elections[,"Election.Date"])

#unique(elections[,"Election.Type"])
# Gen B/P

tally <- function(num)
{
	parliament <- elections$Parliament == num
	election_type <- elections[,"Election.Type"] == "Gen"
	rows <- parliament & election_type

	election <- elections[rows,]
	parties <- unique(election$Party)
	tallies <- data.frame(tally=rep(0, length(parties)))
	row.names(tallies) <- parties

	for (seat in 1:nrow(election))
	{
		if (election[seat,"Elected"])
		{
			party <- election[seat,"Party"]
			tallies[party,] <- tallies[party,] + 1
		}
	}

	data.frame(
		Legislature=c(num),
		Election.Date=c(election[[1,"Election.Date"]]),
		Elected.Party=c(row.names(tallies)[tallies == max(tallies)])
	)
}

results1 <- tally(1)
results <- data.frame(Legislature=results1[1], Election.Date=results1[2], Elected.Party=results1[3])

for (par in 2:max(elections$Parliament)) results <- rbind(results, tally(par))

results41 <- data.frame(Legislature=c("41"), Election.Date=c("2011-05-02"), Elected.Party=c("Conservative Party of Canada"))

results <- rbind(results, results41)

write.table(results, "Canadian Federal Election Results.csv", quote=FALSE, sep=",\t", row.names=FALSE, col.names=TRUE)

