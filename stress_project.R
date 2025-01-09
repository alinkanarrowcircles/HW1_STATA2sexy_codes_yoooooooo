#work stress 
df_stress <- import(file.choose())
df_stress1 <- df_stress %>%select('tt3g51a', 'tt3g51b', 'tt3g51c', 'tt3g51d', 
                                  'tt3g52a', 'tt3g52b', 'tt3g52c', 'tt3g52d', 
                                  'tt3g52e', 'tt3g52f', 'tt3g52g', 'tt3g52h', 'tt3g01', 'tt3g03') 
#cfa model
model_stress <- "
workplace =~ tt3g51a + tt3g51b + tt3g51c + tt3g51d
workload =~ tt3g52a + tt3g52b + tt3g52c + tt3g52d + tt3g52e
stud_behaviour =~  tt3g52f + tt3g52g + tt3g52h
"
#storing into variable
fit_stress <- cfa(model_stress, df_stress1, std.lv = T)

summary(fit_stress, std=T, fit=T)

#work stress overall 
model_stress_overall <- "
workplace =~ tt3g51a + tt3g51b + tt3g51c + tt3g51d
workload =~ tt3g52a + tt3g52b + tt3g52c + tt3g52d + tt3g52e
stud_behaviour =~  tt3g52f + tt3g52g + tt3g52h
overall_stress =~  workplace + workload + stud_behaviour
"
fit_stress1 <- cfa(model_stress_overall, df_stress1, std.lv = T)

summary(fit_stress1, std=T, fit=T)
