import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:mero/models/products.dart';
import 'package:share_plus/share_plus.dart';

class ProductDetail extends StatefulWidget {
  const ProductDetail(this.product, {Key? key}) : super(key: key);

  final Product product;

  @override
  _ProductDetailState createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  final List<String> images = [
    'https://images.unsplash.com/photo-1586882829491-b81178aa622e?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=2850&q=80',
    'https://images.unsplash.com/photo-1586871608370-4adee64d1794?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=2862&q=80',
    'https://images.unsplash.com/photo-1586901533048-0e856dff2c0d?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1650&q=80',
    'https://images.unsplash.com/photo-1586902279476-3244d8d18285?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=2850&q=80',
    'https://images.unsplash.com/photo-1586943101559-4cdcf86a6f87?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1556&q=80',
    'https://images.unsplash.com/photo-1586951144438-26d4e072b891?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1650&q=80',
    'https://images.unsplash.com/photo-1586953983027-d7508a64f4bb?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1650&q=80',
  ];

  @override
  void initState() {
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      images.forEach((imageUrl) {
        precacheImage(NetworkImage(imageUrl), context);
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () => Navigator.of(context).pop(),
          ),
          title: Text("Details"),
          centerTitle: true,
          actions: [
            IconButton(
              icon: Icon(Icons.share),
              onPressed: () {
                Share.share(
                    '${widget.product.name} https://merooffer.com/ad/${widget.product.slug}');
              },
            ),
            IconButton(
              icon: Icon(Icons.star_border),
              onPressed: () {
                print("More Pressed");
              },
            ),
          ],
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                  decoration: BoxDecoration(color: Colors.white24),
                  child: CarouselSlider.builder(
                    itemCount: images.length,
                    options: CarouselOptions(
                      autoPlay: true,
                      aspectRatio: 2.0,
                      enlargeCenterPage: true,
                    ),
                    itemBuilder: (context, index, realIdx) {
                      return Container(
                        child: Center(
                            child: CachedNetworkImage(imageUrl: '${widget.product.image}',
                                fit: BoxFit.contain, width: 1000)),
                      );
                    },
                  )),

              SizedBox(
                height: 15,
              ),

              Text(
                "${widget.product.name}",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 10,
              ),

              Text(
                "Posted at 2 june 2021",
                style: TextStyle(
                    color: Colors.black38, fontWeight: FontWeight.w600),
              ),

              SizedBox(
                height: 10,
              ),

              Text(
                "Kathmandu, Nepal",
                style: TextStyle(
                    color: Colors.black38, fontWeight: FontWeight.w600),
              ),

              SizedBox(
                height: 10,
              ),

              Divider(
                color: Colors.black38,
              ),
              Container(
                child: Row(
                  children: [
                    Text(
                          "Rs ${widget.product.price}",
                          style: TextStyle(
                              color: Colors.teal,
                              fontWeight: FontWeight.w900,
                              fontSize: 20),
                        ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Container(
                        padding:
                            EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                        child: Text(
                          "Negotiable",
                          style: TextStyle(
                              color: Colors.black38,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              Text(
                "For Sale By Mero Offer",
                style: TextStyle(
                    color: Colors.black38, fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: 15,
              ),
              Divider(
                color: Colors.black38,
              ),

              SizedBox(
                height: 15,
              ),
              //
              // Expanded(
              //     child: ListView(
              //       // shrinkWrap: true,
              //       // physics: NeverScrollableScrollPhysics(),
              //       children: [
              //         ListTile(
              //           leading: Text("Condition:"),
              //           title: Text('Foreign Used'),
              //         ),
              //         ListTile(
              //           leading: Text("Brand:"),
              //           title: Text('Honda'),
              //         ),
              //         ListTile(
              //           leading: Text("Model:"),
              //           title: Text('CRV'),
              //         ),
              //         ListTile(
              //           leading: Text("Year of Manufacture:"),
              //           title: Text('2015'),
              //         ),
              //         ListTile(
              //           leading: Text("Transmission:"),
              //           title: Text('Automatic'),
              //         ),
              //         ListTile(
              //           leading: Text("Fuel Type:"),
              //           title: Text('Petrol'),
              //         ),
              //         ListTile(
              //           leading: Text("Milege:"),
              //           title: Text('80,000 km'),
              //         ),
              //         ListTile(
              //           leading: Text("Category:"),
              //           title: Text('Car'),
              //         ),
              //       ],
              //     )),
              Text(
                "Description",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
              ),

              Text(
                "${widget.product.desc}",
                style: TextStyle(
                    color: Colors.black38, fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: 15,
              ),

              FractionallySizedBox(
                widthFactor: 1, // means 100%, you can change this to 0.8 (80%)
                child: RaisedButton.icon(
                  onPressed: () {},
                  label: Text('Promote the Ad',
                      style: TextStyle(color: Colors.white)),
                  icon: Icon(Icons.upload_rounded, color: Colors.white),
                  color: Colors.deepOrange,
                ),
              ),
              FractionallySizedBox(
                widthFactor: 1, // means 100%, you can change this to 0.8 (80%)
                child: RaisedButton.icon(
                  onPressed: () {},
                  label:
                      Text('Report', style: TextStyle(color: Colors.black38)),
                  icon: Icon(Icons.block, color: Colors.black38),
                ),
              ),
            ],
          ),
        ));
  }
}
