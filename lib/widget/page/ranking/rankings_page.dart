import 'package:cbr_flutter/data/cbr_retrofit_api/dto/ranking_dto.dart';
import 'package:cbr_flutter/data/cubit/rankings/rankings/rankings_cubit.dart';
import 'package:cbr_flutter/data/cubit/rankings/rankings/rankings_state.dart';
import 'package:cbr_flutter/widget/page/ranking/rank_card.dart';
import 'package:flutter/material.dart';
import 'package:cbr_flutter/constants/colors.dart' as col;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:html/parser.dart';

class RankingsPage extends StatefulWidget {
  const RankingsPage({super.key});

  @override
  State<RankingsPage> createState() => _RankingsPageState();
}

class _RankingsPageState extends State<RankingsPage> {
  RankingDTO? selectedRanking;
  RankingDTO? hoveredRanking;

  Widget buildRankingInfo(RankingDTO ranking) {
    var parsed = parse(ranking.location.description);
    return Padding(
      padding: const EdgeInsets.all(50.0).copyWith(bottom: 0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: Text(
                ranking.location.name,
                style: TextStyle(color: Colors.white, fontSize: 32),
              ),
            ),
            const SizedBox(height: 20),
            ClipRRect(
              child: Image.network(ranking.location.imageUrl),
              borderRadius: BorderRadius.circular(10),
            ),
            const SizedBox(height: 20),
            Text(
              parsed.body?.text ?? '',
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildRankWidget(RankingDTO ranking) {
    final card = RankCard(ranking: ranking);
    if (selectedRanking != ranking) {
      return InkWell(
        borderRadius: BorderRadius.circular(10),
        onHover: (value) {
          setState(() {
            hoveredRanking = ranking;
          });
        },
        onTap: () {
          setState(() {
            selectedRanking = ranking;
          });
        },
        child: Row(
          children: [
            if (hoveredRanking == ranking)
              Icon(
                Icons.info_outline,
                size: 25,
                color: col.maroon,
              ),
            Expanded(child: card),
          ],
        ),
      );
    } else {
      return Row(
        children: [
          Icon(
            Icons.circle,
            size: 25,
            color: col.maroon,
          ),
          Expanded(child: card),
        ],
      );
    }
  }

  Widget get _selectedRankingChild {
    final ranking = selectedRanking;
    if (ranking == null) {
      return const Center(
        child: Text(
          'Select a location to view its details.',
          style: TextStyle(color: Colors.white),
        ),
      );
    }
    return buildRankingInfo(ranking);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RankingsCubit, RankingsState>(
      builder: (context, state) {
        if (state is RankingsLoaded) {
          List<RankingDTO> rankings = state.loadedRankings;
          if (rankings.isNotEmpty && selectedRanking == null) {
            selectedRanking = rankings[0];
          }
          print('rankings: ${rankings[0].toJson()}');
          return LayoutBuilder(
            builder: (ctx, constraints) {
              return Row(
                children: [
                  SizedBox(
                    width: constraints.maxWidth / 2,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 25.0,
                        vertical: 50,
                      ),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Ranking',
                                  style: TextStyle(fontSize: 18),
                                ),
                                Text(
                                  'ELO Rating',
                                  style: TextStyle(fontSize: 18),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Scrollbar(
                              thumbVisibility: true,
                              child: ListView.separated(
                                separatorBuilder: (context, index) {
                                  return const SizedBox(height: 10);
                                },
                                itemBuilder: (context, index) {
                                  return buildRankWidget(rankings[index]);
                                },
                                itemCount: rankings.length,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    width: constraints.maxWidth / 2,
                    height: double.infinity,
                    color: col.maroon,
                    child: _selectedRankingChild,
                  ),
                ],
              );
            },
          );
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
