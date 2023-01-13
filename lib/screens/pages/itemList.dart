import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:sepatu_shop/helper/provider_helper.dart';
import 'package:sepatu_shop/screens/pages/detail.dart';

class itemList extends StatelessWidget {
  const itemList({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Provider_Helper().fetchData(),
      builder: (context, snapshot) {
        return snapshot.hasData
            ? ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) => Container(
                      margin: const EdgeInsets.symmetric(
                          vertical: 15.0, horizontal: 10.0),
                      decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(10.0)),
                      child: ListTile(
                        title: Text(
                          snapshot.data![index].title.toString(),
                          style: const TextStyle(
                              color: Colors.white, fontSize: 25),
                        ),
                        subtitle: Text(
                            snapshot.data![index].description.toString(),
                            style: const TextStyle(
                                fontSize: 15, color: Colors.white),
                            overflow: TextOverflow.fade),
                        leading: CircleAvatar(
                          backgroundImage: CachedNetworkImageProvider(
                              snapshot.data![index].images!.first),
                        ),
                        onTap: () => Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => Detail(
                                title: snapshot.data![index].title,
                                desc: snapshot.data![index].description,
                                price: snapshot.data![index].price,
                                imageUrl: snapshot.data![index].images!.first),
                          ),
                        ),
                      ),
                    ))
            : const Center(
                child: CircularProgressIndicator(),
              );
      },
    );
  }
}
