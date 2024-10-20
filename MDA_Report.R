# 載入需要套件
install.packages("haven")
install.packages("dplyr")
library(haven)
library(dplyr)

# 匯入資料，輸出成csv檔
net <- read_sav("D:/iphone/iCloudDrive/碩士班/MDA/report/data.sav")
write.csv(net, file = "D:/iphone/iCloudDrive/碩士班/MDA/report/internet_addiction.csv", row.names = FALSE, fileEncoding = "UTF-8")

# 資料篩選
new_net2 <- net %>%
  filter(q21a_6 == 1 & q21a_6_text == "已讀" & q37a == 5)
write.csv(new_net2, file = "D:/iphone/iCloudDrive/碩士班/MDA/report/internet_addiction_select.csv", row.names = FALSE, fileEncoding = "UTF-8")

new_net_selected <- new_net2 %>%
  select(q1, q2, q6_h:q11_88_text, q16:q19_02, q21a_6:q23_05_1, q25_01_1:q29_5_text, q37a)
write.csv(new_net_selected, file = "D:/iphone/iCloudDrive/碩士班/MDA/report/internet_addiction_select2.csv", row.names = FALSE, fileEncoding = "UTF-8")

# 印出 q9 欄位的值
x <- net
print(x)