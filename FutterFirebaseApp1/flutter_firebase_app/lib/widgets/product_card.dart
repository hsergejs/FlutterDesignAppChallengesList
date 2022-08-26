import 'package:flutter/material.dart';
import 'package:flutter_firebase_app/screens/product_page.dart';

class ProductCard extends StatelessWidget {

  final String productId; //can be passed both and productId
  final Function press; // and press function
  final String imgUrl;
  final String title;
  final String price;

  const ProductCard({Key key, this.press, this.imgUrl, this.title, this.price, this.productId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
      //onTap: press,
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProductPage(productId: productId), //getting id of the product in firestore as String
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.0), //this doesn't hava affect on image, only on container, thus wrap image with another widget
        ),
        margin: EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
        child: Stack(
          children: [
            Container(
              height: 350.0,
              child: ClipRRect( //Will allow to add border radius to image, as clipping of the container didn't work, as image is flat
                borderRadius: BorderRadius.circular(12.0),
                child: Image.network(
                  imgUrl,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Positioned( //set position of the elements and expand widget
              bottom: 0.0,
              left: 0.0,
              right: 0.0,
              child: Padding(
                padding: EdgeInsets.all(24.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween, //without a container alignment is not working
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        fontSize: 16.0,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      price,
                      style: TextStyle(
                        fontSize: 24.0,
                        color: Theme.of(context).accentColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
