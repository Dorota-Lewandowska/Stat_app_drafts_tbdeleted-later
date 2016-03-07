library(dplyr)
library(rhandsontable)
library(shinyjs)

DF = data.frame(integer = 1:10,
                numeric = rnorm(10),
                logical = rep(TRUE, 10), 
                character = LETTERS[1:10],
                factor = factor(letters[1:10], levels = letters[10:1], 
                                ordered = TRUE),
                factor_allow = factor(letters[1:10], levels = letters[10:1], 
                                      ordered = TRUE),
                date = seq(from = Sys.Date(), by = "days", length.out = 10),
                stringsAsFactors = FALSE)

rhandsontable(DF, width = 600, height = 300) %>%
  hot_col("factor_allow", allowInvalid = TRUE)



##==================
##create data frame
###=================

DF<-data.frame(matrix(NA, nrow=1000, ncol=10))
names(DF)<-c("Description", " number" , "Sample1_size", "price", "total", "s_90", "s_95", "s_99", "z-score", "p-value")
 

DF[,1]<-as.character(DF[,1])
DF[,2]<-as.numeric(DF[,2])
DF[,4]<-as.numeric(DF[,4])
DF[,3]<-as.integer(DF[,3])
DF[,5]<-as.integer(DF[,5])



##types of input variable


rhandsontable(DF, width = 550, height = 300) %>%
  hot_col("Description", format= " format: '0,0.00 $'") %>%
  hot_col("Sample1_perc", format= " format: '0,0.00 $'") 

%>%
  hot_col("Description", format = "$0,0.00") %>%
  hot_col("f", format = "0a") %>%
  hot_col("float", format = "0.0") %>%
  hot_col("folat", format = "$0,0.00") %>%
  hot_col("lrg", format = "0a") %>%
  hot_col("float", format = "0.0") %>%
  hot_col("folat", format = "$0,0.00") %>%
  hot_col("lrg", format = "0a") %>%
  hot_col("pct", format = "0%")



DF = data.frame(int = 1:10, float = rnorm(10), cur = rnorm(10) * 1E5,
                lrg = rnorm(10) * 1E8, pct = rnorm(10))

rhandsontable(DF, width = 550, height = 300) %>%
  hot_col("float", format = "0.0") %>%
  hot_col("cur", format = "$0,0.00") %>%
  hot_col("lrg", format = "0a") %>%
  hot_col("pct", format = "0%")

rhandsontable(DF, width = 600, height = 300) %>%
hot_col("Description", allowInvalid = TRUE)






DF <- data.frame(Date=as.Date(character()),
                 File=character(), 
                 User=numeric(), 
                 stringsAsFactors=FALSE)