<html>
    <body>
        台形の面積を求めます</br>
        <form action="test.php" method="get"> 上底=
        <input type="text" name="joutei"></br>
        下底=
        <input type="text" name="katei">
        高さ＝
        <input type="text" name="takasa">
        <input type="submit">
        </form>
        <?php
        echo ($_GET["joutei"]+$_GET["katei"])*$_GET["takasa"]/2;
        ?></br>
        あなたを占います
        <form action="test.php" method="get">数字を入力してください<input type="text" name="uranai">
        <input type="submit">
        <?php
        $number = $_GET["uranai"];
        $win = rand(1,10);
        if( $number==$win ){
            echo "大吉";
        }
        else{
            echo "凶";
        }
        ?></br>
    </body>
</html>