# Régrétions

- [Régrétions](#régrétions)
- [Annex](#annex)
  - [Exo](#exo)
  - [Remerciment](#remerciment)

# Annex

## Exo

On s'intéresse à un échantillon de 10 salarier d'une entreprise.
On veutle lien entre le salaire et le statut cadre
Avec les variable suivante :

```R
salaire <- c(33,36,40,32,90,17,15,22,29,30)
statut <- c("cadre","cadre","cadre","cadre","cadre","non-cadre","non-cadre","non-cadre","non-cadre","non-cadre")
```

1. Effectuer un test permetant de repondre à la quetion avec un seuil $\alpha$=5%.

```R
## On est bien d'une variable explicative boolein à une continue à expliqué, on peut donc apliqué la regretion linéair.

## On verifi si il ne sont pas indépendente
S=seq(0,1,by=0.25)
# 0.00 0.25 0.50 0.75 1.00
q1=quantile(salaire,S)
#    0%   25%   50%   75%  100% 
# 15.00 23.75 31.00 35.25 90.00 
salaire_quatil=cut(salaire,breaks=q1)
# (31,35.2] (35.2,90] (35.2,90] (31,35.2] (35.2,90] (15,23.8] (15,23.8] (23.8,31] (23.8,31]
# Levels: (15,23.8] (23.8,31] (31,35.2] (35.2,90]
table(salaire_quatil)
# salaire_quatil
# (15,23.8] (23.8,31] (31,35.2] (35.2,90] 
#         2         2         2         3
cmt=table(salaire_quali,statut)
#              statut
#salaire_quali1 cadre non-cadre
#     (15,23.8]     0         2
#     (23.8,31]     0         2
#     (31,35.2]     2         0
#     (35.2,90]     3         0
chisq.test(cmt)
# Pearson's Chi-squared test
# data:  Cmt
# X-squared = 9, df = 3, p-value = 0.02929
# Message d'avis : Dans chisq.test(Cmt) : L’approximation du Chi-2 est peut-être incorrecte
## p-value < alpha : les variable ne son pas indépendente, il est donc intérésent de fair un teste de corrélation ou de regretion linéaire simple

# On modifie la forme du statut en liste booleen
statutNombre <- c()
for(a in statut)
    ifelse(a=="cadre",
        statutNombre<-append(statutNombre,1),
        statutNombre<-append(statutNombre,0))
> statutNombre
# 1 1 1 1 1 0 0 0 0 0
result=lm(salaire~statutNombre)
summary(result)
# Call : lm(formula = salaire ~ statutNombre)
# Residuals:
#    Min     1Q Median     3Q    Max 
# -14.20  -9.55  -5.90   4.65  43.80 
# Coefficients:
#              Estimate Std. Error t value Pr(>|t|)  
# (Intercept)    22.600      8.096   2.791   0.0235 *
# statutNombre   23.600     11.450   2.061   0.0732 .
# ---
# Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1
# Residual standard error: 18.1 on 8 degrees of freedom
# Multiple R-squared:  0.3469,    Adjusted R-squared:  0.2652 
# F-statistic: 4.248 on 1 and 8 DF,  p-value: 0.07323
## p-value > alpha : les variable ne son pas linéairement dépandente
```

2. Explores les données et prendre les initiative qui vous semblent justifiées.

```R
## On reparti les salair selon le statut pour faire la boite a moustache
salaireCadre <- c()
salaireNonCadre <- c()
for(a in seq(length(salaire)))
    ifelse(statut[a]=="cadre",
        salaireCadre <- append(salaireCadre,salaire[a]),
        salaireNonCadre <- append(salaireNonCadre,salaire[a]))
salaireCadre
# 33 36 40 32 90
salaireNonCadre
# 17 15 22 29 30
salaireMinMax <- c(min(salaire),max(salaire))
boxplot(salaireCadre,main="salaire cadre",ylim=salaireMinMax)
## On remarquera que le point (90,cadre) est un point extreme que l'on desidera de retiré
salaire0 <- salaire[-5]
# 33 36 40 32 17 15 22 29 30
statut0 <- statut[-5]
# "cadre" "cadre" "cadre" "cadre" "non-cadre" "non-cadre" "non-cadre" "non-cadre" "non-cadre"
statutNombre0 <- statutNombre[-5]
# 1 1 1 1 0 0 0 0 0
```

1. Répéter l'analyse en ecartant les valeur jugées trop extremes. Qu'observeton ?

```R
result0=lm(salaire0~statutNombre0)
summary(result0)
# Call: lm(formula = salaire0 ~ statutNombre0)
# Residuals:
#    Min     1Q Median     3Q    Max 
#  -7.60  -3.25  -0.60   4.75   7.40 
# Coefficients:
#               Estimate Std. Error t value Pr(>|t|)    
# (Intercept)     22.600      2.530   8.934 4.47e-05 ***
# statutNombre0   12.650      3.794   3.334   0.0125 *  
# ---
# Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1
# Residual standard error: 5.656 on 7 degrees of freedom
# Multiple R-squared:  0.6136,    Adjusted R-squared:  0.5584 
# F-statistic: 11.12 on 1 and 7 DF,  p-value: 0.01252
## p-value < alpha : les variable sont linéairement dépandente

hist(result0$residuals,prob=T)
curve(dnorm(x,0,var(statutNombre)),l=2,add=T)
ks.test(result0$residuals,'pnorm',0,var(statutNombre))
# Exact one-sample Kolmogorov-Smirnov test
# data:  result0$residuals
# D = 0.54017, p-value = 0.005516
# alternative hypothesis: two-sided
## p-value < alpha : donc on avais bien le droit d'utiliser la regretion
```

## Remerciment