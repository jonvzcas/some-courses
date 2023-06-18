//? Map
//* Crea un nuevo arreglo, cada elemento es manipulado

const arreglo = [1, 2, 3, 4];

const cubos = arreglo.map(function(elemento){
    return Math.pow(elemento, 3);
});

cubos
