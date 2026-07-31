Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 551E735C6B5
	for <oe-kbuild-all@lists.linux.dev>; Fri, 31 Jul 2026 07:08:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785481712; cv=none; b=HK3RK2eRQ2ILEWF4IaiO1gYfZjNWXM+e5HaWaaH50/iESvPobOpPJs35ubn7kGamBkrywqkAfcpBIGkVzM9UESuTVWgu7Z5zxsiXTLo3lhM5TAQHDVRe4PKl1HKPPO0cFHIOxr7kAqd3I3o1eDkSl9qxWAzxM/kksZfwqnLrBYU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785481712; c=relaxed/simple;
	bh=GLsGKnHzfdH4Df6fOi4WVCZbX+FujTdygR8UgjIk5S0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=RTmx0NFNYeIcdzUXjeCVFcI7x72MIGrWNFgLjEczlIO0hBBqmsFzWdLEgnNxsSmCPCPKvNgGPUKvzLszdjELrDaVgHL2w8oQCf2xNJOJ02m1C47HNe9PHYKU4ggF2gfIWCuEFeSUgLh8GLeF43LmigOsANY9dcdFL1cjddVDYxI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=e7g0higH; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="e7g0higH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785481710; x=1817017710;
  h=date:from:to:cc:subject:message-id;
  bh=GLsGKnHzfdH4Df6fOi4WVCZbX+FujTdygR8UgjIk5S0=;
  b=e7g0higHidrMM0QUyCQ6Rzt2f/BVC64GXV6IIyzEQPJUrXP/t/QPLOvb
   zfWkXhvvdpGyy1lvAsUtjOxzwMbuyArvOw8Q+8Vg8Oh776x0aVlJ47rko
   sPYIDYQhOZp/ZHP7gB/8Mv2SGcGLIbbzll5JL1hmaAaTleuTh1v5Ru35i
   crDFCzYksbt0EwUFSr6SMaTELvQeZAoacuT6u91oJX2/qh6N8yhRO/fWN
   J3xcPhKLdkx91vKnnA83CDEjI/iKTtsGEyxQZyXBgpahTuzTrg6I11TIl
   tO+R+VCi41vXqptRzblmANfdDwV3rmv9kB7cpshlWSS6vc7hL5MOV6e+J
   Q==;
X-CSE-ConnectionGUID: 1SkSt34ESGuvlojGPGylJA==
X-CSE-MsgGUID: 3rLozTMoTpKRqLtGwd0JIg==
X-IronPort-AV: E=McAfee;i="6800,10657,11860"; a="108897914"
X-IronPort-AV: E=Sophos;i="6.25,196,1779174000"; 
   d="scan'208";a="108897914"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jul 2026 00:08:30 -0700
X-CSE-ConnectionGUID: gVeNdemyQ9aPCL1xSkBBiw==
X-CSE-MsgGUID: pMLq/j59TvmSeRyrFnpLkw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,196,1779174000"; 
   d="scan'208";a="263997017"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 31 Jul 2026 00:08:28 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wphM2-000000000Gj-0DR3;
	Fri, 31 Jul 2026 07:08:26 +0000
Date: Fri, 31 Jul 2026 15:08:15 +0800
From: kernel test robot <lkp@intel.com>
To: Eric Biggers <ebiggers@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Ard Biesheuvel <ardb@kernel.org>
Subject: crypto/aes.c:38:1: sparse: sparse: static assertion failed:
 "__alignof__(struct aes_cmac_key) <= CRYPTO_MINALIGN"
Message-ID: <202607311436.r2LOv1zf-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   8ba098e6b6ff0db8edf28528d1552be261af30d4
commit: 7137cbf2b5c9feb6302d6da116eab2047c5f05d2 crypto: aes - Add cmac, xcbc, and cbcmac algorithms using library
date:   5 months ago
config: powerpc-randconfig-r131-20260731 (https://download.01.org/0day-ci/archive/20260731/202607311436.r2LOv1zf-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 9.5.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260731/202607311436.r2LOv1zf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 7137cbf2b5c9 ("crypto: aes - Add cmac, xcbc, and cbcmac algorithms using library")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607311436.r2LOv1zf-lkp@intel.com/

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
