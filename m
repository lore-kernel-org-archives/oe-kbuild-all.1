Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04F4C25777
	for <oe-kbuild-all@lists.linux.dev>; Wed, 20 Nov 2024 01:11:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732065096; cv=none; b=ZKRTaSU9ZYN2NuMMmvXgheZle/B4hN6v0BeYJXs6cogwSZtmXFi6iLpgJOD5AUe9urG3n7YGIJM/GADjuD9yLTnwGzIcKGvC2pMEyZA/HxdVXMKPzZxGfhAEbNe/NBrXs34MYXOostp1EagvoYjE4qyPf5pIYamsonSPQcchg+A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732065096; c=relaxed/simple;
	bh=4zAdikaK76QPk/bu+JInRCPrjR0jRPM/2wZk/CZ1Dc8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=TkD9bw2Qa8Llr1sqM7CuI14wEq3WZpo0RiPAXlnUHuQk580g7yA4ogcmDfW535sgFt5E3nIQfRIEKGKFK9dXO3RnWQapvZxmHrKpVuJ5pGV6aBlv5huu2ZInCM2V+uMZrTw6/1uerz6fgRApNYxi1vJrBmYGBg9a+dVMH0tz6RI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JmxaFNp9; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JmxaFNp9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732065093; x=1763601093;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=4zAdikaK76QPk/bu+JInRCPrjR0jRPM/2wZk/CZ1Dc8=;
  b=JmxaFNp9GYy9NRDqRoo3MSnJc9omp/+nFH0owi0aWz1cZ4Ar2CWKDl5a
   HEmCtjvIS3ZQ16wKW9I5qGtkCB6A3JsfoXf6lA5RItEZASVe5goCzbrgd
   aMI+X8k2jCseE/9dzUe9FFzBnfC30SMxbjgfIL07JsPMrAuqR/phJ0aUZ
   WU0OgmlxgI2fmMuSKVZdntKDujo9wV/71PJbu+CQbtCFXqhX3+E5wHJa6
   LSiv9EQiv33RdOFMGlpZNTHX9h/cpHqz7hjb+dyIPoMundAVUTheI4fV9
   MdLi5ny50Hn6IVtt5fiickRB5nUiDeuqvLkaIW9Itx1lwuyLEsfS1mTme
   A==;
X-CSE-ConnectionGUID: 6TwC/+iWR/O5q5S/xWR/2g==
X-CSE-MsgGUID: y5VlPWk9QICgs+49uVrR7A==
X-IronPort-AV: E=McAfee;i="6700,10204,11261"; a="31851277"
X-IronPort-AV: E=Sophos;i="6.12,168,1728975600"; 
   d="scan'208";a="31851277"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2024 17:11:29 -0800
X-CSE-ConnectionGUID: VwFHQzAHTYunMgQJkJRxUw==
X-CSE-MsgGUID: 0rylmfjoR+iiL19EGueBBQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,168,1728975600"; 
   d="scan'208";a="90572460"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 19 Nov 2024 17:11:28 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tDZFd-0000Nr-1M;
	Wed, 20 Nov 2024 01:11:25 +0000
Date: Wed, 20 Nov 2024 09:11:12 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Wenkuan Wang <Wenkuan.Wang@amd.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 1474/1474] arch/x86/events/amd/uncore.c:601:10:
 sparse: sparse: incorrect type in initializer (different address spaces)
Message-ID: <202411191801.IpPPqnTz-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   cd76a7555127aa134a2a1113685da60b70553e6f
commit: e31410969eb2ea5a4eb26d54616a6bba88cc0dbc [1474/1474] perf/x86/amd/uncore: Move discovery and registration
config: x86_64-randconfig-121-20241118 (https://download.01.org/0day-ci/archive/20241119/202411191801.IpPPqnTz-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241119/202411191801.IpPPqnTz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411191801.IpPPqnTz-lkp@intel.com/

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
