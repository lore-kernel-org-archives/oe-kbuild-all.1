Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E24118468
	for <oe-kbuild-all@lists.linux.dev>; Sat, 31 Aug 2024 15:10:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725117014; cv=none; b=lYP2ZqjyCPD8QIpq7+odRn8NV8GFFQykHUajO4QlNmZJ+1unUHyYZpkwtCPKJ1ghUUrfWrMnPsqJWTJeyqvXKBANH0jBgpvt6LYtHiE0esRUMKTVhs177OZ+IfqWe84IY5YUUIJLhbCgK+VydGfFPTcSeI81QCakVzvj45fL8gw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725117014; c=relaxed/simple;
	bh=1xVGv+SC84h7SOr+spXDFBlJu2mosTjn3kUoDRcy6OU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=iguB72hII435BRQ9GNPXiDAaEEnmNne6sDvmGJqc+cozBhnGPOwW9kWwjfeIFBCW/I6Winvl2bo0OpVeq+hjbj5QRG1be6KXs0NmdAWt/CEM8+8MW01Cyg56ZKvPAkhf0Ci8SZJ+73NqFVsbHAmY3OkhOijkD6XmlomSNgd2/jc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SyvRCz8w; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SyvRCz8w"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725117012; x=1756653012;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1xVGv+SC84h7SOr+spXDFBlJu2mosTjn3kUoDRcy6OU=;
  b=SyvRCz8w2wc7TlTzxyLVvTFk3Sw1R5GRVT0xNerWco6WxdQcaatdw1fz
   ytIqdoXbVKHu9uO8y6ccpRMSvjtGDpfwXuKRZ8KTC+o/5+lpBVkE31a4Y
   xhXn4bcfa6IwkTfldkYZRKweXMj2Un8SpHWLXMs3Q7ztb81xX5YDEUWCE
   FLaUyql2XSgTcAoXIyP5R3CobuvbPrjkdZ+zORRtbmE5hpLdxCTtdEgdD
   NMOGaVohZNaGfze0DPcaVxJtHMdfDpKPKZ5n50bZbDK/iabYr8SJoRx5m
   Fk+dooHrQQpy64k3d74mnN6Sxj1hIHN0ngsWcqcrSIi/550m+jqYoxzjo
   g==;
X-CSE-ConnectionGUID: hLYg/Eq+RbyKfmRS3FU9PA==
X-CSE-MsgGUID: DJSDLa2YRR6YdrWIXCPtQA==
X-IronPort-AV: E=McAfee;i="6700,10204,11181"; a="23883288"
X-IronPort-AV: E=Sophos;i="6.10,192,1719903600"; 
   d="scan'208";a="23883288"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2024 08:10:12 -0700
X-CSE-ConnectionGUID: Ra/oSbOeShGcBEgsKSU89g==
X-CSE-MsgGUID: pS+mtawJR4eAeojIDVRiEg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,192,1719903600"; 
   d="scan'208";a="94890974"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 31 Aug 2024 08:10:11 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1skPjs-0002rG-0N;
	Sat, 31 Aug 2024 15:10:08 +0000
Date: Sat, 31 Aug 2024 23:09:31 +0800
From: kernel test robot <lkp@intel.com>
To: Anshuman Khandual <anshuman.khandual@arm.com>
Cc: oe-kbuild-all@lists.linux.dev, Mark Rutland <mark.rutland@arm.com>
Subject: [mark:arm64/brbe 6/10] drivers/perf/arm_pmuv3.c:1314:22: sparse:
 sparse: incorrect type in assignment (different address spaces)
Message-ID: <202408312311.XYj3ZFZu-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mark/linux.git arm64/brbe
head:   dc7efc5b697eea31ad0c1b663f26417195556e8f
commit: d4bb8bff2986d2ed49af99e8b034acfc738460db [6/10] WIP: perf/arm_pmuv3: Enable branch stack sampling via FEAT_BRBE
config: arm64-randconfig-r112-20240831 (https://download.01.org/0day-ci/archive/20240831/202408312311.XYj3ZFZu-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
reproduce: (https://download.01.org/0day-ci/archive/20240831/202408312311.XYj3ZFZu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408312311.XYj3ZFZu-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/perf/arm_pmuv3.c:1314:22: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct perf_branch_stack *branch_stack @@     got void [noderef] __percpu *_res @@
   drivers/perf/arm_pmuv3.c:1314:22: sparse:     expected struct perf_branch_stack *branch_stack
   drivers/perf/arm_pmuv3.c:1314:22: sparse:     got void [noderef] __percpu *_res
>> drivers/perf/arm_pmuv3.c:1324:36: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct perf_branch_stack * @@
   drivers/perf/arm_pmuv3.c:1324:36: sparse:     expected void const [noderef] __percpu *__vpp_verify
   drivers/perf/arm_pmuv3.c:1324:36: sparse:     got struct perf_branch_stack *

vim +1314 drivers/perf/arm_pmuv3.c

  1306	
  1307	static int branch_records_alloc(struct arm_pmu *armpmu)
  1308	{
  1309		struct perf_branch_stack *branch_stack;
  1310		size_t size = struct_size(branch_stack, entries,
  1311					  armpmu->num_branch_records);
  1312		int cpu;
  1313	
> 1314		branch_stack = __alloc_percpu_gfp(size, __alignof__(*branch_stack),
  1315						  GFP_KERNEL);
  1316		if (!branch_stack)
  1317			return -ENOMEM;
  1318	
  1319		for_each_possible_cpu(cpu) {
  1320			struct pmu_hw_events *events_cpu;
  1321			struct perf_branch_stack *branch_stack_cpu;
  1322	
  1323			events_cpu = per_cpu_ptr(armpmu->hw_events, cpu);
> 1324			branch_stack_cpu = per_cpu_ptr(branch_stack, cpu);
  1325			events_cpu->branch_stack = branch_stack_cpu;
  1326		}
  1327		return 0;
  1328	}
  1329	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
