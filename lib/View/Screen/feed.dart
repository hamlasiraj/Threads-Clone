import 'package:flutter/material.dart';
import 'package:threads/Core/Constant/appcolors.dart';
import 'package:threads/Core/Constant/appimage.dart';
import '../../Data/DataSource/Remote/example.dart';
import '../Widget/Feed/threadpost.dart';

class Feed extends StatelessWidget {
  const Feed({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Image.asset(
                  AppImage.thredsLogo,
                  height: 35,
                ),
              ),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  return ThreadPost(
                      ThreadRemoteDatasource().getThread()[index]);
                },
                childCount: ThreadRemoteDatasource().getThread().length,
              ),
            )
          ],
        ),
      ),
    );
  }
}
