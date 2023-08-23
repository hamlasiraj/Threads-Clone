import 'package:flutter/material.dart';
import 'package:threads/Data/Model/suggestedaccount.dart';
import '../custtombutton.dart';

class SuggestedAcoountBox extends StatelessWidget {
  final SuggestedAccount suggestedAccountList;
  const SuggestedAcoountBox(this.suggestedAccountList, {super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(50),
          child: Image.asset(
            "assets/${suggestedAccountList.profileImage}",
            height: 35,
            width: 35,
            fit: BoxFit.cover,
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('${suggestedAccountList.name}',
                          style: Theme.of(context).textTheme.headlineMedium),
                      Text("${suggestedAccountList.username}",
                          style: Theme.of(context).textTheme.headlineSmall),
                      Text(
                        "${suggestedAccountList.followers} followers",
                        style: Theme.of(context).textTheme.headlineSmall,
                      )
                    ],
                  ),
                  CusttomButton(onPressed: () {}, hint: "Follow")
                ],
              ),
              const Divider()
            ],
          ),
        )
      ],
    );
  }
}
