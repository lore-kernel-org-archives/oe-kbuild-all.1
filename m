Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A7D23D3332
	for <oe-kbuild-all@lists.linux.dev>; Mon, 25 May 2026 07:27:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779694068; cv=none; b=udn91Glvxk3oONJj43zKzO459rpreiVRrEQgyMm+1pr7idXYwSRXIEy79IRcfSNyYQURKB7elkRAwoYPW/52A4/EOEIvvcSKPTm4+seR8eDBs28CRqcYv8eAATavmovGvjFzyZHH8izOBKnfSZFCb/Yp68hCUz7Q6fUJCqUjRog=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779694068; c=relaxed/simple;
	bh=T/cGizqJUj9Ls5+qUuIMk7N2cpmgL5BBeU+5loNlatY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=LzKCRZ871/jzFOUHxUZFTVfyfDVrCICWynJtfRb5dkOqaUP5jjyllSGFWjxiMzA4/NmpS5fBDfQrqNzxYdpSL6eLzHVeD4BUs+FmL6fzly4SWAzhYT1/naplz8crdv1MUSWoLEyhKagnaYIHKigI0vwQYy2mWpFPyV03Rh9jEJs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hS8o8wEr; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hS8o8wEr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779694067; x=1811230067;
  h=date:from:to:cc:subject:message-id;
  bh=T/cGizqJUj9Ls5+qUuIMk7N2cpmgL5BBeU+5loNlatY=;
  b=hS8o8wEravFSFyGY76m7pTyZu9zqpgVS16LXVRQhiS91wqf8s3rRk8q7
   M9G5tB00WWHBEsOz8GPEXao4fLjp7WRorwPhGiUgdfKNM0ZCocy483Z9f
   yBwYiRlZD89Es52E+QpholgbinP2kKp7OiMlI8k4MZZe/YJVQfeTAOpoV
   qZOSYKdN1aQURD45B21L1F0Zir391HDWB+kNiHqlDLcWhkgqzE0w52fE6
   9SPUYjLcgmA9DvtmX/URY6ZpR5vKkjH+s8ZkCy/SOy5NYNKuP9zaqUuAr
   RAUWvkGoBOQ7JE/xWzu2qP6IyPg5uVl4ZFJdypxAON7EWfkIp4q8jpKpF
   w==;
X-CSE-ConnectionGUID: /o124hPyQmC/v62DL6AcIg==
X-CSE-MsgGUID: C4gMKuc7R8exDeMgt9eW5g==
X-IronPort-AV: E=McAfee;i="6800,10657,11796"; a="80567394"
X-IronPort-AV: E=Sophos;i="6.24,167,1774335600"; 
   d="scan'208";a="80567394"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 May 2026 00:27:45 -0700
X-CSE-ConnectionGUID: p0ViqCM7Q3KVivPSBNmwJw==
X-CSE-MsgGUID: aon7/IZOR36r/1vLGdmipQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,167,1774335600"; 
   d="scan'208";a="237327936"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 25 May 2026 00:27:42 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wRPit-000000001Du-2b6w;
	Mon, 25 May 2026 07:27:39 +0000
Date: Mon, 25 May 2026 15:27:25 +0800
From: kernel test robot <lkp@intel.com>
To: Eric Biggers <ebiggers@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Ard Biesheuvel <ardb@kernel.org>
Subject: crypto/aes.c:38:1: sparse: sparse: static assertion failed:
 "__alignof__(struct aes_cmac_key) <= CRYPTO_MINALIGN"
Message-ID: <202605251540.pExoRJXl-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   e7ae89a0c97ce2b68b0983cd01eda67cf373517d
commit: 7137cbf2b5c9feb6302d6da116eab2047c5f05d2 crypto: aes - Add cmac, xcbc, and cbcmac algorithms using library
date:   3 months ago
config: powerpc-randconfig-r113-20260525 (https://download.01.org/0day-ci/archive/20260525/202605251540.pExoRJXl-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 14.3.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260525/202605251540.pExoRJXl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 7137cbf2b5c9 ("crypto: aes - Add cmac, xcbc, and cbcmac algorithms using library")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605251540.pExoRJXl-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   crypto/aes.c:14:1: sparse: sparse: static assertion failed: "__alignof__(struct aes_key) <= CRYPTO_MINALIGN"
>> crypto/aes.c:38:1: sparse: sparse: static assertion failed: "__alignof__(struct aes_cmac_key) <= CRYPTO_MINALIGN"
>> crypto/aes.c:88:1: sparse: sparse: static assertion failed: "__alignof__(struct aes_enckey) <= CRYPTO_MINALIGN"

vim +38 crypto/aes.c

    37	
  > 38	static_assert(__alignof__(struct aes_cmac_key) <= CRYPTO_MINALIGN);
    39	#define AES_CMAC_KEY(tfm) ((struct aes_cmac_key *)crypto_shash_ctx(tfm))
    40	#define AES_CMAC_CTX(desc) ((struct aes_cmac_ctx *)shash_desc_ctx(desc))
    41	
    42	static int __maybe_unused crypto_aes_cmac_setkey(struct crypto_shash *tfm,
    43							 const u8 *in_key,
    44							 unsigned int key_len)
    45	{
    46		return aes_cmac_preparekey(AES_CMAC_KEY(tfm), in_key, key_len);
    47	}
    48	
    49	static int __maybe_unused crypto_aes_xcbc_setkey(struct crypto_shash *tfm,
    50							 const u8 *in_key,
    51							 unsigned int key_len)
    52	{
    53		if (key_len != AES_KEYSIZE_128)
    54			return -EINVAL;
    55		aes_xcbcmac_preparekey(AES_CMAC_KEY(tfm), in_key);
    56		return 0;
    57	}
    58	
    59	static int __maybe_unused crypto_aes_cmac_init(struct shash_desc *desc)
    60	{
    61		aes_cmac_init(AES_CMAC_CTX(desc), AES_CMAC_KEY(desc->tfm));
    62		return 0;
    63	}
    64	
    65	static int __maybe_unused crypto_aes_cmac_update(struct shash_desc *desc,
    66							 const u8 *data,
    67							 unsigned int len)
    68	{
    69		aes_cmac_update(AES_CMAC_CTX(desc), data, len);
    70		return 0;
    71	}
    72	
    73	static int __maybe_unused crypto_aes_cmac_final(struct shash_desc *desc,
    74							u8 *out)
    75	{
    76		aes_cmac_final(AES_CMAC_CTX(desc), out);
    77		return 0;
    78	}
    79	
    80	static int __maybe_unused crypto_aes_cmac_digest(struct shash_desc *desc,
    81							 const u8 *data,
    82							 unsigned int len, u8 *out)
    83	{
    84		aes_cmac(AES_CMAC_KEY(desc->tfm), data, len, out);
    85		return 0;
    86	}
    87	
  > 88	static_assert(__alignof__(struct aes_enckey) <= CRYPTO_MINALIGN);
    89	#define AES_CBCMAC_KEY(tfm) ((struct aes_enckey *)crypto_shash_ctx(tfm))
    90	#define AES_CBCMAC_CTX(desc) ((struct aes_cbcmac_ctx *)shash_desc_ctx(desc))
    91	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
