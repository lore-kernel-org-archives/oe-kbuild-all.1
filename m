Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BC343126B1
	for <oe-kbuild-all@lists.linux.dev>; Wed, 18 Mar 2026 07:00:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773817241; cv=none; b=jb4+842ZPvEeuRytM4hK9+3RxSdCLWG4mmPjsBkA/3B5AaUoKdXSgvHpCM1L2iB76aXmvX1QIMjhnc08GzPEtcDv57D5KhaeLPuImPWamjFFc+5Tjek1wr1HVRZa2CVjYiP6DabBkB90puOCmSTpTiE8jOFkeF14AGuwolcymjE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773817241; c=relaxed/simple;
	bh=eufZ78hRBD1DDNbTz9vhHpzWLGCRYkLtCvxwkwLJBSM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=sXCFdrmJSxAbnoJZY2IYf4sviAdvZcPhQBrq1rQXWHPWSFj9O0U7vhq0GAXzxsxATRxrqFHs5qxe3JmYdWS3gDu0UhtSBDw0mDQtA3Oe1E+4j+R9P3HSiDl3jCBhc+aWZx5ZkSnmsh3owVsvZBEtr6kpDdby7PJgrEWLvQQ7Mvs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=icGxZDp+; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="icGxZDp+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773817239; x=1805353239;
  h=date:from:to:cc:subject:message-id;
  bh=eufZ78hRBD1DDNbTz9vhHpzWLGCRYkLtCvxwkwLJBSM=;
  b=icGxZDp+TFv8Rdv0u8Z2z5TZMrutrgtfhnzogFMvWStE9kUUNMZ/reLN
   otA87kDJU5oh3i34CEzW0blp9rG2EUlAdGlaQPndBc/xkjmkEM5yDViy5
   sXR8GNu82q8fAmEXy9PwjJ01b2Tmop/iV04dRkzqD9p/vOUgwwiUe+rCx
   C2w+Bnbqf7Jc9Sr0AfBRn6t8EUqBTJYrMGQ4Z9wS9s+J5UihvBbo2+ivK
   dSEEYOKbYES/Cu9G0zpSk/P3MQyA20PtgqUYX/rAco3Flrzn6ISoLG0P2
   SXd/L+r9hhzjC89z17HbnkHMpj0E8WdZwHUEuMeKJ84uS0YRxj0BMqnL3
   w==;
X-CSE-ConnectionGUID: 2rRT5LzdQeuqGLQ4JTwH4Q==
X-CSE-MsgGUID: /TJTT3kKThGDPGTXJDqzVw==
X-IronPort-AV: E=McAfee;i="6800,10657,11732"; a="74750619"
X-IronPort-AV: E=Sophos;i="6.23,127,1770624000"; 
   d="scan'208";a="74750619"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Mar 2026 00:00:39 -0700
X-CSE-ConnectionGUID: bgknV6kJQQO1aBvHiErm+g==
X-CSE-MsgGUID: 7jpN5Gk9QBK52HizriLYPQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,127,1770624000"; 
   d="scan'208";a="218577777"
Received: from lkp-server01.sh.intel.com (HELO 63737dd503cb) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 18 Mar 2026 00:00:37 -0700
Received: from kbuild by 63737dd503cb with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w2ktP-000000002ef-017Y;
	Wed, 18 Mar 2026 07:00:35 +0000
Date: Wed, 18 Mar 2026 15:00:04 +0800
From: kernel test robot <lkp@intel.com>
To: Eric Biggers <ebiggers@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [linux-next:master 5773/6828]
 include/crypto/hash.h:779:undefined reference to `crypto_destroy_tfm'
Message-ID: <202603181410.viSZnBxC-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   8e5a478b6d6a5bb0a3d52147862b15e4d826af19
commit: 44a3873df8114546a76ead737f64b57ae7676cc2 [5773/6828] coco/guest: Remove unneeded selection of CRYPTO
config: i386-randconfig-r134-20260317 (https://download.01.org/0day-ci/archive/20260318/202603181410.viSZnBxC-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260318/202603181410.viSZnBxC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603181410.viSZnBxC-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: samples/tsm-mr/tsm_mr_sample.o: in function `sample_report_extend_mr':
   samples/tsm-mr/tsm_mr_sample.c:52:(.text+0x4f): undefined reference to `crypto_alloc_shash'
   ld: samples/tsm-mr/tsm_mr_sample.c:58:(.text+0x7a): undefined reference to `crypto_shash_init'
   ld: samples/tsm-mr/tsm_mr_sample.o: in function `crypto_shash_update':
   include/crypto/hash.h:1006:(.text+0x93): undefined reference to `crypto_shash_finup'
   ld: samples/tsm-mr/tsm_mr_sample.o: in function `sample_report_extend_mr':
   samples/tsm-mr/tsm_mr_sample.c:62:(.text+0xad): undefined reference to `crypto_shash_finup'
   ld: samples/tsm-mr/tsm_mr_sample.o: in function `crypto_free_shash':
>> include/crypto/hash.h:779:(.text+0xbd): undefined reference to `crypto_destroy_tfm'
   ld: samples/tsm-mr/tsm_mr_sample.o: in function `sample_report_refresh':
   samples/tsm-mr/tsm_mr_sample.c:29:(.text+0xf4): undefined reference to `crypto_alloc_shash'
   ld: samples/tsm-mr/tsm_mr_sample.c:35:(.text+0x11b): undefined reference to `crypto_shash_tfm_digest'
   ld: samples/tsm-mr/tsm_mr_sample.o: in function `crypto_free_shash':
   include/crypto/hash.h:779:(.text+0x126): undefined reference to `crypto_destroy_tfm'


vim +779 include/crypto/hash.h

7b5a080b3c46f0 Herbert Xu      2008-08-31  770  
968ab291078006 Stephan Mueller 2014-11-12  771  /**
968ab291078006 Stephan Mueller 2014-11-12  772   * crypto_free_shash() - zeroize and free the message digest handle
968ab291078006 Stephan Mueller 2014-11-12  773   * @tfm: cipher handle to be freed
83681f2bebb34d Ard Biesheuvel  2021-03-02  774   *
83681f2bebb34d Ard Biesheuvel  2021-03-02  775   * If @tfm is a NULL or error pointer, this function does nothing.
968ab291078006 Stephan Mueller 2014-11-12  776   */
7b5a080b3c46f0 Herbert Xu      2008-08-31  777  static inline void crypto_free_shash(struct crypto_shash *tfm)
7b5a080b3c46f0 Herbert Xu      2008-08-31  778  {
412e87ae5d852b Herbert Xu      2009-02-05 @779  	crypto_destroy_tfm(tfm, crypto_shash_tfm(tfm));
7b5a080b3c46f0 Herbert Xu      2008-08-31  780  }
7b5a080b3c46f0 Herbert Xu      2008-08-31  781  

:::::: The code at line 779 was first introduced by commit
:::::: 412e87ae5d852bc3d836f475c19d954b3324363d crypto: shash - Fix tfm destruction

:::::: TO: Herbert Xu <herbert@gondor.apana.org.au>
:::::: CC: Herbert Xu <herbert@gondor.apana.org.au>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
