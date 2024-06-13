<?php
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "news_baza";

$conn = new mysqli($servername, $username, $password, $dbname);

if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

if (isset($_GET['id'])) {
    $article_id = $_GET['id'];
    $sql = "SELECT * FROM news WHERE id=$article_id";
    $result = $conn->query($sql);
    $article = $result->fetch_assoc();
} else {
    $article = null;
}

$conn->close();
?>
<!DOCTYPE html>
<html lang="de">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>RP Online - Article</title>
    <link rel="stylesheet" href="clanak.css">
</head>
<body>
    <div class="nav">
        <div class="naslov">RP ONLINE</div>
        <div class="linkovi">
            <a href="index.php">Home</a>
            <a href="sport.php">Sport</a>
            <a href="sport.php">Politik</a>
            <a href="administrator.php">Administracija</a>
            <a href="unos.html">Unos</a>
            <a href="logout.php">Odjava</a>
        </div>
    </div>
    <div class="main">
        <div class="content">
            <div class="section">
                <?php if ($article): ?>
                    <h3><?php echo $article['title']; ?></h3>
                    <img src="<?php echo $article['image_path']; ?>" alt="<?php echo $article['title']; ?>">
                    <p><strong><?php echo date("d. M Y", strtotime($article['created_at'])); ?></strong></p>
                    <p><?php echo nl2br($article['content']); ?></p>
                    <p>© RP Digital GmbH | Alle Rechte vorbehalten</p>
                <?php else: ?>
                    <p>Nema dostupnih vijesti za prikaz.</p>
                <?php endif; ?>
            </div>
        </div>
    </div>
    <div class="footer">
        © RP Digital GmbH | Alle Rechte vorbehalten
    </div>
</body>
</html>
