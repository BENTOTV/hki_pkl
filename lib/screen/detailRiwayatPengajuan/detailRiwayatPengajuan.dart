import 'dart:io';
import 'package:intl/date_symbol_data_local.dart';
import 'package:flutter/material.dart';
import 'package:hki_app/widget/card_detail.dart';
import 'package:hki_app/widget/card_expansion_detail.dart';
import 'package:hki_app/widget/card_field_item_date.dart';
import 'package:hki_app/widget/card_field_item_text.dart';
import 'package:hki_app/widget/contanta.dart';
import 'package:hki_app/viewModel/adj_view_model.dart' as adj_logic;
import 'package:provider/provider.dart';
class DetailRiwayatPengajuan extends StatefulWidget {
  final String nama;
  final String jabatan;
  final String adjustment;
  final File display;
  final DateTime tgl;
  const DetailRiwayatPengajuan({super.key, required this.nama,required this.jabatan,required this.adjustment,required this.tgl, required this.display});

  @override
  State<DetailRiwayatPengajuan> createState() => _DetailRiwayatPengajuanState();
}

class _DetailRiwayatPengajuanState extends State<DetailRiwayatPengajuan> {
  @override
  void initState() {
    initializeDateFormatting();
    super.initState();
  }
  Widget build(BuildContext context) {
   final adjProvider= Provider.of<adj_logic.AdjLogic>(context,listen: false);   
    return Scaffold(
     appBar: AppBar(
      backgroundColor: kPrimaryColor,),
      body: SingleChildScrollView(
        child: CardDetail(
            child: ListTile(             
              subtitle: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                   CardExpansionDetail(
                    label: "Gambar", 
                    children: <Widget>[
                      CardFieldItemDate(
                        label: "Disetor pada",
                       date: widget.tgl, 
                       flexLeftRow: 12, 
                       flexRightRow: 20),
                 
                  Image.file(widget.display,
              height: 500,
              width: double.infinity,
              fit: BoxFit.cover
             ),               
                    ]),
                  CardFieldItemText(
                    label: "Nama", 
                    contentData: widget.nama, 
                    flexLeftRow: 12, 
                    flexRightRow: 20),
                    CardFieldItemText(
                    label: "Jabatan", 
                    contentData: widget.jabatan, 
                    flexLeftRow: 12, 
                    flexRightRow: 20),   
                    CardFieldItemText(
                    label: "Adjustment", 
                    contentData: widget.adjustment, 
                    flexLeftRow: 12, 
                    flexRightRow: 20),                
                    // TextButton(
                    //    style: TextButton.styleFrom(
                    //           backgroundColor: kPrimaryColor,
                    //           shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))
                    //         ),
                    //   child: Text("Setor",style: TextStyle(
                    //             fontSize: 14,color: Colors.white
                    //           )),
                    //   onPressed: () {
                        // contactProvider.add(Anorganik(
                        //         besi: widget.besi,
                        //         botol: widget.botol,
                        //         kaca: widget.kaca,
                        //         kaleng: widget.kaleng,
                        //         display: widget.display,
                        //         tgl: widget.tgl,
                        //         saldo: widget.saldo));
                        // Navigator.push(context, MaterialPageRoute(builder: (context)=> AllHistoryAnorganik()));
                    //   },
                    // ),
                   
                ],
              ),
            ),
          ),
      )
    );
  } 
}