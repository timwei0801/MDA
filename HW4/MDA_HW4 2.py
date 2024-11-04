import numpy as np
import matplotlib.pyplot as plt
from scipy import stats
import seaborn as sns

<<<<<<< HEAD
# 設定中文字體和數學符號
plt.rcParams['font.sans-serif'] = ['Microsoft YaHei']   
plt.rcParams['axes.unicode_minus'] = False   
plt.rcParams['mathtext.default'] = 'regular'   

#EX 4.1
=======
#EX 4.1

>>>>>>> 711c7eab9ab43afb7bc4c425d65cca9948764e54
def transform_and_visualize_normal(n_samples=5000):
    # 1. 生成原始的標準常態分佈隨機向量 Y
    Y = np.random.multivariate_normal(
        mean=[0, 0],
        cov=np.eye(2),
        size=n_samples
    )
    
    # 2. 定義轉換參數
    mu = np.array([3, 2])
    Sigma = np.array([[1, -1.5],
                     [-1.5, 4]])
    
    # 3. 計算Σ的平方根
    Sigma_sqrt = np.linalg.cholesky(Sigma)
    
    # 4. 進行轉換得到 X
    X = np.dot(Y, Sigma_sqrt.T) + mu
    
    # 5. 創建視覺化圖表
    plt.figure(figsize=(15, 10))
    
<<<<<<< HEAD
    # 5.1 原始 Y 的散佈圖
    plt.subplot(221)
    plt.scatter(Y[:, 0], Y[:, 1], alpha=0.5, s=1)
    plt.title('原始標準常態分配 Y ~ N(0, I)')
    plt.xlabel('$Y_1$')   
    plt.ylabel('$Y_2$')  
=======
    # 5.1 原始 Y 的散點圖
    plt.subplot(221)
    plt.scatter(Y[:, 0], Y[:, 1], alpha=0.5, s=1)
    plt.title('原始標準常態分佈 Y ~ N(0, I)')
    plt.xlabel('Y₁')
    plt.ylabel('Y₂')
>>>>>>> 711c7eab9ab43afb7bc4c425d65cca9948764e54
    plt.axis('equal')
    
    # 5.2 轉換後 X 的散點圖
    plt.subplot(222)
    plt.scatter(X[:, 0], X[:, 1], alpha=0.5, s=1)
<<<<<<< HEAD
    plt.title('轉換後的分配 X ~ N(μ, Σ)')
    plt.xlabel('$X_1$')  
    plt.ylabel('$X_2$') 
=======
    plt.title('轉換後的分佈 X ~ N(μ, Σ)')
    plt.xlabel('X₁')
    plt.ylabel('X₂')
>>>>>>> 711c7eab9ab43afb7bc4c425d65cca9948764e54
    
    # 5.3 Y 的邊際分佈
    plt.subplot(223)
    for i in range(2):
<<<<<<< HEAD
        sns.kdeplot(data=Y[:, i], label=f'$Y_{i+1}$')  # 使用 LaTeX 格式
    plt.title('Y 的邊際分配')
=======
        sns.kdeplot(data=Y[:, i], label=f'Y_{i+1}')
    plt.title('Y 的邊際密度分佈')
>>>>>>> 711c7eab9ab43afb7bc4c425d65cca9948764e54
    plt.xlabel('值')
    plt.ylabel('密度')
    plt.legend()
    
    # 5.4 X 的邊際分佈
    plt.subplot(224)
    for i in range(2):
<<<<<<< HEAD
        sns.kdeplot(data=X[:, i], label=f'$X_{i+1}$')   
=======
        sns.kdeplot(data=X[:, i], label=f'X_{i+1}')
>>>>>>> 711c7eab9ab43afb7bc4c425d65cca9948764e54
    plt.title('X 的邊際密度分佈')
    plt.xlabel('值')
    plt.ylabel('密度')
    plt.legend()
    
    plt.tight_layout()
    
    # 6. 輸出統計摘要
    print("Y 的統計摘要：")
<<<<<<< HEAD
    print(f"平均值：\n{np.mean(Y, axis=0)}")
    print(f"共變異數矩陣：\n{np.cov(Y.T)}")
    
    print("\nX 的統計摘要：")
    print(f"平均值：\n{np.mean(X, axis=0)}")
    print(f"共變異數矩陣：\n{np.cov(X.T)}")
    
    return Y, X

#EX 5.4
def plot_distributions(n_samples=10000):
    # 設定隨機種子以確保結果可重現
    np.random.seed(42)

    # X的分佈參數
    mu_X = np.array([1, 2])
    sigma_X = np.array([[2, 1],
                        [1, 2]])

    # 生成X的樣本
    X = np.random.multivariate_normal(mu_X, sigma_X, n_samples)

    # 給定X生成Y
    Y = generate_Y_given_X(X)

    # 計算W = X - Y
    W = X - Y

    # 創建圖表
    plt.figure(figsize=(15, 5))

    # 畫X的分佈
    plt.subplot(131)
    plt.scatter(X[:, 0], X[:, 1], alpha=0.5)
    plt.title('X 分配')
    plt.xlabel('$X_1$')  # 使用 LaTeX 格式
    plt.ylabel('$X_2$')  # 使用 LaTeX 格式

    # 畫Y的分佈
    plt.subplot(132)
    plt.scatter(Y[:, 0], Y[:, 1], alpha=0.5)
    plt.title('Y 分配')
    plt.xlabel('$Y_1$')  # 使用 LaTeX 格式
    plt.ylabel('$Y_2$')  # 使用 LaTeX 格式

    # 畫W的分佈
    plt.subplot(133)
    plt.scatter(W[:, 0], W[:, 1], alpha=0.5)
    plt.title('W 分配')
    plt.xlabel('$W_1$')  # 使用 LaTeX 格式
    plt.ylabel('$W_2$')  # 使用 LaTeX 格式

    plt.tight_layout()

    # 驗證W的理論性質
    print("W的樣本均值：", np.mean(W, axis=0))
    print("W的樣本共變異數矩陣：\n", np.cov(W.T))

    return X, Y, W

=======
    print(f"均值：\n{np.mean(Y, axis=0)}")
    print(f"協方差矩陣：\n{np.cov(Y.T)}")
    
    print("\nX 的統計摘要：")
    print(f"均值：\n{np.mean(X, axis=0)}")
    print(f"協方差矩陣：\n{np.cov(X.T)}")
    
    return Y, X

# 執行程式
Y, X = transform_and_visualize_normal()
plt.show()

#EX 5.4
import numpy as np
import matplotlib.pyplot as plt
import seaborn as sns
from scipy import stats

# 設定隨機種子以確保結果可重現
np.random.seed(42)

# 參數設定
n_samples = 10000

# X的分佈參數
mu_X = np.array([1, 2])
sigma_X = np.array([[2, 1],
                    [1, 2]])

# 生成X的樣本
X = np.random.multivariate_normal(mu_X, sigma_X, n_samples)

# 給定X生成Y的條件分佈
>>>>>>> 711c7eab9ab43afb7bc4c425d65cca9948764e54
def generate_Y_given_X(X):
    n = X.shape[0]
    mu_Y = np.column_stack((X[:, 0], X[:, 0] + X[:, 1]))  # [X₁, X₁+X₂]
    sigma_Y = np.array([[1, 0],
                        [0, 1]])
    
    # 對每個X生成對應的Y
    Y = np.zeros((n, 2))
    for i in range(n):
        Y[i] = np.random.multivariate_normal(mu_Y[i], sigma_Y)
    return Y

<<<<<<< HEAD
def plot_Y2_given_Y1(Y):
=======
# 生成Y的樣本
Y = generate_Y_given_X(X)

# 計算W = X - Y
W = X - Y

# 創建圖表
plt.figure(figsize=(15, 5))

# 畫X的分佈
plt.subplot(131)
plt.scatter(X[:, 0], X[:, 1], alpha=0.5)
plt.title('X Distribution')
plt.xlabel('X₁')
plt.ylabel('X₂')

# 畫Y的分佈
plt.subplot(132)
plt.scatter(Y[:, 0], Y[:, 1], alpha=0.5)
plt.title('Y Distribution')
plt.xlabel('Y₁')
plt.ylabel('Y₂')

# 畫W的分佈
plt.subplot(133)
plt.scatter(W[:, 0], W[:, 1], alpha=0.5)
plt.title('W Distribution')
plt.xlabel('W₁')
plt.ylabel('W₂')

plt.tight_layout()

# 驗證W的理論性質
print("W的樣本均值：", np.mean(W, axis=0))
print("W的樣本協方差矩陣：\n", np.cov(W.T))

# 驗證Y₂|Y₁的條件分佈
def plot_Y2_given_Y1():
>>>>>>> 711c7eab9ab43afb7bc4c425d65cca9948764e54
    plt.figure(figsize=(10, 5))
    
    # 選擇一個Y₁的值進行條件化
    y1_value = 1.0
    mask = np.abs(Y[:, 0] - y1_value) < 0.1
    
    # 繪製直方圖
    plt.hist(Y[mask, 1], bins=30, density=True, alpha=0.7)
    
    # 繪製理論密度函數
    y2_range = np.linspace(min(Y[mask, 1]), max(Y[mask, 1]), 100)
    theoretical_density = stats.norm.pdf(y2_range, loc=y1_value + 2, scale=np.sqrt(3))
<<<<<<< HEAD
    plt.plot(y2_range, theoretical_density, 'r-', label='理論分配')
    
    plt.title(f'$Y_2|Y_1={y1_value}$ 的分配')  
    plt.xlabel('$Y_2$') 
    plt.ylabel('密度')
    plt.legend()

def analyze_conditional_distribution(Y):
=======
    plt.plot(y2_range, theoretical_density, 'r-', label='Theoretical')
    
    plt.title(f'Distribution of Y₂|Y₁={y1_value}')
    plt.xlabel('Y₂')
    plt.ylabel('Density')
    plt.legend()

plot_Y2_given_Y1()

# 顯示所有圖表
plt.show()

# 計算Y₂|Y₁的條件均值和方差
def analyze_conditional_distribution():
>>>>>>> 711c7eab9ab43afb7bc4c425d65cca9948764e54
    # 選擇幾個不同的Y₁值
    y1_values = np.linspace(-2, 4, 7)
    results = []
    
    for y1 in y1_values:
        mask = np.abs(Y[:, 0] - y1) < 0.1
        if np.sum(mask) > 30:  # 確保有足夠的樣本
            conditional_mean = np.mean(Y[mask, 1])
            conditional_var = np.var(Y[mask, 1])
            results.append({
                'Y₁': y1,
                'Empirical Mean': conditional_mean,
                'Theoretical Mean': y1 + 2,
                'Empirical Variance': conditional_var,
                'Theoretical Variance': 3
            })
    
    return results

<<<<<<< HEAD
# 執行所有分析
if __name__ == "__main__":
    # 執行 EX 4.1
    Y, X = transform_and_visualize_normal()
    plt.show()

    # 執行 EX 5.4
    X, Y, W = plot_distributions()
    plt.show()

    # 繪製條件分佈
    plot_Y2_given_Y1(Y)
    plt.show()

    # 分析條件分佈
    results = analyze_conditional_distribution(Y)
    print("\nY₂|Y₁ 條件分佈分析：")
    for r in results:
        print(f"\nY₁ = {r['Y₁']:.2f}")
        print(f"平均值：實際 = {r['Empirical Mean']:.2f}, 理論 = {r['Theoretical Mean']:.2f}")
        print(f"變異數：實際 = {r['Empirical Variance']:.2f}, 理論 = {r['Theoretical Variance']:.2f}")
=======
# 印出條件分佈分析結果
results = analyze_conditional_distribution()
print("\nY₂|Y₁ 條件分佈分析：")
for r in results:
    print(f"\nY₁ = {r['Y₁']:.2f}")
    print(f"均值：實際 = {r['Empirical Mean']:.2f}, 理論 = {r['Theoretical Mean']:.2f}")
    print(f"方差：實際 = {r['Empirical Variance']:.2f}, 理論 = {r['Theoretical Variance']:.2f}")
>>>>>>> 711c7eab9ab43afb7bc4c425d65cca9948764e54
