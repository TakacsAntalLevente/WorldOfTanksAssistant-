import 'package:http/http.dart' as http;

void main() async {
  final uri = Uri.https(
    'api.worldoftanks.eu',
    '/wot/account/list/',
    {'application_id': 'ab81424e1f5c55900a863d4310142138', 'search': 'levente_2017_destroyer'},
  );

  try {
    final response = await http.get(uri);
    print(response.body);
  } catch (e) {
    print('Error: $e');
  }
}

