import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:skeletons/skeletons.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter Demo',
      home: SkeletonTheme(
         themeMode: ThemeMode.light,// its for change theme in app dark or light you choose your color
        shimmerGradient: LinearGradient(
          colors: [
            Color(0xFFD8E3E7),
            Color(0xFFC8D5DA),
            Color(0xFFD8E3E7),
          ],
          stops: [
            0.1,
            0.5,
            0.9,
          ],
        ),
        darkShimmerGradient: LinearGradient(
          colors: [
            Color(0xFF222222),
            Color(0xFF242424),
            Color(0xFF2B2B2B),
            Color(0xFF242424),
            Color(0xFF222222),
          ],
          stops: [
            0.0,
            0.2,
            0.5,
            0.8,
            1,
          ],
          begin: Alignment(-2.4, -0.2),
          end: Alignment(2.4, 0.2),
          tileMode: TileMode.clamp,
        ),
        child:   MyHomePage(title: 'Samira'),
      ),



    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int bottomBarIndex = 1;
  int tabBarIndex = 0;
 @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blueGrey,
      child:
      Scaffold(
        appBar: AppBar(
          title: Center(child: Text(widget.title,style: const TextStyle(color: Colors.white),)),
          backgroundColor: Colors.blueGrey ,
          shape:const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(24),
              bottomRight: Radius.circular(24),
            ),
          ),
      ),
    //    body:  const Center (child: Text('Empty Page'),
        body:
        ListView.builder(
          itemCount: 5,
          itemBuilder: (context, index) => Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              padding: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(color: Colors.white),
              child: SkeletonItem(
                  child: Column(
                    children: [
                      Row(
                        children: [
                         const SkeletonAvatar(
                            style: SkeletonAvatarStyle(
                                shape: BoxShape.circle, width: 50, height: 50),
                          ),
                          SizedBox(width: 8),
                          Expanded(
                            child: SkeletonParagraph(
                              style: SkeletonParagraphStyle(
                                  lines: 3,
                                  spacing: 6,
                                  lineStyle: SkeletonLineStyle(
                                    randomLength: true,
                                    height: 10,
                                    borderRadius: BorderRadius.circular(8),
                                    minLength: MediaQuery.of(context).size.width / 6,
                                    maxLength: MediaQuery.of(context).size.width / 3,
                                  )),
                            ),
                          )
                        ],
                      ),
                      SizedBox(height: 12),
                      SkeletonParagraph(
                        style: SkeletonParagraphStyle(
                            lines: 3,
                            spacing: 16,
                            lineStyle: SkeletonLineStyle(
                              randomLength: true,
                              height: 10,
                              borderRadius: BorderRadius.circular(8),
                              minLength: MediaQuery.of(context).size.width / 2,
                            )),
                      ),
                      SizedBox(height: 12),
                      SkeletonAvatar(
                        style: SkeletonAvatarStyle(
                          width: double.infinity,
                          minHeight: MediaQuery.of(context).size.height / 8,
                          maxHeight: MediaQuery.of(context).size.height / 3,
                        ),
                      ),
                      SizedBox(height: 8),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: const [
                              SkeletonAvatar(
                                  style: SkeletonAvatarStyle(width: 20, height: 20)),
                              SizedBox(width: 8),
                              SkeletonAvatar(
                                  style: SkeletonAvatarStyle(width: 20, height: 20)),
                              SizedBox(width: 8),
                              SkeletonAvatar(
                                  style: SkeletonAvatarStyle(width: 20, height: 20)),
                            ],
                          ),
                          SkeletonLine(
                            style: SkeletonLineStyle(
                                height: 16,
                                width: 64,
                                borderRadius: BorderRadius.circular(8)),
                          )
                        ],
                      )
                    ],
                  )),
            ),
          ),
        ),
        bottomNavigationBar: CurvedNavigationBar(
          index: bottomBarIndex,
       //   animationDuration: 500,
          backgroundColor: Colors.white60,
          color:  Colors.blueGrey,
          buttonBackgroundColor: Colors.blueGrey,
          height: 60,
          items: [
            Icon(
              Icons.add,
              size: 30,
              color: bottomBarIndex == 0
                  ? Colors.white
                  :  Colors.orangeAccent,
            ),
            Icon(
             Icons.message,
              size: 30,
              color: bottomBarIndex == 1
                  ? Colors.white
                  :  Colors.orangeAccent,
            ),
            Icon(
            Icons.error,
              size: 30,
              color:bottomBarIndex == 2
                  ? Colors.white
                  :  Colors.orangeAccent,
            ),
          ],
          onTap: (index) {
            if (bottomBarIndex != index) {
              setState(() {
                bottomBarIndex = index;
                tabBarIndex = 0;
              });

            }
          },
        ),
      )
    );
  }
}
