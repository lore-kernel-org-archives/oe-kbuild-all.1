Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 153D530CDA5
	for <oe-kbuild-all@lists.linux.dev>; Sat, 30 Aug 2025 02:18:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756520285; cv=none; b=u+v4Q3w1bM0Jv2zbq5phRope+w/cdCEElY2y2US7cc4pFUn/DBxsSMD2WZXLiaQMV62l/+OJE5wK0VnTRCSRtxJXsrIYT7YJ78gm8LExem9Nk5/oP9DMHLUjGBrtGPTkF5yVTbOR/zlkCADB7XRpuca6vwFsz0P6NrzlWPoysnI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756520285; c=relaxed/simple;
	bh=GM2m4MWKlT81+VAOB8dEJ4NGwMhn5A/4kzypXMPTXN4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=bCb7XtMsMmQ8o1/Y9Rhw/rJwHoIe4arBLU7fjIvPEaOEGnkFynojYwjvMbGuuNEV0xOKG3nm3NV2THhg7TXeW8lKhkNdMvHrt/7lF0Ke31VDfGP1VtcIoVJF1xZRCcJ+scjHYnl7OCCIO1oXg41zEk1YVpoYKWfQsPGiaixB4LQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mohcx18F; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mohcx18F"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756520285; x=1788056285;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=GM2m4MWKlT81+VAOB8dEJ4NGwMhn5A/4kzypXMPTXN4=;
  b=mohcx18FKBGnos4+kw0lVNztumo6NgVjr3LZRafKEXj5HxBwYLAOEvNe
   6wGsT4h/jfeG6SmoGcaf24Va2xKdFggD83papHCl6Wqg2qqX6KPra8c2a
   oktR6UFjDx9JwENnbMSuZrwe2sWiNrkUNPK2wwe+DtH27Sa/JabcAGX6H
   CqEhHOcEjjnXIzkMzynh0f0C72cuI3ZarmRlulBUcCKK79KiTGi4VGRBQ
   Gnztt7+YL/lp+hB/+T9NPwYftmpopsjHgrcTMagITCGy6O1KXlsG5dXQm
   Ef+WwtbgUzqGSJt/tqOzBMjy6lE3b86GJO7OxRIm8/83Wt8P34B+2bOKr
   g==;
X-CSE-ConnectionGUID: n+TWHuodQ4+q8U9NjPfy6Q==
X-CSE-MsgGUID: bjaRI88JSjiDdsy8LfuYFw==
X-IronPort-AV: E=McAfee;i="6800,10657,11537"; a="70241071"
X-IronPort-AV: E=Sophos;i="6.18,225,1751266800"; 
   d="scan'208";a="70241071"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Aug 2025 19:18:02 -0700
X-CSE-ConnectionGUID: 8l1jZ9kuRbSaYx7VhiILeA==
X-CSE-MsgGUID: OmG+18i/Qm2m3HaqmmkNTw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,225,1751266800"; 
   d="scan'208";a="194180601"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 29 Aug 2025 19:18:00 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1usBA9-000V7H-2x;
	Sat, 30 Aug 2025 02:17:55 +0000
Date: Sat, 30 Aug 2025 10:17:18 +0800
From: kernel test robot <lkp@intel.com>
To: James Morse <james.morse@arm.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [morse:mpam/snapshot/v6.17-rc2 32/89]
 drivers/resctrl/test_mpam_devices.c:16:32: sparse: sparse: incorrect type in
 assignment (different address spaces)
Message-ID: <202508301008.ESW1SyHj-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/morse/linux.git mpam/snapshot/v6.17-rc2
head:   c0646bf01fb5098c7d6cbc44af567a8bb2ca82d6
commit: e93b6dbf010687fc7a6737cdca59788d3e3cf3c3 [32/89] arm_mpam: Add kunit test for bitmap reset
config: arm64-randconfig-r132-20250829 (https://download.01.org/0day-ci/archive/20250830/202508301008.ESW1SyHj-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce: (https://download.01.org/0day-ci/archive/20250830/202508301008.ESW1SyHj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508301008.ESW1SyHj-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/resctrl/mpam_devices.c: note: in included file:
>> drivers/resctrl/test_mpam_devices.c:16:32: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void [noderef] __iomem *mapped_hwpage @@     got char *buf @@
   drivers/resctrl/test_mpam_devices.c:16:32: sparse:     expected void [noderef] __iomem *mapped_hwpage
   drivers/resctrl/test_mpam_devices.c:16:32: sparse:     got char *buf
   drivers/resctrl/mpam_devices.c:744:34: sparse: sparse: context imbalance in '_mpam_ris_hw_probe_hw_nrdy' - different lock contexts for basic block
   drivers/resctrl/mpam_devices.c:1245:34: sparse: sparse: context imbalance in '__ris_msmon_read' - different lock contexts for basic block
   drivers/resctrl/mpam_devices.c:1346:17: sparse: sparse: context imbalance in 'mpam_msmon_reset_mbwu' - different lock contexts for basic block
   drivers/resctrl/mpam_devices.c:1532:51: sparse: sparse: context imbalance in 'mpam_save_mbwu_state' - different lock contexts for basic block
   drivers/resctrl/mpam_devices.c:1648:9: sparse: sparse: context imbalance in 'mpam_reprogram_msc' - wrong count at exit
   drivers/resctrl/mpam_devices.c:2457:12: sparse: sparse: context imbalance in 'mpam_register_irqs' - wrong count at exit
   drivers/resctrl/mpam_devices.c:2551:40: sparse: sparse: context imbalance in '__destroy_component_cfg' - different lock contexts for basic block
   drivers/resctrl/mpam_devices.c:2580:17: sparse: sparse: context imbalance in '__allocate_component_cfg' - different lock contexts for basic block

vim +16 drivers/resctrl/test_mpam_devices.c

     6	
     7	static void test_mpam_reset_msc_bitmap(struct kunit *test)
     8	{
     9		char *buf = kunit_kzalloc(test, SZ_16K, GFP_KERNEL);
    10		struct mpam_msc fake_msc;
    11		u32 *test_result;
    12	
    13		if (!buf)
    14			return;
    15	
  > 16		fake_msc.mapped_hwpage = buf;
    17		fake_msc.mapped_hwpage_sz = SZ_16K;
    18		cpumask_copy(&fake_msc.accessibility, cpu_possible_mask);
    19	
    20		mutex_init(&fake_msc.part_sel_lock);
    21		mutex_lock(&fake_msc.part_sel_lock);
    22	
    23		test_result = (u32 *)(buf + MPAMCFG_CPBM);
    24	
    25		mpam_reset_msc_bitmap(&fake_msc, MPAMCFG_CPBM, 0);
    26		KUNIT_EXPECT_EQ(test, test_result[0], 0);
    27		KUNIT_EXPECT_EQ(test, test_result[1], 0);
    28		test_result[0] = 0;
    29		test_result[1] = 0;
    30	
    31		mpam_reset_msc_bitmap(&fake_msc, MPAMCFG_CPBM, 1);
    32		KUNIT_EXPECT_EQ(test, test_result[0], 1);
    33		KUNIT_EXPECT_EQ(test, test_result[1], 0);
    34		test_result[0] = 0;
    35		test_result[1] = 0;
    36	
    37		mpam_reset_msc_bitmap(&fake_msc, MPAMCFG_CPBM, 16);
    38		KUNIT_EXPECT_EQ(test, test_result[0], 0xffff);
    39		KUNIT_EXPECT_EQ(test, test_result[1], 0);
    40		test_result[0] = 0;
    41		test_result[1] = 0;
    42	
    43		mpam_reset_msc_bitmap(&fake_msc, MPAMCFG_CPBM, 32);
    44		KUNIT_EXPECT_EQ(test, test_result[0], 0xffffffff);
    45		KUNIT_EXPECT_EQ(test, test_result[1], 0);
    46		test_result[0] = 0;
    47		test_result[1] = 0;
    48	
    49		mpam_reset_msc_bitmap(&fake_msc, MPAMCFG_CPBM, 33);
    50		KUNIT_EXPECT_EQ(test, test_result[0], 0xffffffff);
    51		KUNIT_EXPECT_EQ(test, test_result[1], 1);
    52		test_result[0] = 0;
    53		test_result[1] = 0;
    54	
    55		mutex_unlock(&fake_msc.part_sel_lock);
    56	}
    57	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
