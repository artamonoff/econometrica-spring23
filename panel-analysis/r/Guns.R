library(plm)
library(stargazer)

df = read.csv('https://raw.githubusercontent.com/artamonoff/Econometrica/master/panel-analysis/panels-csv/Guns.csv')

panel_df = pdata.frame(df, index = c('state', 'year'))

spec = formula(log(violent)~law+male+population+log(income)+density)

mod_pl = plm(formula = spec, data = panel_df, model = 'pooling', effect = 'individual')

mod_re = plm(formula = spec, data = panel_df, model = 'random', effect = 'individual')

mod_fe = plm(formula = spec, data = panel_df, model = 'within', effect = 'individual')

robust_se = list(sqrt(diag(vcovHC(mod_pl))), sqrt(diag(vcovHC(mod_re))),  sqrt(diag(vcovHC(mod_fe))))

stargazer(mod_pl, mod_re, mod_fe, se=robust_se, type = 'text')

# Serial correlation
# BSY-test для RE
pbsytest(mod_pl, type='ar')
# Вывод; указывает на серинйую корреляцию

# Wooldridge Test for AR(1) Errors in FE Panel Models
pwartest(mod_fe)
# Вывод; указывает на серинйую корреляцию

# Тесты на ненаблюдаемые эффекты
# Wooldridge
pwtest(mod_pl)
# Индивидуальные эффекты значимы
# BSY
pbsytest(mod_pl, type='re')

# Тест на кросс корреляции
pcdtest(mod_re, test = 'cd')
# Кросс-корреляции значимы!

robust_se = list(sqrt(diag(vcovSCC(mod_pl))), sqrt(diag(vcovSCC(mod_re))),  sqrt(diag(vcovSCC(mod_fe))))

stargazer(mod_pl, mod_re, mod_fe, se=robust_se, type = 'text')
