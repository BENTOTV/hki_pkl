import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:hki_app/screen/formPengajuan/formPengajuan.dart';
import 'package:hki_app/screen/riwayatPengajuan/riwayatPengajuan.dart';
import 'package:hki_app/widget/boxIconMenu.dart';
import 'package:hki_app/widget/box_besar.dart';
import 'package:hki_app/widget/contanta.dart';
import 'package:hki_app/widget/textIconMenu.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  
  @override
  Widget build(BuildContext context) {
    double heightt = MediaQuery.of(context).size.height;
    double widthh = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(title: Text("Adjustment"),backgroundColor: kPrimaryColor,),
      body:   Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Boxbesar(
                      child: SizedBox(
                    width: double.infinity,
                    height: heightt * 100 / 800,
                    child: GridView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      padding: EdgeInsets.only(
                        top: heightt * 16 / 800,
                      ),
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        // childAspectRatio: 5 ,
                        crossAxisSpacing: 2,
                      ),
                      itemCount: modulName.length,
                      itemBuilder: (BuildContext context, index) {
                        return GestureDetector(
                          onTap: () {
                            if (modulName[index] == "Form Pengajuan") {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: ((context) =>FormPengajuan()
                                        //  Tampilan_telekom(type: 7)
                                          )));
                            }
                            if (modulName[index] == "History Pengajuan") {                              
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: ((context) =>RiwayatPengajuan()
                                        //  Tampilan_telekom(type: 6)
                                       )));
                            }
                          
                          },
                          child: Column(
                            children: [
                              if (modulName[index] == "Form Pengajuan") ...[
                                BoxIconModul(icon: iconModul[index]),
                                TextIconModul(label: modulName[index].toString())
                              ],
                              if (modulName[index] == "History Pengajuan") ...[
                                BoxIconModul(icon: iconModul[index]),
                                TextIconModul(label: modulName[index].toString())
                              ],
                            
                            ],
                          ),
                        );
                      },
                    ),
                  )),
        ],
      ),
    );
  }
}