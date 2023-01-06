import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: FirstPage(),
    );
  }
}

class Controller extends GetxController {
  var name = Rx<String?>(null);
  changeName(newName) => name.value = newName;
}

class FirstPage extends StatelessWidget {
  final c = Get.put(Controller());
  FirstPage({super.key});

  @override
  Widget build(BuildContext context) {
    // print(c.name.value);

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Obx(() => Text(c.name.value ?? "")),
          Center(
              child: ElevatedButton(
            child: Text("Pindah Kehalaman selanjutnya"),
            onPressed: () {
              Get.to(() => SecondPage())?.then((value) {
                c.changeName(value);
              });
            },
          ))
        ],
      ),
    );
  }
}

class SecondPage extends StatelessWidget {
  const SecondPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: ElevatedButton(
        child: Text("Pindah kehalaman sebelumnya"),
        onPressed: (() {
          Get.back(result: "Indra Mahesa");
        }),
      )),
    );
  }
}
