import 'package:flutter/material.dart';
import 'package:localeventsapp/model/category.dart';
import 'package:localeventsapp/styleguide.dart';
import 'package:provider/provider.dart';

import '../app_state.dart';

class CategoryWidget extends StatelessWidget {
  final Category category;

  const CategoryWidget({Key key, @required this.category}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appState = Provider.of<AppState>(context);
    final isSelected = appState.selectedCategoryId == category.id;

    Color handleSelectedColors(Color selectedColor, Color unselectedColor) =>
        isSelected ? selectedColor : unselectedColor;

    return GestureDetector(
      onTap: () {
        if (!isSelected) {
          appState.updateCategoryId(category.id);
        }
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 8),
        width: 90,
        height: 90,
        decoration: BoxDecoration(
          border: Border.all(
            color: handleSelectedColors(Colors.white, Color(0x99FFFFFF)),
            width: 3,
          ),
          borderRadius: BorderRadius.all(Radius.circular(16)),
          color: handleSelectedColors(Colors.white, Colors.transparent),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(
              category.icon,
              color: handleSelectedColors(Theme.of(context).primaryColor, Colors.white),
              size: 40,
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              category.name,
              style: isSelected ? selectedCategoryTextStyle : categoryTextStyle,
            ),
          ],
        ),
      ),
    );
  }
}
