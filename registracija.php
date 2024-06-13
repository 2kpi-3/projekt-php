<!DOCTYPE html>
<html lang="hr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Registracija</title>
    <link rel="stylesheet" href="styles.css">
</head>
<body>
    <div class="nav">
        <div class="naslov">RP ONLINE</div>
        <div class="linkovi">
            <a href="index.php">Home</a>
            <a href="sport.php">Sport</a>
            <a href="politik.php">Politik</a>
            <a href="administrator.php">Administracija</a>
            <a href="unos.html">Unos</a>
        </div>
    </div>
    <div class="main">
        <div class="content">
            <div class="section">
                <h2>Registracija</h2>
                <form action="registracija.php" method="post">
                    <label for="username">Korisničko ime:</label><br>
                    <input type="text" id="username" name="username" required><br><br>
                    
                    <label for="firstname">Ime:</label><br>
                    <input type="text" id="firstname" name="firstname" required><br><br>
                    
                    <label for="lastname">Prezime:</label><br>
                    <input type="text" id="lastname" name="lastname" required><br><br>
                    
                    <label for="password">Lozinka:</label><br>
                    <input type="password" id="password" name="password" required><br><br>
                    
                    <label for="confirm_password">Potvrda lozinke:</label><br>
                    <input type="password" id="confirm_password" name="confirm_password" required><br><br>
                    
                    <input type="submit" value="Registriraj se">
                </form>
                <p id="error_message" style="color: red;"></p>
            </div>
        </div>
    </div>
</body>
</html>

<?php
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "news_baza";

$conn = new mysqli($servername, $username, $password, $dbname);

if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $user = $_POST['username'];
    $firstname = $_POST['firstname'];
    $lastname = $_POST['lastname'];
    $pass = $_POST['password'];
    $confirm_pass = $_POST['confirm_password'];

    if ($pass !== $confirm_pass) {
        echo "<script>document.getElementById('error_message').innerText = 'Lozinke se ne podudaraju.';</script>";
    } else {
        $hashed_password = password_hash($pass, PASSWORD_DEFAULT);

        $stmt = $conn->prepare("INSERT INTO korisnik (username, password, firstname, lastname, admin) VALUES (?, ?, ?, ?, 0)");
        $stmt->bind_param("ssss", $user, $hashed_password, $firstname, $lastname);

        if ($stmt->execute()) {
            echo "Registracija je uspješna.";
        } else {
            if ($conn->errno === 1062) {
                echo "<script>document.getElementById('error_message').innerText = 'Korisničko ime već postoji.';</script>";
            } else {
                echo "Greška: " . $stmt->error;
            }
        }
        $stmt->close();
    }
}
$conn->close();
?>
