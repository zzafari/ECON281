# Week 2: Much Ado about Phillips Curves
# Zorah Zafari 
# May 16, 2025


# Research Ideas 

## 1. Inflation Expectations and Regional Phillips Curves 

- **Motivation:**

  - The Federal Reserve's dual mandate aims to promote maximum
    employment and stable prices. Central to achieving these goals is
    the Fed's ability to manage inflation expectations. After the March
    FOMC meeting earlier this year, Federal Reserve Chair Jerome Powell
    emphasized that "anchored inflation expectations" are at the heart
    of the Fed's policy framework. This concern extends beyond financial
    markets to households, as underscored by Coibion et al. (2022), who
    highlight that household inflation expectations significantly
    influence firms' pricing decisions and household consumption-savings
    behavior. These expectations are often measured through survey data,
    such as the Michigan Survey of Consumers or NY Fed Survey Data.

  - The Phillips Curve, a well-established economic concept, represents
    the inverse relationship between inflation and unemployment. McLeay
    and Tenreyro (2020) discuss the identification challenges associated
    with the Phillips Curve and provide evidence of a steeper Phillips
    Curve in U.S. regional data, despite reduced-form evidence
    suggesting a flattening trend. However, while McLeay and
    Tenreyro (2020) argue that optimal monetary policy can flatten the
    Phillips Curve by stabilizing inflation and output, their analysis
    does not explicitly focus on the stabilization of long-term
    inflation expectations as the primary mechanism. Hazell et
    al. (2020) extend this insight to regional Phillips Curves but do
    not directly test the role of household expectations. Coibion et
    al. (2022) emphasize that household inflation expectations are
    heterogeneous, shaped by personal experience, and significantly
    influence consumption decisions.

  - Furthermore, Bracha and Tang (2023) document that attention to
    inflation increases when inflation levels are high. They introduce
    two novel measures of inflation inattention: (1) the share of
    respondents who say "Don't know" when asked for an inflation
    estimate, and (2) the estimation errors of inflation expectations.
    Their analysis confirms that when inflation is high, consumers pay
    more attention to price changes, which they connect to the
    cost-benefit trade-off of acquiring information about inflation.

  - My goal is to try to explicitly link the flattening of the Phillips
    curve not just to anchored long-term expectations, but also to the
    degree of consumer attention to inflation. According to Bracha and
    Tang (2023), when inflation is low, households pay less attention to
    price changes, which could lead to more dispersed expectations and a
    muted response in wage and price setting. Conversely, when inflation
    is high, attention rises, potentially steepening the Phillips Curve
    in high-volatility regions.

- **Research Questions:**

  1.  **To what extent do long-term inflation expectations explain the
      flattening of the Phillips Curve across different U.S. states?
      Does the anchoring of expectations differ between states with high
      economic volatility and those with stable growth?**

      - States with historically high economic volatility (e.g.,
        energy-dependent regions like Texas) have less-anchored
        inflation expectations, resulting in steeper Phillips Curves.

      - States with stable economic growth histories (e.g., California,
        Massachusetts) exhibit stronger expectation anchoring and
        flatter Phillips Curves.

  2.  **How does political alignment with the federal administration
      influence inflation expectations and Phillips Curve dynamics?**

      - Political alignment with the federal administration may affect
        expectation anchoring due to differences in economic policies
        and fiscal stability.

  3.  **What role do regime shifts play in altering household inflation
      expectations across states?**

      - Regime shifts, particularly between inflation-sensitive and
        inflation-tolerant administrations, may cause significant
        adjustments in household inflation expectations, impacting
        regional Phillips Curves.

- **Actionable Tasks and Research Plan:**

  - Data Collection

    - Survey of Professional Forecasters (SPF) for inflation
      expectations.

    - Michigan Survey of Consumers: Household-level inflation
      expectations.

    - State-level CPI Data: Inflation rates by state.

    - State-level Unemployment Data (LAUS) or CPS microdata.

    - Political Alignment Data: Historical voting patterns and federal
      administration alignment. These I think are readily available or
      can probably be scraped online.

  - Methodology

    - Try to estimate State-specific Phillips Curves with and without
      long-term inflation expectations starting with a very simple model
      where the LHS includes $\pi_{st}$ (inflation for state $s$ in time
      $t$) and the right hand side might include a measure of state
      unemployment $U_{st}$, expected inflation for the next period
      $E[\pi_{st+1}]$, attention level to inflation in state $s$ at time
      $t$, and some state and time fixed effects. A second iteration
      might include interaction terms for states with historically high
      GDP volatility and political alignment to test if their
      expectations differ systematically.

  - Research Design and Identification Strategy

    - Use historical GDP volatility as an instrument for attention to
      inflation.

    - Control for political realignment and test the robustness using
      low-volatility states as a placebo.

    - Use lagged political alignment to address potential endogeneity.

- **Conclusion** By incorporating attention mechanisms and political
  alignment, I propose to bridge existing theoretical gaps and offer
  policy-relevant findings. For example, results from this sort of
  analysis could inform more tailored and region-specific monetary
  policies. Regional stabilization policies could target expectation
  anchoring through direct communication and enhanced local monetary
  engagement. Additionally, the Fed could benefit from incorporating
  regional volatility measures and political alignment into its forward
  guidance communication to better stabilize inflation expectations.

## 2. Intrastate Phillips Curve: Alternative Heterogeneity? 

The existing literature predominantly examines the Phillips Curve at the
state or regional level, often aggregating across diverse populations.
However, this regional aggregation may mask significant heterogeneity in
inflation-unemployment trade-offs across demographic groups within
states. Building on Herreno and Pedemonte (2022) work on hand-to-mouth
consumers and the distributional impacts of monetary policy, I propose
investigating the slope of the Phillips Curve across demographic lines
such as age, race, education, and income levels. I will add that I have
not thought too deeply what added information demographic groups may add
that isnt alreayd being explained by income (this section really is just
random thoughts that were coming to my head as I was reading the paper).

I am just thinking that labor market flexibility and wage sensitivity
may differ substantially across demographic segments, which may
contribute to variations in the Phillips Curve's slope within states.
For instance, younger workers may face more wage volatility and weaker
bargaining power, leading to a steeper Phillips Curve. Historical labor
market frictions and varying degrees of employment protections might
result in demographic-specific inflation sensitivities. Higher-educated
populations may have more job stability, leading to a flatter Phillips
Curve relative to less-educated cohorts. These can be tested empirically
with first-stage reduced-form analysis using Current Population Survey
(CPS) microdata to estimate group-specific Phillips Curves within
states. One potential limitation is the sufficiency of sample sizes for
subgroup analysis within smaller states; however, pooling across years
or using grouped estimators could mitigate this concern.

## 3. Sectoral Phillips Curves in the Gig Economy 

Another random thought: rapid expansion of the gig economy introduces
new labor market dynamics that may fundamentally alter the traditional
Phillips Curve relationship. Workers can enter and exit the gig economy
with minimal frictions, reducing the wage pressure traditionally
associated with low unemployment. Another extension of the Herreno and
Pedemonte (2022) analysis might be creating a TANK model where locations
differ by the size of the gig economy?
