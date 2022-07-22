<heml>
<link rel="stylesheet" type="text/css" href="vending_machine.css">
<body>
<?php
    function judge($price){
        if(isset($_GET["in_money"])){
            $in_money = $_GET["in_money"];
            if($in_money >= $price){
                ?><th class="type0">
                <?php
            }else{
                ?>
                <th class="type1">
                <?php
            }
        }
        else{
            ?>
            <th class="type1">
            <?php
        }
        echo "<div>". $price."円</div></th>";
    }
?>
    <table>
    <tr>
    <td>
        <img src="water.png">
    </td>
    <td>
        <img src="u-rontya.png">
    </td>
    <td>
        <img src="sports.png">
    </td>
    </tr>
    <?php
    judge(50);
    judge(80);
    judge(90);
    ?>
    </tr>
    <tr>
    <td>
        <img src="jasmin.png">
    </td>
    <td>
        <img src="greentea.png">
    </td>
    <td>
        <img src="energy.png">
    </td>
    </tr>
    <tr>
    <?php
    judge(90);
    judge(80);
    judge(150);
    ?>
    </tr>
    <tr>
    <td>
        <img src="cola.png">
    </td>
    <td>
        <img src="coffee.png">
    </td>
    <td>
        <img src="basilseed.png">
    </td>
    </tr>
    <tr>
    <?php
    judge(110);
    judge(100);
    judge(200);
    ?>
    </tr>
    </table>
    <form method="GET" action="vending_machine.php"><div>お金を入れてね</div><input type="text" name="in_money"><input type="submit">
</body>
</heml>
<html>