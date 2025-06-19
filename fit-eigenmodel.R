# fit_eigenmodel.R
# – Loads prepped data
# – Compiles & samples Stan eigenmodel (matrix + covariates)

library(cmdstanr)

load("data/prepped_data.RData")  # adj_list, cov_matrix, all_teams

# pick meeting 1
M1 <- adj_list[[1]]

# HYPERPARAMETERS
K      <- 2
a_sig  <- b_sig  <- a_w <- b_w <- a_k <- b_k <- c(3,1)

stan_data <- list(
  N     = length(all_teams),
  K     = K,
  P     = ncol(cov_matrix),
  Y     = M1,
  X     = cov_matrix,
  a_sig = a_sig[1], b_sig = a_sig[2],
  a_w   = a_w[1],   b_w   = a_w[2],
  a_k   = a_k[1],   b_k   = a_k[2]
)

# compile & sample
model_cov   <- cmdstan_model("stan/eigencov.stan")
fit_cov     <- model_cov$sample(
  data       = stan_data,
  seed       = 123,
  chains     = 3,
  iter_warmup= 2000,
  iter_sampling = 5000
)

save(fit_cov, file = "fits/fit_cov.RData")
