<<<<<<< HEAD
# 安裝並載入所需套件
install.packages("psych")
library(psych)

# 載入 Cereal 資料集
Cereal <- read.csv("C:/Users/Trident/Downloads/Cereal.csv")

# 定義變數名稱
variables <- c("Calories", "Protein", "Fat", "Sodium", "Fiber", "Carbohydrates", "Sugar", "Potassium")

# 計算相關矩陣
cor_matrix <- cor(Cereal[variables], use = "complete.obs", method = "pearson")

# 使用 psych 套件的 pairs.panels 函數生成相關矩陣的散佈圖矩陣
pairs.panels(Cereal[variables], 
             method = "pearson",  # 使用皮爾森相關係數
             hist.col = "#0072B2",  # 直方圖顏色
             density = TRUE,  # 顯示密度圖
             ellipses = FALSE)  # 顯示相關係數橢圓
=======
# 安裝並載入所需套件
install.packages("psych")
library(psych)

# 載入 Cereal 資料集
Cereal <- read.csv("C:/Users/Trident/Downloads/Cereal.csv")

# 定義變數名稱
variables <- c("Calories", "Protein", "Fat", "Sodium", "Fiber", "Carbohydrates", "Sugar", "Potassium")

# 計算相關矩陣
cor_matrix <- cor(Cereal[variables], use = "complete.obs", method = "pearson")

# 使用 psych 套件的 pairs.panels 函數生成相關矩陣的散佈圖矩陣
pairs.panels(Cereal[variables], 
             method = "pearson",  # 使用皮爾森相關係數
             hist.col = "#0072B2",  # 直方圖顏色
             density = TRUE,  # 顯示密度圖
             ellipses = FALSE)  # 顯示相關係數橢圓
>>>>>>> af61e9e0744faedb2b28329fc70677fff6958f7b
