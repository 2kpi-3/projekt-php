<?php
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "news_baza";

$conn = new mysqli($servername, $username, $password, $dbname);

if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}


$sql = "SELECT * FROM news WHERE display=0 AND category='Politik'";
$result = $conn->query($sql);
?>

<!DOCTYPE html>
<html lang="hr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>RP Online - Clanak</title>
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
            <?php
            if ($result->num_rows > 0) {
                while($row = $result->fetch_assoc()) {
                    echo "<div class='section'>";
                    if (!empty($row["image_path"])) {
                        echo "<img src='" . $row["image_path"] . "' alt='" . $row["title"] . "' />";
                    }
                    echo "<h2>" . $row["title"] . "</h2>";
                    echo "<p>" . $row["summary"] . "</p>";
                    echo "<p><strong>" . date("d. M Y", strtotime($row['created_at'])) . "</strong></p>";
                    echo "</div>";
                }
            } else {
                echo "<p>Nema vijesti za prikaz.</p>";
            }
            ?>
        </div>
    </div>
    <div class="footer">
        © RP Digital GmbH | Alle Rechte vorbehalten
    </div>
</body>
</html>

<?php
$conn->close();
?>
