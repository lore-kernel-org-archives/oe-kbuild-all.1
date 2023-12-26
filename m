Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AD2D4E601
	for <oe-kbuild-all@lists.linux.dev>; Tue, 26 Dec 2023 11:47:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="J+Doh7Y/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1703591268; x=1735127268;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=2npEXleSf6xIuf9MZLOeLtZmQXZ6KaBuXDPVXlaQW34=;
  b=J+Doh7Y/XpP7TI1LZ+jAKfhwsYRH1KcTTWTORPXgL7j3EQ0SpuSEH1ez
   wxhLqrZ6CEWu5d5hToUI2L+zh+aOw9/oKjCcSEQOBZOGtjMBWUKHuIF9A
   GNn6kkeSum4qj4gu+KhN0cU/7Nb/slasI2nwamFj7nmUkOBDKlWVgjzyX
   4ExV5YJ6KR3dSAe97wSbqw86RsfCS5A5CYuqTIZIPhAQu3AlIYFc70MSC
   qwi66PKEeLtsrzZnPQJMToE/XOXo7VmReCzAdnV9m2LDEyEX17b0HCtlz
   D4y9Z345JBsOPIjTYUxihZJd+n3Qb58vH1oo0dEOTxITWw4AoZ9QK9Y//
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10934"; a="3627506"
X-IronPort-AV: E=Sophos;i="6.04,306,1695711600"; 
   d="scan'208";a="3627506"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Dec 2023 03:47:47 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,306,1695711600"; 
   d="scan'208";a="26281483"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 26 Dec 2023 03:47:45 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rI5sh-000ERJ-2d;
	Tue, 26 Dec 2023 11:46:32 +0000
Date: Tue, 26 Dec 2023 19:43:59 +0800
From: kernel test robot <lkp@intel.com>
To: Yury Norov <yury.norov@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [norov:group_cpus 9/9] lib/group_cpus.c:264:24: sparse: sparse:
 incorrect type in return expression (different base types)
Message-ID: <202312261908.4MgApmwt-lkp@intel.com>
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
commit: bacb9a1af23372460cafc24678b4cd4fe081f2b6 [9/9] lib/group_cpus: simplify group_cpus_evenly() for more
config: i386-randconfig-061-20231226 (https://download.01.org/0day-ci/archive/20231226/202312261908.4MgApmwt-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231226/202312261908.4MgApmwt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312261908.4MgApmwt-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> lib/group_cpus.c:264:24: sparse: sparse: incorrect type in return expression (different base types) @@     expected int @@     got void * @@
   lib/group_cpus.c:264:24: sparse:     expected int
   lib/group_cpus.c:264:24: sparse:     got void *

vim +264 lib/group_cpus.c

   250	
   251	static int __group_cpus_evenly(unsigned int startgrp, unsigned int numgrps,
   252				       cpumask_var_t *node_to_cpumask,
   253				       const struct cpumask *cpu_mask,
   254				       struct cpumask *masks)
   255	{
   256		unsigned int i, n, nodes, cpus_per_grp, extra_grps, done = 0;
   257		unsigned int last_grp = numgrps;
   258		unsigned int curgrp = startgrp;
   259		nodemask_t nodemsk = NODE_MASK_NONE;
   260		struct node_groups *node_groups;
   261		cpumask_var_t nmsk __free(free_cpumask_var);
   262	
   263		if (!alloc_cpumask_var(&nmsk, GFP_KERNEL))
 > 264			return NULL;
   265	
   266		nodes = get_nodes_in_cpumask(node_to_cpumask, cpu_mask, &nodemsk);
   267	
   268		/*
   269		 * If the number of nodes in the mask is greater than or equal the
   270		 * number of groups we just spread the groups across the nodes.
   271		 */
   272		if (numgrps <= nodes) {
   273			for_each_node_mask(n, nodemsk) {
   274				/* Ensure that only CPUs which are in both masks are set */
   275				cpumask_and(nmsk, cpu_mask, node_to_cpumask[n]);
   276				cpumask_or(&masks[curgrp], &masks[curgrp], nmsk);
   277				if (++curgrp == last_grp)
   278					curgrp = 0;
   279			}
   280			return numgrps;
   281		}
   282	
   283		node_groups = kcalloc(nr_node_ids,
   284				       sizeof(struct node_groups),
   285				       GFP_KERNEL);
   286		if (!node_groups)
   287			return -ENOMEM;
   288	
   289		/* allocate group number for each node */
   290		alloc_nodes_groups(numgrps, node_to_cpumask, cpu_mask,
   291				   nodemsk, nmsk, node_groups);
   292		for (i = 0; i < nr_node_ids; i++) {
   293			unsigned int ncpus, v;
   294			struct node_groups *nv = &node_groups[i];
   295	
   296			if (nv->ngroups == UINT_MAX)
   297				continue;
   298	
   299			/* Get the cpus on this node which are in the mask */
   300			cpumask_and(nmsk, cpu_mask, node_to_cpumask[nv->id]);
   301			ncpus = cpumask_weight(nmsk);
   302			if (!ncpus)
   303				continue;
   304	
   305			WARN_ON_ONCE(nv->ngroups > ncpus);
   306	
   307			/* Account for rounding errors */
   308			extra_grps = ncpus - nv->ngroups * (ncpus / nv->ngroups);
   309	
   310			/* Spread allocated groups on CPUs of the current node */
   311			for (v = 0; v < nv->ngroups; v++, curgrp++) {
   312				cpus_per_grp = ncpus / nv->ngroups;
   313	
   314				/* Account for extra groups to compensate rounding errors */
   315				if (extra_grps) {
   316					cpus_per_grp++;
   317					--extra_grps;
   318				}
   319	
   320				/*
   321				 * wrapping has to be considered given 'startgrp'
   322				 * may start anywhere
   323				 */
   324				if (curgrp >= last_grp)
   325					curgrp = 0;
   326				grp_spread_init_one(&masks[curgrp], nmsk,
   327							cpus_per_grp);
   328			}
   329			done += nv->ngroups;
   330		}
   331		kfree(node_groups);
   332		return done;
   333	}
   334	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
