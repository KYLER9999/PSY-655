# Function 2
group_categories <- function(response) {
  het_group <- c('hetero', 'heterosexual', 'straight')
  homo_group <- c('homo', 'homosexual', 'gay')
  bi_group <- c('bi', 'bisexual')
  asex_group <- c('asexual', 'no sex')
  pan_group <- c('pan', 'pansexual', 'straight')
  
  
  response <- tolower(response)
  if (response %in% het_group) {
    return("Heterosexual")
  }
  else if (response %in% homo_group) {
    return("Homosexual")
  }
  else if (response %in% bi_group) {
    return("Bisexual")
  }
  else if (response %in% asex_group) {
    return("Asexual")
  }
  else if (response %in% pan_group) {
    return("Pansexual")
  }
  else {
    return("Other")
  }
}
