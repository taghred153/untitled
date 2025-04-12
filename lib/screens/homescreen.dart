import 'package:flutter/material.dart';
import 'package:untitled/screens/bmiscreen.dart';
import 'package:untitled/screens/newsscreen.dart';
import 'package:untitled/screens/prayertimescreen.dart';
import 'package:untitled/screens/productscreen.dart';
import 'package:untitled/screens/randomuserscreen.dart';
import 'package:untitled/screens/searchweatherscreen.dart';
import 'package:untitled/screens/todolistscreen.dart';
import 'package:untitled/screens/x%20o%20game.dart';
import 'package:untitled/widgets/homewidget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen ({super.key});

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> items =
        [
          {
            "img": "https://tse1.mm.bing.net/th?id=OIP.71Ch7CNcUpV81k8giE22cwHaHa&pid=Api&P=0&h=220",
            "txt": "Weather App",
            "page": SearchWeatherScreen(),
          },
          {
            "img": "https://www.onlinelogomaker.com/blog/wp-content/uploads/2017/06/shopping-online.jpg",
            "txt": "Shop App",
            "page": ProductsScreen(),
          },
          {
            "img": "https://cdn2.iconfinder.com/data/icons/men-women-health-wildberry-vol-1/256/BMI_Calculator-512.png",
            "txt": "BMI",
            "page": BMIScreen(),
          },
          {
            "img": "https://cdn.pixabay.com/photo/2016/04/15/18/05/computer-1331579_1280.png",
            "txt": "Random User",
            "page": RandomUserScreen(),
          },
          {
            "img": "https://d1csarkz8obe9u.cloudfront.net/posterpreviews/news-agency-logo-design-template-fef757c514365e1ead01282f28400ac4_screen.jpg?ts=1659078508",
            "txt": "News App",
            "page": NewsScreen(),
          },
          {
            "img": "https://tse2.mm.bing.net/th?id=OIP.bm9EbHfZki_yInVIGXMEhQHaHa&pid=Api&P=0&h=220",
            "txt": "Prayer Times",
            "page": PrayertimeScreen(),
          },
          {
            "img": "https://tse4.mm.bing.net/th?id=OIP.l1fsIXLe8EDZSYqX_qCABAHaHa&pid=Api&P=0&h=220",
            "txt": "X O",
            "page": XOGame(),
          },
          {
            "img": "https://cdn2.iconfinder.com/data/icons/flat-productivity-at-work/256/To-Do_List-1024.png",
            "txt": "To_Do_List",
            "page": TaskScreen(),
          },
        ];
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Page"),
      ),
      body: Container(
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 20,
          ),
          itemCount: 8,
          itemBuilder: (context, index)
          {
            return HomeWidget(
                img: items[index]['img'],
                txt: items[index]['txt'],
                onTap: (){
                  Navigator.push(
                      context, MaterialPageRoute(
                      builder: (context) => items[index]['page'])
                  );
                }
            );
          },
        ),
      ),
    );
  }
}
