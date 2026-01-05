Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68DE53168E1
	for <oe-kbuild-all@lists.linux.dev>; Mon,  5 Jan 2026 05:06:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767589587; cv=none; b=TAUEx5r8earDDa/xygOLEZlw3rhfOawQjJzxwkEn+U+9YiKIkAZp+GYHtgSp7YpiwPdWjjwnVK09DTJO3/PpCZgPYEVAl8g8JxAue0vVSfC77hRnxGRGm5zOsZfEWBPj5JdEeVBuPXcCSM2Eo9ZOV5GW4ELDJzEB+YPZbqyyW9o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767589587; c=relaxed/simple;
	bh=FaQx3yDDfi0k56nARlQHy9VZ+iuxlDH7V5e1waqt540=;
	h=Date:From:To:Cc:Subject:Message-ID; b=jH17PpNfFnk0ZwvP1Oksdpbydx6ZYxFdlQYwlLQgLUFIT1Y4QJYlY8H43ALzPl1hx8g5lyJ7raxKMUVlJuyJ8KSX4d62y+FxPNq6SYnoGKmUPibqNUmVpUpDYxw1TEof0gtfoap+eNDqrfFDR673RzLGYvM4ZSbrx/4326ye9a0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fe5SQZCL; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fe5SQZCL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767589586; x=1799125586;
  h=date:from:to:cc:subject:message-id;
  bh=FaQx3yDDfi0k56nARlQHy9VZ+iuxlDH7V5e1waqt540=;
  b=fe5SQZCLerJXyTrRmKRnvemRYxjHJNbON4sLObNPml8pAm9JXm2CJPLK
   3L3hj0/ZNLI9s4e/fYF2WTSrUbygeHszY864Zp1d2l4rqyjMvq9JP1j16
   FhtHYB+jvbn/btynx57ADxjCgC+vj36+DPnsjnZTwb8LkHKXfy3wYpj3m
   vGvP5vcGlPLghRw+AueQt9EIMc7pUWC0sKWQTSV2s8xehjXMcBI/xHT1l
   H99+zQ5CQWcPliiAXJWyF2qL+ExFJOWjRLQsLJvmTCMByeMPYCbUTtZUh
   lAHBuYYf4l4nfomm0dgBew3O4sxcSuvV8IN//n6cqqChatC0J/Xfmt/YA
   w==;
X-CSE-ConnectionGUID: sB2eRyZ2R1ODNruJmJH6ZA==
X-CSE-MsgGUID: 4v+7Sk93SkqZZrEiyWGmcw==
X-IronPort-AV: E=McAfee;i="6800,10657,11661"; a="80074597"
X-IronPort-AV: E=Sophos;i="6.21,202,1763452800"; 
   d="scan'208";a="80074597"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jan 2026 21:06:25 -0800
X-CSE-ConnectionGUID: XPLhuRRAQ92W+R6I9Sfh/w==
X-CSE-MsgGUID: xoCuTyerQDW4KEeNvaaksQ==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 04 Jan 2026 21:06:23 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vccnN-000000000wj-1PRw;
	Mon, 05 Jan 2026 05:06:21 +0000
Date: Mon, 05 Jan 2026 13:06:18 +0800
From: kernel test robot <lkp@intel.com>
To: Eric Biggers <ebiggers@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [ebiggers:wip-aes 17/50] lib/crypto/aes.c:143:31: error:
 'aes_dec_tab' causes a section type conflict with 'aes_inv_sbox'
Message-ID: <202601051229.M7NqOdtP-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ebiggers/linux.git wip-aes
head:   d267b9a1525bb945f8936382fd66bd3dc810616d
commit: ee0f015b9f6e89272e97d629aef97af1314b49f7 [17/50] lib/crypto: aes: Introduce improved AES library
config: x86_64-randconfig-161-20260105 (https://download.01.org/0day-ci/archive/20260105/202601051229.M7NqOdtP-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.4.0-5) 12.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260105/202601051229.M7NqOdtP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601051229.M7NqOdtP-lkp@intel.com/

Note: the ebiggers/wip-aes HEAD d267b9a1525bb945f8936382fd66bd3dc810616d builds fine.
      It only hurts bisectability.

All errors (new ones prefixed by >>):

>> lib/crypto/aes.c:143:31: error: 'aes_dec_tab' causes a section type conflict with 'aes_inv_sbox'
     143 | const u32 __cacheline_aligned aes_dec_tab[256] = {
         |                               ^~~~~~~~~~~
   lib/crypto/aes.c:53:46: note: 'aes_inv_sbox' was declared here
      53 | static volatile const u8 __cacheline_aligned aes_inv_sbox[] = {
         |                                              ^~~~~~~~~~~~


vim +143 lib/crypto/aes.c

   141	
   142	/* aes_dec_tab[i] contains InvMixColumn([InvSubByte(i), 0, 0, 0]). */
 > 143	const u32 __cacheline_aligned aes_dec_tab[256] = {
   144		0x50a7f451, 0x5365417e, 0xc3a4171a, 0x965e273a, 0xcb6bab3b, 0xf1459d1f,
   145		0xab58faac, 0x9303e34b, 0x55fa3020, 0xf66d76ad, 0x9176cc88, 0x254c02f5,
   146		0xfcd7e54f, 0xd7cb2ac5, 0x80443526, 0x8fa362b5, 0x495ab1de, 0x671bba25,
   147		0x980eea45, 0xe1c0fe5d, 0x02752fc3, 0x12f04c81, 0xa397468d, 0xc6f9d36b,
   148		0xe75f8f03, 0x959c9215, 0xeb7a6dbf, 0xda595295, 0x2d83bed4, 0xd3217458,
   149		0x2969e049, 0x44c8c98e, 0x6a89c275, 0x78798ef4, 0x6b3e5899, 0xdd71b927,
   150		0xb64fe1be, 0x17ad88f0, 0x66ac20c9, 0xb43ace7d, 0x184adf63, 0x82311ae5,
   151		0x60335197, 0x457f5362, 0xe07764b1, 0x84ae6bbb, 0x1ca081fe, 0x942b08f9,
   152		0x58684870, 0x19fd458f, 0x876cde94, 0xb7f87b52, 0x23d373ab, 0xe2024b72,
   153		0x578f1fe3, 0x2aab5566, 0x0728ebb2, 0x03c2b52f, 0x9a7bc586, 0xa50837d3,
   154		0xf2872830, 0xb2a5bf23, 0xba6a0302, 0x5c8216ed, 0x2b1ccf8a, 0x92b479a7,
   155		0xf0f207f3, 0xa1e2694e, 0xcdf4da65, 0xd5be0506, 0x1f6234d1, 0x8afea6c4,
   156		0x9d532e34, 0xa055f3a2, 0x32e18a05, 0x75ebf6a4, 0x39ec830b, 0xaaef6040,
   157		0x069f715e, 0x51106ebd, 0xf98a213e, 0x3d06dd96, 0xae053edd, 0x46bde64d,
   158		0xb58d5491, 0x055dc471, 0x6fd40604, 0xff155060, 0x24fb9819, 0x97e9bdd6,
   159		0xcc434089, 0x779ed967, 0xbd42e8b0, 0x888b8907, 0x385b19e7, 0xdbeec879,
   160		0x470a7ca1, 0xe90f427c, 0xc91e84f8, 0x00000000, 0x83868009, 0x48ed2b32,
   161		0xac70111e, 0x4e725a6c, 0xfbff0efd, 0x5638850f, 0x1ed5ae3d, 0x27392d36,
   162		0x64d90f0a, 0x21a65c68, 0xd1545b9b, 0x3a2e3624, 0xb1670a0c, 0x0fe75793,
   163		0xd296eeb4, 0x9e919b1b, 0x4fc5c080, 0xa220dc61, 0x694b775a, 0x161a121c,
   164		0x0aba93e2, 0xe52aa0c0, 0x43e0223c, 0x1d171b12, 0x0b0d090e, 0xadc78bf2,
   165		0xb9a8b62d, 0xc8a91e14, 0x8519f157, 0x4c0775af, 0xbbdd99ee, 0xfd607fa3,
   166		0x9f2601f7, 0xbcf5725c, 0xc53b6644, 0x347efb5b, 0x7629438b, 0xdcc623cb,
   167		0x68fcedb6, 0x63f1e4b8, 0xcadc31d7, 0x10856342, 0x40229713, 0x2011c684,
   168		0x7d244a85, 0xf83dbbd2, 0x1132f9ae, 0x6da129c7, 0x4b2f9e1d, 0xf330b2dc,
   169		0xec52860d, 0xd0e3c177, 0x6c16b32b, 0x99b970a9, 0xfa489411, 0x2264e947,
   170		0xc48cfca8, 0x1a3ff0a0, 0xd82c7d56, 0xef903322, 0xc74e4987, 0xc1d138d9,
   171		0xfea2ca8c, 0x360bd498, 0xcf81f5a6, 0x28de7aa5, 0x268eb7da, 0xa4bfad3f,
   172		0xe49d3a2c, 0x0d927850, 0x9bcc5f6a, 0x62467e54, 0xc2138df6, 0xe8b8d890,
   173		0x5ef7392e, 0xf5afc382, 0xbe805d9f, 0x7c93d069, 0xa92dd56f, 0xb31225cf,
   174		0x3b99acc8, 0xa77d1810, 0x6e639ce8, 0x7bbb3bdb, 0x097826cd, 0xf418596e,
   175		0x01b79aec, 0xa89a4f83, 0x656e95e6, 0x7ee6ffaa, 0x08cfbc21, 0xe6e815ef,
   176		0xd99be7ba, 0xce366f4a, 0xd4099fea, 0xd67cb029, 0xafb2a431, 0x31233f2a,
   177		0x3094a5c6, 0xc066a235, 0x37bc4e74, 0xa6ca82fc, 0xb0d090e0, 0x15d8a733,
   178		0x4a9804f1, 0xf7daec41, 0x0e50cd7f, 0x2ff69117, 0x8dd64d76, 0x4db0ef43,
   179		0x544daacc, 0xdf0496e4, 0xe3b5d19e, 0x1b886a4c, 0xb81f2cc1, 0x7f516546,
   180		0x04ea5e9d, 0x5d358c01, 0x737487fa, 0x2e410bfb, 0x5a1d67b3, 0x52d2db92,
   181		0x335610e9, 0x1347d66d, 0x8c61d79a, 0x7a0ca137, 0x8e14f859, 0x893c13eb,
   182		0xee27a9ce, 0x35c961b7, 0xede51ce1, 0x3cb1477a, 0x59dfd29c, 0x3f73f255,
   183		0x79ce1418, 0xbf37c773, 0xeacdf753, 0x5baafd5f, 0x146f3ddf, 0x86db4478,
   184		0x81f3afca, 0x3ec468b9, 0x2c342438, 0x5f40a3c2, 0x72c31d16, 0x0c25e2bc,
   185		0x8b493c28, 0x41950dff, 0x7101a839, 0xdeb30c08, 0x9ce4b4d8, 0x90c15664,
   186		0x6184cb7b, 0x70b632d5, 0x745c6c48, 0x4257b8d0,
   187	};
   188	EXPORT_SYMBOL(aes_dec_tab);
   189	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
