The Method
==========

This page is a little less formal, and I'll run through it quickly.

Each script here is part of the R programming language. If you're not familiar
with it, it is popular amongst statisticians. Its strengths as a language is
its very *functional* similar to the *lisp* dialects, and otherwise it is most
efficient and provides great support when using the *vectorization paradigm*.

It is not my intention to give an in-depth explanation of my code, but I will
give an overview of each script.

+ tally.r

was used to tally the seats for the general federal election.
It was used to create the "Canada.csv" dataset within the "Elections" folder.

+ consolidate\_election\_data.r

was used to create the "Canadian Federal and Provincial Election Results.csv" dataset.

+ consolidate\_fiscal\_data.r

was used to create the "Canadian Federal and Provincial GDP by Percent.csv" dataset.
As I'm not experienced in working with CANSIM (Statistics Canada) datasets, when I
was pulling the GDP data, I needed to verify the statistical discrepancy (between
GDP calculated by income opposed to GDP calculated by expenditure; economic stuff).
The script:

+ stat\_discrep.r

was used to check my assumptions. Turns out CANSIM stores the average GDP, and provides
the statistical discrepancy for those interested. I pulled the expenditure based GDP
statscan records, and needed to be sure if I was working with the GDP that had been
adjusted or not.

+ map\_prep.r

was used to pull the political parties from all provinces / territories / federal.
I then manually mapped those parties to the basic three: NDP, Liberal, Conservative.
Any party which didn't match I left as is, as it made no difference anyway.  The resulting map:

+ parties\_map.csv

was used in the finally analysis:

+ analysis.r

which was used to produce the following datasets:

+ Canadian Federal and Provincial Comparative Analysis (prov).csv
+ Canadian Federal and Provincial Comparative Analysis (fed).csv
+ Canadian Federal and Provincial Comparative Analysis (all).csv

which themselves provide summary results used in the main analysis.

+ graph.r

was used to produce images of the main analysis.

### Methodology:

If you're wondering why my analysis allowed for fractional years regarding "deficits"
and "surpluses", it's because my code, as part of normalization, took election years
and split them. So if "Social Credit" (BC) was dissolved in 1991 with "NDP" as its successor,
then I took the election date (October 17th) and divided the year. So Social Credit got
10 months and 17 days, and NDP got the remainder.

It is my opinion this provides better accuracy regarding tallies such as years in power,
but actually it's problematic in terms of taking averages of Budget Balance / GDP.
In that case, instead of taking fractional years as that would skew the final results greatly,
I allowed both parties to share those results. Most elections are about 4 years apart,
so this particular strategy doesn't skew the averages significantly. The bottom line is,
how best to divvy up the successes and failures of a split year?

