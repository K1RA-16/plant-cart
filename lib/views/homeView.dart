import 'package:flutter/material.dart';
import 'package:plant_cart/utils/themes.dart';
import 'package:plant_cart/view_models/homeViewModel.dart';
import 'package:provider/provider.dart';
import 'package:velocity_x/velocity_x.dart';

import 'descriptionView.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  bool databaseLoaded = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    databaseLoaded = false;
  }

  @override
  Widget build(BuildContext context) {
    HomeViewModel homeViewModel = context.watch<HomeViewModel>();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      if (!databaseLoaded) {
        databaseLoaded = true;
        await homeViewModel.loadDb();
        homeViewModel.loadPage(homeViewModel.selectedOption);
      }
    });
    return Scaffold(
      body: Row(
        children: <Widget>[
          Expanded(
            flex: homeViewModel.menu ? 2 : 1,
            child: Container(
              decoration: BoxDecoration(color: MyThemes.green),
              child: Column(
                children: [
                  Expanded(
                      flex: 1,
                      child: InkWell(
                        onTap: () {
                          homeViewModel.setMenu(!homeViewModel.menu);
                        },
                        child: const Icon(
                          Icons.menu,
                          color: Colors.white,
                        ),
                      )),
                  Expanded(
                      flex: 5,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          InkWell(
                            onTap: () {
                              homeViewModel.select(0);
                            },
                            child: RotatedBox(
                              quarterTurns: homeViewModel.menu ? 0 : 3,
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Text(
                                    "Shrubs",
                                    style: homeViewModel.selectedOption != 0
                                        ? const TextStyle(
                                            color: Colors.white,
                                          )
                                        : const TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontStyle: FontStyle.italic),
                                  ),
                                  if (homeViewModel.selectedOption == 0)
                                    const Icon(
                                      Icons.circle,
                                      color: Colors.white,
                                      size: 5,
                                    )
                                ],
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              homeViewModel.select(1);
                            },
                            child: RotatedBox(
                              quarterTurns: homeViewModel.menu ? 0 : 3,
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Text(
                                    "Container \nPlants",
                                    style: homeViewModel.selectedOption != 1
                                        ? const TextStyle(
                                            color: Colors.white,
                                          )
                                        : const TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontStyle: FontStyle.italic),
                                  ),
                                  if (homeViewModel.selectedOption == 1)
                                    const Icon(
                                      Icons.circle,
                                      color: Colors.white,
                                      size: 5,
                                    )
                                ],
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              homeViewModel.select(2);
                            },
                            child: RotatedBox(
                              quarterTurns: homeViewModel.menu ? 0 : 3,
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Text(
                                    "Herbaceous \nPerennials",
                                    style: homeViewModel.selectedOption != 2
                                        ? const TextStyle(
                                            color: Colors.white,
                                          )
                                        : const TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontStyle: FontStyle.italic),
                                  ),
                                  if (homeViewModel.selectedOption == 2)
                                    const Icon(
                                      Icons.circle,
                                      color: Colors.white,
                                      size: 5,
                                    )
                                ],
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              homeViewModel.select(3);
                            },
                            child: RotatedBox(
                                quarterTurns: homeViewModel.menu ? 0 : 3,
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Text(
                                      "Cacti \n& Succulents",
                                      style: homeViewModel.selectedOption != 3
                                          ? const TextStyle(
                                              color: Colors.white,
                                            )
                                          : const TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                              fontStyle: FontStyle.italic),
                                    ),
                                    if (homeViewModel.selectedOption == 3)
                                      const Icon(
                                        Icons.circle,
                                        color: Colors.white,
                                        size: 5,
                                      )
                                  ],
                                )),
                          )
                        ],
                      )),
                  Expanded(
                      flex: 1,
                      child: InkWell(
                        onTap: () {
                          homeViewModel.select(0);
                        },
                        child: const Icon(
                          Icons.home,
                          color: Colors.white,
                        ),
                      ))
                ],
              ),
            ),
          ),
          Expanded(
            flex: 4,
            child: Container(
              decoration: BoxDecoration(color: MyThemes.backgroundColor),
              child: Column(children: [
                Expanded(
                  flex: 1,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(18.0),
                        child: Container(
                          width: MediaQuery.of(context).size.width - 200,
                          child: Text(homeViewModel.selectedOptionText,
                              maxLines: 2,
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  overflow: TextOverflow.ellipsis,
                                  fontSize: 30)),
                        ),
                      ),
                      if (!homeViewModel.menu)
                        const Padding(
                          padding: EdgeInsets.all(18.0),
                          child: Icon(Icons.search),
                        ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 5,
                  child: Container(
                    child: ListBuilder(),
                  ),
                )
              ]),
            ),
          )
        ],
      ),
    );
  }
}

class ListBuilder extends StatelessWidget {
  const ListBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    HomeViewModel homeViewModel = context.watch<HomeViewModel>();
    return ListView.builder(
      shrinkWrap: true,
      itemCount: homeViewModel.currentData.length,
      itemBuilder: (context, index) {
        return ListInflate(index: index);
      },
    );
  }
}

class ListInflate extends StatefulWidget {
  final int index;

  const ListInflate({Key? key, required this.index}) : super(key: key);

  @override
  State<ListInflate> createState() => _ListInflateState();
}

class _ListInflateState extends State<ListInflate> {
  @override
  Widget build(BuildContext context) {
    HomeViewModel homeViewModel = context.watch<HomeViewModel>();
    return VxBox(
        child: Row(children: [
      //CatalogImage(image: catalog.image),
      Expanded(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
            onTap: (() {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) => DescriptionView(
                      index: widget.index,
                    ),
                  ));
            }),
            child: Column(
              children: [
                10.heightBox,
                Container(
                    width: MediaQuery.of(context).size.width,
                    height: 270,
                    child: Image.asset(
                      homeViewModel.currentData[widget.index].photo,
                      fit: BoxFit.contain,
                    )),
                10.heightBox,
                Container(
                  width: MediaQuery.of(context).size.width - 150,
                  child: homeViewModel.currentData[widget.index].name.text
                      .overflow(
                        TextOverflow.ellipsis,
                      )
                      .black
                      .bold
                      .size(15)
                      .make()
                      .pOnly(left: 10),
                ),
                10.heightBox,
                Container(
                  width: MediaQuery.of(context).size.width - 150,
                  child:
                      homeViewModel.currentData[widget.index].instructions.text
                          .overflow(
                            TextOverflow.ellipsis,
                          )
                          .black
                          .bold
                          .size(15)
                          .make()
                          .pOnly(left: 10),
                ),
                10.heightBox,
                Container(
                  width: MediaQuery.of(context).size.width - 150,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        child:
                            "\$${homeViewModel.currentData[widget.index].price}"
                                .text
                                .overflow(
                                  TextOverflow.ellipsis,
                                )
                                .black
                                .bold
                                .size(15)
                                .make()
                                .pOnly(left: 10),
                      ),
                      InkWell(
                        onTap: () {
                          VxToast.show(context, msg: "item added to cart");
                        },
                        child: Card(
                                elevation: 5,
                                shadowColor: Colors.black,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(80),
                                  //set border radius more than 50% of height and width to make circle
                                ),
                                child: const Icon(
                                  Icons.add,
                                  color: Colors.black,
                                  size: 10,
                                ).p(5))
                            .px(55),
                      )
                    ],
                  ),
                ),
              ],
            ),
          )

          //catalog.name.text.bold.lg.make(),
          // TextFormField(
          //   decoration: InputDecoration(
          //       hintText: widget.data["value"].toString()),
          //   controller: _controller[_index],
          // ).pOnly(left: 22),
        ],
      )),
    ])).white.roundedSM.square(400).make().py16().p(10);
  }
}
