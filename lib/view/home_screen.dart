import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String savedName = "no data";
  TextEditingController nameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              controller: nameController,
              decoration: InputDecoration(border: OutlineInputBorder()),
            ),
            ElevatedButton(
                onPressed: () async {
// Obtain shared preferences.
                  final SharedPreferences prefs =
                      await SharedPreferences.getInstance();

                  // Save an String value to 'action' key.
                  await prefs.setString('name', nameController.text);
                },
                child: Text("save")),
            ElevatedButton(
                onPressed: () async {
// Obtain shared preferences.
                  final SharedPreferences prefs =
                      await SharedPreferences.getInstance();

                  // / Try reading data from the 'action' key. If it doesn't exist, returns null.
                  savedName = prefs.getString('name') ?? "no data ";
                  setState(() {});
                },
                child: Text("get")),
            Text(savedName)
          ],
        ),
      ),
    );
  }
}
