import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class MyCard extends StatefulWidget {
  final String src;
  final String title;
  final String grade;
  final String scale;
  final num price;
  final num discount;
  final bool isFavorite;

  const MyCard(
    this.src, {
    super.key,
    required this.title,
    required this.grade,
    required this.scale,
    required this.price,
    required this.discount,
    required this.isFavorite,
  });

  @override
  State<MyCard> createState() => _MyCardState();
}

class _MyCardState extends State<MyCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(context, "/detail"),
      child: Container(
        width: 195,
        padding: const EdgeInsets.all(6),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: Colors.grey[100],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 180,
              clipBehavior: Clip.hardEdge,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: Colors.white,
              ),
              child: Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: Image.network(widget.src),
                  ),
                  if (widget.discount > 0)
                    Positioned(
                      top: 10,
                      right: -30,
                      child: Transform.rotate(
                        angle: 45 * 3.1415927 / 180,
                        child: Container(
                          width: 100,
                          height: 20,
                          alignment: Alignment.center,
                          color: Colors.amber.withOpacity(0.6),
                          child: Text(
                            '${(widget.discount * 100).toStringAsFixed(0)}%',
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  Positioned(
                    top: 0,
                    left: 0,
                    child: IconButton(
                      icon: Icon(
                        widget.isFavorite ? Icons.favorite : Icons.favorite_border,
                        color: widget.isFavorite ? Colors.red : Colors.grey[700],
                      ),
                      onPressed: () {},
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 12),
            Padding(
              padding: const EdgeInsets.only(left: 1),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.title,
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Text(
                        widget.grade,
                        style: TextStyle(
                          color: Colors.amber[700],
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(width: 2),
                      Text(
                        widget.scale,
                        style: const TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 18),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Text(
                            '฿${NumberFormat("#,###").format(widget.price - (widget.price * widget.discount))}',
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                          const SizedBox(width: 4),
                          if (widget.discount > 0)
                            Text(
                              '฿${NumberFormat("#,###").format(widget.price)}',
                              style: const TextStyle(
                                color: Colors.grey,
                                fontSize: 12,
                                fontWeight: FontWeight.w900,
                                decoration: TextDecoration.lineThrough,
                                decorationColor: Colors.grey,
                                decorationThickness: 1,
                              ),
                            ),
                        ],
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.blue[900],
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(16),
                            bottomRight: Radius.circular(16),
                          ),
                        ),
                        child: IconButton(
                          icon: const Icon(
                            Icons.shopping_cart,
                            color: Colors.white,
                          ),
                          onPressed: () {},
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
