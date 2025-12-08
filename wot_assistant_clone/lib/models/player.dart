class Player {
  final String nickname;
  final int accountId;

  Player({required this.nickname, required this.accountId});

  factory Player.fromJson(Map<String, dynamic> json) {
    return Player(
      nickname: json['nickname'] as String,
      accountId: json['account_id'] as int,
    );
  }
}
