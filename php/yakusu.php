<html>
    <form method="GET" action="yakusu.php">約数を表示します.数字を入力してください
        <input type="text" name="number">
        <input type="submit">
<?php
if(isset($_GET["number"])){
    $number = $_GET["number"];
    echo $number . "の約数は"."</br>";
    for($i=1; $i<=$number; $i++){
        if($number%$i == 0){
            echo $i."</br>";
        }
    }
}
?>
</html>