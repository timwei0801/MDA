import numpy as np

def transform_normal_vector(n_samples=1000):
    # 步驟1：生成標準常態分佈隨機向量 Y
    Y = np.random.multivariate_normal(
        mean=[0, 0],
        cov=np.eye(2),
        size=n_samples
    )
    
    # 步驟2：定義目標參數
    mu = np.array([3, 2])
    Sigma = np.array([[1, -1.5],
                     [-1.5, 4]])
    
    # 步驟3：計算Σ的平方根（使用Cholesky分解）
    Sigma_sqrt = np.linalg.cholesky(Sigma)
    
    # 步驟4：進行轉換 X = Σ^(1/2)Y + μ
    X = np.dot(Y, Sigma_sqrt.T) + mu
    
    return X

# 生成並驗證結果
X = transform_normal_vector()

# 驗證結果
print("生成的X的實際均值：")
print(np.mean(X, axis=0))
print("\n生成的X的實際共變異數矩陣：")
print(np.cov(X.T))