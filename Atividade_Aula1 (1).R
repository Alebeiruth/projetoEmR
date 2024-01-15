# Carrega os dados USArrests
data("USArrests")

# Cabeçalho
head(USArrests)

# mostra a 5 linhas com 91
USArrests$UrbanPop[5]

# vetor maior e menor população
maiorPop <- c(0, 0, 0, 0, 0)
menorPop <- c(10000, 10000, 10000, 10000, 10000)

# indices dos vetores de maior e menor população
indiceMaiorPop <- -c(0, 0, 0, 0, 0)
indiceMenorPop <- c(0, 0, 0, 0, 0)

# laço for para as 5 maiores e menores valores na variavel UrbanPop
for (i in 1:50) {
  # atualiza as 5 maiores populações e seus indices
  for(j in 1:5) {
    if(USArrests$UrbanPop[i] > maiorPop[j]) {
      for (k in 5:j + 1) {
        maiorPop[k] <- maiorPop[k - 1]
        indiceMaiorPop[k] <- indiceMaiorPop[k - 1] 
      }
      maiorPop[j] <- USArrests$UrbanPop[i]
      indiceMaiorPop[j] <- i
      break
    }
  }
  
  # atualiza as 5 menores populações e seus indices
  for (j in 1:5) {
    if(USArrests$UrbanPop[i] < menorPop[j]) {
      for (k in 5:j + 1) {
        menorPop[k] <- menorPop[k - 1]
        indiceMenorPop[k] <- indiceMenorPop[k - 1]
      }
      menorPop[j] <- USArrests$UrbanPop[i]
      indiceMenorPop[j] <- i
      break
    }
  }
}

# contadores de soma (maior e menor) para Murder, Assault e Rape
somaMuderMaior <- 0
somaAssaultMaior <- 0
somaRapeMaior <- 0

somaMuderMenor <- 0
somaAssaultMenor <- 0
somaRapeMenor <- 0

#Soma para 5 maiores populações
for(indc in indiceMaiorPop) {
  somaMuderMaior <- somaMuderMaior + USArrests$Murder[indc]
  somaAssaultMaior <- somaAssaultMaior + USArrests$Assault[indc]
  somaRapeMaior <- somaRapeMaior + USArrests$Rape[indc]
}

#Soma das 5 menores populações
for (indc in indiceMenorPop) {
  somaMuderMenor <- somaMuderMenor + USArrests$Murder[indc]
  somaAssaultMenor <- somaAssaultMenor + USArrests$Assault[indc]
  somaRapeMenor <- somaRapeMenor + USArrests$Rape[indc]
}

#calculo das medias para 5 maiores e menores 
mediaMuderMaior <- somaMuderMaior / 5
mediaAssaultMaior <- somaAssaultMaior / 5
mediaRapeMaior <- somaRapeMaior / 5

mediaMuderMenor <- somaMuderMenor / 5
mediaAssaultMenor <- somaMuderMenor / 5
mediaRapeMenor <- somaRapeMenor / 5

#Saida da média das 5 maiores Muder, Assault e Rape
cat("Média das 5 maiores populações:\n")
cat("Muder:", mediaMuderMaior, "\n")
cat("Assault:", mediaAssaultMaior, "\n")
cat("Rape:", mediaRapeMaior, "\n\n")

#Saida da média das 5 menores Muder, Assault e Rape
cat("Média das 5 menores populações:\n")
cat("Muder:", mediaMuderMenor, "\n")
cat("Assault:", mediaAssaultMenor, "\n")
cat("Rape:", mediaRapeMenor, "\n\n")
