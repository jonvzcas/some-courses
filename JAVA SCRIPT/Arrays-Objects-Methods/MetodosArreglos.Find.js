//? Find
//* Retorna el primer elemento que cumpla con la condición
//TODO no crea un nuevo arreglo, solo retorna el valor buscado

const arreglo = [1300, 990, 990, 1300, 200, 200, "201"]

const consulta = arreglo.find(function(elemento){
    return elemento === "201";
});

consulta;

console.log(typeof consulta); //* string
 



