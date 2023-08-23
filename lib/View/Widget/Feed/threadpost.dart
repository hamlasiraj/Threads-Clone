import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:threads/Controller/feedcontroller.dart';
import 'package:threads/Core/Constant/appcolors.dart';
import 'package:threads/Core/Constant/appimage.dart';
import 'package:threads/View/Widget/positionedstick.dart';
import 'package:threads/data/model/Thread.dart';

class ThreadPost extends StatelessWidget {
  final void Function()? onTap;
  final Widget? child;
  Thread threadlist;

  ThreadPost(this.threadlist, {super.key, this.onTap, this.child});

  @override
  Widget build(BuildContext context) {
    Get.put(FeedController());
    return Stack(
      alignment: AlignmentDirectional.bottomEnd,
      children: [
        Column(
          children: [
            ListTile(
              leading: CircleAvatar(
                backgroundImage: AssetImage(
                    '${AppImage.imgRoot}/${threadlist.profileImage}'),
              ),
              title: Row(
                children: [
                  Text(threadlist.name ?? 'name',
                      style: Theme.of(context).textTheme.headlineMedium),
                  const Spacer(),
                  Text(threadlist.posted!,
                      style: Theme.of(context).textTheme.bodySmall),
                  const SizedBox(width: 10),
                  const Icon(Icons.more_horiz)
                ],
              ),
              subtitle: Text(threadlist.description!,
                  style: Theme.of(context).textTheme.headlineSmall),
            ),
            if (threadlist.image != '')
              Padding(
                padding: const EdgeInsets.only(
                  right: 20,
                  left: 70,
                ),
                child: Container(
                  height: 300,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.amber,
                      image: DecorationImage(
                        image: AssetImage(
                            '${AppImage.imgRoot}/${threadlist.image}'),
                        fit: BoxFit.cover,
                      )),
                ),
              ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.only(left: 70),
              child: Row(
                children: [
                  GetBuilder<FeedController>(
                    builder: (controller) => InkWell(
                      onTap: () {},
                      child: Image.asset(
                        threadlist.likeUnlike == 0
                            ? AppImage.heartfalse
                            : "${AppImage.imgRoot}/heart.png",
                        height: 23,
                        width: 23,
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  InkWell(onTap: onTap, child: Icon(Icons.chat_bubble_outline)),
                  const SizedBox(width: 10),
                  InkWell(onTap: onTap, child: Icon(Icons.cached)),
                  const SizedBox(width: 10),
                  InkWell(onTap: onTap, child: Icon(Icons.send)),
                  const SizedBox(width: 10),
                ],
              ),
            ),
            const SizedBox(height: 10),
            Container(
              padding: const EdgeInsets.only(bottom: 10),
              alignment: Alignment.bottomLeft,
              height: 50,
              child: Padding(
                padding: const EdgeInsets.only(left: 70),
                child: Text(
                  '${threadlist.replies} replies . ${threadlist.liks} likes',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey.shade500,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ],
        ),
        const Positioned(
            left: 35, top: 63, bottom: 40, child: PositionedStick()),
        Positioned(
          left: 20,
          child: Container(
            height: 35,
            width: 35,
            decoration: BoxDecoration(
              color: AppColor.background,
              borderRadius: BorderRadius.circular(1),
            ),
            child: Stack(
              children: [
                Positioned(
                  right: 0,
                  child: CircleAvatar(
                    backgroundImage:
                        AssetImage('${AppImage.imgRoot}/${threadlist.replier}'),
                    radius: 9,
                  ),
                ),
                Positioned(
                  left: 0,
                  top: 10,
                  child: CircleAvatar(
                    backgroundImage: AssetImage(
                        '${AppImage.imgRoot}/${threadlist.replier1}'),
                    radius: 7,
                  ),
                ),
                Positioned(
                  bottom: 0,
                  right: 8,
                  child: CircleAvatar(
                    backgroundImage: AssetImage(
                        '${AppImage.imgRoot}/${threadlist.replier2}'),
                    radius: 6,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
