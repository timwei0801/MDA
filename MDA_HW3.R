library(dplyr)
library(ggplot2)

# EX 3.4
car <- read.csv("D:/iphone/iCloudDrive/碩士班/MDA/HW3/carc.csv")

cov(car$Mileage, car$Weight)

#EX 3.25
bank <- read.csv("D:/iphone/iCloudDrive/碩士班/MDA/HW3/swiss bank notes.csv")

# 移除type欄位並轉換為矩陣
X <- as.matrix(bank[, -1])  # 移除第一欄的type標籤

# 1. 計算共變異數矩陣
S <- cov(X)
print("共變異數矩陣：")
print(S)

# 2. 計算Jordan分解
eigen_decomp <- eigen(S)
eigenvalues <- eigen_decomp$values
eigenvectors <- eigen_decomp$vectors


print("特徵值：")
print(eigenvalues)
  
print("特徵值 Λ (Lambda):")
print(eigenvalues)

print("特徵向量矩陣 P:")
print(eigenvectors)
t(eigenvectors)

# 驗證分解
# 建立對角矩陣 Λ
Lambda <- diag(eigenvalues)

# 計算 PΛP^T
reconstructed_S <- eigenvectors %*% Lambda %*% t(eigenvectors)
print("重構的協方差矩陣 (PΛP^T):")
print(reconstructed_S)

#EX 3.36
# 定義轉換向量a
a <- c(1,1,1,1,1,1)

# 計算轉換後的共變異數
transformed_cov <- t(a) %*% S %*% a
print(transformed_cov)
