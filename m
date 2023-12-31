Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7F82EB8
	for <oe-kbuild-all@lists.linux.dev>; Sun, 31 Dec 2023 03:15:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WrA5hgiI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1703992536; x=1735528536;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=MzZsasFjpczTEtjFO9CKWx6vPCKBuEbpkEI9x5/BTEE=;
  b=WrA5hgiIjDWflHVJOzULTFir+VNLaUVAmUoV0romM5Cdlx87lvpbe+BI
   i4eopMO7vMT4HwiXm3Je4xxP99Rr/N6tXBDpkmys2xhxXHKfXm2qcEkQ0
   Rni6vdli83YHI/DXmdZNC7nT66uTxsX/g80yheREKv0J5/pUcYqfvx3wP
   XaFFen3eouhc7KNjd6Yp7i/rN5JkGygLLC7q+mNHTmKmz+z2m9zf8nkSe
   pm9oJYcLzPOrL5U6JaAugZluRMbRKZeD48Z66NUKhS3MRUIpyDcaMwmHf
   DvSoeQ6BaKBXaRnGUuktsbMnrAg42OQ/kTXkLTNgpK+7N4ipbFzTZOXa7
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10939"; a="3508740"
X-IronPort-AV: E=Sophos;i="6.04,319,1695711600"; 
   d="scan'208";a="3508740"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Dec 2023 17:34:30 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10939"; a="1026203430"
X-IronPort-AV: E=Sophos;i="6.04,319,1695711600"; 
   d="scan'208";a="1026203430"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga006.fm.intel.com with ESMTP; 30 Dec 2023 17:34:29 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rJkih-000ItM-11;
	Sun, 31 Dec 2023 01:34:27 +0000
Date: Sun, 31 Dec 2023 09:34:17 +0800
From: kernel test robot <lkp@intel.com>
To: Yury Norov <yury.norov@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [norov:group_cpus 8/9] lib/group_cpus.c:378 group_cpus_evenly()
 warn: unsigned 'nr_present' is never less than zero.
Message-ID: <202312310941.FXBRzn8C-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/norov/linux group_cpus
head:   1117349d164c1dec91f4ace657c7964c587cee24
commit: 4c2e6aa6ff56057cd68a80f19e9d06ef4ce51d46 [8/9] lib/group_cpus: rework group_cpus_evenly()
config: x86_64-randconfig-161-20231231 (https://download.01.org/0day-ci/archive/20231231/202312310941.FXBRzn8C-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312310941.FXBRzn8C-lkp@intel.com/

smatch warnings:
lib/group_cpus.c:378 group_cpus_evenly() warn: unsigned 'nr_present' is never less than zero.
lib/group_cpus.c:395 group_cpus_evenly() warn: unsigned 'nr_others' is never less than zero.

vim +/nr_present +378 lib/group_cpus.c

   332	
   333	/**
   334	 * group_cpus_evenly - Group all CPUs evenly per NUMA/CPU locality
   335	 * @numgrps: number of groups
   336	 *
   337	 * Return: cpumask array if successful, NULL otherwise. And each element
   338	 * includes CPUs assigned to this group
   339	 *
   340	 * Try to put close CPUs from viewpoint of CPU and NUMA locality into
   341	 * same group, and run two-stage grouping:
   342	 *	1) allocate present CPUs on these groups evenly first
   343	 *	2) allocate other possible CPUs on these groups evenly
   344	 *
   345	 * We guarantee in the resulted grouping that all CPUs are covered, and
   346	 * no same CPU is assigned to multiple groups
   347	 */
   348	struct cpumask *group_cpus_evenly(unsigned int numgrps)
   349	{
   350		cpumask_var_t *node_to_cpumask __free(free_node_to_cpumask) = alloc_node_to_cpumask();
   351		struct cpumask *masks __free(kfree) = kcalloc(numgrps, sizeof(*masks), GFP_KERNEL);
   352		cpumask_var_t npresmsk __free(free_cpumask_var);
   353		cpumask_var_t nmsk __free(free_cpumask_var);
   354		unsigned int curgrp, nr_present, nr_others;
   355	
   356		if (!masks || !node_to_cpumask || !alloc_cpumask_var(&nmsk, GFP_KERNEL)
   357				|| !alloc_cpumask_var(&npresmsk, GFP_KERNEL))
   358			return NULL;
   359	
   360		build_node_to_cpumask(node_to_cpumask);
   361	
   362		/*
   363		 * Make a local cache of 'cpu_present_mask', so the two stages
   364		 * spread can observe consistent 'cpu_present_mask' without holding
   365		 * cpu hotplug lock, then we can reduce deadlock risk with cpu
   366		 * hotplug code.
   367		 *
   368		 * Here CPU hotplug may happen when reading `cpu_present_mask`, and
   369		 * we can live with the case because it only affects that hotplug
   370		 * CPU is handled in the 1st or 2nd stage, and either way is correct
   371		 * from API user viewpoint since 2-stage spread is sort of
   372		 * optimization.
   373		 */
   374		cpumask_copy(npresmsk, data_race(cpu_present_mask));
   375	
   376		/* grouping present CPUs first */
   377		nr_present = __group_cpus_evenly(0, numgrps, node_to_cpumask, npresmsk, nmsk, masks);
 > 378		if (nr_present < 0)
   379			return NULL;
   380	
   381		/* If npresmsk is empty */
   382		if (!cpumask_andnot(npresmsk, cpu_possible_mask, npresmsk))
   383			return_ptr(masks);
   384	
   385		curgrp = nr_present < numgrps ? nr_present : 0;
   386	
   387		/*
   388		 * Allocate non present CPUs starting from the next group to be
   389		 * handled. If the grouping of present CPUs already exhausted the
   390		 * group space, assign the non present CPUs to the already
   391		 * allocated out groups.
   392		 */
   393		nr_others = __group_cpus_evenly(curgrp, numgrps, node_to_cpumask,
   394						npresmsk, nmsk, masks);
 > 395		if (nr_others < 0)
   396			return NULL;
   397	
   398		WARN_ON(nr_present + nr_others < numgrps);
   399		return_ptr(masks);
   400	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
