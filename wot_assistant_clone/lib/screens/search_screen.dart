import 'package:flutter/material.dart';
import '../services/wot_api.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _controller = TextEditingController();
  List<dynamic> results = [];
  bool loading = false;

  void search() async {
    setState(() => loading = true);
    final data = await WotApi.searchPlayer(_controller.text);
    setState(() {
      results = data;
      loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("WoT Assistant Clone")),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              decoration: InputDecoration(
                labelText: "Enter player nickname",
                suffixIcon: IconButton(
                  icon: Icon(Icons.search),
                  onPressed: search,
                ),
              ),
            ),
            SizedBox(height: 20),

            if (loading) CircularProgressIndicator(),

            Expanded(
              child: ListView.builder(
                itemCount: results.length,
                itemBuilder: (context, i) {
                  final player = results[i];
                  return ListTile(
                    title: Text(player["nickname"]),
                    subtitle: Text("ID: ${player["account_id"]}"),
                    onTap: () {
                      // next step: open player stats screen
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
