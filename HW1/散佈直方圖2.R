<<<<<<< HEAD
# 安裝並載入所需套件
install.packages("corrplot")
library(corrplot)

# 繪製相關矩陣圖
corrplot(cor_matrix, 
         method = "color",  # 使用顏色來表示相關性
         type = "upper",  # 只顯示矩陣的上半部
         tl.col = "black",  # 標籤顏色
         tl.srt = 45,  # 旋轉標籤
         addCoef.col = "black",  # 在圖上顯示相關係數
         col = colorRampPalette(c("red", "white", "blue"))(200))  # 設定顏色漸層
=======
# 安裝並載入所需套件
install.packages("corrplot")
library(corrplot)

# 繪製相關矩陣圖
corrplot(cor_matrix, 
         method = "color",  # 使用顏色來表示相關性
         type = "upper",  # 只顯示矩陣的上半部
         tl.col = "black",  # 標籤顏色
         tl.srt = 45,  # 旋轉標籤
         addCoef.col = "black",  # 在圖上顯示相關係數
         col = colorRampPalette(c("red", "white", "blue"))(200))  # 設定顏色漸層
>>>>>>> af61e9e0744faedb2b28329fc70677fff6958f7b
