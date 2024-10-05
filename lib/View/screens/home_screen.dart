import 'package:quizzy/Controller/dio.dart';
import 'package:quizzy/Model/categorymodel.dart';
import 'package:quizzy/View/widgets/customctegorycard.dart';
import 'package:quizzy/core/utils/appcolors/app_colors.dart';
import 'package:quizzy/core/utils/appstring/app_string.dart';
import 'package:quizzy/core/utils/textstyle/textstyle.dart';
import 'package:quizzy/core/utils/widgets/sizedbox/sizedbox.dart';

// ignore: must_be_immutable
class Home extends StatefulWidget {
  Home({super.key, required this.name});
  String name;

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
        backgroundColor: appcolors.whicolor,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Hi,${widget.name}",
                  style: textstyle.boldtext(appcolors.primarycolor),
                ),
               
                Text(
                  Appstring.letschoose,
                  style: textstyle.small(appcolors.blach64),
                ),
                sized.s16,
                Expanded(
                  child: GridView.builder(
                    physics: const BouncingScrollPhysics(),
        
                    padding:
                        const EdgeInsets.all(5), // Adds padding around the grid
                    itemCount: categories.length,
                    itemBuilder: (context, index) => CategoryCard(index: index),
                    gridDelegate:const  SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                        childAspectRatio: 1.25/ 2,
                        crossAxisSpacing: 20,
                        mainAxisSpacing: 2),
                  ),
                ),
              ],
            ),
          ),
        ),
      
    );
  }
}
