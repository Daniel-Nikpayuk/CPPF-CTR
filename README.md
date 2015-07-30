Canadian Political Party Financials - Comparative Transparency Report
=====================================================================

An independent analysis of the comparative fiscal success of elected political parties within Canada, between 1981 and 2013.

## Introduction:

As the Canadian federal election looms near, it's time to take a closer look at the politics of it all.

The Conservative "Harper" government has been known for its smear campaigns, notably against Liberal leader
[Trudeau](http://www.thestar.com/opinion/commentary/2015/07/18/why-harper-attacks-trudeau-but-not-mulcair-hepburn.html),
but also against the NDP's
[Mulcair](http://news.nationalpost.com/news/canada/tories-release-first-attack-ad-against-ndp-leader-thomas-mulcair).
Political policy as well as *election claims and tactics* within in a stable and healthy government need to backed up with evidence
plain and simple.  The first line of such evidence is economic and fiscal data.

The inspiration of this analysis is somewhat a reaction to Harper's *anti-science*, *anti-evidence* ideology, with the intent
here to look at the recent history of fiscal **budget balances** and to compare how these parties have actually done in the past. 
The focus on economic record is also part of this reaction as Harper especially likes to proclaim his party is the only
responsible economic actor in government---which it is not.

It will be shown that in fact the **NDP** has the best record.

This analysis is an extension of the article:
["Fiscal Record of Canadian Political Parties"](http://www.progressive-economics.ca/2011/04/29/fiscal-record-of-canadian-political-parties/)
by economist Toby Sanger.

To be clear, it is not a direct *derivation* as I did not have access to his datasets or methods, but it does attempt to reproduce
his results. The necessary datasets have been reproduced and validated, with some slight variations on method---resulting in a small
change of the numbers, but not the resulting relationships.

## Motivation:

So here's the question: If such an analysis already exists, why do we need this one?

1. **Currency**: It's been updated for the most recently available fiscal years. Toby Sanger's article is four years old,
	with data going only up to 2010.
2. **Transparency**: I am posting my datasets as well as my methods here for anyone to critically deconstruct and debug.
3. **Bonus**: I include a few results Toby's analysis did not.

### Full disclosure:

Aaron Paquette, the NDP Candidate for Edmonton Manning in the upcoming 2015 Federal election recommended this project.
Out of respect for him and his leadership, I have volunteered.

With that said, although my bias is in support of the NDP this election---and I certainly support Aaron's
individual leadership regardless---I am a complexity theorist at heart. I don't support a single recursive political
ideology as universal (within a complex system), rather I support the evidence; and I support evidence based politics.

For me, the bottom line is the NDP has a good track record, as the below analysis will demonstrate.

# The Analysis:

My analysis confirms Toby Sanger's: that the NDP with their time in office have proven to be the most responsible economic
managers out of the three.  As with his analysis, I have compared the party fiscals in three varieties:

1. The provincial and territorial budgets;
2. The federal budget alone;
3. A combination of provinces, territories, and federal Canada.

There are two exceptions to the provincial / territorial data: Northwest Territories as well as Nunavut have been excluded
from these comparisons as neither run government by a party system, but rather by *consensus*.  That still leaves 10 provinces,
and 1 territory (Yukon), as well as 1 federal budget between the years of 1981-2013. That's 33 years in a single time frame,
but as there are 12 regions, that adds up to 396 years (12\*33=396) of data to work with.

### Provincial / Territorial:

![from: Canadian Federal and Provincial Comparative Analysis (prov).csv](images/surplus \(prov\).jpg)

The NDP have about 72 years of provincial experience, and about 31 of those years they ran surpluses.
Conservatives on the other hand have about 148 years of experience provincially, and have about 54 years of surpluses.
Provincial Liberals have 100 years in, and have the least number of surpluses: 19.

The above graph shows this same data in terms of percentages, for example NDP = 31 / 72 ~ 43 %.

![from: Canadian Federal and Provincial Comparative Analysis (prov).csv](images/deficit \(prov\).jpg)

As Toby Sanger has pointed out, looking only at the number of surpluses and deficits is an incomplete picture.
You have to look at how big or small such surpluses and deficits have been over the years. Given subtleties
such as *inflation* skew the absolute numbers, in order to make them comparable we divide any year's budget balance
by the GDP of that year.

Taking the average of this quantity over the provinces, shows in fact the average budget balance for all three parties
has been a state of deficit, but out of the three, again the NDP has the lowest such average deficit at about 0.46%.
The Conservatives come in much higher at 0.81%, and the Liberals again trailing behind at about 1.13% the relative
provincial productive abilities. The above graph demonstrates these realities.

If you're more interested in hard numbers, here's the same data for the above two graphs in table form:

<table>
 <tr>
  <td>Party</td>
  <td>Years</td>
  <td>Surplus</td>
  <td>Deficit</td>
  <td>Avg. Budget Balance / GDP (%)</td>
 </tr>
 <tr>
  <td>Conservative</td>
  <td>148.04</td>
  <td>54.07</td>
  <td>93.96</td>
  <td>-0.81</td>
 </tr>
 <tr>
  <td>Social Credit</td>
  <td>10.79</td>
  <td>2</td>
  <td>8.79</td>
  <td>-1.13</td>
 </tr>
 <tr>
  <td>NDP</td>
  <td>71.7</td>
  <td>30.77</td>
  <td>40.93</td>
  <td>-0.46</td>
 </tr>
 <tr>
  <td>Liberal</td>
  <td>100.32</td>
  <td>19</td>
  <td>80.32</td>
  <td>-1.13</td>
 </tr>
 <tr>
  <td>Québec</td>
  <td>14.84</td>
  <td>3</td>
  <td>11.84</td>
  <td>-1.47</td>
 </tr>
 <tr>
  <td>Saskatchewan</td>
  <td>6.16</td>
  <td>5.16</td>
  <td>1</td>
  <td>0.82</td>
 </tr>
 <tr>
  <td>Yukon</td>
  <td>11.17</td>
  <td>9</td>
  <td>2.17</td>
  <td>1.33</td>
 </tr>
</table>

You'll notice other parties are included in these table results, but as they do not have nearly the depth of
years experience I have excluded them from the main analysis.

### Federal:

The same style of analysis as above is done here, but for the federal parties only:

I decline to give an explanation of this data as I trust you can read over it yourself, but otherwise the federal Liberals
have in there time done much better fiscally both with a greater number of relative surpluses, as well as a smaller balance ratio.

![from: Canadian Federal and Provincial Comparative Analysis (fed).csv](images/surplus \(fed\).jpg)

![from: Canadian Federal and Provincial Comparative Analysis (fed).csv](images/deficit \(fed\).jpg)

<table>
 <tr>
  <td>Party</td>
  <td>Years</td>
  <td>Surplus</td>
  <td>Deficit</td>
  <td>Avg. Budget Balance / GDP (%)</td>
 </tr>
 <tr>
  <td>Liberal</td>
  <td>15.92</td>
  <td>9.06</td>
  <td>6.86</td>
  <td>-1.91</td>
 </tr>
 <tr>
  <td>Conservative</td>
  <td>17.08</td>
  <td>1.94</td>
  <td>15.14</td>
  <td>-3.45</td>
 </tr>
</table>

### Provincial / Territorial / Federal:

Lastly, I've included the federal data mixed in with the provincial / territorial results to parallel Toby
Sanger's analysis. I am in agreeance that such mixed results in theory don't negatively skew the provincial data.
In *information theory* terms, it's because the federal government has higher strategic entropy when it comes
to economics.
In plain terms: Although they do have other considerations when forming their budgets, the federal governments also
have far greater ability to design their own outcome---they have less legislative constraints when planning how to
balance their budget. It's easier for them to shift things around to balance their books, as they have more tools
accessible to them.

Regardless, even with this consideration, the data reveals the same overall relationships:

![from: Canadian Federal and Provincial Comparative Analysis (all).csv](images/surplus \(all\).jpg)

![from: Canadian Federal and Provincial Comparative Analysis (all).csv](images/deficit \(all\).jpg)

<table>
 <tr>
  <td>Party</td>
  <td>Years</td>
  <td>Surplus</td>
  <td>Deficit</td>
  <td>Avg. Budget Balance / GDP (%)</td>
 </tr>
 <tr>
  <td>Liberal</td>
  <td>116.24</td>
  <td>28.06</td>
  <td>87.18</td>
  <td>-1.24</td>
 </tr>
 <tr>
  <td>Conservative</td>
  <td>165.11</td>
  <td>56.01</td>
  <td>109.1</td>
  <td>-1.08</td>
 </tr>
 <tr>
  <td>Social Credit</td>
  <td>10.79</td>
  <td>2</td>
  <td>8.79</td>
  <td>-1.13</td>
 </tr>
 <tr>
  <td>NDP</td>
  <td>71.7</td>
  <td>30.77</td>
  <td>40.93</td>
  <td>-0.46</td>
 </tr>
 <tr>
  <td>Québec</td>
  <td>14.84</td>
  <td>3</td>
  <td>11.84</td>
  <td>-1.47</td>
 </tr>
 <tr>
  <td>Saskatchewan</td>
  <td>6.16</td>
  <td>5.16</td>
  <td>1</td>
  <td>0.82</td>
 </tr>
 <tr>
  <td>Yukon</td>
  <td>11.17</td>
  <td>9</td>
  <td>2.17</td>
  <td>1.33</td>
 </tr>
</table>

## Bonus:

It occurs to me there are many "what if" scenarios when looking at this analysis critically, that people might want to argue.
I certainly don't have time to go over all such possibilities, but I will go over a basic one.

You could make the argument that we only have 72 years of NDP data, and it's likely when the NDP reaches the number
of years in power as Liberals and Conservatives, the data will begin to look similar. While I cannot project decades worth
of NDP fiscal data into the future to make such comparisons, I can at least restrict the Liberal and Conservative data
to the number of years of NDP:

<table>
 <tr>
  <td>Party</td>
  <td>Region</td>
  <td>Years</td>
  <td>Surplus</td>
  <td>Deficit</td>
  <td>Avg. Budget Balance / GDP (%)</td>
 </tr>
 <tr>
  <td>Conservative</td>
  <td>72.86</td>
  <td>9.36</td>
  <td>63.49</td>
  <td>-1.97</td>
 </tr>
 <tr>
  <td>Liberal</td>
  <td>74.68</td>
  <td>17</td>
  <td>56.68</td>
  <td>-1.13</td>
 </tr>
 <tr>
  <td>Conservative</td>
  <td>74.79</td>
  <td>9.36</td>
  <td>65.43</td>
  <td>-2.27</td>
 </tr>
 <tr>
  <td>Liberal</td>
  <td>74.65</td>
  <td>12.71</td>
  <td>60.95</td>
  <td>-1.69</td>
 </tr>
</table>

As you can see, the first 75 years of Conservative and Liberal fiscals show they look nothing like the first
72 years of NDP fiscals. The point being, such a *what-if* argument doesn't carry much weight, as you'd
otherwise expect their respective datapoints to be more similar to the current NDP's. 

## The Data:

For brevity of this page, the explanation of the datasets can be found on the following page:

+ [Datasets](datasets/README.md)

In particular I provide my sources and give an overview on how I cleaned and validated the data.

## The Method:

For brevity of this page, the explanation of the methods can be found on the following page:

+ [Methods](scripts/README.md)

If for example you're wondering how you get fractions of years in the above data, you would want
to read over this page.  I otherwise in particular give an overview of the R scripts used to process the data.

### Personal Note:

Though it might be less professional, as the individual who put the time and effort into this,
I would like to share some personal thoughts for those who care about civics and a better society:

+ [Author's Note](other/README.md)

## Conclusion

Truthfully, this sort of comparative analysis is problematic to begin with. Whenever you compare, you always have to ask
if things are even *comparable* in the first place. I'm not a political science expert, but I've read that there is no
formal connection between federal and provincial parties that use the same name; so provincial Liberals have no formal
ideological connection to the federal Liberal party, for example. This is true of the Liberals and Conservatives, but
I've also read that the NDP are the exception, where they have formalized ideological relations between their federal
as well as provincial counterparts.

The point I'm making, is things aren't actually that simple, but you still get many pundits and citizens with "expert
opinions" who have decided things *are* that simple. You do what you can to educate them on the complex points of life,
but that doesn't always work. In such cases, you end up with projects like this, where we acknowledge their logic---taking
it to their way of thinking---and showing even within the constraints of their logic system the wild and irresponsible claims
they're making carry no weight.

---Daniel Nikpayuk
