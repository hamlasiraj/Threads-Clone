import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:threads/Core/Constant/appcolors.dart';
import 'package:threads/Core/Constant/appimage.dart';
import 'package:threads/Data/DataSource/Remote/suggestedaccountex.dart';
import 'package:threads/View/Widget/custtombutton.dart';
import 'package:threads/View/Widget/Search/suggestedaccountbox.dart';

class Search extends StatelessWidget {
  const Search({super.key});

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
          backgroundColor: AppColor.background,
          body: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Search",
                    style: Theme.of(context).textTheme.headlineLarge),
                const SizedBox(height: 05),
                Container(
                  height: 30,
                  decoration: BoxDecoration(
                      color: AppColor.filled,
                      borderRadius: BorderRadius.circular(10)),
                  child: TextFormField(
                    decoration: InputDecoration(
                      isDense: true,
                      contentPadding: const EdgeInsets.all(5),
                      border: InputBorder.none,
                      prefixIconConstraints:
                          const BoxConstraints(minWidth: 35, maxHeight: 15),
                      prefixIcon: Image.asset(
                        AppImage.explorefalse,
                      ),
                      hintText: "Search",
                      hintStyle: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: SuggestedAccountRemoteDatasource()
                      .getSuggestedAccount()
                      .length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return SuggestedAcoountBox(
                        SuggestedAccountRemoteDatasource()
                            .getSuggestedAccount()[index]);
                  },
                )
              ],
            ),
          )),
    );
  }
}
