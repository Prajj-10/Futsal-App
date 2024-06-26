import 'package:demo_futsalapp/constanst.dart';
import 'package:demo_futsalapp/models/lapangan_model.dart';
import 'package:demo_futsalapp/pages/field_page.dart';
import 'package:demo_futsalapp/widgets/container_galeri.dart';
import 'package:demo_futsalapp/widgets/container_icon.dart';
import 'package:demo_futsalapp/widgets/description_text.dart';
import 'package:demo_futsalapp/widgets/my_button.dart';
import 'package:demo_futsalapp/widgets/small_container.dart';
import 'package:demo_futsalapp/widgets/small_icon.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'chatting_page.dart';

class DetailsPage extends StatelessWidget {
  const DetailsPage({Key? key, required this.lapangan}) : super(key: key);

  final LapanganModel lapangan;

  @override
  Widget build(BuildContext context) {
    Widget topBarSection() {
      return Container(
        width: double.infinity,
        height: 24,
        // color: Colors.amber,
        margin: EdgeInsets.all(defaultMargin),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: ContainerIcon(
                imageUrl: "assets/icon_arrow.png",
                color: Colors.white,
              ),
            ),
            ContainerIcon(
              imageUrl: "assets/icon_bookmark.png",
              color: Colors.white,
            ),
          ],
        ),
      );
    }

    Widget imageSection() {
      return Container(
        width: double.infinity,
        height: 374,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(lapangan.imageUrl),
            fit: BoxFit.cover,
          ),
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(20),
            bottomRight: Radius.circular(20),
          ),
          boxShadow: [
            BoxShadow(
              offset: Offset(0, 4),
              blurRadius: 10,
              color: Colors.black.withOpacity(0.1),
            )
          ],
        ),
      );
    }

    Widget detailSection() {
      return Container(
        margin: EdgeInsets.all(defaultMargin),
        child: Column(
          children: [
            // Title Section
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      lapangan.name,
                      style: blackTextStyle.copyWith(
                        fontSize: 18,
                        fontWeight: semiBold,
                      ),
                    ),
                    SizedBox(height: 4),
                    Row(
                      children: [
                        SmallIcon(imageUrl: "assets/icon_location.png"),
                        SizedBox(width: 3),
                        Text(
                          "Khusibu, Nayabazar",
                          style: lightTextStyle.copyWith(
                            fontSize: 10,
                            fontWeight: light,
                            color: Color(0xFF424242),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
                Row(
                  children: [
                    SmallIcon(imageUrl: "assets/icon_star.png"),
                    SizedBox(width: 3),
                    Text(
                      "${lapangan.rating}",
                      style: blackTextStyle.copyWith(
                        fontSize: 10,
                        fontWeight: medium,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            // details Section
            Container(
              width: double.infinity,
              height: 53,
              margin: EdgeInsets.only(top: defaultMargin),
              padding: EdgeInsets.symmetric(vertical: 6, horizontal: 16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0, 9),
                    blurRadius: 30,
                    color: Colors.black.withOpacity(0.1),
                  )
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  DescriptionText(
                    title: "Number of Fields",
                    value: "4 Fields",
                  ),
                  DescriptionText(
                    title: "Price/hour",
                    value: NumberFormat.currency(
                      locale: 'id',
                      symbol: 'Rs. ',
                      decimalDigits: 0,
                    ).format(
                      lapangan.price,
                    ),
                  ),
                  DescriptionText(
                    title: "Field Type",
                    value: lapangan.type,
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    }

    Widget galerySection() {
      return Column(
        children: [
          Row(
            children: [
              SizedBox(width: defaultMargin),
              SmallContainer(
                imageUrl: "assets/icon_image.png",
                title: "Gallery",
                isActive: true,
              ),
              SmallContainer(
                imageUrl: "assets/icon_chat.png",
                title: "Reviews",
              ),
            ],
          ),
          SizedBox(height: 16),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                SizedBox(width: defaultMargin),
                ContainerGaleri(imageUrl: "assets/image_futsal1.png"),
                ContainerGaleri(imageUrl: "assets/image_gallery1.png"),
                ContainerGaleri(imageUrl: "assets/image_gallery2.png"),
              ],
            ),
          ),
        ],
      );
    }

    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: SafeArea(
        child: Stack(
          children: [
            ListView(
              children: [
                imageSection(),
                detailSection(),
                galerySection(),
                Row(
                  children: [
                    MyButton(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => FieldPage(
                              lapangan,
                            ),
                          ),
                        );
                      },
                      height: 60,
                      width: 150,
                      margin: EdgeInsets.fromLTRB(
                        defaultMargin,
                        32,
                        defaultMargin,
                        defaultMargin,
                      ),
                      text: "Booking",
                    ),
                    MyButton(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ChatSection(
                                  lapangan: lapangan,
                                ),
                              ));
                        },
                        margin: EdgeInsets.fromLTRB(
                          defaultMargin,
                          32,
                          defaultMargin,
                          defaultMargin,
                        ),
                        width: 200,
                        height: 60,
                        text: "Chat with ${lapangan.name}")
                  ],
                ),
              ],
            ),
            Align(
              alignment: Alignment.topCenter,
              child: topBarSection(),
            )
          ],
        ),
      ),
    );
  }
}
