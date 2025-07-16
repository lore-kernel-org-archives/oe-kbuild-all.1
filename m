Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3BA2288CAF
	for <oe-kbuild-all@lists.linux.dev>; Wed, 16 Jul 2025 15:51:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752681111; cv=none; b=ODP/N9rzm0tLnA9GzAmYuB6XpKyPsFJdNmHRvHUm0rLidA7I+1LxMf4qWnAM1IdYzfs9OFwczP+23p+r7xAhH1D9bSYxDs//989fA5ac8LlS1nr+/pNYY/pG4zAmZhtMABRJnGgsUZowvhJIqFqEzWXtVfBjY560z6PdYM81Y1g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752681111; c=relaxed/simple;
	bh=IxUT3uQkSOeJrsoCql+Oj+o5GqnAxixxvqJIdZ7FeQ0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=HU7ApA6btb1MFnmRcWKuPoPYP+QgScOoYDRqwL8WepT5leRll3mlkzh1bVapD4Cd/nN+L57VqGcmoeLtkIzb2UNpaq4+LNsdkd7v6YZgHHie3unM37UuUVn4U/sO00O8xlRjBuQTchCzAMRlBp1g2Wn4Fbh4fJM+vNR//D0k7XE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hvHYDaYt; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hvHYDaYt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752681109; x=1784217109;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=IxUT3uQkSOeJrsoCql+Oj+o5GqnAxixxvqJIdZ7FeQ0=;
  b=hvHYDaYtopZxuRhtoGHui/OFp24FyHQlTSfg0BPSCxwyyU0VV3MXWt5e
   eQwKYgq72+K+kt42+rYakWDq750+tpD2YKJKFW6+ps2W1BfZHltgQDiF3
   tdIJ2nb2oXnhPMMYvpOffHOHKM2hS6o2zjqikRTGeAI10usH+GngW1v2g
   EIzeq9veu3/u0uw5kcQ2/GdWmW6sc6zBAgrDNMtGcGoDLfVHtJ960B+7/
   EmtkK2SxLKG4j/4ekXNDyG9WugXK0uNsdN2TYe3jG8MT9ms4tI/1gVkRD
   LYcILVVZizoeRau6y7Pjdxxbz5ujz1hY95t437+qp4RjN8psvzWLRMwjL
   g==;
X-CSE-ConnectionGUID: 6YwhF2EDRWKQIGkSVycRoA==
X-CSE-MsgGUID: WH7i1iDDQ3Glw4sYz3YDkw==
X-IronPort-AV: E=McAfee;i="6800,10657,11493"; a="54644940"
X-IronPort-AV: E=Sophos;i="6.16,316,1744095600"; 
   d="scan'208";a="54644940"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jul 2025 08:51:49 -0700
X-CSE-ConnectionGUID: ftH7FYDoTKu0d8mGB7+Aqg==
X-CSE-MsgGUID: 4IxpoimmSqSCiqEH6ASfRg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,316,1744095600"; 
   d="scan'208";a="188490677"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 16 Jul 2025 08:51:48 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uc4Q5-000CZi-2e;
	Wed, 16 Jul 2025 15:51:45 +0000
Date: Wed, 16 Jul 2025 23:51:33 +0800
From: kernel test robot <lkp@intel.com>
To: James Morse <james.morse@arm.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [morse:mpam/snapshot/v6.16-rc4 36/78]
 drivers/platform/arm64/mpam/test_mpam_devices.c:16:32: sparse: sparse:
 incorrect type in assignment (different address spaces)
Message-ID: <202507162303.pco1KeH8-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/morse/linux.git mpam/snapshot/v6.16-rc4
head:   9b18de3456d42d8c0c23f724d3062b5d243bf8a1
commit: c2f6eeb9aa04d25fd88b1de26c137043f556a942 [36/78] arm_mpam: Add kunit test for bitmap reset
config: arm64-randconfig-r131-20250716 (https://download.01.org/0day-ci/archive/20250716/202507162303.pco1KeH8-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce: (https://download.01.org/0day-ci/archive/20250716/202507162303.pco1KeH8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507162303.pco1KeH8-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/platform/arm64/mpam/mpam_devices.c: note: in included file:
>> drivers/platform/arm64/mpam/test_mpam_devices.c:16:32: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void [noderef] __iomem *mapped_hwpage @@     got char *buf @@
   drivers/platform/arm64/mpam/test_mpam_devices.c:16:32: sparse:     expected void [noderef] __iomem *mapped_hwpage
   drivers/platform/arm64/mpam/test_mpam_devices.c:16:32: sparse:     got char *buf
   drivers/platform/arm64/mpam/mpam_devices.c:896:25: sparse: sparse: context imbalance in 'mpam_ris_hw_probe' - different lock contexts for basic block
   drivers/platform/arm64/mpam/mpam_devices.c:1232:34: sparse: sparse: context imbalance in '__ris_msmon_read' - different lock contexts for basic block
   drivers/platform/arm64/mpam/mpam_devices.c:1333:17: sparse: sparse: context imbalance in 'mpam_msmon_reset_mbwu' - different lock contexts for basic block
   drivers/platform/arm64/mpam/mpam_devices.c:1520:51: sparse: sparse: context imbalance in 'mpam_save_mbwu_state' - different lock contexts for basic block
   drivers/platform/arm64/mpam/mpam_devices.c:2441:12: sparse: sparse: context imbalance in 'mpam_register_irqs' - wrong count at exit
   drivers/platform/arm64/mpam/mpam_devices.c:2536:40: sparse: sparse: context imbalance in '__destroy_component_cfg' - different lock contexts for basic block
   drivers/platform/arm64/mpam/mpam_devices.c:2564:17: sparse: sparse: context imbalance in '__allocate_component_cfg' - different lock contexts for basic block

vim +16 drivers/platform/arm64/mpam/test_mpam_devices.c

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
