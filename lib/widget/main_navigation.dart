import 'package:cbr_flutter/widget/custom_nav_button.dart';
import 'package:cbr_flutter/widget/page/more_page.dart';
import 'package:cbr_flutter/widget/page/rankings_page.dart';
import 'package:cbr_flutter/widget/page/vote/vote_page.dart';
import 'package:flutter/material.dart';

class MainNavigation extends StatefulWidget {
  const MainNavigation({super.key});

  @override
  State<MainNavigation> createState() => _MainNavigationState();
}

enum SelectedPage {
  vote,
  rankings,
  more,
}

class _MainNavigationState extends State<MainNavigation> {
  SelectedPage _selectedPage = SelectedPage.vote;

  static const _headerUnselectedOpacity = .5;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        title: Row(
          children: [
            Opacity(
              opacity: _selectedPage == SelectedPage.rankings
                  ? 1
                  : _headerUnselectedOpacity,
              child: CustomNavButton(
                title: 'Rankings',
                iconImage: const Icon(
                  Icons.filter_frames_outlined,
                ),
                onTap: () => setState(() {
                  _selectedPage = SelectedPage.rankings;
                }),
              ),
            ),
            Opacity(
              opacity: _selectedPage == SelectedPage.vote
                  ? 1
                  : _headerUnselectedOpacity,
              child: CustomNavButton(
                title: 'Vote',
                iconImage: const Icon(
                  Icons.verified_outlined,
                ),
                onTap: () => setState(() {
                  _selectedPage = SelectedPage.vote;
                }),
              ),
            ),
            Opacity(
              opacity: _selectedPage == SelectedPage.more
                  ? 1
                  : _headerUnselectedOpacity,
              child: CustomNavButton(
                title: 'More',
                iconImage: const Icon(
                  Icons.more_horiz_sharp,
                ),
                onTap: () => setState(() {
                  _selectedPage = SelectedPage.more;
                }),
              ),
            ),
          ],
        ),
      ),
      body: _bodyWidget,
    );
  }

  Widget get _bodyWidget {
    switch (_selectedPage) {
      case SelectedPage.vote:
        return VotePage();
      case SelectedPage.rankings:
        return RankingsPage();
      case SelectedPage.more:
        return MorePage();
    }
  }
}
