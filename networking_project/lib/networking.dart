import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Album {
  final int userId;
  final String userName, email;

  Album({required this.email, required this.userId, required this.userName});

  // to change from Json to object, we create a factory function which takes the json object and maps into Album object and returns it
  //A factory constructor invokes another constructor and Since a factory constructor does not directly create a new instance, it cannot use a constructor initializer list
  // A normal constructor always returns a new instance of the class. A factory constructor is permitted to return an existing instance, an instance of a derived class,
  //or null. (However, some people dislike returning null from a factory constructor. Note that returning null from a factory constructor is disallowed with null-safety.)

// here Album.fromJson is a factory constructor, it is used either for loading from cache or here for initializing a variable using logic that can’t be handled in the initializer list
  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(
        userId: json['id'], email: json['email'], userName: json['username']);
  }
}

Future<Album> fetchAlbum() async {
  var url = Uri.parse(
      'https://jsonplaceholder.typicode.com/users/1'); // parse this url

  var response =
      await http.get(url); // now we await for this url to send response

  // You can print the url, it's the same just parsed creating a uri object
  // Now we check the response code and if 200, we work with it's body
  if (response.statusCode == 200) {
    // now make use of it's body creating object by decoding the Json first
    final decoded = jsonDecode(response.body); // the body has the json object

    // this decoded variable is now a Map<String, Dynamic>
    return Album.fromJson(decoded);
    // return decoded.map<Album>((json) => Album.fromJson(json)).toList();

    // For making a list of values, we need to have the json/decoded and map to List by taking each json value, use fromJson and do toList()
  } else {
    //  either print the status code as print('Request failed with status: $response.statusCode); or the below
    throw Exception(
        'Cannot fetch Album as response code ${response.statusCode} is not 200');
  }
}

class ParseData extends StatefulWidget {
  const ParseData({Key? key}) : super(key: key);

  @override
  State<ParseData> createState() => _ParseDataState();
}

class _ParseDataState extends State<ParseData> {
  late Future<Album>
      futureAlbum; // late as we get it's val after async and not before the fn call

  @override
  void initState() {
    super.initState();
    // we call the fetch fn while we do initialisation as that makes sense while init
    futureAlbum = fetchAlbum();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Response body"),
        backgroundColor: Colors.teal[400],
      ),
      body: Center(
        child: FutureBuilder<Album>(
          future: futureAlbum,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Text(snapshot.data!.email);
              // ! for saying it is non-nullable so check for that and ? for can be null, error if null. Use ! when sure no null value
            } else if (snapshot.hasError) {
              return Text(snapshot.error.toString()); // object to string
            }

            // till the time return circular indicator
            return const CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}

/*
If we had to to handle multiple objects, we have to use a List to store those objects made from Json
var jsonData = jsonDecode(response.body)
List<Album> users =[];

// loop as multiple json objects inside this jsonData. We use allbum to be added to list instead of fromJson() factory constructor

this function returns the futureVal which is used as future of FutureBuilder
for(curr in jsonData)
{
  Album album = Album(userId: curr['id'], email: curr['email'], userName: curr['username']);
  users.add(album);
  print(users.length);

  return users; // Future<List<Album>> or simply Future

  Inside the FutureBuilder use ListView.builder with itemBuilder and return tiles with snapshot.data[i].username

  // https://www.youtube.com/watch?v=hgPTvi0OM4A
}
*/