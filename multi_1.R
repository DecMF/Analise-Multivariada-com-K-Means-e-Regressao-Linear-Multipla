# Carregar Pacotes
library(tidyverse)
library(stats)
library(MASS)

# Definindo Dados

r_a = c(17.13087, 21.40235, 24.22354, 38.54694, 24.09162, 36.31916, 22.09071, 31.91283, 26.71929, 23.89744, 36.73820,
        38.20071, 29.18035, 39.97168, 19.39369, 31.96854, 27.42179, 19.68138, 23.40531, 30.14422, 27.83935, 38.44936,
        32.37036, 36.10409, 18.70615, 32.91652, 38.11601, 30.71973, 35.11532, 34.03324, 27.65900, 20.36213, 37.89952,
        23.32823, 27.97522, 39.93590, 33.17181, 27.47213, 33.96793, 29.23795, 34.08442, 19.59525, 20.58984, 22.86157,
        28.71570, 29.96901, 20.88576, 33.88267, 26.08635, 31.88401, 28.12600, 28.40303)

r_b =  c(15.16909, 13.46305, 13.74818, 21.39652, 16.32746, 26.20112, 25.29943, 25.82549, 14.02215, 18.11615, 24.81233,
         25.65047, 23.87692, 23.14577, 15.61093, 19.74803, 15.82073, 15.36736, 25.33622, 20.11305, 23.52866, 18.32439,
         13.10876, 22.33925, 15.90406, 27.10742, 19.30921, 30.58971, 18.52731, 26.94241, 19.20278, 15.30322, 17.75322,
         19.45882, 11.86465, 23.95710, 22.88543, 16.70779, 21.25639, 21.01987, 27.38570, 18.74284, 16.20574, 17.70149,
         13.75935, 22.37057, 14.51605, 29.46995, 23.55479, 31.58590, 20.57899, 18.82234)

r_c = c(6.007051, 3.505165, 5.022704, 11.885706, 5.915860, 11.146395, 6.719759, 7.733608, 5.736007, 6.495075,
        11.322076, 6.167648, 10.354384, 12.707518, 4.738696, 9.674910, 3.651710, 6.610971, 7.904265, 3.201605,
        7.961362, 7.822629, 4.404515, 12.555128, 5.286439, 13.199291, 6.927515, 11.607751, 4.171373, 4.559400,
        10.745227, 5.435730, 6.970311, 7.962732, 6.362370, 16.033917, 5.644065, 5.244830, 7.337431, 7.432595,
        10.942459, 7.844839, 5.018083, 12.392008, 5.795332, 9.950286, 5.132434, 8.496437, 9.571182, 3.693258,
        7.915590, 7.190381)

r_d = c(5.887234, 7.797140, 5.189674, 14.202700, 6.708954, 10.708584, 12.597330, 6.771208, 5.195268, 7.929868,
        10.874644, 6.377179, 6.448913, 15.626393, 4.906410, 9.384883, 5.873840, 4.611568, 9.939804, 10.920765,
        8.989717, 7.259071, 5.537121, 2.766546, 6.369816, 7.113136, 9.643912, 7.647996, 7.091856, 8.980649,
        14.416337, 6.286290, 5.967490, 7.020644, 6.211810, 5.583947, 10.098448, 4.950978, 9.898268, 8.228289,
        3.789593, 7.226943, 6.666694, 6.696794, 5.839212, 7.054172, 5.389538, 9.997831, 10.758728, 11.269388,
        10.386268, 8.720999)

r_ex = c(112.7716, 140.5799, 139.9354, 232.4273, 143.9355, 227.5361, 202.0473, 188.7598, 144.6669, 172.6299, 214.4873,
         209.0082, 184.4350, 237.5675, 125.3697, 190.4451, 147.4085, 123.5808, 189.1598, 182.7758, 193.8825, 193.2147,
         148.8900, 173.9370, 138.2149, 199.0520, 197.0823, 217.8537, 182.8615, 212.5775, 206.0930, 134.2192, 173.2455,
         158.1172, 151.7593, 215.3895, 199.5782, 145.9958, 204.7168, 182.9799, 196.8018, 141.4695, 148.8366, 153.8180,
         149.8392, 189.6488, 138.0155, 231.2470, 194.4780, 230.0494, 177.0058, 175.2229)
#Data Frame Consolidado
dados <- data.frame(cbind(r_a,r_b,r_c,r_d,r_ex))
dados



kmeans_result <- kmeans(dados, centers =4)

clusters <- kmeans_result$cluster

# Visualização
print(kmeans_result$centers)

print(clusters)

# Visualize os resultados da clusterização
library(cluster)
clusplot(dados, clusters, color=TRUE, shade=TRUE,
         labels=2, lines=0)


##### Grupos com K means

# Selecione as variáveis independentes para a clusterização
variaveis_independentes <- dados[, c("r_a","r_b","r_c","r_d")]

# Aplique o algoritmo K-Means para clusterização
num_clusters <- 4 
resultado_kmeans <- kmeans(variaveis_independentes, centers = num_clusters)

# Adicione o vetor de grupos ao dataframe original
dados$Grupos_KMeans <- resultado_kmeans$cluster

# Ajuste um modelo de regressão multivariada para o conjunto de dados
modelo_reg_mult_completo <- lm(r_ex ~ r_a+r_b+r_c+r_d + Grupos_KMeans, data = dados)

# Resumo do modelo
summary(modelo_reg_mult_completo)



# Dividindo o dataframe em subconjuntos com base no valor de Grupos_KMeans
subconjuntos <- split(dados, dados$Grupos_KMeans)

# Ajuste um modelo de regressão multivariada para cada subconjunto
modelos_reg_mult_por_grupo <- lapply(subconjuntos, function(subconjunto) {
  lm(r_ex ~ r_a+r_b+r_c+r_d, data = subconjunto)
})

# Resumo dos modelos para cada grupo
resultados_modelos <- lapply(modelos_reg_mult_por_grupo, summary)

resultados_modelos

