import 'package:flutter/material.dart';

class List extends StatefulWidget {
  const List({super.key});

  @override
  State<List> createState() => _ListState();
}

class _ListState extends State<List> {
  final GlobalKey<AnimatedListState> list = GlobalKey();
  final aniList = [];
  void addItem(){
    aniList.insert(0, "Item ${aniList.length + 1}");
    list.currentState!.insertItem(0, duration: const Duration(milliseconds: 600));
  }

  void removeItem(int index) {
    list.currentState!.removeItem(index, (_, animation) {
      return SizeTransition(
              sizeFactor: animation,
              child: const Card(
                color: Colors.red,
                child: SizedBox(
                    width: 400,
                    height: 50,
                        child:Text(
                          "Deleted",
                          style: TextStyle(fontSize: 20),
                        ),
              ),
              ),
            );
      
    }, duration: const Duration(milliseconds: 600)
    );

    aniList.removeAt(index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text("Flutter Map")),
        backgroundColor: Colors.blueGrey,
      ),
      
      body: Column(
        children: [
          IconButton(onPressed: addItem, icon: const Icon(Icons.add)),
          Expanded(
            child: AnimatedList(
                  key: list,
                  initialItemCount: 0,
                //itemCount: 10,
                itemBuilder: (BuildContext context, int index , animation) {
                  return SizeTransition(
                    sizeFactor: animation,
                    child: Card(
                      color: Colors.amberAccent,
                      child: SizedBox(
                          width: 400,
                          height: 50,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                aniList[index],
                                style: const TextStyle(fontSize: 20),
                              ),
                              IconButton(
                                  onPressed: () => removeItem(index),
                                  icon: const Icon(Icons.delete))
                            ],
                          )),
                    ),
                  );
                },
              ),
          ),
        ],
      ),
      
    );
  }
}
