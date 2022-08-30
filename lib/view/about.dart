import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:otp_provider/view/drawer.dart';
import 'package:otp_provider/theme/theme.dart';
import 'package:url_launcher/url_launcher.dart';
class AboutPage extends StatefulWidget {
  const AboutPage({Key? key}) : super(key: key);

  @override
  State<AboutPage> createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'About',
        ),
        centerTitle: true,
        backgroundColor: theme.primaryColor.withOpacity(.8),
        leading: Builder(
          builder: (BuildContext appBarContext) {
            return IconButton(
                onPressed: () {
                  AppDrawer.of(appBarContext)!.toggle();
                },
                icon: Icon(Icons.menu));
          },
        ),
      ),
      body: Column(
        children: [
          Center(
            child: Text(
              'About Page',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: theme.titleTextColor),
            ),
          ),
      ],
      ),
    );
  }
}
