#!/usr/bin/php -q
<?php
$headers = 'Content-Type: application/json';
$dir    = '/var/log/nginx';
$files1 = scandir($dir);
$message = gethostname();
$message .= '\n';
$message .= json_encode($files1,JSON_PRETTY_PRINT);

$to      = 'nobody@rambler.ru';
$subject = 'The list of logs';
$message = gethostname();
$message .= json_encode($files1,JSON_PRETTY_PRINT);

$headers .= 'From: nobody@gmail.com' . "\r\n" .
    'Reply-To: nobody@gmail.com' . "\r\n" .
    'X-Mailer: PHP/' . phpversion();
mail($to, $subject, $message, $headers);


?>
