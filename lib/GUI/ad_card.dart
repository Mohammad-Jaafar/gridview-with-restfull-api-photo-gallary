import 'package:flutter/material.dart';
import 'package:photo_gallery/GUI/ad_image_view.dart';

class AddCard extends StatelessWidget {
  AddCard(this.data);
  final data;


  Widget _buildImageWidget(BuildContext context) {
    if ("https://alkafeel.net/photos/imager/${data['preview_photo']}" != null && "https://alkafeel.net/photos/imager/${data['preview_photo']}" != '') {
      return
        GestureDetector(
          onTap: ()=> Navigator.push(context, MaterialPageRoute(builder: (_) {
            return ImageView(data);
          })),

          child:Image.network("https://alkafeel.net/photos/imager/${data['preview_photo']}",scale: data["aspect_ratio"],),
        );

    } else {
      return Image.network('https://alkafeel.net/images/404.jpg',);
    }

  }

  Widget _buildTitleWidget() {
    if (data["caption"] != null && data["caption"] != '') {
      return Text(data["caption"], style: TextStyle(fontWeight: FontWeight.bold),);
    } else {
      return SizedBox();
    }
  }

  Widget _buildIdWidget() {
    if (data["id"] != null && data["id"] != '') {
      return Text("\$ ${data["id"]}");
    } else {
      return SizedBox();
    }
  }

  Widget _buildUserShareWidget() {
    if (data["details"]["user_share"] != null && data["details"]["user_share"] != '') {
      return Row(
        children: <Widget>[
          Icon(Icons.share),
          SizedBox(width: 4.0,),
          Expanded(child: Text(data["details"]["user_share"]))
        ],
      );
    } else {
      return SizedBox();
    }
  }

  Widget _buildDetailsWidget(BuildContext context) {

    return Center(

      child: RaisedButton(

        onPressed: () {
          showDialog(
              context: context,
              builder: (ctxt) => new AlertDialog(

                title: Text("تفاصيل الصورة  ",style: TextStyle(color: Colors.white),textAlign: TextAlign.center,),
                content: Container(

                  child: Column(
                    children: <Widget>[
                      ListTile(
                        title: Text(' اسم القسم ',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),textDirection: TextDirection.ltr,),
                        subtitle: Text('${data["details"]["sectionName"]}'),
                        leading: CircleAvatar(backgroundColor: Colors.white,
                          child: Text('${data["details"]["takerId"]}'),

                        ),
                        trailing:
                        Column(
                          children: <Widget>[
                            Icon(Icons.thumb_up,color: Colors.white,),
                            Text('${data["photo_liked"]}',style: TextStyle(color: Colors.white),),
                          ],
                        ),
                      ),

                      ListTile(
                        title: Text(' اسم المصور ',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),),
                        subtitle: Text('${data["details"]["takerName"]}'),
                        leading: CircleAvatar(backgroundColor: Colors.white,
                          child: Text('${data["details"]["takerId"]}'),
                        ),
                        trailing:
                        Column(
                          children: <Widget>[
                            Icon(Icons.linked_camera,color: Colors.white,),
                            Text('${data["details"]["sectionId"]}',style: TextStyle(color: Colors.white),),
                          ],
                        ),
                      ),
                    ],
                  ),

                ),
                backgroundColor: Colors.green[300],
              )
          );
        },
        child: Text('تفاصيل الصورة',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),),
        color: Colors.green[600],

      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          _buildImageWidget(context),
          _buildTitleWidget(),
          _buildIdWidget(),
          _buildUserShareWidget(),
          _buildDetailsWidget(context),
        ],
      ),
    );
  }
}


/*
@mohammed_7aafar =>(instagram) => instagram.user;
#Flutter_Developer

 */