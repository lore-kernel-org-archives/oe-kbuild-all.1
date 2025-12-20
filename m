Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 778072DE701
	for <oe-kbuild-all@lists.linux.dev>; Sat, 20 Dec 2025 19:50:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766260247; cv=none; b=t4krU1Hxj9VvdRazBqflEh+U8AMOoDfvbVF2vr1uIy0uLEWw85q2mZmvIkafq9fyCml3kkf68tk9+Z2DUgdLQCigy74Eo0sFgefFXZ/iglAEowUUzP95+nuZeiNkIjGkvR89W78IgPfgW/Z0LtLFZ5qYLjqNqD2MdUN+o95s0HQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766260247; c=relaxed/simple;
	bh=bX4uOHrAqeTdHkKmVXEgu5yV+lqqGg5SA26ypMrqyKQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=uKpYh4tiPeZepwaNHnFzuxFaTeqllV/3L67vWoNnNkaAI/1uqxx+cIwrnR7IrwOU2S9CTUOwMnzjqd4qcmJvfcX0/dIZVxzfRBA+Ts9huI/K2q79E4W7z9iEiuKYNM4vSYnoDrHdWpHCVGmJS32F2KIIEdA57aK4KBWyDEmvywE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ib3xMCO3; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ib3xMCO3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766260245; x=1797796245;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=bX4uOHrAqeTdHkKmVXEgu5yV+lqqGg5SA26ypMrqyKQ=;
  b=ib3xMCO3iRG1jnjiKzOSCCX8aKsVhUrjDO1MAIxK2v/hQFmAdn/o1GaE
   qDFZ3KsTIyXVsf7KWNF3aqRu/sniJ49i1Z5M9norLexLoBqJQxoVXC2xP
   4O3WkAFQgecU4LcTmQEArQ4v6E2bxEnmdFgUhKZJ4a/z6YiqT49cf5q8V
   T+Aj9/+Yc0mMYmgKNqqYV2wWUfIVxIlwiUH4oROVAdpkpv9XaJBz5vYco
   KoxEGSoOIupOpWWhWHxVbM3v6ca9P/efuWbim/1Zfv87hqDsmLCcLegm/
   u3s8Qbdx3s4S2bQO1esKNGYn1HrrhkaisHCQ4VAW3auCgFTZ3IdeRPwRU
   w==;
X-CSE-ConnectionGUID: AwxyprzPQVal4/6ILbLFRw==
X-CSE-MsgGUID: YFloSm4sTS6TWUHFmKd1Zw==
X-IronPort-AV: E=McAfee;i="6800,10657,11648"; a="72029981"
X-IronPort-AV: E=Sophos;i="6.21,164,1763452800"; 
   d="scan'208";a="72029981"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Dec 2025 11:50:43 -0800
X-CSE-ConnectionGUID: al+2XXi3Ti6ZQxEYeePNVg==
X-CSE-MsgGUID: 6j0kkRNSSyWGdA9+D+lagw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,164,1763452800"; 
   d="scan'208";a="199139040"
Received: from lkp-server01.sh.intel.com (HELO 0d09efa1b85f) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 20 Dec 2025 11:50:42 -0800
Received: from kbuild by 0d09efa1b85f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vX2yN-0000000055H-3VNW;
	Sat, 20 Dec 2025 19:50:39 +0000
Date: Sun, 21 Dec 2025 03:50:12 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Zeng Heng <zengheng4@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 3557/3557]
 drivers/platform/mpam/mpam_resctrl.c:25:1: sparse: sparse: symbol
 'resctrl_mon_ctx_waiters' was not declared. Should it be static?
Message-ID: <202512210339.nHxRhG7l-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   04473ee9ed912a16fff0d8846ad565bbf3d63c77
commit: 9119da1439390ea4f29a0635652248aa3c2040f0 [3557/3557] arm_mpam: resctrl: Allow resctrl to allocate monitors
config: arm64-randconfig-r132-20251218 (https://download.01.org/0day-ci/archive/20251221/202512210339.nHxRhG7l-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251221/202512210339.nHxRhG7l-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512210339.nHxRhG7l-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/platform/mpam/mpam_resctrl.c:25:1: sparse: sparse: symbol 'resctrl_mon_ctx_waiters' was not declared. Should it be static?
>> drivers/platform/mpam/mpam_resctrl.c:45:5: sparse: sparse: symbol '__mon_is_rmid_idx' was not declared. Should it be static?
   drivers/platform/mpam/mpam_resctrl.c:46:6: sparse: sparse: symbol 'mon_is_rmid_idx' was not declared. Should it be static?

vim +/resctrl_mon_ctx_waiters +25 drivers/platform/mpam/mpam_resctrl.c

    24	
  > 25	DECLARE_WAIT_QUEUE_HEAD(resctrl_mon_ctx_waiters);
    26	
    27	/*
    28	 * The classes we've picked to map to resctrl resources.
    29	 * Class pointer may be NULL.
    30	 */
    31	static struct mpam_resctrl_res mpam_resctrl_exports[RDT_NUM_RESOURCES];
    32	
    33	static bool exposed_alloc_capable;
    34	static bool exposed_mon_capable;
    35	static struct mpam_class *mbm_local_class;
    36	static struct mpam_class *mbm_total_class;
    37	
    38	/*
    39	 * MPAM emulates CDP by setting different PARTID in the I/D fields of MPAM1_EL1.
    40	 * This applies globally to all traffic the CPU generates.
    41	 */
    42	static bool cdp_enabled;
    43	
    44	/* A dummy mon context to use when the monitors were allocated up front */
  > 45	u32 __mon_is_rmid_idx = USE_RMID_IDX;
    46	void *mon_is_rmid_idx = &__mon_is_rmid_idx;
    47	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
