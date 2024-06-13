<?php
session_start();

if (!isset($_SESSION['username'])) {
    header("Location: login.php");
    exit();
}

$username = $_SESSION['username'];
?>

<!DOCTYPE html>
<html lang="hr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Pristup odbijen</title>
    <link rel="stylesheet" href="styles.css">
</head>
<body>
    <div class="nav">
        <div class="naslov">RP ONLINE</div>
        <div class="linkovi">
            <a href="index.php">Home</a>
            <a href="clanak.php">Sport</a>
            <a href="politik.php">Politik</a>
            <a href="administrator.php">Administracija</a>
            <a href="unos.html">Unos</a>
            <a href="logout.php">Odjava</a>
        </div>
    </div>
    <div class="main">
        <div class="content">
            <div class="section">
                <h2>Pristup odbijen</h2>
                <p>Korisnik <strong><?php echo htmlspecialchars($username); ?></strong> nema administratorska prava.</p>
            </div>
        </div>
    </div>
    <div class="footer">
        © RP Digital GmbH | Alle Rechte vorbehalten
    </div>
</body>
</html>
