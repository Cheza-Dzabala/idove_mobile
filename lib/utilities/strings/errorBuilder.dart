import 'package:idove/extentions/StringUtilities.dart';

String buildErrors(Map<String, dynamic> response_map) {
  String errorBody = 'Please see the reasons below: \n';
  Map<String, dynamic> errorMap = response_map['errors'];
  errorMap.forEach((key, value) {
    String errorValues = '';
    for (var error in value) {
      if (error != null) {
        errorValues = '$errorValues\n$error';
      }
    }
    errorBody = '$errorBody\n${key.capitalize()}\n$errorValues\n';
  });
  return errorBody;
}
