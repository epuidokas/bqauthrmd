library("bigrquery")

bq_auth_for_rmd <- function(){
  if (!interactive() && Sys.getenv("GOOGLE_AUTH_USER") != "") {
    message("Authenticating as ", Sys.getenv("GOOGLE_AUTH_USER"))
    bq_auth(email = Sys.getenv("GOOGLE_AUTH_USER"))
  } else {
    bq_auth()
    message("********************************************")
    message("To automatically authenticate with Google as ", bq_user(), ", run the following in Terminal:")
    message("printf \"\\nGOOGLE_AUTH_USER=", bq_user(), "\" >> ~/.REnviron")
    message("********************************************")
  }
}
