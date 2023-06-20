//? Object.entries con un forEach()
//* 

let perro = {
    nombre: "Vozco",
    color: "Azabache",
    macho: true,
    edad: 7 
};

// Así solo muestra par clave valor en un arreglo anidado
console.log(Object.entries(perro)); // [ [ 'nombre', 'Vozco' ],[ 'color', 'Azabache' ],[ 'macho', true ],[ 'edad', 7 ] ]

Object.entries(perro).forEach(([key, value]) => {
    console.log(value);
})
