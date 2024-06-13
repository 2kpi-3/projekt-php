<?php

if ($_SERVER['REQUEST_METHOD'] == 'POST') {

    $servername = "localhost";
    $username = "root";
    $password = "";
    $dbname = "news_baza";

    $conn = new mysqli($servername, $username, $password, $dbname);

    if ($conn->connect_error) {
        die("Connection failed: " . $conn->connect_error);        
    }

    $title = $conn->real_escape_string($_POST['title']);
    $summary = $conn->real_escape_string($_POST['summary']);
    $content = $conn->real_escape_string($_POST['content']);
    $category = $conn->real_escape_string($_POST['category']);
    $display = isset($_POST['display']) ? 1 : 0;
    $image = $_FILES['image']['name'];
    $target_file = basename($image);
    $uploadOk = 1;
    $imageFileType = strtolower(pathinfo($target_file, PATHINFO_EXTENSION));


    $check = getimagesize($_FILES['image']['tmp_name']);
    if ($check !== false) {
        $uploadOk = 1;
    } else {
        echo "File is not an image.";
        $uploadOk = 0;
    }

    if ($_FILES['image']['size'] > 500000) {
        echo "Sorry, your file is too large.";
        $uploadOk = 0;
    }

    if ($imageFileType != "jpg" && $imageFileType != "png" && $imageFileType != "jpeg" && $imageFileType != "gif") {
        echo "Sorry, only JPG, JPEG, PNG & GIF files are allowed.";
        $uploadOk = 0;
    }

    if ($uploadOk == 0) {
        echo "Sorry, your file was not uploaded.";
    } else {
        if (move_uploaded_file($_FILES['image']['tmp_name'], $target_file)) {
            $sql = "INSERT INTO news (title, summary, content, category, image_path, display) VALUES ('$title', '$summary', '$content', '$category', '$target_file', '$display')";

            if ($conn->query($sql) === TRUE) {
                echo "New record created successfully";
            } else {
                echo "Error: " . $sql . "<br>" . $conn->error;
            }
        } else {
            echo "Sorry, there was an error uploading your file.";
        }
    }

    $conn->close();
}
?>

<!DOCTYPE html>
<html lang="de">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Unos - RP Online</title>
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
                <h2>Unos nove vijesti ili proizvoda</h2>
                <form action="" method="post" enctype="multipart/form-data">
                    <label for="title">Naslov:</label>
                    <input type="text" id="title" name="title" required>

                    <label for="summary">Kratki sažetak:</label>
                    <textarea id="summary" name="summary" rows="3" cols="50" required></textarea>

                    <label for="content">Sadržaj:</label>
                    <textarea id="content" name="content" rows="10" cols="50" required></textarea>

                    <label for="category">Kategorija:</label>
                    <select id="category" name="category" required>
                        <option value="Politik">Politik</option>
                        <option value="Sport">Sport</option>
                        <option value="Administracija">Administracija</option>
                    </select>

                    <label for="image">Odaberite sliku:</label>
                    <input type="file" id="image" name="image" required>

                    <label for="display">Prikazati na stranici:</label>
                    <input type="checkbox" id="display" name="display" value="yes">

                    <input type="submit" value="Submit">
                </form>
            </div>
        </div>
    </div>

    <div class="footer">
        © RP Digital GmbH | Alle Rechte vorbehalten
    </div>
</body>

</html>
