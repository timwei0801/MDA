<<<<<<< HEAD
# ���J�һݪ��M��
library(plotly)

# �w�q�ܼƦW��
variables <- c("Calories", "Protein", "Fat", "Sodium", "Fiber", "Carbohydrates", "Sugar", "Potassium")

# �ϥ� plotly �M��Ыؤ��ʦ����G�ϯx�}
fig <- plot_ly(
  data = Cereal, 
  type = 'splom',  # scatterplot matrix
  dimensions = lapply(variables, function(var) list(label = var, values = Cereal[[var]])),  # �]�w�C�Ӻ��ת����ҩM�ƭ�
  color = ~Manufacturer,  # �Τ��P�C����� Manufacturer
  colors = c("#E69F00", "#0072B2", "#F0E442", "#56B4E9"),  # �ۭq�C��
  marker = list(opacity = 0.7, size = 5)  # �վ�аO���z���שM�j�p
)

# �]�w layout �˦�
fig <- fig %>% layout(
  title = "Scatterplot Matrix of Cereal Dataset",
  dragmode = "select",  # �䴩����I���ϰ�
  hovermode = "closest"  # ��̪ܳ��I���
)

# ��ܹϪ�
fig
=======
# ���J�һݪ��M��
library(plotly)

# �w�q�ܼƦW��
variables <- c("Calories", "Protein", "Fat", "Sodium", "Fiber", "Carbohydrates", "Sugar", "Potassium")

# �ϥ� plotly �M��Ыؤ��ʦ����G�ϯx�}
fig <- plot_ly(
  data = Cereal, 
  type = 'splom',  # scatterplot matrix
  dimensions = lapply(variables, function(var) list(label = var, values = Cereal[[var]])),  # �]�w�C�Ӻ��ת����ҩM�ƭ�
  color = ~Manufacturer,  # �Τ��P�C����� Manufacturer
  colors = c("#E69F00", "#0072B2", "#F0E442", "#56B4E9"),  # �ۭq�C��
  marker = list(opacity = 0.7, size = 5)  # �վ�аO���z���שM�j�p
)

# �]�w layout �˦�
fig <- fig %>% layout(
  title = "Scatterplot Matrix of Cereal Dataset",
  dragmode = "select",  # �䴩����I���ϰ�
  hovermode = "closest"  # ��̪ܳ��I���
)

# ��ܹϪ�
fig
