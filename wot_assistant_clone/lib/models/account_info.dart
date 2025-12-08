class AccountInfo {
  final String nickname;
  final int accountId;
  final int globalRating;
  final int battles;
  final int wins;

  AccountInfo({
    required this.nickname,
    required this.accountId,
    required this.globalRating,
    required this.battles,
    required this.wins,
  });

  factory AccountInfo.fromJson(Map<String, dynamic> json) {
    final info = json['statistics']['all'] ?? {};
    return AccountInfo(
      nickname: json['nickname'] as String,
      accountId: json['account_id'] as int,
      globalRating: json['global_rating'] as int? ?? 0,
      battles: info['battles'] as int? ?? 0,
      wins: info['wins'] as int? ?? 0,
    );
  }
}
