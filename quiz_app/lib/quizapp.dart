import 'package:flutter/material.dart';
import 'package:quiz_app/list.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {




  int questionIndex = 0;
  int selectedAnsIndex = -1;
  int totalScore = 0;
  bool enable = false;
  MaterialStatePropertyAll<Color?>? checkAns(int buttonIndex) {
    if (selectedAnsIndex != -1) {
      if (buttonIndex == selectedAnsIndex) {
        if (selectedAnsIndex == Questions[questionIndex]["correctAnswer"]) {
          if (enable==true) {
            totalScore++;
          }
          return const MaterialStatePropertyAll(Colors.green);
        } else {
          return const MaterialStatePropertyAll(Colors.red);
        }
      } else {
        if (buttonIndex == Questions[questionIndex]["correctAnswer"]) {
          return const MaterialStatePropertyAll(Colors.green);
        }
      }
    } else {
      return const MaterialStatePropertyAll(Colors.blue);
    }
    return const MaterialStatePropertyAll(Colors.blue);
  }

  Widget scorePage(){
      return Scaffold(
        
        body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("images/bg-end.png"),
              opacity: 70,
              fit: BoxFit.cover,)
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 50,
                ),
                const Text(
                  "Result",
                  style: TextStyle(fontSize: 25),
                  ),
                  const SizedBox(
                  height: 50,
                ),
                Text(
                  "Marks $totalScore/${Questions.length}",
                  style: const TextStyle(fontSize: 22),
                  ),
                  const SizedBox(
                  height: 50,
                ),
                Text(
                  totalScore >= 3 ? "You are passed" : "You are failed",
                  style: const TextStyle(fontSize: 22),
                ),
                const SizedBox(
                  height: 50,
                ),
                SizedBox(
                  child: ElevatedButton(
                    onPressed: (){
                   setState(() {
                      questionIndex = 0 ;
                    totalScore = 0;
                   });
                  },
                   child: const Text("Try again"),
                   style: const ButtonStyle(
                    fixedSize: MaterialStatePropertyAll(
                      Size(200, 40)
                    )
                   ),),
                )
              ],
            ),
          ),
        ),
      );
    }

  @override
  Widget build(BuildContext context) {
    if (questionIndex == 5) {
      return scorePage();
    }
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text(
          "Quiz App",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            const SizedBox(
              height: 25,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Questions : ",
                style: TextStyle(fontSize: 25),
                ),
                Text(
                  "${questionIndex +1}/${Questions.length}",
                  style: const TextStyle(fontSize: 25),
                )
              ],
            ),
            const SizedBox(
              height: 25,
            ),
            Container(
              height: 1,
              width: double.infinity,
              color: Colors.black,
            ),
               const SizedBox(
              height: 25,
            ),
            Container(
              margin: EdgeInsets.all(20),
              child: Text(
                "Q.${questionIndex + 1 } : ${Questions[questionIndex]["question"]}",
                style: const TextStyle(fontSize: 25),
              ),
            ),
             const SizedBox(
              height: 25,
            ),
            ElevatedButton(
              onPressed: enable
                    ? null
                    : (){
                      setState(() {
                        selectedAnsIndex = 0;
                        enable = !enable;
                      });
                    },
            child: Text("A.${Questions[questionIndex]["options"][0]}",style: TextStyle(color: Colors.white),),
            style: ButtonStyle(
              backgroundColor:checkAns(0),
                fixedSize: const MaterialStatePropertyAll(
                  Size(300,50),
                )
              ) ,
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: enable
                    ? null
                    : (){
                      setState(() {
                        selectedAnsIndex = 1;
                        enable = !enable;
                      });
                    },
            child: Text("B.${Questions[questionIndex]["options"][1]}",style: TextStyle(color: Colors.white)),
            style: ButtonStyle(
              backgroundColor:checkAns(1),
                fixedSize: const MaterialStatePropertyAll(
                  Size(300,50),
                )
              ) ,
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: enable
                    ? null
                    : (){
                      setState(() {
                        selectedAnsIndex = 2;
                        enable = !enable;
                      });
                    },
            child: Text("C.${Questions[questionIndex]["options"][2]}",style: TextStyle(color: Colors.white)),
            style: ButtonStyle(
              backgroundColor:checkAns(2),
                fixedSize: const MaterialStatePropertyAll(
                  Size(300,50),
                )
              ) ,
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
             onPressed: enable
                    ? null
                    : (){
                      setState(() {
                        selectedAnsIndex = 3;
                        enable = !enable;
                      });
                    },
            child: Container(child: Text("D.${Questions[questionIndex]["options"][3]}",style: TextStyle(color: Colors.white))),
            style: ButtonStyle(
              backgroundColor:checkAns(3),
                fixedSize: const MaterialStatePropertyAll(
                  Size(300,50),
                )
              ) ,
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          if (questionIndex < Questions.length ) {
            setState(() {
              selectedAnsIndex = -1;
              questionIndex++;
              enable = false;
            });
            
          }else{
            setState(() {
              questionIndex = 0;
              totalScore = 0 ;
            });
          }
        },
        tooltip: 'Increment',
        child: const Icon(Icons.forward_sharp),
      ), 
    );
  }
}