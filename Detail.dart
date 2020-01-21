import 'package:uas_visual/landing.dart';
import 'package:flutter/material.dart';
import 'editData.dart';
import 'package:http/http.dart' as http;
import 'main.dart';


class Detail extends StatefulWidget {
  List list;
  int index;
  Detail({this.list, this.index});
  @override
  _DetailState createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  void deleteData() {
    var url = "http://10.0.2.2/mahasiswa/deletePegawai.php";
    http.post(url, body: {'id': widget.list[widget.index]['id']});
  }

  void confirm() {
    AlertDialog alertDialog = new AlertDialog(
      content: new Text(
          "Anda Yakin Akan Menghaspus Data '${widget.list[widget.index]['nama']}'"),
      actions: <Widget>[
        new RaisedButton(
            child: new Text(
              'OK Hapus!',
              style: TextStyle(color: Colors.black),
            ),
            color: Colors.red,
            onPressed: () {
              deleteData();
              Navigator.of(context).push(new MaterialPageRoute(
                  builder: (BuildContext context) => new landing()));
            }),
        new RaisedButton(
          child: new Text(
            'Batal',
            style: TextStyle(color: Colors.black),
          ),
          color: Colors.cyan,
          onPressed: () => Navigator.pop(context),
        )
      ],
    );
    showDialog(context: context, child: alertDialog);
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("${widget.list[widget.index]['npm']}"),
        backgroundColor: Colors.cyan,
      ),
      backgroundColor: Colors.cyan,
      
      body: new ListView(
        children: <Widget>[
          new Container(
            padding: const EdgeInsets.all(10.0),
            height: 400.0,
            child: Row(
              children: <Widget>[
                new Expanded(
                  child: Card(
                    child: new Column(
                      children: <Widget>[
                        new Padding(padding: const EdgeInsets.only(top: 30.0)),
                        new Text(
                          widget.list[widget.index]['nama'],
                          style: new TextStyle(fontSize: 20.0),
                        ),
                        new Text(
                          "Npm : ${widget.list[widget.index]['npm']}",
                          style: new TextStyle(fontSize: 18.0),
                        ),
                        new Text(
                          "Nama Mahasiswa : ${widget.list[widget.index]['nama']}",
                          style: new TextStyle(fontSize: 18.0),
                        ),
                        new Text(
                          "Tempat tanggal lahir : ${widget.list[widget.index]['tempat_lahir']}",
                          style: new TextStyle(fontSize: 18.0),
                        ),
                        new Text(
                          "Tanggal Lahir : ${widget.list[widget.index]['tanggal_lahir']}",
                          style: new TextStyle(fontSize: 18.0),
                        ),
                        new Text(
                          "Jenis Kelamin : ${widget.list[widget.index]['jenis_kelamin']}",
                          style: new TextStyle(fontSize: 18.0),
                        ),
                        new Text(
                          "Agama : ${widget.list[widget.index]['agama']}",
                          style: new TextStyle(fontSize: 18.0),
                        ),
                        new Text(
                          "No Telp : ${widget.list[widget.index]['no_telp']}",
                          style: new TextStyle(fontSize: 18.0),
                        ),
                        new Text(
                          "Alamat : ${widget.list[widget.index]['alamat']}",
                          style: new TextStyle(fontSize: 18.0),
                        ),
                        new Padding(padding: const EdgeInsets.only(top: 30.0)),
                        new Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            new RaisedButton(
                              child: new Text('Edit'),
                              color: Colors.green,
                              onPressed: () => Navigator.of(context)
                                  .push(new MaterialPageRoute(
                                builder: (BuildContext context) => new EditData(
                                  list: widget.list,
                                  index: widget.index,
                                ),
                              )),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(5.0),
                            ),
                            new RaisedButton(
                              child: new Text('Hapus'),
                              color: Colors.blue,
                              onPressed: () => confirm(),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
