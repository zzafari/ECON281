
# Week 3: Macroeconomics of Investment with Heterogeneity
# Author: Zorah Zafari


# Readings:

1.  Kekre Lenel (2022)

    - Expansionary monetary policy lowers risk premia

    - Expansionary monetary policy must change the covariance between
      the relevant SDF and stock return.

    - When the central bank lowers rates, inflation rises. This dilutes
      debt holding of more risk averse housholds. Wealth tilts towards
      people with more risk tolerance who need less compensation for
      taking risk.

2.  Bierdel, Drenik, Herreno, Ottonello (2025)

    - How capital heterogeneity and asymmetric information affect the
      macroeconomy?

    - This paper is motivated by two ideas:

      1.  Capital markets are illiquid and involve delayed trade

      2.  In illiquid markets, asymmetric information distorts terms-of
          trade.

    - They study asymmetric information (relationship between prices and
      duration) by measuring the liquidity of different capital units
      listed for trade.

    - Capital heterogeneity and trading frictions in capital markets
      have important macro implications. Larger elasticity of economic
      activity to changes in degree of asymmetric information.

    - Transmission mechanism: liquidity of capital and its effects on
      investment and capital allocation.

    - Role for studying policies aimed at preventing signaling.

3.  Ottonello Winberry (2022)

    - They study the investment channel of monetary policy. Investment
      is the most cyclical component of aggregate demand.

    - Which firms respond more the expansionary policies?

      1.  More constrainted firms: since expansionary eases financial
          frictions, more constrained firms may respond more which gives
          a financial accelerator story.

      2.  Less constrained firms: more constrained firms have steeper
          marginal cost curves so they will react less to the same
          aggregate demand shock.

    - They show that low-risk firms (those with low leverage and high
      distance to default) drive the investment response to expansionary
      monetary policy, since these firms face flatter marginal costs of
      financing investment, making them more sensitive to interest rate
      cuts. This result challenges the conventional financial
      accelerator intuition,which predicts that firms facing tighter
      financial constraints (high-risk firms) should respond more
      strongly to monetary policy because of amplified effects through
      external finance premia.

# Research Ideas:

## 1. Unified Framework of Monetary Transmission: Risk, Liquidity, and Heterogeneity {#unified-framework-of-monetary-transmission-risk-liquidity-and-heterogeneity .unnumbered}

- **Question:** How do risk and capital liquidity jointly shape monetary
  transmission?

- **Conceptual Extension:**

  - Bridge Kekre-Lenel and Bierdel, Drenik, Herreno, Ottonello (BDHO) by
    embedding capital market liquidity frictions into a heterogeneous
    agent New Keynesian model where capital misallocation affects the
    price of risk. Study how redistribution and capital reallocation
    jointly shape risk premia.

  - The idea is to bridge two separate mechanisms from Kekre-Lenel
    (monetary policy redistributes to high MPR households and lowers the
    risk premium) and BDHO (asymmetric information and illiquidity in
    capital markets cause investment misallocation and lower output).

  - I am trying to propose a model where:

    1.  Households are heterogenous in risk tolerance

    2.  Capital goods are heterogenous and subject to ttrading frictions
        and asymmetric information.

    3.  Monetary policy affects both the price of risk (through
        redistribution) and the capital allocation (through liquidity).

  - Might help answer questions like:

    1.  Does liquidity-induced improvement in capital allocation also
        lower the risk premium by raising the return on high-quality
        capital?

    2.  How do frictions in capital markets dampen or amplify
        redistributive channels of monetary policy?

    3.  Can policies aimed at improving liquidity be substitutes or
        complements to rate cuts?

- **Empirical Design:**

  - **Goal:** Provide empirical validation for the two key channels in
    the model --- redistribution through portfolio risk and
    misallocation through capital illiquidity --- and test whether
    monetary policy affects these jointly or separately.

  - **Data Strategy:**

    - Use household-level panel data (e.g., SCF) to:

      - Measure heterogeneity in MPR across household types (by wealth,
        age, income, education).

      - Link MPR variation to asset portfolio composition (e.g., shares
        in equity vs. bonds vs. cash).

    - Use asset-level or firm-level data (e.g., Compustat or BDHO's
      Idealista data analog) to:

      - Measure capital asset liquidity at firm or sector level (e.g.,
        via resale duration, asset turnover, capital age).

      - Match firm or sector investment responses to monetary policy
        shocks (e.g., local projections, shift-share exposure to
        surprise Fed announcements).

  - **Empirical Tests:**

    - Household Level (Risk premium channel): Test whether MPR
      heterogeneity predicts heterogeneous asset revaluation following
      monetary shocks.
      $$\Delta \text{Wealth}_{it} = \beta_1 \cdot \text{MPR}_i \cdot \text{MP\_Shock}_t + \text{controls} + \varepsilon_{it}$$

    - Firm/sector level (Capital allocation channel): Test whether
      sectors/firms with more illiquid capital exhibit weaker investment
      responses to monetary easing.
      $$\Delta \text{Investment}_{jt} = \beta_2 \cdot \text{IllCapital}_j \cdot \text{MP\_Shock}_t + \text{controls} + \eta_{jt}$$

    - Joint channel: Use sectoral exposure to household types with
      different MPR (e.g., using input-output linkages
      (Flynn,Patterson,Strum 2022) or labor composition) to test whether
      redistribution interacts with capital liquidity.
      $$\Delta \text{Investment}_{jt} = \beta_3 \cdot \text{CapitalIlliquidity}_j \cdot \text{SectorMPRExposure}_j \cdot \text{MP\_Shock}_t + ...$$

  - **Identification:**

    - Use high-frequency monetary policy shocks (e.g., Gertler-Karadi)
      as external instruments.

    - Alternatively, use cross-sectional variation in exposure to policy
      (e.g., regional bank dependence, interest rate passthrough,
      household bond/equity exposure).

## 2. Forward Guidance vs. Current Policy: {#forward-guidance-vs.-current-policy .unnumbered}

- **Question:** Does MPR heterogeneity imply different effects for rate
  cuts versus forward guidance?

- **Background:** Kekre and Lenel (2022) show that monetary policy
  affects the risk premium by redistributing to households with high
  marginal propensities to take risk (MPR). This idea builds on their
  insight by asking: *Do different types of monetary policy---current
  rate cuts versus forward guidance---redistribute to different
  households, and hence have different macroeconomic effects?*

- **Motivation:** Forward guidance policies primarily influence
  expectations about future returns and long-term rates, whereas current
  rate cuts affect short-term rates and immediate cash flows. If MPR
  heterogeneity is also tied to investment horizon or asset maturity,
  then the two policy types may shift wealth to different types of
  households. This matters because:

  - Central banks have increasingly relied on forward guidance,
    particularly when policy rates are near the zero lower bound. This
    shift is documented in several papers, including:

    - Campbell, Evans, Fisher, and Justiniano (2012), "Macroeconomic
      Effects of Federal Reserve Forward Guidance". Del Negro, Giannoni,
      and Patterson (2015), "The Forward Guidance Puzzle". Swanson and
      Williams (2014), "Measuring the Effect of the Zero Lower Bound on
      Medium- and Longer-Term Interest Rates".

  - Yet, the distributional implications of forward guidance---as
    distinct from current policy moves---remain underexplored.

- **Application Idea:** Test whether forward guidance redistributes
  differently from rate cuts by embedding asset maturity and
  horizon-dependent MPRs into a Kekre-Lenel-style heterogeneous agent
  model.

  - **Theoretical Extension:** Introduce assets of varying maturities
    (e.g., short-term cash, long-term bonds, equity) and households with
    differing planning horizons or discount factors. Let MPR depend on
    the asset duration most favored by each household type.

  - **Empirical Test:**

    - Use high-frequency monetary policy shock series that separate
      current rate cuts from forward guidance (e.g., Nakamura and
      Steinsson).

    - Match these to household-level portfolio data (e.g., from SCF) to
      study which households experience wealth revaluation under
      short-term vs. long-term shock channels.

    - Examine asset price responses by maturity (e.g., long-term bond
      yields, equity risk premia) to identify which risk holders
      benefit.
