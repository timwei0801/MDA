<<<<<<< HEAD
install.packages("tidyverse")
install.packages("car")
install.packages("rstatix")
library(tidyverse)
library(car)
library(rstatix)

# 選擇所有數值變數
numeric_vars <- Cereal %>%
  select(where(is.numeric)) %>%
  names()

print(numeric_vars)

# 創建一個函數來執行分析
analyze_variable <- function(var) {
  formula <- as.formula(paste(var, "~ Manufacturer"))
  
  # Welch's ANOVA
  welch_result <- oneway.test(formula, data = Cereal, var.equal = FALSE)
  
  # Kruskal-Wallis test
  kruskal_result <- kruskal.test(formula, data = Cereal)
  
  # 描述性統計
  desc_stats <- Cereal %>%
    group_by(Manufacturer) %>%
    summarise(
      Mean = mean(!!sym(var)),
      SD = sd(!!sym(var)),
      Median = median(!!sym(var)),
      IQR = IQR(!!sym(var))
    )
  
  list(
    Variable = var,
    Welch_ANOVA = welch_result,
    Kruskal_Wallis = kruskal_result,
    Descriptive_Stats = desc_stats
  )
}

# 對每個數值變數執行分析
results <- map(numeric_vars, analyze_variable)

# 打印結果
for (r in results) {
  cat("\n\n===", r$Variable, "===\n")
  cat("\nWelch's ANOVA:\n")
  print(r$Welch_ANOVA)
  cat("\nKruskal-Wallis Test:\n")
  print(r$Kruskal_Wallis)
  cat("\nDescriptive Statistics:\n")
  print(r$Descriptive_Stats)
}

# 創建一個總結表格
summary_table <- map_dfr(results, function(r) {
  tibble(
    Variable = r$Variable,
    Welch_p_value = r$Welch_ANOVA$p.value,
    Kruskal_p_value = r$Kruskal_Wallis$p.value
  )
})

# 打印總結表格
print(summary_table)

# 可視化
library(ggplot2)

for (var in numeric_vars) {
  p <- ggplot(Cereal, aes(x = Manufacturer, y = !!sym(var))) +
    geom_boxplot() +
    labs(title = paste("Distribution of", var, "by Manufacturer"),
         y = var) +
    theme_minimal()
  
  print(p)
=======
install.packages("tidyverse")
install.packages("car")
install.packages("rstatix")
library(tidyverse)
library(car)
library(rstatix)

# 選擇所有數值變數
numeric_vars <- Cereal %>%
  select(where(is.numeric)) %>%
  names()

print(numeric_vars)

# 創建一個函數來執行分析
analyze_variable <- function(var) {
  formula <- as.formula(paste(var, "~ Manufacturer"))
  
  # Welch's ANOVA
  welch_result <- oneway.test(formula, data = Cereal, var.equal = FALSE)
  
  # Kruskal-Wallis test
  kruskal_result <- kruskal.test(formula, data = Cereal)
  
  # 描述性統計
  desc_stats <- Cereal %>%
    group_by(Manufacturer) %>%
    summarise(
      Mean = mean(!!sym(var)),
      SD = sd(!!sym(var)),
      Median = median(!!sym(var)),
      IQR = IQR(!!sym(var))
    )
  
  list(
    Variable = var,
    Welch_ANOVA = welch_result,
    Kruskal_Wallis = kruskal_result,
    Descriptive_Stats = desc_stats
  )
}

# 對每個數值變數執行分析
results <- map(numeric_vars, analyze_variable)

# 打印結果
for (r in results) {
  cat("\n\n===", r$Variable, "===\n")
  cat("\nWelch's ANOVA:\n")
  print(r$Welch_ANOVA)
  cat("\nKruskal-Wallis Test:\n")
  print(r$Kruskal_Wallis)
  cat("\nDescriptive Statistics:\n")
  print(r$Descriptive_Stats)
}

# 創建一個總結表格
summary_table <- map_dfr(results, function(r) {
  tibble(
    Variable = r$Variable,
    Welch_p_value = r$Welch_ANOVA$p.value,
    Kruskal_p_value = r$Kruskal_Wallis$p.value
  )
})

# 打印總結表格
print(summary_table)

# 可視化
library(ggplot2)

for (var in numeric_vars) {
  p <- ggplot(Cereal, aes(x = Manufacturer, y = !!sym(var))) +
    geom_boxplot() +
    labs(title = paste("Distribution of", var, "by Manufacturer"),
         y = var) +
    theme_minimal()
  
  print(p)
>>>>>>> af61e9e0744faedb2b28329fc70677fff6958f7b
}