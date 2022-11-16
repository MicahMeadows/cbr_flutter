import 'package:cbr_flutter/data/cbr_retrofit_api/dto/location_dto.dart';
import 'package:cbr_flutter/data/cbr_retrofit_api/dto/ranking_dto.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class RankCard extends StatelessWidget {
  final RankingDTO ranking;
  const RankCard({required this.ranking, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.all(5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(.25),
            offset: Offset(0, 4),
            blurRadius: 4,
          ),
        ],
        color: Colors.white,
      ),
      child: Row(children: [
        SizedBox(width: 10),
        Text(
          (ranking.rank + 1).toString(),
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        ),
        SizedBox(width: 10),
        Text(
          ranking.location.name,
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
        const Spacer(),
        Text(
          ranking.location.rating.toStringAsFixed(0),
          style: TextStyle(
            color: Colors.black.withOpacity(.3),
            fontSize: 18,
            fontWeight: FontWeight.w700,
          ),
        ),
        SizedBox(width: 20),
      ]),
    );
  }
}
