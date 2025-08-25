

import 'package:flutter/material.dart';
import 'package:desafio/chartModel.dart';


class Pokemons extends StatefulWidget{
  const Pokemons({super.key});
  @override
  State<Pokemons> createState() => _PokemonsState();
}

class _PokemonsState extends State<Pokemons>{
  List<ChartModel> models = [];
  Map<int, bool> selected = {};

  Future<void> _getModels() async {
    setState(() {
      models = ChartModel.getModel();  
    });
    
  }

  void showDetails(int index){
    setState(() {
    selected[index] = !(selected[index] ?? false);

    print(selected[index] == true ? models[index].descricao : 'false'); 

    });
  }


    


  @override

  Widget build(BuildContext context){
    _getModels();
    return 
    Container( 
      
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      
      child:ListView.separated(
        separatorBuilder: (context, index) => SizedBox(height: 25),
        itemCount: models.length,
        itemBuilder: (context, index) {
          
          return Container(
          height: selected[index] == true ? 450 : 213,
          margin: EdgeInsets.fromLTRB(10,0,10,0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.grey,
                spreadRadius: 2,
                blurRadius: 5,
                offset: Offset(0, 3), // changes position of shadow
              ),
            ],
          ),

          
          child:Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children:[Container(
          
            margin: EdgeInsets.all(10),
            padding: EdgeInsets.fromLTRB(10,20,10,10),
            height: 193,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: models[index].elementoCor,
                stops: [0.55,0.80],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(10),
            ),

            child: Column(
            children: [Row(
              
              children: [
                Column(
                  children:[Container(
                    height: 150,
                    margin: EdgeInsets.only(right: 10),
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Color.fromARGB(50, 0, 0, 0),
                          Color.fromARGB(49, 255, 255, 255),
                          Color.fromARGB(0, 0, 0, 0),
                          Color.fromARGB(50, 0, 0, 0),
                          Color.fromARGB(50, 0, 0, 0),
                        ],
                        stops: [0.05,0.55,0.75,0.99,1],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomCenter,
                      ),

                        shape: BoxShape.circle
                    ),
                    child: Image.asset(models[index].iconPath),
                  ),
                  
                  
                  ],),


                  Container(width: 3,height:160, 
                  decoration: BoxDecoration(
                    color: Color.fromARGB(25, 0, 0, 0),
                    borderRadius: BorderRadius.circular(10),
                  ),),

                  SizedBox(width: 5),

                  Text(models[index].nome,
                    style: TextStyle(
                      color: const Color.fromARGB(255, 0, 0, 0),
                      fontWeight: FontWeight.bold,
                     fontSize: 20,
                  ),),

                  Expanded(child:SizedBox()),
                  Column(
                    children: [SizedBox(height: 80,),
                    OutlinedButton(
                      onPressed: () => showDetails(index),
                      child: Text('v',style: TextStyle(
                          color: const Color.fromARGB(255, 0, 0, 0),
                          fontWeight: FontWeight.bold,
                          fontSize: 30,
                        ),
                      ),)
                    ],),

                
              ],
      
              
            ),
            
            ],
            
            
          ),
          

          ),
          if(selected[index] == true)...[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              
              children:[Container(
              margin: EdgeInsets.fromLTRB(20,0,20,20),
              padding: EdgeInsets.all(10),
              
              decoration: BoxDecoration(
                color: Color.fromARGB(50, 0, 0, 0),
                borderRadius: BorderRadius.circular(10),
                
              ),
              child:Text(models[index].descricao,
                style: TextStyle(
                  color: const Color.fromARGB(255, 0, 0, 0),
                  fontWeight: FontWeight.normal,
                  fontSize: 16,
                ),
              ),

            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,

              children: [
                Container(
                  margin: EdgeInsets.fromLTRB(20,0,20,20),
                  padding: EdgeInsets.all(10),
              
                  decoration: BoxDecoration(
                    color: Color.fromARGB(50, 0, 0, 0),
                    borderRadius: BorderRadius.circular(10),
                
                  ),
                  child:Text(models[index].species,
                    style: TextStyle(
                      color: const Color.fromARGB(255, 0, 0, 0),
                      fontWeight: FontWeight.normal,
                      fontSize: 16,
                    ),
                  ),

                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,

                  children: [Container(
                  margin: EdgeInsets.fromLTRB(20,0,5,20),
                  padding: EdgeInsets.all(10),
                  width: 60,  
                  height: 60,
                  decoration: BoxDecoration(
                    color: Color.fromARGB(50, 0, 0, 0),
                    shape: BoxShape.circle
                  ),
                  child:Image.asset(models[index].elementos[0]),
                ),


                if(models[index].elementos[1] != '')Container(
                  margin: EdgeInsets.fromLTRB(5,0,20,20),
                  padding: EdgeInsets.all(10),
                  width: 60,  
                  height: 60,
                  decoration: BoxDecoration(
                    color: Color.fromARGB(50, 0, 0, 0),
                    shape: BoxShape.circle
                  ),
                  child:Image.asset(models[index].elementos[1]),
                ),],),
                
                ],
            ),
            ],
            )
            
            ]
          
          ],),
          
          
          );
        },
    ),
    );
  }
}