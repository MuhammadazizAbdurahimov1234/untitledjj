import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:untitledjj/add.dart';
import 'package:untitledjj/maxsulot.dart';

late Box<Maxsulot> maxsulotBox;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(MaxsulotAdapter());
  maxsulotBox = await Hive.openBox("maxsulot");
  runApp(MaterialApp(
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView.builder(
          itemCount: maxsulotBox.length,
          itemBuilder: (BuildContext context, int index) {
        return InkWell(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (_) => oyna(index: index))).then(
              (value) {
                setState(() {});
              },
            );
          },
          child: Container(
            margin: EdgeInsets.only(top: 5, bottom: 5, left: 10, right: 10),
            decoration: BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(width: 2, color: Colors.red)),
            child: Column(
              children: [
                Text("Nomi:${maxsulotBox.getAt(index)?.soni ?? ""}",
                    style: TextStyle(
                        fontSize: 25,
                        color: Colors.red,
                        fontWeight: FontWeight.bold)),
                MaterialButton(onPressed: (){setState(() {
                  maxsulotBox.delete(index);
                });},child: Icon(Icons.remove_circle),)
              ],
            ),
          ),
        );
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (_)=>oyna())).then((value){
            setState(() {
            });
          });
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
