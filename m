Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9EF219340E
	for <oe-kbuild-all@lists.linux.dev>; Sat,  8 Feb 2025 12:20:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739017254; cv=none; b=UrrAsSrUX0bUfZzoGK4zlhMueTjsIwxzaS7s/I0OCsYWLkFERn5Jx32vDNBUDqMpo3yDcXYhjYc7GssvBGN4d0wK2TxLdYhf4d06Yna8Z0AHhnQ3p3bJgy/0CXlqvJa2GCLd1RE1FxMCUMKLKp3BAD79o2jrim/0h/bSPqSIbj0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739017254; c=relaxed/simple;
	bh=Z0AYpSE++mauA/nSQ4WIDHtqZ8bhNfsQHTob/frjZS4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=O4SUo1qv6AmWdXYydXlRkl/vT58CPLCUjDhGouJJpguHUpdtcl7GQF6/EPv0/smpc35lXHT555pK37qzGYPc3BRLJoPbDv+00oHp5hZosqP7zeeMpRSBEqwsL7eSJI0U98jciEn4/952C+N6spOQBc2CjGP//UUjovHVijsqcHM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PD0P4Roh; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PD0P4Roh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739017253; x=1770553253;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Z0AYpSE++mauA/nSQ4WIDHtqZ8bhNfsQHTob/frjZS4=;
  b=PD0P4RohEIGRKHjEQZO3aeojjffpLAIriqlzlhfuZuRnDsUGEWHe7A8H
   xrgHp4upTPfwzFeF4KUrSea/z5FxHiTe5e5lC2oslO8jNan+A7GkHuspJ
   +o/u8kB+qYIRafpwnNabPLzG8lSdjkMDRrt/0PqGJZQ8mMDIktDE2GFD5
   S7+ljqAlP+Lg9SueRdj3K/wuulp0jnw7609ySW62+mXfNdCJt8hSDqBWN
   JEyJ71qCsRNk+lpdl5W4NY9paHN4FUpAQGTSQYoBdGCHwqLXZPU40LY+P
   6Dom0ZHjejfpJkgzJGkh++pdsPPkkMxkRHb+hyQ1glrMiU4UY27EmPD3+
   Q==;
X-CSE-ConnectionGUID: HsTwrmx7Thq6qXQsiYo9ng==
X-CSE-MsgGUID: QQsIsWFJRIGZKsyIhUSgbg==
X-IronPort-AV: E=McAfee;i="6700,10204,11339"; a="50289936"
X-IronPort-AV: E=Sophos;i="6.13,270,1732608000"; 
   d="scan'208";a="50289936"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Feb 2025 04:20:52 -0800
X-CSE-ConnectionGUID: WN9A1+EQSbS+nLZMZS87oA==
X-CSE-MsgGUID: +pQmBIb6Sca0+2n2tz0Mww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="112200073"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 08 Feb 2025 04:20:51 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tgjpI-000zwt-01;
	Sat, 08 Feb 2025 12:20:48 +0000
Date: Sat, 8 Feb 2025 20:20:28 +0800
From: kernel test robot <lkp@intel.com>
To: Marc Zyngier <maz@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: [arm-platforms:kvm-arm64/pmu-includes 15/15]
 drivers/perf/arm_pmu.c:932:9: error: implicit declaration of function
 'kvm_host_pmu_init'
Message-ID: <202502082022.BTq0xSDj-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/maz/arm-platforms.git kvm-arm64/pmu-includes
head:   7f3348d6c8577e4e729279ef30f5e9013cf9fbd5
commit: 7f3348d6c8577e4e729279ef30f5e9013cf9fbd5 [15/15] PMU include cleanup
config: arm-randconfig-004-20250208 (https://download.01.org/0day-ci/archive/20250208/202502082022.BTq0xSDj-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250208/202502082022.BTq0xSDj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502082022.BTq0xSDj-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/perf/arm_pmu.c: In function 'armpmu_register':
>> drivers/perf/arm_pmu.c:932:9: error: implicit declaration of function 'kvm_host_pmu_init' [-Wimplicit-function-declaration]
     932 |         kvm_host_pmu_init(pmu);
         |         ^~~~~~~~~~~~~~~~~


vim +/kvm_host_pmu_init +932 drivers/perf/arm_pmu.c

2681f0184276d7 Mark Rutland      2017-03-10  911  
74a2b3ea2d8c6c Mark Rutland      2017-04-11  912  int armpmu_register(struct arm_pmu *pmu)
74a2b3ea2d8c6c Mark Rutland      2017-04-11  913  {
74a2b3ea2d8c6c Mark Rutland      2017-04-11  914  	int ret;
74a2b3ea2d8c6c Mark Rutland      2017-04-11  915  
74a2b3ea2d8c6c Mark Rutland      2017-04-11  916  	ret = cpu_pmu_init(pmu);
74a2b3ea2d8c6c Mark Rutland      2017-04-11  917  	if (ret)
74a2b3ea2d8c6c Mark Rutland      2017-04-11  918  		return ret;
74a2b3ea2d8c6c Mark Rutland      2017-04-11  919  
1d899c0e9bc2a1 Andrew Murray     2019-01-10  920  	if (!pmu->set_event_filter)
1d899c0e9bc2a1 Andrew Murray     2019-01-10  921  		pmu->pmu.capabilities |= PERF_PMU_CAP_NO_EXCLUDE;
1d899c0e9bc2a1 Andrew Murray     2019-01-10  922  
74a2b3ea2d8c6c Mark Rutland      2017-04-11  923  	ret = perf_pmu_register(&pmu->pmu, pmu->name, -1);
74a2b3ea2d8c6c Mark Rutland      2017-04-11  924  	if (ret)
74a2b3ea2d8c6c Mark Rutland      2017-04-11  925  		goto out_destroy;
74a2b3ea2d8c6c Mark Rutland      2017-04-11  926  
bf5ffc8c80e0cf Rob Herring (Arm  2024-07-31  927) 	pr_info("enabled with %s PMU driver, %d (%*pb) counters available%s\n",
bf5ffc8c80e0cf Rob Herring (Arm  2024-07-31  928) 		pmu->name, bitmap_weight(pmu->cntr_mask, ARMPMU_MAX_HWEVENTS),
bf5ffc8c80e0cf Rob Herring (Arm  2024-07-31  929) 		ARMPMU_MAX_HWEVENTS, &pmu->cntr_mask,
d8f6267f7ce5dc Julien Thierry    2020-09-24  930  		has_nmi ? ", using NMIs" : "");
74a2b3ea2d8c6c Mark Rutland      2017-04-11  931  
e840f42a499257 Marc Zyngier      2021-09-19 @932  	kvm_host_pmu_init(pmu);
e840f42a499257 Marc Zyngier      2021-09-19  933  
74a2b3ea2d8c6c Mark Rutland      2017-04-11  934  	return 0;
74a2b3ea2d8c6c Mark Rutland      2017-04-11  935  
74a2b3ea2d8c6c Mark Rutland      2017-04-11  936  out_destroy:
74a2b3ea2d8c6c Mark Rutland      2017-04-11  937  	cpu_pmu_destroy(pmu);
74a2b3ea2d8c6c Mark Rutland      2017-04-11  938  	return ret;
74a2b3ea2d8c6c Mark Rutland      2017-04-11  939  }
74a2b3ea2d8c6c Mark Rutland      2017-04-11  940  

:::::: The code at line 932 was first introduced by commit
:::::: e840f42a49925707fca90e6c7a4095118fdb8c4d KVM: arm64: Fix PMU probe ordering

:::::: TO: Marc Zyngier <maz@kernel.org>
:::::: CC: Marc Zyngier <maz@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
