library(dplyr)
library(ggplot2)
library(treemap)
library(DT)

personalities <- read.csv(
  file = "BIG5/data.csv", header = TRUE, sep = "",
  stringsAsFactors = F
)
num_satisfy_pos <- function(df) {
  df <- mutate(df, satisfy_pos = rowSums(df > 3))
  df
}
num_satisfy_neg <- function(df) {
  df <- mutate(df, satisfy_neg = rowSums(df < 3))
  df
}

# separate the positively and negatively keyed questions for each of the five
# factors.
e_pos_key <- select(personalities, E1, E3, E5, E7, E9) %>% num_satisfy_pos()
e_neg_key <- select(personalities, E2, E4, E6, E8, E10) %>% num_satisfy_neg()

a_pos_key <- select(personalities, A2, A4, A6, A8, A9, A10) %>%
  num_satisfy_pos()
a_neg_key <- select(personalities, A7, A3, A5, A1) %>% num_satisfy_neg()

c_pos_key <- select(personalities, C1, C3, C5, C7, C9, C10) %>%
  num_satisfy_pos()
c_neg_key <- select(personalities, C2, C4, C6, C8) %>% num_satisfy_neg()

n_pos_key <- select(personalities, N2, N4) %>% num_satisfy_pos()
n_neg_key <- select(personalities, N1, N3, N5, N6, N7, N8, N9, N10) %>%
  num_satisfy_neg()

o_pos_key <- select(personalities, O1, O3, O5, O7, O8, O9, O10) %>%
  num_satisfy_pos()
o_neg_key <- select(personalities, O2, O4, O6) %>% num_satisfy_neg()

# O - P
# C - U
# E - I
# A - D
# N - S
# report the results of the test for each person.
personalities_results <- mutate(personalities,
  is_e = (e_pos_key$satisfy_pos + e_neg_key$satisfy_neg) > 5,
  is_a = (a_pos_key$satisfy_pos + a_neg_key$satisfy_neg) > 5,
  is_c = (c_pos_key$satisfy_pos + c_neg_key$satisfy_neg) > 5,
  is_n = (n_pos_key$satisfy_pos + n_neg_key$satisfy_neg) > 5,
  is_o = (o_pos_key$satisfy_pos + o_neg_key$satisfy_neg) > 5
)
results <- data.frame(
  result_e = ifelse(personalities_results$is_e == TRUE, "E", "I"),
  result_a = ifelse(personalities_results$is_a == TRUE, "A", "D"),
  result_c = ifelse(personalities_results$is_c == TRUE, "C", "U"),
  result_n = ifelse(personalities_results$is_n == TRUE, "N", "S"),
  result_o = ifelse(personalities_results$is_o == TRUE, "O", "P")
)
results <- mutate(results, traits = paste(
  results$result_e, results$result_a,
  results$result_c, results$result_n,
  results$result_o))
personalities_results <- mutate(personalities_results, traits = results$traits)

# filter by gender drop down, most common personality type of males = 1,
# females = 2, all
unique_person <- unique(personalities_results$traits)
male <- filter(personalities_results, gender == "1") %>%
  group_by(traits) %>%
  summarise(m_count = n())
female <- filter(personalities_results, gender == "2") %>%
  group_by(traits) %>%
  summarise(f_count = n())
both <- full_join(male, female) %>% mutate(total_count = f_count + m_count)

# both_tree <- treemapify(both,
#                         area = "total_count", fill = "traits",
#                         label = "traits", group = "total_count")
# both_plot <- ggplotify(both_tree) +
#   scale_x_continuous(expand = c(0, 0)) +
#   scale_y_continuous(expand = c(0, 0)) +
#   scale_fill_brewer(palette = "Dark2")

## waffle chart to display all different frequencies of each personality
# ggplot(personalities_results, aes(x = x, y = y, fill = category)) +
#   geom_tile(color = "black", size = 0.5) +
#   scale_x_continuous(expand = c(0, 0)) +
#   scale_y_continuous(expand = c(0, 0), trans = "reverse") +
#   scale_fill_brewer(palette = "Set3") +
#   labs(
#     title = "Waffle Chart", subtitle = "'Class' of vehicles",
#     caption = "Source: mpg"
#   ) +
#   theme(
#     panel.border = element_rect(size = 2),
#     plot.title = element_text(size = rel(1.2)),
#     axis.text = element_blank(),
#     axis.title = element_blank(),
#     axis.ticks = element_blank(),
#     legend.title = element_blank(),
#     legend.position = "right"
#   )

