Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A535F35968
	for <oe-kbuild-all@lists.linux.dev>; Mon,  9 Dec 2024 14:09:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733753377; cv=none; b=dS8sxmeVfCwCYrYoTPKke4sPQrapY+QNWP39xqXbHWw8STQG0klHGId1nXwweod1YNbFrgzzWNK4Cw/GftdxyNBBDzAMA6hXCUvzMTeogvSrA6GVLpH8Qrn7V4LXWK/gyO83VIifoq9V4O/BgfPat/HqqSI5strsTcSgb7IbVvU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733753377; c=relaxed/simple;
	bh=hMUJQVFG6XPKdnXlXUV+3xNlswAFZo/0Lsw6RnYxbdI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=gZ2LZGGgJI3U4VzhBKW4nKFZ+3GXZ2cLgdajKkXDurO+AHgSh5lKXRtN+bFfmygj7zPBAOvcNYyqh8cxapWZDg9xrbwtpENDCZZxG6aPj2yXGoTYadzBOZgPoJYdS5H4+C8ILXTxu8SqDZxzl4x4XB+vgKJ2Pir2XeGxWk1++nE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lAxG4b7j; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lAxG4b7j"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733753376; x=1765289376;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=hMUJQVFG6XPKdnXlXUV+3xNlswAFZo/0Lsw6RnYxbdI=;
  b=lAxG4b7jHu83lUUL1mzpkLH/8OhgN9C2R/hu/rsU5ZT+GFtD7x4SbVGO
   C8awgU+f4rV5fDQKRl6yVgfO3XZ8V5zNqCK2oxgScPccJKyHAFl/VdjDd
   KFTNBNIEiQ1vSKHX++CjdI4coexdq80xRkYUUsFzoDtmcJUDGzG1Iihi4
   y+j51GY9j9uRCy6TkELYX8Wxpn9XiJ+/9CaIs5LA4rz7fFbXhbl1hjJo7
   n4w532lHs7revLuCahH/1X/KXFM/9xiJq6mTMaerkMaeD2KkVaxnQBtyh
   JlOpQzq+UaC9nq5rb5aruW8H4UkrSnU058+R7p3r4U878Yvq2l9up4f97
   Q==;
X-CSE-ConnectionGUID: iPCLsFXtQCOVC7EiQVUK9A==
X-CSE-MsgGUID: XI8VCKkrRGesNU3MHDHVeA==
X-IronPort-AV: E=McAfee;i="6700,10204,11281"; a="34108346"
X-IronPort-AV: E=Sophos;i="6.12,219,1728975600"; 
   d="scan'208";a="34108346"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Dec 2024 06:09:36 -0800
X-CSE-ConnectionGUID: poegPLpxQvO0jVVeDVTfKQ==
X-CSE-MsgGUID: 4VsgyV4ERbGAI5XWfSqA+w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,219,1728975600"; 
   d="scan'208";a="94918246"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 09 Dec 2024 06:09:33 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tKeS3-0004Ov-1T;
	Mon, 09 Dec 2024 14:09:31 +0000
Date: Mon, 9 Dec 2024 21:59:24 +0800
From: kernel test robot <lkp@intel.com>
To: Anshuman Khandual <anshuman.khandual@arm.com>
Cc: oe-kbuild-all@lists.linux.dev, "Rob Herring (Arm)" <robh@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>
Subject: [robh:arm/brbe-rebase 7/13] drivers/perf/arm_pmuv3.c:1305:22:
 sparse: sparse: incorrect type in assignment (different address spaces)
Message-ID: <202412092105.egS4Z9Td-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git arm/brbe-rebase
head:   340d77ef861e6ba0bfcb9cb04c0ceb4d8de7e3ac
commit: 41313636fd07fbf7d5b7e38b3b645faee661e619 [7/13] WIP: perf: arm_pmuv3: Add support for the Branch Record Buffer Extension (BRBE)
config: arm64-randconfig-r113-20241209 (https://download.01.org/0day-ci/archive/20241209/202412092105.egS4Z9Td-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 592c0fe55f6d9a811028b5f3507be91458ab2713)
reproduce: (https://download.01.org/0day-ci/archive/20241209/202412092105.egS4Z9Td-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412092105.egS4Z9Td-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/perf/arm_pmuv3.c:1305:22: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct perf_branch_stack *branch_stack @@     got void [noderef] __percpu *_res @@
   drivers/perf/arm_pmuv3.c:1305:22: sparse:     expected struct perf_branch_stack *branch_stack
   drivers/perf/arm_pmuv3.c:1305:22: sparse:     got void [noderef] __percpu *_res
>> drivers/perf/arm_pmuv3.c:1315:36: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct perf_branch_stack * @@
   drivers/perf/arm_pmuv3.c:1315:36: sparse:     expected void const [noderef] __percpu *__vpp_verify
   drivers/perf/arm_pmuv3.c:1315:36: sparse:     got struct perf_branch_stack *

vim +1305 drivers/perf/arm_pmuv3.c

  1295	
  1296	static int branch_records_alloc(struct arm_pmu *armpmu)
  1297	{
  1298		/*
  1299		 * TODO: fix the sizing
  1300		 */
  1301		struct perf_branch_stack *branch_stack;
  1302		size_t size = struct_size(branch_stack, entries, brbe_num_branch_records(armpmu));
  1303		int cpu;
  1304	
> 1305		branch_stack = __alloc_percpu_gfp(size, __alignof__(*branch_stack),
  1306						  GFP_KERNEL);
  1307		if (!branch_stack)
  1308			return -ENOMEM;
  1309	
  1310		for_each_possible_cpu(cpu) {
  1311			struct pmu_hw_events *events_cpu;
  1312			struct perf_branch_stack *branch_stack_cpu;
  1313	
  1314			events_cpu = per_cpu_ptr(armpmu->hw_events, cpu);
> 1315			branch_stack_cpu = per_cpu_ptr(branch_stack, cpu);
  1316			events_cpu->branch_stack = branch_stack_cpu;
  1317		}
  1318		return 0;
  1319	}
  1320	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
