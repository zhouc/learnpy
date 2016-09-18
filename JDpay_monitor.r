#����֧������
data_pay<-read.csv("E:\\learnpy\\paydatafile.csv")
#�����ͷ
colnum<-ncol(data_pay)
for(i in 1:colnum){
  colnames(data_pay)[i]<- unlist(strsplit(colnames(data_pay)[i],".",fixed = TRUE))[2]
}
#����֧��
library(dplyr)
jd_pay<- data_pay %>% tbl_df() %>% 
  mutate(date = as.Date(paste(substr(dt,1,4),"/",substr(dt,5,6),"/",substr(dt,7,8),sep =""))) %>%
  mutate(type = ifelse(code == 0,'ͨ��',ifelse(code == 80000,'����',ifelse(code == 90000,'����','����')))) %>%
  mutate(source = ifelse(sourcetype == 'BT-WAIDAN-JDPAY','����֧��',ifelse(sourcetype == 'BT-SHANFU','��������',ifelse(sourcetype == 'BT-WAIDAN-QB','Ǯ��֧��',ifelse(sourcetype == 'BT-DJ-JDPAY','��������','����'))))) %>%
  select(date,source,type,pin_num,hit_num) %>% 
  arrange(source,type)
library(reshape)
jd_pay_0<- jd_pay %>%  select (-hit_num)
jdpay_rate_01<-melt(as.data.frame(jd_pay_0),id = c('date','source','type'))
jdpay_rate_02<-cast(jdpay_rate_01,date + source ~ type,sum) %>% 
        tbl_df() %>%        
        mutate(verify_rate = ���� /(����+ͨ��))
#ʹ��ggplot2��ͼ
library(ggplot2)
library(plyr)
jd_pay_001<-ddply(jd_pay,.(date,source),transform,label_y=cumsum(pin_num))
jd1<-ggplot(jd_pay_001,aes(x=date,y=pin_num,fill = type)) + 
        geom_bar(stat = "identity")+
        ggtitle("��ܰ�ȫ_�ⲿ֧��") +
        geom_text(aes(y=label_y,label =pin_num),vjust = 1.5,color = "white",size =3)+
        theme(axis.text.x= element_text(size = 6,colour = "black"),
              axis.text.y= element_text(size = 6,colour = "black"),
              legend.text =element_text(size = 6))+
        facet_grid(. ~ source)+
        xlab("����")+
        ylab("����")

jd2<-ggplot(jdpay_rate_02,aes(x=date,y=verify_rate)) + 
        geom_line()+
        theme(axis.text.x= element_text(size = 6,colour = "black"),
              axis.text.y= element_text(size = 6,colour = "black"),
              legend.text =element_text(size = 6))+
        facet_grid(. ~ source)+
        xlab("����")+
        ylab("������")
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 
library(grid)
pdf("JD_PAY_verify.pdf",width = 16,height = 12)
grid.newpage()
pushViewport(viewport(layout = grid.layout(2,2)))
vplayout<-function(x,y)
        viewport(layout.pos.row = x,layout.pos.col = y)
print(jd1,vp = vplayout(1,1:2))
print(jd2,vp = vplayout(2,1:2))
dev.off()









#ʹ��plotly��ͼ
library(plotly)
m = list(
  l = 50,
  r = 50,
  b = 100,
  t = 100,
  pad = 4
)

subplot(
  plot_ly(jd_pay %>% filter(source == "����֧��"),x = date,y = pin_num,color = type,type ="bar") %>% 
    layout(barmode = "stack", width = 1200, height = 500, margin = m),
  plot_ly(jdpay_rate_02,x=date,y=verify_rate,line = list(shape = "spline")),
  margin = 0.05
) %>% layout(showlegend = FALSE)





