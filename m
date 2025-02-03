Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67FAB1465BA
	for <oe-kbuild-all@lists.linux.dev>; Mon,  3 Feb 2025 23:35:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738625743; cv=none; b=bUzRYEdF509RPECcJNIFpoDfa7f61zHAlU81uHm86yKEiqWFxmeu1c3qj6+KUze+MJUlYHKmVdXYkTYYfdmBANoov2rmuATGL7GVJ5aw5LYn5hrbvvvs4Roi7V/OfgKwtq1XcdidLcBvdP9eiPXYUhXHUqabNjSUu/saLHySbTM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738625743; c=relaxed/simple;
	bh=aleYFFBiE0rMKlT6ozw5LuxCn0X3X4nIF8qDg7ZOWfI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jwzQ0vB975m35dLMN2aC52DOb/evtUZ+81Q0oyIK7+jNIjGE26yvzMX7qaMMYzsm0MhN9kBltp77YsLwc9nUMItGeUnzEWS71TEfkgsX5qmnQyXaPurHLKWLFLuG5LhPJm1ecAFZhsGXhnoP3h2ESWOp36gGRyWmAInt9NOfsGc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KC0sG5XE; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KC0sG5XE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738625741; x=1770161741;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=aleYFFBiE0rMKlT6ozw5LuxCn0X3X4nIF8qDg7ZOWfI=;
  b=KC0sG5XEdLCbdYJzkhLMHPc3KbOwSkdkEOGKlAZLQV4k5gNkcuGy6Sdf
   BMo/0VVpuOVAB9jtGiYbqCGJY0lf2nykxoDymNGeknMa7rtYrAuX0K2MY
   HQTsK7Ws7buXXNd/s71aJy3bpmwcxOiPMuSP62YZA63QGBUijvmLKQzUk
   Kqj/cjpyCJyGnftMEAtyOoDYPcq+b55xBZrA6WjngY9ZAJfaUArSRIhvf
   kn566w9+VhF22cFYVZqSv5vAADWlYdC5u1RvqxI6jvTuWi5ERQPHneGO4
   PRjIKX/yCzxnnc4nENocWsqbamkp5vxTeY6YfEaVZPWIkYANc3bPCRHpr
   w==;
X-CSE-ConnectionGUID: 1u6SqclzT/+8FuM3p2kusQ==
X-CSE-MsgGUID: gBdrR1ejQdWkKqFoQ9Yw+w==
X-IronPort-AV: E=McAfee;i="6700,10204,11335"; a="56569218"
X-IronPort-AV: E=Sophos;i="6.13,257,1732608000"; 
   d="scan'208";a="56569218"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2025 15:35:40 -0800
X-CSE-ConnectionGUID: CJZIwVjXTYOZgHWT3xgpBw==
X-CSE-MsgGUID: +cerW0/ZQvW0+DBE29/Rbw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,257,1732608000"; 
   d="scan'208";a="115409687"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 03 Feb 2025 15:35:39 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tf5yb-000rgn-0x;
	Mon, 03 Feb 2025 23:35:37 +0000
Date: Tue, 4 Feb 2025 07:35:27 +0800
From: kernel test robot <lkp@intel.com>
To: Anshuman Khandual <anshuman.khandual@arm.com>
Cc: oe-kbuild-all@lists.linux.dev, "Rob Herring (Arm)" <robh@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>
Subject: [robh:arm/brbe-v19 12/12] drivers/perf/arm_pmuv3.c:1302:22: sparse:
 sparse: incorrect type in assignment (different address spaces)
Message-ID: <202502040743.CwHR1Hnz-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git arm/brbe-v19
head:   46af1a528a3e42e040e4fed60db4ed85e6818528
commit: 46af1a528a3e42e040e4fed60db4ed85e6818528 [12/12] perf: arm_pmuv3: Add support for the Branch Record Buffer Extension (BRBE)
config: arm64-randconfig-r131-20250203 (https://download.01.org/0day-ci/archive/20250204/202502040743.CwHR1Hnz-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
reproduce: (https://download.01.org/0day-ci/archive/20250204/202502040743.CwHR1Hnz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502040743.CwHR1Hnz-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/perf/arm_pmuv3.c:1302:22: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct perf_branch_stack *branch_stack @@     got void [noderef] __percpu *[assigned] _res @@
   drivers/perf/arm_pmuv3.c:1302:22: sparse:     expected struct perf_branch_stack *branch_stack
   drivers/perf/arm_pmuv3.c:1302:22: sparse:     got void [noderef] __percpu *[assigned] _res
   drivers/perf/arm_pmuv3.c:1312:36: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct perf_branch_stack * @@
   drivers/perf/arm_pmuv3.c:1312:36: sparse:     expected void const [noderef] __percpu *__vpp_verify
   drivers/perf/arm_pmuv3.c:1312:36: sparse:     got struct perf_branch_stack *

vim +1302 drivers/perf/arm_pmuv3.c

  1295	
  1296	static int branch_records_alloc(struct arm_pmu *armpmu)
  1297	{
  1298		struct perf_branch_stack *branch_stack;
  1299		size_t size = struct_size(branch_stack, entries, brbe_num_branch_records(armpmu));
  1300		int cpu;
  1301	
> 1302		branch_stack = __alloc_percpu_gfp(size, __alignof__(*branch_stack),
  1303						  GFP_KERNEL);
  1304		if (!branch_stack)
  1305			return -ENOMEM;
  1306	
  1307		for_each_possible_cpu(cpu) {
  1308			struct pmu_hw_events *events_cpu;
  1309			struct perf_branch_stack *branch_stack_cpu;
  1310	
  1311			events_cpu = per_cpu_ptr(armpmu->hw_events, cpu);
  1312			branch_stack_cpu = per_cpu_ptr(branch_stack, cpu);
  1313			events_cpu->branch_stack = branch_stack_cpu;
  1314		}
  1315		return 0;
  1316	}
  1317	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
