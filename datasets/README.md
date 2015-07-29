The Data
========

This page is a little less formal, and I'll run through it quickly:

Toby cites sources in his article, but his links are out of date. Regardless, as I'm not a professional
economist or statistician and lack the experience of digging and diving the net for datasets, his links were a
good place to start.

If you think about it, there are 3 main types of info: *elections*, *budget balances*, and *GDP*.

## Election Data:

Election data is found at the Elections Canada website, as well as the websites for each province / territory.
Given the political nature of keeping the election branch separate from the executive branch, there is no
centralization of power, and each provincial elections branch as well as the federal branch are entirely independent
of each other.

This was actually the most difficult part of getting the data. I soon found out that there isn't much in the way
of standard formats regarding elections data across the various branches. What's more, very few had their data
in accessible formats like csv. Mostly it was pdf image scans. Most did have summaries of seats won at least,
but I was especially annoyed with Manitoba where for a few of the earlier election years I actually had to tally
the seats by hand.

I'd provide links, but there are far too many that it's not worth it. I have kept record of the documents I downloaded
and used, and have archived them here (426MB):

+ https://onedrive.live.com/redir?resid=46D8BFF0C86B7646!322&authkey=!ALyL1nEtb4EzQSw&ithint=file%2czip

As hinted in the parenthesis above, it is 426MB in size. The reason it's so large is as I noted earlier, it was mostly
image scans as pdfs, which tend to be large in size by default. Couldn't be helped. If you do bother to download and
look at this archive, my general format was to separate each provincial / territorial / federal region into its own folder.
In each such folder, is another folder called "archives"; in each of these archives is the raw data, but for the
purpose of not having to open and close many different pdfs when doing data entry, I collected the pages of interest
into a synthesized pdf and put it in the main subfolder.

My general approach was to keep the necessary records for the *election day* dates; the registered *party names*;
the parliament in session; and finally the summary of election results, notably seats won for a given election.

It's true Wikipedia has nicely summarized results, but Wikipedia isn't necessarily reliable. More importantly
it's worth having actual datasets for possible future use. Thus it was worth recreating these, though it was more
effort than I would have liked.

Regarding data entry, I have a personal philosophy where I prescribe to the notion that it is best to enter the
data in a format that requires the least amount of repetition or redundancy. If you look at the raw elections
results within the *Elections* folder, you will see the following csv files:

+ [Alberta.csv](Elections/Alberta.csv)
+ [British\_Columbia.csv](Elections/British\_Columbia.csv)
+ [Canada.csv](Elections/Canada.csv)
+ [Manitoba.csv](Elections/Manitoba.csv)
+ [New\_Brunswick.csv](Elections/New\_Brunswick.csv)
+ [Newfoundland\_and\_Labrador.csv](Elections/Newfoundland\_and\_Labrador.csv)
+ [Nova\_Scotia.csv](Elections/Nova\_Scotia.csv)
+ [Ontario.csv](Elections/Ontario.csv)
+ [Prince\_Edward\_Island.csv](Elections/Prince\_Edward\_Island.csv)
+ [Quebec.csv](Elections/Quebec.csv)
+ [Saskatchewan.csv](Elections/Saskatchewan.csv)
+ [Yukon.csv](Elections/Yukon.csv)

If you look at the contents, you will see what I mean about minimalization. I hold to this policy as an
error reduction strategy. One can always write code to translate these individual csv files into one big
consolidated file. Code writing itself might produce errors, but I still believe it's more reliable than human error.

The exception to the rule was the federal results. Elections Canada was kind enough to provide the information in a csv file,
but I still had to tally the seats for each election. Not hard to do with a script though.

Regardless, I did in fact consolidate these separate csv files into a single large one:

+ [Canadian Federal and Provincial Election Results.csv](Canadian Federal and Provincial Election Results.csv)

## Budget Balances:

Toby's link to the Fiscal tables data was incomplete. When looking at the 2014 data:

+ http://www.fin.gc.ca/frt-trf/2014/frt-trf-14-eng.asp

you'll notice you only have years going back to the early '90s. I looked at the RBC data,
or a modern version he linked to, but wasn't satisfied with their pre-rounded results, not to mention
their copyright notice. Toby Sanger is a professional economist, and so a bank is less interested in interpreting
"fair use" with his work, but I'm a nobody, and when you're vulnerable it's best to be in the legal clear.

Originally I actually used the Internet Archive's *Wayback Machine*, in which I found a 1999 fiscal data pdf
with results going back to the early '80s, but I recently took a quick look back at the official govenrment site
and it turns out the pdf archive is still accessible there as well:

+ http://www.fin.gc.ca/toc/1999/frt_-eng.asp

In anycase, if you're wondering why one of the folders here is named "Wayback" this is why. I pulled the
pdf data with an OCR (Google's open source "tesseract"), and manually checked for errors, resulting in the
following datasets:

+ [Alberta.csv](Wayback/Alberta.csv)
+ [British\_Columbia.csv](Wayback/British\_Columbia.csv)
+ [Canada.csv](Wayback/Canada.csv)
+ [Manitoba.csv](Wayback/Manitoba.csv)
+ [New\_Brunswick.csv](Wayback/New\_Brunswick.csv)
+ [Newfoundland\_and\_Labrador.csv](Wayback/Newfoundland\_and\_Labrador.csv)
+ [Northwest\_Territories.csv](Wayback/Northwest\_Territories.csv)
+ [Nova\_Scotia.csv](Wayback/Nova\_Scotia.csv)
+ [Ontario.csv](Wayback/Ontario.csv)
+ [Prince\_Edward\_Island.csv](Wayback/Prince\_Edward\_Island.csv)
+ [Quebec.csv](Wayback/Quebec.csv)
+ [Saskatchewan.csv](Wayback/Saskatchewan.csv)
+ [Yukon.csv](Wayback/Yukon.csv)

If you'd like to look at the documentation used to create these datasets, I've archived it here (584KB):

+ https://onedrive.live.com/redir?resid=46D8BFF0C86B7646!323&authkey=!AOwgxzPCGHlkNMw&ithint=file%2czip

There is also of course the datasets for the 2014 report within the "FiscalTables" folder:

+ [Alberta.csv](FiscalTables/Alberta.csv)
+ [British\_Columbia.csv](FiscalTables/British\_Columbia.csv)
+ [Canada.csv](FiscalTables/Canada.csv)
+ [Manitoba.csv](FiscalTables/Manitoba.csv)
+ [New\_Brunswick.csv](FiscalTables/New\_Brunswick.csv)
+ [Newfoundland\_and\_Labrador.csv](FiscalTables/Newfoundland\_and\_Labrador.csv)
+ [Northwest\_Territories.csv](FiscalTables/Northwest\_Territories.csv)
+ [Nova\_Scotia.csv](FiscalTables/Nova\_Scotia.csv)
+ [Nunavut.csv](FiscalTables/Nunavut.csv)
+ [Ontario.csv](FiscalTables/Ontario.csv)
+ [Prince\_Edward\_Island.csv](FiscalTables/Prince\_Edward\_Island.csv)
+ [Quebec.csv](FiscalTables/Quebec.csv)
+ [Saskatchewan.csv](FiscalTables/Saskatchewan.csv)
+ [Yukon.csv](FiscalTables/Yukon.csv)

If you'd like to look at the documentation used to create these datasets, I've archived it here (2.97MB):

+ https://onedrive.live.com/redir?resid=46D8BFF0C86B7646!324&authkey=!AF4NaZwhlZ3OG-w&ithint=file%2czip

Be warned, I give little to no explanation within the archives themselves. Feel free to contact me to make
sense of it, but I don't guarantee that I'll have time for a proper answer, which is to say I'll help if
I can, but generally you're on your own. I say this
casually even though I champion *transparency* for the simple reason that you don't necessarily need
know the process used in creating these datasets in order to validate their accuracy.

Regardless, as with the elections raw data, I have used this raw data to produce a consolidated version:

+ [Canadian Federal and Provincial GDP by Percent.csv](Canadian Federal and Provincial GDP by Percent.csv)

I'm happy to announce, though incomplete, it compares with what RBC has done,
which is reassuring for a non-professional like myself.

## GDP:

Toby's GDP dataset link was dead, but it's easy to find the data at CANSIM:

http://www5.statcan.gc.ca/cansim/a26?lang=eng&retrLang=eng&id=3840038&tabMode=dataTable&srchLan=-1&p1=-1&p2=9

If ever this link is broken, the dataset name is:

+ Gross domestic product, expenditure-based, provincial and territorial, annual (Dollars),  1981 to 2013

and they store it as the file:

+ 03840038-eng.zip

## Other:

The remaining datasets listed here are either used in the main analysis (metadata; overhead), or are derivations
of it:

+ [parties\_map.csv](parties\_map.csv)
+ [Canadian Federal and Provincial Comparative Analysis (prov).csv](Canadian Federal and Provincial Comparative Analysis \(prov\).csv)
+ [Canadian Federal and Provincial Comparative Analysis (fed).csv](Canadian Federal and Provincial Comparative Analysis \(fed\).csv)
+ [Canadian Federal and Provincial Comparative Analysis (all).csv](Canadian Federal and Provincial Comparative Analysis \(all\).csv)

