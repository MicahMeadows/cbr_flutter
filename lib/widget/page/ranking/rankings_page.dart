import 'dart:js_util';

import 'package:cbr_flutter/data/cbr_retrofit_api/dto/ranking_dto.dart';
import 'package:cbr_flutter/data/cubit/rankings/rankings/rankings_cubit.dart';
import 'package:cbr_flutter/data/cubit/rankings/rankings/rankings_state.dart';
import 'package:cbr_flutter/widget/page/ranking/rank_card.dart';
import 'package:flutter/material.dart';
import 'package:cbr_flutter/constants/colors.dart' as col;
import 'package:flutter_bloc/flutter_bloc.dart';

class RankingsPage extends StatefulWidget {
  const RankingsPage({super.key});

  @override
  State<RankingsPage> createState() => _RankingsPageState();
}

class _RankingsPageState extends State<RankingsPage> {
  RankingDTO? selectedRanking;

  Widget buildRankWidget(RankingDTO ranking) {
    return InkWell(
      onTap: () {
        setState(() {
          selectedRanking = ranking;
        });
      },
      child: RankCard(ranking: ranking),
    );
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
    return Text(
      'details about ${ranking.location.name}',
      style: TextStyle(color: Colors.white),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RankingsCubit, RankingsState>(
      builder: (context, state) {
        if (state is RankingsLoaded) {
          List<RankingDTO> rankings = state.loadedRankings;
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
