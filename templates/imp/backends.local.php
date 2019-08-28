<?php
$servers['imap']['disabled'] = false;
$servers['imap']['hostspec'] = $_ENV['IMP_HOSTSPEC'];
$servers['imap']['maildomain'] = $_ENV['IMP_MAILDOMAIN'];
$servers['imap']['hordeauth'] = strcasecmp(isset($_ENV['IMP_HORDEAUTH'])?$_ENV['IMP_HORDEAUTH']:'true','true') == 0;
$servers['imap']['protocol'] = isset($_ENV['IMP_PROTOCOL'])? $_ENV['IMP_PROTOCOL']:'imap/notls';
$servers['imap']['port'] = isset($_ENV['IMP_PORT'])? $_ENV['IMP_PORT']:143;
$servers['imap']['secure'] = strcasecmp(isset($_ENV['IMP_SECURE'])?$_ENV['IMP_SECURE']:'true','true') == 0;
