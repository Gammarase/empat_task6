import 'package:empat_task6/pages/custom_elements.dart';
import 'package:flutter/material.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text(
                'Nickname',
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.w500),
              ),
              Icon(
                Icons.menu,
                size: 28,
              )
            ],
          ),
        ),
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const CustomAvatar(
                        borderThick: 0,
                        avatarRadius: 100,
                      ),
                      Column(
                        children: const [
                          Text(
                            '5',
                            style: TextStyle(
                                fontSize: 28, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            'Posts',
                            style: TextStyle(
                              fontSize: 20,
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: const [
                          Text(
                            '128',
                            style: TextStyle(
                                fontSize: 28, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            'Followers',
                            style: TextStyle(
                              fontSize: 20,
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: const [
                          Text(
                            '86',
                            style: TextStyle(
                                fontSize: 28, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            'Following',
                            style: TextStyle(
                              fontSize: 20,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 8),
                  child: Text(
                    'Name',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 8),
                  child: Text(
                    'Description',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8),
                  child: Row(
                    children: const [
                      Icon(Icons.link),
                      Text(
                        'website.com',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: const [
                      Expanded(
                        child: CustomButton(
                          child: Padding(
                            padding: EdgeInsets.all(5),
                            child: Center(
                              child: Text(
                                'Edit profile',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      CustomButton(
                        child: Padding(
                          padding: EdgeInsets.all(1.5),
                          child: Icon(
                            Icons.add_a_photo_outlined,
                            color: Colors.white,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Wrap(
                  children: List<Widget>.generate(
                    20,
                    (index) => SizedBox(
                      height: MediaQuery.of(context).size.width / 3,
                      width: MediaQuery.of(context).size.width / 3,
                      child: Padding(
                          padding: const EdgeInsets.all(1),
                          child: InkWell(
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => Material(
                                    child: SafeArea(
                                      child: PostWidget(
                                        useHero: true,
                                        photoIndex: index,
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
                            child: SelectivePhoto(
                              index: index,
                            ),
                          )),
                    ),
                  ),
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
