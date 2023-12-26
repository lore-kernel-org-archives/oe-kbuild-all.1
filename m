Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 055464F885
	for <oe-kbuild-all@lists.linux.dev>; Tue, 26 Dec 2023 17:24:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZR0btl47"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1703611443; x=1735147443;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Xf2L/LS/3qiJ9UEOdsZc5in0ncFj6fkzXcwKaerRFVE=;
  b=ZR0btl47qV1bzA+X8iyQvbfY43nPh3HZsGxelkmFrOGwSBI3cfSQ6M6c
   33pH1yRYwd2JVsM30my538Q8DBIG5pwutqLT3FKwnt+L7KD2NKtPqbjlo
   LXW+pnbarc4beVKwmK7D/qx08atllZFT32scICijqK6jaMkAr4SGKs1d5
   JIxs1dXLnEQMTHSGHbmhiqYwNvTbOeZH5YrsJb/FJt1CGzZ36JjpBEnfx
   p0cTBOCo+/kX6+OpIRc7EwHYlJdfuX8DaKRYD0DmP/trTDgcVStrZnmBn
   OXjJDSO+mwlIWp6t5gUmghv/Hz/hAV7+nyWYU0hxes5B8P/dVjZYXB7CC
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10935"; a="3652346"
X-IronPort-AV: E=Sophos;i="6.04,306,1695711600"; 
   d="scan'208";a="3652346"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Dec 2023 09:24:01 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10935"; a="868636139"
X-IronPort-AV: E=Sophos;i="6.04,306,1695711600"; 
   d="scan'208";a="868636139"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by FMSMGA003.fm.intel.com with ESMTP; 26 Dec 2023 09:24:00 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rIB9p-000EgP-34;
	Tue, 26 Dec 2023 17:23:57 +0000
Date: Wed, 27 Dec 2023 01:23:53 +0800
From: kernel test robot <lkp@intel.com>
To: Yury Norov <yury.norov@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [norov:group_cpus 8/9] lib/group_cpus.c:381:35: warning: variable
 'curgrp' is uninitialized when used here
Message-ID: <202312270156.3XVLAEAN-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/norov/linux group_cpus
head:   bacb9a1af23372460cafc24678b4cd4fe081f2b6
commit: 48a8d131e7a9825040099e7eaf3b09f1368b93f6 [8/9] lib/group_cpus: rework group_cpus_evenly()
config: arm-defconfig (https://download.01.org/0day-ci/archive/20231227/202312270156.3XVLAEAN-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project.git f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231227/202312270156.3XVLAEAN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312270156.3XVLAEAN-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> lib/group_cpus.c:381:35: warning: variable 'curgrp' is uninitialized when used here [-Wuninitialized]
           nr_present = __group_cpus_evenly(curgrp, numgrps, node_to_cpumask, npresmsk, nmsk, masks);
                                            ^~~~~~
   lib/group_cpus.c:348:21: note: initialize the variable 'curgrp' to silence this warning
           unsigned int curgrp, nr_present, nr_others;
                              ^
                               = 0
   1 warning generated.


vim +/curgrp +381 lib/group_cpus.c

   330	
   331	/**
   332	 * group_cpus_evenly - Group all CPUs evenly per NUMA/CPU locality
   333	 * @numgrps: number of groups
   334	 *
   335	 * Return: cpumask array if successful, NULL otherwise. And each element
   336	 * includes CPUs assigned to this group
   337	 *
   338	 * Try to put close CPUs from viewpoint of CPU and NUMA locality into
   339	 * same group, and run two-stage grouping:
   340	 *	1) allocate present CPUs on these groups evenly first
   341	 *	2) allocate other possible CPUs on these groups evenly
   342	 *
   343	 * We guarantee in the resulted grouping that all CPUs are covered, and
   344	 * no same CPU is assigned to multiple groups
   345	 */
   346	struct cpumask *group_cpus_evenly(unsigned int numgrps)
   347	{
   348		unsigned int curgrp, nr_present, nr_others;
   349		cpumask_var_t *node_to_cpumask;
   350		cpumask_var_t nmsk __free(free_cpumask_var);
   351		cpumask_var_t npresmsk __free(free_cpumask_var);
   352		struct cpumask *masks __free(kfree)= kcalloc(numgrps, sizeof(*masks), GFP_KERNEL);
   353	
   354		if (!masks)
   355			return NULL;
   356	
   357		if (!alloc_cpumask_var(&nmsk, GFP_KERNEL) || !alloc_cpumask_var(&npresmsk, GFP_KERNEL))
   358			return NULL;
   359	
   360		node_to_cpumask = alloc_node_to_cpumask();
   361		if (!node_to_cpumask)
   362			return NULL;
   363	
   364		build_node_to_cpumask(node_to_cpumask);
   365	
   366		/*
   367		 * Make a local cache of 'cpu_present_mask', so the two stages
   368		 * spread can observe consistent 'cpu_present_mask' without holding
   369		 * cpu hotplug lock, then we can reduce deadlock risk with cpu
   370		 * hotplug code.
   371		 *
   372		 * Here CPU hotplug may happen when reading `cpu_present_mask`, and
   373		 * we can live with the case because it only affects that hotplug
   374		 * CPU is handled in the 1st or 2nd stage, and either way is correct
   375		 * from API user viewpoint since 2-stage spread is sort of
   376		 * optimization.
   377		 */
   378		cpumask_copy(npresmsk, data_race(cpu_present_mask));
   379	
   380		/* grouping present CPUs first */
 > 381		nr_present = __group_cpus_evenly(curgrp, numgrps, node_to_cpumask, npresmsk, nmsk, masks);

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
