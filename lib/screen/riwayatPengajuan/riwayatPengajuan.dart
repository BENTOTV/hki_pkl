

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:hki_app/model/dummyModel/dummyadj.dart';
import 'package:hki_app/screen/detailRiwayatPengajuan/detailRiwayatPengajuan.dart';
import 'package:hki_app/widget/card_detail.dart';
import 'package:hki_app/widget/card_list.dart';
import 'package:hki_app/widget/contanta.dart';
import 'package:hki_app/viewModel/adj_view_model.dart' as adj_logic;
import 'package:provider/provider.dart';

class RiwayatPengajuan extends StatefulWidget {
  const RiwayatPengajuan({super.key,});
  // final String? nama;
  // final String? jabatan;
  // final File? display;
  // final String? adjusment;

  @override
  State<RiwayatPengajuan> createState() => _RiwayatPengajuanState();
}

class _RiwayatPengajuanState extends State<RiwayatPengajuan> {
 
  
  @override
  Widget build(BuildContext context) {
  //   List<DummyAdj> adj = [
  //   DummyAdj(adjustment: widget.adjusment, display: widget.display, jabatan: widget.jabatan, nama:widget.nama, id: 1)
  // ];
   DateTime _dueDate = DateTime.now();
  final adjProvider= Provider.of<adj_logic.AdjLogic>(context,listen: false);
    return Scaffold(
       appBar: AppBar(backgroundColor: kPrimaryColor,),
       body: ListView.builder(
         itemCount: adjProvider.adj.length,
         itemBuilder: (context, index) {
          print(adjProvider.adj[index].nama);
            return CardDetail(
                 child: ListTile(
                   contentPadding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
                   leading:  Image.file(adjProvider.adj[index].display,
                   width: 120,
                   height: 200,
                  ),
                   title:Text(adjProvider.adj[index].nama.toString()),                       
                   subtitle: Text(adjProvider.adj[index].adjustment.toString()
                  ,style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold, color: Colors.black),),
                 //trailing: Text(chat.price.toString()),
                onTap:() => Navigator.push(context, MaterialPageRoute(builder: (context)=>DetailRiwayatPengajuan(
                  nama: adjProvider.adj[index].nama, 
                  jabatan: adjProvider.adj[index].jabatan,
                  adjustment: adjProvider.adj[index].adjustment, 
                  tgl: _dueDate, 
                  display: adjProvider.adj[index].display)))                                      
                 ),
               );
         },
       ),
    );
  }
}