# Function 1
age_code <- function(age) {
  if (age < 18) {
    return(NA)
  }
  else if (age >= 18 & age <= 29) {
    return(1)
  }
  else if (age >= 30 & age <= 39) {
    return(2)
  }
  else if (age >= 40 & age <= 49) {
    return(3)
  }
  else if (age >= 50 & age <= 59) {
    return(4)
  }
  else if (age >= 60 & age <= 65) {
    return(5)
  }
  else if (age >= 66) {
    return(6)
  }
}
