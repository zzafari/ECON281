*******************************************************************************
*Zorah Zafari 
*May 24, 2025
*NY Fed SEC Aggregated Time Series Graphs
********************************************************************************
clear all
set scheme s1color 
graph close _all
********************************************************************************
*FILE PATHS
********************************************************************************
cd ~/Desktop/year2/empiricalmacro/project/nyfed_sce/
********************************************************************************
{ 
********************************************************************************
* RECESSION SHADING 
********************************************************************************
*MONTHLY
********************************************************************************
local rsm1 "1929m8 1929m9 1929m10 1929m11 1929m12 1930m1 1930m2 1930m3 1930m4 1930m5 1930m6 1930m7 1930m8 1930m9 1930m10 1930m11 1930m12 1931m1 1931m2 1931m3 1931m4 1931m5 1931m6 1931m7 1931m8 1931m9 1931m10 1931m11 1931m12 1932m1 1932m2 1932m3 1932m4 1932m5 1932m6 1932m7 1932m8 1932m9 1932m10 1932m11 1932m12 1933m1 1933m2 1933m3 1937m5 1937m6 1937m7 1937m8 1937m9 1937m10 1937m11 1937m12 1938m1 1938m2 1938m3 1938m4 1938m5 1938m6"
local rsm2 "1945m2 1945m3 1945m4 1945m5 1945m6 1945m7 1945m8 1945m9 1945m10 1948m11 1948m12 1949m1 1949m2 1949m3 1949m4 1949m5 1949m6 1949m7 1949m8 1949m9 1949m10 1953m7 1953m8 1953m9 1953m10 1953m11 1953m12 1954m1 1954m2 1954m3 1954m4 1954m5 1957m8 1957m9 1957m10 1957m11 1957m12 1958m1 1958m2 1958m3 1958m4"
local rsm3 "1960m4 1960m5 1960m6 1960m7 1960m8 1960m9 1960m10 1960m11 1960m12 1961m1 1961m2 1969m12 1970m1 1970m2 1970m3 1970m4 1970m5 1970m6 1970m7 1970m8 1970m9 1970m10 1970m11 1973m11 1973m12 1974m1 1974m2 1974m3 1974m4 1974m5 1974m6 1974m7 1974m8 1974m9 1974m10 1974m11 1974m12 1975m1 1975m2 1975m3"
local rsm4 "1980m1 1980m2 1980m3 1980m4 1980m5 1980m6 1980m7 1981m7 1981m8 1981m9 1981m10 1981m11 1981m12 1982m1 1982m2 1982m3 1982m4 1982m5 1982m6 1982m7 1982m8 1982m9 1982m10 1982m11 1990m7 1990m8 1990m9 1990m10 1990m11 1990m12 1991m1 1991m2 1991m3"
local rsm5 "2001m3 2001m4 2001m5 2001m6 2001m7 2001m8 2001m9 2001m10 2001m11 2007m12 2008m1 2008m2 2008m3 2008m4 2008m5 2008m6 2008m7 2008m8 2008m9 2008m10 2008m11 2008m12 2009m1 2009m2 2009m3 2009m4 2009m5 2009m6 2020m2 2020m3 2020m4"
local rsm6 "2020m2 2020m3 2020m4"
********************************************************************************
*Quarterly
********************************************************************************
local rsq1 "1929q3 1929q4 1930q1 1930q2 1930q3 1930q4 1931q1 1931q2 1931q3 1931q4 1932q1 1932q2 1932q3 1932q4 1933q1 1937q2 1937q3 1937q4 1938q1 1938q2"
local rsq2 "1945q1 1945q2 1945q3 1948q4 1949q1 1949q2 1949q3 1953q3 1953q4 1954q1 1957q3 1957q4 1958q1"
local rsq3 "1960q2 1960q3 1960q4 1961q1 1969q4 1970q1 1970q2 1970q3 1973q4 1974q1 1974q2 1974q3 1974q4 1975q1"
local rsq4 "1980q1 1980q2 1980q3 1981q3 1981q4 1982q1 1982q2 1982q3 1982q4 1990q3 1990q4 1991q1"
local rsq5 "2001q1 2001q2 2001q3 2001q4 2007q4"
local rsq6 "2008q1 2008q2 2008q3 2008q4 2009q1 2009q2 2020q1"
********************************************************************************
}




import delimited threeyrahead.csv, clear 

gen expectation = 2

tempfile threeyrfile
save `threeyrfile', replace 


import delimited oneyrahead.csv, clear 

gen expectation = 1 

append using `threeyrfile'


gen year = floor(date/100)
gen month = mod(date, 100)
gen mdate = ym(year, month)
format mdate %tm



xtset expectation mdate 



foreach x in west midwest south northeast{
	
	gen `x'_3m = (l2.`x' + l1.`x' + `x')/3
}


forval i = 1/2 {
	
	if `i' == 1 local note  "one-year"
	if `i' == 2 local note  "three-year"	
	
	if `i' == 1 local ttl  "One-Year Ahead Inflation Expectations"
	if `i' == 2 local ttl  "Three-Year Ahead Inflation Expectations"
	
	*Graph Time Series 
tw (tsline west_3m midwest_3m south_3m northeast_3m if expectation == `i', lc(navy midblue blue maroon)) , ///
plotregion(style(none)) ylab(, labsize(small) angle(h)) tlab(2013m1(24)2025m4, labsize(vsmall)) ///
ttitle("") title("`ttl'", size(medsmall)) ///
tline(`rsm6', lcolor(gs14) lwidth(thick) lpattern(solid)) ///
caption("Notes: Median `note' ahead expected inflation rate by region. 3-month moving average." "Source: New York Fed Survey of Consumer Expectations." , size(vsmall)) ///
ytitle("Percent", size(small))  ///
legend(order(1 "West" 2 "Midwest" 3 "South" 4 "Northeast" )  cols(4) size(vsmall) symxsize(*0.5) region(lstyle(none))) ///
name(inflation_expectation_`i', replace)
graph export `results'infexp_byregion_`i'.pdf, replace
	
	
	
	
}










