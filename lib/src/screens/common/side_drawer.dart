import 'package:flutter/material.dart';

class SideNav extends StatelessWidget {
  const SideNav({ Key? key }) : super(key: key);
  final padding = const EdgeInsets.symmetric(horizontal: 20);
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Material(
        color: const Color.fromRGBO(50, 75, 205, 1),
        child: ListView(
          // padding: padding,
          children: [
            buildHeader(
              name:"karan",
              email:"duggalkaran400@gmail.com"
            ),
            const SizedBox(height: 16,),
            buildMenuItem(
              text:"People",
              icon:Icons.people,
              onClicked: () => selectedItem(context,0)
            ),
            const SizedBox(height: 16,),
            buildMenuItem(
              text:"favourites",
              icon:Icons.favorite_border,
              onClicked: () => selectedItem(context,2)
            ),
            const SizedBox(height: 16,),
            buildMenuItem(
              text:"workflow",
              icon:Icons.workspaces_outline
            ),
            const SizedBox(height: 16,),
            buildMenuItem(
              text:"update",
              icon:Icons.update
            ),
            const SizedBox(height: 24,),
            const Divider(color: Colors.white70,),
            const SizedBox(height: 24,),
            buildMenuItem(
              text:"plugin",
              icon:Icons.account_tree_outlined
            ),
            const SizedBox(height: 16,),
            buildMenuItem(
              text:"Notification",
              icon:Icons.notifications_active_outlined
            ),
          ],
        ),
      ),
    );
  }
  Widget buildHeader({
    required String name,
    required String email,
  }){
    return InkWell(
      // onTap: onClicked,
      child: Container(
        padding: padding.add(const EdgeInsets.symmetric(vertical: 40)),
        child: Row(
          children: [
            const CircleAvatar(radius: 30,backgroundImage: NetworkImage('https://images.unsplash.com/photo-1633498103165-98bcbed526ff?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1170&q=80'),),
            const SizedBox(width: 20,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  "Karan",
                  style: TextStyle(fontSize: 20,color: Colors.white),
                ),
                SizedBox(width: 4,), 
                Text(
                  "duggalkaran400@gmail.com",
                  style: TextStyle(fontSize: 10,color: Colors.white),
                ),
              ],
            ),
            const Spacer(),
            const CircleAvatar(
                  radius:24,
                  backgroundColor: Color.fromRGBO(30, 60, 168, 1),
                  child: Icon(
                    Icons.add_comment_outlined,
                    color: Colors.white,
                  ),
                )
          ],
        ),
      ),
    );
  }
  Widget buildMenuItem({
    required String text,
    required IconData icon,
    VoidCallback ? onClicked
  }){
    const color = Colors.white;
    const hoverColor = Colors.white70;
    return ListTile(
      leading: Icon(icon,color: color,),
      title: Text(text,style: const TextStyle(color: color),),
      hoverColor: hoverColor,
      onTap: onClicked,
    );
  }
  void selectedItem(BuildContext context,int index){
    Navigator.of(context).pop();
    switch (index) {
      case 0:
        // print("Click in people");
        break;
      case 1:
        // print("Click in favourites");
        break;
      // default:
    }
  }

  // Widget listItem({
  //   required String lable,
  //   required IconData icon
  // }){
  //   // final color = Colors.white;
  //   const hoverColor = Colors.white60;
  //   return ListTile(
  //     leading: Icon(icon,color:Colors.red),
  //     hoverColor: hoverColor,
  //     title: Text(lable,style: const TextStyle(color: Colors.red),),
  //     onTap: (){

  //     },
  //   );
  // }
}

// Drawer(
//       child: Container(
//         color: Colors.blueAccent,
//         child: ListView(
//           children: [
//             Container(
//               padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 20),
//               child: Row(
//                 children: [
//                   const CircleAvatar(
//                     radius: 30,
//                     backgroundColor: Colors.white60,
//                   ),
//                   const SizedBox(width: 20,),
//                   Column(
//                     children: const [
//                       Text("Karan Duggal"),
//                       SizedBox(height: 10,),
//                       Text("Rs.50000")
//                     ],
//                   )
//                 ],
//               ),
//             ),
//             Container(
//               padding: const EdgeInsets.only(left: 25),
//               child: const Text("Leaderboard - 230 posision"),
//             ),
//             listItem(
//               lable:"daily Quiz",
//               icon:Icons.quiz
//             )
//           ],
//         ),
//       ),
//     );