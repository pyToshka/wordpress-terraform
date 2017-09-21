<?php
header('Content-type: application/json');
echo json_encode('owner: ' . get_current_user(),JSON_PRETTY_PRINT);
echo json_encode('directory: ' . basename(dirname(__FILE__)),JSON_PRETTY_PRINT);

echo json_encode('node_name:' . gethostname(),JSON_PRETTY_PRINT);
?>