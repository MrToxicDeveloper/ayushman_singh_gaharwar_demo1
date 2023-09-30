import 'package:ayushman_singh_gaharwar_demo1/home/controller/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  HomeController controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text(
            "Oceanmtech",
            style: GoogleFonts.poppins(
              textStyle: TextStyle(color: Colors.black),
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8),
          child: FutureBuilder(
            future: controller.apiCaller(),
            builder: (context, snapshot) {
              if (controller.dataList.isNotEmpty) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      children: [
                        Obx(
                          () => InkWell(
                            onTap: () {
                              setState(() {

                              });
                              controller.ATZ.value = false;


                                controller.filterApi();
                                print(
                                    "========================${controller.dataList[0].name}");

                            },
                            child: Container(
                              margin: EdgeInsets.symmetric(horizontal: 5),
                              padding: EdgeInsets.only(left: 8),
                              height: 40,
                              decoration: BoxDecoration(
                                  color: controller.ATZ.value
                                      ? Colors.white
                                      : Colors.black,
                                  borderRadius: BorderRadius.circular(5)),
                              child: Row(
                                children: [
                                  Text(
                                    "Category: A to Z",
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        color: controller.ATZ.value
                                            ? Colors.black
                                            : Colors.white),
                                  ),
                                  IconButton(
                                    onPressed: () {
                                      controller.ATZ.value = true;
                                      setState(() {
                                        controller.apiCaller();
                                      });
                                    },
                                    icon: Icon(
                                      Icons.cancel_outlined,
                                      color: Colors.white,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                        Obx(
                          () => InkWell(
                            onTap: () {
                              controller.ZTA.value = false;
                              controller.filterApi();
                              setState(() {
                                print(
                                    "========================${controller.dataList[0].name}");
                              });
                            },
                            child: Container(
                              margin: EdgeInsets.symmetric(horizontal: 5),
                              padding: EdgeInsets.only(left: 8),
                              height: 40,
                              decoration: BoxDecoration(
                                  color: controller.ZTA.value
                                      ? Colors.white
                                      : Colors.black,
                                  borderRadius: BorderRadius.circular(5)),
                              child: Row(
                                children: [
                                  Text(
                                    "Category: Z to A",
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        color: controller.ZTA.value
                                            ? Colors.black
                                            : Colors.white),
                                  ),
                                  IconButton(
                                    onPressed: () {
                                      controller.ZTA.value = true;
                                      setState(() {
                                        controller.apiCaller();
                                      });
                                    },
                                    icon: Icon(
                                      Icons.cancel_outlined,
                                      color: Colors.white,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Expanded(
                      child: Container(
                        child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: controller.dataList.length,
                          itemBuilder: (context, index) {
                            return Container(
                              margin: EdgeInsets.symmetric(vertical: 5),
                              child: ListTile(
                                leading: Container(
                                  height: 60,
                                  width: 60,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Image.network(
                                    "${controller.dataList[index].image}",
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                title: Text(
                                  "${controller.dataList[index].name}",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                subtitle: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Category: ${controller.dataList[index].categoryName}",
                                    ),
                                    Text(
                                      "Price: ${controller.dataList[index].price}",
                                    ),
                                    Text(
                                      "Rate: ${controller.dataList[index].averageRating}",
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                );
              } else if (snapshot.hasError) {
                return Text("${snapshot.error}");
              }
              return Center(child: CircularProgressIndicator());
            },
          ),
        ),
      ),
    );
  }
}

// Column(
//                 children: [
//                   Text("data"),
//                   Container(
//                     height: double.infinity ,
//                     child: ListView.builder(
//                       shrinkWrap: true,
//                       itemCount: controller.dataList.length,
//                       itemBuilder: (context, index) {
//                         return Container(
//                           margin: EdgeInsets.symmetric(vertical: 5),
//                           child: ListTile(
//                             leading: Container(
//                               height: 60,
//                               width: 60,
//                               decoration: BoxDecoration(
//                                 borderRadius: BorderRadius.circular(10),
//                               ),
//                               child: Image.network(
//                                 "${controller.dataList[index].image}",
//                                 fit: BoxFit.cover,
//                               ),
//                             ),
//                             title: Text(
//                               "${controller.dataList[index].name}",
//                               style: TextStyle(fontWeight: FontWeight.bold),
//                             ),
//                             subtitle: Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 Text(
//                                   "Category: ${controller.dataList[index].categoryName}",
//                                 ),
//                               Text(
//                                   "Price: ${controller.dataList[index].price}",
//                                 ),
//                               Text(
//                                   "Rate: ${controller.dataList[index].averageRating}",
//                                 ),
//                               ],
//                             ),
//                           ),
//                         );
//                       },
//                     ),
//                   ),
//                 ],
//               )
