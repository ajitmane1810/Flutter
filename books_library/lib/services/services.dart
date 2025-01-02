import 'dart:convert';
import 'package:http/http.dart' as http;

class BookService {
  final String baseUrl = 'http://localhost:8080';

  Future<List<dynamic>> fetchBooks() async {  // Change void to List<dynamic>
    final response = await http.get(Uri.parse('$baseUrl/getBooks'));
    if (response.statusCode == 200) {
      return json.decode(response.body); // Return the decoded JSON
    } else {
      throw Exception('Failed to load books');
    }
  }


   Future<void> editBook(int id, Map<String, dynamic> bookDetails) async {
    final response = await http.put(
      Uri.parse('$baseUrl/edit/$id'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: json.encode(bookDetails),
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to edit book');
    }
  }


    Future<void> deleteBook(int id) async {
    final response = await http.delete(Uri.parse('$baseUrl/delete/$id'));

    if (response.statusCode != 200) {
      throw Exception('Failed to delete book');
    }
  }
}
