<html>
<body>
    <form action="bbs.php" method="get">ニックネーム<input type="text" name="nickname"></br>
    メールアドレス<input type="text" name="mailadress"></br>
    メッセージ<input type="text" name="message">
    <input type="submit">
    </form>
    入力情報</br>
    <table border="1">
    <tr><th>ニックネーム </th><td><?php
    echo $_GET["nickname"];
    ?></br></td></tr>
    <tr><th>メールアドレス </th><td><?php
    echo $_GET["mailadress"];
    ?></td></tr>
    <tr><th>メッセージ </th><td><?php
    echo $_GET["message"];
    ?></td></tr>
    </table>
</body>
</html>