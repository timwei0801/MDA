import pandas as pd
import numpy as np
from numpy import linalg as LA
import matplotlib.pyplot as plt
import seaborn as sns


#EX 3.4
# 讀取資料集
df = pd.read_csv('D:/iphone/iCloudDrive/碩士班/MDA/HW3/carc.csv')

# 計算共變異數和 相關係數
covariance = df.loc[:, 'Mileage'].cov(df.loc[:, 'Weight'])
correlation = df.loc[:, 'Mileage'].corr(df.loc[:, 'Weight'])

print(f"\n共變異數：{covariance:.2f}")
print(f"相關係數：{correlation:.2f}")


# 繪製散佈圖
plt.figure(figsize=(10, 6))
sns.scatterplot(data=df, x='Weight', y='Mileage')
plt.title('Weight and Mileage consumption scatter chart')
plt.xlabel('Weight')
plt.ylabel('Mileage')

# 添加趨勢線
x = df['Weight']
y = df['Mileage']
z = np.polyfit(x, y, 1)
p = np.poly1d(z)
plt.plot(x, p(x), "r--", alpha=0.8)

plt.savefig('mileage_weight_relationship.png')
plt.close()

#EX 3.25
# 讀取數據
data = pd.read_csv('D:/iphone/iCloudDrive/碩士班/MDA/HW3/swiss bank notes.csv')

# 只選擇數值型特徵（排除 'type' 欄位）
features = ['length', 'left', 'right', 'bottom', 'top', 'diag']
X = data[features]

# 計算共變異數矩陣
S = np.cov(X.T)

# 計算特徵值和特徵向量
eigenvalues, eigenvectors = LA.eig(S)

# 排序特徵值和特徵向量
idx = eigenvalues.argsort()[::-1]
eigenvalues = eigenvalues[idx]
eigenvectors = eigenvectors[:,idx]

print("共變異數矩陣：")
print(pd.DataFrame(S, columns=features, index=features))
print("\n特徵值：")
print(eigenvalues)
print("\n特徵向量：")
print(pd.DataFrame(eigenvectors, columns=[f"PC{i+1}" for i in range(len(features))], index=features))


#EX 3.26
# 使用向量 a = (1,1,1,1,1,1)ᵀ 進行線性轉換
a = np.ones(len(features))
<<<<<<< HEAD
transformed_var = a.T @ S @ a   
=======
transformed_var = a.T @ S @ a
>>>>>>> 711c7eab9ab43afb7bc4c425d65cca9948764e54

print("\n使用向量 a=(1,1,1,1,1,1)ᵀ 線性轉換後的變異數：")
print(transformed_var)

# 繪製共變異數矩陣熱圖
plt.figure(figsize=(10, 8))
sns.heatmap(pd.DataFrame(S), annot=True, cmap='coolwarm', center=0)
plt.title('Covariance matrix heatmap')
plt.savefig('covariance_heatmap.png')
plt.close()

# 解釋特徵值為何都是正的
print("\n為什麼特徵值都是正的？")
print("1. 協方差矩陣是對稱矩陣（symmetric matrix）")
print("2. 協方差矩陣是半正定的（positive semi-definite），因為對任何非零向量 v，v^T S v ≥ 0")
print("3. 這表示任何線性組合的變異數都必須是非負的")
print("4. 在實際數據中，由於變數之間存在線性獨立性，協方差矩陣是正定的（positive definite）")
print("5. 正定矩陣的所有特徵值都是正的")