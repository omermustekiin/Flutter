import 'package:amazon_clone/screens/home_screen.dart';
import 'package:flutter/material.dart';
import '../models/product_model.dart';
import '../screens/account_screen.dart';
import '../screens/cart_screen.dart';
import '../screens/more_screen.dart';
import '../widgets/product_widget.dart';

const double kAppBarHeight = 80;

const String amazonLogoUrl =
    "https://upload.wikimedia.org/wikipedia/commons/thumb/4/4a/Amazon_icon.svg/2500px-Amazon_icon.svg.png";

const String amazonLogo =
    "https://marka-logo.com/wp-content/uploads/2020/04/Amazon-Logo.png";

const String amazonLogo2 =
    "https://upload.wikimedia.org/wikipedia/commons/thumb/a/a9/Amazon_logo.svg/2560px-Amazon_logo.svg.png";

const List<String> categoriesList = [
  "Prime",
  "Cep Telefonları",
  "Moda",
  "Elektronik",
  "Ev",
  "Taze Ürünler",
  "El Aletleri",
  "Kitap & Oyuncak",
  "Hijyen"
];

const List<Widget> screens = [
  HomeScreen(),
  AccountScreen(),
  CartScreen(),
  MoreScreen(),
];

const List<String> categoryLogos = [
  "https://m.media-amazon.com/images/I/11uufjN3lYL._SX90_SY90_.png",
  "https://m.media-amazon.com/images/I/116KbsvwCRL._SX90_SY90_.png",
  "https://m.media-amazon.com/images/I/115yueUc1aL._SX90_SY90_.png",
  "https://m.media-amazon.com/images/I/11qyfRJvEbL._SX90_SY90_.png",
  "https://m.media-amazon.com/images/I/11BIyKooluL._SX90_SY90_.png",
  "https://m.media-amazon.com/images/I/11CR97WoieL._SX90_SY90_.png",
  "https://m.media-amazon.com/images/I/01cPTp7SLWL._SX90_SY90_.png",
  "https://m.media-amazon.com/images/I/11yLyO9f9ZL._SX90_SY90_.png",
  "https://m.media-amazon.com/images/I/11M0jYc-tRL._SX90_SY90_.png",
];

const List<String> largeAds = [
  "https://publicad.com.tr/wp-content/uploads/2020/07/togg_02.gif",
  "https://www.myg.in/images/companies/1/untitled%20folder/iPhone_14_Pro_Web_Banner_Pre_937X394.jpg?1662720278640",
  "https://d1io3yog0oux5.cloudfront.net/_e92933d7279dbbf3ce9784ee8afeb106/columbia/db/661/4917/social_image_resized.jpg",
  "https://i.pinimg.com/originals/fa/45/96/fa4596ad9a9d39901eeb455ed4f74e44.jpg",
  "https://assets.hardwarezone.com/img/2020/03/immerse-logitech.jpg",
  "https://consumer.huawei.com/content/dam/huawei-cbg-site/central-asia/tr/mkt/press/news/2019/news-190121/banner1.jpg",
  "https://m.media-amazon.com/images/I/51QISbJp5-L._SX3000_.jpg",
  "https://pbs.twimg.com/media/Ert7r7fWMAI5M9C.jpg",
  "https://in.jbl.com/on/demandware.static/-/Sites-JB-INDIA-Library/default/dw0659a36e/glp/ap/artists/top-banner-JBL_Pulse%203_Lifestyle%20Image_5.jpg",
];

List<String> smallAds = [
  "https://m.media-amazon.com/images/I/11M5KkkmavL._SS70_.png",
  "https://m.media-amazon.com/images/I/11iTpTDy6TL._SS70_.png",
  "https://m.media-amazon.com/images/I/11dGLeeNRcL._SS70_.png",
  "https://m.media-amazon.com/images/I/11kOjZtNhnL._SS70_.png",
];

const List<String> adItemNames = [
  "Amazon Pay",
  "Recharge",
  "Rewards",
  "Pay Bills"
];

List<String> keysOfRating = ["Çok kötü", "Kötü", "Orta", "İyi", "Çok iyi"];

List<Widget> testChildrens = [
  ProductWidget(
    productModel: ProductModel(
        url: "https://resim.epey.com/406736/m_nike-renew-run-2.png",
        productName: "Nike Renew",
        cost: 229,
        discount: 0,
        uuid: "dasflaf",
        sellerName: "Nike Store",
        sellerUid: "983498ihjb",
        rating: 4,
        numberOfRating: 1),
  ),
];
