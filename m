Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31B422367D3
	for <oe-kbuild-all@lists.linux.dev>; Sun, 14 Jun 2026 00:40:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781397659; cv=none; b=OAmdsBX22RwSjFe4MJzxDyI+DsnsebR8gCJB2fjcBM3bF+LahGXwIB/QJObYL7c0GVNyCdkG3PZLS1JyNlKfZKT70sdB/2l0yETvM7DgXEAhADFNM+LLB6HPdkjcGqP8b7fCU4Ja6gNSVydl3TbricsaDg/ykp7CxFHiPRBcjps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781397659; c=relaxed/simple;
	bh=XAhr5r/3WxmD9nWAhuAXlOa6/HGNM9ljkwZdydRgmz8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=LgJwNkFtIh4qV0fqumXgcyKP/dHbb8f/8tG5hjlTGKo22Y2xpxEfkhDom+PnmvdH0VaMTJPoGg2nWVu6iruYvbbIXmtMwlWJKKwb/OJqfDLcTyyHcWxW4Hu5Q9agzyrNzPoVV9aVlbmZpTWm9527KTHLktvtqh8I/RMrwt8TZ0E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dx+iy7nL; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dx+iy7nL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781397656; x=1812933656;
  h=date:from:to:cc:subject:message-id;
  bh=XAhr5r/3WxmD9nWAhuAXlOa6/HGNM9ljkwZdydRgmz8=;
  b=dx+iy7nLpXJ6FNNWbMMY1itTeolza+SFaHHVqdfPrh2wElvaSqm1m4Jb
   raJncuQhjesjvkSyTDnnnaid+PAN1iteUNrVV1h05wR2fNAjSvkYK0p9X
   /1poffeyQIzEaZ7e28oEdhRrfTlziGQ66CLVExbNbryQPsCt6VPtLM+V1
   mVEWjf2vpXbw023xg5gx7SH1ZCC8d6V+so+KFtrJTd3KWqOIH5CjjQXuf
   JquSTXREQJgBgTZ6PVtD97QYqv7Qv6aTF2wA/4S0FchlHAvJEzeQkgYzt
   aAAELj5Q3HOfkZVezq3MWgtfa9UTxDzJ6BT1nIL9QmtTW34WFz6dzO6SV
   A==;
X-CSE-ConnectionGUID: V2tbnD9+TiaqedgflfpQqg==
X-CSE-MsgGUID: CSjCHu3aQ268iI7+05p6JQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11816"; a="82375236"
X-IronPort-AV: E=Sophos;i="6.24,203,1774335600"; 
   d="scan'208";a="82375236"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jun 2026 17:40:56 -0700
X-CSE-ConnectionGUID: fVN3BxiaR4u8D6fOborQtg==
X-CSE-MsgGUID: tL7VSPThRumXTNnssrmXmg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,203,1774335600"; 
   d="scan'208";a="244728317"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 13 Jun 2026 17:40:53 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wYYuB-00000000QQg-11jI;
	Sun, 14 Jun 2026 00:40:51 +0000
Date: Sun, 14 Jun 2026 08:40:27 +0800
From: kernel test robot <lkp@intel.com>
To: Eric Biggers <ebiggers@google.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Herbert Xu <herbert@gondor.apana.org.au>
Subject: crypto/testmgr.c:2462 test_aead_inauthentic_inputs() warn:
 unsigned 'i' is never less than zero.
Message-ID: <202606140825.mm17hdCQ-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   2b07ea76fd28989bde5993532d7a943a6f90e246
commit: ac90aad0e9bf7c37e706fdc08ce763a553890bdf crypto: testmgr - reinstate kconfig control over full self-tests
date:   1 year ago
config: nios2-randconfig-r073-20260614 (https://download.01.org/0day-ci/archive/20260614/202606140825.mm17hdCQ-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 8.5.0
smatch: v0.5.0-9185-gbcc58b9c

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: ac90aad0e9bf ("crypto: testmgr - reinstate kconfig control over full self-tests")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606140825.mm17hdCQ-lkp@intel.com/

New smatch warnings:
crypto/testmgr.c:2462 test_aead_inauthentic_inputs() warn: unsigned 'i' is never less than zero.
crypto/testmgr.c:2462 test_aead_inauthentic_inputs() warn: unsigned 'i' is never less than zero.
crypto/testmgr.c:2564 test_aead_vs_generic_impl() warn: we never enter this loop
crypto/testmgr.c:2564 test_aead_vs_generic_impl() warn: unsigned 'i' is never less than zero.
crypto/testmgr.c:2564 test_aead_vs_generic_impl() warn: unsigned 'i' is never less than zero.

Old smatch warnings:
crypto/testmgr.c:1847 test_hash_vs_generic_impl() warn: we never enter this loop
crypto/testmgr.c:1847 test_hash_vs_generic_impl() warn: unsigned 'i' is never less than zero.
crypto/testmgr.c:1847 test_hash_vs_generic_impl() warn: unsigned 'i' is never less than zero.
crypto/testmgr.c:2462 test_aead_inauthentic_inputs() warn: we never enter this loop
crypto/testmgr.c:3175 test_skcipher_vs_generic_impl() warn: we never enter this loop
crypto/testmgr.c:3175 test_skcipher_vs_generic_impl() warn: unsigned 'i' is never less than zero.
crypto/testmgr.c:3175 test_skcipher_vs_generic_impl() warn: unsigned 'i' is never less than zero.

vim +/i +2462 crypto/testmgr.c

49763fc6b1af42 Eric Biggers 2019-12-01  2452  
49763fc6b1af42 Eric Biggers 2019-12-01  2453  /*
49763fc6b1af42 Eric Biggers 2019-12-01  2454   * Generate inauthentic test vectors (i.e. ciphertext, AAD pairs that aren't the
49763fc6b1af42 Eric Biggers 2019-12-01  2455   * result of an encryption with the key) and verify that decryption fails.
49763fc6b1af42 Eric Biggers 2019-12-01  2456   */
42e45119efba92 Eric Biggers 2025-05-05  2457  static int test_aead_inauthentic_inputs(struct aead_slow_tests_ctx *ctx)
49763fc6b1af42 Eric Biggers 2019-12-01  2458  {
49763fc6b1af42 Eric Biggers 2019-12-01  2459  	unsigned int i;
49763fc6b1af42 Eric Biggers 2019-12-01  2460  	int err;
49763fc6b1af42 Eric Biggers 2019-12-01  2461  
49763fc6b1af42 Eric Biggers 2019-12-01 @2462  	for (i = 0; i < fuzz_iterations * 8; i++) {
49763fc6b1af42 Eric Biggers 2019-12-01  2463  		/*
49763fc6b1af42 Eric Biggers 2019-12-01  2464  		 * Since this part of the tests isn't comparing the
49763fc6b1af42 Eric Biggers 2019-12-01  2465  		 * implementation to another, there's no point in testing any
49763fc6b1af42 Eric Biggers 2019-12-01  2466  		 * test vectors other than inauthentic ones (vec.novrfy=1) here.
49763fc6b1af42 Eric Biggers 2019-12-01  2467  		 *
49763fc6b1af42 Eric Biggers 2019-12-01  2468  		 * If we're having trouble generating such a test vector, e.g.
49763fc6b1af42 Eric Biggers 2019-12-01  2469  		 * if the algorithm keeps rejecting the generated keys, don't
49763fc6b1af42 Eric Biggers 2019-12-01  2470  		 * retry forever; just continue on.
49763fc6b1af42 Eric Biggers 2019-12-01  2471  		 */
49763fc6b1af42 Eric Biggers 2019-12-01  2472  		try_to_generate_inauthentic_testvec(ctx);
49763fc6b1af42 Eric Biggers 2019-12-01  2473  		if (ctx->vec.novrfy) {
f900fde2888360 Eric Biggers 2023-02-27  2474  			generate_random_testvec_config(&ctx->rng, &ctx->cfg,
f900fde2888360 Eric Biggers 2023-02-27  2475  						       ctx->cfgname,
49763fc6b1af42 Eric Biggers 2019-12-01  2476  						       sizeof(ctx->cfgname));
2257f4712dcfb3 Eric Biggers 2020-10-26  2477  			err = test_aead_vec_cfg(DECRYPT, &ctx->vec,
49763fc6b1af42 Eric Biggers 2019-12-01  2478  						ctx->vec_name, &ctx->cfg,
49763fc6b1af42 Eric Biggers 2019-12-01  2479  						ctx->req, ctx->tsgls);
49763fc6b1af42 Eric Biggers 2019-12-01  2480  			if (err)
49763fc6b1af42 Eric Biggers 2019-12-01  2481  				return err;
49763fc6b1af42 Eric Biggers 2019-12-01  2482  		}
49763fc6b1af42 Eric Biggers 2019-12-01  2483  		cond_resched();
49763fc6b1af42 Eric Biggers 2019-12-01  2484  	}
49763fc6b1af42 Eric Biggers 2019-12-01  2485  	return 0;
40153b10d91c9e Eric Biggers 2019-04-11  2486  }
40153b10d91c9e Eric Biggers 2019-04-11  2487  
40153b10d91c9e Eric Biggers 2019-04-11  2488  /*
2ea915054cf2dc Eric Biggers 2019-12-01  2489   * Test the AEAD algorithm against the corresponding generic implementation, if
2ea915054cf2dc Eric Biggers 2019-12-01  2490   * one is available.
40153b10d91c9e Eric Biggers 2019-04-11  2491   */
42e45119efba92 Eric Biggers 2025-05-05  2492  static int test_aead_vs_generic_impl(struct aead_slow_tests_ctx *ctx)
40153b10d91c9e Eric Biggers 2019-04-11  2493  {
2ea915054cf2dc Eric Biggers 2019-12-01  2494  	struct crypto_aead *tfm = ctx->tfm;
40153b10d91c9e Eric Biggers 2019-04-11  2495  	const char *algname = crypto_aead_alg(tfm)->base.cra_name;
2257f4712dcfb3 Eric Biggers 2020-10-26  2496  	const char *driver = crypto_aead_driver_name(tfm);
2ea915054cf2dc Eric Biggers 2019-12-01  2497  	const char *generic_driver = ctx->test_desc->generic_driver;
40153b10d91c9e Eric Biggers 2019-04-11  2498  	char _generic_driver[CRYPTO_MAX_ALG_NAME];
40153b10d91c9e Eric Biggers 2019-04-11  2499  	struct crypto_aead *generic_tfm = NULL;
40153b10d91c9e Eric Biggers 2019-04-11  2500  	struct aead_request *generic_req = NULL;
40153b10d91c9e Eric Biggers 2019-04-11  2501  	unsigned int i;
40153b10d91c9e Eric Biggers 2019-04-11  2502  	int err;
40153b10d91c9e Eric Biggers 2019-04-11  2503  
40153b10d91c9e Eric Biggers 2019-04-11  2504  	if (!generic_driver) { /* Use default naming convention? */
40153b10d91c9e Eric Biggers 2019-04-11  2505  		err = build_generic_driver_name(algname, _generic_driver);
40153b10d91c9e Eric Biggers 2019-04-11  2506  		if (err)
40153b10d91c9e Eric Biggers 2019-04-11  2507  			return err;
40153b10d91c9e Eric Biggers 2019-04-11  2508  		generic_driver = _generic_driver;
40153b10d91c9e Eric Biggers 2019-04-11  2509  	}
40153b10d91c9e Eric Biggers 2019-04-11  2510  
40153b10d91c9e Eric Biggers 2019-04-11  2511  	if (strcmp(generic_driver, driver) == 0) /* Already the generic impl? */
40153b10d91c9e Eric Biggers 2019-04-11  2512  		return 0;
40153b10d91c9e Eric Biggers 2019-04-11  2513  
40153b10d91c9e Eric Biggers 2019-04-11  2514  	generic_tfm = crypto_alloc_aead(generic_driver, 0, 0);
40153b10d91c9e Eric Biggers 2019-04-11  2515  	if (IS_ERR(generic_tfm)) {
40153b10d91c9e Eric Biggers 2019-04-11  2516  		err = PTR_ERR(generic_tfm);
40153b10d91c9e Eric Biggers 2019-04-11  2517  		if (err == -ENOENT) {
40153b10d91c9e Eric Biggers 2019-04-11  2518  			pr_warn("alg: aead: skipping comparison tests for %s because %s is unavailable\n",
40153b10d91c9e Eric Biggers 2019-04-11  2519  				driver, generic_driver);
40153b10d91c9e Eric Biggers 2019-04-11  2520  			return 0;
40153b10d91c9e Eric Biggers 2019-04-11  2521  		}
40153b10d91c9e Eric Biggers 2019-04-11  2522  		pr_err("alg: aead: error allocating %s (generic impl of %s): %d\n",
40153b10d91c9e Eric Biggers 2019-04-11  2523  		       generic_driver, algname, err);
40153b10d91c9e Eric Biggers 2019-04-11  2524  		return err;
40153b10d91c9e Eric Biggers 2019-04-11  2525  	}
40153b10d91c9e Eric Biggers 2019-04-11  2526  
40153b10d91c9e Eric Biggers 2019-04-11  2527  	generic_req = aead_request_alloc(generic_tfm, GFP_KERNEL);
40153b10d91c9e Eric Biggers 2019-04-11  2528  	if (!generic_req) {
40153b10d91c9e Eric Biggers 2019-04-11  2529  		err = -ENOMEM;
40153b10d91c9e Eric Biggers 2019-04-11  2530  		goto out;
40153b10d91c9e Eric Biggers 2019-04-11  2531  	}
40153b10d91c9e Eric Biggers 2019-04-11  2532  
40153b10d91c9e Eric Biggers 2019-04-11  2533  	/* Check the algorithm properties for consistency. */
40153b10d91c9e Eric Biggers 2019-04-11  2534  
2ea915054cf2dc Eric Biggers 2019-12-01  2535  	if (crypto_aead_maxauthsize(tfm) !=
2ea915054cf2dc Eric Biggers 2019-12-01  2536  	    crypto_aead_maxauthsize(generic_tfm)) {
40153b10d91c9e Eric Biggers 2019-04-11  2537  		pr_err("alg: aead: maxauthsize for %s (%u) doesn't match generic impl (%u)\n",
2ea915054cf2dc Eric Biggers 2019-12-01  2538  		       driver, crypto_aead_maxauthsize(tfm),
2ea915054cf2dc Eric Biggers 2019-12-01  2539  		       crypto_aead_maxauthsize(generic_tfm));
40153b10d91c9e Eric Biggers 2019-04-11  2540  		err = -EINVAL;
40153b10d91c9e Eric Biggers 2019-04-11  2541  		goto out;
40153b10d91c9e Eric Biggers 2019-04-11  2542  	}
40153b10d91c9e Eric Biggers 2019-04-11  2543  
2ea915054cf2dc Eric Biggers 2019-12-01  2544  	if (crypto_aead_ivsize(tfm) != crypto_aead_ivsize(generic_tfm)) {
40153b10d91c9e Eric Biggers 2019-04-11  2545  		pr_err("alg: aead: ivsize for %s (%u) doesn't match generic impl (%u)\n",
2ea915054cf2dc Eric Biggers 2019-12-01  2546  		       driver, crypto_aead_ivsize(tfm),
2ea915054cf2dc Eric Biggers 2019-12-01  2547  		       crypto_aead_ivsize(generic_tfm));
40153b10d91c9e Eric Biggers 2019-04-11  2548  		err = -EINVAL;
40153b10d91c9e Eric Biggers 2019-04-11  2549  		goto out;
40153b10d91c9e Eric Biggers 2019-04-11  2550  	}
40153b10d91c9e Eric Biggers 2019-04-11  2551  
2ea915054cf2dc Eric Biggers 2019-12-01  2552  	if (crypto_aead_blocksize(tfm) != crypto_aead_blocksize(generic_tfm)) {
40153b10d91c9e Eric Biggers 2019-04-11  2553  		pr_err("alg: aead: blocksize for %s (%u) doesn't match generic impl (%u)\n",
2ea915054cf2dc Eric Biggers 2019-12-01  2554  		       driver, crypto_aead_blocksize(tfm),
2ea915054cf2dc Eric Biggers 2019-12-01  2555  		       crypto_aead_blocksize(generic_tfm));
40153b10d91c9e Eric Biggers 2019-04-11  2556  		err = -EINVAL;
40153b10d91c9e Eric Biggers 2019-04-11  2557  		goto out;
40153b10d91c9e Eric Biggers 2019-04-11  2558  	}
40153b10d91c9e Eric Biggers 2019-04-11  2559  
40153b10d91c9e Eric Biggers 2019-04-11  2560  	/*
40153b10d91c9e Eric Biggers 2019-04-11  2561  	 * Now generate test vectors using the generic implementation, and test
40153b10d91c9e Eric Biggers 2019-04-11  2562  	 * the other implementation against them.
40153b10d91c9e Eric Biggers 2019-04-11  2563  	 */
40153b10d91c9e Eric Biggers 2019-04-11 @2564  	for (i = 0; i < fuzz_iterations * 8; i++) {
f900fde2888360 Eric Biggers 2023-02-27  2565  		generate_random_aead_testvec(&ctx->rng, generic_req, &ctx->vec,
49763fc6b1af42 Eric Biggers 2019-12-01  2566  					     &ctx->test_desc->suite.aead,
2ea915054cf2dc Eric Biggers 2019-12-01  2567  					     ctx->maxkeysize, ctx->maxdatasize,
2ea915054cf2dc Eric Biggers 2019-12-01  2568  					     ctx->vec_name,
49763fc6b1af42 Eric Biggers 2019-12-01  2569  					     sizeof(ctx->vec_name), false);
f900fde2888360 Eric Biggers 2023-02-27  2570  		generate_random_testvec_config(&ctx->rng, &ctx->cfg,
f900fde2888360 Eric Biggers 2023-02-27  2571  					       ctx->cfgname,
2ea915054cf2dc Eric Biggers 2019-12-01  2572  					       sizeof(ctx->cfgname));
49763fc6b1af42 Eric Biggers 2019-12-01  2573  		if (!ctx->vec.novrfy) {
2257f4712dcfb3 Eric Biggers 2020-10-26  2574  			err = test_aead_vec_cfg(ENCRYPT, &ctx->vec,
2ea915054cf2dc Eric Biggers 2019-12-01  2575  						ctx->vec_name, &ctx->cfg,
2ea915054cf2dc Eric Biggers 2019-12-01  2576  						ctx->req, ctx->tsgls);
40153b10d91c9e Eric Biggers 2019-04-11  2577  			if (err)
40153b10d91c9e Eric Biggers 2019-04-11  2578  				goto out;
49763fc6b1af42 Eric Biggers 2019-12-01  2579  		}
49763fc6b1af42 Eric Biggers 2019-12-01  2580  		if (ctx->vec.crypt_error == 0 || ctx->vec.novrfy) {
2257f4712dcfb3 Eric Biggers 2020-10-26  2581  			err = test_aead_vec_cfg(DECRYPT, &ctx->vec,
2ea915054cf2dc Eric Biggers 2019-12-01  2582  						ctx->vec_name, &ctx->cfg,
2ea915054cf2dc Eric Biggers 2019-12-01  2583  						ctx->req, ctx->tsgls);
40153b10d91c9e Eric Biggers 2019-04-11  2584  			if (err)
40153b10d91c9e Eric Biggers 2019-04-11  2585  				goto out;
eb455dbd02cb10 Eric Biggers 2019-12-01  2586  		}
40153b10d91c9e Eric Biggers 2019-04-11  2587  		cond_resched();
40153b10d91c9e Eric Biggers 2019-04-11  2588  	}
40153b10d91c9e Eric Biggers 2019-04-11  2589  	err = 0;
40153b10d91c9e Eric Biggers 2019-04-11  2590  out:
40153b10d91c9e Eric Biggers 2019-04-11  2591  	crypto_free_aead(generic_tfm);
40153b10d91c9e Eric Biggers 2019-04-11  2592  	aead_request_free(generic_req);
40153b10d91c9e Eric Biggers 2019-04-11  2593  	return err;
40153b10d91c9e Eric Biggers 2019-04-11  2594  }
2ea915054cf2dc Eric Biggers 2019-12-01  2595  

:::::: The code at line 2462 was first introduced by commit
:::::: 49763fc6b1af422e742e58fd04e078ab011edd96 crypto: testmgr - generate inauthentic AEAD test vectors

:::::: TO: Eric Biggers <ebiggers@google.com>
:::::: CC: Herbert Xu <herbert@gondor.apana.org.au>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
