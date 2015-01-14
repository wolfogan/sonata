<?php

	/**
	* 	Connection to database " address_book " located on localhost server
	*	Created by: Edgar Iván Avila Garrido
	*/
	try
	{
		$host = "localhost";
		$dbname = "address_book";
		$dsn = "mysql:host=$host;dbname=$dbname";
		$user = "root";
		$password = "";
		$options = array(
		PDO::MYSQL_ATTR_INIT_COMMAND => 'SET NAMES utf8', // Encoding UTF8
		); 

		$connection = new PDO($dsn, $user, $password,$options);
		$connection->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
		//echo "Conexión realizada correctamente";
	}
	catch (PDOException $ex) 
	{
		echo "Error: ".$ex->getMessage();
		exit;
	}

