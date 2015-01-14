<?php require_once "controller.php" ?>
<?php require_once "app/start.php" ?>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>ADDRESS BOOK - SONATA SERVICES</title>
	<link type="text/css" rel="stylesheet" href="style.css">
	<link href='http://fonts.googleapis.com/css?family=Roboto' rel='stylesheet' type='text/css'>
	<!-- Latest compiled and minified CSS -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/css/bootstrap.min.css">

</head>
<body>
	<h1>ADDRESS BOOK - SONATA SERVICES</h1>
	<!-- Desplegar datos de los contactos -->
	<?php echo $allContacts; ?>
	
	<br><br>

	<div style="width:100%; clear:both; margin-top:250px">
		<h2>CONECTATE A FACEBOOK</h2>
		<?php if(!isset($_SESSION["facebook"])): ?>
			<a class="btn btn-primary" href="<?php echo $helper->getLoginUrl($config['scopes']); ?>">Iniciar sesión con Facebook</a>
		<?php else: ?>
			<p>
				Bienvenido, <?php echo $facebook_user->getName(); ?>
			</p>
			<p>
				Tu ID es: <?php echo $facebook_user->getId();?>
			</p>
			<p>
				Tu link es: <a href="<?= $facebook_user->getLink();?>">FACEBOOK</a> 
			</p>
			<a href="app/logout.php">Cerrar sesión</a>
		<?php endif; ?>
	</div>
</body>
</html>