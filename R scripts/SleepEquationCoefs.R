# Сколько десятичных знаков оставим после округления
my.digits = 2
# загразим данные с сайт кафедры по ссылке
# В результате загрузки создадим data.frame с таблицей данных (переменная df)
df = read.csv(file='http://meit.mgimo.ru/sites/default/files/sleep75.csv')

# подгоним модель регрессии sleep на totwrk & male на датасете df
# с помощью функции lm()
sleep.eq.1 = lm(formula = sleep~totwrk+male, data=df)
# напечатаем коэффициенты
coef(sleep.eq.1)
# округлим коэффициенты
round( coef(sleep.eq.1), digits = my.digits )

# подгоним модель регрессии sleep на totwrk, male, smsa, age, south, yngkid, marr, union на датасете df
# с помощью функции lm()
sleep.eq.2 = lm(formula = sleep~totwrk+male+smsa+age+south+yngkid+marr+union, data=df)
# напечатаем коэффициенты
coef(sleep.eq.2)
# округлим коэффициенты
round( coef(sleep.eq.2), digits = my.digits )

# подгоним модель регрессии sleep на log(hrwage), smsa, totwrk, male, marr, age, south, yngkid на датасете df
# с помощью функции lm()
sleep.eq.3 = lm(formula = sleep~log(hrwage)+smsa+totwrk+male+marr+age+south+yngkid, data=df)
# напечатаем коэффициенты
coef(sleep.eq.3)
# округлим коэффициенты
round( coef(sleep.eq.3), digits = my.digits )
# сколько наблюдений в исходном датасете
nrow(df)
# сколько наьлюдений участвовало в подгонке модели
nobs(sleep.eq.3)

