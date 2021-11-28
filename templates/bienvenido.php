<?php
if (!empty($user)) : ?>
    <h3 class="alert alert-success" role="alert">
        ¡Bienvenido <?= $user['user']; ?>! Ahora podes realizar tu compra. <a href="logout" class="text-danger">Cerrar sesión.</a>
    </h3>
<?php else : ?>
    <h3 class="alert alert-danger" role="alert"> Inicia sesión ó crea una cuenta para realizar tu compra.</h3>
<?php endif; ?>
