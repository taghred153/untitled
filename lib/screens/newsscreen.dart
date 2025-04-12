import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled/providers/newsprovider.dart';
import 'package:untitled/widgets/newswidget.dart';

class NewsScreen extends StatelessWidget {
  const NewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("News App"),
      ),
      body: Consumer<NewsProvider>(
          builder: (context, value, child) {
            var newss= value.newsModel;
            if(newss == null){
              value.fetchdata();
              return Center(child: CircularProgressIndicator());
            }else {
              return ListView.separated(
                itemBuilder: (context, index) =>
                    NewsWidget(
                      urlToImage: newss.articles[index]["urlToImage"],
                      title: newss.articles[index]["title"],
                      description: newss.articles[index]["description"],
                    ),
                separatorBuilder: (context, index) => Divider(),
                itemCount: 10,
              );
            }
          }
      ),
    );
  }
}
