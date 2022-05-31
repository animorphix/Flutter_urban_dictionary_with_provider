import 'package:chernyi_lab_3_1/word_widget.dart';
import 'package:flutter/material.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import 'package:provider/provider.dart';
import 'state_provider.dart';
import 'word_class.dart';

List<Word> words = [];

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Home(),
    );
  }
}

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);
  Future<void> _onRefresh() async {
    return await Future.delayed(Duration(seconds: 2));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.deepPurple[200],
        body: LiquidPullToRefresh(
          onRefresh: () =>
              context.read<StateProvider>().httpGet(), //_onRefresh,
          color: Colors.deepPurple[300],
          backgroundColor: Colors.deepPurple[200],
          height: 100,
          animSpeedFactor: 2,
          child: ListView(
            children: [
              Container(
                  child: context.watch<StateProvider>().isLoading == true

                      // when user has already interacted with the system

                      ? Container(

                          // when data failed to load

                          child: words.isEmpty
                              ? Padding(
                                  padding: const EdgeInsets.all(25),
                                  child: Container(
                                    padding: EdgeInsets.all(25),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(30),
                                      color: Colors.deepPurple[400],
                                    ),
                                    child: const Text(
                                      'Something went wrong \n\nCheck your Internet connection and try again',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                )

                              // when everything is fine

                              : Column(
                                  children: [
                                    Container(
                                      padding: EdgeInsets.all(30),
                                      child: WordCard(
                                        itself: words[0].itself,
                                        definition: (words[0]
                                                .definition
                                                .replaceAll("[", ""))
                                            .replaceAll("]", ""),
                                        thumbsup: (words[0].thumbsup),
                                        example: (words[0]
                                                .example
                                                .replaceAll("[", ""))
                                            .replaceAll("]", ""),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(25),
                                      child: Container(
                                        padding: EdgeInsets.all(25),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(30),
                                          color: Colors.deepPurple[400],
                                        ),
                                        child: Column(
                                          children: const [
                                            Icon(
                                              Icons.restart_alt_outlined,
                                              color: Colors.white,
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Text(
                                              'Pull again to learn something new',
                                              style: TextStyle(
                                                  color: Colors.white),
                                            ),
                                          ],
                                        ),
                                      ),
                                    )
                                  ],
                                ))

                      // when user has not yet interacted with the system
                      //
                      : Center(
                          child: Padding(
                            padding: const EdgeInsets.all(25),
                            child: SizedBox(
                              width: double.infinity,
                              child: Container(
                                padding: EdgeInsets.all(20),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  color: Colors.deepPurple[400],
                                ),
                                child: Column(
                                  children: const [
                                    Icon(
                                      Icons.arrow_downward_rounded,
                                      color: Colors.white,
                                      size: 100,
                                    ),
                                    Text(
                                      'Pull down to discover a new \n \n Urban Dictionary definition',
                                      textAlign: TextAlign.left,
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        )),
            ],
          ),
        ));
  }
}
