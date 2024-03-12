import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_gunpla/blocs/layout.dart';
import 'package:my_gunpla/common/constants.dart';
import 'package:my_gunpla/common/storage.dart';
import 'package:my_gunpla/widgets/loading.dart';

class Layout extends StatefulWidget {
  const Layout({super.key});

  @override
  State<Layout> createState() => _LayoutState();
}

class _LayoutState extends State<Layout> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFF0079FF),
      child: BlocConsumer<LayoutBloc, LayoutState>(
        builder: (context, state) {
          return MyLoading(
            isLoading: false,
            child: SafeArea(
              bottom: false,
              child: Scaffold(
                appBar: AppBar(
                  backgroundColor: const Color(0xFF0079FF),
                  actions: [
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.shopping_cart_outlined,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                body: pages(state.index),
                floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
                floatingActionButton: SizedBox(
                  height: 68,
                  width: 68,
                  child: FloatingActionButton(
                    backgroundColor: const Color(0xFF0079FF),
                    elevation: 6,
                    onPressed: () {
                      context.read<LayoutBloc>().add(OnChangePageLayoutEvent(2));
                    },
                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                        width: 3,
                        color: state.index == 2 ? const Color(0xFF0079FF) : Colors.white,
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
                    height: 50,
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
                                color: state.index == 0 ? const Color(0xFF0079FF) : Colors.grey,
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
                                color: state.index == 1 ? const Color(0xFF0079FF) : Colors.grey,
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
                                color: state.index == 3 ? const Color(0xFF0079FF) : Colors.grey,
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
                                color: state.index == 4 ? const Color(0xFF0079FF) : Colors.grey,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
        listener: (context, state) {},
      ),
    );
  }
}

void clearToken() {
  Storage.remove(Constants.ACCESS_TOKEN);
  Storage.remove(Constants.REFRESH_TOKEN);
}

Widget pages(int selected) {
  final pages = [
    const Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Home", style: TextStyle(fontSize: 24)),
          IconButton(
            onPressed: clearToken,
            icon: Icon(Icons.delete_sweep),
          )
        ],
      ),
    ),
    const Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Search", style: TextStyle(fontSize: 24)),
          IconButton(
            onPressed: clearToken,
            icon: Icon(Icons.delete_sweep),
          )
        ],
      ),
    ),
    const Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Category", style: TextStyle(fontSize: 24)),
          IconButton(
            onPressed: clearToken,
            icon: Icon(Icons.delete_sweep),
          )
        ],
      ),
    ),
    const Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Chat", style: TextStyle(fontSize: 24)),
          IconButton(
            onPressed: clearToken,
            icon: Icon(Icons.delete_sweep),
          )
        ],
      ),
    ),
    const Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Profile", style: TextStyle(fontSize: 24)),
          IconButton(
            onPressed: clearToken,
            icon: Icon(Icons.delete_sweep),
          )
        ],
      ),
    ),
  ];

  return pages[selected];
}
