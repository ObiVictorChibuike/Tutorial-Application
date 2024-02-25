import 'dio_data_state.dart';

isApiResponseCompleted(NetworkDataResponse response) {
  return response.status == Status.COMPLETED;
}

isApiResponseError(NetworkDataResponse response) {
  return response.status == Status.ERROR;
}

isApiResponseLoading(NetworkDataResponse response) {
  return response.status == Status.LOADING;
}
