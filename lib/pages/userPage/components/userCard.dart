import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';


class UserCard extends StatelessWidget {
const UserCard({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context){
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      elevation: 4,
          shadowColor: Theme.of(context).colorScheme.onSecondary,
          color: Theme.of(context).colorScheme.secondary,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 40),
        child: Row(
          children: [
            SvgPicture.asset('lib/images/maleAv.svg',height: 120, width: 120,),
            Expanded(
              child: Container(
                margin: const EdgeInsets.only( left: 20),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children:  const [
                  Text("UserName"),
                  Flexible(child: Text("Sangara Naaraanan R")),
                  SizedBox(height: 10,),
                  Text("UserEmail"),
                  Flexible(child: Text("sangara@gmail.com")),
                ],),
              ),
            )
          ],
        )
      ),
    );
  }
}