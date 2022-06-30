import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:full_screen_image/full_screen_image.dart';
import 'package:get/get.dart';
import 'package:get/utils.dart';
import 'package:pixabay_test_application/controller/dataController.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  final controller = Get.put(DataController());
  String searchKey = '';

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Image Search"),
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.only(top: 30, bottom: 15),
            height: 50,
            width: 320,
            child: TextField(
              decoration: const InputDecoration(
                  border: OutlineInputBorder(borderSide: BorderSide(width: 2)),
                  labelText: 'Search Images'),
              onChanged: (Value) {
                searchKey = Value;
              },
            ),
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: const Color(0xff38b5ed),
            ),
            height: height * .06,
            width: width * .225,
            child: FlatButton(
                onPressed: () {
                  controller.getData(searchKey);
                },
                child: Text(
                  'Search',
                  style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'poppins',
                      fontSize: width * .04),
                )),
          ),
          const SizedBox(
            height: 20,
          ),
          Obx(() {
            return Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 40, right: 40),
                child: controller.loading == true
                    ? const SizedBox(
                        height: 100,
                        width: 100,
                        child: Center(
                          child: CircularProgressIndicator(),
                        ),
                      )
                    : controller.dataList.length == 0
                        ? const Center(
                            child: Text(
                            'No Imge to show',
                            style: TextStyle(color: Colors.black, fontSize: 15),
                          ))
                        : ListView.separated(
                            shrinkWrap: true,
                            itemCount: controller.dataList.length,
                            itemBuilder: (context, index) {
                              return FullScreenWidget(
                                child: SafeArea(
                                  child: Container(
                                    height: 200,
                                    width: 100,
                                    child: Image.network(
                                      controller.dataList[index].largeUrl
                                          .toString(),
                                      height: 200,
                                      fit: BoxFit.fitWidth,
                                      loadingBuilder: (context,child,loadingProgress){
                                        if (loadingProgress ==null){
                                          return child;
                                        }
                                        else{
                                          return Center(child: CircularProgressIndicator());
                                        }
                                      },
                                    ),
                                  ),
                                ),
                              );
                            },
                            separatorBuilder: (context, index) =>
                                const SizedBox(
                                  height: 10,
                                )),
              ),
            );
          }),
        ],
      )),
    );
  }
}
