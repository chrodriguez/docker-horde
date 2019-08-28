<?php
$backends['imap']['disabled'] = strcasecmp(isset($_ENV['INGO_IMAP_DISABLED'])?$_ENV['INGO_IMAP_DISABLED']:'true','true') == 0;
$backends['sieve']['disabled'] = strcasecmp(isset($_ENV['INGO_SIEVE_DISABLED'])?$_ENV['INGO_SIEVE_DISABLED']:'false','true') == 0;
$backends['sieve']['transport'][Ingo::RULE_ALL]['params']['hostspec'] = $_ENV['INGO_SIEVE_HOST'];
$backends['sieve']['transport'][Ingo::RULE_ALL]['params']['usetls'] = strcasecmp(isset($_ENV['INGO_SIEVE_USETLS'])?$_ENV['INGO_SIEVE_USETLS']:'true','true') == 0;
$backends['sieve']['script'][Ingo::RULE_ALL]['params']['utf8'] = strcasecmp(isset($_ENV['INGO_SIEVE_UTF8'])?$_ENV['INGO_SIEVE_UTF8']:'true','true') == 0;
