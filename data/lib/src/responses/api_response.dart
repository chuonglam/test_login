class ApiResponse<T> {
  final T? data;
  final int statusCode;
  final String? message;
  ApiResponse({
    required this.statusCode,
    this.data,
    this.message,
  });

  factory ApiResponse.fromJson(Map<String, dynamic> json,
      T Function(Map<String, dynamic>? dataFieldJson) fromJsonT) {
    final dataFieldJson = json['data'];
    return ApiResponse<T>(
      data: dataFieldJson == null ? null : fromJsonT(dataFieldJson),
      statusCode: json['statusCode'] as int,
      message: json['message'] as String?,
    );
  }
}
