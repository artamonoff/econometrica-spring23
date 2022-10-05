# Сколько десятичных знаков оставим после округления
my.digits = 3
# загразим данные с сайт кафедры по ссылке
# В результате загрузки создадим data.frame с таблицей данных (переменная df)
df = read.csv(file='http://meit.mgimo.ru/sites/default/files/Electricity.csv')

# подгоним модель регрессии log(cost) на log(q) на датасете df
# с помощью функции lm()
cost.eq.1 = lm(formula = log(cost)~log(q), data=df)
# напечатаем коэффициенты
coef(cost.eq.1)
# округлим коэффициенты
round( coef(cost.eq.1), digits = my.digits )

# подгоним модель регрессии log(cost) на log(q), log(pl), log(pf), log(pk) на датасете df
# с помощью функции lm()
cost.eq.2 = lm(formula = log(cost)~log(q)+log(pl)+log(pf)+log(pk), data=df)
# напечатаем коэффициенты
coef(cost.eq.2)
# округлим коэффициенты
round( coef(cost.eq.2), digits = my.digits )
