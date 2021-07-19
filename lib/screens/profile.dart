import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:recipe_app/global_servvices/app_colors.dart';

class Profile extends StatelessWidget {
  const Profile({Key key}) : super(key: key);
  void onSelected(BuildContext context, int item) {
    switch (item) {
      case 0:
        print('Editing');
        break;
      case 1:
        print('sharing');

        break;
      case 2:
        print('logout');

    }
  }
  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Column(
        children: [
          Expanded(
              child: Stack(
            children: [
              Positioned(
                bottom: 0.0,
                left: 0.0,
                right: 0.0,
                child: Container(
                  padding: EdgeInsets.only(left: 10.0),
                  margin: EdgeInsets.only(left: 10, right: 10.0, bottom: 10.0),
                  height: screenHeight * 0.18,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                    gradient: LinearGradient(
                        colors: [
                          AppColors.purple1,
                          AppColors.purple2,
                          AppColors.purple3,
                          AppColors.purple4,
                        ],
                        begin: const FractionalOffset(0.1, 1),
                        end: const FractionalOffset(1.0, 0.0),
                        stops: [0.25, 0.5, 0.75, 1.0],
                        tileMode: TileMode.clamp),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: TextBaseline.ideographic,
                        children: [
                          Icon(
                            Octicons.person,
                            color: Colors.white,
                          ),
                          AutoSizeText(
                            ' Youcef Khelfi',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: TextBaseline.ideographic,
                        children: [
                          Icon(
                            Octicons.mail,
                            color: Colors.white,
                          ),
                          AutoSizeText(
                            ' Youcefkhe8@gmail.com',
                            style:
                                TextStyle(color: Colors.white, fontSize: 16.0),
                          )
                        ],
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: TextBaseline.ideographic,
                        children: [
                          Icon(
                            FontAwesome.phone,
                            color: Colors.white,
                          ),
                          AutoSizeText(
                            ' 0658262326',
                            style:
                                TextStyle(color: Colors.white, fontSize: 16.0),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
              Positioned(
                  right: 0.0,

                  child: Row(
                    children: [
                      PopupMenuButton<int>(
                          onSelected :(item)=> onSelected(context , item),
                          itemBuilder: (context)=>[
                            PopupMenuItem<int>(
                              value: 0,
                              child: Row(
                                children: [
                                  Icon(Icons.edit,color: Colors.white,),
                                  SizedBox(width: 2,),
                                  Text('Edit Account'),
                                ],
                              ),
                            ),
                            PopupMenuItem<int>(
                              value: 1,
                              child: Row(
                                children: [
                                  Icon(Icons.share,color: Colors.white,),
                                  SizedBox(width: 2,),
                                  Text('Share'),
                                ],
                              ),
                            ),
                            PopupMenuDivider(),
                            PopupMenuItem<int>(
                              value: 2,
                              child: Row(
                                children: [
                                  Icon(Icons.logout,color: Colors.white,),
                                  SizedBox(width: 2,),
                                  Text('Sign Out'),
                                ],
                              ),
                            ),
                          ])
                    ],
                  )),
              Positioned(
                top: 0.0,
                left: 0.0,
                right: 0.0,
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 80.0),
                  alignment: Alignment.center,
                  color: Colors.transparent,

                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    child: CircleAvatar(
                      backgroundColor: AppColors.purple2,
                      backgroundImage: AssetImage(
                        'images/profile.jpg',
                      ),
                      radius: screenHeight * 0.07,
                    ),
                    radius: screenHeight * 0.08,
                  ),
                ),
              ),
            ],
          )),
          Expanded(
              flex: 2,
              child: Container(
                color: Colors.white,
              ))
        ],
      ),
    );
  }
}
