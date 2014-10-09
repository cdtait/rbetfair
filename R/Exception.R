################################################################################
#  Interface:   Exception
#  Description: Exception API-NG
#  Version:     1.0.0
#  Owner:       BDP
#  Date:        now()
#  Generated:   08-Oct-2014
################################################################################

################################################################################
#' @title APINGException
#' @description This exception is thrown when an operation fails
#' @usage APINGException(errorCode,errorDetails,requestUUID)
#' @param errorCode of type string
#'            the unique code for this error
#' @details {
#'   \itemize{
#'     \item {     INVALID_INPUT_DATA
#'            Invalid input data
#'     }
#'     \item {     INVALID_SESSION_INFORMATION
#'            The session token passed is invalid
#'     }
#'     \item {      NO_APP_KEY
#'            An application key is required for this operation
#'     }
#'     \item {     NO_SESSION
#'            A session token is required for this operation
#'     }
#'     \item {      INVALID_APP_KEY
#'            The application key passed is invalid
#'     }
#'     \item {     UNEXPECTED_ERROR
#'            An unexpected internal error occurred that prevented successful
#'            request processing.
#'     }
#'   }
#' }
#' @param errorDetails of type string
#'            Specific error details
#' @param requestUUID of type string
#'           
################################################################################
APINGException<-function(errorCode,errorDetails,requestUUID) {
  ex=paste0('APINGException ',' errorCode=',errorCode,'
  errorDetails=',errorDetails,' requestUUID=',requestUUID)
  stop(ex)
}
