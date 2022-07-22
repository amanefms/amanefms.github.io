<html>
<table border = "1">
    <tr><td>名前</td><td>メッセージ</td></tr>
<?php
if(isset($_POST["namae"])){
    $name = $_POST["namae"];
    $message = $_POST["message"];
    $mysqli = new mysqli("localhost", "nakamura-lab", "n1k2m3r4fms");
    $mysqli->set_charset("utf8");
    $mysqli->select_db("fukami_db");
    $sql = "insert into BBS_TABLE (Name, Message) values (\"" . $name . "\" , \"" . $message . "\")";
    $mysqli->query($sql);
    $results = $mysqli->query("select name, message from BBS_TABLE");
    while($line = $results->fetch_array ( MYSQLI_BOTH )){
        echo "<tr><td>" . $line["name"] . "</td>";
        echo "<td>" . $line["message"] . "</td></tr>";
    }
    $mysqli->close();
}
?>
</table>
<form method="POST" action="dbtest.php">
名前<input type="text" name="namae">
</br>
メッセージ<input type="text" name="message">
<input type="submit">
</form>
</html>