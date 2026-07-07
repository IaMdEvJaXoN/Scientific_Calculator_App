import 'package:calc_x/core/themes/colors.dart';
import 'package:calc_x/core/utils/string_splitting.dart';
import 'package:calc_x/features/history_feature/presentation/providers/history_providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HistoryScreenBody extends ConsumerStatefulWidget {
  const HistoryScreenBody({super.key});
  @override
  ConsumerState<HistoryScreenBody> createState() => _HistoryScreenBodyState();
}

class _HistoryScreenBodyState extends ConsumerState<HistoryScreenBody> {
  late List<String> historyList;

  //Any time the user navigates to this screen this method is called
  @override
  void initState() {
    super.initState();
    ref.read(historyProvider.notifier).fetchHistoryToDisplay();
  }

  @override
  Widget build(BuildContext context) {
    final historyState = ref.watch(historyProvider);
    historyList = historyState.history;
    if (historyList.isEmpty) {
      return Center(
        child: Text('''OOPS !!! 
CAN'T
RECALL
        ''', style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold)),
      );
    }
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
                              onPressed: () {
                                ref
                                    .read(historyProvider.notifier)
                                    .removeItemFromHistory(index);
                              },
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
                          Expanded(
                            flex: 9,
                            child: Text(
                              historyParts[2],
                              style: TextStyle(
                                fontSize: 10,
                                color: const Color.fromARGB(255, 64, 89, 102),
                              ),
                            ),
                          ),
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
