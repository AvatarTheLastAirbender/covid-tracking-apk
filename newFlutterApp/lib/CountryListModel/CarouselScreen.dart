import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:new_flutter_app/CountryListModel/country.dart';

late List<Country> countryList;
late int SelectedCountry;

class CarouselScreen extends StatelessWidget {
  const CarouselScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Details')),
        body: Builder(builder: (context) {
          final double height = MediaQuery.of(context).size.height;
          return CarouselSlider(
            options: CarouselOptions(
              height: height,
              viewportFraction: 1.0,
              enlargeCenterPage: false,
              // autoPlay: false,
            ),
            items: countryList
                .map(
                  (country) => Center(
                      child: Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 16, horizontal: 16),
                    height: 700,
                    width: 400,
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              country.countryName,
                              style: const TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Container(
                              color: Colors.black12,
                              width: 100,
                              height: 70,
                              child: const Center(
                                  child: Text(
                                "Flag Image",
                                style: TextStyle(color: Colors.black),
                              )),
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 10),
                            Container(
                              margin: const EdgeInsets.only(top: 8),
                              width: 480,
                              color: Colors.black54,
                              height: 2,
                            ),
                            const SizedBox(height: 20),
                            CaseDetail(
                                label: 'Total Cases ', value: '554,124,081'),
                            const SizedBox(height: 10),
                            CaseDetail(
                                label: 'Total Deaths ', value: '6,360,956'),
                            const SizedBox(height: 10),
                            CaseDetail(
                                label: 'Total Recovered ',
                                value: '528,888,889'),
                            const SizedBox(height: 10),
                            CaseDetail(label: 'Today Cases ', value: '0'),
                            const SizedBox(height: 10),
                            Container(
                              margin: const EdgeInsets.only(top: 8),
                              width: 480,
                              color: Colors.black54,
                              height: 2,
                            ),
                          ],
                        ),
                      ],
                    ),
                  )),
                )
                .toList(),
          );
        }));
  }
}

class CaseDetail extends StatelessWidget {
  String label = "";
  String value = "";

  CaseDetail({
    Key? key,
    required String this.label,
    required String this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          label + ' = ',
          style: TextStyle(
            fontWeight: FontWeight.w500,
            color: Colors.black,
            fontSize: 18,
          ),
        ),
        Text(value,
            style: TextStyle(
              color: Colors.black,
              fontSize: 18,
            )),
      ],
    );
  }
}
