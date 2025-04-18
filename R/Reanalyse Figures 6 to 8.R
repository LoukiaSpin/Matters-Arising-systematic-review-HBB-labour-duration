#*******************************************************************************
#*
#*                    Re-analyse subgroups in Figures 6 to 8                                               
#*
#* Author: Loukia M. Spineli
#* Date: April 2025
#*******************************************************************************


## Load libraries ----
remotes::install_github("guido-s/meta", ref = "develop", build_vignettes = TRUE)
library(meta)


## Load datasets ----
# First labour stage
load("./data/first_stage_data.RData")

# Second labour stage
load("./data/second_stage_data.RData")

# Third labour stage
load("./data/third_stage_data.RData")


## Common-effect and Random-effects subgroup MAs 
# First labour stage
first_res <- metacont(total_HBB, mean_HBB, sd_HBB, total_ctrl, mean_ctrl, sd_ctrl,
                      studlab = study,
                      data = first_stage, 
                      method.tau = "REML",
                      method.random.ci = "HK",
                      method.predict = "HK", 
                      prediction.subgroup = TRUE,
                      subgroup = factor(parity, levels = c("primigravidas", "mixed", "multigravidas")),
                      sm = "MD")

# Save as .tiff
tiff("./Figures/Figure 1.tiff", 
     height = 28, 
     width = 30, 
     units = 'cm', 
     compression = "lzw", 
     res = 300)
forest(first_res, 
       rightcols = c("effect", "ci"),
       print.I2.ci = TRUE,
       print.tau = TRUE,
       print.tau.ci = TRUE,
       print.pval.Q = FALSE,
       subgroup.hetstat = TRUE,
       label.test.subgroup.common = FALSE,
       label.test.subgroup.random = FALSE,
       test.subgroup = FALSE,
       overall.hetstat = FALSE,
       digits.sd = 2,
       digits.tau = 2,
       label.left = "Favours HBB", 
       label.right = "Favours control",
       xlim = c(-190, 100))
dev.off()

# Second labour stage
second_res <- metacont(total_HBB, mean_HBB, sd_HBB, total_ctrl, mean_ctrl, sd_ctrl,
                       studlab = study,
                       data = second_stage, 
                       method.tau = "REML",
                       method.random.ci = "HK",
                       method.predict = "HK", 
                       prediction.subgroup = TRUE,
                       subgroup = factor(parity, levels = c("primigravidas", "mixed", "multigravidas")),
                       sm = "MD")

# Save as .tiff
tiff("./Figures/Figure 2.tiff", 
     height = 28, 
     width = 30, 
     units = 'cm', 
     compression = "lzw", 
     res = 300)
forest(second_res, 
       rightcols = c("effect", "ci"),
       print.I2.ci = TRUE,
       print.tau = TRUE,
       print.tau.ci = TRUE,
       print.pval.Q = FALSE,
       subgroup.hetstat = TRUE,
       label.test.subgroup.common = FALSE,
       label.test.subgroup.random = FALSE,
       test.subgroup = FALSE,
       overall.hetstat = FALSE,
       digits.sd = 2,
       digits.tau = 2,
       label.left = "Favours HBB", 
       label.right = "Favours control",
       xlim = c(-23, 26))
dev.off()

# Third labour stage
third_res <- metacont(total_HBB, mean_HBB, sd_HBB, total_ctrl, mean_ctrl, sd_ctrl,
                      studlab = study,
                      data = third_stage, 
                      method.tau = "REML",
                      method.random.ci = "HK",
                      method.predict = "HK", 
                      prediction.subgroup = TRUE,
                      subgroup = factor(parity, levels = c("primigravidas", "mixed", "multigravidas")),
                      sm = "MD")

# Save as .tiff
tiff("./Figures/Figure 3.tiff", 
     height = 28, 
     width = 30, 
     units = 'cm', 
     compression = "lzw", 
     res = 300)
forest(third_res, 
       rightcols = c("effect", "ci"),
       print.I2.ci = TRUE,
       print.tau = TRUE,
       print.tau.ci = TRUE,
       print.pval.Q = FALSE,
       subgroup.hetstat = TRUE,
       label.test.subgroup.common = FALSE,
       label.test.subgroup.random = FALSE,
       test.subgroup = FALSE,
       overall.hetstat = FALSE,
       digits.sd = 2,
       digits.tau = 2,
       label.left = "Favours HBB", 
       label.right = "Favours control",
       xlim = c(-9.5, 6))
dev.off()

