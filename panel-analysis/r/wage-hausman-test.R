library(plm)
library(lmtest)
library(stargazer)

wage_df = read.csv('https://raw.githubusercontent.com/artamonoff/Econometrica/master/panel-analysis/panels-csv/Wages.csv')

wage_df$exp_sq = wage_df$exp^2

wage_panel = pdata.frame(wage_df, index = c('id', 'time'))

# RE-модель
mod_re = plm(formula = 'lwage~1+exp+I(exp^2)+wks', data=wage_panel, model = 'random', effect = 'individual')
# FE-модель
mod_fe = plm(formula = 'lwage~1+exp+I(exp^2)+wks', data=wage_panel, model = 'within', effect = 'individual')

# Hausman test (non-robust)
phtest(mod_re, mod_fe)
# Hausman test (robust)
phtest( x=lwage~1+exp+exp_sq+wks, data=wage_df, method='aux', index = c('id', 'time'), vcov=vcovSCC)
