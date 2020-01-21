import 'package:uas_visual/landing.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'main.dart';


class EditData extends StatefulWidget {
  final List list;
  final int index;
  EditData({this.list, this.index});
  @override
  _EditDataState createState() => _EditDataState();
}

class _EditDataState extends State<EditData> {
  TextEditingController controllernpm = new TextEditingController();
  TextEditingController controllernama = new TextEditingController();
  TextEditingController controllertempatlahir = new TextEditingController();
  TextEditingController controllertanggallahir = new TextEditingController();
  TextEditingController controllerjeniskelamin = new TextEditingController();
  TextEditingController controlleragama = new TextEditingController();
  TextEditingController controllernotelp = new TextEditingController();
  TextEditingController controlleralamat = new TextEditingController();
 
  void editData() {
    var url = "http://10.0.2.2/mahasiswa/editPegawai.php";
    http.post(url, body: {
      "id": widget.list[widget.index]['id'],
      "npm": controllernpm.text,
      "nama": controllernama.text,
      "tempat_lahir": controllertempatlahir.text,
      "tanggal_lahir": controllertanggallahir.text,
      "jenis_kelamin": controllerjeniskelamin.text,
      "agama": controlleragama.text,
      "no_telp": controllernotelp.text,
      "alamat": controlleralamat.text
    });
  }

  @override
  void initState() {
    controllernpm =
        new TextEditingController(text: widget.list[widget.index]['npm']);
    controllernama =
        new TextEditingController(text: widget.list[widget.index]['nama']);
    controllertempatlahir = new TextEditingController(
        text: widget.list[widget.index]['tempat_lahir']);
    controllertanggallahir = new TextEditingController(
        text: widget.list[widget.index]['tanggal_lahir']);
    controllerjeniskelamin = new TextEditingController(
        text: widget.list[widget.index]['jenis_kelamin']);
    controlleragama =
        new TextEditingController(text: widget.list[widget.index]['agama']);
    controllernotelp =
        new TextEditingController(text: widget.list[widget.index]['no_telp']);
    controlleralamat =
        new TextEditingController(text: widget.list[widget.index]['alamat']);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
// TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        title: Text('Edit Data Mahasiswa'),
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView(
          children: <Widget>[
            new Column(
              children: <Widget>[
                new Padding(padding: new EdgeInsets.only(top: 15.0)),
                new TextField(
                    controller: controllernpm,
                    decoration: new InputDecoration(
                        hintText: "Input Npm",
                        labelText: "Npm",
                        border: new OutlineInputBorder(
                            borderRadius: new BorderRadius.circular(20.0)))),
                new Padding(padding: new EdgeInsets.all(5.0)),
                new TextField(
                    controller: controllernama,
                    decoration: new InputDecoration(
                        hintText: "Input Nama Mahasiswa",
                        labelText: "Nama Mahasiswa",
                        border: new OutlineInputBorder(
                            borderRadius: new BorderRadius.circular(20.0)))),
                new Padding(padding: new EdgeInsets.all(5.0)),
                new TextField(
                    controller: controllertempatlahir,
                    decoration: new InputDecoration(
                        hintText: "Input Tempat Lahir",
                        labelText: "Tempat Lahir",
                        border: new OutlineInputBorder(
                            borderRadius: new BorderRadius.circular(20.0)))),
                new Padding(padding: const EdgeInsets.all(5.0)),
                new TextField(
                    controller: controllertanggallahir,
                    decoration: new InputDecoration(
                        hintText: "Input Tanggal Lahir",
                        labelText: "Tanggal Lahir",
                        border: new OutlineInputBorder(
                            borderRadius: new BorderRadius.circular(20.0)))),
                new Padding(padding: new EdgeInsets.all(5.0)),
                new TextField(
                    controller: controllerjeniskelamin,
                    decoration: new InputDecoration(
                        hintText: "Input Jenis Kelamin",
                        labelText: "Jenis kelamin",
                        border: new OutlineInputBorder(
                            borderRadius: new BorderRadius.circular(20.0)))),
                new Padding(padding: new EdgeInsets.all(5.0)),
                new TextField(
                    controller: controlleragama,
                    decoration: new InputDecoration(
                        hintText: "Input Agama",
                        labelText: "Agama",
                        border: new OutlineInputBorder(
                            borderRadius: new BorderRadius.circular(20.0)))),
                new Padding(padding: new EdgeInsets.all(5.0)),
                new TextField(
                    controller: controllernotelp,
                    decoration: new InputDecoration(
                        hintText: "Input No Telp",
                        labelText: "No Telp",
                        border: new OutlineInputBorder(
                            borderRadius: new BorderRadius.circular(20.0)))),
                new Padding(padding: new EdgeInsets.all(5.0)),
                new TextField(
                    controller: controlleralamat,
                    decoration: new InputDecoration(
                        hintText: "Input Alamat",
                        labelText: "Alamat",
                        border: new OutlineInputBorder(
                            borderRadius: new BorderRadius.circular(20.0)))),
                new Padding(padding: new EdgeInsets.all(5.0)),
                new RaisedButton(
                  child: new Text("Edit Data"),
                  color: Colors.blueAccent,
                  onPressed: () {
                    editData();
                    Navigator.of(context).push(new MaterialPageRoute(
                        builder: (BuildContext context) => new landing()));
                  },
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
