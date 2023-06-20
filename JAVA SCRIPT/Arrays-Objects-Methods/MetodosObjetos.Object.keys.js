//? Object.keys()
//* Crea un arreglo con las claves del objeto que se le pasa a Object.keys()
//* Como el arreglo contiene las claves del objeto, luego puedo iterarlo para
//* mostrar los valores de las propiedades.

let perro = {
    nombre: "Vozco",
    color: "Azabache",
    macho: true,
    edad: 7 
};

let claves = Object.keys(perro);
claves // [ 'nombre', 'color', 'marcho', 'edad' ]

for (let i = 0; i < claves.length; i++) {
    const element = claves[i];
    console.log(perro[element]);
}

console.log(perro['edad']);

// Ejemplo:

const generosMusicales = {
    salsa: "Una aventura",
    balada: "Angel",
    rock: "Oh me",
    rap: "I'm not afraid"
}

let songs = Object.keys(generosMusicales);
songs
let  canciones = "";
for (let i = 0; i < songs.length; i++) {
    const element = songs[i];
    canciones += " " + generosMusicales[element]
}

console.log(canciones);
 



    
    

