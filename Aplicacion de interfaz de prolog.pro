%&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&
%  ESTRUCTURAS DEL LENGUAJE
%  Elaborado por: Freddy Stiven Gomez   -  Juan Camilo Zarta Campo				 
%&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&

%NOTAS:
/*
*para la parte de listas estas no deben ser vacias, y deben tener almenos 
 dos elementos.
*para la parte logica se debe escribir el nombre sin espacion es decir:
 nombre_apellido --> usando el guion bajo en lugar de espacio.
*/


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Aqui definición de hechos y reglas, funciones básicas y recursivas
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%Hechos
dirigio(j.j_abrams, star_trek).
dirigio(guillermo_del_toro, hellboy).
dirigio(gabriele_muccino, siete_almas).
dirigio(michael_bay, transformers).
dirigio(jon_favreau, iron_man).

actuo_en(daniel_radcliffe, harry_potter).
actuo_en(tom_hanks, angeles_y_demonios).
actuo_en(megan_fox, transformers).
actuo_en(brad_pitt, benjamin_button).
actuo_en(downey_jr, iron_man).
actuo_en(will_smith, siete_almas).

es_del_genero(harry_potter, aventura).
es_del_genero(star_trek, ciencia_ficcion).
es_del_genero(angeles_y_demonios, suspenso).
es_del_genero(transformers, accion).
es_del_genero(benjamin_button, drama).
es_del_genero(siete_almas, drama).
es_del_genero(iron_man, ciencia_ficcion ).
es_del_genero(hellboy, cienci_ficcion).

%Reglas
informacion_filmica(Director, Pelicula, Actor, Genero) :- dirigio(Director, Pelicula), 
actuo_en(Actor, Pelicula), es_del_genero(Pelicula, Genero).

%Preguntas
%?- read(Dir, "Ingrese el nombre del Director de la pelicula: "), write(Dir), nl, read(Pel, "Ingrese el nombre de la Pelicula: "), 
%   write(Pel), nl,informacion_filmica(Dir, Pel, A, G), write("Actor: "), write(A), nl, write("Genero filmico: "), write(G), nl.
   
%?- read(Dir, "Ingrese el nombre del Director de la pelicula: "), informacion_filmica(Dir, P, A, G), write("Pelicula: "), write(P), nl,
%   write("Actor: "), write(A), nl, write("Genero filmico: "), write(G), nl.




%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


?-window(_, _,crea_ventana(),"Aplicación",150, 50, 700, 500), 
  window_brush(_, "SKY.bmp"),update_window(_).

%----------------------------------------------------%VENTANAS
%Ventana Archivo: Infomracion
ventana_info(init):- 
	window_brush(_, rgb(255, 255, 255)).

%Ventana Listas: Conocer pares
ventana_conocer(init):- 
	window_brush(_, rgb(255, 255, 255)).

%Ventana Listas: Numero Maximo
ventana_maximo(init) :-
    window_brush(_, rgb(255, 255, 255)).

%Ventana Listas: Comparar Listas
ventana_comparacion(init):- 
	window_brush(_, rgb(255, 255, 255)).

%Ventana Logica: Hollywood
ventana_hollywood(init):- window_brush(_, rgb(255, 255, 255)),
                    button(_,_,boton_hollywood1(_),"&Busqueda 1",350,35,95,30),
                    button(_,_,boton_hollywood2(_),"&Busqueda 2",350,85,95,30).

%----------------------------------------------------%PREDICADOS
%%%%Archivos
info_autores(init):-
     text_out(50,50,"Autores:"),
	text_out(110,50,"Fredy Stiven Gomez"),
	text_out(110,70,"Juan Camilo Zarta Campo").

%%%%Listas

%%Conocer pares
% Predicado para contar la cantidad de números pares en la lista
contar_pares([], 0).
contar_pares([X|Resto], NumPares) :-
	X mod 2 =:= 0,
	contar_pares(Resto, NumResto),
	NumPares is NumResto + 1.
contar_pares([_|Resto], NumPares) :-
    contar_pares(Resto, NumPares).

% Predicado para imprimir los números pares de la lista
obtener_pares([], []).
obtener_pares([X|Resto], [X|Pares]) :-
	X mod 2 =:= 0,
obtener_pares(Resto, Pares).
obtener_pares([_|Resto], Pares) :-
	obtener_pares(Resto, Pares).

%%Numero Maximo
% Predicado para convertir los términos de la lista en números
convertir_a_numeros([], []).
convertir_a_numeros([Term|Resto], [Num|Numeros]) :-
    number(Term),
    Num is Term,
    convertir_a_numeros(Resto, Numeros).
convertir_a_numeros([_|Resto], Numeros) :-
    convertir_a_numeros(Resto, Numeros).

% Predicado para encontrar el máximo elemento de la lista
encontrar_maximo([Maximo], Maximo).
encontrar_maximo([Cabeza|Cola], Maximo) :-
    encontrar_maximo(Cola, MaxCola),
    (Cabeza > MaxCola -> Maximo = Cabeza ; Maximo = MaxCola).   

%%Comparacion de listas
% Predicado para sumar los elementos de una lista
sumar_lista([], 0).
sumar_lista([X|Resto], Suma) :-
    sumar_lista(Resto, SumaResto),
    Suma is SumaResto + X.





%----------------------------------------------------%Botones

%---- al oprimir el botón "Busqueda 1" se procede a buscar solicitando director y pelicula
boton_hollywood1(press):- 
	
	read(Director,"Ingese el nombre del director de la pelicula:"),
	read(Pelicula,"Ingrese el nombre de la pelicula:"),
	%esta es una etiqueta
     text_out(50,140,"Actor:"), 
     text_out(50,170,"Genero:"),	
     %se invoca la regla creada 
     informacion_filmica(Director, Pelicula, Act, Gen),
     %esta es una caja de texto con el nombre de G_actor
     edit(G_actor,_,edit_func(_),"",110,135,150,28),
	set_text(print(Act),G_actor), 
     %esta es una caja de texto con el nombre de G_genero
     edit(G_genero,_,edit_func(_),"",110,165,150,28),
	set_text(print(Gen),G_genero).

%---- al oprimir el botón "Busqueda 2" se procede a buscar solicitando director
boton_hollywood2(press):- 
	
	read(Director,"Ingese el nombre del director de la pelicula:"),
	%esta es una etiqueta
     text_out(50,140,"Pelicula:"),
     text_out(50,170,"Genero:"), 
     text_out(50,200,"Actor:"),
     %se invoca la regla creada 
     informacion_filmica(Director, Pel, Act, Gen),
     %esta es una caja de texto con el nombre de G_pelicula
     edit(G_pelicula,_,edit_func(_),"",110,135,150,28),
	set_text(print(Pel),G_pelicula), 
     %esta es una caja de texto con el nombre de G_genero
     edit(G_genero,_,edit_func(_),"",110,165,150,28),
	set_text(print(Gen),G_genero),
     %esta es una caja de texto con el nombre de G_actor
     edit(G_actor,_,edit_func(_),"",110,195,150,28),
	set_text(print(Act),G_actor).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%AQUI VA LA PARTE GRAFICA, MENUS Y SUB MENUS DEL PROGRAMA%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

 
%----------------------------------------------------%MENU
%crea el menú
crea_ventana(init):- 
	menu(pop_up, _,_,arc(_),"&ARCHIVO"),
	menu(pop_up, _,_,lis(_),"&LISTA"),
	menu(pop_up, _,_,log(_),"&LOGICO").

%----------------------------------------------------%SUB MENUS ARCHIVO
%Crea el SubMenú
arc(init):-	
	menu(normal, _,_,informacion(_),"&Informacion"),
	menu(normal, _,_,cerrar_ven(_),"&Salir").

%___________________Informacion
informacion(press):-  
	window( _, _, ventana_info(_), "Informacion", 150,50,450,200), info_autores(_).


%___________________Salir
cerrar_ven(press):- 
	close_window(X).

%----------------------------------------------------%SUB MENUS LISTA
%Crea el SubMenú
lis(init):-	
	menu(normal, _,_,conocer_pares(_),"&Conocer Pares"),
	menu(normal, _,_,maximo_elem(_),"&Maximo de Elementos"),
	menu(normal, _,_,comparacion_list(_),"&Comparacion de listas").

%___________________Crea el SubMenú Conocer pares
conocer_pares(press):-  
	window(_, _, ventana_conocer(_), "Conocer Pares", 150, 50, 700, 500),
	read(Lista, "Ingrese una lista [n1,n2,...,ni]: "),
	% Esta es una etiqueta
	text_out(50, 100, "La Lista es:"),
	% Esta es una caja de texto con el nombre de G_lista
	edit(G_lista, _, _, "", 250, 95, 150, 30),
	% Estraer la lista en la caja de texto
	set_text(print(Lista), G_lista),

	% Llamado a la funcion Contar_pares
	contar_pares(Lista, NumPares),
	% Esta es una etiqueta
	text_out(50, 150, "Cantidad de números pares:"),
	% Esta es una caja de texto con el nombre de Cant_NumPares
	edit(Cant_NumPares, _, _,"", 250, 145, 150, 30),
	% Estraer la lista en la caja de texto
	set_text(print(NumPares), Cant_NumPares),

	% Llamado a la función Obtener_pares
	obtener_pares(Lista, Pares),
	% Esta es una etiqueta
	text_out(50, 200, "Números pares en la lista:"),
	% Esta es una caja de texto con el nombre de NumPares_list
	edit(NumPares_list, _, _, "", 250, 195, 150, 30),
	% Extraer la lista de números pares en la caja de texto
	set_text(print(Pares), NumPares_list).

%___________________Crea el Submenú Maximo Elementos
maximo_elem(press) :-
    window(_, _, ventana_maximo(), "Maximo de Elementos", 150, 50, 700, 500),
    read(Lista, "Ingrese una lista [n1,n2,...,ni]: "),
    % Esta es una etiqueta
    text_out(50, 100, "La Lista es:"),
    % Esta es una caja de texto con el nombre de G_lista
    edit(G_lista, _, _, "", 250, 95, 150, 30),
    % Extraer la lista en la caja de texto
    set_text(print(Lista), G_lista),

    % Convertir los términos de la lista en números
    convertir_a_numeros(Lista, Numeros),

    % Llamado a la función encontrar_maximo
    encontrar_maximo(Numeros, Max),
    % Esta es una etiqueta
    text_out(50, 150, "El Maximo de la lista es: "),
    % Esta es una caja de texto con el nombre de Num_Max
    edit(Num_Max, _, _, "", 250, 145, 150, 30),
    % Extraer el máximo elemento en la caja de texto
    set_text(print(Max), Num_Max).

%___________________Crea el Submenú Comparacion listas_
comparacion_list(press) :-
    window(_, _, ventana_comparacion(_), "Comparacion de listas", 150, 50, 700, 500),
    read(ListaA, "Ingrese la lista A: "),
    read(ListaB, "Ingrese la lista B: "),
    % Mostrar las listas ingresadas
    text_out(50, 100, "Lista A:"),
    edit(G_listaA, _, _, "", 250, 95, 150, 30),
    set_text(print(ListaA), G_listaA),
    text_out(50, 150, "Lista B:"),
    edit(G_listaB, _, _, "", 250, 145, 150, 30),
    set_text(print(ListaB), G_listaB),
    % Comparar las sumas de los elementos de ambas listas
    sumar_lista(ListaA, SumaA),
    sumar_lista(ListaB, SumaB),
    % Mostrar las sumas obtenidas
    text_out(50, 200, "Suma de elementos de Lista A:"),
    edit(G_sumaA, _, _, "", 250, 195, 150, 30),
    set_text(print(SumaA), G_sumaA),
    text_out(50, 250, "Suma de elementos de Lista B:"),
    edit(G_sumaB, _, _, "", 250, 245, 150, 30),
    set_text(print(SumaB), G_sumaB),
    % Comparar las sumas y mostrar el resultado correspondiente
    (
        SumaA > SumaB -> text_out(50, 300, "La suma de los elementos de la lista A es mayor que la suma de los elementos de la lista B");
        SumaA < SumaB -> text_out(50, 300, "La suma de los elementos de la lista A es menor que la suma de los elementos de la lista B");
        SumaA =:= SumaB -> text_out(50, 300, "La suma de los elementos de la lista A es igual a la suma de los elementos de la lista B")
    ).

%----------------------------------------------------%SUB MENU LOGICO
%Crea el Submenú Logicoq
log(init):-	
	menu(normal, _,_,hollywood(_),"&Hollywood").

%___________________Crea el Submenú Hollywood
hollywood(press) :-
    window(_, _, ventana_hollywood(_), "Hollywood", 150, 50, 700, 500),
    read(Director, "Ingrese el nombre del director: "),
    read(Pelicula, "Ingrese el nombre de la película: "),
    
    % Pregunta 1
    actor_pelicula_director(Actor1, Pelicula, Director),
    genero(Pelicula, Genero1),
    text_out(50, 100, "El actor que actuó en la película es:"),
    edit(G_actor1, _, _, "", 250, 95, 150, 30),
    set_text(print(Actor1), G_actor1),
    text_out(50, 150, "El género de la película es:"),
    edit(G_genero1, _, _, "", 250, 145, 150, 30),
    set_text(print(Genero1), G_genero1),

	% Pregunta 2
    pelicula_genero_actor(Pelicula2, Genero2, Actor2),
    text_out(50, 200, "La película dirigida por el director es:"),
    edit(G_pelicula2, _, _, "", 250, 195, 150, 30),
    set_text(print(Pelicula2), G_pelicula2),
    text_out(50, 250, "El género de la película es:"),
    edit(G_genero2, _, _, "", 250, 245, 150, 30),
    set_text(print(Genero2), G_genero2),
    text_out(50, 300, "El actor que actuó en la película es:"),
    edit(G_actor2, _, _, "", 250, 295, 150, 30),
    set_text(print(Actor2), G_actor2),

    % Pregunta 3
    text_out(50, 350, "Director:"),
    edit(G_director, _, _, "", 250, 345, 150, 30),
    set_text(print(Director), G_director),
    text_out(50, 400, "Película dirigida:"),
    edit(G_pelicula, _, _, "", 250, 395, 150, 30),
    set_text(print(Pelicula), G_pelicula),
    text_out(50, 450, "Género de la película:"),
    edit(G_genero, _, _, "", 250, 445, 150, 30),
    set_text(print(Genero1), G_genero),
    text_out(50, 500, "Actor que actuó:"),
    edit(G_actor, _, _, "", 250, 495, 150, 30),
    set_text(print(Actor1), G_actor).





