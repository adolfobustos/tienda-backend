
{include file='templates/head.tpl'}

<div id="productoSeccion" value="{$producto->id}" user="{$user}" admin="{$isAdmin}" class="contenedor">
  <section class="mt-4">
    <!-- Producto -->
    <div class="m-4 p-1 bg-white text-dark w-75 rounded">
      <a href="cart" class="btn btn-primary">Volver</a>
      <h4>Categoria: {$producto->nombre}</h4>
      <h4>Precio: {$producto->precio}</h4>
      <h4>Descripcion: {$producto->descripcion}</h4>
      <figure>
        <img class="imagenes" src="{$producto->img}" alt="" />
      </figure>
    </div>

    <!-- COMENTAR -->
    {if $logged}
    <div class="m-2 p-1 bg-white text-dark w-75 rounded">
      <form class="d-flex" id="form_data">
        <textarea class="form-control" rows="3" name="comentario" id="comentario" placeholder="Comentario"></textarea>
        <div class="m-2">
          <p class="clasificacion">
            <input id="radio1" type="radio" name="estrellas" value="5">
            <label for="radio1">★</label>
            <input id="radio2" type="radio" name="estrellas" value="4">
            <label for="radio2">★</label>
            <input id="radio3" type="radio" name="estrellas" value="3">
            <label for="radio3">★</label>
            <input id="radio4" type="radio" name="estrellas" value="2">
            <label for="radio4">★</label>
            <input id="radio5" type="radio" name="estrellas" value="1">
            <label for="radio5">★</label>
          </p>
          <input class="btn btn-primary" type="submit" value="Comentar">
        </div>
      </form>
    </div>
    {/if}
    <!-- TABLA COMENTARIOS -->
    <div class="m-1 p-1 bg-white text-dark w-75 rounded">
      <div class="col-12 bg-white text-dark table-responsive">
        <table id="tabla_comentarios" class="table table-bordered mb-0">
          <thead>
              <tr>
              <th class="text-center">Usuario</th>
              <th class="text-center">Comentario</th>
              <th class="text-center">Fecha</th>
              <th class="text-center">Calificación</th>
              </tr>
          </thead>
          <tbody id= "body-comentarios">
         
          </tbody>
        </table>
      </div>
    </div>
  </section>
</div>


<script src="js/app.js"></script>
{include file='templates/footer.tpl'}
