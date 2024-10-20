# 載入需要套件
install.packages("haven")
install.packages("dplyr")
library(haven)
library(dplyr)
library(ggplot2)
library(plotly)

# 匯入資料，輸出成csv檔
net <- read_sav("D:/iphone/iCloudDrive/碩士班/MDA/report/data.sav")
write.csv(net, file = "D:/iphone/iCloudDrive/碩士班/MDA/report/internet_addiction.csv", row.names = FALSE, fileEncoding = "UTF-8")

# 資料篩選
new_net2 <- net %>%
  filter(q21a_6 == 1 & q21a_6_text == "已讀" & q37a == 5)
write.csv(new_net2, file = "D:/iphone/iCloudDrive/碩士班/MDA/report/internet_addiction_select.csv", row.names = FALSE, fileEncoding = "UTF-8")

new_net_selected <- new_net2 %>%
  select(id, q1, q2, q6_h:q11_88_text, q16:q19_02, q21a_6:q23_05_1, q25_01_1:q29_5_text, q37a)
write.csv(new_net_selected, file = "D:/iphone/iCloudDrive/碩士班/MDA/report/internet_addiction_select2.csv", row.names = FALSE, fileEncoding = "UTF-8")



# 性別編碼
new_net_selected$sex <- ifelse(new_net_selected$q1 == 1, "男", "女")

# 計算每個性別的數量
gender_counts <- table(new_net_selected$sex)

# 創建數據框用於繪圖
gender_df <- data.frame(
  gender = names(gender_counts),
  count = as.numeric(gender_counts)
)

# 計算百分比
gender_df$percentage <- gender_df$count / sum(gender_df$count) * 100

# 創建圓餅圖
ggplot(gender_df, aes(x = "", y = count, fill = gender)) +
  geom_bar(stat = "identity", width = 1) +
  coord_polar("y", start = 0) +
  geom_text(aes(label = sprintf("%.1f%%", percentage)), 
            position = position_stack(vjust = 0.5)) +
  scale_fill_manual(values = c("男" = "skyblue", "女" = "pink")) +
  labs(title = "受訪者性別分布", 
       fill = "性別") +
  theme_void() +
  theme(legend.position = "bottom")

# 打印性別分布的表格
print(gender_df)

# 創建年齡組別
new_net_selected$age_group <- cut(114 - new_net_selected$q2,
                      breaks = c(0, 18, 30, 40, 50, 60, Inf),
                      labels = c("18歲以下", "19-30歲", "31-40歲", "41-50歲", "51-60歲", "61歲以上"),
                      right = FALSE)

# 計算每個年齡組的人數
age_distribution <- new_net_selected %>%
  group_by(age_group) %>%
  summarise(count = n())

# 繪製條形圖
q1 <- ggplot(age_distribution, aes(x = age_group, y = count)) +
  geom_bar(stat = "identity", fill = "skyblue") +
  geom_text(aes(label = count), vjust = -0.5) +
  labs(title = "受訪者年齡分佈",
       x = "年齡組別",
       y = "人數") +
  theme_minimal()
ggplotly(q1)



# 定義計分函數
score_survey <- function(data) {
  
  # q17 計分
  data$q17_score <- ifelse(is.na(data$q17_01) & is.na(data$q17_02), 0,
                           ifelse(data$q17_01 == 1 | data$q17_02 == 1, 3, 0))
  
  # q19 計分
  data$q19_score <- ifelse(is.na(data$q19_01) & is.na(data$q19_02), 0,
                           ifelse(data$q19_01 == 1 | data$q19_02 == 1, 15, 0))
  
  # q22 scoring
  data$q22_score <- rowSums(data[, c("q22_01_1", "q22_02_1", "q22_03_1", "q22_04_1", "q22_05_1")])
  
  # q23 scoring
  data$q23_score <- rowSums(data[, c("q23_01_1", "q23_02_1", "q23_03_1", "q23_04_1", "q23_05_1")]) * 1.3
  
  # q25 scoring
  data$q25_score <- rowSums(data[, c("q25_01_1", "q25_02_1", "q25_03_1", "q25_04_1")]) * 1.3
  
  # q26 scoring
  data$q26_score <- rowSums(data[, c("q26_01_1", "q26_02_1", "q26_03_1")])
  
  # 計算總分
  data$total_score <- data$q17_score + data$q19_score + data$q22_score + 
    data$q23_score + data$q25_score + data$q26_score
  
  return(data)
}

# 對資料套用計分函數
scored_data <- score_survey(new_net_selected)

# 查看結果
summary(scored_data$total_score)


# 找出最低分
min_score <- min(scored_data$total_score, na.rm = TRUE)

# 找出擁有最低分的所有行
lowest_scorers <- scored_data[scored_data$total_score == min_score, ]

# 如果您只想看特定的列，可以這樣做：
# 假設您想看id列（如果有的話）和所有的得分列
columns_to_show <- c("id", "q17_score", "q19_score", "q22_score", "q23_score", "q25_score", "q26_score", "total_score")
print(lowest_scorers[, columns_to_show])


#分類
scored_data$bullying_tendency <- cut(scored_data$total_score, 
                                     breaks = c(-Inf, 44.7, 69.7, 94.7, Inf),
                                     labels = c("無", "低", "中", "高"),
                                     include.lowest = TRUE)

# 查看分类结果
table(scored_data$bullying_tendency)




# 計算理論中點和實際中位數
theoretical_midpoint <- (18.7 + 123) / 2  # 理論範圍的中點
actual_median <- median(scored_data$total_score, na.rm = TRUE)

# 使用理論中點和實際中位數的平均值作為"中"和"高"的分界點
mid_high_cutoff <- (theoretical_midpoint + actual_median) / 2

# 使用這個新的切分點來分類
scored_data$bullying_tendency_compromise <- cut(scored_data$total_score, 
                                                breaks = c(-Inf, actual_median/2, actual_median, mid_high_cutoff, Inf),
                                                labels = c("無", "低", "中", "高"),
                                                include.lowest = TRUE)

# 查看新的分類結果
table(scored_data$bullying_tendency_compromise)

# 打印出具體的分割點
cat("無-低分界點：", actual_median/2, "\n",
    "低-中分界點：", actual_median, "\n",
    "中-高分界點：", mid_high_cutoff, "\n")
