//? Object.value()
//* Crea un arreglo con los values del objeto que se le pasa a Object.values()
//* Como el arreglo contiene los value del objeto, luego puedo iterarlo para
//* mostrar todos los valores.

let perro = {
    nombre: "Vozco",
    color: "Azabache",
    macho: true,
    edad: 7 
};

let claves = Object.values(perro);
claves // [ 'Vozco', 'Azabache', true, 7 ]

for (let i = 0; i < claves.length; i++) {
    const element = claves[i];
    console.log(element);
}

console.log(perro['edad']);

// Ejemplo:

const generosMusicales = {
    salsa: "Una aventura",
    balada: "Angel",
    rock: "Oh me",
    rap: "I'm not afraid"
}

let songs = Object.values(generosMusicales);
songs
let  canciones = "";
for (let i = 0; i < songs.length; i++) {
    const element = songs[i];
    canciones += " " + element
}

console.log(canciones);
 



    
    

