suppressPackageStartupMessages(library("dplyr"))
suppressPackageStartupMessages(library("ggplot2"))
suppressPackageStartupMessages(library("forcats"))
suppressPackageStartupMessages(library("cowplot"))
theme_set(theme_bw())


pie_plot <- function(x, i, responses, plot_name){
  plot_colors <- c("red", "blue4")
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
  plot_colors <- c("red", "blue4")
  colnames(x) <- c("ax1", "Class")
  n <- n_distinct(x[,1])

  #Proportion plots
  q <- x %>% group_by(ax1) %>% mutate(count = n()) %>%
    ggplot(aes(fct_reorder(ax1,count, .desc = TRUE))) +
    geom_bar(aes(y = (..count..)/sum(..count..), fill = Class), position = "fill", color = "black", alpha = 0.7) +
    xlab(responses[i]) +
    labs(title = paste("Proportions for" ,responses[i]), y = "Proportion") +
    scale_fill_manual(values = plot_colors)
    theme_bw() + theme(plot.title = element_text(hjust = 0.5, size = 16),
                       axis.text = element_text(size = 12),
                       axis.title = element_text(size = 14))

  if (n > 3){
    return(q + coord_flip())
  } else {
    return(q)
  }
}


bar_plot <- function(x, i, responses, plot_name, flip = TRUE){
  plot_colors <- c("red", "blue4")
  colnames(x) <- c("ax1", "Class")
  
  #Bar plot
  p <-  x %>% group_by(ax1, Class) %>%
    summarise(count = n()) %>% ggplot() +
    geom_col(aes(x = fct_reorder(ax1,count, .desc = TRUE),
                 y = count, fill = Class), alpha = 0.7, color = "black") +
    xlab(responses[i]) + 
    labs(title = paste("Bar Plot for" ,responses[i]), y = "Count") +
    scale_fill_manual(values = plot_colors) +
    theme_bw() + theme(plot.title = element_text(hjust = 0.5, size = 16), 
                       axis.text = element_text(size = 12), 
                       axis.title = element_text(size = 14))

  
  if (flip){
    return(p + coord_flip())
  } else {
    return(p)
  }
  
}

