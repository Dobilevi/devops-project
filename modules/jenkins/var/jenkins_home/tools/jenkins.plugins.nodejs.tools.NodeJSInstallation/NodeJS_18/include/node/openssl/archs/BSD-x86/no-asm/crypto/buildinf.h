/*
 * WARNING: do not edit!
 * Generated by util/mkbuildinf.pl
 *
 * Copyright 2014-2017 The OpenSSL Project Authors. All Rights Reserved.
 *
 * Licensed under the Apache License 2.0 (the "License").  You may not use
 * this file except in compliance with the License.  You can obtain a copy
 * in the file LICENSE in the source distribution or at
 * https://www.openssl.org/source/license.html
 */

#define PLATFORM "platform: BSD-x86"
#define DATE "built on: Mon Sep 30 17:05:57 2024 UTC"

/*
 * Generate compiler_flags as an array of individual characters. This is a
 * workaround for the situation where CFLAGS gets too long for a C90 string
 * literal
 */
static const char compiler_flags[] = {
    'c','o','m','p','i','l','e','r',':',' ','c','c',' ','-','f','P',
    'I','C',' ','-','p','t','h','r','e','a','d',' ','-','W','a','l',
    'l',' ','-','O','3',' ','-','f','o','m','i','t','-','f','r','a',
    'm','e','-','p','o','i','n','t','e','r',' ','-','D','L','_','E',
    'N','D','I','A','N',' ','-','D','O','P','E','N','S','S','L','_',
    'P','I','C',' ','-','D','_','T','H','R','E','A','D','_','S','A',
    'F','E',' ','-','D','_','R','E','E','N','T','R','A','N','T',' ',
    '-','D','O','P','E','N','S','S','L','_','B','U','I','L','D','I',
    'N','G','_','O','P','E','N','S','S','L',' ','-','D','N','D','E',
    'B','U','G','\0'
};
