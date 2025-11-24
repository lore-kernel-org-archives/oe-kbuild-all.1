Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A230C2EA723
	for <oe-kbuild-all@lists.linux.dev>; Mon, 24 Nov 2025 07:56:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763971016; cv=none; b=IR7blJPFaNUJeoayXta5uhETFeyLxIcIxXJqZpi/wX7/+VqtAQsAhlARbrPciGN4XO6sJ1OWkQI5xqdz2Wg5UVc87iQ1zeSOvfLdUmIFJVdBpWK0j+KLICwfsnhLDElMyi3rPPtfFh5d/noiecpvosYgwc93d8lv///0Jd6+O7o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763971016; c=relaxed/simple;
	bh=+f9K9/plbb8UaPxLOKJGmvS4pjWwj8R/1XOoYjaX2h8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=cNall8LZ3wkHckr0FfDoyZibE/Xpql/8W8kVpKqkmbO/+mEnnJXQSG4b9jbc5kZNsu08s/vxipriNq5005Ewa31xd/RYs8IQnJ+hxbWJBSRP/hEwwA71Wr2xw31JpE0YP0FUukAutpWYlplkQv0+PXIH/ji1G5veSygOGyT7TE4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WGcT5MXH; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WGcT5MXH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763971015; x=1795507015;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+f9K9/plbb8UaPxLOKJGmvS4pjWwj8R/1XOoYjaX2h8=;
  b=WGcT5MXHSDf4tzKK2AYVK5D7lNspSio+O9AiI35JL46mqSn8xa3HKORc
   0O8WGl8Evsv7pw79ZHgNYG3dNW8seqnoc/QI3BAATGd16/m2FFTG6ctUs
   K2Q+dQo43YqoAd5M1XWSQSmq7TU0hhNPpjA4DEt7e4mSTZYj8MhNpyPWp
   rGa+fE5BHauhYoBfS0PtmFdxVxDAMSbPGKca7tzT76Q6pw5SkR/7yU6S2
   /zP/syJBlvl77DCHXUy471KqUgJxby6BLt+B1NM1NhfFyseqPA1VZiUbI
   CKarNZDe+cGmav3dSstDBSshrAC7RsbKV56gJO+mmHk50jOF7K9HE7Isx
   g==;
X-CSE-ConnectionGUID: uIzj7XYXTjGuuBvRw7DhSQ==
X-CSE-MsgGUID: oHA3v7z4S+SRoAKkjPdHtw==
X-IronPort-AV: E=McAfee;i="6800,10657,11622"; a="77326268"
X-IronPort-AV: E=Sophos;i="6.20,222,1758610800"; 
   d="scan'208";a="77326268"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2025 23:56:54 -0800
X-CSE-ConnectionGUID: gMFhMpmWSX6+T8PYX2pZhg==
X-CSE-MsgGUID: ND2h5qlyRveaqyq5Zc1XNQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,222,1758610800"; 
   d="scan'208";a="191547717"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 23 Nov 2025 23:56:52 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vNRRJ-000000000V5-3twi;
	Mon, 24 Nov 2025 07:56:49 +0000
Date: Mon, 24 Nov 2025 15:56:17 +0800
From: kernel test robot <lkp@intel.com>
To: Eric Biggers <ebiggers@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [ebiggers:more-at-least-decorations-v1 9/9]
 lib/crypto/sha512.c:218:6: warning: no previous prototype for 'sha384_final'
Message-ID: <202511241509.I4JUG9sm-lkp@intel.com>
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
config: loongarch-randconfig-001-20251123 (https://download.01.org/0day-ci/archive/20251124/202511241509.I4JUG9sm-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251124/202511241509.I4JUG9sm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511241509.I4JUG9sm-lkp@intel.com/

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


vim +/sha384_final +218 lib/crypto/sha512.c

b693c703accb08 Eric Biggers 2025-06-30  217  
b693c703accb08 Eric Biggers 2025-06-30 @218  void sha384_final(struct sha384_ctx *ctx, u8 out[SHA384_DIGEST_SIZE])
b693c703accb08 Eric Biggers 2025-06-30  219  {
b693c703accb08 Eric Biggers 2025-06-30  220  	__sha512_final(&ctx->ctx, out, SHA384_DIGEST_SIZE);
b693c703accb08 Eric Biggers 2025-06-30  221  	memzero_explicit(ctx, sizeof(*ctx));
b693c703accb08 Eric Biggers 2025-06-30  222  }
b693c703accb08 Eric Biggers 2025-06-30  223  EXPORT_SYMBOL_GPL(sha384_final);
b693c703accb08 Eric Biggers 2025-06-30  224  
b693c703accb08 Eric Biggers 2025-06-30 @225  void sha512_final(struct sha512_ctx *ctx, u8 out[SHA512_DIGEST_SIZE])
b693c703accb08 Eric Biggers 2025-06-30  226  {
b693c703accb08 Eric Biggers 2025-06-30  227  	__sha512_final(&ctx->ctx, out, SHA512_DIGEST_SIZE);
b693c703accb08 Eric Biggers 2025-06-30  228  	memzero_explicit(ctx, sizeof(*ctx));
b693c703accb08 Eric Biggers 2025-06-30  229  }
b693c703accb08 Eric Biggers 2025-06-30  230  EXPORT_SYMBOL_GPL(sha512_final);
b693c703accb08 Eric Biggers 2025-06-30  231  
b693c703accb08 Eric Biggers 2025-06-30 @232  void sha384(const u8 *data, size_t len, u8 out[SHA384_DIGEST_SIZE])
b693c703accb08 Eric Biggers 2025-06-30  233  {
b693c703accb08 Eric Biggers 2025-06-30  234  	struct sha384_ctx ctx;
b693c703accb08 Eric Biggers 2025-06-30  235  
b693c703accb08 Eric Biggers 2025-06-30  236  	sha384_init(&ctx);
b693c703accb08 Eric Biggers 2025-06-30  237  	sha384_update(&ctx, data, len);
b693c703accb08 Eric Biggers 2025-06-30  238  	sha384_final(&ctx, out);
b693c703accb08 Eric Biggers 2025-06-30  239  }
b693c703accb08 Eric Biggers 2025-06-30  240  EXPORT_SYMBOL_GPL(sha384);
b693c703accb08 Eric Biggers 2025-06-30  241  
b693c703accb08 Eric Biggers 2025-06-30 @242  void sha512(const u8 *data, size_t len, u8 out[SHA512_DIGEST_SIZE])
b693c703accb08 Eric Biggers 2025-06-30  243  {
b693c703accb08 Eric Biggers 2025-06-30  244  	struct sha512_ctx ctx;
b693c703accb08 Eric Biggers 2025-06-30  245  
b693c703accb08 Eric Biggers 2025-06-30  246  	sha512_init(&ctx);
b693c703accb08 Eric Biggers 2025-06-30  247  	sha512_update(&ctx, data, len);
b693c703accb08 Eric Biggers 2025-06-30  248  	sha512_final(&ctx, out);
b693c703accb08 Eric Biggers 2025-06-30  249  }
b693c703accb08 Eric Biggers 2025-06-30  250  EXPORT_SYMBOL_GPL(sha512);
b693c703accb08 Eric Biggers 2025-06-30  251  
7941ad69650691 Eric Biggers 2025-07-11  252  static void __hmac_sha512_preparekey(struct sha512_block_state *istate,
7941ad69650691 Eric Biggers 2025-07-11  253  				     struct sha512_block_state *ostate,
23e8b4371dbd59 Eric Biggers 2025-06-30  254  				     const u8 *raw_key, size_t raw_key_len,
23e8b4371dbd59 Eric Biggers 2025-06-30  255  				     const struct sha512_block_state *iv)
23e8b4371dbd59 Eric Biggers 2025-06-30  256  {
23e8b4371dbd59 Eric Biggers 2025-06-30  257  	union {
23e8b4371dbd59 Eric Biggers 2025-06-30  258  		u8 b[SHA512_BLOCK_SIZE];
23e8b4371dbd59 Eric Biggers 2025-06-30  259  		unsigned long w[SHA512_BLOCK_SIZE / sizeof(unsigned long)];
23e8b4371dbd59 Eric Biggers 2025-06-30  260  	} derived_key = { 0 };
23e8b4371dbd59 Eric Biggers 2025-06-30  261  
23e8b4371dbd59 Eric Biggers 2025-06-30  262  	if (unlikely(raw_key_len > SHA512_BLOCK_SIZE)) {
23e8b4371dbd59 Eric Biggers 2025-06-30  263  		if (iv == &sha384_iv)
23e8b4371dbd59 Eric Biggers 2025-06-30  264  			sha384(raw_key, raw_key_len, derived_key.b);
23e8b4371dbd59 Eric Biggers 2025-06-30  265  		else
23e8b4371dbd59 Eric Biggers 2025-06-30  266  			sha512(raw_key, raw_key_len, derived_key.b);
23e8b4371dbd59 Eric Biggers 2025-06-30  267  	} else {
23e8b4371dbd59 Eric Biggers 2025-06-30  268  		memcpy(derived_key.b, raw_key, raw_key_len);
23e8b4371dbd59 Eric Biggers 2025-06-30  269  	}
23e8b4371dbd59 Eric Biggers 2025-06-30  270  
23e8b4371dbd59 Eric Biggers 2025-06-30  271  	for (size_t i = 0; i < ARRAY_SIZE(derived_key.w); i++)
23e8b4371dbd59 Eric Biggers 2025-06-30  272  		derived_key.w[i] ^= REPEAT_BYTE(HMAC_IPAD_VALUE);
7941ad69650691 Eric Biggers 2025-07-11  273  	*istate = *iv;
7941ad69650691 Eric Biggers 2025-07-11  274  	sha512_blocks(istate, derived_key.b, 1);
23e8b4371dbd59 Eric Biggers 2025-06-30  275  
23e8b4371dbd59 Eric Biggers 2025-06-30  276  	for (size_t i = 0; i < ARRAY_SIZE(derived_key.w); i++)
23e8b4371dbd59 Eric Biggers 2025-06-30  277  		derived_key.w[i] ^= REPEAT_BYTE(HMAC_OPAD_VALUE ^
23e8b4371dbd59 Eric Biggers 2025-06-30  278  						HMAC_IPAD_VALUE);
7941ad69650691 Eric Biggers 2025-07-11  279  	*ostate = *iv;
7941ad69650691 Eric Biggers 2025-07-11  280  	sha512_blocks(ostate, derived_key.b, 1);
23e8b4371dbd59 Eric Biggers 2025-06-30  281  
23e8b4371dbd59 Eric Biggers 2025-06-30  282  	memzero_explicit(&derived_key, sizeof(derived_key));
23e8b4371dbd59 Eric Biggers 2025-06-30  283  }
23e8b4371dbd59 Eric Biggers 2025-06-30  284  
23e8b4371dbd59 Eric Biggers 2025-06-30  285  void hmac_sha384_preparekey(struct hmac_sha384_key *key,
23e8b4371dbd59 Eric Biggers 2025-06-30  286  			    const u8 *raw_key, size_t raw_key_len)
23e8b4371dbd59 Eric Biggers 2025-06-30  287  {
7941ad69650691 Eric Biggers 2025-07-11  288  	__hmac_sha512_preparekey(&key->key.istate, &key->key.ostate,
7941ad69650691 Eric Biggers 2025-07-11  289  				 raw_key, raw_key_len, &sha384_iv);
23e8b4371dbd59 Eric Biggers 2025-06-30  290  }
23e8b4371dbd59 Eric Biggers 2025-06-30  291  EXPORT_SYMBOL_GPL(hmac_sha384_preparekey);
23e8b4371dbd59 Eric Biggers 2025-06-30  292  
23e8b4371dbd59 Eric Biggers 2025-06-30  293  void hmac_sha512_preparekey(struct hmac_sha512_key *key,
23e8b4371dbd59 Eric Biggers 2025-06-30  294  			    const u8 *raw_key, size_t raw_key_len)
23e8b4371dbd59 Eric Biggers 2025-06-30  295  {
7941ad69650691 Eric Biggers 2025-07-11  296  	__hmac_sha512_preparekey(&key->key.istate, &key->key.ostate,
7941ad69650691 Eric Biggers 2025-07-11  297  				 raw_key, raw_key_len, &sha512_iv);
23e8b4371dbd59 Eric Biggers 2025-06-30  298  }
23e8b4371dbd59 Eric Biggers 2025-06-30  299  EXPORT_SYMBOL_GPL(hmac_sha512_preparekey);
23e8b4371dbd59 Eric Biggers 2025-06-30  300  
23e8b4371dbd59 Eric Biggers 2025-06-30  301  void __hmac_sha512_init(struct __hmac_sha512_ctx *ctx,
23e8b4371dbd59 Eric Biggers 2025-06-30  302  			const struct __hmac_sha512_key *key)
23e8b4371dbd59 Eric Biggers 2025-06-30  303  {
23e8b4371dbd59 Eric Biggers 2025-06-30  304  	__sha512_init(&ctx->sha_ctx, &key->istate, SHA512_BLOCK_SIZE);
23e8b4371dbd59 Eric Biggers 2025-06-30  305  	ctx->ostate = key->ostate;
23e8b4371dbd59 Eric Biggers 2025-06-30  306  }
23e8b4371dbd59 Eric Biggers 2025-06-30  307  EXPORT_SYMBOL_GPL(__hmac_sha512_init);
23e8b4371dbd59 Eric Biggers 2025-06-30  308  
7941ad69650691 Eric Biggers 2025-07-11  309  void hmac_sha384_init_usingrawkey(struct hmac_sha384_ctx *ctx,
7941ad69650691 Eric Biggers 2025-07-11  310  				  const u8 *raw_key, size_t raw_key_len)
7941ad69650691 Eric Biggers 2025-07-11  311  {
7941ad69650691 Eric Biggers 2025-07-11  312  	__hmac_sha512_preparekey(&ctx->ctx.sha_ctx.state, &ctx->ctx.ostate,
7941ad69650691 Eric Biggers 2025-07-11  313  				 raw_key, raw_key_len, &sha384_iv);
7941ad69650691 Eric Biggers 2025-07-11  314  	ctx->ctx.sha_ctx.bytecount_lo = SHA512_BLOCK_SIZE;
7941ad69650691 Eric Biggers 2025-07-11  315  	ctx->ctx.sha_ctx.bytecount_hi = 0;
7941ad69650691 Eric Biggers 2025-07-11  316  }
7941ad69650691 Eric Biggers 2025-07-11  317  EXPORT_SYMBOL_GPL(hmac_sha384_init_usingrawkey);
7941ad69650691 Eric Biggers 2025-07-11  318  
7941ad69650691 Eric Biggers 2025-07-11  319  void hmac_sha512_init_usingrawkey(struct hmac_sha512_ctx *ctx,
7941ad69650691 Eric Biggers 2025-07-11  320  				  const u8 *raw_key, size_t raw_key_len)
7941ad69650691 Eric Biggers 2025-07-11  321  {
7941ad69650691 Eric Biggers 2025-07-11  322  	__hmac_sha512_preparekey(&ctx->ctx.sha_ctx.state, &ctx->ctx.ostate,
7941ad69650691 Eric Biggers 2025-07-11  323  				 raw_key, raw_key_len, &sha512_iv);
7941ad69650691 Eric Biggers 2025-07-11  324  	ctx->ctx.sha_ctx.bytecount_lo = SHA512_BLOCK_SIZE;
7941ad69650691 Eric Biggers 2025-07-11  325  	ctx->ctx.sha_ctx.bytecount_hi = 0;
7941ad69650691 Eric Biggers 2025-07-11  326  }
7941ad69650691 Eric Biggers 2025-07-11  327  EXPORT_SYMBOL_GPL(hmac_sha512_init_usingrawkey);
7941ad69650691 Eric Biggers 2025-07-11  328  
23e8b4371dbd59 Eric Biggers 2025-06-30  329  static void __hmac_sha512_final(struct __hmac_sha512_ctx *ctx,
23e8b4371dbd59 Eric Biggers 2025-06-30  330  				u8 *out, size_t digest_size)
23e8b4371dbd59 Eric Biggers 2025-06-30  331  {
23e8b4371dbd59 Eric Biggers 2025-06-30  332  	/* Generate the padded input for the outer hash in ctx->sha_ctx.buf. */
23e8b4371dbd59 Eric Biggers 2025-06-30  333  	__sha512_final(&ctx->sha_ctx, ctx->sha_ctx.buf, digest_size);
23e8b4371dbd59 Eric Biggers 2025-06-30  334  	memset(&ctx->sha_ctx.buf[digest_size], 0,
23e8b4371dbd59 Eric Biggers 2025-06-30  335  	       SHA512_BLOCK_SIZE - digest_size);
23e8b4371dbd59 Eric Biggers 2025-06-30  336  	ctx->sha_ctx.buf[digest_size] = 0x80;
23e8b4371dbd59 Eric Biggers 2025-06-30  337  	*(__be32 *)&ctx->sha_ctx.buf[SHA512_BLOCK_SIZE - 4] =
23e8b4371dbd59 Eric Biggers 2025-06-30  338  		cpu_to_be32(8 * (SHA512_BLOCK_SIZE + digest_size));
23e8b4371dbd59 Eric Biggers 2025-06-30  339  
23e8b4371dbd59 Eric Biggers 2025-06-30  340  	/* Compute the outer hash, which gives the HMAC value. */
23e8b4371dbd59 Eric Biggers 2025-06-30  341  	sha512_blocks(&ctx->ostate, ctx->sha_ctx.buf, 1);
23e8b4371dbd59 Eric Biggers 2025-06-30  342  	for (size_t i = 0; i < digest_size; i += 8)
23e8b4371dbd59 Eric Biggers 2025-06-30  343  		put_unaligned_be64(ctx->ostate.h[i / 8], out + i);
23e8b4371dbd59 Eric Biggers 2025-06-30  344  
23e8b4371dbd59 Eric Biggers 2025-06-30  345  	memzero_explicit(ctx, sizeof(*ctx));
23e8b4371dbd59 Eric Biggers 2025-06-30  346  }
23e8b4371dbd59 Eric Biggers 2025-06-30  347  
23e8b4371dbd59 Eric Biggers 2025-06-30 @348  void hmac_sha384_final(struct hmac_sha384_ctx *ctx,
23e8b4371dbd59 Eric Biggers 2025-06-30  349  		       u8 out[SHA384_DIGEST_SIZE])
23e8b4371dbd59 Eric Biggers 2025-06-30  350  {
23e8b4371dbd59 Eric Biggers 2025-06-30  351  	__hmac_sha512_final(&ctx->ctx, out, SHA384_DIGEST_SIZE);
23e8b4371dbd59 Eric Biggers 2025-06-30  352  }
23e8b4371dbd59 Eric Biggers 2025-06-30  353  EXPORT_SYMBOL_GPL(hmac_sha384_final);
23e8b4371dbd59 Eric Biggers 2025-06-30  354  
23e8b4371dbd59 Eric Biggers 2025-06-30 @355  void hmac_sha512_final(struct hmac_sha512_ctx *ctx,
23e8b4371dbd59 Eric Biggers 2025-06-30  356  		       u8 out[SHA512_DIGEST_SIZE])
23e8b4371dbd59 Eric Biggers 2025-06-30  357  {
23e8b4371dbd59 Eric Biggers 2025-06-30  358  	__hmac_sha512_final(&ctx->ctx, out, SHA512_DIGEST_SIZE);
23e8b4371dbd59 Eric Biggers 2025-06-30  359  }
23e8b4371dbd59 Eric Biggers 2025-06-30  360  EXPORT_SYMBOL_GPL(hmac_sha512_final);
23e8b4371dbd59 Eric Biggers 2025-06-30  361  
23e8b4371dbd59 Eric Biggers 2025-06-30 @362  void hmac_sha384(const struct hmac_sha384_key *key,
23e8b4371dbd59 Eric Biggers 2025-06-30  363  		 const u8 *data, size_t data_len, u8 out[SHA384_DIGEST_SIZE])
23e8b4371dbd59 Eric Biggers 2025-06-30  364  {
23e8b4371dbd59 Eric Biggers 2025-06-30  365  	struct hmac_sha384_ctx ctx;
23e8b4371dbd59 Eric Biggers 2025-06-30  366  
23e8b4371dbd59 Eric Biggers 2025-06-30  367  	hmac_sha384_init(&ctx, key);
23e8b4371dbd59 Eric Biggers 2025-06-30  368  	hmac_sha384_update(&ctx, data, data_len);
23e8b4371dbd59 Eric Biggers 2025-06-30  369  	hmac_sha384_final(&ctx, out);
23e8b4371dbd59 Eric Biggers 2025-06-30  370  }
23e8b4371dbd59 Eric Biggers 2025-06-30  371  EXPORT_SYMBOL_GPL(hmac_sha384);
23e8b4371dbd59 Eric Biggers 2025-06-30  372  
23e8b4371dbd59 Eric Biggers 2025-06-30 @373  void hmac_sha512(const struct hmac_sha512_key *key,
23e8b4371dbd59 Eric Biggers 2025-06-30  374  		 const u8 *data, size_t data_len, u8 out[SHA512_DIGEST_SIZE])
23e8b4371dbd59 Eric Biggers 2025-06-30  375  {
23e8b4371dbd59 Eric Biggers 2025-06-30  376  	struct hmac_sha512_ctx ctx;
23e8b4371dbd59 Eric Biggers 2025-06-30  377  
23e8b4371dbd59 Eric Biggers 2025-06-30  378  	hmac_sha512_init(&ctx, key);
23e8b4371dbd59 Eric Biggers 2025-06-30  379  	hmac_sha512_update(&ctx, data, data_len);
23e8b4371dbd59 Eric Biggers 2025-06-30  380  	hmac_sha512_final(&ctx, out);
23e8b4371dbd59 Eric Biggers 2025-06-30  381  }
23e8b4371dbd59 Eric Biggers 2025-06-30  382  EXPORT_SYMBOL_GPL(hmac_sha512);
23e8b4371dbd59 Eric Biggers 2025-06-30  383  
23e8b4371dbd59 Eric Biggers 2025-06-30 @384  void hmac_sha384_usingrawkey(const u8 *raw_key, size_t raw_key_len,
23e8b4371dbd59 Eric Biggers 2025-06-30  385  			     const u8 *data, size_t data_len,
23e8b4371dbd59 Eric Biggers 2025-06-30  386  			     u8 out[SHA384_DIGEST_SIZE])
23e8b4371dbd59 Eric Biggers 2025-06-30  387  {
7941ad69650691 Eric Biggers 2025-07-11  388  	struct hmac_sha384_ctx ctx;
23e8b4371dbd59 Eric Biggers 2025-06-30  389  
7941ad69650691 Eric Biggers 2025-07-11  390  	hmac_sha384_init_usingrawkey(&ctx, raw_key, raw_key_len);
7941ad69650691 Eric Biggers 2025-07-11  391  	hmac_sha384_update(&ctx, data, data_len);
7941ad69650691 Eric Biggers 2025-07-11  392  	hmac_sha384_final(&ctx, out);
23e8b4371dbd59 Eric Biggers 2025-06-30  393  }
23e8b4371dbd59 Eric Biggers 2025-06-30  394  EXPORT_SYMBOL_GPL(hmac_sha384_usingrawkey);
23e8b4371dbd59 Eric Biggers 2025-06-30  395  
23e8b4371dbd59 Eric Biggers 2025-06-30 @396  void hmac_sha512_usingrawkey(const u8 *raw_key, size_t raw_key_len,
23e8b4371dbd59 Eric Biggers 2025-06-30  397  			     const u8 *data, size_t data_len,
23e8b4371dbd59 Eric Biggers 2025-06-30  398  			     u8 out[SHA512_DIGEST_SIZE])
23e8b4371dbd59 Eric Biggers 2025-06-30  399  {
7941ad69650691 Eric Biggers 2025-07-11  400  	struct hmac_sha512_ctx ctx;
23e8b4371dbd59 Eric Biggers 2025-06-30  401  
7941ad69650691 Eric Biggers 2025-07-11  402  	hmac_sha512_init_usingrawkey(&ctx, raw_key, raw_key_len);
7941ad69650691 Eric Biggers 2025-07-11  403  	hmac_sha512_update(&ctx, data, data_len);
7941ad69650691 Eric Biggers 2025-07-11  404  	hmac_sha512_final(&ctx, out);
23e8b4371dbd59 Eric Biggers 2025-06-30  405  }
23e8b4371dbd59 Eric Biggers 2025-06-30  406  EXPORT_SYMBOL_GPL(hmac_sha512_usingrawkey);
23e8b4371dbd59 Eric Biggers 2025-06-30  407  

:::::: The code at line 218 was first introduced by commit
:::::: b693c703accb08cbd52f0b94d810d6abbca3bfb9 lib/crypto: sha512: Add support for SHA-384 and SHA-512

:::::: TO: Eric Biggers <ebiggers@kernel.org>
:::::: CC: Eric Biggers <ebiggers@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
