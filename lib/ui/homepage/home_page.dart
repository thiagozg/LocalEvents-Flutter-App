import 'package:flutter/material.dart';
import 'package:localeventsapp/model/category.dart';
import 'package:localeventsapp/model/event.dart';
import 'package:localeventsapp/styleguide.dart';
import 'package:localeventsapp/ui/event_details/event_details_page.dart';
import 'package:localeventsapp/ui/homepage/home_page_background.dart';
import 'package:localeventsapp/widget/category_widget.dart';
import 'package:localeventsapp/widget/event_widget.dart';
import 'package:provider/provider.dart';

import '../../app_state.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ChangeNotifierProvider<AppState>(
        child: Stack(
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
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 24.0),
                      child: Consumer<AppState>(
                        builder: (context, appState, _) =>
                            SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: <Widget>[
                              for (final category in categories)
                                CategoryWidget(category: category)
                            ],
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Consumer<AppState>(
                        builder: (context, appState, _) => Column(
                          children: <Widget>[
                            for (final event in events.where((e) => e
                                .categoryIds
                                .contains(appState.selectedCategoryId)))
                              GestureDetector(
                                child: EventWidget(event: event),
                                onTap: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) =>
                                          EventDetailsPage(event: event)));
                                },
                              ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
        create: (_) => AppState(),
      ),
    );
  }
}
