import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:my_gunpla/widgets/image_slider.dart';

class Detail extends StatefulWidget {
  const Detail({super.key});

  @override
  State<Detail> createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  final _trackingScrollController = TrackingScrollController();
  double _opacity = 0;
  double _offset = 0;
  Color _iconColor = Colors.white;

  @override
  void initState() {
    _trackingScrollController.addListener(() {
      _offset = double.parse(_trackingScrollController.offset.toStringAsFixed(0)) / 150;
      if (_offset >= 0 && _offset <= 1) {
        setState(() {
          _opacity = _offset;
          int calc = (255 - _offset * 255).toInt();
          _iconColor = Color.fromARGB(255, calc, calc, calc);
        });
      } else {
        if (_offset > 1) {
          setState(() {
            _opacity = 1;
            _iconColor = Colors.black;
          });
        } else {
          setState(() {
            _opacity = 0;
            _iconColor = Colors.white;
          });
        }
      }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        shadowColor: Colors.grey.withOpacity(_opacity),
        systemOverlayStyle: const SystemUiOverlayStyle(
          systemNavigationBarContrastEnforced: true,
          systemStatusBarContrastEnforced: true,
        ),
        surfaceTintColor: Colors.white,
        backgroundColor: Colors.white.withOpacity(_opacity),
        leadingWidth: 52,
        leading: Padding(
          padding: const EdgeInsets.only(left: 12),
          child: CircleAvatar(
            backgroundColor: Colors.grey.withOpacity((1 - _opacity) * 0.75),
            child: IconButton(
              padding: EdgeInsets.zero,
              icon: Icon(
                Icons.keyboard_backspace,
                color: _iconColor,
                size: 34,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 12),
            child: CircleAvatar(
              backgroundColor: Colors.grey.withOpacity((1 - _opacity) * 0.75),
              child: Stack(
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.shopping_cart_outlined,
                      color: _iconColor,
                    ),
                  ),
                  Positioned(
                    right: 0,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.red,
                        border: Border.all(
                          color: Colors.white,
                        ),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      constraints: const BoxConstraints(
                        minWidth: 22,
                        minHeight: 22,
                      ),
                      child: const Center(
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: 3,
                          ),
                          child: Text(
                            "12",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        controller: _trackingScrollController,
        child: Column(
          children: [
            MyImageSlider(
              height: 430,
              children: [
                Image.network(
                  "https://bandai-hobby.net/images/158_1404_s_yr8hmvg4hkiupcwu7q8008vp3a9n.jpg",
                  fit: BoxFit.fitHeight,
                ),
                Image.network(
                  "https://bandai-hobby.net/images/153_1404_s_oec4f9ci5m8sljikee16z934028i.jpg",
                  fit: BoxFit.fitHeight,
                ),
                Image.network(
                  "https://bandai-hobby.net/images/155_1404_s_f40kmhec134wy01bcrmerim5s2he.jpg",
                  fit: BoxFit.fitHeight,
                ),
                Image.network(
                  "https://bandai-hobby.net/images/156_1404_s_4073tb7ig0kjih31sz7ptr2in588.jpg",
                  fit: BoxFit.fitHeight,
                ),
                Image.network(
                  "https://bandai-hobby.net/images/157_1404_s_po1gvzrr5zdmasbfkbko2a7e1hxs.jpg",
                  fit: BoxFit.fitHeight,
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            '฿${NumberFormat("#,###").format(3990 - (3990 * 0.15))}',
                            style: TextStyle(
                              color: Colors.blue[900],
                              fontSize: 24,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          const SizedBox(width: 8),
                          if (0.15 > 0)
                            Text(
                              '฿${NumberFormat("#,###").format(3990)}',
                              style: TextStyle(
                                color: Colors.grey.withOpacity(0.8),
                                fontSize: 18,
                                decoration: TextDecoration.lineThrough,
                                decorationColor: Colors.grey,
                                decorationThickness: 1,
                              ),
                            ),
                          const SizedBox(width: 8),
                          Container(
                            width: 48,
                            height: 32,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: Colors.amber.withOpacity(0.6),
                            ),
                            child: Text(
                              '${(0.15 * 100).toStringAsFixed(0)}%',
                              style: TextStyle(
                                color: Colors.blue[900],
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                      IconButton(
                        icon: const Icon(
                          Icons.favorite,
                          color: Colors.red,
                        ),
                        onPressed: () {},
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  const Text(
                    "MG RX-78-02 Gundam 1/100",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 24),
                  const Text(
                    "Description",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Divider(
                    thickness: 1,
                    height: 1,
                    color: Colors.grey.withOpacity(0.5),
                    indent: 0,
                    endIndent: 8,
                  ),
                  const SizedBox(height: 12),
                  const Text(
                    'Release date :	November 21, 2015',
                  ),
                  const Text(
                    'Target age :	Over 15 years old',
                  ),
                  const SizedBox(height: 12),
                  const Text(
                    'Some of the new unique weapons, including the chest vulcan, come with clear effect parts, allowing for an impressive display! Various weapons such as a shoulder cannon are also included, and the camera eye light can also be reproduced using the separately sold LED unit! Some of the new unique weapons, including the chest vulcan, come with clear effect parts, allowing for an impressive display! Various weapons',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                blurRadius: 10,
                color: Colors.grey.withOpacity(0.3),
              ),
            ],
          ),
          child: BottomAppBar(
            elevation: 0,
            padding: const EdgeInsets.all(0),
            height: 52,
            color: Colors.white,
            child: Row(
              children: [
                Expanded(
                    child: Row(
                  children: [
                    Expanded(
                      child: InkWell(
                        onTap: () {},
                        child: Ink(
                          color: Colors.white,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.chat_bubble_outline,
                                color: Colors.blue[900],
                              ),
                              const SizedBox(height: 4),
                              const Text(
                                "Chat Now",
                                style: TextStyle(
                                  fontSize: 10,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const VerticalDivider(
                      thickness: 1,
                      width: 1,
                      color: Colors.grey,
                      indent: 12,
                      endIndent: 12,
                    ),
                    Expanded(
                      child: InkWell(
                        onTap: () {},
                        child: Ink(
                          color: Colors.white,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.shopping_cart_outlined,
                                color: Colors.blue[900],
                              ),
                              const SizedBox(height: 4),
                              const Text(
                                "Add to Cart",
                                style: TextStyle(
                                  fontSize: 10,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                )),
                Expanded(
                  child: InkWell(
                    onTap: () {},
                    child: Ink(
                      color: Colors.blue[900],
                      child: const Center(
                        child: Text(
                          "Buy Now",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
