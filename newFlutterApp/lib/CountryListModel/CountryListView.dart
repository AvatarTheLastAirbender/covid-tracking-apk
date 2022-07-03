import 'package:flutter/material.dart';
import 'package:new_flutter_app/CountryListModel/ListModel.dart';

class CountryListView extends StatefulWidget {
  @override
  _CountryListViewState createState() => _CountryListViewState();
}

class _CountryListViewState extends State<CountryListView> {
  final TextEditingController _controller = TextEditingController();
  var _SearchKey = "";

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Center(child: Text("Track Covid'19"))),
        body: SingleChildScrollView(
            physics: ScrollPhysics(),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(height: 20),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 44,
                        margin: EdgeInsets.only(right: 16, left: 16),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6),
                          color: Colors.white,
                        ),
                        child: TextFormField(
                          textInputAction: TextInputAction.done,
                          cursorColor: Colors.black,
                          autofocus: false,
                          style: const TextStyle(
                            fontSize: 14,
                            backgroundColor: Colors.white,
                          ),
                          controller: _controller,
                          decoration: const InputDecoration(
                            hintText: 'Search Country',
                            hintStyle: TextStyle(color: Colors.black),
                            fillColor: Colors.white,
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 10, horizontal: 15),
                            enabledBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(6.0)),
                              borderSide: BorderSide(
                                  color: Colors.deepPurple, width: 1),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(6.0)),
                              borderSide:
                                  BorderSide(color: Colors.black, width: 0),
                            ),
                          ),
                          onChanged: (value) {
                            setState(() {
                              _SearchKey = value.toString();
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  ListModel(_SearchKey),
                ])));
  }
}
