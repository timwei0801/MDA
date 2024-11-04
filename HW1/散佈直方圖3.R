<<<<<<< HEAD
# �w�˨ø��J�һݮM��
install.packages("psych")
library(psych)

# ���J Cereal ��ƶ�
Cereal <- read.csv("C:/Users/Trident/Downloads/Cereal.csv")

# �w�q�ܼƦW��
variables <- c("Calories", "Protein", "Fat", "Sodium", "Fiber", "Carbohydrates", "Sugar", "Potassium")

# �p������x�}
cor_matrix <- cor(Cereal[variables], use = "complete.obs", method = "pearson")

# �ϥ� psych �M�� pairs.panels ��ƥͦ������x�}�����G�ϯx�}
pairs.panels(Cereal[variables], 
             method = "pearson",  # �ϥΥֺ��ˬ����Y��
             hist.col = "#0072B2",  # ������C��
             density = TRUE,  # ��ܱK�׹�
             ellipses = FALSE)  # ��ܬ����Y�ƾ��
=======
# �w�˨ø��J�һݮM��
install.packages("psych")
library(psych)

# ���J Cereal ��ƶ�
Cereal <- read.csv("C:/Users/Trident/Downloads/Cereal.csv")

# �w�q�ܼƦW��
variables <- c("Calories", "Protein", "Fat", "Sodium", "Fiber", "Carbohydrates", "Sugar", "Potassium")

# �p������x�}
cor_matrix <- cor(Cereal[variables], use = "complete.obs", method = "pearson")

# �ϥ� psych �M�� pairs.panels ��ƥͦ������x�}�����G�ϯx�}
pairs.panels(Cereal[variables], 
             method = "pearson",  # �ϥΥֺ��ˬ����Y��
             hist.col = "#0072B2",  # ������C��
             density = TRUE,  # ��ܱK�׹�
             ellipses = FALSE)  # ��ܬ����Y�ƾ��
