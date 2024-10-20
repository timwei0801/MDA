#載入需要套件
install.packages("haven")
library(haven)
library(dplyr)

#匯入資料，輸出成csv檔
net <- read_sav("D:\\iphone\\iCloudDrive\\碩士班\\MDA\\report/D00224_2 (1)\\data.sav")
write.csv(net, file = "D:\\iphone\\iCloudDrive\\碩士班\\MDA\\report\\網路成癮.csv", row.names = FALSE, fileEncoding = "UTF-8")

#資料篩選
new_net2 <- net %>%
  filter(q21a_6 == 1 & q21a_6_text == "已讀" & q37a == 5)
write.csv(new_net2, file = "D:\\iphone\\iCloudDrive\\碩士班\\MDA\\report\\網路成癮(篩選）.csv", row.names = FALSE, fileEncoding = "UTF-8")


new_net_selected <- new_net %>%
  select(q1, q2, q6_h:q11_88_text , q16:q19_02, q21a_6:q23_05_1
         , q25_01_1:q29_5_text, q37a)


  



