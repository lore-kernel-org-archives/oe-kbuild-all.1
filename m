Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 635A614A8B
	for <oe-kbuild-all@lists.linux.dev>; Mon, 17 Feb 2025 03:31:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739763099; cv=none; b=JN4UuhNhZa43UO8vL4IhUOM5xbdaJW4gxKi1GuOfrazKvGVsDEpUyc5+Q8y7TvQomZZm0Zu6Ds+5ha70reIuZ4SNyAUYhrEEu/zmr/YprODr3C7rqhmCxriRVwjQ7hpv8eB1peRJee7tZTgfkCHRXdsXZ5kMgs3gCcTn4yie1j0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739763099; c=relaxed/simple;
	bh=Ur/oAQg7lxgkeut3nSFhuzMMhhoylt/eE43T13Cr9+Y=;
	h=Date:From:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=pga5Bl7951XOjk4t3X07WuXmu0OlN29hdKRVc530i8jXtwXMKUVXwv1CD4GcIPXRSeXzNYmygzMdJ96lCK7odhdRrMkcFRkvxFJCqY2d1FtwA0WLsiRPCW0HspyIkIMELm5WSL2J2yUzSlJTfQMxy1T8mnfpW6wdP4z+7Z5Axjo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DJIw4Zpb; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DJIw4Zpb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739763096; x=1771299096;
  h=date:from:cc:subject:message-id:mime-version;
  bh=Ur/oAQg7lxgkeut3nSFhuzMMhhoylt/eE43T13Cr9+Y=;
  b=DJIw4Zpbv2ik0sUJUPUrFMvXrtRNZw6HnFzggKo+IOtpO9+A/Bk7zTR4
   1VNt63We1WFMj3FSnBPfJF72435aMmU28JFV5xevegKC0GupXqNZDNDfF
   n2y8IYhL67axfMg+yzHcazDvxwPAHEhKsPWtIfO3hwNmjfEqdaNethUWo
   V2BKvUO1ZzwP9/6tNQOHEQbaZPBVmZv5bIgOVTsIcPMyb6AJYpbDLq+kU
   ovv7dLm7LelqUAZDN1QzLkZRWfQryStm0ya0U+dnmNLwhx4gNCJskbrJ3
   m39wZsmiO4bPX1V7xzG4FAjBiCebcAQQz4R1JL2EkpKnlpTzHECximP67
   A==;
X-CSE-ConnectionGUID: Vt0vLorJQVastI7d1D3v+w==
X-CSE-MsgGUID: 9W7HjCopQsyn1IdRL8V6sw==
X-IronPort-AV: E=McAfee;i="6700,10204,11347"; a="43267356"
X-IronPort-AV: E=Sophos;i="6.13,291,1732608000"; 
   d="scan'208";a="43267356"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Feb 2025 19:31:35 -0800
X-CSE-ConnectionGUID: /n6qYOm/TMy7tVYqyu469g==
X-CSE-MsgGUID: GkK5jNmuTT6VWRYVzGASKw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="118929246"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 16 Feb 2025 19:31:34 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tjrr2-001CYR-19
	for oe-kbuild-all@lists.linux.dev;
	Mon, 17 Feb 2025 03:31:32 +0000
Date: Mon, 17 Feb 2025 11:31:16 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [intel-lts:pr/57 1/1] drivers/crypto/ccree/cc_cipher.c:465:1:
 warning: the frame size of 1124 bytes is larger than 1024 bytes
Message-ID: <202502171117.GvPVqc2B-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel/linux-intel-lts.git pr/57
head:   6fe7458ff80d33a5dba8b386c88d33ffd2ccb47d
commit: e1354400b25da645c4764ed6844d12f1582c3b66 [1/1] crypto: hash - fix incorrect HASH_MAX_DESCSIZE
config: arc-randconfig-001-20250217 (https://download.01.org/0day-ci/archive/20250217/202502171117.GvPVqc2B-lkp@intel.com/config)
compiler: arceb-elf-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250217/202502171117.GvPVqc2B-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502171117.GvPVqc2B-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/crypto/ccree/cc_cipher.c: In function 'cc_slot_to_key_type':
   drivers/crypto/ccree/cc_cipher.c:272:22: warning: comparison is always true due to limited range of data type [-Wtype-limits]
     272 |         if (slot_num >= CC_FIRST_HW_KEY_SLOT && slot_num <= CC_LAST_HW_KEY_SLOT)
         |                      ^~
   drivers/crypto/ccree/cc_cipher.c: In function 'cc_cipher_setkey':
>> drivers/crypto/ccree/cc_cipher.c:465:1: warning: the frame size of 1124 bytes is larger than 1024 bytes [-Wframe-larger-than=]
     465 | }
         | ^


vim +465 drivers/crypto/ccree/cc_cipher.c

63ee04c8b491ee1 Gilad Ben-Yossef 2018-01-22  382  
a794d8d876d21d1 Gilad Ben-Yossef 2018-04-23  383  static int cc_cipher_setkey(struct crypto_skcipher *sktfm, const u8 *key,
a794d8d876d21d1 Gilad Ben-Yossef 2018-04-23  384  			    unsigned int keylen)
a794d8d876d21d1 Gilad Ben-Yossef 2018-04-23  385  {
a794d8d876d21d1 Gilad Ben-Yossef 2018-04-23  386  	struct crypto_tfm *tfm = crypto_skcipher_tfm(sktfm);
a794d8d876d21d1 Gilad Ben-Yossef 2018-04-23  387  	struct cc_cipher_ctx *ctx_p = crypto_tfm_ctx(tfm);
a794d8d876d21d1 Gilad Ben-Yossef 2018-04-23  388  	struct device *dev = drvdata_to_dev(ctx_p->drvdata);
a794d8d876d21d1 Gilad Ben-Yossef 2018-04-23  389  	struct cc_crypto_alg *cc_alg =
a794d8d876d21d1 Gilad Ben-Yossef 2018-04-23  390  			container_of(tfm->__crt_alg, struct cc_crypto_alg,
a794d8d876d21d1 Gilad Ben-Yossef 2018-04-23  391  				     skcipher_alg.base);
a794d8d876d21d1 Gilad Ben-Yossef 2018-04-23  392  	unsigned int max_key_buf_size = cc_alg->skcipher_alg.max_keysize;
a794d8d876d21d1 Gilad Ben-Yossef 2018-04-23  393  
a794d8d876d21d1 Gilad Ben-Yossef 2018-04-23  394  	dev_dbg(dev, "Setting key in context @%p for %s. keylen=%u\n",
a794d8d876d21d1 Gilad Ben-Yossef 2018-04-23  395  		ctx_p, crypto_tfm_alg_name(tfm), keylen);
a794d8d876d21d1 Gilad Ben-Yossef 2018-04-23  396  	dump_byte_array("key", (u8 *)key, keylen);
a794d8d876d21d1 Gilad Ben-Yossef 2018-04-23  397  
a794d8d876d21d1 Gilad Ben-Yossef 2018-04-23  398  	/* STAT_PHASE_0: Init and sanity checks */
a794d8d876d21d1 Gilad Ben-Yossef 2018-04-23  399  
a794d8d876d21d1 Gilad Ben-Yossef 2018-04-23  400  	if (validate_keys_sizes(ctx_p, keylen)) {
a794d8d876d21d1 Gilad Ben-Yossef 2018-04-23  401  		dev_err(dev, "Unsupported key size %d.\n", keylen);
a794d8d876d21d1 Gilad Ben-Yossef 2018-04-23  402  		crypto_tfm_set_flags(tfm, CRYPTO_TFM_RES_BAD_KEY_LEN);
a794d8d876d21d1 Gilad Ben-Yossef 2018-04-23  403  		return -EINVAL;
a794d8d876d21d1 Gilad Ben-Yossef 2018-04-23  404  	}
a794d8d876d21d1 Gilad Ben-Yossef 2018-04-23  405  
52f42c650a2be71 Gilad Ben-Yossef 2019-04-18  406  	ctx_p->key_type = CC_UNPROTECTED_KEY;
a794d8d876d21d1 Gilad Ben-Yossef 2018-04-23  407  
63ee04c8b491ee1 Gilad Ben-Yossef 2018-01-22  408  	/*
63ee04c8b491ee1 Gilad Ben-Yossef 2018-01-22  409  	 * Verify DES weak keys
63ee04c8b491ee1 Gilad Ben-Yossef 2018-01-22  410  	 * Note that we're dropping the expanded key since the
63ee04c8b491ee1 Gilad Ben-Yossef 2018-01-22  411  	 * HW does the expansion on its own.
63ee04c8b491ee1 Gilad Ben-Yossef 2018-01-22  412  	 */
63ee04c8b491ee1 Gilad Ben-Yossef 2018-01-22  413  	if (ctx_p->flow_mode == S_DIN_to_DES) {
5db46ac29a67975 Arnd Bergmann    2019-03-14  414  		u32 tmp[DES3_EDE_EXPKEY_WORDS];
63ee04c8b491ee1 Gilad Ben-Yossef 2018-01-22  415  		if (keylen == DES3_EDE_KEY_SIZE &&
63ee04c8b491ee1 Gilad Ben-Yossef 2018-01-22  416  		    __des3_ede_setkey(tmp, &tfm->crt_flags, key,
63ee04c8b491ee1 Gilad Ben-Yossef 2018-01-22  417  				      DES3_EDE_KEY_SIZE)) {
63ee04c8b491ee1 Gilad Ben-Yossef 2018-01-22  418  			dev_dbg(dev, "weak 3DES key");
63ee04c8b491ee1 Gilad Ben-Yossef 2018-01-22  419  			return -EINVAL;
63ee04c8b491ee1 Gilad Ben-Yossef 2018-01-22  420  		} else if (!des_ekey(tmp, key) &&
231baecdef7a906 Eric Biggers     2019-01-18  421  			   (crypto_tfm_get_flags(tfm) &
231baecdef7a906 Eric Biggers     2019-01-18  422  			    CRYPTO_TFM_REQ_FORBID_WEAK_KEYS)) {
63ee04c8b491ee1 Gilad Ben-Yossef 2018-01-22  423  			tfm->crt_flags |= CRYPTO_TFM_RES_WEAK_KEY;
63ee04c8b491ee1 Gilad Ben-Yossef 2018-01-22  424  			dev_dbg(dev, "weak DES key");
63ee04c8b491ee1 Gilad Ben-Yossef 2018-01-22  425  			return -EINVAL;
63ee04c8b491ee1 Gilad Ben-Yossef 2018-01-22  426  		}
63ee04c8b491ee1 Gilad Ben-Yossef 2018-01-22  427  	}
63ee04c8b491ee1 Gilad Ben-Yossef 2018-01-22  428  
63ee04c8b491ee1 Gilad Ben-Yossef 2018-01-22  429  	if (ctx_p->cipher_mode == DRV_CIPHER_XTS &&
63ee04c8b491ee1 Gilad Ben-Yossef 2018-01-22  430  	    xts_check_key(tfm, key, keylen)) {
63ee04c8b491ee1 Gilad Ben-Yossef 2018-01-22  431  		dev_dbg(dev, "weak XTS key");
63ee04c8b491ee1 Gilad Ben-Yossef 2018-01-22  432  		return -EINVAL;
63ee04c8b491ee1 Gilad Ben-Yossef 2018-01-22  433  	}
63ee04c8b491ee1 Gilad Ben-Yossef 2018-01-22  434  
63ee04c8b491ee1 Gilad Ben-Yossef 2018-01-22  435  	/* STAT_PHASE_1: Copy key to ctx */
63ee04c8b491ee1 Gilad Ben-Yossef 2018-01-22  436  	dma_sync_single_for_cpu(dev, ctx_p->user.key_dma_addr,
63ee04c8b491ee1 Gilad Ben-Yossef 2018-01-22  437  				max_key_buf_size, DMA_TO_DEVICE);
63ee04c8b491ee1 Gilad Ben-Yossef 2018-01-22  438  
63ee04c8b491ee1 Gilad Ben-Yossef 2018-01-22  439  	memcpy(ctx_p->user.key, key, keylen);
63ee04c8b491ee1 Gilad Ben-Yossef 2018-01-22  440  	if (keylen == 24)
63ee04c8b491ee1 Gilad Ben-Yossef 2018-01-22  441  		memset(ctx_p->user.key + 24, 0, CC_AES_KEY_SIZE_MAX - 24);
63ee04c8b491ee1 Gilad Ben-Yossef 2018-01-22  442  
63ee04c8b491ee1 Gilad Ben-Yossef 2018-01-22  443  	if (ctx_p->cipher_mode == DRV_CIPHER_ESSIV) {
63ee04c8b491ee1 Gilad Ben-Yossef 2018-01-22  444  		/* sha256 for key2 - use sw implementation */
63ee04c8b491ee1 Gilad Ben-Yossef 2018-01-22  445  		int key_len = keylen >> 1;
63ee04c8b491ee1 Gilad Ben-Yossef 2018-01-22  446  		int err;
63ee04c8b491ee1 Gilad Ben-Yossef 2018-01-22  447  
63ee04c8b491ee1 Gilad Ben-Yossef 2018-01-22  448  		SHASH_DESC_ON_STACK(desc, ctx_p->shash_tfm);
63ee04c8b491ee1 Gilad Ben-Yossef 2018-01-22  449  
63ee04c8b491ee1 Gilad Ben-Yossef 2018-01-22  450  		desc->tfm = ctx_p->shash_tfm;
63ee04c8b491ee1 Gilad Ben-Yossef 2018-01-22  451  
63ee04c8b491ee1 Gilad Ben-Yossef 2018-01-22  452  		err = crypto_shash_digest(desc, ctx_p->user.key, key_len,
63ee04c8b491ee1 Gilad Ben-Yossef 2018-01-22  453  					  ctx_p->user.key + key_len);
63ee04c8b491ee1 Gilad Ben-Yossef 2018-01-22  454  		if (err) {
63ee04c8b491ee1 Gilad Ben-Yossef 2018-01-22  455  			dev_err(dev, "Failed to hash ESSIV key.\n");
63ee04c8b491ee1 Gilad Ben-Yossef 2018-01-22  456  			return err;
63ee04c8b491ee1 Gilad Ben-Yossef 2018-01-22  457  		}
63ee04c8b491ee1 Gilad Ben-Yossef 2018-01-22  458  	}
63ee04c8b491ee1 Gilad Ben-Yossef 2018-01-22  459  	dma_sync_single_for_device(dev, ctx_p->user.key_dma_addr,
63ee04c8b491ee1 Gilad Ben-Yossef 2018-01-22  460  				   max_key_buf_size, DMA_TO_DEVICE);
63ee04c8b491ee1 Gilad Ben-Yossef 2018-01-22  461  	ctx_p->keylen = keylen;
63ee04c8b491ee1 Gilad Ben-Yossef 2018-01-22  462  
63ee04c8b491ee1 Gilad Ben-Yossef 2018-01-22  463  	dev_dbg(dev, "return safely");
63ee04c8b491ee1 Gilad Ben-Yossef 2018-01-22  464  	return 0;
63ee04c8b491ee1 Gilad Ben-Yossef 2018-01-22 @465  }
63ee04c8b491ee1 Gilad Ben-Yossef 2018-01-22  466  

:::::: The code at line 465 was first introduced by commit
:::::: 63ee04c8b491ee148489347e7da9fbfd982ca2bb crypto: ccree - add skcipher support

:::::: TO: Gilad Ben-Yossef <gilad@benyossef.com>
:::::: CC: Herbert Xu <herbert@gondor.apana.org.au>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
