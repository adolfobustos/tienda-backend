"use strict"

const API_URL_BASE= "http://localhost/tpe-bustos_serio/api/comentarios";
let formData = document.querySelector("#form_data");
let productoId = document.querySelector("#productoSeccion").getAttribute("value");   
let userId = document.querySelector("#productoSeccion").getAttribute("user"); 
let isAdmin = document.querySelector("#productoSeccion").getAttribute("admin");    
let coleccionComentarios = [];

async function getComentarios(){
//fetch para traer todos los comentarios
    try{
        let response = await fetch(API_URL_BASE+"/producto/"+productoId);
        if (response.ok){
            let comentarios = await response.json();
            coleccionComentarios = comentarios;
            render(comentarios); 
        }
    }catch(ex){
        console.log(ex);
    }
}

if (formData != null){
  formData.onsubmit = async (e) => {
    e.preventDefault();

    try {
        let response = await fetch('api/comentarios', {
          'method': 'POST',
          'headers': {
            'Content-Type': 'application/json'},
          'body': getBodyComentario()
        });

        if (response.ok){
            let responseJson = await response.json();
            console.log(responseJson);
            getComentarios();
            formData.reset();
        }

    } catch (error) {
        console.log(error);
    }
  };
}


function getValoracion() {
    let radios = document.getElementsByName('estrellas');
    console.log(radios);
    for (let i = 0, length = radios.length; i < length; i++) {
        if (radios[i].checked) {
          return radios[i].value;
        }
      }
}

  function getBodyComentario() {
      return  JSON.stringify({
        id_user: userId,
        id_producto: productoId,
        descripcion:  document.querySelector("#comentario").value,
        fecha: (new  Date()).toISOString().replace("T"," ").substring(0, 19),
        valoracion: getValoracion()
    });
  }

  async function borrarFila(input) {
    try {
      let i = input.parentNode.parentNode.rowIndex;
      let comentario = coleccionComentarios[i-1];
      let response = await fetch(API_URL_BASE+"/"+comentario.id_comentario, {
        'method': 'DELETE'
      });

      if (response.ok){
          document.getElementById("tabla_comentarios").deleteRow(i);
          let responseJson = await response.json();
          console.log(responseJson);
          getComentarios();
          formData.reset();
      }
    } 
    catch (error) {
        console.log(error);
    }
  }

  function render(comentarios) {
    let tabla = document.querySelector("#body-comentarios");
    tabla.innerHTML = "";
    for (let comentario of comentarios) {
      console.log(isAdmin);
      if (isAdmin){
        tabla.innerHTML += `<tr> 
                              <td>  ${comentario.user} </td>
                              <td>  ${comentario.descripcion} </td>
                              <td>  ${comentario.fecha} </td>
                              <td>  ${comentario.valoracion} Estrellas </td>
                              <td> 
                                <a onclick="borrarFila(this)" type="button" class="btn btn-outline-danger d-inline-flex m-0 p-1">
                                  <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-trash" viewBox="0 0 16 16">
                                      <path d="M5.5 5.5A.5.5 0 0 1 6 6v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5zm2.5 0a.5.5 0 0 1 .5.5v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5zm3 .5a.5.5 0 0 0-1 0v6a.5.5 0 0 0 1 0V6z" /><path fill-rule="evenodd" d="M14.5 3a1 1 0 0 1-1 1H13v9a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2V4h-.5a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1H6a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1h3.5a1 1 0 0 1 1 1v1zM4.118 4 4 4.059V13a1 1 0 0 0 1 1h6a1 1 0 0 0 1-1V4.059L11.882 4H4.118zM2.5 3V2h11v1h-11z" />
                                  </svg>
                                </a>
                               </td>
                            </tr>`;
      }
      else{
        tabla.innerHTML += `<tr> 
        <td>  ${comentario.user} </td>
        <td>  ${comentario.descripcion} </td>
        <td>  ${comentario.fecha} </td>
        <td>  ${comentario.valoracion} Estrellas </td>
      </tr>`
      }     
    }
 }

getComentarios();
