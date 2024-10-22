library(ggplot2)
library(plotly)
library(dplyr)
library(htmlwidgets)  # ???入 htmlwidgets 包
Cereal <- read.csv(file = "C:/Users/Trident/Downloads/Cereal.csv")

# 定??????量名???
variables <- c("Calories", "Protein", "Fat", "Sodium", "Fiber", "Carbohydrates", "Sugar", "Potassium")

# 假???有四???制造商，确保???里有四??????色
colors <- c("#E69F00", "#0072B2", "#F0E442", "#56B4E9")

# 使用 for 循???生成并???示每??????量的箱型???
for (var in variables) {
  summary_stats <- Cereal %>%
    group_by(Manufacturer) %>%
    summarize(
      Q1 = quantile(get(var), 0.25),
      Median = median(get(var)),
      Q3 = quantile(get(var), 0.75),
      .groups = 'drop'
    )
  
  P1 <- ggplot(Cereal, aes_string(x = "Manufacturer", y = var, fill = "Manufacturer")) +
    stat_boxplot(geom = "errorbar", width = 0.15, aes(color = "black")) +
    geom_boxplot(size = 0.5, outlier.fill = "white", outlier.color = "white") +
    geom_jitter(aes(fill = "Manufacturer"), width = 0.2, shape = 21, size = 2.5) +
    scale_fill_manual(values = colors) +  # 使用修正后的???色向量
    scale_color_manual(values = c("black")) +  # 使用黑色作????????????色
    ggtitle(paste(var, "Distribution by Manufacturer")) +  # 更改??????以???示???前???量
    theme_bw() +
    theme(legend.position = "none",
          axis.text.x = element_text(colour = "black", family = "Times", size = 14),
          axis.text.y = element_text(family = "Times", size = 14, face = "plain"),
          axis.title.y = element_text(family = "Times", size = 14, face = "plain"),
          axis.title.x = element_text(family = "Times", size = 14, face = "plain"),
          plot.title = element_text(family = "Times", size = 15, face = "bold", hjust = 0.5),
          panel.grid.major = element_blank(),
          panel.grid.minor = element_blank()) +
    ylab(var) + xlab("Manufacturer")  # 交??? x 和 y ???的??????
  
  # ????????? plotly
  plotly_p <- ggplotly(P1)
  
  # 保存???表??? HTML 文件
  saveWidget(plotly_p, file = paste0(var, "_boxplot.html"), selfcontained = TRUE)
  
  # ???示???表
  print(plotly_p)
}
