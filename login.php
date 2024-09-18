<?php
// Iniciar la sesión
session_start();

// Conectar a la base de datos
$servername = "localhost"; // Cambia esto si tu servidor tiene otro nombre
$username = "root"; // Usuario de tu base de datos
$password = ""; // Contraseña de tu base de datos
$dbname = "nombre_de_tu_base_de_datos"; // Cambia esto por el nombre de tu base de datos

// Crear conexión
$conn = new mysqli($servername, $username, $password, $dbname);

// Verificar conexión
if ($conn->connect_error) {
    die("Conexión fallida: " . $conn->connect_error);
}

// Verificar si el formulario fue enviado
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $gmail = $_POST['gmail'];
    $password = $_POST['contraseña'];

    // Escapar caracteres especiales para prevenir inyección SQL
    $gmail = $conn->real_escape_string($gmail);
    $password = $conn->real_escape_string($password);

    // Consulta para verificar el correo electrónico y la contraseña
    $sql = "SELECT * FROM usuarios WHERE gmail = '$gmail'";
    $result = $conn->query($sql);

    if ($result->num_rows > 0) {
        // El correo existe, ahora verificamos la contraseña
        $row = $result->fetch_assoc();

        // Si la contraseña está almacenada con hash, usa password_verify
        if (password_verify($password, $row['contraseña'])) {
            // Contraseña correcta, iniciar sesión
            $_SESSION['gmail'] = $gmail;
            echo "Inicio de sesión exitoso. Bienvenido, " . $gmail;
            // Redirigir al usuario a la página de inicio
            header("Location: pagina_principal.php");
            exit();
        } else {
            // Contraseña incorrecta
            echo "Contraseña incorrecta.";
        }
    } else {
        // El correo no está registrado
        echo "El correo electrónico no está registrado.";
    }
}

$conn->close();
?>
