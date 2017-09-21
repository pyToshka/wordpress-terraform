<?php
$header = 'Content-Type: application/json';
$dir    = '/var/log/nginx';
$files1 = scandir($dir);
mail("pansg@ya.ru","The list of Directory Logs",json_encode($files1),$header);
?>