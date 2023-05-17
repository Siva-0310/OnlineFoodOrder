import 'package:flutter/material.dart';
import 'package:material_floating_search_bar/material_floating_search_bar.dart';
import 'package:online_food_order/fliter_page.dart';

List<String> available = [];

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: const MyBody(),
          bottomNavigationBar: BottomNavigationBar(
            showUnselectedLabels: true,
            unselectedItemColor: Colors.black,
            selectedItemColor: Colors.black,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.search,
                  color: Color.fromARGB(255, 56, 56, 56),
                ),
                label: 'Search',
              ),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.category_outlined,
                    color: Color.fromARGB(255, 56, 56, 56),
                  ),
                  label: 'Category'),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.shopping_bag_outlined,
                    color: Color.fromARGB(255, 56, 56, 56),
                  ),
                  label: 'Bag'),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.inbox,
                    color: Color.fromARGB(255, 56, 56, 56),
                  ),
                  label: 'Inbox'),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.person_outline,
                    color: Color.fromARGB(255, 56, 56, 56),
                  ),
                  label: 'Profile')
            ],
            onTap: (value) {},
          )),
    );
  }
}

class MyBody extends StatefulWidget {
  const MyBody({super.key});
  @override
  _MyBodyState createState() => _MyBodyState();
}

class _MyBodyState extends State<MyBody> {
  _MyBodyState();
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: MediaQuery.of(context).size.height * 0.4,
          decoration: const BoxDecoration(
              color: Colors.orange,
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(40),
                  bottomRight: Radius.circular(40))),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 25),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Hi, Burhan',
                    style: TextStyle(
                        color: Colors.white, fontSize: 20, height: 1.5),
                  ),
                  Row(
                    children: const [
                      Text(
                        'Good Morning',
                        style: TextStyle(
                            color: Colors.white, fontSize: 15, height: 1.5),
                      ),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Icon(
                          Icons.wb_sunny_outlined,
                          color: Colors.white,
                        ),
                      )
                    ],
                  )
                ],
              ),
              Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(width: 3, color: Colors.transparent),
                      borderRadius:
                          const BorderRadius.all(Radius.circular(15.0)),
                      color: const Color.fromARGB(125, 255, 255, 255),
                    ),
                    child: IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.my_location,
                          color: Colors.white,
                        )),
                  ),
                  const Text(
                    'Map View ',
                    style: TextStyle(
                        color: Colors.white, fontSize: 15, height: 1.5),
                  ),
                ],
              )
            ],
          ),
        ),
        Column(children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.4 * 0.4,
          ),
          const Flexible(
            child: FractionallySizedBox(
              heightFactor: 1,
              child: MySearchBar(),
            ),
          ),
        ]),
        Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.4 * 0.75,
            ),
            SizedBox(
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.4 * 0.45,
              child: const MyCardView(),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: const [
                  Text(
                    'Popular Chef',
                    style: TextStyle(fontSize: 20),
                  ),
                  Flexible(
                    child: FractionallySizedBox(
                      widthFactor: 1,
                    ),
                  ),
                  Icon(Icons.menu),
                  Icon(Icons.crop_square)
                ],
              ),
            ),
            Flexible(
              child: MyGrid(items: [
                Item(
                    resname: 'Chif Sam\'s hotal',
                    address: 'assets/tuna_sandwhich.jpg',
                    description: 'TunaSandwhich',
                    icons: Container(
                      child: const Icon(Icons.bike_scooter),
                    )),
                Item(
                    resname: 'Aku\'s Kitchen',
                    address: 'assets/biriyani.jpg',
                    description: 'Chicken Biriyani',
                    icons: Row(
                      children: const [
                        Padding(
                          padding: EdgeInsets.only(right: 8),
                          child: Icon(Icons.bike_scooter),
                        ),
                        Icon(Icons.shopping_basket_outlined)
                      ],
                    )),
                Item(
                    resname: 'Yorms\'s kitchen',
                    address: 'assets/fish_fry.jpg',
                    description: 'Fish_fry',
                    icons: Row(
                      children: const [
                        Icon(Icons.bike_scooter),
                        Padding(
                          padding: EdgeInsets.only(left: 4),
                          child: Icon(Icons.shopping_basket_outlined),
                        )
                      ],
                    )),
                Item(
                    resname: 'Hadiza Kitchan',
                    address: 'assets/spring_rools.jpg',
                    description: 'Spring_rolls',
                    icons: Row(
                      children: const [
                        Padding(
                          padding: EdgeInsets.only(left: 8),
                          child: Icon(Icons.bike_scooter),
                        ),
                      ],
                    )),
              ]),
            )
          ],
        )
      ],
    );
  }
}

class MySearchBar extends StatelessWidget {
  const MySearchBar({super.key});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: FloatingSearchBar(
        transition: null,
        physics: const BouncingScrollPhysics(),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) {
                    return MyFilterPage();
                  },
                ));
              },
              icon: const Icon(Icons.select_all))
        ],
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        builder: (context, transition) {
          return Container();
        },
      ),
    );
  }
}

class MyCardView extends StatelessWidget {
  const MyCardView({super.key});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        padding: const EdgeInsets.all(15),
        width: double.infinity,
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(15)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  '30 %',
                  style: TextStyle(fontSize: 25, color: Colors.orange),
                ),
                Flexible(
                  child: FractionallySizedBox(
                    heightFactor: 0.3,
                  ),
                ),
                Text(
                  'Discount for All Food',
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
                ),
                Flexible(
                  child: FractionallySizedBox(
                    heightFactor: 0.5,
                  ),
                ),
                Text(
                  'Vaild Until November 16',
                  style: TextStyle(fontSize: 14, color: Colors.grey),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Expanded(
                child: Image.asset(
                  'assets/Food.jpg',
                  width: MediaQuery.of(context).size.width * 0.35,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class MyGrid extends StatelessWidget {
  final List items;
  const MyGrid({super.key, required this.items});
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: items.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 4,
        mainAxisSpacing: 4,
      ),
      itemBuilder: (context, index) {
        return items[index];
      },
    );
  }
}

class Item extends StatelessWidget {
  final String address;
  final String resname;
  final String description;
  final icons;
  Item(
      {super.key,
      required this.resname,
      required this.address,
      required this.description,
      required this.icons});
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Flexible(
            child: Padding(
              padding: const EdgeInsets.all(4.0),
              child: Image.asset(address),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: SizedBox(
              width: 75,
              child: Text(
                resname,
                style: const TextStyle(color: Colors.black),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  description,
                  style: const TextStyle(color: Colors.grey),
                  overflow: TextOverflow.ellipsis,
                ),
                const Flexible(
                  child: FractionallySizedBox(
                    widthFactor: 1,
                  ),
                ),
                icons
              ],
            ),
          )
        ],
      ),
    );
  }
}
