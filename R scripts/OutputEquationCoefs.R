# Сколько десятичных знаков оставим после округления
my.digits = 3
# загразим данные с сайт кафедры по ссылке
# В результате загрузки создадим data.frame с таблицей данных (переменная df)
df = read.csv(file='http://meit.mgimo.ru/sites/default/files/Labour.csv')

# подгоним модель регрессии log(output) на log(capita), log(labour) на датасете df
# с помощью функции lm()
output.eq.1 = lm(formula = log(output)~log(capital)+log(labour), data=df)
# напечатаем коэффициенты
coef(output.eq.1)
# округлим коэффициенты
round( coef(output.eq.1), digits = my.digits )

# подгоним модель регрессии log(output) на log(capita), log(labour), log(wage) на датасете df
# с помощью функции lm()
output.eq.2 = lm(formula = log(output)~log(capital)+log(labour)+log(wage), data=df)
# напечатаем коэффициенты
coef(output.eq.2)
# округлим коэффициенты
round( coef(output.eq.2), digits = my.digits )
