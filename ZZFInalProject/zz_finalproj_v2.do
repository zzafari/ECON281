*******************************************************************************
*Zorah Zafari 
*May 26, 2025
*Inflation Expectations Project 		
********************************************************************************
clear all
set scheme s1color 
graph close _all
********************************************************************************
*FILE PATHS
********************************************************************************
*need to update the file path to where you save the folder. 
cd 
********************************************************************************
scalar bls_data = 0
scalar datasetup = 0
scalar createpid = 0 
scalar analysis = 1 
********************************************************************************





if bls_data{

**************************	
*BLS CPI DATA - BY REGION 
**************************
import excel bls_regional_inflation.xlsx , clear firstrow


******************************
*Generate Month-Year Variable
******************************
gen month = month(SeriesID)
gen year = year(SeriesID)

gen mdate = ym(year, month)
format mdate %tm


*****************************
*Clean data and reshape 
*****************************
drop SeriesID month year 

rename CUUR0100SA0 cpi1
rename CUUR0100SA0L1E cpi_core1
rename CUUR0200SA0 cpi2
rename CUUR0200SA0L1E cpi_core2
rename CUUR0300SA0 cpi3
rename CUUR0300SA0L1E cpi_core3
rename CUUR0400SA0 cpi4
rename CUUR0400SA0L1E cpi_core4

reshape long cpi cpi_core, i(mdate) j(regionbls)


*********************************
*Match regions to UMICH Regions
*********************************
gen region = 3 if regionbls == 1 
replace region =2 if regionbls == 2
replace region =4 if regionbls == 3 
replace region = 1 if regionbls == 4

drop regionbls 

label define regionlab 1 "West" 2 "Midwest" 3 "Northeast" 4 "South"
lab val region regionlab

xtset region mdate 
	
************************
*Gen Infaltion
************************
gen infl_yoy = 100 * (log(cpi) - log(L12.cpi))
gen infl_core_yoy = 100 * (log(cpi_core) - log(L12.cpi_core))

*Save Data 
keep mdate region infl_yoy infl_core_yoy
	
save bls_cpi_regional_monthly.dta, replace 


}


if datasetup {
************************************************************	
* Raw data downloaded from UMICH Survey of Consumers 
************************************************************
import delimited AA4ia12T.csv, clear 
	

*******************************
*Define Regions in MSC
*******************************
/*Regions in MSC is defined as: 
 1  West
 2  North Central
 3  Northeast
 4  South
*/
	
destring region, replace 
drop if region == 6 
label define regionlab 1 "West" 2 "Midwest" 3 "Northeast" 4 "South"
lab val region regionlab
	
*****************************	
*Month and Year of Interview 
*****************************	
gen month = mod(yyyymm, 100)
generate mdate = ym(yyyy, month)
format mdate %tm

*******************************************
*Month and Year of the Previous Interview 
*******************************************
destring datepr, replace 
gen yearpr = floor(datepr/100)
gen monthpr = mod(datepr, 100)
gen mdate_pr = ym(yearpr, monthpr)
format mdate_pr %tm

********************************************************
*ID from previous rounds of interviews
*need these to link people across their interiew rounds
********************************************************
destring idprev , replace 
destring idprev2 , replace 


format id %20.0f
format idprev %20.0f
format idprev2 %20.0f

order  caseid mdate mdate_pr id idprev idprev2 region sex age
xtset caseid mdate 


destring pago pagor1 pagor2 pago5 pexp pexp5 inexq1 inexq2 inex rinc bago bexp ///
    bus12 bus5 news1 news2 unemp govt ratex px1q1 px1q2 px1 px5q1 px5q2 px5 ///
    dur durrn1 durrn2 hom homrn1 homrn2 shom car carrn1 carrn2 homeown homeval ///
    hompx1q1 hompx1q2 hompx1 hompx5q1 hompx5q2 hompx5 eclgrd ehsgrd egrade ///
    education vehown vehnum gaspx1 gaspx2 gas5 gas1px1 gas1px2 gas1 pinc pinc2 ///
    pjob pssa pcry pstk age sex, replace

*this comes from the codefiles you download with MSC
replace pago = . if (pago >= 8) 
replace pagor1 = . if (pagor1 >= 98) 
replace pagor2 = . if (pagor2 >= 98) 
replace pago5 = . if (pago5 >= 8) 
replace pexp = . if (pexp >= 8) 
replace pexp5 = . if (pexp5 >= 8) 
replace inexq1 = . if (inexq1 >= 8) 
replace inexq2 = . if (inexq2 >= 98) 
replace inex = . if (inex == -97)
replace inex = . if (inex >= 96) 
replace rinc = . if (rinc >= 8) 
replace bago = . if (bago >= 8) 
replace bexp = . if (bexp >= 8) 
replace bus12 = . if (bus12 >= 8) 
replace bus5 = . if (bus5 >= 98) 
replace news1 = . if (news1 >= 98) 
replace news2 = . if (news2 >= 98) 
replace unemp = . if (unemp >= 8) 
replace govt = . if (govt >= 8) 
replace ratex = . if (ratex >= 8) 
replace px1q1 = . if (px1q1 >= 8) 
replace px1q2 = . if (px1q2 >= 98) 
replace px1 = . if (px1 == -97)
replace px1 = . if (px1 >= 96) 
replace px5q1 = . if (px5q1 >= 8) 
replace px5q2 = . if (px5q2 >= 98) 
replace px5 = . if (px5 == -97)
replace px5 = . if (px5 >= 96) 
replace dur = . if (dur >= 8) 
replace durrn1 = . if (durrn1 >= 98) 
replace durrn2 = . if (durrn2 >= 98) 
replace hom = . if (hom >= 8) 
replace homrn1 = . if (homrn1 >= 98) 
replace homrn2 = . if (homrn2 >= 98) 
replace shom = . if (shom >= 8) 
replace car = . if (car >= 8) 
replace carrn1 = . if (carrn1 >= 98) 
replace carrn2 = . if (carrn2 >= 98) 
replace homeown = . if (homeown >= 99) 
replace homeval = . if (homeval >= 8) 
replace hompx1q1 = . if (hompx1q1 >= 8) 
replace hompx1q2 = . if (hompx1q2 >= 998) 
replace hompx1 = . if (hompx1 == -997)
replace hompx1 = . if (hompx1 >= 996) 
replace hompx5q1 = . if (hompx5q1 >= 8) 
replace hompx5q2 = . if (hompx5q2 >= 998) 
replace hompx5 = . if (hompx5 == -997)
replace hompx5 = . if (hompx5 >= 996) 
replace eclgrd = . if (eclgrd >= 8) 
replace ehsgrd = . if (ehsgrd >= 8) 
replace egrade = . if (egrade >= 98) 
replace education = . if (education >= 98) 
replace vehown = . if (vehown >= 8) 
replace vehnum = . if (vehnum >= 98) 
replace gaspx1 = . if (gaspx1 >= 8) 
replace gaspx2 = . if (gaspx2 >= 998) 
replace gas5 = . if (gas5 == -997)
replace gas5 = . if (gas5 >= 996) 
replace gas1px1 = . if (gas1px1 >= 8) 
replace gas1px2 = . if (gas1px2 >= 998) 
replace gas1 = . if (gas1 == -997)
replace gas1 = . if (gas1 >= 996) 
replace pinc = . if (pinc >= 998.00) 
replace pinc2 = . if (pinc2 >= 998.00) 
replace pjob = . if (pjob >= 998.00) 
replace pssa = . if (pssa >= 998.00) 
replace pcry = . if (pcry >= 8) 
replace pstk = . if (pstk >= 998.00) 



save umich_microdata_zz.dta, replace 

}
 

 if createpid{
 	
use umich_microdata_zz.dta, clear 

//keep caseid px1 age income egrade region mdate id idprev mdate_pr sex wt

/*******************************************************************************
Research Goals: 
The premise of this excercise is to the understand cross-sectional variation 
of how households set their expectations of future inflation. Household expectations 
shape both consumption and firm pricing behavior and anchoring of inflation expectations 
is vital for monetary policy. 
Recent work has showns the regional PC remains steep despite flattened PC at the 
national level but these studies dont test how household attention or expectation dynamics 
may play a role in the regional differences. 

I will empirically test whether households in regions with inflation above 4\% 
revise their inflation expectations more sharply, using microdata from the 
University of Michigan's Survey of Conumers (MSC). This provides the first direct 
test of the ``inflation attention threshold'' hypothesis at the household level.

For now all I will do is run the following regression: 

abs(E[pi_it] - E[pi_t-1]) = alpha + beta*region + gamma(age_irt egrade_irt income_irt)
*******************************************************************************/


/*******************************************************************************
To track changes in expectations at the individual level it is important to
create a panel dataset that tracks the interviewer over time. This has actually 
rendered to be somewhat difficult given the set up of this dataset. Basically 
an individual is interviewed in month t, and then six month later t+6 and then 
12 months later t+12. But there is no one unique identifier so the way you can 
indentify their intervies is by id-mdate and idprev-mdate_pr that matches their
current interview date and id to the previous interview date and id. 

Below is my attempt of tracking individuals over their interviews. There are def
some mistake that I need to come back and check: 

caseid	mdate	mdate_pr	id	idprev	region	sex	age	px1	income	egrade	final_person_id
264716	2017m1	.	22		Northeast	1	55	1	   300000	17	169264
268820	2017m7	2017m1	1102	22	Northeast	1	55	0	   300000	17	169264
269328	2017m8	2017m1	1006	22	South	1	66	4	    69000	17	169264
264741	2017m1	.	47		Midwest	1	61	1	   112500	16	169289
268766	2017m7	2017m1	1048	47	Midwest	1	61	2	    87500	16	169289
269327	2017m8	2017m1	1005	47	Northeast	1	61	1	     7000	12	169289
264759	2017m1	.	65		Midwest	2	61	1	    75000	15	169307
268884	2017m7	2017m1	1166	65	Midwest	2	61	8	    65000	15	169307
269323	2017m8	2017m1	1001	65	Northeast	1	67	2	    55000	17	169307

*******************************************************************************/

/*******************************************************************************
This block of code is designed to construct a consistent final_person_id for panel 
respondents in the MSC, by following each respondent's idprev chain through 
time and assigning a single unique ID (master_id) to all records belonging to the 
same person.
*******************************************************************************/



* Initialize master_id for those without idprev
gen master_id = caseid if missing(idprev)

* Save working dataset
tempfile base
save `base', replace


* Loop until convergence (no more updates to master_id)
local updated = 1
while `updated' {
	
    use `base', clear

    * Preserve current master_ids for comparison
    gen old_master_id = master_id

    *  Make lookup table from previous wave's id and mdate
    preserve
        keep id mdate master_id
        rename id idprev
        rename mdate mdate_pr
        rename master_id master_id_prev
        tempfile lookup
        save `lookup', replace
    restore

    * Merge current with previous wave using idprev and mdate_pr
    merge m:1 idprev mdate_pr using `lookup', keep(master match) nogen

    * Propagate master_id forward
    replace master_id = master_id_prev if missing(master_id) & !missing(master_id_prev)

    * Check for updates
    gen changed = old_master_id != master_id
    quietly count if changed == 1
    local updated = r(N)

    drop old_master_id changed master_id_prev

    save `base', replace
}

use `base', clear

* Final cleanup: fill remaining master_ids and generate final_person_id
replace master_id = caseid if missing(master_id)
egen final_person_id = group(master_id)

drop if id == 1085 & mdate == tm(1991m6)
xtset final_person_id mdate 
	
	
	
merge m:1 mdate region using bls_cpi.dta, nogen keep(3)


drop if mdate >=tm(2024m1)
/*
starting 2024 they change the format of id and idprev: 
20240950242	20240315888
20240950262	20240226764
20240950264	20240224007
20240950265	20240326782
20240950275	20240215011
come back and decompose this since its seems like they 
concatenate the id and mdate

for now ill just drop them but come back and fix this 

*/	
	
	
bysort final_person_id: gen n_interviews = _N
//gen interviewed_three_times = n_interviews == 3


*lets just keep people who have been here for at least 2 interviews. 
keep if n_interviews >=2
	
xtset final_person_id mdate 


save umich_microdata_zz_clean.dta ,replace 

 }
 
 
if analysis {
	 
use  umich_microdata_zz_clean.dta, clear 
	
/***********************************************************
Generate the dependet variable. This is just the absolute 
value of the difference in expectations between two interviews. 
***********************************************************/
gen dpx1 = abs(px1 - l6.px1 ) if l6.px1 !=. 

keep if dpx1 !=. 
	
/***********************************************************
Generate indicator for being in a more "volatile" region. 
Using threshold from Oliver Pfauti's paper: 4%
***********************************************************/
gen highinfl = infl_yoy > 4 if !missing(infl_yoy)


/************************************************************
Construct income quartiles: used to split sample.
***********************************************************/

destring income, replace 
gen lnincome = log(income)

xtile income_quartile = income, nq(4)

forval i = 1(1)4 {
gen incqt_`i' = (income_quartile == `i')
}

/************************************************************
Construct EDU categoires, also used to split sample. 
***********************************************************/
destring educ, replace 

gen edu1 = inlist(educ, 1, 2)
gen edu2 = (educ==3)
gen edu3 = (educ==4)
gen edu4 = inlist(educ, 5, 6)

// egrade is the continuous version 


/*******************************************************
*Label Variables for regression tables
*******************************************************/
 
lab var dpx1 "Change in Expectations"
lab var highinf "High Infaltion Region"
lab var age "Age"
lab var egrade "Education"
lab var lnincome "Log Income"


********************************************************************************
*Regressions: 
********************************************************************************
* 1. regions fe, time fe, region and time fe. 

eststo fe1: reghdfe dpx1 highinf age egrade lnincome [aweight = wt], ///
    absorb(region) vce(robust)
	
eststo fe2: reghdfe dpx1 highinf age egrade lnincome [aweight = wt], ///
    absorb(mdate) vce(robust)
	
eststo fe3: reghdfe dpx1 highinf age egrade lnincome [aweight = wt], ///
    absorb(region mdate) vce(robust)
	
* Export Tables
esttab fe1 fe2 fe3 using regs1_general.tex, replace ///
    se star(* 0.10 ** 0.05 *** 0.01) ///
    b(3) se(3) label ///
    title("Regression Results on Inflation Expectations") ///
    mtitles("Region FE" "Time Effects" "Region-Time FE") nonumber ///
    addnotes("Robust SEs; FE model includes region and mdate fixed effects") ///
    alignment(D{.}{.}{-1}) compress
*********************************************************************************	
* 2. run regression by education subgroups 
forval i = 1(1)4 {
	eststo fe_edu`i': reghdfe dpx1 highinf age egrade lnincome if edu`i' ==1 [aweight = wt], ///
    absorb(region mdate) vce(robust)
	
}

* Export Tables
esttab fe_edu1 fe_edu2 fe_edu3 fe_edu4 using regs2_educ.tex, replace ///
    se star(* 0.10 ** 0.05 *** 0.01) ///
    b(3) se(3) label ///
    title("Regression Results on Inflation Expectations by Education Groups") ///
    mtitles("LT High School" "High School" "Some College" "College Plus") nonumber ///
    addnotes("Robust SEs; FE model includes region and mdate fixed effects") ///
    alignment(D{.}{.}{-1}) compress	
	
	
*********************************************************************************
* 3. run regression by income quartiles 
forval i = 1(1)4 {
	eststo fe_inc`i': reghdfe dpx1 highinf age egrade lnincome if incqt_`i' ==1 [aweight = wt], ///
    absorb(region mdate) vce(robust)
	
}	
	
* Export Tables
esttab fe_inc1 fe_inc2 fe_inc3 fe_inc4 using reg3_inc.tex, replace ///
    se star(* 0.10 ** 0.05 *** 0.01) ///
    b(3) se(3) label ///
    title("Regression Results on Inflation Expectations by Income Distribution") ///
    mtitles("Income QT 1" "QT 2" "QT 3" "QT 4") nonumber ///
    addnotes("Robust SEs; FE model includes region and mdate fixed effects") ///
    alignment(D{.}{.}{-1}) compress	
	
**********************************************************************************	
	
	

	stop 
	
 }
 
 
 
 