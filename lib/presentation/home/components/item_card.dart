import 'package:flutter/material.dart';
import 'package:fro_meals/data/models/product.dart';
import 'package:fro_meals/presentation/product_details/product_details_screen.dart';

class ProductCard extends StatelessWidget {
  final Product item;

  ProductCard({required this.item});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        goToProductScreen(context, item);
      },
      child: Container(
        width: 90,
        margin: const EdgeInsets.all(4),
        decoration: const BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black54,
              blurRadius: 2,
              offset: Offset(2, 1), // Shadow position
            ),
          ],
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
          gradient: LinearGradient(
              colors: [Color(0xff002b28),Color(0xff282b28)],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter),
        ),
        child: SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            // margin: EdgeInsets.all(1),
            child: Stack(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(10.0)),
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height,
                    child: Image.network(item.imgUrl, fit: BoxFit.cover)
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Expanded(
                      flex: 4,
                      child: ClipRRect(
                        borderRadius: const BorderRadius.all(Radius.circular(10.0)),
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: Container(
                          alignment: Alignment.center,
                          child: Text(
                            item.name,
                            softWrap: false,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                            ),
                            textAlign: TextAlign.right,
                          ),
                        )
                      ),
                    ),
                  ],
                ),
              ],
            )),
      ),
    );
  }

  goToProductScreen(BuildContext context, Product product){
    Navigator.push(
        context,
        MaterialPageRoute(
            fullscreenDialog: true,
            builder: (BuildContext context) => ProductDetailsScreen(product: product)
        )
    );
  }
}
