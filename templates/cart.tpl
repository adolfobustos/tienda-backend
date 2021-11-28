
{include file='templates/head.tpl'}

<div class="contenedor">
  <!-- Admin -->
  <div class="text-center">
    {if $isAdmin}
    <a href="admin" type="button" class="btn btn-outline-light">Administrador
      <svg xmlns="http://www.w3.org/2000/svg" width="40" height="20" fill="currentColor" class="bi bi-person-check-fill" viewBox="0 0 16 16">
        <path fill-rule="evenodd" d="M15.854 5.146a.5.5 0 0 1 0 .708l-3 3a.5.5 0 0 1-.708 0l-1.5-1.5a.5.5 0 0 1 .708-.708L12.5 7.793l2.646-2.647a.5.5 0 0 1 .708 0z"/><path d="M1 14s-1 0-1-1 1-4 6-4 6 3 6 4-1 1-1 1H1zm5-6a3 3 0 1 0 0-6 3 3 0 0 0 0 6z"/>
      </svg>
    </a>
    {/if}
  </div>
  <h2>Nuestros Productos</h2>
  <section>
    <div class="d-block col-4 p-2 bg-white text-dark">
      <!-- Filtro por categoría -->
      <h4>Categorías</h4>
      <div class="list-group">
       {foreach from=$categorias item=$categoria}          
          <a href="categoria/{$categoria['id_categoria']}"class="list-group-item list-group-item-light text-dark list-group-item-action">{$categoria['nombre']}</a>  
       {/foreach}
      </div>
     <!-- ADD Producto -->
     {if $logged}
      <h4 class="mt-4">Agregar</h4>
      <form action="addProducto" method="POST" enctype="multipart/form-data">
        <textarea class="form-control" rows="3" name="nombre" id="nombre" placeholder="Producto"></textarea>
        <select class="form-control"  name="id_categoria" id="id_categoria">
          {foreach from=$categorias item=$categoria}
            <option value="{$categoria['id_categoria']}" class="list-group-item list-group-item-light text-dark list-group-item-action" placeholder="Categorias">{$categoria['nombre']}</option>
          {/foreach}
        </select>
        <input class="form-control" name="precio" id="precio" placeholder="Precio">
        {if $isAdmin}
        <input class="form-control" type="file" name="img" id="img">
        {/if}
        <input class="btn btn-primary m-2" type="submit" value="Agregar">
      </form>
      {/if}
    </div>
    <!-- Tabla Productos -->
    <div class="col-6 bg-white text-dark table-responsive">
      <table class="table table-bordered mb-0">
        <thead>
          <tr>
            <th>Producto</th>
            <th class="text-center">Precio</th>
            {if $logged}<th></th>{/if}
          </tr>
        </thead>
        <tbody>
          {foreach from=$productos item=$producto}
          <tr>
            <td><a href="product/{$producto['id']}" class="text-dark">{$producto['nombre']}</a></td>
            <td class="text-center">{$producto['precio']}</td>
            {if $logged}
            <td class="text-center">
              <!-- EDIT -->
              <a href="editProducto/{$producto['id']}" type="button" class="btn btn-outline-warning d-inline-flex m-0 p-1">
                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-pencil-square" viewBox="0 0 16 16">
                  <path d="M15.502 1.94a.5.5 0 0 1 0 .706L14.459 3.69l-2-2L13.502.646a.5.5 0 0 1 .707 0l1.293 1.293zm-1.75 2.456-2-2L4.939 9.21a.5.5 0 0 0-.121.196l-.805 2.414a.25.25 0 0 0 .316.316l2.414-.805a.5.5 0 0 0 .196-.12l6.813-6.814z" />
                  <path fill-rule="evenodd" d="M1 13.5A1.5 1.5 0 0 0 2.5 15h11a1.5 1.5 0 0 0 1.5-1.5v-6a.5.5 0 0 0-1 0v6a.5.5 0 0 1-.5.5h-11a.5.5 0 0 1-.5-.5v-11a.5.5 0 0 1 .5-.5H9a.5.5 0 0 0 0-1H2.5A1.5 1.5 0 0 0 1 2.5v11z" />
                </svg>
              </a>
              <!-- DELETE -->
              <a href="deleteProducto/{$producto['id']}" type="button" class="btn btn-outline-danger d-inline-flex m-0 p-1">
                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-trash" viewBox="0 0 16 16">
                  <path d="M5.5 5.5A.5.5 0 0 1 6 6v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5zm2.5 0a.5.5 0 0 1 .5.5v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5zm3 .5a.5.5 0 0 0-1 0v6a.5.5 0 0 0 1 0V6z" /><path fill-rule="evenodd" d="M14.5 3a1 1 0 0 1-1 1H13v9a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2V4h-.5a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1H6a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1h3.5a1 1 0 0 1 1 1v1zM4.118 4 4 4.059V13a1 1 0 0 0 1 1h6a1 1 0 0 0 1-1V4.059L11.882 4H4.118zM2.5 3V2h11v1h-11z" />
                </svg>
              </a>
            </td>
           {/if}
          </tr>
          {/foreach}
        </tbody>
      </table>
    </div>

    <!-- TABLA CATEGORÍAS -->
    <div class="col-8 bg-white text-dark table-responsive mt-5">
      <table class="table table-bordered mb-0">
        <thead>
          <tr>
            <th>Categoría</th>
            <th class="text-center">Descripción</th>
            {if $logged}<th></th>{/if}
          </tr>
        </thead>
        <tbody>
          {foreach from=$categorias item=$categoria}
          <tr>
            <td>{$categoria['nombre']}</td>
            <td>{$categoria['descripcion']}</td>
            {if $logged}
            <td class="text-center">
              <!-- EDIT -->
              <a href="editCategoria/{$categoria['id_categoria']}" type="button" class="btn btn-outline-warning d-inline-flex m-0 p-1">
                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-pencil-square" viewBox="0 0 16 16">
                  <path d="M15.502 1.94a.5.5 0 0 1 0 .706L14.459 3.69l-2-2L13.502.646a.5.5 0 0 1 .707 0l1.293 1.293zm-1.75 2.456-2-2L4.939 9.21a.5.5 0 0 0-.121.196l-.805 2.414a.25.25 0 0 0 .316.316l2.414-.805a.5.5 0 0 0 .196-.12l6.813-6.814z" />
                  <path fill-rule="evenodd" d="M1 13.5A1.5 1.5 0 0 0 2.5 15h11a1.5 1.5 0 0 0 1.5-1.5v-6a.5.5 0 0 0-1 0v6a.5.5 0 0 1-.5.5h-11a.5.5 0 0 1-.5-.5v-11a.5.5 0 0 1 .5-.5H9a.5.5 0 0 0 0-1H2.5A1.5 1.5 0 0 0 1 2.5v11z" />
                </svg>
              </a>
              <!-- DELETE -->
              <a href="deleteCategoria/{$categoria['id_categoria']}" type="button" class="btn btn-outline-danger d-inline-flex m-0 p-1">
                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-trash" viewBox="0 0 16 16">
                  <path d="M5.5 5.5A.5.5 0 0 1 6 6v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5zm2.5 0a.5.5 0 0 1 .5.5v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5zm3 .5a.5.5 0 0 0-1 0v6a.5.5 0 0 0 1 0V6z" /><path fill-rule="evenodd" d="M14.5 3a1 1 0 0 1-1 1H13v9a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2V4h-.5a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1H6a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1h3.5a1 1 0 0 1 1 1v1zM4.118 4 4 4.059V13a1 1 0 0 0 1 1h6a1 1 0 0 0 1-1V4.059L11.882 4H4.118zM2.5 3V2h11v1h-11z" />
                </svg>
              </a>
            </td>
           {/if}
          </tr>
          {/foreach}
        </tbody>
      </table>
    </div>
    {if $logged}
    <div class="d-block col-2 p-2 bg-white text-dark mt-5">
      <!-- Alerta Delete Categoria -->
      <div class="alert alert-warning" role="alert">
        Al eliminar la categoría se eliminan los productos de esta.
      </div>
      <!-- ADD Categoria -->
      <div>
        <h4 class="mt-4">Agregar</h4>
        <form action="addCategoria" method="POST">
          <textarea class="form-control" rows="3" name="nombre" id="nombre" placeholder="Categoría"></textarea>
          <textarea class="form-control" rows="6" name="descripcion" id="descripcion" placeholder="Descripción"></textarea>
          <input class="btn btn-primary m-2" type="submit" value="Agregar">
        </form>
      </div>
    </div>
    {/if}
  </section>
</div>

{include file='templates/footer.tpl'}
