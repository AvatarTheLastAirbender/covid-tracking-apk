import 'package:flutter/material.dart';
import 'package:new_flutter_app/CountryListModel/LoadingScreen.dart';
import 'package:new_flutter_app/CountryListModel/country.dart';

import '../ApiEndPoints/Result.dart';
import '../ApiEndPoints/api_services.dart';
import 'CarouselScreen.dart';
import 'CountryList.dart';

class ListModel extends StatefulWidget {
  String searchKey;

  ListModel(this.searchKey);

  @override
  State<StatefulWidget> createState() => _ListModelState();
}

Map<String, Country> mapCoutries = new Map();

class _ListModelState extends State<ListModel> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: ApiServices().getAllCountries(),
        builder: (BuildContext context, AsyncSnapshot<Result> snapshot) {
          if (!snapshot.hasData)
            return cardShimmer();
          else if (snapshot.data is SuccessState) {
            CountryList AllCountries = (snapshot.data as SuccessState).value;
            List<String> CoutryNames = [];
            List<String> CountryIds = [];
            AllCountries.countryList.forEach((element) {
              mapCoutries.putIfAbsent(element.countryId, () => element);
              CoutryNames.add(element.countryName);
            });
            CoutryNames = CoutryNames.where((Country) =>
                (Country.toLowerCase().contains(widget.searchKey))).toList();
            mapCoutries.values.forEach((Country) {
              if (CoutryNames.contains(Country.countryName))
                CountryIds.add(Country.countryId);
            });
            return ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: CoutryNames.length,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10.0, horizontal: 15.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Container(
                        height: 70,
                        color: Colors.white,
                        child: Row(
                          children: <Widget>[
                            SizedBox(width: 10),
                            Expanded(
                              child: Row(
                                children: <Widget>[
                                  Text(
                                    CoutryNames[index].length > 30
                                        ? CoutryNames[index].substring(0, 27) +
                                            " ..."
                                        : CoutryNames[index],
                                    style: const TextStyle(fontSize: 20),
                                    softWrap: true,
                                  ),
                                ],
                              ),
                            ),
                            CircleAvatar(
                                backgroundColor: Colors.purple,
                                radius: 17.0,
                                child: IconButton(
                                  onPressed: () {
                                    countryList = AllCountries.countryList;
                                    AllCountries.countryList
                                        .asMap()
                                        .forEach((CountryIndex, Country) {
                                      if (CountryIds[index] ==
                                          Country.countryId) {
                                        SelectedCountry = CountryIndex;
                                      }
                                    });
                                    var firstElements =
                                        countryList.sublist(0, SelectedCountry);
                                    var restElements = countryList.sublist(
                                        SelectedCountry, countryList.length);
                                    countryList = restElements + firstElements;
                                    Navigator.pushNamed(context, "/Country");
                                  },
                                  icon: const Icon(
                                      Icons.arrow_forward_ios_sharp,
                                      color: Colors.white,
                                      size: 15.0),
                                )),
                            SizedBox(
                              width: 10,
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                });
          } else {
            return Container(
              child: Center(
                child: Text("Something Went Wrong !"),
              ),
            );
          }
        });
  }
}
