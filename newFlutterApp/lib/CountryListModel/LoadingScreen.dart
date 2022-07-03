import 'package:flutter/material.dart';

class cardShimmer extends StatefulWidget {
  @override
  _ShimmerState createState() => new _ShimmerState();
}

class _ShimmerState extends State<cardShimmer> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemCount: 7,
        itemBuilder: (BuildContext context, int index) {
          return Container(
              padding: EdgeInsets.only(right: 16, left: 16, top: 20),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      color: Colors.black12,
                      width: 380,
                      height: 80,
                    ),
                    SizedBox(
                      height: 8,
                    ),
                  ],
                ),
              ));
        });
  }
}
