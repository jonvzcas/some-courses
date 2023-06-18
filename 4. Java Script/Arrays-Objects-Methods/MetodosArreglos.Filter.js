//? Filter
//* Crea un nuevo arreglo, NO modifica el original

const arreglo = [
    { id: 1, username: "Mapper"},
    { id: 2, username: "Finder"},
    { id: 3, username: "Eaching"},
    { id: 4, username: {discord: "jonvzcas"}}
];

//? ¿Cómo se usa?

const filtro1 = arreglo.filter(function(elemento){
    return elemento.id > 2;
});

filtro1

const filtro2 = arreglo.filter(function(elemento){
    return elemento.username === "Finder";
});

filtro2

const filtro3 = arreglo.filter(function(elemento){
    return elemento.username.discord === "jonvzcas";
});

filtro3

const otroArreglo = ['T','h','a','l','i','a'];

const otroFiltro = otroArreglo.filter(function(elemento){
    return elemento === 'a';
});

otroFiltro