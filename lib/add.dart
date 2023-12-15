import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitledjj/main.dart';
import 'package:untitledjj/maxsulot.dart';

class oyna extends StatefulWidget {
  const oyna({super.key, this.index});

  final int? index;

  @override
  State<oyna> createState() => _oynaState();
}

class _oynaState extends State<oyna> {
  TextEditingController nomitxt = TextEditingController();
  TextEditingController sonitxt = TextEditingController();

  @override
  void initState() {
    super.initState();
    if (widget.index != null) {
      nomitxt = TextEditingController(
          text: maxsulotBox.getAt(widget.index!)?.nomi ?? "");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Maxsulot qoshish"),
      ),
      body: Column(
        children: [
          Container(
              height: 60,
              padding: EdgeInsets.only(left: 5),
              width: MediaQuery.of(context).size.height,
              margin: EdgeInsets.all(10),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.green, width: 3),
                borderRadius: BorderRadius.circular(10),
              ),
              child: TextField(
                controller: nomitxt,
                style: TextStyle(fontSize: 25),
                decoration: InputDecoration(hintText: "Maxsulot nomi"),
              )),
          Container(
              height: 60,
              padding: EdgeInsets.only(left: 5),
              width: MediaQuery.of(context).size.height,
              margin: EdgeInsets.all(10),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.green, width: 3),
                borderRadius: BorderRadius.circular(10),
              ),
              child: TextField(
                controller: sonitxt,
                style: TextStyle(fontSize: 25),
                decoration: InputDecoration(hintText: "Maxsulot soni"),
              )),
          Container(
            height: 60,
            padding: EdgeInsets.only(left: 5),
            width: MediaQuery.of(context).size.height,
            margin: EdgeInsets.all(10),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.green, width: 3),
              borderRadius: BorderRadius.circular(10),
            ),
            child: MaterialButton(
              onPressed: () {
                if (widget.index != null) {
                  int maxsulotSoni =
                      maxsulotBox.getAt(widget.index!)?.soni ?? 0;
                  maxsulotSoni = maxsulotSoni + int.parse(sonitxt.text);
                  Maxsulot maxsulot = Maxsulot(nomitxt.text, maxsulotSoni);
                  maxsulotBox.putAt(widget.index!, maxsulot);
                } else {
                  Maxsulot maxsulot =
                      Maxsulot(nomitxt.text, int.parse(sonitxt.text));
                  maxsulotBox.add(maxsulot);
                }
                Navigator.pop(context);
              },
              child: Text(
                "Qoshish",
                style: TextStyle(
                  color: Colors.blue,
                  fontWeight: FontWeight.bold,
                  fontSize: 20
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
