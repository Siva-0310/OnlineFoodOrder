import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:online_food_order/home_page.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.orange),
      home: const SafeArea(
        child: Scaffold(
          body: MyLoginPage(),
        ),
      ),
    );
  }
}

class MyLoginPage extends StatelessWidget {
  const MyLoginPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Image.asset('assets/image.jpg'),
          const Flexible(
            child: FractionallySizedBox(
              heightFactor: 0.6,
            ),
          ),
          const Align(
            alignment: Alignment.topLeft,
            child: Text(
              'Order Your \nFavourite \nFood',
              style: TextStyle(
                  color: Colors.black,
                  height: 1.3,
                  fontSize: 45,
                  fontWeight: FontWeight.w500),
            ),
          ),
          const Flexible(
            child: FractionallySizedBox(
              heightFactor: 0.2,
            ),
          ),
          const Align(
            alignment: Alignment.topLeft,
            child: Text(
              'Made by the Finest Home chefs every\ndish raises the bar of taste,health\nhygiene and cleanliness',
              style: TextStyle(color: Colors.grey, height: 1.5, fontSize: 16),
            ),
          ),
          const MyIconRow(),
          const Flexible(
            child: FractionallySizedBox(
              heightFactor: 0.15,
            ),
          )
        ],
      ),
    );
  }
}

class MyIconRow extends StatelessWidget {
  const MyIconRow({super.key});
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          width: 46,
          child: TextButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) {
                  return const HomePage();
                },
              ));
            },
            child: const Text(
              'Skip',
              style: TextStyle(
                color: Color.fromARGB(255, 101, 100, 100),
                fontSize: 15,
              ),
            ),
          ),
        ),
        const Flexible(
          child: FractionallySizedBox(
            widthFactor: 0.2,
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.2,
          width: MediaQuery.of(context).size.width * 0.2,
          child: FloatingActionButton(
            onPressed: () {},
            child: const Icon(
              Icons.arrow_forward_ios,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}
