# Research Ideas

## 1. Redlining and the Unequal Pass-Through of Monetary Policy

- **Motivation:**

  - Although we did not discuss the Berger et al. (2021) paper in class,
    I found it quite interesting. The paper shows that the effectiveness
    of monetary policy through the mortgage refinancing channel depends
    on the distribution of mortgage rate gaps. Only households with
    positive rate gaps $`frac>0`$ respond strongly to rate cuts, making
    monetary transmission path-dependent.

  - The authors argue that refinancing constraints from lender’s side
    due to high LTV or low credit scores are not the main driver of
    observed patterns. Instead, monetary policy pass-through depends on
    the current composition of mortgage contracts, which in turn is
    shaped by past refinancing opportunities.

  - I propose that the composition of mortgage contracts—and therefore
    the distribution of rate gaps—is shaped by the long history of
    racial exclusion in U.S. housing and credit markets. Specifically,
    redlining and discriminatory mortgage policies shaped where and when
    households were able to enter the mortgage market, which lenders
    they used, and at what terms. Even if redlining occurred decades
    ago, its legacy may still show up in today’s mortgage stock:
    households in formerly redlined areas may have entered the mortgage
    market later, with worse terms, and may have refinanced less
    frequently in past low-rate periods. As a result, they may
    systematically hold fewer loans with high refinancing potential
    today, leading to a lower $`frac>0`$.

  - This project would evaluate whether the historical geography of
    credit exclusion helps explain variation in the potency of monetary
    policy today—linking structural inequality to the transmission
    mechanism itself.

- **Research Questions:**

  1.  Do neighborhoods with a redlining history exhibit persistently
      lower $`frac > 0`$ values, even conditional on income and credit
      score?

  2.  Are households in formerly redlined areas less likely to have
      benefited from prior refinancing waves, leaving them with less
      refinancing capacity during future rate cuts?

  3.  Does the legacy of redlining reduce monetary policy pass-through
      via the mortgage channel- e.g., credit expansion following a rate
      cut or change in durable consumption?

  4.  Can we interpret redlining as a slow-moving exposure that shapes
      the mortgage composition today, thereby producing persistent
      heterogeneity in monetary policy effectiveness across space and
      race?

- **Empirical Strategy:**

  - **Data Sources:**

    - Home Mortgage Disclosure Act (HMDA) data for loan originations,
      borrower race/income, and refinancing activity by tract and year.

    - Historical HOLC redlining maps (Mapping Inequality Project)
      geocoded to census tracts.

    - Potentially use CoreLogic for Rate gap or $`frac > 0`$ since the
      department just purchased this dataset.

  - **Approach:**

    - Construct a panel of census tracts with HOLC redlining grades and
      link them to current mortgage activity and refinancing behavior.

    - Regress tract-level $`frac > 0`$ on historical redlining
      indicators, controlling for current income, home values, and
      borrower credit scores.

    - Estimate difference-in-differences or event study models around
      monetary policy shocks (e.g., Romer & Romer shock dates) to
      examine whether tracts with redlining histories exhibit muted
      durable consumption or credit responses relative to never-redlined
      tracts.

    - Explore heterogeneity by race within tracts using borrower-level
      HMDA data.

- **Conclusion:** By embedding the history of redlining into the Berger
  et al. (2021) framework, I aim to assess the distributional equity of
  monetary policy pass-through. This work could help policymakers better
  understand how structural inequality shapes macroeconomic
  effectiveness, and motivate targeted interventions in the mortgage
  market to repair historic exclusion.

## 2. Empirically Testing Sticky Expectations in HANK Models

- **Motivation:**

  - Auclert, Rognlie, and Straub (2020) estimate a Heterogeneous-Agent
    New Keynesian (HANK) model that can match both “micro jumps” in
    household consumption and “macro humps” in aggregate responses to
    monetary shocks by incorporating sticky expectations.

  - Sticky expectations dampen households’ intertemporal substitution
    response to interest rate changes, generating gradual consumption
    responses (macro humps) rather than sharp ones (macro jumps).

  - However, sticky expectations in their model are assumed rather than
    tested directly against micro data. Household survey data offer an
    opportunity to test this feature empirically and since I am already
    working with such survey data (: maybe we can empirically test
    “sticky expectations”?

- **Research Questions:**

  - Do household inflation expectations exhibit stickiness consistent
    with slow updating, especially following monetary policy shocks? Can
    we identify state-dependent vs. time-dependent updating patterns
    using real-time forecast errors in survey data?

- **Actionable Tasks and Research Plan:**

  - **Data Collection:**

    - University of Michigan Survey of Consumers (cross-sectional), used
      for attention proxies (e.g., “don’t know” responses).

    - FOMC statement release dates and Romer & Romer monetary policy
      shocks to identify surprise movements.

  - **Methodology:**

    - Estimate distributed lag models of inflation expectation updating
      around identified monetary shocks. Then compute persistence of
      forecast errors to quantify stickiness. Stratify by income,
      education, and financial literacy to test heterogeneity in
      attention and updating behavior.

    - Try to calibrate how often households update their expectations
      (like in Calvo or Carroll models) by seeing if the patterns in the
      survey data—how slowly people revise their forecasts after
      monetary shocks—line up with what a sticky expectations model
      would predict, similar to what Auclert, Rognlie, and Straub (2020)
      do.

- **Conclusion:** With this empirical analysis, I aim to bridge the
  micro and macro features of sticky expectations by directly estimating
  the speed and heterogeneity of household updating behavior. It will
  empirically discipline a key parameter in the Auclert et al. (2020)
  model, improve the microfoundations of HANK modeling, and contribute
  to the design of forward guidance communication strategies.
