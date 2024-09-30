enum StatusRequest {
  //custom state that use to know the state of the api request
  none, //the start status
  loading, //loading on the full page
  failure, //error on the full page
  timeOutFailure, //error on the full page
  offlineFailure, //error on the full page
  paginating, //small loading in the bottom of page
  paginatingFailure, //toast error
  refresh, //for refresh indicator
  loadingPartOfPage, //loading part of the  page
  errorPartOfPage, //error part of the  page
}
