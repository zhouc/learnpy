#导入支付数据
data_pay<-read.csv("D:\\工作文件\\外部支付场景风控\\外部支付拦截监控\\paydatafile.csv")
#处理表头
colnum<-ncol(data_pay)
for(i in 1:colnum){
        colnames(data_pay)[i]<- unlist(strsplit(colnames(data_pay)[i],".",fixed = TRUE))[2]
}
#京东支付
library(dplyr)
jd_pay<- data_pay %>% tbl_df() %>% 
        mutate(date = as.Date(paste(substr(dt,1,4),"/",substr(dt,5,6),"/",substr(dt,7,8),sep =""))) %>%
        mutate(type = ifelse(code == 0,'通过',ifelse(code == 80000,'加验',ifelse(code == 90000,'拦截','其他')))) %>%
        mutate(source = ifelse(sourcetype == 'BT-WAIDAN-JDPAY','京东支付',ifelse(sourcetype == 'BT-SHANFU','银联闪付',ifelse(sourcetype == 'BT-WAIDAN-QB','钱包支付',ifelse(sourcetype == 'BT-DJ-JDPAY','京东到家','其他'))))) %>%
        select(date,source,type,pin_num,hit_num) %>% 
        arrange(source,type)
library(reshape2)
jd_pay_0<- jd_pay %>% filter(source =='京东支付') %>% select (-hit_num)
jdpay_rate_01<-melt(as.data.frame(jd_pay_0),id = c('date','source','type'))
jdpay_rate_02<-cast(jdpay_rate_01,date + source ~ type,sum) %>% 
        tbl_df() %>%        
        mutate(verify_rate = 加验 /(加验+通过))
#使用ggplot2画图
library(ggplot2)
ggplot(jd_pay,aes(x=date,y=pin_num,fill = type)) + geom_bar(stat = "identity")+
        ggtitle("支付") +
        theme(axis.text.x= element_text(size = 6,colour = "black"),
              axis.text.y= element_text(size = 6,colour = "black"),
              legend.text =element_text(size = 6))+
        facet_grid(source ~ .)+
        xlab("日期")+
        ylab("数量")

#使用plotly画图
library(plotly)
m = list(
        l = 50,
        r = 50,
        b = 100,
        t = 100,
        pad = 4
)

subplot(
        plot_ly(jd_pay %>% filter(source == "京东支付"),x = date,y = pin_num,color = type,type ="bar") %>% 
                layout(barmode = "stack", width = 1200, height = 500, margin = m),
        plot_ly(jdpay_rate_02,x=date,y=verify_rate,line = list(shape = "spline")),
        margin = 0.05
) %>% layout(showlegend = FALSE)





