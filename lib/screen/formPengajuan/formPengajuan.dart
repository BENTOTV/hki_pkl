import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hki_app/model/modelAdj.dart';
import 'package:hki_app/screen/mainPage/mainPage.dart';
import 'package:hki_app/screen/riwayatPengajuan/riwayatPengajuan.dart';
import 'package:hki_app/widget/contanta.dart';
import 'package:hki_app/widget/dropDown.dart';
import 'package:open_file/open_file.dart';
import 'package:hki_app/viewModel/adj_view_model.dart' as adj_logic;
import 'package:provider/provider.dart';

class FormPengajuan extends StatefulWidget {
  const FormPengajuan({super.key});

  @override
  State<FormPengajuan> createState() => _FormPengajuanState();
}

class _FormPengajuanState extends State<FormPengajuan> {
   FilePickerResult? result;
  late File display;
  late String adjustment;
  late String nama;
  late String jabatan;
  
  @override
  Widget build(BuildContext context) {
     final adjProvider= Provider.of<adj_logic.AdjLogic>(context,listen: false);
    var formpengajuankey =  GlobalKey<FormState>();
    final _NamaController = TextEditingController();
  final _JabatanController = TextEditingController();
  final _AdjController = TextEditingController();
  DateTime _dueDate = DateTime.now();
  @override
  void dispose() {
    _JabatanController.dispose();
    _NamaController.dispose();
    _AdjController.dispose();
    super.dispose();
  }
  @override
  void initState() {
    
    super.initState();
  }
   return Scaffold(
      appBar: AppBar(backgroundColor: kPrimaryColor,),
      body: SingleChildScrollView(
        child: Form(
          key: formpengajuankey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            
            children: <Widget>[
              Card(
                margin: EdgeInsets.only(left: 50,right: 50),
                elevation: 8,              
                child: Padding(
                  padding: const EdgeInsets.only(right: 20,left: 20,top: 30,bottom: 30),
                  child: Column(
                    children: <Widget>[
                     // Image.asset("assests/image/logoBhawana.png",width: 100,height: 100,),
                      Text("Form Pengajuan",style: GoogleFonts.poppins(fontSize: 14),),
                      TextFormField(
                        controller: _NamaController,
                        keyboardType: TextInputType.text,
                        style: GoogleFonts.poppins(fontSize: 14),
                        decoration: InputDecoration(
                         // hintText: "Masukan Username",
                          hintStyle: GoogleFonts.poppins(fontSize: 14),
                          labelText: "Nama Pangaju"
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Nama tidak boleh kosong";
                          }
                          else{
                            return null;
                          }
                        },
                      ),
                      TextFormField(
                        controller: _JabatanController,
                        keyboardType: TextInputType.text,
                        style: GoogleFonts.poppins(fontSize: 14),
                        decoration: InputDecoration(
                          //hintText: "Masukan Password",
                          hintStyle: GoogleFonts.poppins(fontSize: 14),
                          labelText: "Jabatan Pengaju"
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Jabatan tidak boleh kosong";
                          }
                          else{
                            return null;
                          }
                        },
                      ),
                        TextFormField(
                        controller: _AdjController,
                        keyboardType: TextInputType.multiline,
                        style: GoogleFonts.poppins(fontSize: 14),
                        maxLines: 4,
                        decoration: InputDecoration(
                          //hintText: "Masukan Password",
                          hintStyle: GoogleFonts.poppins(fontSize: 14),
                          labelText: "Adjusment"
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Adjusment tidak boleh kosong";
                          }
                          else{
                            return null;
                          }
                        },
                      ),
                      SizedBox(height: 20,),
                       const Text("Pick Files"),
                              const SizedBox(height: 10,),
                              Center(
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: kPrimaryColor
                                  ),
                                  child: const Text("Pick and Open Files"),
                                  onPressed: () {
                                    _pickFile();
                                  },
                                ),
                              ),
                      SizedBox(height: 20,),
                    //  SizedBox(child: DropDownItem(),),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          TextButton(
                            style: TextButton.styleFrom(
                              backgroundColor: Colors.blue,
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))
                            ),
                            onPressed: (){                      
                              final isValidForm = formpengajuankey.currentState!.validate();
                              String usernmer = _NamaController.text;  
                              // adjustment = _AdjController.value as String;
                              // jabatan = _JabatanController.value as String;
                              // nama = _NamaController.value as String;
                              print(usernmer);
                              if(isValidForm){
                                adjProvider.add(
                                  Adj(
                                    adjustment: _AdjController.text.toString(),
                                     display: display,
                                      jabatan: _JabatanController.text.toString(), 
                                      nama: _NamaController.text.toString(), 
                                      id: 1,
                                      tgl: _dueDate)
                                );
                                Navigator.push(context, MaterialPageRoute(builder: (context)=>MainPage()));
                              }                         
                            }, 
                            child: const Text("Submit",style: TextStyle(
                              fontSize: 14,color: Colors.white
                            ),)),
                        ],
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
   void _pickFile() async{
  try {
    final result = await FilePicker.platform.pickFiles(
  type: FileType.any   
  );
  final file = result!.files.first;
  setState(() {
    display = File(file.path.toString());
  });
  


  } catch (e) {
    
  }
  
  
  // final file = result.files.first;
  // _openFile(file);
}
void _openFile(PlatformFile file){
OpenFile.open(file.path);
}
}

