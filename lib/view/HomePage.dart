import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:get/utils.dart';
import 'package:pixabay_test_application/controller/dataController.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  final controller = Get.put(DataController());
  late String searchKey ;

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
              decoration: InputDecoration(border: OutlineInputBorder()),
              onChanged: (Value){
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
          SizedBox(height: 20,),
          Obx(() {
            return Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 40,right: 40),
                child: ListView.separated(
                  shrinkWrap: true,
                    itemCount: controller.dataList.length,
                    itemBuilder: (context, index) {
                      return  Container(
                        height: 200,
                        width: 100,
                        child: Image.network(controller.dataList[index].largeUrl.toString(),height: 200,fit: BoxFit.fill,),
                      );
                    },
                    separatorBuilder: (context, index) => SizedBox(
    height: 10,
  )
                    ),
              ),
            );
          }),
        ],
      )),
    );
  }
}
