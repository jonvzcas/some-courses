//? For...in
//* Va al grano, mostrando directamente propiedades.

let perro = {
    nombre: "Vozco",
    color: "Azabache",
    macho: true,
    edad: 7 
};

for(key in perro){
    console.log(key + ": " + perro[key]);
}
    