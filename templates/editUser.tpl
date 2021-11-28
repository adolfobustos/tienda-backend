
{include file='templates/head.tpl'}

<div class="contenedor">
    <section>
        <div class="col-8 p-4">
            <div class="card card-body">
                <form action="guardarUser/{$user->id}" method="POST">
                    <div class="form-group m-1">
                        <h4 class="text-dark">Usuario:</h4>
                        <h2 class="text-dark">{$user->user}</h2>
                    </div>
                    <select class="form-control m-1"  name="rol">
                        <option value="1" class="list-group-item list-group-item-light text-dark list-group-item-action" >Administrador</option>
                        <option value="NULL" class="list-group-item list-group-item-light text-dark list-group-item-action" >Usuario</option>
                    </select>
                    <button class="btn btn-success m-1" type="submit" >Guardar
                        <svg xmlns="http://www.w3.org/2000/svg" width="25" height="25" fill="currentColor" class="bi bi-plus-square" viewBox="0 0 16 16">
                            <path d="M14 1a1 1 0 0 1 1 1v12a1 1 0 0 1-1 1H2a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1h12zM2 0a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2H2z" /><path d="M8 4a.5.5 0 0 1 .5.5v3h3a.5.5 0 0 1 0 1h-3v3a.5.5 0 0 1-1 0v-3h-3a.5.5 0 0 1 0-1h3v-3A.5.5 0 0 1 8 4z" />
                        </svg>
                    </button>
                </form>
            </div>
        </div>
    </section>
</div>

{include file='templates/footer.tpl'}
