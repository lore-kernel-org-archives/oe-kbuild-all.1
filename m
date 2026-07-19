Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0051378D84
	for <oe-kbuild-all@lists.linux.dev>; Sun, 19 Jul 2026 08:00:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784448045; cv=none; b=VQGinHa5askNr+AzIZkcS+y5D9Z/qDg41YH7+rRfpHC5tvNRfHIVp8HsRPkB5UUXiQgHN41dAHKOJgO/qs6m+0IouRhhM/4+/H6OzJ6wU8gN4AZ3DeIiiOqwAXA9QGyyBdTltpPfqMvGzlZx2QzjLJbubzvFpELMiqdWOTBXsno=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784448045; c=relaxed/simple;
	bh=bbfTmlNLDCmKXTDro/W/W+1bBJecfoGYSCPJJngqqZg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=W4c3nGqeijxLH4P1wTXuNsV4K8o0S1JagUHoLadGVlaSqRdAgKLdETpgwFARy1oFlzOMV2jIRU7kiT7MYVS+pS/lj/YlSYPWWEZID3fULR0YPhOWsr67NyMPvXskxybaaBMmE8YN/JCoZx06E0PbkaS4Bza3kFV8kTLgvjoRG2o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fMJslc99; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fMJslc99"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784448044; x=1815984044;
  h=date:from:to:cc:subject:message-id;
  bh=bbfTmlNLDCmKXTDro/W/W+1bBJecfoGYSCPJJngqqZg=;
  b=fMJslc992fZRDvAWiPA0NCAvkh8xQ2mmbjxZ0elQL2/u+tZEeSr+giRm
   GHuqcV84bzNqnYMRlTxUDWYsX+d9tGFbz6X7iwiIVTI8wnWqEkMe5+LyB
   V+NHOJrau4nyyP0lCBrmWbMN06RD3hpWUw4DHPM4sAF2JSbpHGpjYhGDb
   XY8+inrY/Ka331HcvvObNwt/Fc+tABmCs1+vq/VT0nl4VS7cQphgAI2MX
   ZEXOk2pKIVJE67g5yCp4t/ffCiwWyEAkbGHJZwdU3M0lneVGaNrv5WBwv
   CtBykgpq3o5bZ+zS4bLvertDaTux1B9xfdN4+aGKSDlD8MRjmcAg4y3J7
   w==;
X-CSE-ConnectionGUID: ehGEPZQVSHqJyAHehyPmpQ==
X-CSE-MsgGUID: hc+7/sMxTr2lL9G9qJVkgg==
X-IronPort-AV: E=McAfee;i="6800,10657,11850"; a="84936219"
X-IronPort-AV: E=Sophos;i="6.25,172,1779174000"; 
   d="scan'208";a="84936219"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jul 2026 01:00:43 -0700
X-CSE-ConnectionGUID: bwRlcCXkQW+TjvqvTmsZsg==
X-CSE-MsgGUID: jV8iO4nzRn+PuKgvfcBiCQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,172,1779174000"; 
   d="scan'208";a="295371126"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 19 Jul 2026 01:00:41 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wlMRy-00000000VMX-2GAN;
	Sun, 19 Jul 2026 08:00:38 +0000
Date: Sun, 19 Jul 2026 15:59:59 +0800
From: kernel test robot <lkp@intel.com>
To: Eric Biggers <ebiggers@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [ebiggers:wip-rng 5/5] crypto/drbg.c:415:35: error: implicit
 declaration of function 'kzalloc_obj'
Message-ID: <202607191532.UvboDw64-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ebiggers/linux.git wip-rng
head:   2087a31445f0be98a499611a2d0bd798d21a76c4
commit: 2087a31445f0be98a499611a2d0bd798d21a76c4 [5/5] [WIP] crypto: rng - Remove crypto_rng
config: x86_64-rhel-9.4 (https://download.01.org/0day-ci/archive/20260719/202607191532.UvboDw64-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260719/202607191532.UvboDw64-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607191532.UvboDw64-lkp@intel.com/

All errors (new ones prefixed by >>):

   crypto/drbg.c: In function 'crypto_drbg_alloc':
>> crypto/drbg.c:415:35: error: implicit declaration of function 'kzalloc_obj' [-Wimplicit-function-declaration]
     415 |         struct drbg_state *drbg = kzalloc_obj(*drbg);
         |                                   ^~~~~~~~~~~
>> crypto/drbg.c:415:35: error: initialization of 'struct drbg_state *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
   crypto/drbg.c: In function 'crypto_drbg_free':
>> crypto/drbg.c:521:17: error: implicit declaration of function 'kfree_sensitive' [-Wimplicit-function-declaration]
     521 |                 kfree_sensitive(drbg);
         |                 ^~~~~~~~~~~~~~~
   crypto/drbg.c: In function 'drbg_healthcheck_sanity':
>> crypto/drbg.c:605:28: error: expected expression before 'struct'
     605 |         drbg = kzalloc_obj(struct drbg_state);
         |                            ^~~~~~
>> crypto/drbg.c:636:9: error: implicit declaration of function 'kfree' [-Wimplicit-function-declaration]
     636 |         kfree(drbg);
         |         ^~~~~
   crypto/drbg.c: In function 'drbg_selftest_one_vec':
>> crypto/drbg.c:644:9: error: cleanup argument not a function
     644 |         unsigned char *buf __free(kfree_sensitive) = NULL;
         |         ^~~~~~~~
>> crypto/drbg.c:647:15: error: implicit declaration of function 'kzalloc' [-Wimplicit-function-declaration]
     647 |         buf = kzalloc(test->expectedlen, GFP_KERNEL);
         |               ^~~~~~~
>> crypto/drbg.c:647:13: error: assignment to 'unsigned char *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     647 |         buf = kzalloc(test->expectedlen, GFP_KERNEL);
         |             ^


vim +/kzalloc_obj +415 crypto/drbg.c

   408	
   409	/***************************************************************
   410	 * Public API
   411	 ***************************************************************/
   412	
   413	struct drbg_state *crypto_drbg_alloc(void)
   414	{
 > 415		struct drbg_state *drbg = kzalloc_obj(*drbg);
   416	
   417		if (!drbg)
   418			return NULL;
   419	
   420		mutex_init(&drbg->drbg_mutex);
   421		return drbg;
   422	}
   423	EXPORT_SYMBOL_GPL(crypto_drbg_alloc);
   424	
   425	/* Set test entropy in the DRBG. */
   426	void crypto_drbg_set_entropy(struct drbg_state *drbg, const u8 *data,
   427				     size_t len)
   428	{
   429		mutex_lock(&drbg->drbg_mutex);
   430		drbg->test_entropy = data;
   431		drbg->test_entropylen = len;
   432		mutex_unlock(&drbg->drbg_mutex);
   433	}
   434	EXPORT_SYMBOL_GPL(crypto_drbg_set_entropy);
   435	
   436	/* Seed (i.e. instantiate) or re-seed the DRBG. */
   437	int crypto_drbg_seed(struct drbg_state *drbg, const u8 *pers, size_t pers_len)
   438	{
   439		static const u8 initial_key[DRBG_STATE_LEN]; /* all zeroes */
   440		int ret;
   441	
   442		pr_devel("DRBG: Initializing DRBG\n");
   443		guard(mutex)(&drbg->drbg_mutex);
   444	
   445		if (drbg->instantiated)
   446			return drbg_seed(drbg, pers, pers_len, /* reseed= */ true);
   447	
   448		/* 9.1 step 1 is implicit with the selected DRBG type */
   449	
   450		/*
   451		 * 9.1 step 2 is implicit, as this implementation doesn't support
   452		 * prediction resistance
   453		 */
   454	
   455		/* 9.1 step 4 is implicit in DRBG_SEC_STRENGTH */
   456	
   457		memset(drbg->V, 1, DRBG_STATE_LEN);
   458		hmac_sha512_preparekey(&drbg->key, initial_key, DRBG_STATE_LEN);
   459	
   460		/* Allocate jitterentropy if not in test mode. */
   461		if (drbg->test_entropylen == 0) {
   462			drbg->jent = crypto_jent_alloc();
   463			if (!drbg->jent) {
   464				if (fips_enabled)
   465					return -ENOMEM;
   466				pr_info("DRBG: Continuing without Jitter RNG\n");
   467			}
   468		}
   469	
   470		ret = drbg_seed(drbg, pers, pers_len, /* reseed= */ false);
   471		if (ret) {
   472			crypto_jent_free(drbg->jent);
   473			drbg->jent = NULL;
   474			return ret;
   475		}
   476		drbg->instantiated = true;
   477		return 0;
   478	}
   479	EXPORT_SYMBOL_GPL(crypto_drbg_seed);
   480	
   481	/**
   482	 * crypto_drbg_get_bytes() - Generate random numbers
   483	 *
   484	 * @drbg: a DRBG instance.  crypto_drbg_seed() must have been called.
   485	 * @out: the output buffer where random data is to be stored
   486	 * @out_len: number of random bytes to generate
   487	 * @addtl: optional additional input supplied to the RNG
   488	 * @addtl_len: length of addtl in bytes, possibly 0
   489	 *
   490	 * Context: May sleep
   491	 * Return: 0 on success, -errno on error
   492	 */
   493	int crypto_drbg_get_bytes(struct drbg_state *drbg, u8 *out, size_t out_len,
   494				  const u8 *addtl, size_t addtl_len)
   495	{
   496		/*
   497		 * Break the request into multiple requests if needed, to avoid
   498		 * exceeding the maximum request length of the core algorithm.
   499		 */
   500		do {
   501			size_t n = min(out_len, DRBG_MAX_REQUEST_BYTES);
   502			int err;
   503	
   504			mutex_lock(&drbg->drbg_mutex);
   505			err = drbg_generate(drbg, out, n, addtl, addtl_len);
   506			mutex_unlock(&drbg->drbg_mutex);
   507			if (err < 0)
   508				return err;
   509			out += n;
   510			out_len -= n;
   511		} while (out_len);
   512		return 0;
   513	}
   514	EXPORT_SYMBOL_GPL(crypto_drbg_get_bytes);
   515	
   516	/* Uninstantiate the DRBG. */
   517	void crypto_drbg_free(struct drbg_state *drbg)
   518	{
   519		if (drbg) {
   520			crypto_jent_free(drbg->jent);
 > 521			kfree_sensitive(drbg);
   522		}
   523	}
   524	EXPORT_SYMBOL_GPL(crypto_drbg_free);
   525	
   526	static DEFINE_MUTEX(crypto_default_rng_lock);
   527	static struct drbg_state *crypto_default_rng;
   528	static int crypto_default_rng_refcnt;
   529	
   530	static int crypto_get_default_rng(void)
   531	{
   532		struct drbg_state *drbg;
   533		int err;
   534	
   535		guard(mutex)
   536			(&crypto_default_rng_lock);
   537		if (!crypto_default_rng) {
   538			drbg = crypto_drbg_alloc();
   539			if (!drbg)
   540				return -ENOMEM;
   541	
   542			err = crypto_drbg_seed(drbg, NULL, 0);
   543			if (err) {
   544				crypto_drbg_free(drbg);
   545				return err;
   546			}
   547			crypto_default_rng = drbg;
   548		}
   549	
   550		crypto_default_rng_refcnt++;
   551		return 0;
   552	}
   553	
   554	static void crypto_put_default_rng(void)
   555	{
   556		guard(mutex)
   557			(&crypto_default_rng_lock);
   558		crypto_default_rng_refcnt--;
   559	}
   560	
   561	int __crypto_stdrng_get_bytes(void *buf, size_t len)
   562	{
   563		int err;
   564	
   565		err = crypto_get_default_rng();
   566		if (err)
   567			return err;
   568	
   569		err = crypto_drbg_get_bytes(crypto_default_rng, buf, len, NULL, 0);
   570		crypto_put_default_rng();
   571		return err;
   572	}
   573	EXPORT_SYMBOL_GPL(__crypto_stdrng_get_bytes);
   574	
   575	int crypto_del_default_rng(void)
   576	{
   577		guard(mutex)
   578			(&crypto_default_rng_lock);
   579		if (crypto_default_rng_refcnt)
   580			return -EBUSY;
   581	
   582		crypto_drbg_free(crypto_default_rng);
   583		crypto_default_rng = NULL;
   584		return 0;
   585	}
   586	EXPORT_SYMBOL_GPL(crypto_del_default_rng);
   587	
   588	/*
   589	 * Tests as defined in 11.3.2 in addition to the cipher tests: testing
   590	 * of the error handling.
   591	 *
   592	 * Note: testing of failing seed source as defined in 11.3.2 is not applicable
   593	 * as seed source of get_random_bytes does not fail.
   594	 *
   595	 * Note 2: There is no sensible way of testing the reseed counter
   596	 * enforcement, so skip it.
   597	 */
   598	static void __init drbg_healthcheck_sanity(void)
   599	{
   600	#define OUTBUFLEN 16
   601		u8 buf[OUTBUFLEN];
   602		struct drbg_state *drbg = NULL;
   603		int ret;
   604	
 > 605		drbg = kzalloc_obj(struct drbg_state);
   606		if (!drbg)
   607			panic("Out of memory");
   608	
   609		guard(mutex_init)(&drbg->drbg_mutex);
   610		drbg->instantiated = true;
   611	
   612		/*
   613		 * if the following tests fail, it is likely that there is a buffer
   614		 * overflow as buf is much smaller than the requested or provided
   615		 * string lengths -- in case the error handling does not succeed
   616		 * we may get an OOPS. And we want to get an OOPS as this is a
   617		 * grave bug.
   618		 */
   619	
   620		/* overflow addtllen with additional info string */
   621		ret = drbg_generate(drbg, buf, OUTBUFLEN, buf,
   622				    DRBG_MAX_ADDTL_BYTES + 1);
   623		BUG_ON(ret == 0);
   624		/* overflow max_bits */
   625		ret = drbg_generate(drbg, buf, DRBG_MAX_REQUEST_BYTES + 1, NULL, 0);
   626		BUG_ON(ret == 0);
   627	
   628		/* overflow max addtllen with personalization string */
   629		ret = drbg_seed(drbg, buf, DRBG_MAX_ADDTL_BYTES + 1, false);
   630		BUG_ON(ret == 0);
   631		/* all tests passed */
   632	
   633		pr_devel("DRBG: Sanity tests for failure code paths successfully "
   634			 "completed\n");
   635	
   636		kfree(drbg);
   637	}
   638	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
