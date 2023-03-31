import 'package:empat_task6/models/post_state_model.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final Widget child;

  const CustomButton({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          color: const Color(0xFF715AFF),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.8),
              spreadRadius: 1,
              blurRadius: 3,
              offset: const Offset(1, 2), // changes position of shadow
            ),
          ],
          borderRadius: BorderRadius.circular(10),
        ),
        child: child);
  }
}

class CustomAvatar extends StatelessWidget {
  final double avatarRadius;
  final double borderThick;
  final bool ifSeenBorder;
  final bool ifSeenAdd;
  final int photoIndex;

  const CustomAvatar(
      {Key? key,
      this.avatarRadius = 65,
      this.borderThick = 10,
      this.photoIndex = 0,
      this.ifSeenBorder = true,
      this.ifSeenAdd = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: avatarRadius + borderThick,
      height: avatarRadius + borderThick,
      child: Stack(
        //alignment: Alignment.center,
        children: [
          Visibility(
            visible: ifSeenBorder,
            child: Container(
              height: avatarRadius + borderThick, //avatarRadius + borderThick,
              decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [Color(0xFFA682FF), Colors.red],
                  ),
                  shape: BoxShape.circle),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Container(
              height: avatarRadius,
              decoration: BoxDecoration(
                boxShadow: ifSeenBorder
                    ? null
                    : [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.8),
                          spreadRadius: 1,
                          blurRadius: 3,
                          offset:
                              const Offset(1, 2), // changes position of shadow
                        ),
                      ],
                shape: BoxShape.circle,
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(
                      'assets/img/profile_avatar (${photoIndex + 1}).jpg'),
                ),
              ),
            ),
          ),
          Visibility(
            visible: ifSeenAdd,
            child: Align(
              alignment: AlignmentDirectional.bottomEnd,
              child: Container(
                decoration: const BoxDecoration(
                    shape: BoxShape.circle, color: Color(0xFFA682FF)),
                child: Icon(
                  Icons.add,
                  color: Colors.white,
                  size: (avatarRadius + borderThick) / 3.5,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class PostWidget extends StatelessWidget {
  final int photoIndex;
  final bool useHero;

  const PostWidget({Key? key, this.photoIndex = 0, this.useHero = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              CustomAvatar(
                avatarRadius: 40,
                borderThick: 5,
                photoIndex: photoIndex % 10,
              ),
              const SizedBox(
                width: 5,
              ),
              const Text(
                'Nickname',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
              ),
              const Expanded(child: SizedBox()),
              const Padding(
                padding: EdgeInsets.all(3),
                child: Icon(Icons.menu, size: 35),
              )
            ],
          ),
        ),
        useHero
            ? Hero(
                tag: 'assets/img/profile_avatar (${photoIndex + 1}).jpg',
                child: Image.asset(
                    'assets/img/profile_avatar (${photoIndex % 10 + 1}).jpg'),
              )
            : Image.asset(
                'assets/img/profile_avatar (${photoIndex % 10 + 1}).jpg'),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Consumer<PostModel>(
                        builder: (context, value, child) {
                          return InkWell(
                            onTap: () {
                              value.likedId.contains(photoIndex % 10)
                                  ? value.removeLike(photoIndex % 10)
                                  : value.addLike(photoIndex % 10);
                            },
                            child: Icon(
                              Icons.thumb_up,
                              size: 35,
                              color: value.likedId.contains(photoIndex % 10)
                                  ? Colors.red
                                  : Colors.black,
                            ),
                          );
                        },
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8),
                        child: Icon(
                          Icons.chat_bubble_outline_rounded,
                          size: 35,
                        ),
                      ),
                      const Icon(
                        Icons.send,
                        size: 35,
                      ),
                    ],
                  ),
                  const Icon(
                    Icons.bookmark,
                    size: 35,
                  )
                ],
              ),
              const Text(
                '19 likes',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
              const Text(
                'Description',
                style: TextStyle(fontSize: 16),
              ),
              const Text(
                'View all coments',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              )
            ],
          ),
        )
      ],
    );
  }
}

class Counter extends StatelessWidget {
  const Counter({super.key, required this.number, this.isVisible = true});

  final bool isVisible;
  final String number;

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: isVisible,
      child: Padding(
        padding: const EdgeInsets.only(left: 5),
        child: Container(
          width: 45,
          height: 45,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Color(0xFF715AFF),
          ),
          child: Center(
            child: Text(
              number,
              style: const TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}

class SelectivePhoto extends StatelessWidget {
  const SelectivePhoto({
    Key? key,
    required this.index,
    this.isSelected = false,
  }) : super(key: key);
  final int index;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(1),
      child: Hero(
        tag: 'assets/img/profile_avatar (${index + 1}).jpg',
        child: Stack(
          fit: StackFit.expand,
          children: [
            Image.asset(
              'assets/img/profile_avatar (${index % 10 + 1}).jpg',
              fit: BoxFit.cover,
            ),
            Visibility(
              visible: isSelected,
              child: Align(
                alignment: Alignment.bottomRight,
                child: Padding(
                  padding: const EdgeInsets.all(5),
                  child: Container(
                    height: 40,
                    //MediaQuery.of(context).size.height/15,
                    width: 40,
                    //MediaQuery.of(context).size.height/15,

                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(0xFF715AFF),
                    ),
                    child: const Icon(
                      Icons.check,
                      color: Colors.white,
                      size: 30,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
