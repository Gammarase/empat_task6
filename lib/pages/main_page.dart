import 'package:flutter/material.dart';

import 'custom_elements.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 5, left: 8, right: 8),
          child: Row(
            children: const [
              Text(
                'FlutterGram',
                style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
              ),
              Expanded(
                child: SizedBox(),
              ),
              CustomButton(
                child: Icon(
                  Icons.access_time,
                  size: 35,
                  color: Colors.white,
                ),
              ),
              SizedBox(
                width: 10,
              ),
              CustomButton(
                child: Icon(
                  Icons.message_outlined,
                  size: 35,
                  color: Colors.white,
                ),
              )
            ],
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height / 11,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 10,
            itemBuilder: (context, index) => Padding(
              padding: const EdgeInsets.all(1),
              child: CustomAvatar(
                avatarRadius: MediaQuery.of(context).size.height / 11 - 10,
                borderThick: 10,
                photoIndex: index,
                ifSeenBorder: index < 5 && index != 0,
                ifSeenAdd: index == 0,
              ),
            ),
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: 10,
            itemBuilder: (context, index) => PostWidget(
              photoIndex: index,
            ),
          ),
        )
      ],
    );
  }
}
