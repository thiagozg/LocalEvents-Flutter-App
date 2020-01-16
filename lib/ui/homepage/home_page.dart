import 'package:flutter/material.dart';
import 'package:localeventsapp/model/category.dart';
import 'package:localeventsapp/styleguide.dart';
import 'package:localeventsapp/ui/homepage/home_page_background.dart';
import 'package:localeventsapp/widget/category_widget.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          HomePageBackground(
            screenHeigth: MediaQuery.of(context).size.height,
          ),
          SafeArea(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 32.0),
                    child: Row(
                      children: <Widget>[
                        Text(
                          "LOCAL EVENTS",
                          style: fadedTextStyle,
                        ),
                        Spacer(),
                        Icon(
                          Icons.person_outline,
                          color: Color(0x99FFFFFF),
                          size: 30,
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 32.0),
                    child: Text(
                      'What\'s Up',
                      style: whiteHeadingTextStyle,
                    ),
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: <Widget>[
                        for (final category in categories)
                          CategoryWidget(category: category)
                      ],
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
