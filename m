Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E2FC27735
	for <oe-kbuild-all@lists.linux.dev>; Tue, 29 Apr 2025 02:46:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745894820; cv=none; b=kbEIXkxlAzQRDt/r8ZFqW+rUEvUfieGhOUt+sRK3AHsDJPHSbZKOrbtL57YlYH551ShcG9mnY/OnwX6jDn6Wxs9auLK2JyxiF1Dwj/quhuzG5VOztsHzC3VLF6rTj5uOjtXxdZQwbtW+UHXpj6gfZWfMUWazka/jxjsJmAhj6N8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745894820; c=relaxed/simple;
	bh=W/M3mRTdIXBb+Tz2545Kty/M5iiFR6EMruiaagHKHeU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=EEFwsYqBEkDVhtfRRkAwj/WPYH1+n1rTc1Y5C0N8ZA7ZJYws8FbVvnOM7/Xi1dLYAW32K952UZab/1EHVWj7naJxjSC4n4ohOqizXt4bu0tS5Bvaz40Qtmq+v0lkyu9g7/WncUYsjhHXPpVJbrp8YqtBkidzoUbhl7NwSe9e6YE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FMONIzxw; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FMONIzxw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745894818; x=1777430818;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=W/M3mRTdIXBb+Tz2545Kty/M5iiFR6EMruiaagHKHeU=;
  b=FMONIzxwilWIG7O9eqg6vozeSFVKzmtcXNvJJHeLv2kPwyVL4/BClCdP
   j8A/mlVuL/vzgbFUrv7x0KTFWjcl6SYUi/yh+bg5awFxu6fDLtXheR22y
   uIXaccuymm6Ao6eNAhe7+Yomv2ZDEYfHlTHNU51piu71UDCIY9mXy5PvD
   W/BRFpzdah8RbNyJ28Ck8vfLF5wAkbxZdhcleDvlI42PLqrCsXXHXKhcB
   cBxEtl+iBb50j2xgVoftAPWqx1yTsOAn9aKrEVWNxFKONQEkCvHOqRKgP
   7SH6/KB+5GATW1ZqXF4BdHcjjWmPi6JvKudpRFYsTO4KXteEMmLnkS/OH
   A==;
X-CSE-ConnectionGUID: CZ5CZEtMQx2aSquYPkjajw==
X-CSE-MsgGUID: P2znSBNsR4iaaMmWSa7Ckw==
X-IronPort-AV: E=McAfee;i="6700,10204,11417"; a="51169717"
X-IronPort-AV: E=Sophos;i="6.15,248,1739865600"; 
   d="scan'208";a="51169717"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Apr 2025 19:46:58 -0700
X-CSE-ConnectionGUID: uQ3RsUyPSFC8LDxhysr9QQ==
X-CSE-MsgGUID: AyvghxHkSIGTFItFJXZoJA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,248,1739865600"; 
   d="scan'208";a="133599881"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 28 Apr 2025 19:46:57 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u9azm-0000QV-1Z;
	Tue, 29 Apr 2025 02:46:54 +0000
Date: Tue, 29 Apr 2025 10:46:10 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6-desktop 1/1]
 crypto/fips140-alg-registration.c:243:5: warning: no previous prototype for
 function 'fips140_crypto_register_alg'
Message-ID: <202504291032.xpjXxZEY-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android15-6.6-desktop
head:   320b5ee4628267b1a1129c7c5fd4fba2b9fe9841
commit: 8a99ad0b72e2f0a56d72221a9a20f4f261dfa3c7 [1/1] ANDROID: fips140: add kernel crypto module
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20250429/202504291032.xpjXxZEY-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250429/202504291032.xpjXxZEY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504291032.xpjXxZEY-lkp@intel.com/

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
