Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D08BB10E3
	for <oe-kbuild-all@lists.linux.dev>; Sat, 22 Nov 2025 21:20:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763846456; cv=none; b=B3qnIS0lHlox+gdKzM/TaNjnkwom0wmv+bQs9+yF6FpqUhPomWk/FL7xQ2hmecT8Uz6RGM2R5czI/XaQcgMT7m7C8M48hqekDmq7wR66YRWnPUzK+xBUnkmSCG5uZEr+AaI5sbf+DdLY6oyQpTdTZemkIU6GFPk7VgrBNJco5Y8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763846456; c=relaxed/simple;
	bh=TpUY5vPMyIn8EUCY1TaSS7VAC9UwDYoHDIW4l3diEOo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Wzyx+amaziqS5aWlJNqhV9hd4G8e7ps3r+MVN9SQ0nXLbAItrs+YAPDFgjwUOaBawLnL4u93AdjhRHBEz0xvHdTJFxxUuSR8dpoIzYS9KnLQ1FalsDJL0W0QFYJeUlPY8FxhULaSSuZj0HNQGRsJh34zrV9YlzP5XnYvl9oYoqM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=X6yxRapc; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="X6yxRapc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763846455; x=1795382455;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=TpUY5vPMyIn8EUCY1TaSS7VAC9UwDYoHDIW4l3diEOo=;
  b=X6yxRapct1SgSUcyXOyqtcnHkTEg0oEeSCZavhvj/Owp0C3ACXfvkYyI
   Av2ylCxEpEUZPfblKiMOJx3W9JTbB/89KBxSzLy0qkKw7Cw80ek4OYtC+
   F6BMfQg+Wj5y7kkmGL5KUWUL1rtqeG7bHITauKDFzQYkQKe9QATPx9Yd8
   V05VLgSPHgPOBceZKGfm9Fdb1A3/xVVImXnBPndT68e4ijLNwQL3SS5kk
   FO4KROFYw3TM0DDqdY6HB/zhe2RET0QEtqQK3N3eOwwOqrhTDFJlfvJaa
   v4HLMYJJxT8Z2eEGDE0AphgC5bVLH5ikjEazp+yf7CnMRTaJNI/iTcjcZ
   w==;
X-CSE-ConnectionGUID: HlX1UzkjSuC0Raei35LuEg==
X-CSE-MsgGUID: 1OAcRYDuQqOCYMiVV8gt6A==
X-IronPort-AV: E=McAfee;i="6800,10657,11621"; a="77265301"
X-IronPort-AV: E=Sophos;i="6.20,219,1758610800"; 
   d="scan'208";a="77265301"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Nov 2025 13:20:54 -0800
X-CSE-ConnectionGUID: BFtduIATQ6eZZnGyulNBRA==
X-CSE-MsgGUID: 36gI3M8tQKaU1moV7dQKZw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,219,1758610800"; 
   d="scan'208";a="191165448"
Received: from lkp-server01.sh.intel.com (HELO adf6d29aa8d9) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 22 Nov 2025 13:20:53 -0800
Received: from kbuild by adf6d29aa8d9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vMv2I-0007q1-1W;
	Sat, 22 Nov 2025 21:20:50 +0000
Date: Sun, 23 Nov 2025 05:20:49 +0800
From: kernel test robot <lkp@intel.com>
To: Eric Biggers <ebiggers@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [ebiggers:more-at-least-decorations-v1 9/9]
 include/crypto/sha2.h:193:50: error: 'at_least' undeclared here (not in a
 function)
Message-ID: <202511230525.G092Xy6H-lkp@intel.com>
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
config: i386-allnoconfig (https://download.01.org/0day-ci/archive/20251123/202511230525.G092Xy6H-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251123/202511230525.G092Xy6H-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511230525.G092Xy6H-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from lib/crypto/sha256.c:13:
>> include/crypto/sha2.h:193:50: error: 'at_least' undeclared here (not in a function)
     193 | void sha224_final(struct sha224_ctx *ctx, u8 out[at_least SHA224_DIGEST_SIZE]);
         |                                                  ^~~~~~~~
>> include/crypto/sha2.h:193:58: error: expected ']' before numeric constant
     193 | void sha224_final(struct sha224_ctx *ctx, u8 out[at_least SHA224_DIGEST_SIZE]);
         |                                                          ^
         |                                                          ]
   include/crypto/sha2.h:203:48: error: 'at_least' undeclared here (not in a function)
     203 | void sha224(const u8 *data, size_t len, u8 out[at_least SHA224_DIGEST_SIZE]);
         |                                                ^~~~~~~~
   include/crypto/sha2.h:203:56: error: expected ']' before numeric constant
     203 | void sha224(const u8 *data, size_t len, u8 out[at_least SHA224_DIGEST_SIZE]);
         |                                                        ^
         |                                                        ]
   include/crypto/sha2.h:291:31: error: 'at_least' undeclared here (not in a function)
     291 |                        u8 out[at_least SHA224_DIGEST_SIZE]);
         |                               ^~~~~~~~
   include/crypto/sha2.h:291:39: error: expected ']' before numeric constant
     291 |                        u8 out[at_least SHA224_DIGEST_SIZE]);
         |                                       ^
         |                                       ]
   include/crypto/sha2.h:306:25: error: 'at_least' undeclared here (not in a function)
     306 |                  u8 out[at_least SHA224_DIGEST_SIZE]);
         |                         ^~~~~~~~
   include/crypto/sha2.h:306:33: error: expected ']' before numeric constant
     306 |                  u8 out[at_least SHA224_DIGEST_SIZE]);
         |                                 ^
         |                                 ]
   include/crypto/sha2.h:323:37: error: 'at_least' undeclared here (not in a function)
     323 |                              u8 out[at_least SHA224_DIGEST_SIZE]);
         |                                     ^~~~~~~~
   include/crypto/sha2.h:323:45: error: expected ']' before numeric constant
     323 |                              u8 out[at_least SHA224_DIGEST_SIZE]);
         |                                             ^
         |                                             ]
   include/crypto/sha2.h:368:50: error: 'at_least' undeclared here (not in a function)
     368 | void sha256_final(struct sha256_ctx *ctx, u8 out[at_least SHA256_DIGEST_SIZE]);
         |                                                  ^~~~~~~~
   include/crypto/sha2.h:368:58: error: expected ']' before numeric constant
     368 | void sha256_final(struct sha256_ctx *ctx, u8 out[at_least SHA256_DIGEST_SIZE]);
         |                                                          ^
         |                                                          ]
   include/crypto/sha2.h:378:48: error: 'at_least' undeclared here (not in a function)
     378 | void sha256(const u8 *data, size_t len, u8 out[at_least SHA256_DIGEST_SIZE]);
         |                                                ^~~~~~~~
   include/crypto/sha2.h:378:56: error: expected ']' before numeric constant
     378 | void sha256(const u8 *data, size_t len, u8 out[at_least SHA256_DIGEST_SIZE]);
         |                                                        ^
         |                                                        ]
   include/crypto/sha2.h:396:30: error: 'at_least' undeclared here (not in a function)
     396 |                      u8 out1[at_least SHA256_DIGEST_SIZE],
         |                              ^~~~~~~~
   include/crypto/sha2.h:396:38: error: expected ']' before numeric constant
     396 |                      u8 out1[at_least SHA256_DIGEST_SIZE],
         |                                      ^
         |                                      ]
>> include/crypto/sha2.h:397:22: error: expected ';', ',' or ')' before 'u8'
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


vim +/at_least +193 include/crypto/sha2.h

   183	
   184	/**
   185	 * sha224_final() - Finish computing a SHA-224 message digest
   186	 * @ctx: the context to finalize; must have been initialized
   187	 * @out: (output) the resulting SHA-224 message digest
   188	 *
   189	 * After finishing, this zeroizes @ctx.  So the caller does not need to do it.
   190	 *
   191	 * Context: Any context.
   192	 */
 > 193	void sha224_final(struct sha224_ctx *ctx, u8 out[at_least SHA224_DIGEST_SIZE]);
   194	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
