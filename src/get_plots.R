suppressPackageStartupMessages(library("dplyr"))
suppressPackageStartupMessages(library("readr"))
suppressPackageStartupMessages(library("ggplot2"))
suppressPackageStartupMessages(library("forcats"))
theme_set(theme_bw())

main <- function() {
  
  #Read the data
  responses <- read_csv(file = "docs/survey_responses.csv")
  
  #Path to write the file in
  write_path <- "docs"
  
  plot_title <- c("Academic Background", "Years of Coding Experience", "Attitude Towards Coding", "First Programming Language", 
                  "R or Python", "Preferred Data Science Task", "Number of Languages Actively Being Used")
  
  #Plot Bar and Proportion plots for all categorical variables.
  for (i in 1:ncol(responses)){
    if(i != 5)  categorical_plots(responses[,c(i,5)], i, plot_title, write_path, colnames(responses[,i]))
  }
  
}


categorical_plots <- function(x, i, responses, plot_name){
  
  #Function to plot all the categorical variables
  
  colnames(x) <- c("ax1", "Class")
  n <- n_distinct(x[,1])
  
  #Pie plots
  p <-  x %>% group_by(ax1) %>%
    summarise(count = n()) %>% ggplot() +
    geom_bar(aes(x = "",
                 y = count, fill = ax1), alpha = 0.7, color = "black", stat = "identity") +
    xlab(responses[i]) + 
    labs(title = paste("Pie chart for" ,responses[i]), fill = "") +
    scale_fill_brewer(palette = "Set1") +
    coord_polar("y", start=0) +
    theme_bw() + theme(plot.title = element_text(hjust = 0.5, size = 16), 
                       axis.text = element_text(size = 12), 
                       axis.title = element_text(size = 14),
                       axis.text.x = element_blank())
  
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
  
  #Save files
  if(n > 3){
    ggsave(plot = p + coord_flip(),
           filename = paste(plot_name,".png",sep = ""),
           path = write_path)
    
    ggsave(plot = q + coord_flip(),
           filename = paste(plot_name,"_prop.png",sep = ""),
           path = write_path)
  }
  else
  {
    ggsave(plot = p,
           filename = paste(plot_name,".png",sep = ""),
           path = write_path)
    ggsave(plot = q,
           filename = paste(plot_name,"_prop.png",sep = ""),
           path = write_path)
  }
}


# call main function
main()
