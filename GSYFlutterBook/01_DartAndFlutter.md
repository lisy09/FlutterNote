# 1 基础
## 1.1 环境搭建
- [中文网的搭建Futter开发环境](https://flutterchina.club/get-started/install/)
## 1.3 Flutter Widget
- StatelessWidget
- StatefulWidget
## 1.4 Flutter LayoutWidget
- Container
- Padding
- Center
- Stack
- Column
- Row
- Expanded
- ListView
## 1.5 Flutter Page
- MaterialApp: 一般作为APP顶层的主页入口，可配置主题，多语言，路由等
- Scaffold: 一般用户页面的承载Widget，包含appbar、snackbar、drawer等material design的设定。
- Appbar:	一般用于Scaffold的appbar ，内有标题，二级页面返回按键等，当然不止这些，tabbar等也会需要它 。
- Text:	显示文本，几乎都会用到，主要是通过style设置TextStyle来设置字体样式等。
- RichText:	富文本，通过设置TextSpan，可以拼接出富文本场景。
- TextField	:文本输入框 ：new TextField(controller: //文本控制器, obscureText: "hint文本");
- Image:	图片加载: new FadeInImage.assetNetwork( placeholder: "预览图", fit: BoxFit.fitWidth, image: "url");
- FlatButton	按键点击: new FlatButton(onPressed: () {},child: new Container());
