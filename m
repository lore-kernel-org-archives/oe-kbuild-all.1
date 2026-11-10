Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794288119;
	b=CUeS48kJmSrCXEBerQvOAmcNrdGMTUkrF1SS4eR1pcXp9GM1+Bl2HFSvszG88+gqRmpZ
	 Het/6DuYfPJPO07kLp6ssSnXpyhUyfQHvwg9Jropju2Sh79eLGJYgo8LSDe4AjZWoheP2
	 zZTSdrVjwFCSbtWL0KnT6WzW+IHeng92uICM8fzfmP7ozAbYUI0p9H3npq1iiqJHAZrTD
	 UD+lrXqluKZ9zH1YVWVveQAb1DZi43Dz7MwCCWjOmTFgRpjy5OcJNU5pIo6mXvT4Cs6DL
	 SSEuKILZyfmUpJ+Ia02Kzxysykj5UJ/Xscm5A8+7HlGAFSjJHV8ETALj6H0R6TTfLTA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794288119;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=QIofmUxkJDf1c1ZJjqXUoUVvRSTah7W3fN/YGi/oFng=;
	b=eZKT8lciEaxRdWpeJsspPeNv5s/5kxnBU3xCCoJYKxplK/5Zk/N58l8ZBDaqLpCz2x68
	 2Oe5yK+IQlFLqqEi0MgAkNeetK01S8pNyo1TeVftptyp2pIVTS6dAfTrIb8O5Uc6IT9U9
	 6Yxb/urqdOYbWCkYILnxGbcSvYP1RBW5lJP6dbhp8n+09q0zCXlJI/gxqRECn3gl4lPR1
	 mabVc8bPo/wrh9S1+rCC3SQK51LC66w3tpEIeINFKfkoXfkMGuSugeHMttWNtlWuX8BHt
	 u4fN1R7wsHaVuQsb6bL2X/eSo/6yoqJodMspI9RzUNc4htQ49WQTnykpDCQBKJ4hUnw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=NLEcwd5P;
	arc=none smtp.remote-ip=192.198.163.11
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F35D606A325
	for <oe-kbuild-all@lists.linux.dev>; Tue, 10 Nov 2026 05:21:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0F35D606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=NLEcwd5P
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794288119; x=1825824119;
  h=date:from:to:cc:subject:message-id;
  bh=aZnNTcDiX/WFMIGxSachKxIswVIpjNEl9O/86pcGoOU=;
  b=NLEcwd5PhXzcJM3Ual6n4mTmer8fCFKUBJ30c11vO5I3rF5Aoiiy7Odj
   z9DFzO+CO0lCy8+H5TAcBvhXKzmZBA+MUQRk/pu9vL4NyrtG2h4tQsjwx
   D0RBJjX8+dCAWFfl/CQpjP5yPT4u26lu6OIrazfo1Gkxvie4VlvUQc7GT
   1UCqaKGqZJD/LyycmIXgzCsUC6YlUiGliY6XEqnNFwhD1qiNeQDKfTHEN
   5DvedByiUByuKpClry7aWkNgqVmBorppZ2K7FcIkErsfqg83QnG9d+r5v
   cjAeSTIBBbCB0Yxxa04contbW/Nu46cLFzQrB90mKa35PVZlK9WB39sdX
   Q==;
X-CSE-ConnectionGUID: pWiFzGfzQcStHilBB0abFA==
X-CSE-MsgGUID: jvjQpHJoRiqTA44zbiw0iQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11961"; a="2943456"
X-IronPort-AV: E=Sophos;i="6.27,205,1787036400"; 
   d="scan'208";a="2943456"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2026 21:21:57 -0800
X-CSE-ConnectionGUID: CjoMUdpbTSSfSNzhPedMVA==
X-CSE-MsgGUID: kw5/+XLTTUmpqRkii2M/QQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,205,1787036400"; 
   d="scan'208";a="8367449"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by fmviesa006.fm.intel.com with ESMTP; 09 Nov 2026 21:21:52 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xQeIh-000000000Bf-15bT;
	Tue, 10 Nov 2026 05:21:43 +0000
Date: Tue, 10 Nov 2026 06:20:52 +0100
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android13-5.10-2025-10 0/4]
 drivers/android/debug_symbols.c:50:9: sparse: sparse: cast removes address
 space '__percpu' of expression
Message-ID: <202611100614.pI1az5fA-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

tree:   https://android.googlesource.com/kernel/common android13-5.10-2025-10
head:   e7e65f2d67118aa1b253f08c94b1616ca07ce4c2
commit: 3fcbb15c1a91a318fb9367bee24603af24648a2d [0/4] ANDROID: android: Create debug_symbols driver
config: i386-randconfig-2300-20261110 (https://download.01.org/0day-ci/archive/20261110/202611100614.pI1az5fA-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
sparse: v0.6.5-rc1-21-g84ec0658
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261110/202611100614.pI1az5fA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611100614.pI1az5fA-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/android/debug_symbols.c:50:9: sparse: sparse: cast removes address space '__percpu' of expression

vim +/__percpu +50 drivers/android/debug_symbols.c

    41	
    42	/*
    43	 * ads_per_cpu_entries array contains all the per_cpu variable address information.
    44	 */
    45	static const struct ads_entry ads_per_cpu_entries[ADS_DEBUG_PER_CPU_END] = {
    46	#ifdef CONFIG_ARM64
    47		ADS_PER_CPU_ENTRY(ADS_IRQ_STACK_PTR, irq_stack_ptr),
    48	#endif
    49	#ifdef CONFIG_X86
  > 50		ADS_PER_CPU_ENTRY(ADS_IRQ_STACK_PTR, hardirq_stack_ptr),
    51	#endif
    52	};
    53	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
