# Three ways to set the coding in R: 
#    directly on the column, 
#    per model, 
#    or replace the R session default.
options(contrasts=c(unordered = "contr.treatment", ordered = "contr.poly"))

Y <- c(1, 2, 2, 2)
df <- data.frame(
	'CTA'=factor(c('a','A','a','A')), 
	'BG'=factor(c('b','b','B','B'))
)

lm(Y ~ CTA * BG, data=df)




df <- data.frame(
	'CTA'=factor(c('a','A','a','A')), 
	'BG'=factor(c('b','b','B','B'))
)

contrasts(df$CTA) <- contr.sum(2)
contrasts(df$BG) <- contr.sum(2)

lm(Y ~ CTA * BG, data=df)



df <- data.frame(
	'CTA'=factor(c('a','A','a','A')), 
	'BG'=factor(c('b','b','B','B'))
)

lm(Y ~ CTA * BG, data=df, contrasts=list(CTA='contr.sum', BG='contr.sum'))





options(contrasts=c(unordered = "contr.sum", ordered = "contr.poly"))

df <- data.frame(
	'CTA'=factor(c('a','A','a','A')), 
	'BG'=factor(c('b','b','B','B'))
)

lm(Y ~ CTA * BG, data=df, contrasts=list(CTA='contr.sum', BG='contr.sum'))
