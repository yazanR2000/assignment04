import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Home();
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool flutterCourse = false;
  bool reactCourse = false;

  final List<Map<String, String>> _logos = [];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(),
        body: Container(
          child: Column(
            children: [
              Text(
                "Please selecet you Course!",
                style: TextStyle(
                    fontSize: 30,
                    color: Colors.purple,
                    fontWeight: FontWeight.bold),
              ),
              Divider(height: 35),
              CheckboxListTile(
                  secondary: Icon(
                    Icons.book,
                    color: Colors.amber,
                  ),
                  subtitle: Text("based on dart programming",
                      style: TextStyle(
                          fontStyle: FontStyle.italic,
                          fontSize: 20,
                          color: Colors.green[700])),
                  title: Text(
                    "Flutter",
                    style: TextStyle(
                        fontSize: 25,
                        color: Colors.blue,
                        fontWeight: FontWeight.bold),
                  ),
                  value: flutterCourse,
                  onChanged: ((val) {
                    setState(() {
                      flutterCourse = val!;
                      if (flutterCourse) {
                        _logos.add({
                          "imageUrl":
                              "https://upload.wikimedia.org/wikipedia/commons/thumb/4/44/Google-flutter-logo.svg/2560px-Google-flutter-logo.svg.png",
                          "name": "flutter"
                        });
                      } else {
                        _logos.removeWhere(
                            (element) => element['name'] == "flutter");
                      }
                    });
                  })),
              CheckboxListTile(
                secondary: Icon(
                  Icons.book,
                  color: Colors.amber,
                ),
                subtitle: Text(
                  "based on dart programming",
                  style: TextStyle(
                      fontSize: 20,
                      fontStyle: FontStyle.italic,
                      color: Colors.green[700]),
                ),
                title: Text(
                  "React",
                  style: TextStyle(
                      fontSize: 25,
                      color: Colors.blue,
                      fontWeight: FontWeight.bold),
                ),
                value: reactCourse,
                onChanged: ((val) {
                  setState(() {
                    reactCourse = val!;
                    if (reactCourse) {
                      _logos.add({
                        "imageUrl":
                            "https://logos-download.com/wp-content/uploads/2016/09/React_logo_wordmark.png",
                        "name": "react"
                      });
                    } else {
                      _logos
                          .removeWhere((element) => element['name'] == "react");
                    }
                  });
                }),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: List.generate(_logos.length, (index) {
                      return Expanded(
                        child: Image.network(_logos[index]['imageUrl']!,fit: BoxFit.contain,),
                      );
                    }),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
