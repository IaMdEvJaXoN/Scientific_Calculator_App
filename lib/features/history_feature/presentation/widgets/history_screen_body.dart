import 'package:calc_x/core/themes/colors.dart';
import 'package:calc_x/core/utils/string_splitting.dart';
import 'package:flutter/material.dart';

class HistoryScreenBody extends StatefulWidget {
  const HistoryScreenBody({super.key});

  @override
  State<HistoryScreenBody> createState() => _HistoryScreenBodyState();
}

class _HistoryScreenBodyState extends State<HistoryScreenBody> {
  List<String> historyList = [
    "Sin(30)~0.5~2 hours ago",
    "Sin(30)~0.5~2 hours ago",
    "Sin(30)~0.5~2 hours ago",
    "Sin(30)~0.5~2 hours ago",
    "Sin(30)~0.5~2 hours ago",
    "Sin(30)~0.5~2 hours ago",
    "Sin(30)~0.5~2 hours ago",
    "Sin(30)~0.5~2 hours ago",
    "Sin(30)-56/45+23-44~0.5~2 hours ago",
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Expanded(
          flex: 1,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                "RECENT ACTIVITY",
                style: TextStyle(
                  fontSize: 20,
                  color: DarkColors.historyScreenText,
                ),
              ),
              Text(
                "Total: ${historyList.length} entries",
                style: TextStyle(
                  fontSize: 18,
                  color: DarkColors.historyScreenText,
                ),
              ),
            ],
          ),
        ),

        Expanded(
          flex: 14,
          child: ListView.builder(
            itemCount: historyList.length,

            itemBuilder: (context, index) {
              //format ----- historyParts=[expression,answer,time]
              final historyParts = StringSplitting.splitHistoryIntoParts(
                historyList[index],
              );
              return Container(
                margin: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: DarkColors.gridColorforLightandDarkModes,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      margin: EdgeInsets.fromLTRB(5, 1, 5, 1),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Expanded(flex: 9, child: Text(historyParts[0])),
                          Expanded(
                            flex: 1,
                            child: IconButton(
                              onPressed: () {},
                              icon: Icon(Icons.delete),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(5, 1, 5, 1),
                      alignment: Alignment.bottomLeft,
                      child: RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: "   =  ",
                              style: TextStyle(
                                fontSize: 20,
                                color: const Color.fromARGB(255, 48, 186, 233),
                              ),
                            ),
                            TextSpan(
                              text: historyParts[1],
                              style: TextStyle(
                                fontSize: 24,
                                color: const Color.fromARGB(255, 17, 32, 197),
                              ),
                            ),
                          ],
                        ),
                      ),
                      //Text("    = ${historyParts[1]}"),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(5, 1, 5, 1),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Expanded(flex: 9, child: Text(historyParts[2],style: TextStyle(fontSize: 10,color: const Color.fromARGB(255, 64, 89, 102)),)),
                          Expanded(
                            flex: 1,
                            child: IconButton(
                              onPressed: () {},
                              icon: Icon(Icons.copy_outlined),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
