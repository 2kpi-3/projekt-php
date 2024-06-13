<?php
session_start();

if (!isset($_SESSION['username'])) {
    header("Location: login.php");
    exit();
}

$servername = "localhost";
$db_username = "root";
$db_password = "";
$dbname = "news_baza";

$conn = new mysqli($servername, $db_username, $db_password, $dbname);

if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

$username = $_SESSION['username'];
$stmt = $conn->prepare("SELECT admin FROM korisnik WHERE username=?");
$stmt->bind_param("s", $username);
$stmt->execute();
$stmt->bind_result($admin);
$stmt->fetch();
$stmt->close();

if ($admin != 1) {
    header("Location: no_access.php");
    exit();
}

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    if (isset($_POST['delete'])) {
        $id = $_POST['id'];
        $stmt = $conn->prepare("DELETE FROM news WHERE id=?");
        $stmt->bind_param("i", $id);
        $stmt->execute();
        $stmt->close();
    }

    if (isset($_POST['update'])) {
        $id = $_POST['id'];
        $title = $_POST['title'];
        $summary = $_POST['summary'];
        $content = $_POST['content'];
        $category = $_POST['category'];
        $display = isset($_POST['display']) ? 1 : 0;

        $stmt = $conn->prepare("UPDATE news SET title=?, summary=?, content=?, category=?, display=? WHERE id=?");
        $stmt->bind_param("ssssii", $title, $summary, $content, $category, $display, $id);
        $stmt->execute();
        $stmt->close();
    }
}

$sql = "SELECT * FROM news";
$result = $conn->query($sql);
?>

<!DOCTYPE html>
<html lang="hr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Administrator - RP Online</title>
    <link rel="stylesheet" href="styles.css">
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
                <h2>Upravljanje vijestima</h2>
                <table border="1">
                    <tr>
                        <th>ID</th>
                        <th>Naslov</th>
                        <th>Kratki sažetak</th>
                        <th>Sadržaj</th>
                        <th>Kategorija</th>
                        <th>Slika</th>
                        <th>Prikaz</th>
                        <th>Akcije</th>
                    </tr>
                    <?php
                    if ($result->num_rows > 0) {
                        while($row = $result->fetch_assoc()) {
                            echo "<tr>
                                <form method='POST'>
                                    <td><input type='hidden' name='id' value='" . htmlspecialchars($row['id']) . "'>" . htmlspecialchars($row['id']) . "</td>
                                    <td><input type='text' name='title' value='" . htmlspecialchars($row['title']) . "'></td>
                                    <td><textarea name='summary'>" . htmlspecialchars($row['summary']) . "</textarea></td>
                                    <td><textarea name='content'>" . htmlspecialchars($row['content']) . "</textarea></td>
                                    <td>
                                        <select name='category'>
                                            <option value='Politik' " . ($row['category'] == 'Politik' ? 'selected' : '') . ">Politik</option>
                                            <option value='Sport' " . ($row['category'] == 'Sport' ? 'selected' : '') . ">Sport</option>
                                            <option value='Administracija' " . ($row['category'] == 'Administracija' ? 'selected' : '') . ">Administracija</option>
                                        </select>
                                    </td>
                                    <td>" . htmlspecialchars($row['image_path']) . "</td>
                                    <td><input type='checkbox' name='display' " . ($row['display'] == 1 ? 'checked' : '') . "></td>
                                    <td>
                                        <button type='submit' name='update'>Ažuriraj</button>
                                        <button type='submit' name='delete' onclick=\"return confirm('Jeste li sigurni da želite obrisati ovu vijest?')\">Obriši</button>
                                    </td>
                                </form>
                            </tr>";
                        }
                    } else {
                        echo "<tr><td colspan='8'>Nema vijesti</td></tr>";
                    }
                    $conn->close();
                    ?>
                </table>
            </div>
        </div>
    </div>
    <div class="footer">
        © RP Digital GmbH | Alle Rechte vorbehalten
    </div>
</body>
</html>
