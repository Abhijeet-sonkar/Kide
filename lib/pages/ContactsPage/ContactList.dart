import 'package:Kide/config/Viewport.dart';
import 'package:Kide/models/ContactCategory.dart';
import 'package:Kide/pages/ContactsPage/widgets/ContactCardDiallable.dart';
import 'package:Kide/util/constants.dart';
import 'package:Kide/widgets/HeaderWidget.dart';
import 'package:dynamic_theme/dynamic_theme.dart';
import 'package:flutter/material.dart';

class ContactList extends StatelessWidget {
  static const routeName = '/ContactList';

  @override
  Widget build(BuildContext context) {
    ViewPort().init(context);
    final ContactCategory contactCategory =
        ModalRoute.of(context).settings.arguments;
    final _contactList = contactCategory.contacts;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          CONTACT_LIST,
          style: TextStyle(
            fontFamily: 'Roboto',
          ),
        ),
      ),
      backgroundColor: DynamicTheme.of(context).data.scaffoldBackgroundColor,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          child: CustomScrollView(
            slivers: <Widget>[
              SliverList(
                delegate: SliverChildListDelegate(
                  [
                    HeaderWidget(contactCategory.name, 12, Colors.white),
                    Divider(
                      color: Colors.white,
                      endIndent: ViewPort.screenWidth * 0.44,
                    ),
                  ],
                ),
              ),
              SliverList(
                delegate: SliverChildListDelegate(
                  [
                    for (int i = 0; i < _contactList.length; i++)
                      ContactCardDiallable(_contactList[i].name,
                          _contactList[i].number, _contactList[i].designation),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
