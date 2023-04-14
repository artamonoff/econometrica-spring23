library('plm')
library(lmtest)
library(stargazer)

wage_df = read.csv('https://raw.githubusercontent.com/artamonoff/Econometrica/master/panel-analysis/panels-csv/Wages.csv')

wage_panel = pdata.frame(wage_df, index = c('id', 'time'))

# Pooling
mod_pl = plm(formula = 'lwage~1+ed+exp+I(exp^2)+wks', data=wage_panel, model = 'pooling', effect = 'individual')
coef(mod_pl)

# RE-модель
mod_re = plm(formula = 'lwage~1+ed+exp+I(exp^2)+wks', data=wage_panel, model = 'random', effect = 'individual')
coef(mod_re)

# FE-модель
mod_fe = plm(formula = 'lwage~1+ed+exp+I(exp^2)+wks', data=wage_panel, model = 'within', effect = 'individual')
coef(mod_fe)

# Результаты подгонки модели
summary(mod_re) # неробастные s.e.
summary(mod_re, vcov = vcovHC) # Arellano-Bond s.e.
summary(mod_re, vcov = vcovSCC) # Driscoll-Kraay s.e.

# только t-test
coeftest(mod_re, vcov = vcovHC)
coeftest(mod_re, vcov = vcovSCC)

# F-тест на значимость регрессии
pwaldtest(mod_re, test = 'F', vcov=vcovHC) # Arellano-Bond
pwaldtest(mod_re, test = 'F', vcov=vcovSCC) # Dsicoll-Kraay


stargazer(mod_pl, mod_re, mod_fe, type = 'text')
