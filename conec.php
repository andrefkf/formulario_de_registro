<?php
// Datos de la conexión a la base de datos
$servername = "localhost";  // Puede ser "127.0.0.1" si estás usando localhost
$username = "root";         // Usuario de la base de datos
$password = "";             // Contraseña de la base de datos
$dbname = "login";          // Nombre de la base de datos

// Crear la conexión
$conn = new mysqli($servername, $username, $password, $dbname);

// Verificar si la conexión tiene algún error
if ($conn->connect_error) {
    die("Conexión fallida: " . $conn->connect_error);
}

// Si el formulario se ha enviado con el método POST
if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    // Recoger los datos del formulario
    $usuario = $_POST['usuario'];
    $correo = $_POST['gmail'];
    $password = password_hash($_POST['contraseña'], PASSWORD_BCRYPT);  // Hashear la contraseña
    $edad = $_POST['edad'];
    $telefono = $_POST['telefono'];
    $fecha_nacimiento = $_POST['fnacimiento'];
    $genero = $_POST['genero'];
    $direccion = $_POST['direccion'];
    $pais = $_POST['pais'];
    $ciudad = $_POST['cuidad'];
    $region = $_POST['region'];
    $codigo_postal = $_POST['cdpostal'];

    // Verificar que todos los campos del formulario estén completos
    if (!empty($usuario) && !empty($correo) && !empty($_POST['contraseña']) && !empty($edad) && 
        !empty($telefono) && !empty($fecha_nacimiento) && !empty($genero) && !empty($direccion) && 
        !empty($pais) && !empty($ciudad) && !empty($region) && !empty($codigo_postal)) {

        // Crear la consulta SQL para insertar el registro
        $sql = "INSERT INTO registro (gmail, contraseña, edad, telefono, fnacimiento, genero, direccion, pais, cuidad, region, cdpostal) 
                VALUES ('$correo', '$password', '$edad', '$telefono', '$fecha_nacimiento', '$genero', '$direccion', '$pais', '$ciudad', '$region', '$codigo_postal')";

        // Ejecutar la consulta
        if ($conn->query($sql) === TRUE) {
            echo "<script>alert('Formulario completo, se ha registrado con éxito.');</script>";
        } else {
            echo "Error: " . $sql . "<br>" . $conn->error;
        }
    } else {
        echo "<script>alert('Por favor, complete todos los campos.');</script>";
    }

    // Cerrar la conexión
    $conn->close();
}
?>
