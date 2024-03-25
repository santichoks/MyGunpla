import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_gunpla/blocs/layout.dart';
import 'package:my_gunpla/widgets/card.dart';
import 'package:my_gunpla/widgets/image_slider.dart';
import 'package:my_gunpla/widgets/loading.dart';

class Layout extends StatefulWidget {
  const Layout({super.key});

  @override
  State<Layout> createState() => _LayoutState();
}

class _LayoutState extends State<Layout> {
  final _trackingScrollController = TrackingScrollController();
  Color _cartColor = Colors.white;
  double _opacity = 1;
  double _offset = 0;

  final _categories = ["HG", "MG", "PG", "RG", "SD", "HGUC", "MGEX", "MGSD", "MEGA", "Other"];
  final _list = [
    {
      "src": "https://bandai-hobby.net/images/153_1404_s_oec4f9ci5m8sljikee16z934028i.jpg",
      "title": "RX-78-02 Gundam",
      "grade": "MASTER GRADE",
      "scale": "(MG) 1/100",
      "price": 3990,
      "discount": 0.15,
      "isFavorite": true,
    },
    {
      "src": "https://bandai-hobby.net/images/153_4658_s_p568ql57g7ei9oxwqxxj6pj38olz.jpg",
      "title": "Double Zeta Gundam",
      "grade": "MASTER GRADE",
      "scale": "(MG) 1/100",
      "price": 2990,
      "discount": 0,
      "isFavorite": false,
    },
    {
      "src": "https://bandai-hobby.net/images/153_3856_s_rasv2tj4xxdffh4w217cocno0jqb.jpg",
      "title": "RX-78-2 Gundam",
      "grade": "PERFECT GRADE",
      "scale": "(PG) 1/60",
      "price": 7790,
      "discount": 0.15,
      "isFavorite": false,
    },
    {
      "src": "https://bandai-hobby.net/images/153_3858_s_u1nbhocly6o73ebe7apsa6ryqghg.jpg",
      "title": "MS-06S Char's Zaku 2",
      "grade": "PERFECT GRADE",
      "scale": "(PG) 1/60",
      "price": 6500,
      "discount": 0.15,
      "isFavorite": false,
    },
  ];

  @override
  void initState() {
    _trackingScrollController.addListener(() {
      _offset = double.parse(_trackingScrollController.offset.toStringAsFixed(0)) / 150;
      if (_offset >= 0 && _offset <= 1) {
        setState(() {
          _opacity = 1 - _offset;
        });
      } else {
        if (_offset > 1) {
          setState(() {
            _cartColor = Colors.black;
            _opacity = 0;
          });
        } else {
          setState(() {
            _cartColor = Colors.white;
            _opacity = 1;
          });
        }
      }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LayoutBloc, LayoutState>(
      builder: (context, state) {
        return MyLoading(
          isLoading: false,
          child: Scaffold(
            appBar: AppBar(
              title: Text(
                "My Gunpla",
                style: TextStyle(
                  color: _cartColor,
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
              systemOverlayStyle: const SystemUiOverlayStyle(
                systemNavigationBarContrastEnforced: true,
                systemStatusBarContrastEnforced: true,
              ),
              surfaceTintColor: Colors.white,
              backgroundColor: Colors.blue[900]!.withOpacity(_opacity),
              actions: [
                Padding(
                  padding: const EdgeInsets.only(right: 12),
                  child: Stack(
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.shopping_cart_outlined,
                          color: _cartColor,
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
              ],
            ),
            body: SingleChildScrollView(
              controller: _trackingScrollController,
              padding: const EdgeInsets.only(bottom: 48),
              child: SizedBox(
                width: double.infinity,
                child: Container(
                  margin: const EdgeInsets.fromLTRB(16, 10, 16, 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      MyImageSlider(
                        height: 190,
                        children: [
                          Image.network(
                            "https://images.squarespace-cdn.com/content/v1/591452c0414fb58e825ed51e/3875f6ec-2da0-4445-a40c-c576ccb536fb/Wide+Banner+%287%29.jpg",
                            fit: BoxFit.fitWidth,
                          ),
                          Image.network(
                            "https://bandai-hobby.net/global/images/top/banner_gunplanavigationcatalog2023_eng.jpg",
                            fit: BoxFit.fitWidth,
                          ),
                          Image.network(
                            "https://bandai-hobby.net/global/images/top/banner_gunplanavigationcatalog2023_eng.jpg",
                            fit: BoxFit.fitWidth,
                          ),
                          Image.network(
                            "https://bandai-hobby.net/global/images/top/banner_gunplanavigationcatalog2023_eng.jpg",
                            fit: BoxFit.fitWidth,
                          ),
                          Image.network(
                            "https://bandai-hobby.net/global/images/top/banner_gunplanavigationcatalog2023_eng.jpg",
                            fit: BoxFit.fitWidth,
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),
                      const Text(
                        "Categories",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 18),
                      SizedBox(
                        height: 60,
                        child: ListView.builder(
                          clipBehavior: Clip.none,
                          shrinkWrap: true,
                          itemCount: _categories.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return Column(
                              children: [
                                Container(
                                  width: 52,
                                  height: 52,
                                  margin: const EdgeInsets.only(right: 12),
                                  decoration: BoxDecoration(
                                    gradient: const LinearGradient(
                                      begin: AlignmentDirectional.topCenter,
                                      end: AlignmentDirectional.bottomCenter,
                                      colors: [
                                        Color(0xFFEBD197),
                                        Color(0xFFD4AF37),
                                        Color(0xFFFCF6BA),
                                        Color(0xFFB8860D),
                                        Color(0xFF996515),
                                      ],
                                    ),
                                    border: Border.all(
                                      width: 1,
                                      color: Colors.grey,
                                    ),
                                    borderRadius: BorderRadius.circular(108),
                                    boxShadow: const [
                                      BoxShadow(
                                        color: Colors.grey,
                                        blurRadius: 4,
                                        offset: Offset(2, 2),
                                      ),
                                    ],
                                  ),
                                  child: Center(
                                    child: Stack(
                                      children: [
                                        Text(
                                          _categories[index],
                                          style: const TextStyle(
                                            fontSize: 12,
                                            color: Colors.black,
                                            fontWeight: FontWeight.w800,
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            );
                          },
                        ),
                      ),
                      const SizedBox(height: 18),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Text(
                            "New Arrivals",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            "View All  >",
                            style: TextStyle(
                              color: Colors.grey[700],
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 18),
                      GridView.builder(
                        itemCount: _list.length,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisExtent: 310,
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10,
                        ),
                        itemBuilder: (context, index) {
                          return MyCard(
                            _list[index]["src"]!.toString(),
                            title: _list[index]["title"]!.toString(),
                            grade: _list[index]["grade"]!.toString(),
                            scale: _list[index]["scale"]!.toString(),
                            price: _list[index]["price"]! as num,
                            discount: _list[index]["discount"]! as num,
                            isFavorite: _list[index]["isFavorite"]! as bool,
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
            floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
            floatingActionButton: SizedBox(
              height: 68,
              width: 68,
              child: FloatingActionButton(
                backgroundColor: Colors.blue[900],
                elevation: 6,
                onPressed: () {
                  context.read<LayoutBloc>().add(OnChangePageLayoutEvent(2));
                },
                shape: RoundedRectangleBorder(
                  side: BorderSide(
                    width: 3,
                    color: state.index == 2 ? Colors.blue[900]! : Colors.white,
                  ),
                  borderRadius: BorderRadius.circular(100),
                ),
                child: const Icon(
                  Icons.list,
                  size: 38,
                  color: Colors.white,
                ),
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
                height: 60,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        MaterialButton(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          minWidth: 68,
                          onPressed: () {
                            context.read<LayoutBloc>().add(OnChangePageLayoutEvent(0));
                          },
                          child: Icon(
                            Icons.home,
                            color: state.index == 0 ? Colors.blue[900] : Colors.grey,
                          ),
                        ),
                        MaterialButton(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          minWidth: 68,
                          onPressed: () {
                            context.read<LayoutBloc>().add(OnChangePageLayoutEvent(1));
                          },
                          child: Icon(
                            Icons.search,
                            color: state.index == 1 ? Colors.blue[900] : Colors.grey,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        MaterialButton(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          minWidth: 68,
                          onPressed: () {
                            context.read<LayoutBloc>().add(OnChangePageLayoutEvent(3));
                          },
                          child: Icon(
                            Icons.chat_bubble,
                            color: state.index == 3 ? Colors.blue[900] : Colors.grey,
                          ),
                        ),
                        MaterialButton(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          minWidth: 68,
                          onPressed: () {
                            context.read<LayoutBloc>().add(OnChangePageLayoutEvent(4));
                          },
                          child: Icon(
                            Icons.person,
                            color: state.index == 4 ? Colors.blue[900] : Colors.grey,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      },
      listener: (context, state) {},
    );
  }
}
