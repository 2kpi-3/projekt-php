<?php
session_start();
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "news_baza";

$conn = new mysqli($servername, $username, $password, $dbname);

if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $username = $_POST['username'];
    $password = $_POST['password'];

    $stmt = $conn->prepare("SELECT password, admin FROM korisnik WHERE username=?");
    $stmt->bind_param("s", $username);
    $stmt->execute();
    $stmt->bind_result($hashed_password, $admin);
    $stmt->fetch();
    $stmt->close();

    if (password_verify($password, $hashed_password)) {
        $_SESSION['username'] = $username;
        $_SESSION['admin'] = $admin;
        header("Location: administrator.php");
    } else {
        echo "Neispravno korisničko ime ili lozinka.";
    }
}
?>

<!DOCTYPE html>
<html lang="de">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login - RP Online</title>
    <link rel="stylesheet" href="styles.css">
</head>
<body>
    <div class="header">
        <h1>RP ONLINE - Login</h1>
    </div>
    <div class="main">
        <div class="content">
            <div class="section">
                <h2>Prijava</h2>
                <form method="POST">
                    <label for="username">Korisničko ime:</label><br>
                    <input type="text" id="username" name="username" required><br><br>
                    <label for="password">Lozinka:</label><br>
                    <input type="password" id="password" name="password" required><br><br>
                    <input type="submit" value="Prijava">
                </form>
                <p>Nemate račun? <a href="registracija.php">Registrirajte se</a></p>
            </div>
        </div>
    </div>
</body>
</html>
