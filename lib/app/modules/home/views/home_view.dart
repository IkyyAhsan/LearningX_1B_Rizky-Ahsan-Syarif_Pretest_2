import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile Screen'),
        centerTitle: true,
      ),
      body: Obx(
        () => controller.isLoading.value
            ? Center(child: CircularProgressIndicator())
            : ListView.builder(
                itemCount: controller.dataList.length,
                itemBuilder: (context, index) {
                  final data = controller.dataList[index];
                  final location = data['location'];

                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Card(
                          elevation: 5,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Column(
                            children: [
                              ListTile(
                                contentPadding: const EdgeInsets.all(16),
                                leading: CircleAvatar(
                                  backgroundImage: NetworkImage(data['picture']['thumbnail']),
                                ),
                                title: Text(
                                  '${data['name']['first']} ${data['name']['last']}',
                                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                                ),
                                subtitle: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const SizedBox(height: 8),
                                    Row(
                                      children: [
                                        Icon(Icons.transgender, size: 16, color: Colors.grey),
                                        const SizedBox(width: 5),
                                        Text(
                                          'Gender: ${data['gender']}',
                                          style: TextStyle(fontSize: 14, color: Colors.grey),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 4),
                                    Row(
                                      children: [
                                        Icon(Icons.location_city, size: 16, color: Colors.grey),
                                        const SizedBox(width: 5),
                                        Text(
                                          'City: ${location['city']}',
                                          style: TextStyle(fontSize: 14, color: Colors.grey),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 4),
                                    Row(
                                      children: [
                                        Icon(Icons.flag, size: 16, color: Colors.grey),
                                        const SizedBox(width: 5),
                                        Text(
                                          'Country: ${location['country']}',
                                          style: TextStyle(fontSize: 14, color: Colors.grey),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                onTap: () {
                                  
                                },
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 20,),
                        Center(
                          child: Container(
                            alignment: Alignment.center,
                            height: 50,
                            width: 100,
                            color: Colors.red,
                            child: Text('LOGOUT', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700),),
                          ),
                        ),
                        SizedBox(height: 20,),
                        DefaultTabController(
                          length: 2, 
                          child: TabBar(tabs: [
                            Tab(text: 'Fotos'),
                            Tab(text: 'Videos'),
                          ],),),
                          TabBarView(
                            children: [
                              Center(
                                child: Padding(padding: EdgeInsets.only(right: 20, left: 20),
                                child: CircleAvatar(
                                  backgroundColor: Colors.red,
                                  child: Text('Unknown'),
                                ),
                                ),
                              ),
                              Center(
                                child: Padding(padding: EdgeInsets.only(right: 20, left: 20),
                              child: CircleAvatar(
                                backgroundColor: Colors.red,
                                child: Text('Unknown'),
                              ),
                              ),
                              )
                            ]
                            )
                      ],
                    ),
                  );
                },
              ),
      ),
    );
  }
}
