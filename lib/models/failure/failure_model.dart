class FailureModel {
  bool? success;
  String? error;
  int? code;
  FailureModel({required this.success,required this.error,required this.code});
  FailureModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    error = json['error'];
    code=json['status'];
  }
}
