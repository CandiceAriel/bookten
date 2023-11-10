import 'package:flutter/material.dart';


class ListCard extends StatefulWidget {
  ListCard({Key? key, this.id, this.title, required this.rank}) : super(key: key);

  final id, title, rank;

  @override
  State<ListCard> createState() => _ListCardState();
}

class _ListCardState extends State<ListCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.all(Radius.circular(20))
      ),
      height: 150.0,
      width: 200.0,
      padding: EdgeInsets.all(10.0),
      margin: const EdgeInsets.only(left: 20.0, right: 20.0),
      child: InkWell(
        splashColor: Colors.blue.withAlpha(30),
        onTap: () {
          debugPrint('Card tapped.');
        },
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Center(
                child: Text(widget.title),
              ),
              Center(
                child:  Text(widget.rank.toString()),
              ),
              
            ]
          ),
        ) 
      ),
    );
  }
}