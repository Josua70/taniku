import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider/provider.dart';
import 'package:taniku/ChangeScreen.dart';
import 'package:taniku/model/ListModel.dart';
import 'package:taniku/model/ListModelVertical.dart';
import 'package:taniku/model/ListModelGrid.dart';
import 'package:taniku/viewmodel/ListViewModel.dart';

class ListScreen extends StatefulWidget {
  const ListScreen({Key? key}) : super(key: key);

  @override
  State<ListScreen> createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ListViewModel>(
      create: (context) => ListViewModel(context),
      child: Builder(
        builder: (context){
          return Consumer<ListViewModel>(
              builder: (context, viewModel, child){
            return Scaffold(
                resizeToAvoidBottomInset: false,
                appBar: AppBar(
                  title: const Text("List Produk"),
                ),
                body: Container(
                  margin: const EdgeInsets.all(16),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        //--------------- ListView Horizontal ---------------------

                        const Text("Daftar Produk Horizontal", style: TextStyle(fontWeight: FontWeight.bold),),
                        const SizedBox(height: 16,),
                        SizedBox(
                            width: double.infinity,
                            height: 205,
                            child: ListView.builder(
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              itemCount: viewModel.dataListHorizontal.length,
                              itemBuilder: (contex, index) {

                                return InkWell(
                                  onTap: () {
                                    Navigator.push(context, MaterialPageRoute(builder:
                                        (context) =>changescreen(text: viewModel.dataListHorizontal[index].firstName.toString(),
                                            image: viewModel.dataListHorizontal[index].avatar.toString(),
                                          email: viewModel.dataListHorizontal[index].email.toString(),
                                        )));

                                    print("Src gambar : ${viewModel.dataListHorizontal[index].avatar.toString()}");
                                    print("Nama : ${viewModel.dataListHorizontal[index].firstName.toString()}");
                                    print("Email : ${viewModel.dataListHorizontal[index].email.toString()}");
                                  },
                                  child: Container(
                                      width: 150,
                                      alignment: Alignment.center,
                                      child: Card(
                                        child: Container(
                                          width: double.infinity,
                                          margin: const EdgeInsets.all(12),
                                          child: Column(
                                            children: [
                                              // Image.asset("assets/google_icon.png", width: 70, height: 70,),
                                              const SizedBox(height: 8,),
                                              Image.network(viewModel.dataListHorizontal[index].avatar.toString(), width: 70, height: 70,),
                                              const SizedBox(height: 8,),
                                              Text(viewModel.dataListHorizontal[index].firstName.toString(), style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
                                              const SizedBox(height: 8,),
                                              Text(viewModel.dataListHorizontal[index].email.toString()),
                                            ],
                                          ),
                                        ),
                                      ),
                                  ),
                                );
                              },
                            )
                        ),

                        //-------------------- ListView Vertical ---------------------

                        SizedBox(height: 16,),
                        const Text("Daftar Produk Vertical", style: TextStyle(fontWeight: FontWeight.bold),),
                        const SizedBox(height: 12,),
                        ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            return InkWell(
                              onTap: () {
                                Navigator.push(context, MaterialPageRoute(builder:
                                    (context) =>changescreen(text: viewModel.dataListVertical[index].color.toString(),
                                    image: viewModel.dataListVertical[index].name.toString(),
                                      email: viewModel.dataListVertical[index].name.toString(),
                                    )));
                                print("Warna : ${viewModel.dataListVertical[index].color.toString()}");
                                print("Nama : ${viewModel.dataListVertical[index].name.toString()}");
                                print("Year :${viewModel.dataListVertical[index].year.toString()}");
                              },
                              child: Card(
                                child: Container(
                                  margin: const EdgeInsets.all(8),
                                  child: Row(
                                    children: [
                                      Flexible(
                                        child: Container(
                                          margin: EdgeInsets.all(5),
                                          height: 70,
                                          width: 70,
                                          child: Center(
                                            child: SizedBox(
                                              width: 60,
                                              height: 60,
                                              child: DecoratedBox(
                                                decoration: BoxDecoration(
                                                  color: HexColor("${viewModel.dataListVertical[index].color.toString()}"),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(height: 10,width: 2,),
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          const SizedBox(height: 10,),
                                          Text(viewModel.dataListVertical[index].name.toString(), style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
                                          const SizedBox(height: 8,width: 10,),
                                          Text(viewModel.dataListVertical[index].year.toString()),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                          itemCount: viewModel.dataListVertical.length,
                        ),

                        //-------------------- ListView Gridview ---------------------
                        SizedBox(height: 16,),
                        const Text("Daftar Produk Grid", style: TextStyle(fontWeight: FontWeight.bold),),
                        const SizedBox(height: 16,),
                        GridView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: viewModel.dataListGrid.length,
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: MediaQuery.of(context).orientation ==
                                Orientation.landscape ? 3: 2,
                            crossAxisSpacing: 1,
                            mainAxisSpacing: 1,
                            childAspectRatio: (1 / 1),
                          ),
                          itemBuilder: (context,index,) {
                            return InkWell(
                              onTap: () {
                                Navigator.push(context, MaterialPageRoute(builder:
                                    (context) =>changescreen(text: viewModel.dataListGrid[index].title.toString(),
                                    image: viewModel.dataListGrid[index].poster.toString(),
                                      email: viewModel.dataListGrid[index].year.toString(),
                                    )));
                                print("Src gambar : ${viewModel.dataListGrid[index].poster.toString()}");
                                print("Title : ${viewModel.dataListGrid[index].title.toString()}");
                                print("Year : ${viewModel.dataListGrid[index].year.toString()}");
                              },
                              child: Container(
                                alignment: Alignment.center,
                                child: Card(
                                  child: Container(
                                    width: double.infinity,
                                    margin: const EdgeInsets.all(10),
                                    child: Column(
                                      children: [
                                        Image.network(viewModel.dataListGrid[index].poster.toString(), width: 100, height: 100,
                                          errorBuilder: (context, error, stackTrace) {
                                            return Container(
                                              width: 80,
                                              height: 80,
                                              alignment: Alignment.center,
                                              child: const Icon(Icons.image, size: 24,),
                                            );
                                          },
                                        ),
                                        const SizedBox(height: 8,),
                                        Text(viewModel.dataListGrid[index].title.toString(), style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                                        const SizedBox(height: 8,),
                                        Text(viewModel.dataListGrid[index].year.toString()),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                    ],
                    ),
                  ),
                ),
            );
          });
        },
      ),
    );

  }
}
