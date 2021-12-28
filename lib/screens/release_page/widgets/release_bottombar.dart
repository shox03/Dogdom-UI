import 'package:dogdom_ui/constants/size_confi.dart';
import 'package:dogdom_ui/providers/release_provider.dart';
import 'package:dogdom_ui/screens/release_page/modul/img_of_release_page.dart';
import 'package:dogdom_ui/screens/release_page/modul/name_of_buttomns.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/src/provider.dart';

class ReleaseBottomBar extends StatelessWidget {
  const ReleaseBottomBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ImagePicker _picker = ImagePicker();
    XFile? image;
    SizeConfig().init(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Column(
          children: [
            CircleAvatar(
              radius: 35.0,
              backgroundColor: Colors.transparent,
              backgroundImage: AssetImage(ImgOfReleasPage.img[0]),
            ),
            SizedBox(height: getProportionateScreenHeight(8.0)),
            Text(
              NameOfButtons.names[0],
              style:
                  const TextStyle(fontWeight: FontWeight.w400, fontSize: 13.0),
            )
          ],
        ),
        Column(
          children: [
            CircleAvatar(
              radius: 35.0,
              backgroundColor: Colors.transparent,
              backgroundImage: AssetImage(ImgOfReleasPage.img[1]),
            ),
            SizedBox(height: getProportionateScreenHeight(8.0)),
            Text(
              NameOfButtons.names[1],
              style:
                  const TextStyle(fontWeight: FontWeight.w400, fontSize: 13.0),
            )
          ],
        ),
        Column(
          children: [
            InkWell(
              onTap: () async {
                image = await _picker.pickImage(source: ImageSource.gallery);
                // _listOfImages.add(image!);
                context.read<ReleaseProvider>().addImg(image!);
                // setState(() {});
              },
              child: CircleAvatar(
                radius: 35.0,
                backgroundColor: Colors.transparent,
                backgroundImage: AssetImage(ImgOfReleasPage.img[2]),
              ),
            ),
            SizedBox(height: getProportionateScreenHeight(8.0)),
            Text(
              NameOfButtons.names[2],
              style:
                  const TextStyle(fontWeight: FontWeight.w400, fontSize: 13.0),
            )
          ],
        ),
      ],
    );
  }
}
