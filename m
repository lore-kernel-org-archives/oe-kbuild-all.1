Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21EC41B423B
	for <oe-kbuild-all@lists.linux.dev>; Fri,  8 Aug 2025 16:09:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754669399; cv=none; b=M2DgSWV0OGAQKkykWTtcCfeOghKJRGZ2iWVaL8gqnnbKkKRIr/wII08DBdAvuiH8NCdzWhqwVooFmIZFOTWal8+8hJ9oZ1iBil2a0bLp7GBk9AVcN8wkuY4RXP6FAMAWze6hh8uuqzH753vqYppJLlr5wHtcCJ+O8j9Hfm/eg8o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754669399; c=relaxed/simple;
	bh=Uklz/sEZzK0SbIB7Kg2n18S5SUmwl+haoxznGRUGuSY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=B3rmgo21+If0AkbUndYATlGHIgB4pEEBLd0E8a6nblRktvzBMvHB4J+47zulsrUg5VyzF6BWVwomTuqdwXLKNjz9UFjyRsSlKS3amIlSiqBAwjko5oe7lcsFm/uhEDau9Lt89JGHiNYlb8JdL3YVpN2apkTrNJBPNfnoXyTyF74=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=f1nMfSRu; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="f1nMfSRu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754669397; x=1786205397;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Uklz/sEZzK0SbIB7Kg2n18S5SUmwl+haoxznGRUGuSY=;
  b=f1nMfSRu2n5Hs+sod2w5T6aYTL8/CcEqRcXSnuRtq2BD5+p9tNSm3XHT
   GEt/LcrahcsZgQtE5T34r5CqTPD/DLsHBTGI8UQAy+oRy1nJlrlKf5rHU
   TRh9pq7yTdArXJM/odyUX6oAuxcRPi0xwMrdBRmk1azHzsmUxLyJQ5g0m
   DA70y9NG5kwbWfGTeLOf1mQWpfpKp7YjBSqe+npgNlofVDA8l2Tab7NPr
   FXs5JIEKY/9Y0+EiUbhhQ+XEORn4qsyGTHT0CXWjuCxOcVFvlyKFiDbmH
   gz0kTrW2PN5aEpdYia4N7mpr++I7qwyogSjkED7Cw7a3sAyg4SrZVFkzi
   Q==;
X-CSE-ConnectionGUID: h8luUW1nTF6oP2TOX4pNwg==
X-CSE-MsgGUID: gAIiRdQOQY6dz4gwTdzKlQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11515"; a="74469722"
X-IronPort-AV: E=Sophos;i="6.17,274,1747724400"; 
   d="scan'208";a="74469722"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Aug 2025 09:09:56 -0700
X-CSE-ConnectionGUID: Ik30TGGxQiqd46MRepIg+w==
X-CSE-MsgGUID: Teh9RusiTkShaSwHXTRSMA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,274,1747724400"; 
   d="scan'208";a="165732139"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by fmviesa009.fm.intel.com with ESMTP; 08 Aug 2025 09:09:55 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ukPfF-00045w-0P;
	Fri, 08 Aug 2025 16:09:53 +0000
Date: Sat, 9 Aug 2025 00:09:06 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12 1/1]
 crypto/fips140-alg-registration.c:243:5: warning: no previous prototype for
 function 'fips140_crypto_register_alg'
Message-ID: <202508090048.rmFZVE65-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android16-6.12
head:   e76cff4952af4ac4652dc74ffbd134ff57c47895
commit: 4084529fba5292734429ed383e66714154919b6b [1/1] ANDROID: fips140: add kernel crypto module
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20250809/202508090048.rmFZVE65-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250809/202508090048.rmFZVE65-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508090048.rmFZVE65-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> crypto/fips140-alg-registration.c:243:5: warning: no previous prototype for function 'fips140_crypto_register_alg' [-Wmissing-prototypes]
     243 | int fips140_crypto_register_alg(struct crypto_alg *alg)
         |     ^
   crypto/fips140-alg-registration.c:243:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     243 | int fips140_crypto_register_alg(struct crypto_alg *alg)
         | ^
         | static 
>> crypto/fips140-alg-registration.c:248:5: warning: no previous prototype for function 'fips140_crypto_register_aead' [-Wmissing-prototypes]
     248 | int fips140_crypto_register_aead(struct aead_alg *alg)
         |     ^
   crypto/fips140-alg-registration.c:248:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     248 | int fips140_crypto_register_aead(struct aead_alg *alg)
         | ^
         | static 
>> crypto/fips140-alg-registration.c:253:5: warning: no previous prototype for function 'fips140_crypto_register_ahash' [-Wmissing-prototypes]
     253 | int fips140_crypto_register_ahash(struct ahash_alg *alg)
         |     ^
   crypto/fips140-alg-registration.c:253:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     253 | int fips140_crypto_register_ahash(struct ahash_alg *alg)
         | ^
         | static 
>> crypto/fips140-alg-registration.c:258:5: warning: no previous prototype for function 'fips140_crypto_register_rng' [-Wmissing-prototypes]
     258 | int fips140_crypto_register_rng(struct rng_alg *alg)
         |     ^
   crypto/fips140-alg-registration.c:258:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     258 | int fips140_crypto_register_rng(struct rng_alg *alg)
         | ^
         | static 
>> crypto/fips140-alg-registration.c:263:5: warning: no previous prototype for function 'fips140_crypto_register_shash' [-Wmissing-prototypes]
     263 | int fips140_crypto_register_shash(struct shash_alg *alg)
         |     ^
   crypto/fips140-alg-registration.c:263:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     263 | int fips140_crypto_register_shash(struct shash_alg *alg)
         | ^
         | static 
>> crypto/fips140-alg-registration.c:268:5: warning: no previous prototype for function 'fips140_crypto_register_skcipher' [-Wmissing-prototypes]
     268 | int fips140_crypto_register_skcipher(struct skcipher_alg *alg)
         |     ^
   crypto/fips140-alg-registration.c:268:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     268 | int fips140_crypto_register_skcipher(struct skcipher_alg *alg)
         | ^
         | static 
>> crypto/fips140-alg-registration.c:276:5: warning: no previous prototype for function 'fips140_aead_register_instance' [-Wmissing-prototypes]
     276 | int fips140_aead_register_instance(struct crypto_template *tmpl,
         |     ^
   crypto/fips140-alg-registration.c:276:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     276 | int fips140_aead_register_instance(struct crypto_template *tmpl,
         | ^
         | static 
>> crypto/fips140-alg-registration.c:283:5: warning: no previous prototype for function 'fips140_ahash_register_instance' [-Wmissing-prototypes]
     283 | int fips140_ahash_register_instance(struct crypto_template *tmpl,
         |     ^
   crypto/fips140-alg-registration.c:283:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     283 | int fips140_ahash_register_instance(struct crypto_template *tmpl,
         | ^
         | static 
>> crypto/fips140-alg-registration.c:290:5: warning: no previous prototype for function 'fips140_shash_register_instance' [-Wmissing-prototypes]
     290 | int fips140_shash_register_instance(struct crypto_template *tmpl,
         |     ^
   crypto/fips140-alg-registration.c:290:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     290 | int fips140_shash_register_instance(struct crypto_template *tmpl,
         | ^
         | static 
>> crypto/fips140-alg-registration.c:297:5: warning: no previous prototype for function 'fips140_skcipher_register_instance' [-Wmissing-prototypes]
     297 | int fips140_skcipher_register_instance(struct crypto_template *tmpl,
         |     ^
   crypto/fips140-alg-registration.c:297:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     297 | int fips140_skcipher_register_instance(struct crypto_template *tmpl,
         | ^
         | static 
>> crypto/fips140-alg-registration.c:306:5: warning: no previous prototype for function 'fips140_crypto_register_algs' [-Wmissing-prototypes]
     306 | int fips140_crypto_register_algs(struct crypto_alg *algs, int count)
         |     ^
   crypto/fips140-alg-registration.c:306:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     306 | int fips140_crypto_register_algs(struct crypto_alg *algs, int count)
         | ^
         | static 
>> crypto/fips140-alg-registration.c:320:5: warning: no previous prototype for function 'fips140_crypto_register_aeads' [-Wmissing-prototypes]
     320 | int fips140_crypto_register_aeads(struct aead_alg *algs, int count)
         |     ^
   crypto/fips140-alg-registration.c:320:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     320 | int fips140_crypto_register_aeads(struct aead_alg *algs, int count)
         | ^
         | static 
>> crypto/fips140-alg-registration.c:334:5: warning: no previous prototype for function 'fips140_crypto_register_ahashes' [-Wmissing-prototypes]
     334 | int fips140_crypto_register_ahashes(struct ahash_alg *algs, int count)
         |     ^
   crypto/fips140-alg-registration.c:334:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     334 | int fips140_crypto_register_ahashes(struct ahash_alg *algs, int count)
         | ^
         | static 
>> crypto/fips140-alg-registration.c:348:5: warning: no previous prototype for function 'fips140_crypto_register_rngs' [-Wmissing-prototypes]
     348 | int fips140_crypto_register_rngs(struct rng_alg *algs, int count)
         |     ^
   crypto/fips140-alg-registration.c:348:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     348 | int fips140_crypto_register_rngs(struct rng_alg *algs, int count)
         | ^
         | static 
>> crypto/fips140-alg-registration.c:362:5: warning: no previous prototype for function 'fips140_crypto_register_shashes' [-Wmissing-prototypes]
     362 | int fips140_crypto_register_shashes(struct shash_alg *algs, int count)
         |     ^
   crypto/fips140-alg-registration.c:362:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     362 | int fips140_crypto_register_shashes(struct shash_alg *algs, int count)
         | ^
         | static 
>> crypto/fips140-alg-registration.c:376:5: warning: no previous prototype for function 'fips140_crypto_register_skciphers' [-Wmissing-prototypes]
     376 | int fips140_crypto_register_skciphers(struct skcipher_alg *algs, int count)
         |     ^
   crypto/fips140-alg-registration.c:376:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     376 | int fips140_crypto_register_skciphers(struct skcipher_alg *algs, int count)
         | ^
         | static 
   16 warnings generated.
--
>> crypto/fips140_gen_hmac.c:122:2: warning: 'HMAC_Update' is deprecated [-Wdeprecated-declarations]
     122 |         HMAC_Update(hmac, start_addr, end_addr - start_addr);
         |         ^
   /usr/include/openssl/hmac.h:45:1: note: 'HMAC_Update' has been explicitly marked deprecated here
      45 | OSSL_DEPRECATEDIN_3_0 int HMAC_Update(HMAC_CTX *ctx, const unsigned char *data,
         | ^
   /usr/include/openssl/macros.h:182:49: note: expanded from macro 'OSSL_DEPRECATEDIN_3_0'
     182 | #   define OSSL_DEPRECATEDIN_3_0                OSSL_DEPRECATED(3.0)
         |                                                 ^
   /usr/include/openssl/macros.h:62:52: note: expanded from macro 'OSSL_DEPRECATED'
      62 | #     define OSSL_DEPRECATED(since) __attribute__((deprecated))
         |                                                    ^
>> crypto/fips140_gen_hmac.c:184:9: warning: 'HMAC_CTX_new' is deprecated [-Wdeprecated-declarations]
     184 |         hmac = HMAC_CTX_new();
         |                ^
   /usr/include/openssl/hmac.h:33:1: note: 'HMAC_CTX_new' has been explicitly marked deprecated here
      33 | OSSL_DEPRECATEDIN_3_0 HMAC_CTX *HMAC_CTX_new(void);
         | ^
   /usr/include/openssl/macros.h:182:49: note: expanded from macro 'OSSL_DEPRECATEDIN_3_0'
     182 | #   define OSSL_DEPRECATEDIN_3_0                OSSL_DEPRECATED(3.0)
         |                                                 ^
   /usr/include/openssl/macros.h:62:52: note: expanded from macro 'OSSL_DEPRECATED'
      62 | #     define OSSL_DEPRECATED(since) __attribute__((deprecated))
         |                                                    ^
>> crypto/fips140_gen_hmac.c:185:2: warning: 'HMAC_Init_ex' is deprecated [-Wdeprecated-declarations]
     185 |         HMAC_Init_ex(hmac, hmac_key, strlen(hmac_key), EVP_sha256(), NULL);
         |         ^
   /usr/include/openssl/hmac.h:43:1: note: 'HMAC_Init_ex' has been explicitly marked deprecated here
      43 | OSSL_DEPRECATEDIN_3_0 int HMAC_Init_ex(HMAC_CTX *ctx, const void *key, int len,
         | ^
   /usr/include/openssl/macros.h:182:49: note: expanded from macro 'OSSL_DEPRECATEDIN_3_0'
     182 | #   define OSSL_DEPRECATEDIN_3_0                OSSL_DEPRECATED(3.0)
         |                                                 ^
   /usr/include/openssl/macros.h:62:52: note: expanded from macro 'OSSL_DEPRECATED'
      62 | #     define OSSL_DEPRECATED(since) __attribute__((deprecated))
         |                                                    ^
>> crypto/fips140_gen_hmac.c:190:2: warning: 'HMAC_Final' is deprecated [-Wdeprecated-declarations]
     190 |         HMAC_Final(hmac, dg, &dglen);
         |         ^
   /usr/include/openssl/hmac.h:47:1: note: 'HMAC_Final' has been explicitly marked deprecated here
      47 | OSSL_DEPRECATEDIN_3_0 int HMAC_Final(HMAC_CTX *ctx, unsigned char *md,
         | ^
   /usr/include/openssl/macros.h:182:49: note: expanded from macro 'OSSL_DEPRECATEDIN_3_0'
     182 | #   define OSSL_DEPRECATEDIN_3_0                OSSL_DEPRECATED(3.0)
         |                                                 ^
   /usr/include/openssl/macros.h:62:52: note: expanded from macro 'OSSL_DEPRECATED'
      62 | #     define OSSL_DEPRECATED(since) __attribute__((deprecated))
         |                                                    ^
   4 warnings generated.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for INTEL_MEI_ME
   Depends on [n]: X86 && PCI [=y]
   Selected by [m]:
   - INTEL_MEI_HDCP [=m] && (DRM_I915 [=n] || DRM_XE [=m])
   - INTEL_MEI_PXP [=m] && (DRM_I915 [=n] || DRM_XE [=m])


vim +/fips140_crypto_register_alg +243 crypto/fips140-alg-registration.c

   242	
 > 243	int fips140_crypto_register_alg(struct crypto_alg *alg)
   244	{
   245		return fips140_prepare_alg(alg) ?: crypto_register_alg(alg);
   246	}
   247	
 > 248	int fips140_crypto_register_aead(struct aead_alg *alg)
   249	{
   250		return fips140_prepare_aead_alg(alg) ?: crypto_register_aead(alg);
   251	}
   252	
 > 253	int fips140_crypto_register_ahash(struct ahash_alg *alg)
   254	{
   255		return fips140_prepare_ahash_alg(alg) ?: crypto_register_ahash(alg);
   256	}
   257	
 > 258	int fips140_crypto_register_rng(struct rng_alg *alg)
   259	{
   260		return fips140_prepare_rng_alg(alg) ?: crypto_register_rng(alg);
   261	}
   262	
 > 263	int fips140_crypto_register_shash(struct shash_alg *alg)
   264	{
   265		return fips140_prepare_shash_alg(alg) ?: crypto_register_shash(alg);
   266	}
   267	
 > 268	int fips140_crypto_register_skcipher(struct skcipher_alg *alg)
   269	{
   270		return fips140_prepare_skcipher_alg(alg) ?:
   271			crypto_register_skcipher(alg);
   272	}
   273	
   274	/* Instance registration */
   275	
 > 276	int fips140_aead_register_instance(struct crypto_template *tmpl,
   277					   struct aead_instance *inst)
   278	{
   279		return fips140_prepare_aead_alg(&inst->alg) ?:
   280			aead_register_instance(tmpl, inst);
   281	}
   282	
 > 283	int fips140_ahash_register_instance(struct crypto_template *tmpl,
   284					    struct ahash_instance *inst)
   285	{
   286		return fips140_prepare_ahash_alg(&inst->alg) ?:
   287			ahash_register_instance(tmpl, inst);
   288	}
   289	
 > 290	int fips140_shash_register_instance(struct crypto_template *tmpl,
   291					    struct shash_instance *inst)
   292	{
   293		return fips140_prepare_shash_alg(&inst->alg) ?:
   294			shash_register_instance(tmpl, inst);
   295	}
   296	
 > 297	int fips140_skcipher_register_instance(struct crypto_template *tmpl,
   298					       struct skcipher_instance *inst)
   299	{
   300		return fips140_prepare_skcipher_alg(&inst->alg) ?:
   301			skcipher_register_instance(tmpl, inst);
   302	}
   303	
   304	/* Bulk algorithm registration */
   305	
 > 306	int fips140_crypto_register_algs(struct crypto_alg *algs, int count)
   307	{
   308		int i;
   309		int err;
   310	
   311		for (i = 0; i < count; i++) {
   312			err = fips140_prepare_alg(&algs[i]);
   313			if (err)
   314				return err;
   315		}
   316	
   317		return crypto_register_algs(algs, count);
   318	}
   319	
 > 320	int fips140_crypto_register_aeads(struct aead_alg *algs, int count)
   321	{
   322		int i;
   323		int err;
   324	
   325		for (i = 0; i < count; i++) {
   326			err = fips140_prepare_aead_alg(&algs[i]);
   327			if (err)
   328				return err;
   329		}
   330	
   331		return crypto_register_aeads(algs, count);
   332	}
   333	
 > 334	int fips140_crypto_register_ahashes(struct ahash_alg *algs, int count)
   335	{
   336		int i;
   337		int err;
   338	
   339		for (i = 0; i < count; i++) {
   340			err = fips140_prepare_ahash_alg(&algs[i]);
   341			if (err)
   342				return err;
   343		}
   344	
   345		return crypto_register_ahashes(algs, count);
   346	}
   347	
 > 348	int fips140_crypto_register_rngs(struct rng_alg *algs, int count)
   349	{
   350		int i;
   351		int err;
   352	
   353		for (i = 0; i < count; i++) {
   354			err = fips140_prepare_rng_alg(&algs[i]);
   355			if (err)
   356				return err;
   357		}
   358	
   359		return crypto_register_rngs(algs, count);
   360	}
   361	
 > 362	int fips140_crypto_register_shashes(struct shash_alg *algs, int count)
   363	{
   364		int i;
   365		int err;
   366	
   367		for (i = 0; i < count; i++) {
   368			err = fips140_prepare_shash_alg(&algs[i]);
   369			if (err)
   370				return err;
   371		}
   372	
   373		return crypto_register_shashes(algs, count);
   374	}
   375	
 > 376	int fips140_crypto_register_skciphers(struct skcipher_alg *algs, int count)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
