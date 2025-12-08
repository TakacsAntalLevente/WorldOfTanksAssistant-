import 'dart:convert';
import 'package:http/http.dart' as http;

import '../models/player.dart';
import '../models/account_info.dart';

class WotApi {
  static const String baseDomain = "api.worldoftanks.eu";
  static const String applicationId = "ab81424e1f5c55900a863d4310142138";

  /// Search for player by nickname
  static Future<List<Player>> searchPlayer(String nickname) async {
    final uri = Uri.https(
      baseDomain,
      '/wot/account/list/',
      {
        'application_id': applicationId,
        'search': nickname,
      },
    );

    final response = await http.get(uri);

    if (response.statusCode != 200) {
      throw Exception("Failed to load player data: ${response.statusCode}");
    }

    final data = jsonDecode(response.body);
    final List<dynamic> playersJson = data['data'] ?? [];
    return playersJson.map((json) => Player.fromJson(json)).toList();
  }

  /// Get detailed account info by account ID
  static Future<AccountInfo> getAccountInfo(int accountId) async {
    final uri = Uri.https(
      baseDomain,
      '/wot/account/info/',
      {
        'application_id': applicationId,
        'account_id': accountId.toString(),
      },
    );

    final response = await http.get(uri);

    if (response.statusCode != 200) {
      throw Exception("Failed to load account info: ${response.statusCode}");
    }

    final data = jsonDecode(response.body);
    final json = data['data']["$accountId"];
    if (json == null) {
      throw Exception("No account info found for ID $accountId");
    }

    return AccountInfo.fromJson(json);
  }
}
