import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:questginix/main/mmodel/genratequestion.dart';
import 'package:questginix/main/mmodel/mainresult.dart';
import 'package:questginix/main/repo/baseurl.dart';

class RolesRepository {
  static final BaseOptions _baseOptions = BaseOptions(
    connectTimeout: const Duration(seconds: 10),
    baseUrl: UrlEndpoints.baseUrl,
  );
  Dio dio = Dio(_baseOptions);

  Future<GenrateQuestion> question(
      String topic, String language, String level) async {
    try {
      final response = await dio.post(UrlEndpoints.genratequestion, data: {
        "topic": topic,
        "languages": language.split(","),
        "level": level
      });
      log("${response.data}");
      // List<String>
      return GenrateQuestion(question: response.data["questions"]);
    } catch (error) {
      log(error.toString());
      DioException e = error as DioException;
      throw ApiErrorHandler.getErrorMessage(e);
    }
  }

  Future<ResultMain> result(
    List<GenrateAnswer> topic,
  ) async {
    try {
      dio.interceptors.add(PrettyDioLogger());
      var data = {
        "qa_pairs": topic
            .map((e) => {"question": e.question, "answer": e.answer})
            .toList()
      };
      log("message $data");
      final response = await dio.post(UrlEndpoints.evaluateAnswers, data: {
        "qa_pairs": topic
            .map((e) => {"question": e.question, "answer": e.answer})
            .toList()
      });
      log("${response.data}");
      // List<String>
      return ResultMain.fromJson(response.data);
    } catch (error) {
      log(error.toString());
      DioException e = error as DioException;
      throw ApiErrorHandler.getErrorMessage(e);
    }
  }
}

class ApiErrorHandler {
  // NormalMessage mySingleton = NormalMessage.instance;

  // Access the element from the singleton.
  // String elementValue = mySingleton.myElement;
  static String getErrorMessage(DioException error) {
    if (error.type == DioExceptionType.connectionTimeout) {
      return 'Connection timeout';
    } else if (error.type == DioExceptionType.receiveTimeout) {
      return 'Receive timeout';
    } else if (error.type == DioExceptionType.badResponse) {
      // Handle different status codes
      final statusCode = error.response?.statusCode;
      switch (statusCode) {
        case 400:
          return error.response!.data['message'];
        case 401:
          return NormalMessage().unauthenticatedError;
        case 403:
          return error.response!.data['message'];
        case 404:
          return "NO DATA FOUND";
        case 500:
          return NormalMessage().serverError;
        // Add more cases as needed
        default:
          return NormalMessage().serverError;
      }
    } else if (error.type == DioExceptionType.unknown) {
      return NormalMessage().serverError;
    } else {
      return NormalMessage().serverError;
    }
  }
}

class NormalMessage {
  NormalMessage._();

  static final NormalMessage _instance = NormalMessage._();

  factory NormalMessage() {
    return _instance;
  }
  static NormalMessage get instance => _instance;

  String passwordMessage =
      "Password should be Between 8-16 characters long. And it should contain Atleast One Number, One Special Character,One Uppercase and One Lowercase.";
  String emailMessage = "Please enter valid Email ID";
  String phoneoremailMessage =
      "Please enter valid email address or phone number.";
  String firstNameEmpty = "Please enter Name";
  String emailEmpty = "Please enter Email ID.";
  String emailorPhoneEmpty = "Please enter email id or phone no.";
  String phoneEmpty = "Please enter phone number";
  String holdernameEmpty = "Please enter card holder name";
  String cardnumberEmpty = "Please enter card number";
  String expireEmpty = "Please enter expiry date";
  String cvvEmpty = "Please enter cvv number";
  String phoneMessage = "Contact number should be between 6 to 15 digits.";
  String passwordEmpty = "Please enter password";
  String newpasswordEmpty = "Please enter new password";
  String confirmpasswordEmpty = "Please enter confirm password";
  String oldpasswordEmpty = "Please enter old password";
  String confirmpasswordValidation =
      "New Password & Confirm Password must be same.";
  String mainconfirmpasswordValidation =
      "New Password & Confirm Password must be same.";
  var phoneoremail = RegExp(
      '^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})|(^[0-9]{10-16})+\$');
  String onlycharvalidation =
      "Name should not contain any special characters or numbers!";
  RegExp validateEmail = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
  RegExp firstName = RegExp(r"^[A-Za-z,a-zA-Z]{1,15}$");
  RegExp validationName = RegExp(r'^[A-Z a-z]+$');

  RegExp validatePassword =
      RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,16}$');
  bool checkemail(String email) {
    if (validateEmail.hasMatch(email) == true) {
      List data = email.split("@");
      List data1 = data[1].toString().split(".");

      if (data1.length > 2) {
        return false;
      } else {
        return true;
      }
    } else {
      return false;
    }
  }

  final RegExp phoneNumberRegex = RegExp(r'^(\+)?[0-9]{6,15}$');
  // String baseUrl = "https://dev.webmobrildemo.com/parqd";
  // String baseUrl = "http://44.217.173.175";
// RegExp validateNumber = RegExp(r'[0-9]{10,12}$)');
  RegExp fullname = RegExp(r'^(?=.*[A-Za-z]).{2,}');
  RegExp phonenumbervalidate = RegExp(r'^[0-9]');
  String connecting = "Connecting...";
  String loading = "Please wait...";
  String serverError = "Server not responding, Please retry";
  String unauthenticatedError = "Unauthenticated";
  String somethingWentWrong = "Something went wrong.";
  String unableToParse = "Issue in Response Parsing";
  String endPointError = "Method end point is in-correct";
  String successfullyParse = "done";
  String internetConnectionError =
      "You have no internet connection. Please enable Wi-fi or Mobile Data and try again";
  String unauthenticatedmessage =
      "You have been logged out of the app. Please try logging in again.";
}
