import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:stritva/view/showDetails.dart';
import 'color_showing.dart';

class InfoPage extends StatelessWidget {
  const InfoPage({super.key});

  _showDetails(String title, String image, BuildContext context, int index) {
    return () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => index == 8
              ? ColorShowing(title: title, image: image)
              : ShowDetails(
                  title: title,
                  image: image,
                  index: index,
                ),
        ),
      );
    };
  }

  Widget _buildOptions(
      String title, String image, BuildContext context, int index) {
    return GestureDetector(
      onTap: _showDetails(title, image, context, index),
      child: Card(
        elevation: 10,
        child: Container(
          padding: EdgeInsets.all(5),
          height: 120,
          width: 140,
          decoration: BoxDecoration(
              //   boxShadow: [
              //   BoxShadow(
              //       spreadRadius: 1,
              //       color: Colors.black, //New
              //       blurRadius: 1.0,
              //       offset: Offset(0, 1)),

              // ],
              color: Color.fromARGB(255, 246, 227, 227),
              borderRadius: BorderRadius.circular(8)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                image,
                height: 60,
                width: 60,
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                title,
                style:
                    TextStyle(color: Colors.black, fontWeight: FontWeight.w500),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _showTitle(String title) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.w400,
          fontFamily: 'Ubuntu',
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(padding: EdgeInsets.only(top: 0, bottom: 10)),
            _showTitle('How to Use'),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  _buildOptions('Disposable Pad',
                      'asset/images/disposable_pad.png', context, 0),
                  _buildOptions('Menstrual Cloth',
                      'asset/images/menstrual_cloth.png', context, 1),
                  _buildOptions('Reusable Pad', 'asset/images/reusable_pad.png',
                      context, 2),
                  _buildOptions(
                      'Tampon', 'asset/images/tampons.png', context, 3),
                  _buildOptions('Menstrual Cup',
                      'asset/images/mestrual_cup_rm.png', context, 4),
                ],
              ),
            ),
            Padding(padding: EdgeInsets.only(top: 10)),
            _showTitle('Color Guide'),
            _buildOptions('Color Guide', 'asset/images/color.png', context, 8),
            _showTitle('Myths and Facts'),
            SingleChildScrollView(
              child: Row(
                children: [
                  Padding(padding: EdgeInsets.only(top: 30)),
                  _buildOptions('Myths', 'asset/images/myth.png', context, 5),
                  _buildOptions('Facts', 'asset/images/fact.png', context, 6),
                ],
              ),
            ),
            _showTitle('Key Terms'),
            _buildOptions(
                'Key Terms', 'asset/images/key_terms.png', context, 7),
          ],
        ),
      ),
    );
  }
}
