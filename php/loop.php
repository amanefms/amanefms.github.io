<html>
    <form method="get" action="loop.php">1から</br>
    <input type="text" name="number"><input type="submit"></br>
    までの和は
<?php
if(isset($_GET["number"])){
    $total1=0;
    $number=$_GET["number"];
    for($i=1; $i<=$number; $i++){
        $total1+=$i;
    }
    echo $total1;
}
for($i=1; $i<=1000; $i++){
    echo "</br>".$i;
}
$total2=0;
for($i=0; $i<=100000; $i++){
    $total2+=$i;
}
echo "1から10万までの和は".$total;
?>
</html>