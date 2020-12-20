import 'package:flutter/material.dart';
import 'FadeAnimation.dart';
import 'Add.dart';

void main() => runApp(
      MaterialApp(
        home: HomePage(),
        debugShowCheckedModeBanner: false,
      ),
    );

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<List<String>> products = [
    [
      'assets/images/watch-1.jpg',
      'Tissot Chromo',
      '549 \$',
    ],
    [
      'assets/images/watch-2.jpg',
      'Casio Chromo',
      '859 \$',
    ],
    [
      'assets/images/watch-3.jpg',
      'JWC Classic',
      '789 \$',
    ]
  ];

Carousell carousel = new Carousell('Tissot Chromo', '859 \$','assets/images/watch-1.jpg');

void prrint() {
print(carousel.getTitle);
}



  int currentIndex = 0;

  void _next() {
    setState(() {
      if (currentIndex < products.length - 1) {
        currentIndex++;
      } else {
        currentIndex = currentIndex;
      }
    });
  }

  void _prev() {
    setState(() {
      if (currentIndex > 0) {
        currentIndex--;
      } else {
        currentIndex = 0;
      }
    });
  }

@override
  void initState() {
    super.initState();
   print('hello');
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Container(
        child: Column(
          children: <Widget>[
            GestureDetector(
              onHorizontalDragEnd: (DragEndDetails details) {
                if (details.velocity.pixelsPerSecond.dx > 0) {
                  _prev();
                } else if (details.velocity.pixelsPerSecond.dx < 0) {
                  _next();
                }
              },
              child: Container(
                width: double.infinity,
                height: 450,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(products[currentIndex][0]),
                      fit: BoxFit.cover),
                ),
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.bottomRight,
                      colors: [
                        Colors.grey[700].withOpacity(.9),
                        Colors.grey.withOpacity(.0),
                      ],
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Container(
                        width: 90,
                        margin: EdgeInsets.only(bottom: 40),
                        child: Row(
                          children: _buildIndicator(),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              child: Transform.translate(
                offset: Offset(0, -20),
                child: Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(30),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30))),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      FadeAnimation(1,Text(
                        products[currentIndex][1],
                        style: TextStyle(
                            fontSize: 40,
                            color: Colors.grey[800],
                            fontWeight: FontWeight.bold),
                      ),),
                      SizedBox(
                        height: 15,
                      ),
                      FadeAnimation(1.4,Row(
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        children: <Widget>[
                          Text(
                            products[currentIndex][2],
                            style: TextStyle(
                                fontSize: 30,
                                color: Colors.yellow[700],
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Row(
                            children: <Widget>[
                              Icon(
                                Icons.star,
                                color: Colors.yellow[700],
                                size: 18,
                              ),
                              Icon(Icons.star,
                                  color: Colors.yellow[700], size: 18),
                              Icon(Icons.star,
                                  color: Colors.yellow[700], size: 18),
                              Icon(Icons.star,
                                  color: Colors.yellow[700], size: 18),
                              Icon(Icons.star_half,
                                  color: Colors.yellow[700], size: 18),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                '2789 reviews',
                                style: TextStyle(
                                    color: Colors.grey,
                                    textBaseline: TextBaseline.alphabetic),
                              ),
                            ],
                          ),
                        ],
                      ),),
                      Expanded(
                        child: Align(
                          alignment: Alignment.bottomCenter,
                          child: FadeAnimation(1.8,Container(
                            height: 50,
                            decoration: BoxDecoration(
                              color: Colors.yellow[700],
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Center(
                              child: Text(
                                'ADD TO CART',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _indicator(bool isActive) {
    return Expanded(
      child: Container(
        height: 4,
        margin: EdgeInsets.only(right: 5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: isActive ? Colors.grey[800] : Colors.white,
        ),
      ),
    );
  }

  List<Widget> _buildIndicator() {
    List<Widget> indicator = [];
    for (int i = 0; i < products.length; i++) {
      if (currentIndex == i) {
        indicator.add(_indicator(true));
      } else {
        indicator.add(_indicator(false));
      }
    }
    return indicator;
  }
}
