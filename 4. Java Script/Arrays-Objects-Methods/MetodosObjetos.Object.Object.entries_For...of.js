//? Object.entries con un For...of
//* 

let perro = {
    nombre: "Vozco",
    color: "Azabache",
    macho: true,
    edad: 7 
};

//! dice que perro no es iterable ya que for...of es solo para arreglos
// for(let valor of perro){
//     console.log(valor);
// }

for(const [key, value] of Object.entries(perro)){
    console.log(value);
};

const obj = {1: "a", 2:"b", 3:"c"};

console.log(Object.entries(obj));
 


    
