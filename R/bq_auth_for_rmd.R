library("bigrquery")

bq_auth_for_rmd <- function(){
  if (!interactive() && Sys.getenv("GOOGLE_AUTH_USER") != "") {
    message("Authenticating as ", Sys.getenv("GOOGLE_AUTH_USER"))
    bq_auth(email = Sys.getenv("GOOGLE_AUTH_USER"),
            scopes = c("https://www.googleapis.com/auth/cloud-platform.read-only",
                       "https://www.googleapis.com/auth/devstorage.read_only"))
  } else {
    bq_auth(scopes = c("https://www.googleapis.com/auth/cloud-platform.read-only",
                       "https://www.googleapis.com/auth/devstorage.read_only"))
    message("********************************************")
    message("To automatically authenticate with Google as ", bq_user(), ", run the following in Terminal:")
    message("printf \"\\nGOOGLE_AUTH_USER=", bq_user(), "\" >> ~/.REnviron")
    message("********************************************")
  }
}
