import 'package:dio/dio.dart';

class ApiError {
  String? errorDescription;
  ApiError({this.errorDescription = "Cannot process your request. Please check your network and try again"});

  ApiError.fromDio(Object dioError) {
    _handleError(dioError);
  }
  void _handleError(Object error)async {
    if (error is DioError) {
      var dioError = error; // as DioError;
      switch (dioError.type) {
        case DioExceptionType.cancel:
          errorDescription = 'Request canceled';
          break;
        case DioExceptionType.connectionTimeout:
          errorDescription = 'Connection timeout';
          break;
        case DioExceptionType.unknown:
          errorDescription = "Cannot process your request. Please check your network and try again";
          break;
        case DioExceptionType.receiveTimeout:
          errorDescription = 'Receiving timeout';
          break;
        case DioExceptionType.badResponse:
          if (error.response?.data?.containsKey("errors")) {
            // Get the map of errors
            Map<String, dynamic> errors = error.response?.data["errors"];

            // Check for specific error keys and handle them
            if (errors.containsKey("BusinessAccount")) {
              // Business Account error handling
              List<String> businessAccountErrors = List<String>.from(errors["BusinessAccount"]);
              for (String errorMessage in businessAccountErrors) {
                print(errorMessage);
                errorDescription = "$errorMessage";
                // Perform actions to handle the error
              }
            }

            // Check for specific error keys and handle them
            if (errors.containsKey("BusinessEmail")) {
              // Business Account error handling
              List<String> businessAccountErrors = List<String>.from(errors["BusinessEmail"]);
              for (String errorMessage in businessAccountErrors) {
                print(errorMessage);
                errorDescription = errorMessage;
                // Perform actions to handle the error
              }
            }
            // Check for specific error keys and handle them
            if (errors.containsKey("FirstName")) {
              // Business Account error handling
              List<String> businessAccountErrors = List<String>.from(errors["FirstName"]);
              for (String errorMessage in businessAccountErrors) {
                print(errorMessage);
                errorDescription = errorMessage;
                // Perform actions to handle the error
              }
            }

            // Check for specific error keys and handle them
            if (errors.containsKey("Email")) {
              // Business Account error handling
              List<String> businessAccountErrors = List<String>.from(errors["Email"]);
              for (String errorMessage in businessAccountErrors) {
                print(errorMessage);
                errorDescription = errorMessage;
                // Perform actions to handle the error
              }
            }

            // Check for specific error keys and handle them
            if (errors.containsKey("AccountType")) {
              // Business Account error handling
              List<String> businessAccountErrors = List<String>.from(errors["AccountType"]);
              for (String errorMessage in businessAccountErrors) {
                print(errorMessage);
                errorDescription = errorMessage;
                // Perform actions to handle the error
              }
            }

            // Check for specific error keys and handle them
            if (errors.containsKey("AccountName")) {
              // Business Account error handling
              List<String> businessAccountErrors = List<String>.from(errors["AccountName"]);
              for (String errorMessage in businessAccountErrors) {
                print(errorMessage);
                errorDescription = errorMessage;
                // Perform actions to handle the error
              }
            }

            // Check for specific error keys and handle them
            if (errors.containsKey("Email")) {
              // Business Account error handling
              List<String> businessAccountErrors = List<String>.from(errors["Email"]);
              for (String errorMessage in businessAccountErrors) {
                print("Business Account Error: $errorMessage");
                errorDescription = errorMessage;
                // Perform actions to handle the error
              }
            }

            if (errors.containsKey("User")) {
              // Users error handling
              List<String> usersErrors = List<String>.from(errors["User"]);
              for (String errorMessage in usersErrors) {
                print("Users Error: $errorMessage");
                errorDescription = errorMessage;
                // Perform actions to handle the error
              }
            }
          } else {
            errorDescription = extractDescriptionFromResponse(error.response)!;
          }
          break;
        case DioErrorType.sendTimeout:
          errorDescription = "Cannot process your request. Please check your network and try again";
          break;
        case DioErrorType.badCertificate:
          errorDescription = "Cannot process your request. Please check your network and try again";
          break;
        case DioErrorType.connectionError:
          errorDescription = "Cannot process your request. Please check your network and try again";
          break;
      }
    } else {
      errorDescription = "Cannot process your request. Please check your network and try again";
    }
  }

  String? extractDescriptionFromResponse(Response? response) {
    String? message;
    try {
      if(response?.data['data']['error'] != null) {
        message = '${message!}. ${response!.data["data"]["error"]}';
      }
      if (response?.data != null && response!.data['message'] != null) {
        message = response.data['message'];

        if(response.data['error'] != null) {
          message = '${message!}. ${response.data['error']}';
        }

      } else {
        message = response!.statusMessage;
      }

    } catch (error) {
      message = response?.statusMessage ?? error.toString();
    }

    return message;
  }

  @override
  String toString() => errorDescription ?? "Cannot process your request. Please try again";
}

