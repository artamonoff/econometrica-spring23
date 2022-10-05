# Сколько десятичных знаков оставим после округления
my.digits = 3
# загразим данные с сайт кафедры по ссылке
# В результате загрузки создадим data.frame с таблицей данных (переменная df)
df = read.csv(file='http://meit.mgimo.ru/sites/default/files/wage2.csv')

# подгоним модель регрессии log(wage) на age & IQ на датасете df
# с помощью функции lm()
wage.eq.1 = lm(formula = log(wage)~age+IQ, data=df)
# напечатаем коэффициенты
coef(wage.eq.1)
# округлим коэффициенты
round( coef(wage.eq.1), digits = my.digits )

# подгоним модель регрессии log(wage) на age, IQ, south, urban, married, KWW на датасете df
# с помощью функции lm()
wage.eq.2 = lm(formula = log(wage)~age+IQ+south+urban+married+KWW, data=df)
# напечатаем коэффициенты
coef(wage.eq.2)
# округлим коэффициенты
round( coef(wage.eq.2), digits = my.digits )
