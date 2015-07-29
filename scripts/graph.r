
prov <- read.csv("datasets/Canadian Federal and Provincial Comparative Analysis (prov).csv", colClasses="character")
fed <- read.csv("datasets/Canadian Federal and Provincial Comparative Analysis (fed).csv", colClasses="character")
all <- read.csv("datasets/Canadian Federal and Provincial Comparative Analysis (all).csv", colClasses="character")

w <- 768
h <- 384

make_surplus <- function(data, parties, filename, main_str, colors)
{
	z <- data[,c("Party","Surplus")]
	z$Surplus <- 100*as.numeric(z$Surplus)/as.numeric(data[,"Years"])
	row.names(z) <- z$Party
	z <- z[parties,]

	jpeg(paste("surplus (", filename, ").jpg", sep=""), width=w, height=h)

	par(mai=c(1,1.5,2.5,1))
	barplot(z$Surplus, main=main_str, col=colors,
		ylim=, axes=FALSE, names.arg=z$Party, cex.main=2.5, cex.names=2)

	n <- 10*floor(max(z$Surplus)/10)
	labs <- seq(0, n, by=10)
	axis(side=2, at=labs, labels=paste(labs, "%", sep=""), las=1, cex.axis=1.7)

	dev.off()
}

make_deficit <- function(data, parties, filename, main_str, colors, inc)
{
	z <- data[,c("Party","Mean.BB.GDP.Percent")]
	row.names(z) <- z$Party
	z <- z[parties,]
	z[,"Mean.BB.GDP.Percent"] <- -as.numeric(z[,"Mean.BB.GDP.Percent"])

	jpeg(paste("deficit (", filename, ").jpg", sep=""), width=w, height=h)

	par(mai=c(1,1.5,2.5,1))
	barplot(z$Mean.BB.GDP.Percent, main=main_str, col=colors,
		ylim=, axes=FALSE, names.arg=z$Party, cex.main=2.5, cex.names=2)

	n <- inc*floor(max(z$Mean.BB.GDP.Percent)/inc)
	labs <- seq(0, n, by=inc)
	axis(side=2, at=labs, labels=paste(labs, "%", sep=""), las=1, cex.axis=1.7)

	dev.off()
}

main_str="Years of fiscal surplus\nas percentage of parliamentary duration;\nprovincial/territorial governments\n1981-2013"
make_surplus(prov, c("NDP", "Conservative","Liberal"), "prov", main_str, c("orange", "blue", "red"))

main_str="Years of fiscal surplus\nas percentage of parliamentary duration;\nfederal governments\n1981-2013"
make_surplus(fed, c("Liberal", "Conservative"), "fed", main_str, c("red", "blue"))

main_str="Years of fiscal surplus\nas percentage of parliamentary duration;\nfederal, provincial/territorial governments\n1981-2013"
make_surplus(all, c("NDP", "Conservative","Liberal"), "all", main_str, c("orange", "blue", "red"))

main_str="Average deficit as percentage of GDP;\nprovincial/territorial governments\n1981-2013"
make_deficit(prov, c("NDP", "Conservative","Liberal"), "prov", main_str, c("orange", "blue", "red"), 0.25)

main_str="Average deficit as percentage of GDP;\nfederal governments\n1981-2013"
make_deficit(fed, c("Liberal", "Conservative"), "fed", main_str, c("red", "blue"), 0.5)

main_str="Average deficit as percentage of GDP;\nfederal, provincial/territorial governments\n1981-2013"
make_deficit(all, c("NDP", "Conservative","Liberal"), "all", main_str, c("orange", "blue", "red"), 0.25)

