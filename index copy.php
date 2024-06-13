<?php
$servername = "localhost";
$username = "root";
$password = "";
$dbname = "news_baza";

$conn = new mysqli($servername, $username, $password, $dbname);

if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

$categories = ["Sport", "Politik"];
$articles = [];

foreach ($categories as $category) {
    $sql = "SELECT * FROM news WHERE category='$category' AND display=1";
    $result = $conn->query($sql);
    $articles[$category] = $result->fetch_all(MYSQLI_ASSOC);
}

$conn->close();
?>
<!DOCTYPE html>
<html lang="de">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>RP Online</title>
    <link rel="stylesheet" href="pocetna.css">
</head>
<body>
    <div class="header">
        <h1>RP ONLINE</h1>
    </div>
    <div class="nav">
        <a href="index.php">Home</a>
        <a href="clanak.php">Sport</a>
        <a href="politik.php">Politik</a>
        <a href="administrator.php">Administracija</a>
        <a href="unos.html">Unos</a>
    </div>
    <div class="main">
        <div class="content">
            <?php foreach ($categories as $category): ?>
                <div class="section">
                    <h2><?php echo $category; ?></h2>
                    <?php if (!empty($articles[$category])): ?>
                        <?php foreach ($articles[$category] as $article): ?>
                            <div class="article">
                                <img src="<?php echo $article['image_path']; ?>" alt="<?php echo $article['title']; ?>">
                                <div>
                                    <h3><?php echo $article['title']; ?></h3>
                                    <p><?php echo $article['summary']; ?></p>
                                </div>
                            </div>
                        <?php endforeach; ?>
                    <?php else: ?>
                        <p>Nema dostupnih vijesti u ovoj kategoriji.</p>
                    <?php endif; ?>
                </div>
            <?php endforeach; ?>
        </div>
    </div>
    <div class="footer">
        © RP Digital GmbH | Alle Rechte vorbehalten
    </div>
</body>
</html>
