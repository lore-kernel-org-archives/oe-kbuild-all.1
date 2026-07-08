Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 207AF187346
	for <oe-kbuild-all@lists.linux.dev>; Wed,  8 Jul 2026 02:51:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783479089; cv=none; b=ZMPV6oLqGX1jZ431f6TqkIXBc++3hm0jHzunKXvUnd9appBmPQVcpZCLOFceAHAz1klPc4LmK1wWtNYJoAq2hL1rvfM6hBEqi0gmeeAJmFV5DiK2QAOByNzz83HlOEGs228ayajxL3ZgT1hnrV5B4Ght+tq39iYaxrN4fTpC0W8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783479089; c=relaxed/simple;
	bh=qeiCSIWrx7TqrrZRPqjJIFpfpXYBZEuUipEeDU9g8dI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Me/eJuODE6wUILkEDMO+SkRPDKhOb2uOJ+FRKcbfRX6nHOffs9/53kv52PWYoavNHASR5EEK9za4a7CQaghEMaE3//qtHYDFIWdeWAQDHMeQGyBFK0aL1R+iyxVYAtx9gXNgY+C/tYdmNiZ+aTnMkEZ2oh0jfz2pqk8efkoft5Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DY0G2z4a; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DY0G2z4a"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783479086; x=1815015086;
  h=date:from:to:cc:subject:message-id;
  bh=qeiCSIWrx7TqrrZRPqjJIFpfpXYBZEuUipEeDU9g8dI=;
  b=DY0G2z4ad7RHbvXmZghh8v8C1M8bBZsD3BJMP++NvgyCnFIYrqSy/aIp
   DLIUD72fZhG5YWh1FcNJ8TnBGLHKKOdfRd9KgpBjluDLcha+swICxNyYt
   LUXE7RDTHV8R35ZR6HQtfv3R+Oz79qhgap6MZTEhU1qaHW6Om4bL9PPV/
   oO0pQNyhMKQi2HGvUUs+Z6pwQ3IIcl07cZ67joCYnH6SUuTtWzLgv4pnh
   xtOIqWDUFoq28GbpZ12CIiGsD7DuC8p8CAeJt0MD55YuCY+PrBdrh+KKy
   6Pgv5cjOlEkFoUb5rQdMIH2VSBLm/Os8q2Ol8HYgiPJfvrSn7KWQvefVQ
   g==;
X-CSE-ConnectionGUID: wT2UyobqQhar5QGZR1IyJQ==
X-CSE-MsgGUID: /zUIaUxbQPqdcrteRagsMg==
X-IronPort-AV: E=McAfee;i="6800,10657,11840"; a="71653987"
X-IronPort-AV: E=Sophos;i="6.25,153,1779174000"; 
   d="scan'208";a="71653987"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jul 2026 19:51:25 -0700
X-CSE-ConnectionGUID: UPHe+73oRBm8GI9oNaUmRw==
X-CSE-MsgGUID: dJeJrIySQAW4FUmOpvzMdw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,153,1779174000"; 
   d="scan'208";a="253069965"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa010.jf.intel.com with ESMTP; 07 Jul 2026 19:51:23 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1whINc-00000000Fwx-2zjm;
	Wed, 08 Jul 2026 02:51:20 +0000
Date: Wed, 08 Jul 2026 10:50:21 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android-mainline-desktop 1/1]
 drivers/crypto/allwinner/sun8i-ss/sun8i-ss-core.c:762:undefined reference to
 `crypto_unregister_rng'
Message-ID: <202607081053.SQySbSRh-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android-mainline-desktop
head:   04d9d5d4a5b4846db859b67e818688aded30010a
commit: cdadc14359378c0cf02251c86ffbc606f55bfadd [1/1] crypto: cryptomgr - Select algorithm types only when CRYPTO_SELFTESTS
config: arm64-randconfig-004-20260708 (https://download.01.org/0day-ci/archive/20260708/202607081053.SQySbSRh-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260708/202607081053.SQySbSRh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: cdadc1435937 ("crypto: cryptomgr - Select algorithm types only when CRYPTO_SELFTESTS")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607081053.SQySbSRh-lkp@intel.com/

All errors (new ones prefixed by >>):

   aarch64-linux-ld: Unexpected GOT/PLT entries detected!
   aarch64-linux-ld: Unexpected run-time procedure linkages detected!
   aarch64-linux-ld: drivers/crypto/allwinner/sun8i-ss/sun8i-ss-core.o: in function `sun8i_ss_unregister_algs':
>> drivers/crypto/allwinner/sun8i-ss/sun8i-ss-core.c:762:(.text+0x2cc): undefined reference to `crypto_unregister_rng'
   aarch64-linux-ld: drivers/crypto/allwinner/sun8i-ss/sun8i-ss-core.o: in function `sun8i_ss_register_algs':
>> drivers/crypto/allwinner/sun8i-ss/sun8i-ss-core.c:711:(.text+0xa7c): undefined reference to `crypto_register_rng'


vim +762 drivers/crypto/allwinner/sun8i-ss/sun8i-ss-core.c

f08fcced6d0017 Corentin Labbe 2019-10-25  673  
f08fcced6d0017 Corentin Labbe 2019-10-25  674  static int sun8i_ss_register_algs(struct sun8i_ss_dev *ss)
f08fcced6d0017 Corentin Labbe 2019-10-25  675  {
fcf5d2dcadde06 Corentin Labbe 2020-09-18  676  	int ss_method, err, id;
fcf5d2dcadde06 Corentin Labbe 2020-09-18  677  	unsigned int i;
f08fcced6d0017 Corentin Labbe 2019-10-25  678  
f08fcced6d0017 Corentin Labbe 2019-10-25  679  	for (i = 0; i < ARRAY_SIZE(ss_algs); i++) {
f08fcced6d0017 Corentin Labbe 2019-10-25  680  		ss_algs[i].ss = ss;
f08fcced6d0017 Corentin Labbe 2019-10-25  681  		switch (ss_algs[i].type) {
f08fcced6d0017 Corentin Labbe 2019-10-25  682  		case CRYPTO_ALG_TYPE_SKCIPHER:
f08fcced6d0017 Corentin Labbe 2019-10-25  683  			id = ss_algs[i].ss_algo_id;
f08fcced6d0017 Corentin Labbe 2019-10-25  684  			ss_method = ss->variant->alg_cipher[id];
f08fcced6d0017 Corentin Labbe 2019-10-25  685  			if (ss_method == SS_ID_NOTSUPP) {
f08fcced6d0017 Corentin Labbe 2019-10-25  686  				dev_info(ss->dev,
f08fcced6d0017 Corentin Labbe 2019-10-25  687  					 "DEBUG: Algo of %s not supported\n",
4c19e8fb5e9ce0 Herbert Xu     2023-08-13  688  					 ss_algs[i].alg.skcipher.base.base.cra_name);
f08fcced6d0017 Corentin Labbe 2019-10-25  689  				ss_algs[i].ss = NULL;
f08fcced6d0017 Corentin Labbe 2019-10-25  690  				break;
f08fcced6d0017 Corentin Labbe 2019-10-25  691  			}
f08fcced6d0017 Corentin Labbe 2019-10-25  692  			id = ss_algs[i].ss_blockmode;
f08fcced6d0017 Corentin Labbe 2019-10-25  693  			ss_method = ss->variant->op_mode[id];
f08fcced6d0017 Corentin Labbe 2019-10-25  694  			if (ss_method == SS_ID_NOTSUPP) {
f08fcced6d0017 Corentin Labbe 2019-10-25  695  				dev_info(ss->dev, "DEBUG: Blockmode of %s not supported\n",
4c19e8fb5e9ce0 Herbert Xu     2023-08-13  696  					 ss_algs[i].alg.skcipher.base.base.cra_name);
f08fcced6d0017 Corentin Labbe 2019-10-25  697  				ss_algs[i].ss = NULL;
f08fcced6d0017 Corentin Labbe 2019-10-25  698  				break;
f08fcced6d0017 Corentin Labbe 2019-10-25  699  			}
f08fcced6d0017 Corentin Labbe 2019-10-25  700  			dev_info(ss->dev, "DEBUG: Register %s\n",
4c19e8fb5e9ce0 Herbert Xu     2023-08-13  701  				 ss_algs[i].alg.skcipher.base.base.cra_name);
4c19e8fb5e9ce0 Herbert Xu     2023-08-13  702  			err = crypto_engine_register_skcipher(&ss_algs[i].alg.skcipher);
f08fcced6d0017 Corentin Labbe 2019-10-25  703  			if (err) {
f08fcced6d0017 Corentin Labbe 2019-10-25  704  				dev_err(ss->dev, "Fail to register %s\n",
4c19e8fb5e9ce0 Herbert Xu     2023-08-13  705  					ss_algs[i].alg.skcipher.base.base.cra_name);
f08fcced6d0017 Corentin Labbe 2019-10-25  706  				ss_algs[i].ss = NULL;
f08fcced6d0017 Corentin Labbe 2019-10-25  707  				return err;
f08fcced6d0017 Corentin Labbe 2019-10-25  708  			}
f08fcced6d0017 Corentin Labbe 2019-10-25  709  			break;
ac2614d721dea2 Corentin Labbe 2020-09-18  710  		case CRYPTO_ALG_TYPE_RNG:
ac2614d721dea2 Corentin Labbe 2020-09-18 @711  			err = crypto_register_rng(&ss_algs[i].alg.rng);
ac2614d721dea2 Corentin Labbe 2020-09-18  712  			if (err) {
ac2614d721dea2 Corentin Labbe 2020-09-18  713  				dev_err(ss->dev, "Fail to register %s\n",
ac2614d721dea2 Corentin Labbe 2020-09-18  714  					ss_algs[i].alg.rng.base.cra_name);
ac2614d721dea2 Corentin Labbe 2020-09-18  715  				ss_algs[i].ss = NULL;
ac2614d721dea2 Corentin Labbe 2020-09-18  716  			}
ac2614d721dea2 Corentin Labbe 2020-09-18  717  			break;
d9b45418a91773 Corentin Labbe 2020-09-18  718  		case CRYPTO_ALG_TYPE_AHASH:
d9b45418a91773 Corentin Labbe 2020-09-18  719  			id = ss_algs[i].ss_algo_id;
d9b45418a91773 Corentin Labbe 2020-09-18  720  			ss_method = ss->variant->alg_hash[id];
d9b45418a91773 Corentin Labbe 2020-09-18  721  			if (ss_method == SS_ID_NOTSUPP) {
d9b45418a91773 Corentin Labbe 2020-09-18  722  				dev_info(ss->dev,
d9b45418a91773 Corentin Labbe 2020-09-18  723  					"DEBUG: Algo of %s not supported\n",
4c19e8fb5e9ce0 Herbert Xu     2023-08-13  724  					ss_algs[i].alg.hash.base.halg.base.cra_name);
d9b45418a91773 Corentin Labbe 2020-09-18  725  				ss_algs[i].ss = NULL;
d9b45418a91773 Corentin Labbe 2020-09-18  726  				break;
d9b45418a91773 Corentin Labbe 2020-09-18  727  			}
d9b45418a91773 Corentin Labbe 2020-09-18  728  			dev_info(ss->dev, "Register %s\n",
4c19e8fb5e9ce0 Herbert Xu     2023-08-13  729  				 ss_algs[i].alg.hash.base.halg.base.cra_name);
4c19e8fb5e9ce0 Herbert Xu     2023-08-13  730  			err = crypto_engine_register_ahash(&ss_algs[i].alg.hash);
d9b45418a91773 Corentin Labbe 2020-09-18  731  			if (err) {
d9b45418a91773 Corentin Labbe 2020-09-18  732  				dev_err(ss->dev, "ERROR: Fail to register %s\n",
4c19e8fb5e9ce0 Herbert Xu     2023-08-13  733  					ss_algs[i].alg.hash.base.halg.base.cra_name);
d9b45418a91773 Corentin Labbe 2020-09-18  734  				ss_algs[i].ss = NULL;
d9b45418a91773 Corentin Labbe 2020-09-18  735  				return err;
d9b45418a91773 Corentin Labbe 2020-09-18  736  			}
d9b45418a91773 Corentin Labbe 2020-09-18  737  			break;
f08fcced6d0017 Corentin Labbe 2019-10-25  738  		default:
f08fcced6d0017 Corentin Labbe 2019-10-25  739  			ss_algs[i].ss = NULL;
4509f43766140a Colin Ian King 2019-11-05  740  			dev_err(ss->dev, "ERROR: tried to register an unknown algo\n");
f08fcced6d0017 Corentin Labbe 2019-10-25  741  		}
f08fcced6d0017 Corentin Labbe 2019-10-25  742  	}
f08fcced6d0017 Corentin Labbe 2019-10-25  743  	return 0;
f08fcced6d0017 Corentin Labbe 2019-10-25  744  }
f08fcced6d0017 Corentin Labbe 2019-10-25  745  
f08fcced6d0017 Corentin Labbe 2019-10-25  746  static void sun8i_ss_unregister_algs(struct sun8i_ss_dev *ss)
f08fcced6d0017 Corentin Labbe 2019-10-25  747  {
fcf5d2dcadde06 Corentin Labbe 2020-09-18  748  	unsigned int i;
f08fcced6d0017 Corentin Labbe 2019-10-25  749  
f08fcced6d0017 Corentin Labbe 2019-10-25  750  	for (i = 0; i < ARRAY_SIZE(ss_algs); i++) {
f08fcced6d0017 Corentin Labbe 2019-10-25  751  		if (!ss_algs[i].ss)
f08fcced6d0017 Corentin Labbe 2019-10-25  752  			continue;
f08fcced6d0017 Corentin Labbe 2019-10-25  753  		switch (ss_algs[i].type) {
f08fcced6d0017 Corentin Labbe 2019-10-25  754  		case CRYPTO_ALG_TYPE_SKCIPHER:
f08fcced6d0017 Corentin Labbe 2019-10-25  755  			dev_info(ss->dev, "Unregister %d %s\n", i,
4c19e8fb5e9ce0 Herbert Xu     2023-08-13  756  				 ss_algs[i].alg.skcipher.base.base.cra_name);
4c19e8fb5e9ce0 Herbert Xu     2023-08-13  757  			crypto_engine_unregister_skcipher(&ss_algs[i].alg.skcipher);
f08fcced6d0017 Corentin Labbe 2019-10-25  758  			break;
ac2614d721dea2 Corentin Labbe 2020-09-18  759  		case CRYPTO_ALG_TYPE_RNG:
ac2614d721dea2 Corentin Labbe 2020-09-18  760  			dev_info(ss->dev, "Unregister %d %s\n", i,
ac2614d721dea2 Corentin Labbe 2020-09-18  761  				 ss_algs[i].alg.rng.base.cra_name);
ac2614d721dea2 Corentin Labbe 2020-09-18 @762  			crypto_unregister_rng(&ss_algs[i].alg.rng);
ac2614d721dea2 Corentin Labbe 2020-09-18  763  			break;
d9b45418a91773 Corentin Labbe 2020-09-18  764  		case CRYPTO_ALG_TYPE_AHASH:
d9b45418a91773 Corentin Labbe 2020-09-18  765  			dev_info(ss->dev, "Unregister %d %s\n", i,
4c19e8fb5e9ce0 Herbert Xu     2023-08-13  766  				 ss_algs[i].alg.hash.base.halg.base.cra_name);
4c19e8fb5e9ce0 Herbert Xu     2023-08-13  767  			crypto_engine_unregister_ahash(&ss_algs[i].alg.hash);
d9b45418a91773 Corentin Labbe 2020-09-18  768  			break;
f08fcced6d0017 Corentin Labbe 2019-10-25  769  		}
f08fcced6d0017 Corentin Labbe 2019-10-25  770  	}
f08fcced6d0017 Corentin Labbe 2019-10-25  771  }
f08fcced6d0017 Corentin Labbe 2019-10-25  772  

:::::: The code at line 762 was first introduced by commit
:::::: ac2614d721dea2ff273af19c6c5d508d58a2bb3e crypto: sun8i-ss - Add support for the PRNG

:::::: TO: Corentin Labbe <clabbe@baylibre.com>
:::::: CC: Herbert Xu <herbert@gondor.apana.org.au>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
