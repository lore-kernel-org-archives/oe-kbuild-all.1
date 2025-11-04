Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC0121DED5C
	for <oe-kbuild-all@lists.linux.dev>; Tue,  4 Nov 2025 09:23:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762248227; cv=none; b=hqXUl5UQin9ecAuTQiZVnBY9n1ek27HSifEYk8y5hHJfIkJu0Bkyw2QdoGcpoMcbyqBMPuPwF9lSUzG6wj2hl2GL6n+ROVpyODkM05qThWmsVIgelG0eTfArJ9fHbF87bbKEsXaxFoaP5NB1Bnc4JI/z9euPh1fQHC6CcP21rW8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762248227; c=relaxed/simple;
	bh=JXIa0uylXuUtModgwk6LlEN8x3tdv5l7xC2DZoFykOA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=tGdy9WztwgLUhmCUTQfMm9j49z5xBSI/tcYH81aFMdAj3kI9iY6ahH+FypCfwNLqU2BTFi4aW/7BN8V2uP1t2f56j79iB38Lx/ySw+st0CuAl5W1PSHEtl7JfRI8qwfOtv9YICvu99fbasD4nHBNxElwzRcIPU1PugXl22e/8QM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=abi9N8Uf; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="abi9N8Uf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762248226; x=1793784226;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=JXIa0uylXuUtModgwk6LlEN8x3tdv5l7xC2DZoFykOA=;
  b=abi9N8UfeToB8Clj1mrvwAwoP5JIZfwzVhVdJ1sWsnyIlDW5KeIjOvlj
   yiJ6mALNeowkRXPG05eljf/3wOlMu56Bs9WaEJvd/nlo/zsYuaddN1fVZ
   DXbAt731qQ6E9mfQ5e4QUDTa8LKeA6MRuqyMkF2093YmQG8XxfOSjGdzl
   txgWXzeAv2oPBmBC8yAQU7uikDqYg7NMsC5+8SyJacLz5keEbqk9nTVKv
   eIZMBfYM7T3/VSJRQ68xwXfvey0FyGXh/kBxI8cXm1SvNoWLv5f+P9PK2
   tUxjOjv7scjFwY6cDEHP+8heBXsYu1T8KHsq88n9ah50u6qprxsHdC4yg
   A==;
X-CSE-ConnectionGUID: sksv4LfQRmGi40WA6qEwhg==
X-CSE-MsgGUID: t7ACqV6vSIuJGSFz/bdGOw==
X-IronPort-AV: E=McAfee;i="6800,10657,11602"; a="74629730"
X-IronPort-AV: E=Sophos;i="6.19,278,1754982000"; 
   d="scan'208";a="74629730"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2025 01:23:45 -0800
X-CSE-ConnectionGUID: wqP9JGBCRw+/ixg+Q2u99g==
X-CSE-MsgGUID: lMPYM/sVSOqjn+9ts+cSXg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,278,1754982000"; 
   d="scan'208";a="187058318"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa007.jf.intel.com with ESMTP; 04 Nov 2025 01:23:44 -0800
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vGDGI-000RCC-2M;
	Tue, 04 Nov 2025 09:23:37 +0000
Date: Tue, 4 Nov 2025 17:22:30 +0800
From: kernel test robot <lkp@intel.com>
To: Yicong Yang <yangyicong@hisilicon.com>
Cc: oe-kbuild-all@lists.linux.dev, Will Deacon <will@kernel.org>
Subject: [arm-perf:for-next/perf 1/8] drivers/perf/arm_pmu.c:932:24: error:
 implicit declaration of function 'topology_core_has_smt'; did you mean
 'topology_core_cpumask'?
Message-ID: <202511041757.vuCGOmFc-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/will/linux.git for-next/perf
head:   989b40b7578a2be7b0388522d33d751b257d59d9
commit: c3d78c34ad009a7cce57ae5b5c93e1bd03bb31a3 [1/8] perf: arm_pmuv3: Don't use PMCCNTR_EL0 on SMT cores
config: arm-randconfig-001-20251104 (https://download.01.org/0day-ci/archive/20251104/202511041757.vuCGOmFc-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251104/202511041757.vuCGOmFc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511041757.vuCGOmFc-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/perf/arm_pmu.c: In function 'armpmu_register':
>> drivers/perf/arm_pmu.c:932:24: error: implicit declaration of function 'topology_core_has_smt'; did you mean 'topology_core_cpumask'? [-Wimplicit-function-declaration]
     932 |         pmu->has_smt = topology_core_has_smt(cpumask_first(&pmu->supported_cpus));
         |                        ^~~~~~~~~~~~~~~~~~~~~
         |                        topology_core_cpumask


vim +932 drivers/perf/arm_pmu.c

   919	
   920	int armpmu_register(struct arm_pmu *pmu)
   921	{
   922		int ret;
   923	
   924		ret = cpu_pmu_init(pmu);
   925		if (ret)
   926			return ret;
   927	
   928		/*
   929		 * By this stage we know our supported CPUs on either DT/ACPI platforms,
   930		 * detect the SMT implementation.
   931		 */
 > 932		pmu->has_smt = topology_core_has_smt(cpumask_first(&pmu->supported_cpus));
   933	
   934		if (!pmu->set_event_filter)
   935			pmu->pmu.capabilities |= PERF_PMU_CAP_NO_EXCLUDE;
   936	
   937		ret = perf_pmu_register(&pmu->pmu, pmu->name, -1);
   938		if (ret)
   939			goto out_destroy;
   940	
   941		pr_info("enabled with %s PMU driver, %d (%*pb) counters available%s\n",
   942			pmu->name, bitmap_weight(pmu->cntr_mask, ARMPMU_MAX_HWEVENTS),
   943			ARMPMU_MAX_HWEVENTS, &pmu->cntr_mask,
   944			has_nmi ? ", using NMIs" : "");
   945	
   946		kvm_host_pmu_init(pmu);
   947	
   948		return 0;
   949	
   950	out_destroy:
   951		cpu_pmu_destroy(pmu);
   952		return ret;
   953	}
   954	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
