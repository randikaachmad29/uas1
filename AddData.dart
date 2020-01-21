import 'package:uas_visual/landing.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'main.dart';

class AddData extends StatefulWidget {
  @override
  _AddDataState createState() => _AddDataState();
}
class _AddDataState extends State<AddData> {
  TextEditingController npmController = new TextEditingController();
  TextEditingController namaController = new TextEditingController();
  TextEditingController tempatlahirController = new TextEditingController();
  TextEditingController tanggallahirController = new TextEditingController();
  TextEditingController jeniskelaminController = new TextEditingController();
  TextEditingController agamaController = new TextEditingController();
  TextEditingController notelpController = new TextEditingController();
  TextEditingController alamatController = new TextEditingController();
  void addData() {
    var url = "http://10.0.2.2/mahasiswa/tambahPegawai.php";
    http.post(url, body: {
      "npm": npmController.text,
      "nama": namaController.text,
      "tempat_lahir": tempatlahirController.text,
      "tanggal_lahir": tanggallahirController.text,
      "jenis_kelamin": jeniskelaminController.text,
      "agama": agamaController.text,
      "no_telp": notelpController.text,
      "alamat": alamatController.text
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: Text("Tambah Data Mahasiswa"),
        backgroundColor: Colors.cyan,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView(
          children: <Widget>[
            new Column(
              children: <Widget>[
                new Padding(padding: new EdgeInsets.only(top: 15.0)),
                new TextField(
                    controller: npmController,
                    decoration: new InputDecoration(
                        hintText: "Input Npm",
                        labelText: "Npm Mahasiswa",
                        border: new OutlineInputBorder(
                            borderRadius: new BorderRadius.circular(20.0)))),
                new Padding(padding: new EdgeInsets.all(5.0)),
                new TextField(
                    controller: namaController,
                    decoration: new InputDecoration(
                        hintText: "Input Nama Mahasiswa",
                        labelText: "Nama Mahasiswa",
                        border: new OutlineInputBorder(
                            borderRadius: new BorderRadius.circular(20.0)))),
                new Padding(padding: new EdgeInsets.all(5.0)),
                new TextField(
                    controller: tempatlahirController,
                    decoration: new InputDecoration(
                        hintText: "Input Tempat Lahir",
                        labelText: "Tempat Lahir",
                        border: new OutlineInputBorder(
                            borderRadius: new BorderRadius.circular(20.0)))),
                new Padding(padding: const EdgeInsets.all(5.0)),
                new TextField(
                    controller: tanggallahirController,
                    decoration: new InputDecoration(
                        hintText: "Input Tanggal Lahir",
                        labelText: "Tanggal lahir",
                        border: new OutlineInputBorder(
                            borderRadius: new BorderRadius.circular(20.0)))),
                new Padding(padding: new EdgeInsets.all(5.0)),
                new TextField(
                    controller: jeniskelaminController,
                    decoration: new InputDecoration(
                        hintText: "Input Jenis kelamin",
                        labelText: "Jenis Kelamin",
                        border: new OutlineInputBorder(
                            borderRadius: new BorderRadius.circular(20.0)))),
                new Padding(padding: new EdgeInsets.all(5.0)),
                new TextField(
                    controller: agamaController,
                    decoration: new InputDecoration(
                        hintText: "Input Agama",
                        labelText: "Agama Mahasiswa",
                        border: new OutlineInputBorder(
                            borderRadius: new BorderRadius.circular(20.0)))),
                new Padding(padding: new EdgeInsets.all(5.0)),
                new TextField(
                    controller: notelpController,
                    decoration: new InputDecoration(
                        hintText: "Input No telp",
                        labelText: "No telp",
                        border: new OutlineInputBorder(
                            borderRadius: new BorderRadius.circular(20.0)))),
                new Padding(padding: new EdgeInsets.all(5.0)),
                new TextField(
                    controller: alamatController,
                    decoration: new InputDecoration(
                        hintText: "Input Alamat",
                        labelText: "Alamat Mahasiswa",
                        border: new OutlineInputBorder(
                            borderRadius: new BorderRadius.circular(20.0)))),
                new Padding(padding: new EdgeInsets.all(5.0)),
                new RaisedButton(
                  child: new Text("Tambah Data"),
                  color: Colors.cyan,
                  onPressed: () {
//addData();
//untuk upload image
                    addData();
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
