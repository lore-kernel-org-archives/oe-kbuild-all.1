Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 569F4137E
	for <oe-kbuild-all@lists.linux.dev>; Sat, 14 Dec 2024 03:20:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734146427; cv=none; b=WNzanA93/hyt+W8m7dS/iyAGd6XARzynT7s5RaRbSb0nTyXInGD1JIOZ9bv300hYy3vrmmVwbCRTdmkePrEPz3S0NujPik1ToJoPdMwMqPIrSgvWxutXBcnYjX9X7Sx7iEXVzwP+LiSvpzDl3uUi4Zt+VCdzw8lp+LG7JSx8AFY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734146427; c=relaxed/simple;
	bh=W+7PWEwn/wR56QbmvlyxcJqA44Z4GW3EXELyuU/rMY4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=UfcDX+GJqzOsaHcABl9EALpLLqzVw/gyBl6mQZ4HSCtneNc2PIKmbsXUygOCtZox0OduAyU35zVpdFOtRLkH1zmDY5BtvkQG8u9O0SlkXJZ2UOJkbSP4gG1DyrxLD0wzR74FpjJsUyo5GMArdePn0tMLh+pbLZGugHhBm1sGtg8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YWiPfWq9; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YWiPfWq9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734146425; x=1765682425;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=W+7PWEwn/wR56QbmvlyxcJqA44Z4GW3EXELyuU/rMY4=;
  b=YWiPfWq9JstGeKz/iQtw5XkUiiqOJy723IGCs08jE8fd9TqKyqrUhwPi
   VMeelXlhl/6TbuFVofVlXFv1AbpZ3DXHSnUqyiiMYvuHMBcgmFiDeauJu
   uFO/0jqpfzW3j2DLA1hU192A4Q9fJbP6B9rQI79e+mNY+0gOQXp5kqTve
   akufqBVf2tBhp781M+QkvK/5tULo0zjEzNBiOwdUepc791PDlKZrNo4kM
   w3AKuyg0yz2h4a1ptmxl9zk9niicpmNtv9uZn/P9oVh0Vd4Z0KbV00quA
   /k2kjeaGb9o1l5QcVhfHayPRO7ZNKnQJUTp/TD6A2/p08I2IOds+ZPKgZ
   A==;
X-CSE-ConnectionGUID: NV8FhLiKRw+CIKul3XEmag==
X-CSE-MsgGUID: AG/W5nyuRkaOU0rxEneAzg==
X-IronPort-AV: E=McAfee;i="6700,10204,11285"; a="34753519"
X-IronPort-AV: E=Sophos;i="6.12,233,1728975600"; 
   d="scan'208";a="34753519"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Dec 2024 19:20:24 -0800
X-CSE-ConnectionGUID: ULCtfOhnQbGfzqBM9SDseQ==
X-CSE-MsgGUID: 0zdo9zNuTL2oTBnfOHfhQQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,233,1728975600"; 
   d="scan'208";a="101724736"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 13 Dec 2024 19:20:24 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tMIhZ-000Cfn-1N;
	Sat, 14 Dec 2024 03:20:21 +0000
Date: Sat, 14 Dec 2024 11:19:46 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Yipeng Zou <zouyipeng@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 2579/2579] kernel/sched/core.c:8146:29: error:
 'root_task_group' undeclared; did you mean 'task_group'?
Message-ID: <202412141149.8BSY27XL-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   6c3413fbf8c430b89f5d23f465e10e99ea145199
commit: 00d37128abe2687fac974c5d21aa67fac6518c7c [2579/2579] sched: Introduce smart grid scheduling strategy for cfs
config: arm64-randconfig-004-20241213 (https://download.01.org/0day-ci/archive/20241214/202412141149.8BSY27XL-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241214/202412141149.8BSY27XL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412141149.8BSY27XL-lkp@intel.com/

All errors (new ones prefixed by >>):

   kernel/sched/core.c:2746:6: warning: no previous prototype for 'sched_set_stop_task' [-Wmissing-prototypes]
    2746 | void sched_set_stop_task(int cpu, struct task_struct *stop)
         |      ^~~~~~~~~~~~~~~~~~~
   kernel/sched/core.c: In function 'sched_cpu_activate':
   kernel/sched/core.c:8012:9: error: implicit declaration of function 'tg_update_affinity_domains'; did you mean 'irq_update_affinity_desc'? [-Werror=implicit-function-declaration]
    8012 |         tg_update_affinity_domains(cpu, 1);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~
         |         irq_update_affinity_desc
   kernel/sched/core.c: In function 'sched_init_smp':
   kernel/sched/core.c:8146:9: error: implicit declaration of function 'init_auto_affinity'; did you mean 'irq_set_affinity'? [-Werror=implicit-function-declaration]
    8146 |         init_auto_affinity(&root_task_group);
         |         ^~~~~~~~~~~~~~~~~~
         |         irq_set_affinity
>> kernel/sched/core.c:8146:29: error: 'root_task_group' undeclared (first use in this function); did you mean 'task_group'?
    8146 |         init_auto_affinity(&root_task_group);
         |                             ^~~~~~~~~~~~~~~
         |                             task_group
   kernel/sched/core.c:8146:29: note: each undeclared identifier is reported only once for each function it appears in
   cc1: some warnings being treated as errors

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for PGP_KEY_PARSER
   Depends on [n]: CRYPTO [=y] && ASYMMETRIC_KEY_TYPE [=y] && ASYMMETRIC_PUBLIC_KEY_SUBTYPE [=n]
   Selected by [y]:
   - PGP_PRELOAD [=y] && CRYPTO [=y] && ASYMMETRIC_KEY_TYPE [=y]


vim +8146 kernel/sched/core.c

  8121	
  8122	void __init sched_init_smp(void)
  8123	{
  8124		sched_init_numa();
  8125		set_sched_cluster();
  8126	
  8127		/*
  8128		 * There's no userspace yet to cause hotplug operations; hence all the
  8129		 * CPU masks are stable and all blatant races in the below code cannot
  8130		 * happen.
  8131		 */
  8132		mutex_lock(&sched_domains_mutex);
  8133		sched_init_domains(cpu_active_mask);
  8134		mutex_unlock(&sched_domains_mutex);
  8135	
  8136		/* Move init over to a non-isolated CPU */
  8137		if (set_cpus_allowed_ptr(current, housekeeping_cpumask(HK_FLAG_DOMAIN)) < 0)
  8138			BUG();
  8139		sched_init_granularity();
  8140	
  8141		init_sched_rt_class();
  8142		init_sched_dl_class();
  8143	
  8144		sched_smp_initialized = true;
  8145	
> 8146		init_auto_affinity(&root_task_group);
  8147	}
  8148	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
