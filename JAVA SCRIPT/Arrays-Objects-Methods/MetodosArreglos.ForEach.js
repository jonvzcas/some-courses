//? ForEach
//TODO No retorna un nuevo arreglo, solo muestra los elementos NO RETORNA
//! NO es un método para objetos 

const arreglo = [10, 20, 30, 40, 50]

const valoresMostrados = arreglo.forEach((elemento) => {
    console.log(elemento);
});
     
valoresMostrados

const otroArreglo = ["Thalia", "Jonathan"];

mostrarValoresObjeto = otroArreglo.forEach(function(elemento, index){
    console.log(index + ": " + elemento);
    
})

//* Otro ejemplo:
//* Utilizando el parámetro index

const numeros = [1, 2, 3, 4, 5];

const conIdex = numeros.forEach((numero, index) => {
    console.log(index + ": " + numero)
});

