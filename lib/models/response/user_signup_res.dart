class UserSignupRes {
  final int status;
  final String message;
  final int userId;
  final String securityToken;
  final bool isReferrerCode;

  UserSignupRes({
    required this.status,
    required this.message,
    required this.userId,
    required this.securityToken,
    required this.isReferrerCode,
  });

  factory UserSignupRes.fromJson(Map<String, dynamic> json) {
    return UserSignupRes(
      status: json['status'] as int,
      message: json['message'] as String,
      userId: json['userId'] as int,
      securityToken: json['securityToken'] as String,
      isReferrerCode: json['isReferrerCode'] as bool,
    );
  }
}
