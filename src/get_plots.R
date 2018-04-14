suppressPackageStartupMessages(library("dplyr"))
suppressPackageStartupMessages(library("ggplot2"))
suppressPackageStartupMessages(library("forcats"))
theme_set(theme_bw())

main <- function() {
  
  #Read the data
  responses <- read.csv(file = "docs/survey_results_clean.csv")
  
  plot_title <- c("Academic Background", "Years of Coding Experience", "Attitude Towards Coding", "First Programming Language", 
                  "R or Python", "Preferred Data Science Task", "Number of Languages Actively Being Used")
  
  #Plot Bar and Proportion plots for all categorical variables.
  for (i in 1:ncol(responses)){
    if(i != 5){
      pie_plot(responses[,c(i,5)], i, plot_title, colnames(responses[,i]))
      ggsave(filename = paste0("docs/", colnames(responses)[i],".png"))
      proportion_plot(responses[,c(i,5)], i, plot_title, colnames(responses[,i]))
      ggsave(filename = paste0("docs/", colnames(responses)[i], "_prop.png"))
    }
  }
}

pie_plot <- function(x, i, responses, plot_name){
  
  colnames(x) <- c("ax1", "Class")
  n <- n_distinct(x[,1])
  
  #Pie plots
  p <-  x %>% group_by(ax1) %>%
    summarise(count = n()) %>% arrange(desc(ax1)) %>% 
    mutate(pos = cumsum(count) - count/2) %>% ggplot() +
    geom_bar(aes(x = "",
                 y = count, fill = ax1), alpha = 0.7, color = "black", stat = "identity") +
    geom_text(aes(x="", y=pos, label = count), size=5) +
    xlab(responses[i]) + 
    labs(title = paste("Distribution of" ,responses[i]), fill = "", x="", y="Number of people") +
    scale_fill_brewer(palette = "Set1") +
    coord_polar("y", start=0) +
    theme_bw() + theme(plot.title = element_text(hjust = 0.5, size = 16), 
                       axis.text = element_text(size = 12), 
                       axis.title = element_text(size = 14),
                       axis.text.x = element_blank())
  return(p)
}

proportion_plot <- function(x, i, responses, plot_name){
  
  colnames(x) <- c("ax1", "Class")
  n <- n_distinct(x[,1])
  
  #Proportion plots
  q <- x %>% group_by(ax1) %>% mutate(count = n()) %>%
    ggplot(aes(fct_reorder(ax1,count, .desc = TRUE))) +
    geom_bar(aes(y = (..count..)/sum(..count..), fill = Class), position = "fill", color = "black", alpha = 0.7) +
    xlab(responses[i]) +
    labs(title = paste("Proportions for" ,responses[i]), y = "Proportion") +
    scale_fill_brewer(palette= "Dark2") +
    theme_bw() + theme(plot.title = element_text(hjust = 0.5, size = 16),
                       axis.text = element_text(size = 12),
                       axis.title = element_text(size = 14))
  
  if (n > 3){
    return(q + coord_flip())
  } else {
    return(q)
  }
  
}


# call main function
main()
