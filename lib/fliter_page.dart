import 'dart:math';

import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

class MyFilterPage extends StatefulWidget {
  const MyFilterPage({super.key});
  @override
  _MyFilterPageState createState() => _MyFilterPageState();
}

class _MyFilterPageState extends State<MyFilterPage> {
  final List textbutton = ['English', 'Chinies', 'Indian', 'Thai'];
  List colors = [
    Colors.green,
    const Color.fromARGB(255, 225, 222, 222),
    const Color.fromARGB(255, 225, 222, 222),
    const Color.fromARGB(255, 225, 222, 222)
  ];
  final List dietbutton = [
    'Palio',
    'Ketogenic',
    'Jollof Rich',
    'Banku',
    'Tuna Sandwhich'
  ];
  List dietcolors = [
    Colors.green,
    const Color.fromARGB(255, 225, 222, 222),
    const Color.fromARGB(255, 225, 222, 222),
    const Color.fromARGB(255, 225, 222, 222),
    const Color.fromARGB(255, 225, 222, 222)
  ];
  _MyFilterPageState();
  double val = 10;
  double start = 0;
  double end = 160;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Column(
        children: [
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: const Icon(Icons.close),
                ),
                const Text(
                  'Filter',
                  style: TextStyle(fontSize: 20),
                ),
                TextButton(
                  onPressed: () {
                    setState(() {
                      val = 5;
                      start = 0;
                      end = 160;
                      colors = [
                        Colors.green,
                        const Color.fromARGB(255, 225, 222, 222),
                        const Color.fromARGB(255, 225, 222, 222),
                        const Color.fromARGB(255, 225, 222, 222)
                      ];
                      dietcolors = [
                        Colors.green,
                        const Color.fromARGB(255, 225, 222, 222),
                        const Color.fromARGB(255, 225, 222, 222),
                        const Color.fromARGB(255, 225, 222, 222),
                        const Color.fromARGB(255, 225, 222, 222)
                      ];
                    });
                  },
                  child: const Text('Reset all'),
                )
              ],
            ),
          ),
          Flexible(
            child: SingleChildScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              scrollDirection: Axis.vertical,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Text(
                          'Distance',
                          style: TextStyle(fontSize: 20),
                        ),
                        const Flexible(
                          child: FractionallySizedBox(
                            widthFactor: 0.4,
                          ),
                        ),
                        StatefulBuilder(
                          builder: (context, setState) {
                            return Text(
                              '${val.toInt()}mi',
                              style: const TextStyle(
                                  fontSize: 20, color: Colors.green),
                            );
                          },
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    SfSlider(
                      onChanged: (value) {
                        setState(() {
                          val = value;
                        });
                      },
                      stepSize: 1,
                      enableTooltip: true,
                      value: val,
                      max: 20,
                      min: 5,
                      showLabels: true,
                      activeColor: Colors.green,
                      inactiveColor: const Color.fromARGB(72, 158, 158, 158),
                    ),
                    const SizedBox(
                      height: 45,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Text(
                          'Price Range',
                          style: TextStyle(fontSize: 20),
                        ),
                        const Flexible(
                          child: FractionallySizedBox(
                            widthFactor: 0.4,
                          ),
                        ),
                        StatefulBuilder(
                          builder: (context, setState) {
                            return Text(
                              '\$ ${start.toInt()} - \$ ${end.toInt()}',
                              style: const TextStyle(
                                  fontSize: 20, color: Colors.green),
                            );
                          },
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    SfRangeSlider(
                      min: 0,
                      max: 160,
                      values: SfRangeValues(start, end),
                      stepSize: 5,
                      enableTooltip: true,
                      showLabels: true,
                      inactiveColor: const Color.fromARGB(72, 158, 158, 158),
                      activeColor: Colors.green,
                      onChanged: (value) {
                        setState(() {
                          if (value.end != 0 && value.start != value.end) {
                            start = value.start;
                            end = value.end;
                          }
                        });
                      },
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: const [
                        Text(
                          'Cuisine',
                          style: TextStyle(fontSize: 20),
                        ),
                        Flexible(
                          child: FractionallySizedBox(
                            widthFactor: 0.75,
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    StatefulBuilder(
                      builder: (context, setState) {
                        void onChanged(int index) {
                          setState(
                            () {
                              colors[colors.indexOf(Colors.green)] =
                                  const Color.fromARGB(255, 225, 222, 222);
                              colors[index] = Colors.green;
                            },
                          );
                        }

                        return SizedBox(
                          child: GridView.builder(
                            gridDelegate:
                                const SliverGridDelegateWithMaxCrossAxisExtent(
                                    maxCrossAxisExtent: 100,
                                    crossAxisSpacing: 7,
                                    childAspectRatio: 2),
                            padding: const EdgeInsets.all(8),
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: textbutton.length,
                            itemBuilder: (context, index) {
                              return MyTextButtton(
                                  text: textbutton[index],
                                  colors: colors,
                                  i: index,
                                  onChanged: onChanged);
                            },
                          ),
                        );
                      },
                    ),
                    const SizedBox(
                      height: 35,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: const [
                        Text(
                          'Diet',
                          style: TextStyle(fontSize: 20),
                        ),
                        Flexible(
                          child: FractionallySizedBox(
                            widthFactor: 0.75,
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    StatefulBuilder(
                      builder: (context, setState) {
                        void onChanged(int index) {
                          setState(
                            () {
                              dietcolors[dietcolors.indexOf(Colors.green)] =
                                  const Color.fromARGB(255, 225, 222, 222);
                              dietcolors[index] = Colors.green;
                            },
                          );
                        }

                        return SizedBox(
                          child: GridView.builder(
                            gridDelegate:
                                const SliverGridDelegateWithMaxCrossAxisExtent(
                                    maxCrossAxisExtent: 100,
                                    crossAxisSpacing: 7,
                                    childAspectRatio: 2,
                                    mainAxisSpacing: 15),
                            padding: const EdgeInsets.all(8),
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: dietbutton.length,
                            itemBuilder: (context, index) {
                              return MyTextButtton(
                                  text: dietbutton[index],
                                  colors: dietcolors,
                                  i: index,
                                  onChanged: onChanged);
                            },
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            width: double.infinity,
            height: 60,
            child: Padding(
              padding: const EdgeInsets.only(
                  bottom: 10, left: 20, right: 20, top: 10),
              child: ElevatedButton(
                onPressed: () {},
                style: ButtonStyle(
                    shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)))),
                child: const Text(
                  'Apply Filtters',
                  style: TextStyle(fontSize: 15, color: Colors.white),
                ),
              ),
            ),
          )
        ],
      ),
    ));
  }
}

class MyTextButtton extends StatelessWidget {
  final ValueChanged<int> onChanged;
  final String text;
  final List colors;
  final int i;
  const MyTextButtton(
      {super.key,
      required this.text,
      required this.colors,
      required this.i,
      required this.onChanged});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: TextButton(
        onPressed: () {
          onChanged(i);
        },
        style:
            ButtonStyle(backgroundColor: MaterialStatePropertyAll(colors[i])),
        child: Text(
          text,
          maxLines: 1,
          style: const TextStyle(color: Colors.black),
        ),
      ),
    );
  }
}
