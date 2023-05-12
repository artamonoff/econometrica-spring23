library(plm)

df = read.csv('https://raw.githubusercontent.com/artamonoff/Econometrica/master/panel-analysis/panels-csv/LaborSupply.csv')

panel = pdata.frame(df, index=c('id', 'year'))

purtest(panel$lnwg, test='ips', exo='intercept', lags='SIC', pmax = 3)

purtest(panel$lnwg, test='levinlin', exo='intercept', lags='SIC', pmax = 3)
