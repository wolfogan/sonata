<?php 

// Connection to DB "address_book"
require_once "connectdb.php"; 

// Query to retrieve de data contacts
$data = $connection->prepare("SELECT * FROM contacts");
$data -> execute();
$allContacts = "";

// Construction of front with data
while($contact = $data->fetch())
{
	// Get phone contacts 
	$query_phones = "SELECT category_phones.category_name,phones.number FROM phones INNER JOIN category_phones ON phones.id_category_phone = category_phones.id_category_phone WHERE id_contact = :contact	ORDER BY phones.id_contact ASC";
	$phones = $connection->prepare($query_phones);
	$phones -> execute(array(":contact" => $contact[0]));

	// Get links contacts
	$links = $connection->prepare("SELECT * FROM links WHERE id_contact = :contact");
	$links -> execute(array(":contact" => $contact[0]));

	// Format the data phones
	$format_phones = "";
	while($phone = $phones -> fetch())
	{
		$format_phones.= $phone[0]." : ".$phone[1]."<br />";
	}

	// Format the data links
	$format_links ="";
	while($link = $links -> fetch())
	{
		$format_links.= "<div style='float:left;'><a href='".$link[3]."'>".$link[2]."</a><br /></div>";
	}

	// CONSTRUCCION CONTACT
	$allContacts.= "<div class='contact'>".
				"Contact # ".$contact["id_contact"]."<br />".
				"First Name: ".$contact["first_name"]."<br />".
				"Last Name: ".$contact["last_name"]."<br />".
				"Address: ".$contact["address"]."<br />".
				"Phones: <br />".$format_phones.
				"Social Network: <br />".$format_links.
				"</div>";
}