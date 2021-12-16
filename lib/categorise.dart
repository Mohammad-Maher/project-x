import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_ecommerce_ui_kit/product_detail.dart';
import './models/product_layout.dart';

class Categorise extends StatefulWidget {
  static const routeName = '/categorise';
  @override
  _CategoriseState createState() => _CategoriseState();
}

class _CategoriseState extends State<Categorise> {
  final List<String> imgList = [
    'https://static.nike.com/a/images/t_PDP_1280_v1/f_auto,q_auto:eco/73507444-25f7-4be0-ad71-45576c5bcf89/sportswear-mens-t-shirt-MK2TR1.png',
    'https://assets.adidas.com/images/w_383,h_383,f_auto,q_auto:sensitive,fl_lossy,c_fill,g_auto/3bcfb6bd1282449abcbaad6b00dc6d9b_9366/adicolor-classics-trefoil-t-shirt-%E2%80%93-grosse-grossen.jpg',
    'https://i8.amplience.net/i/jpl/jd_454926_a?qlt=92&w=600&h=765&v=1&fmt=auto',
    'https://assets.adidas.com/images/w_383,h_383,f_auto,q_auto:sensitive,fl_lossy,c_fill,g_auto/0f9ade5e7b154709b709ad0b008cb136_9366/adicolor-classics-trefoil-t-shirt.jpg',
    'https://assets.adidas.com/images/w_383,h_383,f_auto,q_auto:sensitive,fl_lossy,c_fill,g_auto/35e687afff864631ac4fad0b0082553d_9366/adicolor-classics-trefoil-tee.jpg',
    'https://lh3.googleusercontent.com/proxy/atRirth7Jjn0_sKmZt5cHsfmukhX-FIAxtwxZPcNPfhQs0CavPT7Pc8nU1uR0wyrxaNcHzU8uGz6jBAdB159-2L78ypGt8nCCGTmdroYKz88uIQfuH9PbZuKVqOxiLAK5cjrHFJqgLTkziJktEav3chZ_Q3hdcvyCNdBBcz6vdGuR3uGZ9U31jQ99flc',
    'https://www.hellomagazine.com/imagenes/fashion/celebrity-style/2020010982912/amanda-holden-blue-zara-top-instagram/0-399-618/zara-top-z.jpg',
    'https://static.zara.net/photos///2021/I/0/2/p/5588/472/800/12/w/199/5588472800_2_1_1.jpg?ts=1626290312272',
    'https://assets.adidas.com/images/w_383,h_383,f_auto,q_auto:sensitive,fl_lossy,c_fill,g_auto/5069f41efb5746d49ac8acb30163194b_9366/amplifier-tee.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    final storesContentArg =
        ModalRoute.of(context)!.settings.arguments as List<ProductLayout>;
    return Scaffold(
      appBar: AppBar(
        // title: Text('SeamlesStyle'),
        title: Text('Stores'),
      ),
      body: SafeArea(
          // top: false,
          // left: false,
          // right: false,
          child: Container(
        child: ListView.builder(
          itemBuilder: (ctx, index) {
            return Card(
              clipBehavior: Clip.hardEdge,
              child: InkWell(
                onTap: () {
                  Navigator.of(context).pushNamed(
                    Products.routname,
                    arguments: storesContentArg[index],
                  );
                  /////////////////// change this to a navigator dont forget
                },
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(
                      height: 180,
                      width: double.infinity,
                      child: CachedNetworkImage(
                        fit: BoxFit.fitHeight,
                        // imageUrl: imgList[index],
                        imageUrl: storesContentArg[index].img,
                        placeholder: (context, url) =>
                            Center(child: CircularProgressIndicator()),
                        errorWidget: (context, url, error) =>
                            new Icon(Icons.error),
                      ),
                    ),
                    ListTile(
                      // leading: Icon(
                      //   Icons.shopping_bag_outlined,
                      //   color: Theme.of(context).primaryColorLight,
                      // ),
                      trailing: Text(
                        storesContentArg[index].price.toString(),
                        style: TextStyle(
                            fontSize: 20,
                            color: Theme.of(context).primaryColor),
                      ),
                      title: Text(
                        storesContentArg[index].name,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                    )
                  ],
                ),
              ),
            );
          },
          // itemCount: imgList.length,
          itemCount: storesContentArg.length,
        ),
      )),
    );
  }
}
