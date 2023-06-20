//? For...Of
//* Es como el map pero no crea un nuevo arreglo

const arreglo = ["a","b","c"];

for(const elemento of arreglo){
    console.log(elemento);
};

// Ejemplo:

const prices = [100000, 7500, 9000, 2500];

for (let price of prices){
    let precioVenta = price * 1.8;
    console.log(precioVenta);
}

// Ejemplo:

const worker = [{nombre: "Danicia"}, {nombre: "Jomara"}, {nombre: "Jaime"}];

for (let person of worker){
    console.log(`${person.nombre} es un trabajador!`);
};
    
    