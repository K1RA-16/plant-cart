import 'package:flutter/material.dart';
import 'package:plant_cart/utils/themes.dart';
import 'package:plant_cart/view_models/descriptionViewModel.dart';
import 'package:provider/provider.dart';
import 'package:velocity_x/velocity_x.dart';

class DescriptionView extends StatefulWidget {
  final index;
  const DescriptionView({super.key, this.index});

  @override
  State<DescriptionView> createState() => _DescriptionViewState();
}

class _DescriptionViewState extends State<DescriptionView> {
  bool databaseLoaded = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    databaseLoaded = false;
  }

  @override
  Widget build(BuildContext context) {
    DescriptionViewModel descriptionViewModel =
        context.watch<DescriptionViewModel>();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      if (!databaseLoaded) {
        databaseLoaded = true;
        await descriptionViewModel.selectPlant(widget.index);
      }
    });
    return Scaffold(
      appBar: AppBar(
        actions: [const Icon(Icons.shopping_cart_outlined).p(20)],
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        child: Column(children: [
          if (descriptionViewModel.photo != "")
            Expanded(
                flex: 2,
                child: Center(child: Image.asset(descriptionViewModel.photo))),
          Expanded(
            flex: 2,
            child: Column(
              children: [
                10.heightBox,
                Container(
                  width: MediaQuery.of(context).size.width,
                  child: descriptionViewModel.name.text
                      .overflow(
                        TextOverflow.ellipsis,
                      )
                      .black
                      .bold
                      .size(25)
                      .make(),
                ).px(50).pOnly(top: 10),
                10.heightBox,
                Container(
                  width: MediaQuery.of(context).size.width,
                  child: descriptionViewModel.description.text
                      .maxLines(5)
                      .overflow(
                        TextOverflow.ellipsis,
                      )
                      .black
                      .size(2)
                      .make()
                      .p(10),
                ).px(40),
                10.heightBox,
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      child: "\$${descriptionViewModel.price}"
                          .text
                          .overflow(
                            TextOverflow.ellipsis,
                          )
                          .black
                          .bold
                          .size(35)
                          .make()
                          .pOnly(left: 10),
                    ),
                    Padding(
                        padding: MediaQuery.of(context).size.width < 400
                            ? const EdgeInsets.only(left: 20)
                            : const EdgeInsets.only(left: 50),
                        child: InkWell(
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
                              ).p(5)),
                        )),
                  ],
                ).px(40),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              decoration: BoxDecoration(color: MyThemes.green),
              child: Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          const Icon(
                            Icons.height,
                            color: Colors.white,
                            size: 70,
                          ),
                          SizedBox(
                            width: 110,
                            child: descriptionViewModel.height.text
                                .overflow(
                                  TextOverflow.ellipsis,
                                )
                                .white
                                .bold
                                .size(15)
                                .make()
                                .pOnly(left: 10),
                          ),
                        ]),
                  ),
                  10.heightBox,
                  Expanded(
                    flex: 1,
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          const Icon(
                            Icons.severe_cold_rounded,
                            color: Colors.white,
                            size: 70,
                          ),
                          SizedBox(
                            width: 110,
                            child: descriptionViewModel.temperature.text
                                .overflow(
                                  TextOverflow.ellipsis,
                                )
                                .white
                                .bold
                                .size(15)
                                .make()
                                .pOnly(left: 10),
                          ),
                        ]),
                  ),
                  10.heightBox,
                  Expanded(
                    flex: 1,
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          const Icon(
                            Icons.park_outlined,
                            color: Colors.white,
                            size: 70,
                          ),
                          SizedBox(
                            width: 130,
                            child: descriptionViewModel.pot.text
                                .overflow(
                                  TextOverflow.ellipsis,
                                )
                                .white
                                .bold
                                .size(15)
                                .make()
                                .pOnly(left: 0),
                          ),
                        ]),
                  ),
                  10.heightBox,
                ],
              ),
            ),
          )
        ]),
      ),
    );
  }
}
