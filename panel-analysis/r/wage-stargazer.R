library(plm)
library(lmtest)
library(stargazer)

wage_df = read.csv('https://raw.githubusercontent.com/artamonoff/Econometrica/master/panel-analysis/panels-csv/Wages.csv')

wage_panel = pdata.frame(wage_df, index = c('id', 'time'))

# RE-модель
mod_re = plm(formula = 'lwage~1+ed+exp+I(exp^2)+wks', data=wage_panel, model = 'random', effect = 'individual')

robust_se = list(NULL, sqrt(diag(vcovHC(mod_re))),  sqrt(diag(vcovSCC(mod_re))) )

stargazer(mod_re, mod_re, mod_re, type = 'text', se=robust_se, column.labels = c('Default s.e.', 'AB s.e.', 'DK s.e.'))