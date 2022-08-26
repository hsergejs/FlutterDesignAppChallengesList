import 'package:design_app_challenge_4/constants.dart';
import 'package:design_app_challenge_4/models/Product.dart';
import 'package:flutter/material.dart';

class ProductTitleWithImage extends StatelessWidget {
  const ProductTitleWithImage({
    Key key,
    @required this.product,
  }) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding*1.6),
      child: new Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          new Text(
            'Aristocratic Hand Bag',
            style: new TextStyle(
              color: Colors.white,
            ),
          ),
          new Text(
            //product?.title, //provide that method is NULL aware, getting rid of NULL error
            product.title,
            style: Theme.of(context).textTheme.headline4.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          new SizedBox(height: kDefaultPadding),
          new Row(
            children: [
              new RichText( //allow to have different styles in one text, instead of creating different Text() widgets
                text: new TextSpan(
                  children: [
                    new TextSpan(text: "Price:\n"),
                    new TextSpan(
                      text: "€ ${product.price}",
                      style: Theme.of(context).textTheme.headline4.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  ],
                ),
              ),
              new SizedBox(width: kDefaultPadding),
              Expanded(
                child: Hero(
                  tag: "${product.id}",
                  child: new Image.asset(
                    product.image,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
