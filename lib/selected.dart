import 'package:flutter/material.dart';

class Select extends StatefulWidget {
  const Select({super.key});

  @override
  State<Select> createState() => _SelectState();
}

class _SelectState extends State<Select> {
  int? select;
  int selected = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              height: 50,
              child: ListView.builder(
                shrinkWrap: true,
                physics: BouncingScrollPhysics(),
                itemCount: 6,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      setState(() {});

                      select = index;
                      print(select);
                    },
                    child: Container(
                      height: 50,
                      width: 50,
                      margin: EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                        border: select == index
                            ? Border.all(color: Colors.black)
                            : null,
                        color: select == index
                            ? Colors.indigoAccent.withOpacity(0.7)
                            : Colors.deepOrangeAccent.withOpacity(0.7),
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              height: 200,
              child: PageView.builder(
                onPageChanged: (value) {
                  setState(() {});
                  selected = value;
                  print(selected);
                },
                itemCount: 5,
                itemBuilder: (context, index) {
                  return Container(
                    color: Colors.blue[(index + 1) * 100],
                    child: Center(
                      child: Text(
                        'Page $index',
                        style: TextStyle(fontSize: 24, color: Colors.white),
                      ),
                    ),
                  );
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                5,
                (index) {
                  return Container(
                    height: 5,
                    width: 5,
                    margin: EdgeInsets.symmetric(horizontal: 2),
                    decoration: BoxDecoration(
                        color: selected == index
                            ? Colors.black
                            : Colors.deepOrangeAccent),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
