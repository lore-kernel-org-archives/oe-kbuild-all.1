Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C0FD2BCF5
	for <oe-kbuild-all@lists.linux.dev>; Sun, 23 Nov 2025 21:31:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763933483; cv=none; b=iRJ6zdfa0j3Fs68lUlrZOJpMWhjqvZ5xUbPQDu+os0H+YMI5UcDAZ8HktKKwmIaDfNMeFGOfGguaL4tciLCYAddf/QGTPc6ivvcHj3/P4gkH7qrzG07Y9hpYAS2d5wx2fqHEhGMVApKQttsffEMgv4irGooJ6yUsQZR/bjVc9Bk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763933483; c=relaxed/simple;
	bh=1cEr8rN3m9ovxXYAqs/QTC2OUbTXsihlJJ4CzQhIqDE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ZQrwYk2ao/VLVRy0Wx1w4nfLeKg6mNnc+DWM7HHEfhcSG6uRnC0DJGA5Oecg1pznGw5YtrZBdlDFk8gOUXp0I7ktzyl21hWrI8ygcr3iD10XrVoXNPmNmTFOlGcktk0TVeiYPSpV/Zkp27UEHkPvzJupUF2TbZBQopokQ4weJWE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=P6Kn0MQE; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="P6Kn0MQE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763933481; x=1795469481;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1cEr8rN3m9ovxXYAqs/QTC2OUbTXsihlJJ4CzQhIqDE=;
  b=P6Kn0MQE6qZcHyG82HQLRR6yhQcJre2YVzqsvxM07wrbV25VOAn362G+
   Jbd2e7UgfTVb9tFj4ZkhFZo5pld7deoonUPoOzQ/nNqW4WGrgxMhCQfe9
   ihw+rwsouIrTQLJdk1XA1Wcn1HnKwK+utU3PT07gnKg0/SpycTfH3XvuU
   2VnFDa8Ve1FO6Tp2jbghP3Ymy/9UWWboKb44Pso7dPHCbvawU0/RcBtgy
   s/Wn7XhI8Qlrc8m8mcawhX3jf5uLV5lvDdp1fC/3nUcQJiIfL4MO6DIIq
   JgCkS774JpsX+0HIfnzd+G0ZF4T8mp9/lA33FJ7JMWrbHNDYcFoaHQszF
   A==;
X-CSE-ConnectionGUID: 4Z4DJK00RyOBY51NgHAvZQ==
X-CSE-MsgGUID: 28aohoWTSv2Fhw8yRYmJ4A==
X-IronPort-AV: E=McAfee;i="6800,10657,11622"; a="83328672"
X-IronPort-AV: E=Sophos;i="6.20,221,1758610800"; 
   d="scan'208";a="83328672"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2025 13:31:21 -0800
X-CSE-ConnectionGUID: YX0ronFcTQOR3XPKRtw6Uw==
X-CSE-MsgGUID: FEnsW526Q8ml74BHOXBZLA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,221,1758610800"; 
   d="scan'208";a="196624033"
Received: from igk-lkp-server01.igk.intel.com (HELO 1f7de368ad0d) ([10.211.93.152])
  by orviesa004.jf.intel.com with ESMTP; 23 Nov 2025 13:31:19 -0800
Received: from kbuild by 1f7de368ad0d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vNHfw-0000000004D-3jEN;
	Sun, 23 Nov 2025 21:31:16 +0000
Date: Sun, 23 Nov 2025 22:30:29 +0100
From: kernel test robot <lkp@intel.com>
To: Eric Biggers <ebiggers@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [ebiggers:more-at-least-decorations-v1 9/9]
 lib/crypto/sha256.c:237:6: warning: no previous prototype for 'sha224_final'
Message-ID: <202511232200.7DLfeFhG-lkp@intel.com>
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
config: x86_64-rhel-9.4 (https://download.01.org/0day-ci/archive/20251123/202511232200.7DLfeFhG-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251123/202511232200.7DLfeFhG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511232200.7DLfeFhG-lkp@intel.com/

All warnings (new ones prefixed by >>):

     396 |                      u8 out1[at_least SHA256_DIGEST_SIZE],
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
>> lib/crypto/sha256.c:237:6: warning: no previous prototype for 'sha224_final' [-Wmissing-prototypes]
     237 | void sha224_final(struct sha224_ctx *ctx, u8 out[SHA224_DIGEST_SIZE])
         |      ^~~~~~~~~~~~
>> lib/crypto/sha256.c:244:6: warning: no previous prototype for 'sha256_final' [-Wmissing-prototypes]
     244 | void sha256_final(struct sha256_ctx *ctx, u8 out[SHA256_DIGEST_SIZE])
         |      ^~~~~~~~~~~~
>> lib/crypto/sha256.c:251:6: warning: no previous prototype for 'sha224' [-Wmissing-prototypes]
     251 | void sha224(const u8 *data, size_t len, u8 out[SHA224_DIGEST_SIZE])
         |      ^~~~~~
>> lib/crypto/sha256.c:261:6: warning: no previous prototype for 'sha256' [-Wmissing-prototypes]
     261 | void sha256(const u8 *data, size_t len, u8 out[SHA256_DIGEST_SIZE])
         |      ^~~~~~
>> lib/crypto/sha256.c:307:6: warning: no previous prototype for 'sha256_finup_2x' [-Wmissing-prototypes]
     307 | void sha256_finup_2x(const struct sha256_ctx *ctx, const u8 *data1,
         |      ^~~~~~~~~~~~~~~
>> lib/crypto/sha256.c:421:6: warning: no previous prototype for 'hmac_sha224_final' [-Wmissing-prototypes]
     421 | void hmac_sha224_final(struct hmac_sha224_ctx *ctx,
         |      ^~~~~~~~~~~~~~~~~
>> lib/crypto/sha256.c:428:6: warning: no previous prototype for 'hmac_sha256_final' [-Wmissing-prototypes]
     428 | void hmac_sha256_final(struct hmac_sha256_ctx *ctx,
         |      ^~~~~~~~~~~~~~~~~
>> lib/crypto/sha256.c:435:6: warning: no previous prototype for 'hmac_sha224' [-Wmissing-prototypes]
     435 | void hmac_sha224(const struct hmac_sha224_key *key,
         |      ^~~~~~~~~~~
>> lib/crypto/sha256.c:446:6: warning: no previous prototype for 'hmac_sha256' [-Wmissing-prototypes]
     446 | void hmac_sha256(const struct hmac_sha256_key *key,
         |      ^~~~~~~~~~~
>> lib/crypto/sha256.c:457:6: warning: no previous prototype for 'hmac_sha224_usingrawkey' [-Wmissing-prototypes]
     457 | void hmac_sha224_usingrawkey(const u8 *raw_key, size_t raw_key_len,
         |      ^~~~~~~~~~~~~~~~~~~~~~~
>> lib/crypto/sha256.c:469:6: warning: no previous prototype for 'hmac_sha256_usingrawkey' [-Wmissing-prototypes]
     469 | void hmac_sha256_usingrawkey(const u8 *raw_key, size_t raw_key_len,
         |      ^~~~~~~~~~~~~~~~~~~~~~~
--
     396 |                      u8 out1[at_least SHA256_DIGEST_SIZE],
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
>> lib/crypto/sha512.c:218:6: warning: no previous prototype for 'sha384_final' [-Wmissing-prototypes]
     218 | void sha384_final(struct sha384_ctx *ctx, u8 out[SHA384_DIGEST_SIZE])
         |      ^~~~~~~~~~~~
>> lib/crypto/sha512.c:225:6: warning: no previous prototype for 'sha512_final' [-Wmissing-prototypes]
     225 | void sha512_final(struct sha512_ctx *ctx, u8 out[SHA512_DIGEST_SIZE])
         |      ^~~~~~~~~~~~
>> lib/crypto/sha512.c:232:6: warning: no previous prototype for 'sha384' [-Wmissing-prototypes]
     232 | void sha384(const u8 *data, size_t len, u8 out[SHA384_DIGEST_SIZE])
         |      ^~~~~~
>> lib/crypto/sha512.c:242:6: warning: no previous prototype for 'sha512' [-Wmissing-prototypes]
     242 | void sha512(const u8 *data, size_t len, u8 out[SHA512_DIGEST_SIZE])
         |      ^~~~~~
>> lib/crypto/sha512.c:348:6: warning: no previous prototype for 'hmac_sha384_final' [-Wmissing-prototypes]
     348 | void hmac_sha384_final(struct hmac_sha384_ctx *ctx,
         |      ^~~~~~~~~~~~~~~~~
>> lib/crypto/sha512.c:355:6: warning: no previous prototype for 'hmac_sha512_final' [-Wmissing-prototypes]
     355 | void hmac_sha512_final(struct hmac_sha512_ctx *ctx,
         |      ^~~~~~~~~~~~~~~~~
>> lib/crypto/sha512.c:362:6: warning: no previous prototype for 'hmac_sha384' [-Wmissing-prototypes]
     362 | void hmac_sha384(const struct hmac_sha384_key *key,
         |      ^~~~~~~~~~~
>> lib/crypto/sha512.c:373:6: warning: no previous prototype for 'hmac_sha512' [-Wmissing-prototypes]
     373 | void hmac_sha512(const struct hmac_sha512_key *key,
         |      ^~~~~~~~~~~
>> lib/crypto/sha512.c:384:6: warning: no previous prototype for 'hmac_sha384_usingrawkey' [-Wmissing-prototypes]
     384 | void hmac_sha384_usingrawkey(const u8 *raw_key, size_t raw_key_len,
         |      ^~~~~~~~~~~~~~~~~~~~~~~
>> lib/crypto/sha512.c:396:6: warning: no previous prototype for 'hmac_sha512_usingrawkey' [-Wmissing-prototypes]
     396 | void hmac_sha512_usingrawkey(const u8 *raw_key, size_t raw_key_len,
         |      ^~~~~~~~~~~~~~~~~~~~~~~


vim +/sha224_final +237 lib/crypto/sha256.c

7d2f5b0c43e0bb Hans de Goede 2019-08-17  236  
b86ced882b8e66 Eric Biggers  2025-06-30 @237  void sha224_final(struct sha224_ctx *ctx, u8 out[SHA224_DIGEST_SIZE])
7d2f5b0c43e0bb Hans de Goede 2019-08-17  238  {
b86ced882b8e66 Eric Biggers  2025-06-30  239  	__sha256_final(&ctx->ctx, out, SHA224_DIGEST_SIZE);
b86ced882b8e66 Eric Biggers  2025-06-30  240  	memzero_explicit(ctx, sizeof(*ctx));
7d2f5b0c43e0bb Hans de Goede 2019-08-17  241  }
7d2f5b0c43e0bb Hans de Goede 2019-08-17  242  EXPORT_SYMBOL(sha224_final);
9ecf5ad522e09d Hans de Goede 2019-08-25  243  
b86ced882b8e66 Eric Biggers  2025-06-30 @244  void sha256_final(struct sha256_ctx *ctx, u8 out[SHA256_DIGEST_SIZE])
3135d5be7c2784 Eric Biggers  2025-06-30  245  {
b86ced882b8e66 Eric Biggers  2025-06-30  246  	__sha256_final(&ctx->ctx, out, SHA256_DIGEST_SIZE);
b86ced882b8e66 Eric Biggers  2025-06-30  247  	memzero_explicit(ctx, sizeof(*ctx));
3135d5be7c2784 Eric Biggers  2025-06-30  248  }
3135d5be7c2784 Eric Biggers  2025-06-30  249  EXPORT_SYMBOL(sha256_final);
3135d5be7c2784 Eric Biggers  2025-06-30  250  
6fa4b292204b15 Eric Biggers  2025-06-30 @251  void sha224(const u8 *data, size_t len, u8 out[SHA224_DIGEST_SIZE])
6fa4b292204b15 Eric Biggers  2025-06-30  252  {
b86ced882b8e66 Eric Biggers  2025-06-30  253  	struct sha224_ctx ctx;
6fa4b292204b15 Eric Biggers  2025-06-30  254  
b86ced882b8e66 Eric Biggers  2025-06-30  255  	sha224_init(&ctx);
b86ced882b8e66 Eric Biggers  2025-06-30  256  	sha224_update(&ctx, data, len);
b86ced882b8e66 Eric Biggers  2025-06-30  257  	sha224_final(&ctx, out);
6fa4b292204b15 Eric Biggers  2025-06-30  258  }
6fa4b292204b15 Eric Biggers  2025-06-30  259  EXPORT_SYMBOL(sha224);
6fa4b292204b15 Eric Biggers  2025-06-30  260  
7350fef56b7629 Eric Biggers  2025-04-28 @261  void sha256(const u8 *data, size_t len, u8 out[SHA256_DIGEST_SIZE])
9ea9c58b40a441 Eric Biggers  2020-07-08  262  {
b86ced882b8e66 Eric Biggers  2025-06-30  263  	struct sha256_ctx ctx;
9ea9c58b40a441 Eric Biggers  2020-07-08  264  
b86ced882b8e66 Eric Biggers  2025-06-30  265  	sha256_init(&ctx);
b86ced882b8e66 Eric Biggers  2025-06-30  266  	sha256_update(&ctx, data, len);
b86ced882b8e66 Eric Biggers  2025-06-30  267  	sha256_final(&ctx, out);
9ea9c58b40a441 Eric Biggers  2020-07-08  268  }
9ea9c58b40a441 Eric Biggers  2020-07-08  269  EXPORT_SYMBOL(sha256);
9ea9c58b40a441 Eric Biggers  2020-07-08  270  
4ca24d6abbca5d Eric Biggers  2025-09-15  271  /*
4ca24d6abbca5d Eric Biggers  2025-09-15  272   * Pre-boot environment (as indicated by __DISABLE_EXPORTS being defined)
4ca24d6abbca5d Eric Biggers  2025-09-15  273   * doesn't need either HMAC support or interleaved hashing support
4ca24d6abbca5d Eric Biggers  2025-09-15  274   */
077833cd600908 Eric Biggers  2025-06-30  275  #ifndef __DISABLE_EXPORTS
4ca24d6abbca5d Eric Biggers  2025-09-15  276  
4ca24d6abbca5d Eric Biggers  2025-09-15  277  #ifndef sha256_finup_2x_arch
4ca24d6abbca5d Eric Biggers  2025-09-15  278  static bool sha256_finup_2x_arch(const struct __sha256_ctx *ctx,
4ca24d6abbca5d Eric Biggers  2025-09-15  279  				 const u8 *data1, const u8 *data2, size_t len,
4ca24d6abbca5d Eric Biggers  2025-09-15  280  				 u8 out1[SHA256_DIGEST_SIZE],
4ca24d6abbca5d Eric Biggers  2025-09-15  281  				 u8 out2[SHA256_DIGEST_SIZE])
4ca24d6abbca5d Eric Biggers  2025-09-15  282  {
4ca24d6abbca5d Eric Biggers  2025-09-15  283  	return false;
4ca24d6abbca5d Eric Biggers  2025-09-15  284  }
4ca24d6abbca5d Eric Biggers  2025-09-15  285  static bool sha256_finup_2x_is_optimized_arch(void)
4ca24d6abbca5d Eric Biggers  2025-09-15  286  {
4ca24d6abbca5d Eric Biggers  2025-09-15  287  	return false;
4ca24d6abbca5d Eric Biggers  2025-09-15  288  }
4ca24d6abbca5d Eric Biggers  2025-09-15  289  #endif
4ca24d6abbca5d Eric Biggers  2025-09-15  290  
4ca24d6abbca5d Eric Biggers  2025-09-15  291  /* Sequential fallback implementation of sha256_finup_2x() */
4ca24d6abbca5d Eric Biggers  2025-09-15  292  static noinline_for_stack void sha256_finup_2x_sequential(
4ca24d6abbca5d Eric Biggers  2025-09-15  293  	const struct __sha256_ctx *ctx, const u8 *data1, const u8 *data2,
4ca24d6abbca5d Eric Biggers  2025-09-15  294  	size_t len, u8 out1[SHA256_DIGEST_SIZE], u8 out2[SHA256_DIGEST_SIZE])
4ca24d6abbca5d Eric Biggers  2025-09-15  295  {
4ca24d6abbca5d Eric Biggers  2025-09-15  296  	struct __sha256_ctx mut_ctx;
4ca24d6abbca5d Eric Biggers  2025-09-15  297  
4ca24d6abbca5d Eric Biggers  2025-09-15  298  	mut_ctx = *ctx;
4ca24d6abbca5d Eric Biggers  2025-09-15  299  	__sha256_update(&mut_ctx, data1, len);
4ca24d6abbca5d Eric Biggers  2025-09-15  300  	__sha256_final(&mut_ctx, out1, SHA256_DIGEST_SIZE);
4ca24d6abbca5d Eric Biggers  2025-09-15  301  
4ca24d6abbca5d Eric Biggers  2025-09-15  302  	mut_ctx = *ctx;
4ca24d6abbca5d Eric Biggers  2025-09-15  303  	__sha256_update(&mut_ctx, data2, len);
4ca24d6abbca5d Eric Biggers  2025-09-15  304  	__sha256_final(&mut_ctx, out2, SHA256_DIGEST_SIZE);
4ca24d6abbca5d Eric Biggers  2025-09-15  305  }
4ca24d6abbca5d Eric Biggers  2025-09-15  306  
4ca24d6abbca5d Eric Biggers  2025-09-15 @307  void sha256_finup_2x(const struct sha256_ctx *ctx, const u8 *data1,
4ca24d6abbca5d Eric Biggers  2025-09-15  308  		     const u8 *data2, size_t len, u8 out1[SHA256_DIGEST_SIZE],
4ca24d6abbca5d Eric Biggers  2025-09-15  309  		     u8 out2[SHA256_DIGEST_SIZE])
4ca24d6abbca5d Eric Biggers  2025-09-15  310  {
4ca24d6abbca5d Eric Biggers  2025-09-15  311  	if (ctx == NULL)
4ca24d6abbca5d Eric Biggers  2025-09-15  312  		ctx = &initial_sha256_ctx;
4ca24d6abbca5d Eric Biggers  2025-09-15  313  
4ca24d6abbca5d Eric Biggers  2025-09-15  314  	if (likely(sha256_finup_2x_arch(&ctx->ctx, data1, data2, len, out1,
4ca24d6abbca5d Eric Biggers  2025-09-15  315  					out2)))
4ca24d6abbca5d Eric Biggers  2025-09-15  316  		return;
4ca24d6abbca5d Eric Biggers  2025-09-15  317  	sha256_finup_2x_sequential(&ctx->ctx, data1, data2, len, out1, out2);
4ca24d6abbca5d Eric Biggers  2025-09-15  318  }
4ca24d6abbca5d Eric Biggers  2025-09-15  319  EXPORT_SYMBOL_GPL(sha256_finup_2x);
4ca24d6abbca5d Eric Biggers  2025-09-15  320  
4ca24d6abbca5d Eric Biggers  2025-09-15  321  bool sha256_finup_2x_is_optimized(void)
4ca24d6abbca5d Eric Biggers  2025-09-15  322  {
4ca24d6abbca5d Eric Biggers  2025-09-15  323  	return sha256_finup_2x_is_optimized_arch();
4ca24d6abbca5d Eric Biggers  2025-09-15  324  }
4ca24d6abbca5d Eric Biggers  2025-09-15  325  EXPORT_SYMBOL_GPL(sha256_finup_2x_is_optimized);
4ca24d6abbca5d Eric Biggers  2025-09-15  326  
7941ad69650691 Eric Biggers  2025-07-11  327  static void __hmac_sha256_preparekey(struct sha256_block_state *istate,
7941ad69650691 Eric Biggers  2025-07-11  328  				     struct sha256_block_state *ostate,
077833cd600908 Eric Biggers  2025-06-30  329  				     const u8 *raw_key, size_t raw_key_len,
077833cd600908 Eric Biggers  2025-06-30  330  				     const struct sha256_block_state *iv)
077833cd600908 Eric Biggers  2025-06-30  331  {
077833cd600908 Eric Biggers  2025-06-30  332  	union {
077833cd600908 Eric Biggers  2025-06-30  333  		u8 b[SHA256_BLOCK_SIZE];
077833cd600908 Eric Biggers  2025-06-30  334  		unsigned long w[SHA256_BLOCK_SIZE / sizeof(unsigned long)];
077833cd600908 Eric Biggers  2025-06-30  335  	} derived_key = { 0 };
077833cd600908 Eric Biggers  2025-06-30  336  
077833cd600908 Eric Biggers  2025-06-30  337  	if (unlikely(raw_key_len > SHA256_BLOCK_SIZE)) {
077833cd600908 Eric Biggers  2025-06-30  338  		if (iv == &sha224_iv)
077833cd600908 Eric Biggers  2025-06-30  339  			sha224(raw_key, raw_key_len, derived_key.b);
077833cd600908 Eric Biggers  2025-06-30  340  		else
077833cd600908 Eric Biggers  2025-06-30  341  			sha256(raw_key, raw_key_len, derived_key.b);
077833cd600908 Eric Biggers  2025-06-30  342  	} else {
077833cd600908 Eric Biggers  2025-06-30  343  		memcpy(derived_key.b, raw_key, raw_key_len);
077833cd600908 Eric Biggers  2025-06-30  344  	}
077833cd600908 Eric Biggers  2025-06-30  345  
077833cd600908 Eric Biggers  2025-06-30  346  	for (size_t i = 0; i < ARRAY_SIZE(derived_key.w); i++)
077833cd600908 Eric Biggers  2025-06-30  347  		derived_key.w[i] ^= REPEAT_BYTE(HMAC_IPAD_VALUE);
7941ad69650691 Eric Biggers  2025-07-11  348  	*istate = *iv;
7941ad69650691 Eric Biggers  2025-07-11  349  	sha256_blocks(istate, derived_key.b, 1);
077833cd600908 Eric Biggers  2025-06-30  350  
077833cd600908 Eric Biggers  2025-06-30  351  	for (size_t i = 0; i < ARRAY_SIZE(derived_key.w); i++)
077833cd600908 Eric Biggers  2025-06-30  352  		derived_key.w[i] ^= REPEAT_BYTE(HMAC_OPAD_VALUE ^
077833cd600908 Eric Biggers  2025-06-30  353  						HMAC_IPAD_VALUE);
7941ad69650691 Eric Biggers  2025-07-11  354  	*ostate = *iv;
7941ad69650691 Eric Biggers  2025-07-11  355  	sha256_blocks(ostate, derived_key.b, 1);
077833cd600908 Eric Biggers  2025-06-30  356  
077833cd600908 Eric Biggers  2025-06-30  357  	memzero_explicit(&derived_key, sizeof(derived_key));
077833cd600908 Eric Biggers  2025-06-30  358  }
077833cd600908 Eric Biggers  2025-06-30  359  
077833cd600908 Eric Biggers  2025-06-30  360  void hmac_sha224_preparekey(struct hmac_sha224_key *key,
077833cd600908 Eric Biggers  2025-06-30  361  			    const u8 *raw_key, size_t raw_key_len)
077833cd600908 Eric Biggers  2025-06-30  362  {
7941ad69650691 Eric Biggers  2025-07-11  363  	__hmac_sha256_preparekey(&key->key.istate, &key->key.ostate,
7941ad69650691 Eric Biggers  2025-07-11  364  				 raw_key, raw_key_len, &sha224_iv);
077833cd600908 Eric Biggers  2025-06-30  365  }
077833cd600908 Eric Biggers  2025-06-30  366  EXPORT_SYMBOL_GPL(hmac_sha224_preparekey);
077833cd600908 Eric Biggers  2025-06-30  367  
077833cd600908 Eric Biggers  2025-06-30  368  void hmac_sha256_preparekey(struct hmac_sha256_key *key,
077833cd600908 Eric Biggers  2025-06-30  369  			    const u8 *raw_key, size_t raw_key_len)
077833cd600908 Eric Biggers  2025-06-30  370  {
7941ad69650691 Eric Biggers  2025-07-11  371  	__hmac_sha256_preparekey(&key->key.istate, &key->key.ostate,
7941ad69650691 Eric Biggers  2025-07-11  372  				 raw_key, raw_key_len, &sha256_iv);
077833cd600908 Eric Biggers  2025-06-30  373  }
077833cd600908 Eric Biggers  2025-06-30  374  EXPORT_SYMBOL_GPL(hmac_sha256_preparekey);
077833cd600908 Eric Biggers  2025-06-30  375  
077833cd600908 Eric Biggers  2025-06-30  376  void __hmac_sha256_init(struct __hmac_sha256_ctx *ctx,
077833cd600908 Eric Biggers  2025-06-30  377  			const struct __hmac_sha256_key *key)
077833cd600908 Eric Biggers  2025-06-30  378  {
077833cd600908 Eric Biggers  2025-06-30  379  	__sha256_init(&ctx->sha_ctx, &key->istate, SHA256_BLOCK_SIZE);
077833cd600908 Eric Biggers  2025-06-30  380  	ctx->ostate = key->ostate;
077833cd600908 Eric Biggers  2025-06-30  381  }
077833cd600908 Eric Biggers  2025-06-30  382  EXPORT_SYMBOL_GPL(__hmac_sha256_init);
077833cd600908 Eric Biggers  2025-06-30  383  
7941ad69650691 Eric Biggers  2025-07-11  384  void hmac_sha224_init_usingrawkey(struct hmac_sha224_ctx *ctx,
7941ad69650691 Eric Biggers  2025-07-11  385  				  const u8 *raw_key, size_t raw_key_len)
7941ad69650691 Eric Biggers  2025-07-11  386  {
7941ad69650691 Eric Biggers  2025-07-11  387  	__hmac_sha256_preparekey(&ctx->ctx.sha_ctx.state, &ctx->ctx.ostate,
7941ad69650691 Eric Biggers  2025-07-11  388  				 raw_key, raw_key_len, &sha224_iv);
7941ad69650691 Eric Biggers  2025-07-11  389  	ctx->ctx.sha_ctx.bytecount = SHA256_BLOCK_SIZE;
7941ad69650691 Eric Biggers  2025-07-11  390  }
7941ad69650691 Eric Biggers  2025-07-11  391  EXPORT_SYMBOL_GPL(hmac_sha224_init_usingrawkey);
7941ad69650691 Eric Biggers  2025-07-11  392  
7941ad69650691 Eric Biggers  2025-07-11  393  void hmac_sha256_init_usingrawkey(struct hmac_sha256_ctx *ctx,
7941ad69650691 Eric Biggers  2025-07-11  394  				  const u8 *raw_key, size_t raw_key_len)
7941ad69650691 Eric Biggers  2025-07-11  395  {
7941ad69650691 Eric Biggers  2025-07-11  396  	__hmac_sha256_preparekey(&ctx->ctx.sha_ctx.state, &ctx->ctx.ostate,
7941ad69650691 Eric Biggers  2025-07-11  397  				 raw_key, raw_key_len, &sha256_iv);
7941ad69650691 Eric Biggers  2025-07-11  398  	ctx->ctx.sha_ctx.bytecount = SHA256_BLOCK_SIZE;
7941ad69650691 Eric Biggers  2025-07-11  399  }
7941ad69650691 Eric Biggers  2025-07-11  400  EXPORT_SYMBOL_GPL(hmac_sha256_init_usingrawkey);
7941ad69650691 Eric Biggers  2025-07-11  401  
077833cd600908 Eric Biggers  2025-06-30  402  static void __hmac_sha256_final(struct __hmac_sha256_ctx *ctx,
077833cd600908 Eric Biggers  2025-06-30  403  				u8 *out, size_t digest_size)
077833cd600908 Eric Biggers  2025-06-30  404  {
077833cd600908 Eric Biggers  2025-06-30  405  	/* Generate the padded input for the outer hash in ctx->sha_ctx.buf. */
077833cd600908 Eric Biggers  2025-06-30  406  	__sha256_final(&ctx->sha_ctx, ctx->sha_ctx.buf, digest_size);
077833cd600908 Eric Biggers  2025-06-30  407  	memset(&ctx->sha_ctx.buf[digest_size], 0,
077833cd600908 Eric Biggers  2025-06-30  408  	       SHA256_BLOCK_SIZE - digest_size);
077833cd600908 Eric Biggers  2025-06-30  409  	ctx->sha_ctx.buf[digest_size] = 0x80;
077833cd600908 Eric Biggers  2025-06-30  410  	*(__be32 *)&ctx->sha_ctx.buf[SHA256_BLOCK_SIZE - 4] =
077833cd600908 Eric Biggers  2025-06-30  411  		cpu_to_be32(8 * (SHA256_BLOCK_SIZE + digest_size));
077833cd600908 Eric Biggers  2025-06-30  412  
077833cd600908 Eric Biggers  2025-06-30  413  	/* Compute the outer hash, which gives the HMAC value. */
077833cd600908 Eric Biggers  2025-06-30  414  	sha256_blocks(&ctx->ostate, ctx->sha_ctx.buf, 1);
077833cd600908 Eric Biggers  2025-06-30  415  	for (size_t i = 0; i < digest_size; i += 4)
077833cd600908 Eric Biggers  2025-06-30  416  		put_unaligned_be32(ctx->ostate.h[i / 4], out + i);
077833cd600908 Eric Biggers  2025-06-30  417  
077833cd600908 Eric Biggers  2025-06-30  418  	memzero_explicit(ctx, sizeof(*ctx));
077833cd600908 Eric Biggers  2025-06-30  419  }
077833cd600908 Eric Biggers  2025-06-30  420  
077833cd600908 Eric Biggers  2025-06-30 @421  void hmac_sha224_final(struct hmac_sha224_ctx *ctx,
077833cd600908 Eric Biggers  2025-06-30  422  		       u8 out[SHA224_DIGEST_SIZE])
077833cd600908 Eric Biggers  2025-06-30  423  {
077833cd600908 Eric Biggers  2025-06-30  424  	__hmac_sha256_final(&ctx->ctx, out, SHA224_DIGEST_SIZE);
077833cd600908 Eric Biggers  2025-06-30  425  }
077833cd600908 Eric Biggers  2025-06-30  426  EXPORT_SYMBOL_GPL(hmac_sha224_final);
077833cd600908 Eric Biggers  2025-06-30  427  
077833cd600908 Eric Biggers  2025-06-30 @428  void hmac_sha256_final(struct hmac_sha256_ctx *ctx,
077833cd600908 Eric Biggers  2025-06-30  429  		       u8 out[SHA256_DIGEST_SIZE])
077833cd600908 Eric Biggers  2025-06-30  430  {
077833cd600908 Eric Biggers  2025-06-30  431  	__hmac_sha256_final(&ctx->ctx, out, SHA256_DIGEST_SIZE);
077833cd600908 Eric Biggers  2025-06-30  432  }
077833cd600908 Eric Biggers  2025-06-30  433  EXPORT_SYMBOL_GPL(hmac_sha256_final);
077833cd600908 Eric Biggers  2025-06-30  434  
077833cd600908 Eric Biggers  2025-06-30 @435  void hmac_sha224(const struct hmac_sha224_key *key,
077833cd600908 Eric Biggers  2025-06-30  436  		 const u8 *data, size_t data_len, u8 out[SHA224_DIGEST_SIZE])
077833cd600908 Eric Biggers  2025-06-30  437  {
077833cd600908 Eric Biggers  2025-06-30  438  	struct hmac_sha224_ctx ctx;
077833cd600908 Eric Biggers  2025-06-30  439  
077833cd600908 Eric Biggers  2025-06-30  440  	hmac_sha224_init(&ctx, key);
077833cd600908 Eric Biggers  2025-06-30  441  	hmac_sha224_update(&ctx, data, data_len);
077833cd600908 Eric Biggers  2025-06-30  442  	hmac_sha224_final(&ctx, out);
077833cd600908 Eric Biggers  2025-06-30  443  }
077833cd600908 Eric Biggers  2025-06-30  444  EXPORT_SYMBOL_GPL(hmac_sha224);
077833cd600908 Eric Biggers  2025-06-30  445  

:::::: The code at line 237 was first introduced by commit
:::::: b86ced882b8e667758afddffd8d6354197842110 lib/crypto: sha256: Make library API use strongly-typed contexts

:::::: TO: Eric Biggers <ebiggers@kernel.org>
:::::: CC: Eric Biggers <ebiggers@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
