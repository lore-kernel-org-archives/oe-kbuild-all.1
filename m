Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 755B51C5D77
	for <oe-kbuild-all@lists.linux.dev>; Sun, 23 Nov 2025 20:09:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763928563; cv=none; b=saVVYZndOOslvJAGyA8e9zor/P/aL/n2vQqNZ0W9ri/qPaNumDcz1Vun/x5H6Snef6sNSs3K4OEOBn1IMiNuo6Q5G6Om4Wd5gF7skNtwJO5gR4chQokK9piHDFp1PxqkACBW/y+z5bu+1v7MQiD2qNTptM4SD+2qZ2EQXhqGEPw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763928563; c=relaxed/simple;
	bh=L6V45JP1CJ2WuwNhPDrT6FICNun6nkXzIJiht8ZZuHg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=uPeou70zboaiBCsLerWJYWKRDoRXFs4WqPkJtPRH7xT742zVmNAoemvQdRkCzpqzRLBWJV5XIIw/ny/X3c/Gz/bqf9jO9rp5dFNFBu6GJSNIa1/AfNZiGpR79OEz9fUA1+WYd8IUoF3gU+cBQ/oqBnOodLGQJMYuZSilEgIRRMQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iYxs/Ydm; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iYxs/Ydm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763928561; x=1795464561;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=L6V45JP1CJ2WuwNhPDrT6FICNun6nkXzIJiht8ZZuHg=;
  b=iYxs/YdmHA4cfOrhGmPpGpTiyVHkL/KVdhxYcSHO/TSbxVcYFQi8ipKj
   6Xc4mhonPe9KhfHPYku0xU02V0a1lpGXyz+4muHMmKMQGtowHzQ4KsPt9
   ydLPkK/b0qslpn5c8iZqfhSZdoqekaA24lyH0GApS5LEy77pTiifOG0os
   ON37XDvtkTrInCOhehcO8dcw15UXmpIgLeWPhM+P+MHZUH3OIBL+lfc+x
   Lt13I9VidUt1HmkqVAAimqmTf3Co3Et1r3e092zo7RcoxBw0vdDvZwBac
   kLlJSMA1dkUcyFg7jkH1oZNg73pa3LfldY2b04qcOM2l0+g72nktyLrlW
   g==;
X-CSE-ConnectionGUID: PHTl05OgTj2KH+bU2vUNcg==
X-CSE-MsgGUID: VP9LlKLeTfWa7XG406z04g==
X-IronPort-AV: E=McAfee;i="6800,10657,11622"; a="65888013"
X-IronPort-AV: E=Sophos;i="6.20,221,1758610800"; 
   d="scan'208";a="65888013"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2025 12:09:20 -0800
X-CSE-ConnectionGUID: AymMQoSHR32u8nBZ1O5eOQ==
X-CSE-MsgGUID: BGIcHlt6RyeOkFHPzlUeEg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,221,1758610800"; 
   d="scan'208";a="222799000"
Received: from igk-lkp-server01.igk.intel.com (HELO 1f7de368ad0d) ([10.211.93.152])
  by orviesa002.jf.intel.com with ESMTP; 23 Nov 2025 12:09:19 -0800
Received: from kbuild by 1f7de368ad0d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vNGOa-0000000003h-1onD;
	Sun, 23 Nov 2025 20:09:16 +0000
Date: Sun, 23 Nov 2025 21:08:22 +0100
From: kernel test robot <lkp@intel.com>
To: Eric Biggers <ebiggers@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [ebiggers:more-at-least-decorations-v1 8/9] lib/crypto/sha1.c:221:6:
 warning: no previous prototype for 'sha1_final'
Message-ID: <202511232136.jSZn1Tma-lkp@intel.com>
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
commit: 9d0bb6f6867eb6f640c52bfaa09a8de6a181c921 [8/9] lib/crypto: sha1: Add at_least decoration to fixed-size array params
config: x86_64-rhel-9.4 (https://download.01.org/0day-ci/archive/20251123/202511232136.jSZn1Tma-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251123/202511232136.jSZn1Tma-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511232136.jSZn1Tma-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from lib/crypto/sha1.c:7:
   include/crypto/sha1.h:87:46: error: 'at_least' undeclared here (not in a function)
      87 | void sha1_final(struct sha1_ctx *ctx, u8 out[at_least SHA1_DIGEST_SIZE]);
         |                                              ^~~~~~~~
   include/crypto/sha1.h:87:54: error: expected ']' before numeric constant
      87 | void sha1_final(struct sha1_ctx *ctx, u8 out[at_least SHA1_DIGEST_SIZE]);
         |                                                      ^
         |                                                      ]
   include/crypto/sha1.h:97:46: error: 'at_least' undeclared here (not in a function)
      97 | void sha1(const u8 *data, size_t len, u8 out[at_least SHA1_DIGEST_SIZE]);
         |                                              ^~~~~~~~
   include/crypto/sha1.h:97:54: error: expected ']' before numeric constant
      97 | void sha1(const u8 *data, size_t len, u8 out[at_least SHA1_DIGEST_SIZE]);
         |                                                      ^
         |                                                      ]
   include/crypto/sha1.h:185:29: error: 'at_least' undeclared here (not in a function)
     185 |                      u8 out[at_least SHA1_DIGEST_SIZE]);
         |                             ^~~~~~~~
   include/crypto/sha1.h:185:37: error: expected ']' before numeric constant
     185 |                      u8 out[at_least SHA1_DIGEST_SIZE]);
         |                                     ^
         |                                     ]
   include/crypto/sha1.h:200:23: error: 'at_least' undeclared here (not in a function)
     200 |                u8 out[at_least SHA1_DIGEST_SIZE]);
         |                       ^~~~~~~~
   include/crypto/sha1.h:200:31: error: expected ']' before numeric constant
     200 |                u8 out[at_least SHA1_DIGEST_SIZE]);
         |                               ^
         |                               ]
   include/crypto/sha1.h:217:35: error: 'at_least' undeclared here (not in a function)
     217 |                            u8 out[at_least SHA1_DIGEST_SIZE]);
         |                                   ^~~~~~~~
   include/crypto/sha1.h:217:43: error: expected ']' before numeric constant
     217 |                            u8 out[at_least SHA1_DIGEST_SIZE]);
         |                                           ^
         |                                           ]
>> lib/crypto/sha1.c:221:6: warning: no previous prototype for 'sha1_final' [-Wmissing-prototypes]
     221 | void sha1_final(struct sha1_ctx *ctx, u8 out[SHA1_DIGEST_SIZE])
         |      ^~~~~~~~~~
>> lib/crypto/sha1.c:228:6: warning: no previous prototype for 'sha1' [-Wmissing-prototypes]
     228 | void sha1(const u8 *data, size_t len, u8 out[SHA1_DIGEST_SIZE])
         |      ^~~~
>> lib/crypto/sha1.c:291:6: warning: no previous prototype for 'hmac_sha1_final' [-Wmissing-prototypes]
     291 | void hmac_sha1_final(struct hmac_sha1_ctx *ctx, u8 out[SHA1_DIGEST_SIZE])
         |      ^~~~~~~~~~~~~~~
>> lib/crypto/sha1.c:310:6: warning: no previous prototype for 'hmac_sha1' [-Wmissing-prototypes]
     310 | void hmac_sha1(const struct hmac_sha1_key *key,
         |      ^~~~~~~~~
>> lib/crypto/sha1.c:321:6: warning: no previous prototype for 'hmac_sha1_usingrawkey' [-Wmissing-prototypes]
     321 | void hmac_sha1_usingrawkey(const u8 *raw_key, size_t raw_key_len,
         |      ^~~~~~~~~~~~~~~~~~~~~


vim +/sha1_final +221 lib/crypto/sha1.c

4cbc84471bb606 Eric Biggers 2025-07-12  220  
4cbc84471bb606 Eric Biggers 2025-07-12 @221  void sha1_final(struct sha1_ctx *ctx, u8 out[SHA1_DIGEST_SIZE])
4cbc84471bb606 Eric Biggers 2025-07-12  222  {
4cbc84471bb606 Eric Biggers 2025-07-12  223  	__sha1_final(ctx, out);
90860aef630c5c Eric Biggers 2025-07-12  224  	memzero_explicit(ctx, sizeof(*ctx));
90860aef630c5c Eric Biggers 2025-07-12  225  }
90860aef630c5c Eric Biggers 2025-07-12  226  EXPORT_SYMBOL_GPL(sha1_final);
90860aef630c5c Eric Biggers 2025-07-12  227  
90860aef630c5c Eric Biggers 2025-07-12 @228  void sha1(const u8 *data, size_t len, u8 out[SHA1_DIGEST_SIZE])
90860aef630c5c Eric Biggers 2025-07-12  229  {
90860aef630c5c Eric Biggers 2025-07-12  230  	struct sha1_ctx ctx;
90860aef630c5c Eric Biggers 2025-07-12  231  
90860aef630c5c Eric Biggers 2025-07-12  232  	sha1_init(&ctx);
90860aef630c5c Eric Biggers 2025-07-12  233  	sha1_update(&ctx, data, len);
90860aef630c5c Eric Biggers 2025-07-12  234  	sha1_final(&ctx, out);
90860aef630c5c Eric Biggers 2025-07-12  235  }
90860aef630c5c Eric Biggers 2025-07-12  236  EXPORT_SYMBOL_GPL(sha1);
90860aef630c5c Eric Biggers 2025-07-12  237  
4cbc84471bb606 Eric Biggers 2025-07-12  238  static void __hmac_sha1_preparekey(struct sha1_block_state *istate,
4cbc84471bb606 Eric Biggers 2025-07-12  239  				   struct sha1_block_state *ostate,
4cbc84471bb606 Eric Biggers 2025-07-12  240  				   const u8 *raw_key, size_t raw_key_len)
4cbc84471bb606 Eric Biggers 2025-07-12  241  {
4cbc84471bb606 Eric Biggers 2025-07-12  242  	union {
4cbc84471bb606 Eric Biggers 2025-07-12  243  		u8 b[SHA1_BLOCK_SIZE];
4cbc84471bb606 Eric Biggers 2025-07-12  244  		unsigned long w[SHA1_BLOCK_SIZE / sizeof(unsigned long)];
4cbc84471bb606 Eric Biggers 2025-07-12  245  	} derived_key = { 0 };
4cbc84471bb606 Eric Biggers 2025-07-12  246  
4cbc84471bb606 Eric Biggers 2025-07-12  247  	if (unlikely(raw_key_len > SHA1_BLOCK_SIZE))
4cbc84471bb606 Eric Biggers 2025-07-12  248  		sha1(raw_key, raw_key_len, derived_key.b);
4cbc84471bb606 Eric Biggers 2025-07-12  249  	else
4cbc84471bb606 Eric Biggers 2025-07-12  250  		memcpy(derived_key.b, raw_key, raw_key_len);
4cbc84471bb606 Eric Biggers 2025-07-12  251  
4cbc84471bb606 Eric Biggers 2025-07-12  252  	for (size_t i = 0; i < ARRAY_SIZE(derived_key.w); i++)
4cbc84471bb606 Eric Biggers 2025-07-12  253  		derived_key.w[i] ^= REPEAT_BYTE(HMAC_IPAD_VALUE);
4cbc84471bb606 Eric Biggers 2025-07-12  254  	*istate = sha1_iv;
4cbc84471bb606 Eric Biggers 2025-07-12  255  	sha1_blocks(istate, derived_key.b, 1);
4cbc84471bb606 Eric Biggers 2025-07-12  256  
4cbc84471bb606 Eric Biggers 2025-07-12  257  	for (size_t i = 0; i < ARRAY_SIZE(derived_key.w); i++)
4cbc84471bb606 Eric Biggers 2025-07-12  258  		derived_key.w[i] ^= REPEAT_BYTE(HMAC_OPAD_VALUE ^
4cbc84471bb606 Eric Biggers 2025-07-12  259  						HMAC_IPAD_VALUE);
4cbc84471bb606 Eric Biggers 2025-07-12  260  	*ostate = sha1_iv;
4cbc84471bb606 Eric Biggers 2025-07-12  261  	sha1_blocks(ostate, derived_key.b, 1);
4cbc84471bb606 Eric Biggers 2025-07-12  262  
4cbc84471bb606 Eric Biggers 2025-07-12  263  	memzero_explicit(&derived_key, sizeof(derived_key));
4cbc84471bb606 Eric Biggers 2025-07-12  264  }
4cbc84471bb606 Eric Biggers 2025-07-12  265  
4cbc84471bb606 Eric Biggers 2025-07-12  266  void hmac_sha1_preparekey(struct hmac_sha1_key *key,
4cbc84471bb606 Eric Biggers 2025-07-12  267  			  const u8 *raw_key, size_t raw_key_len)
4cbc84471bb606 Eric Biggers 2025-07-12  268  {
4cbc84471bb606 Eric Biggers 2025-07-12  269  	__hmac_sha1_preparekey(&key->istate, &key->ostate,
4cbc84471bb606 Eric Biggers 2025-07-12  270  			       raw_key, raw_key_len);
4cbc84471bb606 Eric Biggers 2025-07-12  271  }
4cbc84471bb606 Eric Biggers 2025-07-12  272  EXPORT_SYMBOL_GPL(hmac_sha1_preparekey);
4cbc84471bb606 Eric Biggers 2025-07-12  273  
4cbc84471bb606 Eric Biggers 2025-07-12  274  void hmac_sha1_init(struct hmac_sha1_ctx *ctx, const struct hmac_sha1_key *key)
4cbc84471bb606 Eric Biggers 2025-07-12  275  {
4cbc84471bb606 Eric Biggers 2025-07-12  276  	ctx->sha_ctx.state = key->istate;
4cbc84471bb606 Eric Biggers 2025-07-12  277  	ctx->sha_ctx.bytecount = SHA1_BLOCK_SIZE;
4cbc84471bb606 Eric Biggers 2025-07-12  278  	ctx->ostate = key->ostate;
4cbc84471bb606 Eric Biggers 2025-07-12  279  }
4cbc84471bb606 Eric Biggers 2025-07-12  280  EXPORT_SYMBOL_GPL(hmac_sha1_init);
4cbc84471bb606 Eric Biggers 2025-07-12  281  
4cbc84471bb606 Eric Biggers 2025-07-12  282  void hmac_sha1_init_usingrawkey(struct hmac_sha1_ctx *ctx,
4cbc84471bb606 Eric Biggers 2025-07-12  283  				const u8 *raw_key, size_t raw_key_len)
4cbc84471bb606 Eric Biggers 2025-07-12  284  {
4cbc84471bb606 Eric Biggers 2025-07-12  285  	__hmac_sha1_preparekey(&ctx->sha_ctx.state, &ctx->ostate,
4cbc84471bb606 Eric Biggers 2025-07-12  286  			       raw_key, raw_key_len);
4cbc84471bb606 Eric Biggers 2025-07-12  287  	ctx->sha_ctx.bytecount = SHA1_BLOCK_SIZE;
4cbc84471bb606 Eric Biggers 2025-07-12  288  }
4cbc84471bb606 Eric Biggers 2025-07-12  289  EXPORT_SYMBOL_GPL(hmac_sha1_init_usingrawkey);
4cbc84471bb606 Eric Biggers 2025-07-12  290  
4cbc84471bb606 Eric Biggers 2025-07-12 @291  void hmac_sha1_final(struct hmac_sha1_ctx *ctx, u8 out[SHA1_DIGEST_SIZE])
4cbc84471bb606 Eric Biggers 2025-07-12  292  {
4cbc84471bb606 Eric Biggers 2025-07-12  293  	/* Generate the padded input for the outer hash in ctx->sha_ctx.buf. */
4cbc84471bb606 Eric Biggers 2025-07-12  294  	__sha1_final(&ctx->sha_ctx, ctx->sha_ctx.buf);
4cbc84471bb606 Eric Biggers 2025-07-12  295  	memset(&ctx->sha_ctx.buf[SHA1_DIGEST_SIZE], 0,
4cbc84471bb606 Eric Biggers 2025-07-12  296  	       SHA1_BLOCK_SIZE - SHA1_DIGEST_SIZE);
4cbc84471bb606 Eric Biggers 2025-07-12  297  	ctx->sha_ctx.buf[SHA1_DIGEST_SIZE] = 0x80;
4cbc84471bb606 Eric Biggers 2025-07-12  298  	*(__be32 *)&ctx->sha_ctx.buf[SHA1_BLOCK_SIZE - 4] =
4cbc84471bb606 Eric Biggers 2025-07-12  299  		cpu_to_be32(8 * (SHA1_BLOCK_SIZE + SHA1_DIGEST_SIZE));
4cbc84471bb606 Eric Biggers 2025-07-12  300  
4cbc84471bb606 Eric Biggers 2025-07-12  301  	/* Compute the outer hash, which gives the HMAC value. */
4cbc84471bb606 Eric Biggers 2025-07-12  302  	sha1_blocks(&ctx->ostate, ctx->sha_ctx.buf, 1);
4cbc84471bb606 Eric Biggers 2025-07-12  303  	for (size_t i = 0; i < SHA1_DIGEST_SIZE; i += 4)
4cbc84471bb606 Eric Biggers 2025-07-12  304  		put_unaligned_be32(ctx->ostate.h[i / 4], out + i);
4cbc84471bb606 Eric Biggers 2025-07-12  305  
4cbc84471bb606 Eric Biggers 2025-07-12  306  	memzero_explicit(ctx, sizeof(*ctx));
4cbc84471bb606 Eric Biggers 2025-07-12  307  }
4cbc84471bb606 Eric Biggers 2025-07-12  308  EXPORT_SYMBOL_GPL(hmac_sha1_final);
4cbc84471bb606 Eric Biggers 2025-07-12  309  
4cbc84471bb606 Eric Biggers 2025-07-12 @310  void hmac_sha1(const struct hmac_sha1_key *key,
4cbc84471bb606 Eric Biggers 2025-07-12  311  	       const u8 *data, size_t data_len, u8 out[SHA1_DIGEST_SIZE])
4cbc84471bb606 Eric Biggers 2025-07-12  312  {
4cbc84471bb606 Eric Biggers 2025-07-12  313  	struct hmac_sha1_ctx ctx;
4cbc84471bb606 Eric Biggers 2025-07-12  314  
4cbc84471bb606 Eric Biggers 2025-07-12  315  	hmac_sha1_init(&ctx, key);
4cbc84471bb606 Eric Biggers 2025-07-12  316  	hmac_sha1_update(&ctx, data, data_len);
4cbc84471bb606 Eric Biggers 2025-07-12  317  	hmac_sha1_final(&ctx, out);
4cbc84471bb606 Eric Biggers 2025-07-12  318  }
4cbc84471bb606 Eric Biggers 2025-07-12  319  EXPORT_SYMBOL_GPL(hmac_sha1);
4cbc84471bb606 Eric Biggers 2025-07-12  320  
4cbc84471bb606 Eric Biggers 2025-07-12 @321  void hmac_sha1_usingrawkey(const u8 *raw_key, size_t raw_key_len,
4cbc84471bb606 Eric Biggers 2025-07-12  322  			   const u8 *data, size_t data_len,
4cbc84471bb606 Eric Biggers 2025-07-12  323  			   u8 out[SHA1_DIGEST_SIZE])
4cbc84471bb606 Eric Biggers 2025-07-12  324  {
4cbc84471bb606 Eric Biggers 2025-07-12  325  	struct hmac_sha1_ctx ctx;
4cbc84471bb606 Eric Biggers 2025-07-12  326  
4cbc84471bb606 Eric Biggers 2025-07-12  327  	hmac_sha1_init_usingrawkey(&ctx, raw_key, raw_key_len);
4cbc84471bb606 Eric Biggers 2025-07-12  328  	hmac_sha1_update(&ctx, data, data_len);
4cbc84471bb606 Eric Biggers 2025-07-12  329  	hmac_sha1_final(&ctx, out);
4cbc84471bb606 Eric Biggers 2025-07-12  330  }
4cbc84471bb606 Eric Biggers 2025-07-12  331  EXPORT_SYMBOL_GPL(hmac_sha1_usingrawkey);
4cbc84471bb606 Eric Biggers 2025-07-12  332  

:::::: The code at line 221 was first introduced by commit
:::::: 4cbc84471bb606ddfaf424709dd8d56b56d7ae7b lib/crypto: sha1: Add HMAC support

:::::: TO: Eric Biggers <ebiggers@kernel.org>
:::::: CC: Eric Biggers <ebiggers@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
