# dydadic-regression-eigenmodel
Latent Variable Dyadic Regression Models for Prediction Over/Under Bets in Sports Betting

This repository implements and evaluates a Bayesian eigenmodel framework for uncovering hidden structure in Over/Under betting markets. By treating each pair of teams as a dyad in a network—where edges indicate whether the combined score exceeded the bookmaker’s line—we:

- **Model** team interactions via a latent-space bilinear mixed-effects (“eigen”) model  
- **Perform** posterior inference with Hamiltonian Monte Carlo (Stan) to recover latent team factors and scaling parameters  
- **Validate** through simulation studies (recovering true latent structure) and real-world data from the 2023 NBA regular season  
- **Assess** predictive power using posterior predictive checks, ROC/AUC, and confusion matrices on sequential matchups
