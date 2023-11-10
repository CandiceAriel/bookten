import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:mangakai/component/listCard.dart';
import 'package:mangakai/model/season_anime.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  List<SeasonAnime> seasonAnimes = [];

  Future getSeasonAnime() async {
    var response =
        await http.get(Uri.https('api.jikan.moe', '/v4/seasons/now'));
    var jsonData = jsonDecode(response.body);

    for (var eachData in jsonData['data']) {
      final seasonAnime = SeasonAnime(
          id: eachData['mal_id'],
          title: eachData['title'],
          rank: eachData['rank']
      );
      seasonAnimes.add(seasonAnime);
    }

    print(seasonAnimes.length);
  }

  @override
  Widget build(BuildContext context) {
    getSeasonAnime();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Manga Kai'),
      ),
      body: Container(
        padding: EdgeInsets.all(20.0),
        child: Column(
          children: [
            const Text(
              'This Season anime',
              style: TextStyle(
                fontWeight: FontWeight.bold, 
                fontSize: 20.0, 
                height: 5
              )
            ),
            Expanded(
              child: FutureBuilder(
                future: getSeasonAnime(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    return ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return ListCard(
                          id: seasonAnimes[index].id,
                          title: seasonAnimes[index].title,
                          rank: seasonAnimes[index].rank
                        );
                      }
                    );
                  } else {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                }
              )
            ),
            const Text(
              'Top anime',
              style: TextStyle(
                fontWeight: FontWeight.bold, 
                fontSize: 20.0, 
                height: 5
              )
            ),
            Expanded(
              child: FutureBuilder(
                future: getSeasonAnime(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    return ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return ListCard(
                          id: seasonAnimes[index].id,
                          title: seasonAnimes[index].title,
                          rank: seasonAnimes[index].rank
                        );
                      }
                    );
                  } else {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                }
              )
            ),
          ]
        ),
      )
    );
  }
}
