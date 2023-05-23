import 'dart:convert';
import 'dart:io';

import 'package:app/screens/home_screen.dart';
import 'package:app/services/api.dart';
import 'package:app/widgets/custom_text_field.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:image_picker/image_picker.dart';
import 'package:app/constants/dropdown.dart';

import 'package:dropdown_button2/dropdown_button2.dart';

class MyNewApp extends StatefulWidget {
  static const routeName = '/post screen';

  const MyNewApp({super.key});

  @override
  State<MyNewApp> createState() => _MyNewAppState();
}

class _MyNewAppState extends State<MyNewApp> {
  List images = [];
  List<String> myimages = [];
  File? imagefilepro;
  final picker = ImagePicker();
  TextEditingController title = new TextEditingController();
  TextEditingController name = new TextEditingController();
  TextEditingController description = new TextEditingController();
  TextEditingController price = new TextEditingController();
  List<String> items = phone;

  final List categories = [
    'phones'.tr(),
    'electronics'.tr(),
    'vehicles'.tr(),
    'property'.tr(),
    'homesupplies'.tr(),
    'fashion'.tr(),
    'animals'.tr(),
  ];
  // items = phone;

  String? selectedValue;
  String? selectedValue1;
  String? tobesent;
  final _formKey = GlobalKey<FormState>();

  _getFromGallery() async {
    var pickedFile = await picker.pickImage(source: ImageSource.gallery);
    print(pickedFile);
    if (pickedFile != null) {
      File imagefile = File(pickedFile.path);
      images.add(imagefile);
      myimages.add(pickedFile.path);
      setState(() {});
    }

    // if (pickedFile != null) {
    //   var imagefile = pickedFile.readAsBytes();
    //   images.add(imagefile);
    //   setState(() {});
    // }
  }

  checker() {
    if (selectedValue == 'phones'.tr()) {
      items = phone;
      setState(() {});
      print('phones');
    } else if (selectedValue == 'electronics'.tr()) {
      items = electronics;
      setState(() {});
      print('electronics');
    } else if (selectedValue == 'vehicles'.tr()) {
      items = vehicles;
      setState(() {});
      print('vehicles');
    } else if (selectedValue == 'property'.tr()) {
      items = house;
      setState(() {});
      print('property');
    } else if (selectedValue == 'homesupplies'.tr()) {
      items = homesupply;
      setState(() {});
      print('homesupplies');
    } else if (selectedValue == 'fashion'.tr()) {
      items = cloth;
      setState(() {});
      print('fashion');
    } else if (selectedValue == 'animals'.tr()) {
      items = animals;
      setState(() {});
      print('animals');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios, color: Colors.grey),
            onPressed: () {
              Navigator.of(context, rootNavigator: true).pop(context);
            },
          ),
          shadowColor: Colors.white,
          title: Text('postanadd'.tr(),
              style: TextStyle(fontSize: 20, color: Colors.green)),
          backgroundColor: Colors.white,
        ),
        body: SingleChildScrollView(
          child: Material(
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  Padding(
                      padding: EdgeInsets.symmetric(vertical: 6),
                      child: Text('enterdetailsoftheapp'.tr(),
                          style: TextStyle(fontSize: 18))),
                  StaggeredGridView.countBuilder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    crossAxisCount: 4,
                    itemCount:
                        images.length < 5 ? images.length + 1 : images.length,
                    // staggeredTileBuilder: staggeredTileBuilder,
                    itemBuilder: (BuildContext context, index) {
                      return index == images.length
                          ? Container(
                              child: GestureDetector(
                                onTap: () {
                                  _getFromGallery();
                                },
                                child: DottedBorder(
                                  color: Colors.grey,
                                  strokeWidth: 2,
                                  radius: Radius.circular(8),
                                  dashPattern: [8, 4],
                                  child: ClipRRect(
                                    child: Container(
                                      width: double.infinity,
                                      height: double.infinity,
                                      child: Icon(Icons.add),
                                    ),
                                  ),
                                ),
                              ),
                            )
                          : Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: Colors.white,
                                  image: DecorationImage(
                                      image: FileImage(images[index]),
                                      fit: BoxFit.cover)),
                            );
                    },
                    staggeredTileBuilder: (int index) =>
                        new StaggeredTile.count(
                            index == 0 ? 2 : 1, index == 0 ? 2 : 1),
                    crossAxisSpacing: 3,
                    mainAxisSpacing: 3,
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 20),
                    padding: EdgeInsets.symmetric(vertical: 6),
                    child: CustomTextField(
                      controller1: title,
                      hint: 'entertitleofyouradd'.tr(),
                      icon: Icon(
                        Icons.keyboard_arrow_down_rounded,
                        size: 24,
                      ),
                      validator: (val) {
                        var nameRegExp = new RegExp(
                            r"^\s*([A-Za-z]{1,}([\.,] |[-']| ))+[A-Za-z]+\.?\s*$");
                        if (val!.length > 5) {
                        } else {
                          return "entervalidtitle".tr();
                        }
                      },
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 20),
                    padding: EdgeInsets.symmetric(vertical: 6),
                    child: CustomTextField(
                      controller1: description,
                      hint: 'enterdescriptionofyouradd'.tr(),
                      icon: Icon(
                        Icons.keyboard_arrow_down_rounded,
                        size: 24,
                      ),
                      validator: (val) {
                        var nameRegExp = new RegExp(
                            r"^\s*([A-Za-z]{1,}([\.,] |[-']| ))+[A-Za-z]+\.?\s*$");
                        if (val!.length > 5) {
                        } else {
                          return "Enter valid description";
                        }
                      },
                    ),
                  ),
                  Row(
                    children: [
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 20),
                        padding: EdgeInsets.symmetric(vertical: 4),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton2(
                            hint: Text(
                              'Category'.tr(),
                              style: TextStyle(
                                fontSize: 14,
                                color: Theme.of(context).hintColor,
                              ),
                            ),
                            items: categories
                                .map((item) => DropdownMenuItem<String>(
                                      value: item,
                                      child: Text(
                                        item,
                                        style: const TextStyle(
                                          fontSize: 14,
                                        ),
                                      ),
                                    ))
                                .toList(),
                            value: selectedValue,
                            onChanged: (value) {
                              print(categories);

                              setState(() {
                                selectedValue = value as String;
                              });
                              checker();
                            },
                            buttonStyleData: const ButtonStyleData(
                              height: 40,
                              width: 140,
                            ),
                            menuItemStyleData: const MenuItemStyleData(
                              height: 40,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 20),
                        padding: EdgeInsets.symmetric(vertical: 4),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton2(
                            hint: Text(
                              'Sub category'.tr(),
                              style: TextStyle(
                                fontSize: 14,
                                color: Theme.of(context).hintColor,
                              ),
                            ),
                            items: items
                                .map((item) => DropdownMenuItem<String>(
                                      value: item,
                                      child: Text(
                                        item,
                                        style: const TextStyle(
                                          fontSize: 14,
                                        ),
                                      ),
                                    ))
                                .toList(),
                            value: selectedValue1,
                            onChanged: (value) {
                              setState(() {
                                selectedValue1 = value as String;
                              });
                            },
                            buttonStyleData: const ButtonStyleData(
                              height: 40,
                              width: 140,
                            ),
                            menuItemStyleData: const MenuItemStyleData(
                              height: 40,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 20),
                    padding: EdgeInsets.symmetric(vertical: 6),
                    child: CustomTextField(
                      controller1: price,
                      hint: 'enterpriceofyouradd'.tr(),
                      icon: Icon(
                        Icons.keyboard_arrow_down_rounded,
                        size: 24,
                      ),
                      validator: (val) {
                        var passwordRegExp = RegExp(r"[0-9]$");
                        if (passwordRegExp.hasMatch(val!) && val!.length < 20) {
                        } else {
                          return 'entervalidprice'.tr();
                        }
                      },
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          var api = new Api();
                          var index = items.indexOf(selectedValue1!);
                          if (items == phone) {
                            tobesent = phonepro[index];
                            setState(() {});
                          } else if (items == electronics) {
                            tobesent = electronicspro[index];
                            setState(() {});
                          } else if (items == vehicles) {
                            tobesent = vehiclespro[index];
                            setState(() {});
                          } else if (items == house) {
                            tobesent = housepro[index];
                            setState(() {});
                          } else if (items == homesupply) {
                            tobesent = homesupplypro[index];
                            setState(() {});
                          } else if (items == cloth) {
                            tobesent = clothpro[index];
                            setState(() {});
                          } else if (items == animals) {
                            tobesent = animalspro[index];
                            setState(() {});
                          }
                          print('hi');
                          print(index);
                          print(tobesent);
                          // Map<dynamic, dynamic>? robel;
                          //                for (int i = 0; i < value.length; i++)
                          //         {
                          //           robel!.addAll({
                          //             "url": value[i].url,
                          //             "isprimary": value[i].url
                          //           })
                          //         },
                          EasyLoading.show(status: 'loading'.tr());

                          api
                              .uploadphotos(myimages)
                              .then((value) => {
                                    api.uploadadd(
                                        title.text,
                                        description.text,
                                        tobesent,
                                        price.text,
                                        jsonDecode(value))
                                  })
                              .then((value) => {
                                    EasyLoading.dismiss(),
                                    Navigator.of(context)
                                        .pushNamed(HomeScreen.routeName)
                                  });
                        }
                      },
                      child: Text('postanadd'.tr()),
                    ),
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
//   bool get isValidName {
//     final nameRegExp =
//         new RegExp(r"^\s*([A-Za-z]{1,}([\.,] |[-']| ))+[A-Za-z]+\.?\s*$");
//     return nameRegExp.hasMatch(this);
//   }

//   bool get isValidPassword {
//     final passwordRegExp = RegExp(
//         r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\><*~]).{8,}/pre>');
//     return passwordRegExp.hasMatch(this);
//   }

//   bool get isNotNull {
//     return this != null;
//   }

//   bool? get isValidPhone {
//     final phoneRegExp = RegExp(r"^\+?0[0-9]{10}$");
//     return phoneRegExp.hasMatch(this);
//   }
// }
