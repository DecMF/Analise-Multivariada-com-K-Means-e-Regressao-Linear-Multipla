# Análise Multivariada com K-Means e Regressão Linear Múltipla

## Descrição
Este projeto realiza uma análise aprofundada da atividade inibitória de compostos químicos contra a enzima 5-lipoxigenase (5-LOX), associada a várias condições inflamatórias. Usamos técnicas de:
- **Clusterização K-means** para agrupar compostos por características estruturais.
- **Regressão Linear Múltipla** para modelar a relação entre propriedades moleculares e atividade biológica.

---

##  Metodologia
### 1. **Clusterização K-means**
- Agrupamento de compostos baseado em descritores moleculares.
- Testamos valores de k = 2, 3 e 4, avaliando a separação dos clusters com o índice de silhueta.

### 2. **Modelagem QSAR**
- Utilizamos regressão linear múltipla para prever a atividade inibitória (log(1/IC50)) dos compostos.
- Modelo ajustado com método de Mínimos Quadrados Ordinários (OLS).

### 3. **Validação**
- Conjuntos de treinamento e teste separados (80%-20%).
- Validação cruzada e y-randomização com 10.000 simulações para robustez.

---

##  Resultados Principais
- **K-means**: Melhor desempenho com k=2, refletindo dois clusters bem definidos.
- **Modelo QSAR**: Elevada capacidade preditiva com R² de 0.7974, validado em múltiplas técnicas.
- **Descritores Significativos**: ra e rd mostram forte associação com a atividade inibitória.

---

##  Conclusões
- O modelo QSAR desenvolvido demonstra potencial preditivo relevante para novos inibidores da 5-LOX.
- A clusterização K-means foi eficaz na preparação de conjuntos de treinamento e teste representativos.
- Sugestões incluem expandir o conjunto de dados e explorar técnicas não-lineares como redes neurais.


## 📚 Referências
- Andrada, M. F., et al. "Application of k-means clustering, linear discriminant analysis and multivariate linear regression for the development of a predictive QSAR model on 5-lipoxygenase inhibitors." *Chemometrics and Intelligent Laboratory Systems* (2015).
