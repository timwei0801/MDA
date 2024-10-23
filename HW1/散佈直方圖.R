<<<<<<< HEAD
# 載入所需的套件
library(plotly)

# 定義變數名稱
variables <- c("Calories", "Protein", "Fat", "Sodium", "Fiber", "Carbohydrates", "Sugar", "Potassium")

# 使用 plotly 套件創建互動式散佈圖矩陣
fig <- plot_ly(
  data = Cereal, 
  type = 'splom',  # scatterplot matrix
  dimensions = lapply(variables, function(var) list(label = var, values = Cereal[[var]])),  # 設定每個維度的標籤和數值
  color = ~Manufacturer,  # 用不同顏色表示 Manufacturer
  colors = c("#E69F00", "#0072B2", "#F0E442", "#56B4E9"),  # 自訂顏色
  marker = list(opacity = 0.7, size = 5)  # 調整標記的透明度和大小
)

# 設定 layout 樣式
fig <- fig %>% layout(
  title = "Scatterplot Matrix of Cereal Dataset",
  dragmode = "select",  # 支援選擇點擊區域
  hovermode = "closest"  # 顯示最近的點資料
)

# 顯示圖表
fig
=======
# 載入所需的套件
library(plotly)

# 定義變數名稱
variables <- c("Calories", "Protein", "Fat", "Sodium", "Fiber", "Carbohydrates", "Sugar", "Potassium")

# 使用 plotly 套件創建互動式散佈圖矩陣
fig <- plot_ly(
  data = Cereal, 
  type = 'splom',  # scatterplot matrix
  dimensions = lapply(variables, function(var) list(label = var, values = Cereal[[var]])),  # 設定每個維度的標籤和數值
  color = ~Manufacturer,  # 用不同顏色表示 Manufacturer
  colors = c("#E69F00", "#0072B2", "#F0E442", "#56B4E9"),  # 自訂顏色
  marker = list(opacity = 0.7, size = 5)  # 調整標記的透明度和大小
)

# 設定 layout 樣式
fig <- fig %>% layout(
  title = "Scatterplot Matrix of Cereal Dataset",
  dragmode = "select",  # 支援選擇點擊區域
  hovermode = "closest"  # 顯示最近的點資料
)

# 顯示圖表
fig
>>>>>>> af61e9e0744faedb2b28329fc70677fff6958f7b
