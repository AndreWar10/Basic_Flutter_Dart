import 'package:aula06/pages/pageViews/one_page.dart';
import 'package:flutter/material.dart';

class HomePage2 extends StatefulWidget {
  @override
  State<HomePage2> createState() => _HomePage2State();
}

class _HomePage2State extends State<HomePage2> {
  PageController _pageController = PageController();

  int indexBottomNavigationBar = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true, //alinha o title da AppBar
        title: Text("AppBar"),
      ),

      drawer: Drawer(
        //Como se fosse um container, mas indo ´so até metade da tela
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
              accountName: Text('André'),
              accountEmail: Text('name'),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.deepPurpleAccent,
                child: Text("D"),
              ),
            ),
            ListTile(
              //linha da lista
              title: Text('Item 1'),
              trailing: Icon(Icons.arrow_forward),
              onTap: () {
                //função click
                _pageController.jumpToPage(0);
                Navigator.pop(context);             //fechar menu
                setState(
                  () {
                    indexBottomNavigationBar = 0;
                  },
                );
              },
            ),
            ListTile(
              //linha da lista
              title: Text('Item 2'),
              trailing: Icon(Icons.arrow_forward),
              onTap: () {
                //função click
                _pageController.jumpToPage(1);
                Navigator.pop(context);
                setState(() {
                  indexBottomNavigationBar = 1;
                });
              },
            ),
            ListTile(
              //linha da lista
              title: Text('Item 3'),
              trailing: Icon(Icons.arrow_forward),
              onTap: () {
                //função click
                _pageController.jumpToPage(2);
                Navigator.pop(context);
                setState(() {
                  indexBottomNavigationBar = 2;
                });
              },
            ),
          ],
        ),
      ),

      body: PageView(
        controller: _pageController,
        children: [
          OnePage(),
          Container(
            color: Colors.red,
          ),
          Container(
            color: Colors.yellow,
          ),
        ],
      ),

      //precisa de uma lista de icones:
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: indexBottomNavigationBar, //estado do botão selecionado
        onTap: (int page) {
          setState(() {
            indexBottomNavigationBar = page;
          });
          _pageController.animateToPage(
            page,
            duration: Duration(milliseconds: 300),
            curve: Curves
                .ease, //Constante para todos tipos de transição // ease é a padrão
          ); //clica em cima
        },

        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.refresh),
            label: 'Item 1',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.refresh),
            label: 'Item 2',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.refresh),
            label: 'Item 3',
          ),
        ],
      ),
    );
  }
}
