Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37CC91D88DD
	for <oe-kbuild-all@lists.linux.dev>; Sun,  1 Dec 2024 22:51:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733093514; cv=none; b=TEInkRsbf7xY3ojPDN8b8XuYL47kNz804s4iOD9sj+4S1DP4ZckWKnZoQ0FyVIGSn15fLn0rwNyKNiHTUVKqWIPER++USJIq0NDzEUReDFyfP7+7dN3x1fxfkzXgelYZjdt5LcyXF+GYJMAuYJ9rQZUgC4sp7tW62VTI7YAsRBk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733093514; c=relaxed/simple;
	bh=RShDDrM725O0itP1KRatNC6aA27lUWMswsm35rnHvZ0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=DA+WdMjAoqJdb0RKKTefJz5YXdM3cJhr9E2D2Y9rNPb9Xrp0AKYedsJ/1vWBjbjWgUuOvrIVGeSUuxJVHCh/ESHmxqC0M8A/CQI+JAcz+PpLLpF6Or+Rv5YAboqrbv15kqvUFxEwFY2UtoajrY7qUPV2bcGnYw+J9puXSGX68NM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nftOgwdg; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nftOgwdg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733093512; x=1764629512;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=RShDDrM725O0itP1KRatNC6aA27lUWMswsm35rnHvZ0=;
  b=nftOgwdgyjlydicqXiChRktfcy4YE5IVUNbpMjwhpaRGayHcUwDNmxoU
   3O4rqRbUxHxYtc7XiG49Iz8IlnuCf+ypax+gRUomPIzcIRBDJCFYB0yM0
   SYlPFI3qa28yzGvzdVoQu8g5fC3hUv4J1UBNfZI3lBp2peyhBrhhHffPJ
   V2JqWUZEEr2+ZmSvdqVexQgrn+ceLHZAd4LAWbKLqjR/jZFfMp+Pj4SMJ
   4JbF890Qvp47lIxlrVfXF213VvgzQk3BLbber3XDLDlATbRUvL3lzYGQB
   /Yj9LDC1yXzLrEQrDIsTBoElt0th4oetyabQ1G8nT80ibxoA9r+SpXVKx
   A==;
X-CSE-ConnectionGUID: 7UANPQvCRp6CqsZkYsJohQ==
X-CSE-MsgGUID: 8dddUbBSTaq09vCu1l0B6w==
X-IronPort-AV: E=McAfee;i="6700,10204,11273"; a="55740269"
X-IronPort-AV: E=Sophos;i="6.12,201,1728975600"; 
   d="scan'208";a="55740269"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Dec 2024 14:51:49 -0800
X-CSE-ConnectionGUID: yIvv+lnvTzmWkmMipSO2JQ==
X-CSE-MsgGUID: +mvTUcXjQoW4sfLhnMG8CA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,201,1728975600"; 
   d="scan'208";a="98065407"
Received: from lkp-server02.sh.intel.com (HELO 36a1563c48ff) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 01 Dec 2024 14:51:48 -0800
Received: from kbuild by 36a1563c48ff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tHsn3-0001u7-2N;
	Sun, 01 Dec 2024 22:51:45 +0000
Date: Mon, 2 Dec 2024 06:50:52 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Wenkuan Wang <Wenkuan.Wang@amd.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 1474/1474] arch/x86/events/amd/uncore.c:601:10:
 sparse: sparse: incorrect type in initializer (different address spaces)
Message-ID: <202412020612.qu4Z3kVG-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   df4c334beecb4cf58e4e8d63b491aa5ac0a84f46
commit: e31410969eb2ea5a4eb26d54616a6bba88cc0dbc [1474/1474] perf/x86/amd/uncore: Move discovery and registration
config: x86_64-randconfig-121-20241118 (https://download.01.org/0day-ci/archive/20241202/202412020612.qu4Z3kVG-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241202/202412020612.qu4Z3kVG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412020612.qu4Z3kVG-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> arch/x86/events/amd/uncore.c:601:10: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got union amd_uncore_info * @@
   arch/x86/events/amd/uncore.c:601:10: sparse:     expected void const [noderef] __percpu *__vpp_verify
   arch/x86/events/amd/uncore.c:601:10: sparse:     got union amd_uncore_info *
   arch/x86/events/amd/uncore.c:730:10: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got union amd_uncore_info * @@
   arch/x86/events/amd/uncore.c:730:10: sparse:     expected void const [noderef] __percpu *__vpp_verify
   arch/x86/events/amd/uncore.c:730:10: sparse:     got union amd_uncore_info *
>> arch/x86/events/amd/uncore.c:847:30: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected union amd_uncore_info *[noderef] info @@     got union amd_uncore_info [noderef] __percpu * @@
   arch/x86/events/amd/uncore.c:847:30: sparse:     expected union amd_uncore_info *[noderef] info
   arch/x86/events/amd/uncore.c:847:30: sparse:     got union amd_uncore_info [noderef] __percpu *
>> arch/x86/events/amd/uncore.c:881:43: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void [noderef] __percpu *__pdata @@     got union amd_uncore_info *[noderef] info @@
   arch/x86/events/amd/uncore.c:881:43: sparse:     expected void [noderef] __percpu *__pdata
   arch/x86/events/amd/uncore.c:881:43: sparse:     got union amd_uncore_info *[noderef] info
   arch/x86/events/amd/uncore.c:904:35: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void [noderef] __percpu *__pdata @@     got union amd_uncore_info *[noderef] info @@
   arch/x86/events/amd/uncore.c:904:35: sparse:     expected void [noderef] __percpu *__pdata
   arch/x86/events/amd/uncore.c:904:35: sparse:     got union amd_uncore_info *[noderef] info
   arch/x86/events/amd/uncore.c:358:39: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got union amd_uncore_info * @@
   arch/x86/events/amd/uncore.c:358:39: sparse:     expected void const [noderef] __percpu *__vpp_verify
   arch/x86/events/amd/uncore.c:358:39: sparse:     got union amd_uncore_info *
>> arch/x86/events/amd/uncore.c:358:39: sparse: sparse: dereference of noderef expression
   arch/x86/events/amd/uncore.c:358:39: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got union amd_uncore_info * @@
   arch/x86/events/amd/uncore.c:358:39: sparse:     expected void const [noderef] __percpu *__vpp_verify
   arch/x86/events/amd/uncore.c:358:39: sparse:     got union amd_uncore_info *
>> arch/x86/events/amd/uncore.c:358:39: sparse: sparse: dereference of noderef expression
   arch/x86/events/amd/uncore.c:601:10: sparse: sparse: dereference of noderef expression
   arch/x86/events/amd/uncore.c:365:39: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got union amd_uncore_info * @@
   arch/x86/events/amd/uncore.c:365:39: sparse:     expected void const [noderef] __percpu *__vpp_verify
   arch/x86/events/amd/uncore.c:365:39: sparse:     got union amd_uncore_info *
   arch/x86/events/amd/uncore.c:365:39: sparse: sparse: dereference of noderef expression
   arch/x86/events/amd/uncore.c:730:10: sparse: sparse: dereference of noderef expression
   arch/x86/events/amd/uncore.c:365:39: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got union amd_uncore_info * @@
   arch/x86/events/amd/uncore.c:365:39: sparse:     expected void const [noderef] __percpu *__vpp_verify
   arch/x86/events/amd/uncore.c:365:39: sparse:     got union amd_uncore_info *
   arch/x86/events/amd/uncore.c:365:39: sparse: sparse: dereference of noderef expression
   arch/x86/events/amd/uncore.c:848:22: sparse: sparse: dereference of noderef expression
   arch/x86/events/amd/uncore.c:880:21: sparse: sparse: dereference of noderef expression
   arch/x86/events/amd/uncore.c:881:37: sparse: sparse: dereference of noderef expression
   arch/x86/events/amd/uncore.c:882:25: sparse: sparse: dereference of noderef expression
   arch/x86/events/amd/uncore.c:901:22: sparse: sparse: dereference of noderef expression
   arch/x86/events/amd/uncore.c:904:29: sparse: sparse: dereference of noderef expression
   arch/x86/events/amd/uncore.c:905:17: sparse: sparse: dereference of noderef expression

vim +601 arch/x86/events/amd/uncore.c

   582	
   583	static
   584	void amd_uncore_df_ctx_scan(struct amd_uncore *uncore, unsigned int cpu)
   585	{
   586		union cpuid_0x80000022_ebx ebx;
   587		union amd_uncore_info info;
   588	
   589		if (!boot_cpu_has(X86_FEATURE_PERFCTR_NB))
   590			return;
   591	
   592		info.split.aux_data = 0;
   593		info.split.num_pmcs = NUM_COUNTERS_NB;
   594		info.split.cid = topology_die_id(cpu);
   595	
   596		if (pmu_version >= 2) {
   597			ebx.full = cpuid_ebx(EXT_PERFMON_DEBUG_FEATURES);
   598			info.split.num_pmcs = ebx.split.num_df_pmc;
   599		}
   600	
 > 601		*per_cpu_ptr(uncore->info, cpu) = info;
   602	}
   603	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
