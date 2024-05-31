import 'package:http/http.dart' as http;
import 'dart:convert';

Future<List<Map<String, dynamic>>> getDataKetinggianAir() async {
  final url =
      'https://zfdffrb4hk.execute-api.ap-southeast-2.amazonaws.com/default/ketinggianAir';
  try {
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      data.forEach((element) {
        String timeString = element["timestamp"];
        List<String> parts = timeString.split(' ');

        if (parts.length == 2) {
          // Pastikan terdapat dua bagian: tanggal dan waktu
          List<String> dateParts = parts[0].split('/');
          List<String> timeParts = parts[1].split(':');

          if (dateParts.length == 3 && timeParts.length == 3) {
            // Pastikan setiap bagian memiliki tiga elemen
            int day = int.parse(dateParts[0]);
            int month = int.parse(dateParts[1]);
            int year = int.parse(dateParts[2]);
            int hour = int.parse(timeParts[0]);
            int minute = int.parse(timeParts[1]);
            int second = int.parse(timeParts[2]);

            DateTime dateTime =
                DateTime(year, month, day, hour, minute, second);
            int seconds = dateTime.second;
            element["timestamp"] = seconds.toString();
          } else {
            print("Format waktu tidak valid");
          }
        } else {
          print("Format waktu tidak valid");
        }
      });
      print(data);

      return data.cast<Map<String, dynamic>>();
    } else {
      print('Failed to load data: ${response.statusCode}');
      return [];
    }
  } catch (e) {
    print('Error: $e');
    return [];
  }
}
