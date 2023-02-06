
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:sepatu_shop/helper/provider_helper.dart';
import 'package:sepatu_shop/screens/pages/detail.dart';

class HotList extends StatefulWidget {
  const HotList({super.key});

  @override
  State<HotList> createState() => _HotListState();
}

class _HotListState extends State<HotList> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Provider_Helper().fetchData_secondary(),
      builder: (context, snapshot) {
        return snapshot.hasData
            ? ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) => Container(
                  margin:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 10.0),
                  color: Colors.white,
                  child: ListTile(
                    title: Text(
                      snapshot.data![index]!.title.toString(),
                      style: const TextStyle(fontSize: 25),
                      softWrap: true,
                      maxLines: 1,
                    ),
                    subtitle: Text(
                      '\$${snapshot.data![index]!.price}',
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                    trailing: Container(
                      height: 150,
                      child: CachedNetworkImage(
                        imageUrl: snapshot.data![index]!.image.toString(),
                        fit: BoxFit.contain,
                      ),
                    ),
                    onTap: () => Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => Detail(
                            title: snapshot.data![index]!.title,
                            desc: snapshot.data![index]!.description,
                            price: snapshot.data![index]!.price,
                            imageUrl: snapshot.data![index]!.image),
                      ),
                    ),
                  ),
                ),
              )
            : const Center(
                child: CircularProgressIndicator(),
              );
      },
    );
  }
}
