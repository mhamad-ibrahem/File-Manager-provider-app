class LocalUserData {
  String? token;
  String? refreshToken;
  String? id;
  int? clientId;
  String? type;
  String? status;
  String? nameAr;
  String? nameEn;
  String? email;
  String? password;
  bool? isActive;
  bool? isSubscribedInSolidarityFund;

  LocalUserData({
    required this.token,
    this.refreshToken,
    this.id,
    required this.clientId,
    required this.type,
    this.status,
    required this.nameAr,
    this.nameEn,
    required this.email,
    required this.password,
    this.isActive,
    this.isSubscribedInSolidarityFund,
  });

  factory LocalUserData.fromJson(Map<String, dynamic> json) {
    return LocalUserData(
        token: json['token'],
        refreshToken: json['refreshToken'],
        id: json['id'],
        clientId: json['clientId'],
        type: json['type'],
        status: json['status'],
        nameAr: json['nameAr'],
        nameEn: json['nameEn'],
        isActive: json['isActive'],
        isSubscribedInSolidarityFund: json['isSubscribedInSolidarityFund'],
        email: json['email'],
        password: json['password']);
  }
  LocalUserData copyWith({
    String? token,
    String? refreshToken,
    String? id,
    int? clientId,
    String? type,
    String? status,
    String? nameAr,
    String? nameEn,
    String? email,
    String? password,
    bool? isActive,
    bool? isSubscribedInSolidarityFund,
  }) {
    return LocalUserData(
        token: token ?? this.token,
        id: id ?? this.id,
        nameEn: nameEn ?? this.nameEn,
        refreshToken: refreshToken ?? this.refreshToken,
        status: status ?? this.status,
        clientId: clientId ?? this.clientId,
        type: type ?? this.type,
        nameAr: nameAr ?? this.nameAr,
        email: email ?? this.email,
        password: password ?? this.password,
        isActive: isActive ?? this.isActive,
        isSubscribedInSolidarityFund:
            isSubscribedInSolidarityFund ?? this.isSubscribedInSolidarityFund);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['token'] = token;
    data['refreshToken'] = refreshToken;
    data['id'] = id;
    data['clientId'] = clientId;
    data['type'] = type;
    data['status'] = status;
    data['nameAr'] = nameAr;
    data['nameEn'] = nameEn;
    data['email'] = email;
    data['password'] = password;
    data['isActive'] = isActive;
    data['isSubscribedInSolidarityFund'] = isSubscribedInSolidarityFund;
    return data;
  }
}
