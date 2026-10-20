Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.21
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792491902;
	b=NP7glmA7TSASXpo0MOcTOlYqmTIfdS5lnX7849QPoUSpOyTJ3ddZ93Fq0x7uQ1VZddGZ
	 JT2nOS07Lud/hMMLxsujafa/MWy0Mb/PgRR5I8ZqYUqZ9ZXzStqCt2MQDKG1hAYvDKI6Z
	 XYNQv40QnmKvhFuCyk9bhki9SLkr1z+LnCx7RnMWKBTQ2jJullLHM+t8QSAsiCTM62E8H
	 LSjEkFnXIfYp8a89f1YciLeLJAnofXM6Tbt8CHiu8KbpOcM/EhndsadQH8ZT39727SyAH
	 r49OjG1vzcxoqQIf63Uyc2q/AYxkTr3aGXqF1Cv3+vXStWXJ+wRBvkv0yFfFpsAviAA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792491902;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=/BlEiMuh7yCfeS2vyHJHf5aUGJ7iez8XxYqJpPEOQOI=;
	b=dNTp1/OVY0OSOxc/EBlO0bV4z8cSyW5pts52g7GgPvv6lRZWbvcL/cQJ4XcmBTnkENAR
	 KZzqr3S/jAWhxxsAtPcVWUmYa0j6Qqr2345NOmlpQoSYcuGFmc/DWsha9b9oQRr62FOr6
	 6fm8t7zbcAVon2iEJZeUPrDHiei0Av06pNWRjtc1YcU4YNDCGCIezue1+GrHf47KtXIrF
	 WUobF66FigJ91Lvu/L6mgs6dNZfZo4idG3GQ4pZr2txARKagIbS6ZM8qaaw3PKzp/TG6u
	 e0CGJUJZeNPMg99gQUvGJ/Tg1FsxToiVDrLPFC7o299l1dPa5BCHIwR6zZRJiWFkqdg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=M7KzIGV2;
	arc=none smtp.remote-ip=198.175.65.21
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6A39606A31B
	for <oe-kbuild-all@lists.linux.dev>; Tue, 20 Oct 2026 10:25:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D6A39606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=M7KzIGV2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792491901; x=1824027901;
  h=date:from:to:cc:subject:message-id;
  bh=Hno9jTvPa+bFFtR6DYL3omrD2/u4rj7XjySj3i/uyU4=;
  b=M7KzIGV2x7yQ88knCohejj7TpOWnOpMWM6rcxERhynGcnLf7QV5yI7f+
   JwXx62JozGf7ZEtRlf3aCCorOVfSVGNUSbjCeR1i1wROCvPgnzOTTjNgp
   U3eV0Bp+kFSdbEtbsKUr9CpthAFG8xZSnVoQ9jLtTzB91FF3TSTTqEAEU
   yX1hR7S84sIAkuUBU2fkAgWjGuQXhYcdFEeU0aGauyKyZy+ebFmAsliq4
   WXPh1PUOOjK6HArCx4Dt/Tzx5016C3eeq1CnsCH6sQCdkyXa51fUB3gxD
   87AvlWpc2tBYLDN3N8l8kNjXhHl2CU3lpXS4++KXfC71UvCT+9phYM+Dj
   w==;
X-CSE-ConnectionGUID: ng6R48G+RG22W0aWxOOT6g==
X-CSE-MsgGUID: vLo9rt0ZQya898cJswZKUg==
X-IronPort-AV: E=McAfee;i="6800,10657,11940"; a="1290730"
X-IronPort-AV: E=Sophos;i="6.27,168,1787036400"; 
   d="scan'208";a="1290730"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2026 03:25:01 -0700
X-CSE-ConnectionGUID: 65MMbG7bTt6muP+YE2OLFA==
X-CSE-MsgGUID: Jdsa+oR7TuOvLUTNKRLPvw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,168,1787036400"; 
   d="scan'208";a="4568061"
Received: from igk-lkp-server01.igk.intel.com (HELO 3c253b998be3) ([10.211.93.152])
  by fmviesa013.fm.intel.com with ESMTP; 20 Oct 2026 03:24:59 -0700
Received: from kbuild by 3c253b998be3 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xJ71c-000000006FD-2aYa;
	Tue, 20 Oct 2026 10:24:56 +0000
Date: Tue, 20 Oct 2026 12:24:35 +0200
From: kernel test robot <lkp@intel.com>
To: Eric Biggers <ebiggers@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Ard Biesheuvel <ardb@kernel.org>
Subject: crypto/aes.c:38:1: sparse: sparse: static assertion failed:
 "__alignof__(struct aes_cmac_key) <= CRYPTO_MINALIGN"
Message-ID: <202610201244.rE0N2Qbq-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   f47d223627f80cb7a1eb14c585fe6cb35de5e984
commit: 7137cbf2b5c9feb6302d6da116eab2047c5f05d2 crypto: aes - Add cmac, xcbc, and cbcmac algorithms using library
date:   8 months ago
config: powerpc-randconfig-r2310-20261020 (https://download.01.org/0day-ci/archive/20261020/202610201244.rE0N2Qbq-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 12.5.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261020/202610201244.rE0N2Qbq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 7137cbf2b5c9 ("crypto: aes - Add cmac, xcbc, and cbcmac algorithms using library")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610201244.rE0N2Qbq-lkp@intel.com/

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
