Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48585324700
	for <oe-kbuild-all@lists.linux.dev>; Mon, 15 Dec 2025 18:01:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765821672; cv=none; b=Nm0IxaSKVBA2xDnm/0rwFvx1vXrvlUkFHnzugOrBTu6iJstjgXB8Z/hwhroT2D5AUdBvC2JFkMyQIP3MzZxRio1xGMq/12JfnwVMcY3ahuXfMHIHSxXmAafbyOuJji6aKm3Nypf0khoRzC+o9zb/7bxjO+N3YcT+yTsJ/6VQEEM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765821672; c=relaxed/simple;
	bh=nVxrEP7M/wfPeLyq+TN7XvpUWhVgJj3oYBMbnGR9238=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=SCT6Nos+rili889xht7lhbHEhZe/XRsxo0qj7UcDFKnqX6oRaUPXTM2BV953RktBDVdLLYQRFsCH8M5jEw+f5sOcttEQTA/sqfshsR2hMBIbTrj0Dxcg+g+JiQs95aXLQMYb6wNB0fMYbw8H6kDFxLPt2aPkX7NRtT2DMf1cjl0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=m02N65PK; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="m02N65PK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765821670; x=1797357670;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=nVxrEP7M/wfPeLyq+TN7XvpUWhVgJj3oYBMbnGR9238=;
  b=m02N65PKIat4zil+RDrSl92SRpJ9FpGXBkwRQv34Gf4Jst3v60lYeCwp
   MKFuD2Lm2i6u3QhmqDhB1A+KQeuNZ8I88x6gWMv91S3cg4ryQpDgHJR75
   9y1lSBpSgZqwMSF72hfZbXvjjdABfPqz5Nu5aDPf3B2XTqTr4OnkGN86z
   MfUGDAxot9bcbdP9sBpfBR0FhEd1U98/fDE1RBNYKAYbko6lI35A3Ag4U
   WqNowyQUTHzDCnhwWwirEHcQAO6vB0Yd6ujtw1bHjs987N4HKcD8d4eBm
   LCCzW9SM/w60M4r8xJG4sVHuWGIfalgO2oESo9wf04Up6k9HU5xnSxvLe
   w==;
X-CSE-ConnectionGUID: vsPJ8YolRoCB28197wKNJQ==
X-CSE-MsgGUID: t8vJthh1Qsir1QdbT68O4g==
X-IronPort-AV: E=McAfee;i="6800,10657,11643"; a="85142399"
X-IronPort-AV: E=Sophos;i="6.21,151,1763452800"; 
   d="scan'208";a="85142399"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Dec 2025 10:01:10 -0800
X-CSE-ConnectionGUID: +9K1tb+1TzKDlABDx7B1nQ==
X-CSE-MsgGUID: SURYAEFHReKT8exiM2VUlA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,151,1763452800"; 
   d="scan'208";a="196881952"
Received: from lkp-server02.sh.intel.com (HELO 034c7e8e53c3) ([10.239.97.151])
  by orviesa006.jf.intel.com with ESMTP; 15 Dec 2025 10:01:07 -0800
Received: from kbuild by 034c7e8e53c3 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vVCsG-000000000aF-27C3;
	Mon, 15 Dec 2025 18:00:48 +0000
Date: Tue, 16 Dec 2025 01:59:47 +0800
From: kernel test robot <lkp@intel.com>
To: James Morse <james.morse@arm.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	Jonathan Cameron <jonathan.cameron@huawei.com>,
	Ben Horgan <ben.horgan@arm.com>, Fenghua Yu <fenghuay@nvidia.com>,
	Gavin Shan <gshan@redhat.com>,
	Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>
Subject: drivers/resctrl/test_mpam_devices.c:9:42: sparse: sparse: incorrect
 type in initializer (different address spaces)
Message-ID: <202512160133.eAzPdJv2-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   8f0b4cce4481fb22653697cced8d0d04027cb1e8
commit: e3565d1fd4dcf2c7ee6912094066e47c7500eaf2 arm_mpam: Add kunit test for bitmap reset
date:   4 weeks ago
config: arm64-randconfig-r133-20251215 (https://download.01.org/0day-ci/archive/20251216/202512160133.eAzPdJv2-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251216/202512160133.eAzPdJv2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512160133.eAzPdJv2-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/resctrl/mpam_devices.c: note: in included file:
>> drivers/resctrl/test_mpam_devices.c:9:42: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected char [noderef] __iomem *buf @@     got void * @@
   drivers/resctrl/test_mpam_devices.c:9:42: sparse:     expected char [noderef] __iomem *buf
   drivers/resctrl/test_mpam_devices.c:9:42: sparse:     got void *
>> drivers/resctrl/test_mpam_devices.c:24:24: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/resctrl/mpam_devices.c:271:5: sparse: sparse: context imbalance in 'mpam_register_requestor' - wrong count at exit
   drivers/resctrl/mpam_devices.c:1218:9: sparse: sparse: context imbalance in '_msmon_read' - wrong count at exit
   drivers/resctrl/mpam_devices.c:1281:6: sparse: sparse: context imbalance in 'mpam_msmon_reset_mbwu' - wrong count at exit
   drivers/resctrl/mpam_devices.c:1632:9: sparse: sparse: context imbalance in 'mpam_cpu_online' - wrong count at exit
   drivers/resctrl/mpam_devices.c:1705:9: sparse: sparse: context imbalance in 'mpam_cpu_offline' - wrong count at exit
   drivers/resctrl/mpam_devices.c:2294:12: sparse: sparse: context imbalance in 'mpam_register_irqs' - wrong count at exit
   drivers/resctrl/mpam_devices.c:2346:9: sparse: sparse: context imbalance in 'mpam_unregister_irqs' - wrong count at exit
   drivers/resctrl/mpam_devices.c:2546:9: sparse: sparse: context imbalance in 'mpam_reset_component_locked' - wrong count at exit
   drivers/resctrl/mpam_devices.c:2567:9: sparse: sparse: context imbalance in 'mpam_reset_class_locked' - wrong count at exit
   drivers/resctrl/mpam_devices.c:2640:9: sparse: sparse: context imbalance in 'mpam_enable' - wrong count at exit
   drivers/resctrl/mpam_devices.c:2666:5: sparse: sparse: context imbalance in 'mpam_apply_config' - wrong count at exit

vim +9 drivers/resctrl/test_mpam_devices.c

     6	
     7	static void test_mpam_reset_msc_bitmap(struct kunit *test)
     8	{
   > 9		char __iomem *buf = kunit_kzalloc(test, SZ_16K, GFP_KERNEL);
    10		struct mpam_msc fake_msc = {};
    11		u32 *test_result;
    12	
    13		if (!buf)
    14			return;
    15	
    16		fake_msc.mapped_hwpage = buf;
    17		fake_msc.mapped_hwpage_sz = SZ_16K;
    18		cpumask_copy(&fake_msc.accessibility, cpu_possible_mask);
    19	
    20		/* Satisfy lockdep checks */
    21		mutex_init(&fake_msc.part_sel_lock);
    22		mutex_lock(&fake_msc.part_sel_lock);
    23	
  > 24		test_result = (u32 *)(buf + MPAMCFG_CPBM);
    25	
    26		mpam_reset_msc_bitmap(&fake_msc, MPAMCFG_CPBM, 0);
    27		KUNIT_EXPECT_EQ(test, test_result[0], 0);
    28		KUNIT_EXPECT_EQ(test, test_result[1], 0);
    29		test_result[0] = 0;
    30		test_result[1] = 0;
    31	
    32		mpam_reset_msc_bitmap(&fake_msc, MPAMCFG_CPBM, 1);
    33		KUNIT_EXPECT_EQ(test, test_result[0], 1);
    34		KUNIT_EXPECT_EQ(test, test_result[1], 0);
    35		test_result[0] = 0;
    36		test_result[1] = 0;
    37	
    38		mpam_reset_msc_bitmap(&fake_msc, MPAMCFG_CPBM, 16);
    39		KUNIT_EXPECT_EQ(test, test_result[0], 0xffff);
    40		KUNIT_EXPECT_EQ(test, test_result[1], 0);
    41		test_result[0] = 0;
    42		test_result[1] = 0;
    43	
    44		mpam_reset_msc_bitmap(&fake_msc, MPAMCFG_CPBM, 32);
    45		KUNIT_EXPECT_EQ(test, test_result[0], 0xffffffff);
    46		KUNIT_EXPECT_EQ(test, test_result[1], 0);
    47		test_result[0] = 0;
    48		test_result[1] = 0;
    49	
    50		mpam_reset_msc_bitmap(&fake_msc, MPAMCFG_CPBM, 33);
    51		KUNIT_EXPECT_EQ(test, test_result[0], 0xffffffff);
    52		KUNIT_EXPECT_EQ(test, test_result[1], 1);
    53		test_result[0] = 0;
    54		test_result[1] = 0;
    55	
    56		mutex_unlock(&fake_msc.part_sel_lock);
    57	}
    58	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
