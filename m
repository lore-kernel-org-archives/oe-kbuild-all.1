Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98DF81ACEDA
	for <oe-kbuild-all@lists.linux.dev>; Sun, 23 Nov 2025 18:14:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763921662; cv=none; b=lOk31zuilGC9trmxyM4bWf4wc0wJxE6XlPlVBZ5pQKefwaQTU0u2wSzfyVpXehLX+6A+lfjlyWaZNl+wzvU6eInv/JJtrLgVaZaoEhbqBN6stKK1uH0opLHndNjaWhr+JTN9bpQZSUzOI2lygsgF5Xa3xPIeXHxnKaj58ykMh0E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763921662; c=relaxed/simple;
	bh=joYfbvE5iAzggM+i/jT6vepfONG0mAX6qQgMq1c0144=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=HehTSFIK6GgXEQn7TvUAuClu6cSLfiLhGZB3tSlmWgqa0RoDYZpkZJ13XiQA66tOaeMSBNeYUN+8YNyBPrX2+57IMCzm7Vsv7MAYYcqubZGvpW+1poa/AYSHCsBekuVEHna1Hmhf5uRc1CeMZN1Kjx0gCBfd2fgF1yKdoBEbZfA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ya+jqPMT; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ya+jqPMT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763921659; x=1795457659;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=joYfbvE5iAzggM+i/jT6vepfONG0mAX6qQgMq1c0144=;
  b=Ya+jqPMTh4fG4CPsQofIMVI1jWcrLvC53zeX73mmBVulTnW+qhRYdyVm
   fYbytK5YBm7U1S5mmDIr1QhWI5aSlx4x+oau0GhFyffESy7ejbR3eqhHV
   gKdPCBmOpDxxV0cBe7lBxEjEK3+S2S2i9VsRL5CHnXpFJdRLPz750ROs+
   vlbu2NBaT0vVRBcEznW4mOKsl0soY1yGIHoQoLAAkl+fnY28EMe+KWLVF
   3KwUt1NNU9fYQf3mgpLMik99y8dC/ytuvI2p+UXe5VfbLU3FMSKRPgMAC
   XoQEmkGgJ8kRC3/QcChNso0CEk6CwDkrSsZYQPdlxhUIJwKnNddGOOYzG
   w==;
X-CSE-ConnectionGUID: OgoECpJqTtSRfVixqCJXVg==
X-CSE-MsgGUID: Y25upm+aQBi4NH1soPRozw==
X-IronPort-AV: E=McAfee;i="6800,10657,11622"; a="91418103"
X-IronPort-AV: E=Sophos;i="6.20,221,1758610800"; 
   d="scan'208";a="91418103"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2025 10:14:19 -0800
X-CSE-ConnectionGUID: KALPiXI/REC0zrzqnqEbfQ==
X-CSE-MsgGUID: sZ8g+f0+Q62IrZ4uQrwL/A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,221,1758610800"; 
   d="scan'208";a="191811594"
Received: from igk-lkp-server01.igk.intel.com (HELO 1f7de368ad0d) ([10.211.93.152])
  by fmviesa007.fm.intel.com with ESMTP; 23 Nov 2025 10:14:18 -0800
Received: from kbuild by 1f7de368ad0d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vNEbH-0000000002j-2iYC;
	Sun, 23 Nov 2025 18:14:15 +0000
Date: Sun, 23 Nov 2025 19:13:43 +0100
From: kernel test robot <lkp@intel.com>
To: Eric Biggers <ebiggers@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [ebiggers:more-at-least-decorations-v1 9/9]
 lib/crypto/tests/sha224_kunit.c:13:20: error: implicit declaration of
 function 'sha224_final'; did you mean 'sha224_init'?
Message-ID: <202511231914.rcuwcz4S-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ebiggers/linux.git more-at-least-decorations-v1
head:   da707520ed1dbaed0ef9666f7adfac8910423a1f
commit: da707520ed1dbaed0ef9666f7adfac8910423a1f [9/9] lib/crypto: sha2: Add at_least decoration to fixed-size array params
config: x86_64-rhel-9.4-kunit (https://download.01.org/0day-ci/archive/20251123/202511231914.rcuwcz4S-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251123/202511231914.rcuwcz4S-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511231914.rcuwcz4S-lkp@intel.com/

All errors (new ones prefixed by >>):

         |                              ^~~~~~~~
   include/crypto/sha2.h:396:38: error: expected ']' before numeric constant
     396 |                      u8 out1[at_least SHA256_DIGEST_SIZE],
         |                                      ^
         |                                      ]
   include/crypto/sha2.h:397:22: error: expected ';', ',' or ')' before 'u8'
     397 |                      u8 out2[at_least SHA256_DIGEST_SIZE]);
         |                      ^~
   include/crypto/sha2.h:495:31: error: 'at_least' undeclared here (not in a function)
     495 |                        u8 out[at_least SHA256_DIGEST_SIZE]);
         |                               ^~~~~~~~
   include/crypto/sha2.h:495:39: error: expected ']' before numeric constant
     495 |                        u8 out[at_least SHA256_DIGEST_SIZE]);
         |                                       ^
         |                                       ]
   include/crypto/sha2.h:510:25: error: 'at_least' undeclared here (not in a function)
     510 |                  u8 out[at_least SHA256_DIGEST_SIZE]);
         |                         ^~~~~~~~
   include/crypto/sha2.h:510:33: error: expected ']' before numeric constant
     510 |                  u8 out[at_least SHA256_DIGEST_SIZE]);
         |                                 ^
         |                                 ]
   include/crypto/sha2.h:527:37: error: 'at_least' undeclared here (not in a function)
     527 |                              u8 out[at_least SHA256_DIGEST_SIZE]);
         |                                     ^~~~~~~~
   include/crypto/sha2.h:527:45: error: expected ']' before numeric constant
     527 |                              u8 out[at_least SHA256_DIGEST_SIZE]);
         |                                             ^
         |                                             ]
   include/crypto/sha2.h:606:50: error: 'at_least' undeclared here (not in a function)
     606 | void sha384_final(struct sha384_ctx *ctx, u8 out[at_least SHA384_DIGEST_SIZE]);
         |                                                  ^~~~~~~~
   include/crypto/sha2.h:606:58: error: expected ']' before numeric constant
     606 | void sha384_final(struct sha384_ctx *ctx, u8 out[at_least SHA384_DIGEST_SIZE]);
         |                                                          ^
         |                                                          ]
   include/crypto/sha2.h:616:48: error: 'at_least' undeclared here (not in a function)
     616 | void sha384(const u8 *data, size_t len, u8 out[at_least SHA384_DIGEST_SIZE]);
         |                                                ^~~~~~~~
   include/crypto/sha2.h:616:56: error: expected ']' before numeric constant
     616 | void sha384(const u8 *data, size_t len, u8 out[at_least SHA384_DIGEST_SIZE]);
         |                                                        ^
         |                                                        ]
   include/crypto/sha2.h:704:31: error: 'at_least' undeclared here (not in a function)
     704 |                        u8 out[at_least SHA384_DIGEST_SIZE]);
         |                               ^~~~~~~~
   include/crypto/sha2.h:704:39: error: expected ']' before numeric constant
     704 |                        u8 out[at_least SHA384_DIGEST_SIZE]);
         |                                       ^
         |                                       ]
   include/crypto/sha2.h:719:25: error: 'at_least' undeclared here (not in a function)
     719 |                  u8 out[at_least SHA384_DIGEST_SIZE]);
         |                         ^~~~~~~~
   include/crypto/sha2.h:719:33: error: expected ']' before numeric constant
     719 |                  u8 out[at_least SHA384_DIGEST_SIZE]);
         |                                 ^
         |                                 ]
   include/crypto/sha2.h:736:37: error: 'at_least' undeclared here (not in a function)
     736 |                              u8 out[at_least SHA384_DIGEST_SIZE]);
         |                                     ^~~~~~~~
   include/crypto/sha2.h:736:45: error: expected ']' before numeric constant
     736 |                              u8 out[at_least SHA384_DIGEST_SIZE]);
         |                                             ^
         |                                             ]
   include/crypto/sha2.h:781:50: error: 'at_least' undeclared here (not in a function)
     781 | void sha512_final(struct sha512_ctx *ctx, u8 out[at_least SHA512_DIGEST_SIZE]);
         |                                                  ^~~~~~~~
   include/crypto/sha2.h:781:58: error: expected ']' before numeric constant
     781 | void sha512_final(struct sha512_ctx *ctx, u8 out[at_least SHA512_DIGEST_SIZE]);
         |                                                          ^
         |                                                          ]
   include/crypto/sha2.h:791:48: error: 'at_least' undeclared here (not in a function)
     791 | void sha512(const u8 *data, size_t len, u8 out[at_least SHA512_DIGEST_SIZE]);
         |                                                ^~~~~~~~
   include/crypto/sha2.h:791:56: error: expected ']' before numeric constant
     791 | void sha512(const u8 *data, size_t len, u8 out[at_least SHA512_DIGEST_SIZE]);
         |                                                        ^
         |                                                        ]
   include/crypto/sha2.h:879:31: error: 'at_least' undeclared here (not in a function)
     879 |                        u8 out[at_least SHA512_DIGEST_SIZE]);
         |                               ^~~~~~~~
   include/crypto/sha2.h:879:39: error: expected ']' before numeric constant
     879 |                        u8 out[at_least SHA512_DIGEST_SIZE]);
         |                                       ^
         |                                       ]
   include/crypto/sha2.h:894:25: error: 'at_least' undeclared here (not in a function)
     894 |                  u8 out[at_least SHA512_DIGEST_SIZE]);
         |                         ^~~~~~~~
   include/crypto/sha2.h:894:33: error: expected ']' before numeric constant
     894 |                  u8 out[at_least SHA512_DIGEST_SIZE]);
         |                                 ^
         |                                 ]
   include/crypto/sha2.h:911:37: error: 'at_least' undeclared here (not in a function)
     911 |                              u8 out[at_least SHA512_DIGEST_SIZE]);
         |                                     ^~~~~~~~
   include/crypto/sha2.h:911:45: error: expected ']' before numeric constant
     911 |                              u8 out[at_least SHA512_DIGEST_SIZE]);
         |                                             ^
         |                                             ]
   lib/crypto/tests/hash-test-template.h: In function 'test_hash_test_vectors':
>> lib/crypto/tests/sha224_kunit.c:8:14: error: implicit declaration of function 'sha224' [-Wimplicit-function-declaration]
       8 | #define HASH sha224
         |              ^~~~~~
   lib/crypto/tests/hash-test-template.h:114:17: note: in expansion of macro 'HASH'
     114 |                 HASH(test_buf, data_len, actual_hash);
         |                 ^~~~
   lib/crypto/tests/hash-test-template.h: In function 'test_hash_all_lens_up_to_4096':
>> lib/crypto/tests/sha224_kunit.c:13:20: error: implicit declaration of function 'sha224_final'; did you mean 'sha224_init'? [-Wimplicit-function-declaration]
      13 | #define HASH_FINAL sha224_final
         |                    ^~~~~~~~~~~~
   lib/crypto/tests/hash-test-template.h:140:9: note: in expansion of macro 'HASH_FINAL'
     140 |         HASH_FINAL(&ctx, hash);
         |         ^~~~~~~~~~
   lib/crypto/tests/hash-test-template.h: In function 'test_hmac':
>> lib/crypto/tests/sha224_kunit.c:21:26: error: implicit declaration of function 'hmac_sha224_usingrawkey'; did you mean 'hmac_sha224_init_usingrawkey'? [-Wimplicit-function-declaration]
      21 | #define HMAC_USINGRAWKEY hmac_sha224_usingrawkey
         |                          ^~~~~~~~~~~~~~~~~~~~~~~
   lib/crypto/tests/hash-test-template.h:515:17: note: in expansion of macro 'HMAC_USINGRAWKEY'
     515 |                 HMAC_USINGRAWKEY(raw_key, key_len, test_buf, data_len, mac);
         |                 ^~~~~~~~~~~~~~~~
>> lib/crypto/tests/sha224_kunit.c:20:14: error: implicit declaration of function 'hmac_sha224'; did you mean 'hmac_sha224_init'? [-Wimplicit-function-declaration]
      20 | #define HMAC hmac_sha224
         |              ^~~~~~~~~~~
   lib/crypto/tests/hash-test-template.h:520:17: note: in expansion of macro 'HMAC'
     520 |                 HMAC(&key, test_buf, data_len, mac2);
         |                 ^~~~
>> lib/crypto/tests/sha224_kunit.c:19:20: error: implicit declaration of function 'hmac_sha224_final'; did you mean 'hmac_sha224_init'? [-Wimplicit-function-declaration]
      19 | #define HMAC_FINAL hmac_sha224_final
         |                    ^~~~~~~~~~~~~~~~~
   lib/crypto/tests/hash-test-template.h:525:9: note: in expansion of macro 'HMAC_FINAL'
     525 |         HMAC_FINAL(&ctx, mac);
         |         ^~~~~~~~~~
--
         |                              ^~~~~~~~
   include/crypto/sha2.h:396:38: error: expected ']' before numeric constant
     396 |                      u8 out1[at_least SHA256_DIGEST_SIZE],
         |                                      ^
         |                                      ]
   include/crypto/sha2.h:397:22: error: expected ';', ',' or ')' before 'u8'
     397 |                      u8 out2[at_least SHA256_DIGEST_SIZE]);
         |                      ^~
   include/crypto/sha2.h:495:31: error: 'at_least' undeclared here (not in a function)
     495 |                        u8 out[at_least SHA256_DIGEST_SIZE]);
         |                               ^~~~~~~~
   include/crypto/sha2.h:495:39: error: expected ']' before numeric constant
     495 |                        u8 out[at_least SHA256_DIGEST_SIZE]);
         |                                       ^
         |                                       ]
   include/crypto/sha2.h:510:25: error: 'at_least' undeclared here (not in a function)
     510 |                  u8 out[at_least SHA256_DIGEST_SIZE]);
         |                         ^~~~~~~~
   include/crypto/sha2.h:510:33: error: expected ']' before numeric constant
     510 |                  u8 out[at_least SHA256_DIGEST_SIZE]);
         |                                 ^
         |                                 ]
   include/crypto/sha2.h:527:37: error: 'at_least' undeclared here (not in a function)
     527 |                              u8 out[at_least SHA256_DIGEST_SIZE]);
         |                                     ^~~~~~~~
   include/crypto/sha2.h:527:45: error: expected ']' before numeric constant
     527 |                              u8 out[at_least SHA256_DIGEST_SIZE]);
         |                                             ^
         |                                             ]
   include/crypto/sha2.h:606:50: error: 'at_least' undeclared here (not in a function)
     606 | void sha384_final(struct sha384_ctx *ctx, u8 out[at_least SHA384_DIGEST_SIZE]);
         |                                                  ^~~~~~~~
   include/crypto/sha2.h:606:58: error: expected ']' before numeric constant
     606 | void sha384_final(struct sha384_ctx *ctx, u8 out[at_least SHA384_DIGEST_SIZE]);
         |                                                          ^
         |                                                          ]
   include/crypto/sha2.h:616:48: error: 'at_least' undeclared here (not in a function)
     616 | void sha384(const u8 *data, size_t len, u8 out[at_least SHA384_DIGEST_SIZE]);
         |                                                ^~~~~~~~
   include/crypto/sha2.h:616:56: error: expected ']' before numeric constant
     616 | void sha384(const u8 *data, size_t len, u8 out[at_least SHA384_DIGEST_SIZE]);
         |                                                        ^
         |                                                        ]
   include/crypto/sha2.h:704:31: error: 'at_least' undeclared here (not in a function)
     704 |                        u8 out[at_least SHA384_DIGEST_SIZE]);
         |                               ^~~~~~~~
   include/crypto/sha2.h:704:39: error: expected ']' before numeric constant
     704 |                        u8 out[at_least SHA384_DIGEST_SIZE]);
         |                                       ^
         |                                       ]
   include/crypto/sha2.h:719:25: error: 'at_least' undeclared here (not in a function)
     719 |                  u8 out[at_least SHA384_DIGEST_SIZE]);
         |                         ^~~~~~~~
   include/crypto/sha2.h:719:33: error: expected ']' before numeric constant
     719 |                  u8 out[at_least SHA384_DIGEST_SIZE]);
         |                                 ^
         |                                 ]
   include/crypto/sha2.h:736:37: error: 'at_least' undeclared here (not in a function)
     736 |                              u8 out[at_least SHA384_DIGEST_SIZE]);
         |                                     ^~~~~~~~
   include/crypto/sha2.h:736:45: error: expected ']' before numeric constant
     736 |                              u8 out[at_least SHA384_DIGEST_SIZE]);
         |                                             ^
         |                                             ]
   include/crypto/sha2.h:781:50: error: 'at_least' undeclared here (not in a function)
     781 | void sha512_final(struct sha512_ctx *ctx, u8 out[at_least SHA512_DIGEST_SIZE]);
         |                                                  ^~~~~~~~
   include/crypto/sha2.h:781:58: error: expected ']' before numeric constant
     781 | void sha512_final(struct sha512_ctx *ctx, u8 out[at_least SHA512_DIGEST_SIZE]);
         |                                                          ^
         |                                                          ]
   include/crypto/sha2.h:791:48: error: 'at_least' undeclared here (not in a function)
     791 | void sha512(const u8 *data, size_t len, u8 out[at_least SHA512_DIGEST_SIZE]);
         |                                                ^~~~~~~~
   include/crypto/sha2.h:791:56: error: expected ']' before numeric constant
     791 | void sha512(const u8 *data, size_t len, u8 out[at_least SHA512_DIGEST_SIZE]);
         |                                                        ^
         |                                                        ]
   include/crypto/sha2.h:879:31: error: 'at_least' undeclared here (not in a function)
     879 |                        u8 out[at_least SHA512_DIGEST_SIZE]);
         |                               ^~~~~~~~
   include/crypto/sha2.h:879:39: error: expected ']' before numeric constant
     879 |                        u8 out[at_least SHA512_DIGEST_SIZE]);
         |                                       ^
         |                                       ]
   include/crypto/sha2.h:894:25: error: 'at_least' undeclared here (not in a function)
     894 |                  u8 out[at_least SHA512_DIGEST_SIZE]);
         |                         ^~~~~~~~
   include/crypto/sha2.h:894:33: error: expected ']' before numeric constant
     894 |                  u8 out[at_least SHA512_DIGEST_SIZE]);
         |                                 ^
         |                                 ]
   include/crypto/sha2.h:911:37: error: 'at_least' undeclared here (not in a function)
     911 |                              u8 out[at_least SHA512_DIGEST_SIZE]);
         |                                     ^~~~~~~~
   include/crypto/sha2.h:911:45: error: expected ']' before numeric constant
     911 |                              u8 out[at_least SHA512_DIGEST_SIZE]);
         |                                             ^
         |                                             ]
   lib/crypto/tests/hash-test-template.h: In function 'test_hash_test_vectors':
>> lib/crypto/tests/sha256_kunit.c:9:14: error: implicit declaration of function 'sha256' [-Wimplicit-function-declaration]
       9 | #define HASH sha256
         |              ^~~~~~
   lib/crypto/tests/hash-test-template.h:114:17: note: in expansion of macro 'HASH'
     114 |                 HASH(test_buf, data_len, actual_hash);
         |                 ^~~~
   lib/crypto/tests/hash-test-template.h: In function 'test_hash_all_lens_up_to_4096':
>> lib/crypto/tests/sha256_kunit.c:14:20: error: implicit declaration of function 'sha256_final'; did you mean 'sha256_init'? [-Wimplicit-function-declaration]
      14 | #define HASH_FINAL sha256_final
         |                    ^~~~~~~~~~~~
   lib/crypto/tests/hash-test-template.h:140:9: note: in expansion of macro 'HASH_FINAL'
     140 |         HASH_FINAL(&ctx, hash);
         |         ^~~~~~~~~~
   lib/crypto/tests/hash-test-template.h: In function 'test_hmac':
>> lib/crypto/tests/sha256_kunit.c:22:26: error: implicit declaration of function 'hmac_sha256_usingrawkey'; did you mean 'hmac_sha256_init_usingrawkey'? [-Wimplicit-function-declaration]
      22 | #define HMAC_USINGRAWKEY hmac_sha256_usingrawkey
         |                          ^~~~~~~~~~~~~~~~~~~~~~~
   lib/crypto/tests/hash-test-template.h:515:17: note: in expansion of macro 'HMAC_USINGRAWKEY'
     515 |                 HMAC_USINGRAWKEY(raw_key, key_len, test_buf, data_len, mac);
         |                 ^~~~~~~~~~~~~~~~
>> lib/crypto/tests/sha256_kunit.c:21:14: error: implicit declaration of function 'hmac_sha256'; did you mean 'hmac_sha256_init'? [-Wimplicit-function-declaration]
      21 | #define HMAC hmac_sha256
         |              ^~~~~~~~~~~
   lib/crypto/tests/hash-test-template.h:520:17: note: in expansion of macro 'HMAC'
     520 |                 HMAC(&key, test_buf, data_len, mac2);
         |                 ^~~~
>> lib/crypto/tests/sha256_kunit.c:20:20: error: implicit declaration of function 'hmac_sha256_final'; did you mean 'hmac_sha256_init'? [-Wimplicit-function-declaration]
      20 | #define HMAC_FINAL hmac_sha256_final
         |                    ^~~~~~~~~~~~~~~~~
   lib/crypto/tests/hash-test-template.h:525:9: note: in expansion of macro 'HMAC_FINAL'
     525 |         HMAC_FINAL(&ctx, mac);
         |         ^~~~~~~~~~
   lib/crypto/tests/sha256_kunit.c: In function 'test_sha256_finup_2x':
>> lib/crypto/tests/sha256_kunit.c:83:17: error: implicit declaration of function 'sha256_finup_2x'; did you mean 'test_sha256_finup_2x'? [-Wimplicit-function-declaration]
      83 |                 sha256_finup_2x(ctx, data1, data2, data_len, hash1, hash2);
         |                 ^~~~~~~~~~~~~~~
         |                 test_sha256_finup_2x
--
         |                              ^~~~~~~~
   include/crypto/sha2.h:396:38: error: expected ']' before numeric constant
     396 |                      u8 out1[at_least SHA256_DIGEST_SIZE],
         |                                      ^
         |                                      ]
   include/crypto/sha2.h:397:22: error: expected ';', ',' or ')' before 'u8'
     397 |                      u8 out2[at_least SHA256_DIGEST_SIZE]);
         |                      ^~
   include/crypto/sha2.h:495:31: error: 'at_least' undeclared here (not in a function)
     495 |                        u8 out[at_least SHA256_DIGEST_SIZE]);
         |                               ^~~~~~~~
   include/crypto/sha2.h:495:39: error: expected ']' before numeric constant
     495 |                        u8 out[at_least SHA256_DIGEST_SIZE]);
         |                                       ^
         |                                       ]
   include/crypto/sha2.h:510:25: error: 'at_least' undeclared here (not in a function)
     510 |                  u8 out[at_least SHA256_DIGEST_SIZE]);
         |                         ^~~~~~~~
   include/crypto/sha2.h:510:33: error: expected ']' before numeric constant
     510 |                  u8 out[at_least SHA256_DIGEST_SIZE]);
         |                                 ^
         |                                 ]
   include/crypto/sha2.h:527:37: error: 'at_least' undeclared here (not in a function)
     527 |                              u8 out[at_least SHA256_DIGEST_SIZE]);
         |                                     ^~~~~~~~
   include/crypto/sha2.h:527:45: error: expected ']' before numeric constant
     527 |                              u8 out[at_least SHA256_DIGEST_SIZE]);
         |                                             ^
         |                                             ]
   include/crypto/sha2.h:606:50: error: 'at_least' undeclared here (not in a function)
     606 | void sha384_final(struct sha384_ctx *ctx, u8 out[at_least SHA384_DIGEST_SIZE]);
         |                                                  ^~~~~~~~
   include/crypto/sha2.h:606:58: error: expected ']' before numeric constant
     606 | void sha384_final(struct sha384_ctx *ctx, u8 out[at_least SHA384_DIGEST_SIZE]);
         |                                                          ^
         |                                                          ]
   include/crypto/sha2.h:616:48: error: 'at_least' undeclared here (not in a function)
     616 | void sha384(const u8 *data, size_t len, u8 out[at_least SHA384_DIGEST_SIZE]);
         |                                                ^~~~~~~~
   include/crypto/sha2.h:616:56: error: expected ']' before numeric constant
     616 | void sha384(const u8 *data, size_t len, u8 out[at_least SHA384_DIGEST_SIZE]);
         |                                                        ^
         |                                                        ]
   include/crypto/sha2.h:704:31: error: 'at_least' undeclared here (not in a function)
     704 |                        u8 out[at_least SHA384_DIGEST_SIZE]);
         |                               ^~~~~~~~
   include/crypto/sha2.h:704:39: error: expected ']' before numeric constant
     704 |                        u8 out[at_least SHA384_DIGEST_SIZE]);
         |                                       ^
         |                                       ]
   include/crypto/sha2.h:719:25: error: 'at_least' undeclared here (not in a function)
     719 |                  u8 out[at_least SHA384_DIGEST_SIZE]);
         |                         ^~~~~~~~
   include/crypto/sha2.h:719:33: error: expected ']' before numeric constant
     719 |                  u8 out[at_least SHA384_DIGEST_SIZE]);
         |                                 ^
         |                                 ]
   include/crypto/sha2.h:736:37: error: 'at_least' undeclared here (not in a function)
     736 |                              u8 out[at_least SHA384_DIGEST_SIZE]);
         |                                     ^~~~~~~~
   include/crypto/sha2.h:736:45: error: expected ']' before numeric constant
     736 |                              u8 out[at_least SHA384_DIGEST_SIZE]);
         |                                             ^
         |                                             ]
   include/crypto/sha2.h:781:50: error: 'at_least' undeclared here (not in a function)
     781 | void sha512_final(struct sha512_ctx *ctx, u8 out[at_least SHA512_DIGEST_SIZE]);
         |                                                  ^~~~~~~~
   include/crypto/sha2.h:781:58: error: expected ']' before numeric constant
     781 | void sha512_final(struct sha512_ctx *ctx, u8 out[at_least SHA512_DIGEST_SIZE]);
         |                                                          ^
         |                                                          ]
   include/crypto/sha2.h:791:48: error: 'at_least' undeclared here (not in a function)
     791 | void sha512(const u8 *data, size_t len, u8 out[at_least SHA512_DIGEST_SIZE]);
         |                                                ^~~~~~~~
   include/crypto/sha2.h:791:56: error: expected ']' before numeric constant
     791 | void sha512(const u8 *data, size_t len, u8 out[at_least SHA512_DIGEST_SIZE]);
         |                                                        ^
         |                                                        ]
   include/crypto/sha2.h:879:31: error: 'at_least' undeclared here (not in a function)
     879 |                        u8 out[at_least SHA512_DIGEST_SIZE]);
         |                               ^~~~~~~~
   include/crypto/sha2.h:879:39: error: expected ']' before numeric constant
     879 |                        u8 out[at_least SHA512_DIGEST_SIZE]);
         |                                       ^
         |                                       ]
   include/crypto/sha2.h:894:25: error: 'at_least' undeclared here (not in a function)
     894 |                  u8 out[at_least SHA512_DIGEST_SIZE]);
         |                         ^~~~~~~~
   include/crypto/sha2.h:894:33: error: expected ']' before numeric constant
     894 |                  u8 out[at_least SHA512_DIGEST_SIZE]);
         |                                 ^
         |                                 ]
   include/crypto/sha2.h:911:37: error: 'at_least' undeclared here (not in a function)
     911 |                              u8 out[at_least SHA512_DIGEST_SIZE]);
         |                                     ^~~~~~~~
   include/crypto/sha2.h:911:45: error: expected ']' before numeric constant
     911 |                              u8 out[at_least SHA512_DIGEST_SIZE]);
         |                                             ^
         |                                             ]
   lib/crypto/tests/hash-test-template.h: In function 'test_hash_test_vectors':
>> lib/crypto/tests/sha384_kunit.c:8:14: error: implicit declaration of function 'sha384' [-Wimplicit-function-declaration]
       8 | #define HASH sha384
         |              ^~~~~~
   lib/crypto/tests/hash-test-template.h:114:17: note: in expansion of macro 'HASH'
     114 |                 HASH(test_buf, data_len, actual_hash);
         |                 ^~~~
   lib/crypto/tests/hash-test-template.h: In function 'test_hash_all_lens_up_to_4096':
>> lib/crypto/tests/sha384_kunit.c:13:20: error: implicit declaration of function 'sha384_final'; did you mean 'sha384_init'? [-Wimplicit-function-declaration]
      13 | #define HASH_FINAL sha384_final
         |                    ^~~~~~~~~~~~
   lib/crypto/tests/hash-test-template.h:140:9: note: in expansion of macro 'HASH_FINAL'
     140 |         HASH_FINAL(&ctx, hash);
         |         ^~~~~~~~~~
   lib/crypto/tests/hash-test-template.h: In function 'test_hmac':
>> lib/crypto/tests/sha384_kunit.c:21:26: error: implicit declaration of function 'hmac_sha384_usingrawkey'; did you mean 'hmac_sha384_init_usingrawkey'? [-Wimplicit-function-declaration]
      21 | #define HMAC_USINGRAWKEY hmac_sha384_usingrawkey
         |                          ^~~~~~~~~~~~~~~~~~~~~~~
   lib/crypto/tests/hash-test-template.h:515:17: note: in expansion of macro 'HMAC_USINGRAWKEY'
     515 |                 HMAC_USINGRAWKEY(raw_key, key_len, test_buf, data_len, mac);
         |                 ^~~~~~~~~~~~~~~~
>> lib/crypto/tests/sha384_kunit.c:20:14: error: implicit declaration of function 'hmac_sha384'; did you mean 'hmac_sha384_init'? [-Wimplicit-function-declaration]
      20 | #define HMAC hmac_sha384
         |              ^~~~~~~~~~~
   lib/crypto/tests/hash-test-template.h:520:17: note: in expansion of macro 'HMAC'
     520 |                 HMAC(&key, test_buf, data_len, mac2);
         |                 ^~~~
>> lib/crypto/tests/sha384_kunit.c:19:20: error: implicit declaration of function 'hmac_sha384_final'; did you mean 'hmac_sha384_init'? [-Wimplicit-function-declaration]
      19 | #define HMAC_FINAL hmac_sha384_final
         |                    ^~~~~~~~~~~~~~~~~
   lib/crypto/tests/hash-test-template.h:525:9: note: in expansion of macro 'HMAC_FINAL'
     525 |         HMAC_FINAL(&ctx, mac);
         |         ^~~~~~~~~~
..


vim +13 lib/crypto/tests/sha224_kunit.c

4dcf6caddaa047 Eric Biggers 2025-07-09   7  
4dcf6caddaa047 Eric Biggers 2025-07-09  @8  #define HASH sha224
4dcf6caddaa047 Eric Biggers 2025-07-09   9  #define HASH_CTX sha224_ctx
4dcf6caddaa047 Eric Biggers 2025-07-09  10  #define HASH_SIZE SHA224_DIGEST_SIZE
4dcf6caddaa047 Eric Biggers 2025-07-09  11  #define HASH_INIT sha224_init
4dcf6caddaa047 Eric Biggers 2025-07-09  12  #define HASH_UPDATE sha224_update
4dcf6caddaa047 Eric Biggers 2025-07-09 @13  #define HASH_FINAL sha224_final
4dcf6caddaa047 Eric Biggers 2025-07-09  14  #define HMAC_KEY hmac_sha224_key
4dcf6caddaa047 Eric Biggers 2025-07-09  15  #define HMAC_CTX hmac_sha224_ctx
4dcf6caddaa047 Eric Biggers 2025-07-09  16  #define HMAC_PREPAREKEY hmac_sha224_preparekey
4dcf6caddaa047 Eric Biggers 2025-07-09  17  #define HMAC_INIT hmac_sha224_init
4dcf6caddaa047 Eric Biggers 2025-07-09  18  #define HMAC_UPDATE hmac_sha224_update
4dcf6caddaa047 Eric Biggers 2025-07-09 @19  #define HMAC_FINAL hmac_sha224_final
4dcf6caddaa047 Eric Biggers 2025-07-09 @20  #define HMAC hmac_sha224
4dcf6caddaa047 Eric Biggers 2025-07-09 @21  #define HMAC_USINGRAWKEY hmac_sha224_usingrawkey
4dcf6caddaa047 Eric Biggers 2025-07-09  22  #include "hash-test-template.h"
4dcf6caddaa047 Eric Biggers 2025-07-09  23  

:::::: The code at line 13 was first introduced by commit
:::::: 4dcf6caddaa0471c134bf0c869086fd0b57a9cc4 lib/crypto: tests: Add KUnit tests for SHA-224 and SHA-256

:::::: TO: Eric Biggers <ebiggers@kernel.org>
:::::: CC: Eric Biggers <ebiggers@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
