## Demo: Scope in LM

df <- read.csv('../data/WirePullData.csv')
# Define a version without Pull.Strength
df.X <- df[,c('Wire.Length', 'Die.Height')]
# This should produce an error, as Pull.Strength is undefined
mdl <- lm(Pull.Strength ~ Wire.Length + Die.Height, data=df.X)
# Error in eval(predvars, data, env) : object 'Pull.Strength' not found
# But defining a variable with that name lets lm find it
Pull.Strength <- df[,'Pull.Strength']
mdl <- lm(Pull.Strength ~ Wire.Length + Die.Height, data=df.X)
# Remember data argument takes precedence