import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget{
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String selectedMonth ="January";

  List<String> months = [
    "January",
    "February",
    "March",
    "April",
    "May",
    "June",
    "July",
    "August",
    "September",
    "October",
    "November",
    "December"
  ];

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 45,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Image.asset("lib/assets/img/logo.png",width: 33,),
                    SizedBox(width: 5,),
                    Text("Monety",style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.w700
                    ),)
                  ],
                ),
                Image.asset("lib/assets/img/search.png",width: 27,)
              ],
            ),
            SizedBox(height: 10,),
            ListTile(
              leading: ClipOval(
                  child: SizedBox(
                    width: 55,
                  height: 55,
                  child: Image.network("https://t4.ftcdn.net/jpg/03/64/21/11/360_F_364211147_1qgLVxv1Tcq0Ohz3FawUfrtONzz8nq3e.jpg",fit: BoxFit.cover,))),
              title: Text("Morning",style: TextStyle(
                color: Colors.grey
              ),),
              subtitle: Text("Laxman Tak",maxLines:1,overflow: TextOverflow.ellipsis,style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600
              ),),
              trailing: DropdownButton(
                icon: Icon(Icons.keyboard_arrow_down_outlined),
                  underline: SizedBox(),
                  dropdownColor: Colors.grey.shade200,
                  elevation: 15,
                  value:selectedMonth,
                  items: months.map((month){
                    return DropdownMenuItem(value: month,child: Text("$month"));
                  }).toList(),
                  onChanged: (value){
                    setState(() {
                      selectedMonth=value!;
                    });
                  }),
            ),
            SizedBox(height: 10,),
            Container(
              padding: EdgeInsets.all(20),
              width: double.infinity,
              decoration: BoxDecoration(
                color: Color(0xFF6674d3),
                borderRadius: BorderRadius.all(
                  Radius.elliptical(19, 13)
                )
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Expense total",style: TextStyle(
                    color: Colors.white,
                    fontSize: 17
                  ),),
                  Text("\$8,562",style: TextStyle(
                      color: Colors.white,
                      fontSize: 43,
                    fontWeight: FontWeight.w600
                  ),),
                  Row(
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 8,vertical: 5),
                        decoration: BoxDecoration(
                          color: Colors.red.shade400,
                          borderRadius: BorderRadius.circular(4)
                        ),
                        child: Text("+\$240",style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 15
                        ),),
                      ),
                      SizedBox(width: 8,),
                      Text("than last month",style: TextStyle(
                        fontSize: 16,
                        color: Colors.white
                      ),)
                    ],
                  )
                ],
              ),
            ),
            SizedBox(height: 15,),
            Text("Expense List",style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w600
            ),),
            SizedBox(height: 10,),
            Expanded(
              child: ListView.builder(
                itemCount: 3,
                  itemBuilder: (_,index){
                return Container(
                  margin: EdgeInsets.symmetric(vertical: 12,horizontal: 4),
                  padding: EdgeInsets.all(10),
                  width: double.infinity,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey.shade400,width: 1),
                      borderRadius: BorderRadius.circular(8)
                  ),
                  child: Column(
                    children: [
                      Container(
                        padding: EdgeInsets.only(bottom:4),
                        margin: EdgeInsets.only(bottom:6),
                        decoration: BoxDecoration(
                            border: Border(bottom: BorderSide(width: 1,color: Colors.grey.shade300))
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Tuesday" ", " "14",style: TextStyle(
                                fontSize: 21,
                                fontWeight: FontWeight.w500
                            ),),
                            Text("-\$1380",style: TextStyle(
                                fontSize: 21,
                                fontWeight: FontWeight.w500
                            ),)
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 180,
                        child: ListView.builder(
                            itemCount: 5,
                            itemBuilder: (_,index){
                              return ListTile(
                                leading:  Container(
                                  padding: EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                      color: Colors.blue.shade100,
                                      borderRadius: BorderRadius.circular(6)
                                  ),
                                  child: Icon(Icons.shopping_cart_outlined,color: Colors.blue.shade500,),
                                ),
                                title: Text("Shop",style: TextStyle(
                                  fontSize: 19,
                                ),),
                                subtitle: Text("Buy new Cloths",style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 15
                                ),),
                                trailing: Text("-\$90",style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.red.shade300
                                ),),
                              );
                            }),
                      )
                    ],
                  ),
                );
              }),
            )
          ],
        ),
      ),
    );
  }
}