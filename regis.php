<?php
// Conexion a la base de datos

$conn = new mysqli("localhost", "root", "", "login");

if ($conn->connect_error) {
    die("Conexión fallida: " . $conn->connect_error);
}

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $username = $_POST['usuario'];
    $correo = $_POST['gmail'];
    $password = password_hash($_POST['contraseña'], PASSWORD_BCRYPT);
    $edad = $_POST['edad'];
    $telefono = $_POST['telefono'];
    $fecha_nacimiento = $_POST['fnacimiento'];
    $genero = $_POST['genero'];
    $direccion = $_POST['direccion'];
    $pais = $_POST['pais'];
    $ciudad = $_POST['cuidad'];
    $region = $_POST['region'];
    $codigo_postal = $_POST['cdpostal'];

    $sql = "INSERT INTO registro (usuario, gmail, contraseña, edad, telefono, fnacimiento, genero, direccion, pais, cuidad, region, cdpostal) VALUES ('$username', '$correo', '$password', '$edad', '$telefono', '$fecha_nacimiento', '$genero', '$direccion', '$pais', '$ciudad', '$region', '$codigo_postal')";

    if ($conn->query($sql) === TRUE) {
        echo "<div class='success-message'>Felicitaciones formulario completo</div>";
    } else {
        echo "Error: " . $sql . "<br>" . $conn->error;
    }

    $conn->close();
}
?>
