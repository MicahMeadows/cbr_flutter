import 'package:cbr_flutter/data/cbr_retrofit_api/dto/location_dto.dart';
import 'package:cbr_flutter/data/cbr_retrofit_api/dto/match_dto.dart';
import 'package:cbr_flutter/data/cubit/vote/vote_state.dart';
import 'package:cbr_flutter/widget/page/vote/vote_option.dart';
import 'package:flutter/material.dart';
import 'package:cbr_flutter/constants/colors.dart' as col;
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/cubit/vote/vote_cubit.dart';

class VotePage extends StatefulWidget {
  const VotePage({super.key});

  @override
  State<VotePage> createState() => _VotePageState();
}

class _VotePageState extends State<VotePage> {
  void submitWinner(
    BuildContext ctx,
    LocationDTO winner,
    MatchDTO match,
  ) {
    ctx.read<VoteCubit>().submitMatch(match, winner);
  }

  LoadedState? lastLoadedState;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<VoteCubit, VoteState>(
      builder: (context, state) {
        if (state is LoadedState) {
          lastLoadedState = state;
        }
        final loadedState = lastLoadedState;
        if (loadedState != null) {
          return LayoutBuilder(builder: (ctx, constraints) {
            return Stack(
              fit: StackFit.expand,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: constraints.maxWidth / 2,
                      color: col.maroon,
                      child: AnimatedOpacity(
                        opacity: state is LoadedState ? 1 : 0,
                        duration: const Duration(milliseconds: 300),
                        child: state is LoadedState
                            ? Padding(
                                padding: const EdgeInsets.all(10),
                                child: VoteOption(
                                  foregroundColor: Colors.white,
                                  buildingName:
                                      loadedState.loadedMatch.redTeam.name,
                                  image: Image.network(
                                    loadedState.loadedMatch.redTeam.imageUrl,
                                    fit: BoxFit.fitHeight,
                                  ),
                                  onChoose: () {
                                    submitWinner(
                                      context,
                                      loadedState.loadedMatch.redTeam,
                                      loadedState.loadedMatch,
                                    );
                                  },
                                  buttonBackground: Colors.white,
                                  buttonForeground: Colors.black,
                                ),
                              )
                            : const SizedBox.shrink(),
                      ),
                    ),
                    SizedBox(
                        width: constraints.maxWidth / 2,
                        child: AnimatedOpacity(
                          opacity: state is LoadedState ? 1 : 0,
                          duration: const Duration(milliseconds: 500),
                          child: state is LoadedState
                              ? Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: VoteOption(
                                    skewLeft: false,
                                    foregroundColor: Colors.black,
                                    buildingName:
                                        loadedState.loadedMatch.blueTeam.name,
                                    image: Image.network(
                                      loadedState.loadedMatch.blueTeam.imageUrl,
                                      fit: BoxFit.fitHeight,
                                    ),
                                    onChoose: () {
                                      submitWinner(
                                          context,
                                          loadedState.loadedMatch.blueTeam,
                                          loadedState.loadedMatch);
                                    },
                                    buttonForeground: Colors.white,
                                    buttonBackground: col.maroon,
                                  ),
                                )
                              : const SizedBox.shrink(),
                        )),
                  ],
                ),
                Center(
                  child: Container(
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(.5),
                          blurRadius: 4,
                        )
                      ],
                      border: Border.all(color: col.maroon),
                      shape: BoxShape.circle,
                      color: Colors.white,
                    ),
                    height: 84,
                    width: 84,
                    child: _centerWidget(state),
                  ),
                ),
              ],
            );
          });
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }
}

Widget _centerWidget(VoteState state) {
  if (state is LoadedState) {
    return Image.asset(
      'assets/images/vs-image.png',
    );
  }

  if (state is LoadingState) {
    return const Padding(
      padding: EdgeInsets.all(20.0),
      child: CircularProgressIndicator(
        color: col.maroon,
      ),
    );
  }

  return const SizedBox.shrink();
}
