import 'package:flutter/material.dart';
import 'services/wot_api.dart';
import 'models/player.dart';
import 'models/account_info.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text("Wot Assistant")),
        body: const Center(child: PlayerSearchWidget()),
      ),
    );
  }
}

class PlayerSearchWidget extends StatefulWidget {
  const PlayerSearchWidget({super.key});

  @override
  _PlayerSearchWidgetState createState() => _PlayerSearchWidgetState();
}

class _PlayerSearchWidgetState extends State<PlayerSearchWidget> {
  List<Player> players = [];

  void search() async {
    final result = await WotApi.searchPlayer('Levente_2017_destroyer');
    setState(() {
      players = result;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
          onPressed: search,
          child: const Text("Search Player"),
        ),
        ...players.map((p) => Text('${p.nickname} (ID: ${p.accountId})'))
      ],
    );
  }
}
