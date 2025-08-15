Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B422226D14
	for <oe-kbuild-all@lists.linux.dev>; Fri, 15 Aug 2025 21:31:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755293501; cv=none; b=Ukbtg8Mr9/vLpYQcjIRpbouAKLYRWU+YwHIgCPhYxPcwGylUf3iyXw5dov7fLHO+RTbkqIihiej8cz/ZX+NLVBLDTBNSv8V2Uh8fynHdcyV7UldwSlfwftrDL64FjRfuaVrOupzlSCd7/0FWLfGKHiHMmYmKTOFvFkbw8Jaggzk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755293501; c=relaxed/simple;
	bh=kApWrnAPS+iFug8mQr6dZKlH6WIbbZJdbakFeCqhRZM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=GITIV1PU8KCcpBrIvQw4TboDmoIpaWk8JExWpazcqoAAD4OSaId51MNrZRsUg6pwxHVFpXt8ah4FtLlN2e+g9wqAYy/G7ae6YP7WQyyNC75V3OyeLnvR/rhPgarCXG6DrPqpcDUXZuCgc31tROmvU4y2mtV5nej92ca6mDf+6yg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TG9P0YJ7; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TG9P0YJ7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755293500; x=1786829500;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=kApWrnAPS+iFug8mQr6dZKlH6WIbbZJdbakFeCqhRZM=;
  b=TG9P0YJ7+iVx9AhMkXbIZp+7RGoAqoX65tROd97xCZ+uMM6+5VqoTvsV
   j7J9X+liqDFqG0aFGqhaFwJzGniSoP0gSlFK5mO2iQlMdIcDarVyDs2HP
   Xvul3ToVINSvJuAMBh9PzvntewYLcdw+4xu5YixpWVwxqC01rxzgxRrx9
   NRgKYYyA9U/Y/cm42L4dSHhuqFAf/RZ+h2YMl5wWfRY5hec6P6tioMgzJ
   tA7FIQlVM7OQzTRQBjH24+HTEejgXT0Hy504N/BdQtBMFRTqkOqsZ5xDs
   9meM8ny3neweWPG8Yjk0zn3BhV94pBpxdVAcIB5/G4p648VrEOWvLNIKR
   A==;
X-CSE-ConnectionGUID: /mkAO0eDSMO4VZ/+MtZEBQ==
X-CSE-MsgGUID: gY8hgLn3QHauyyCFMrwfBg==
X-IronPort-AV: E=McAfee;i="6800,10657,11523"; a="83044432"
X-IronPort-AV: E=Sophos;i="6.17,293,1747724400"; 
   d="scan'208";a="83044432"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Aug 2025 14:31:36 -0700
X-CSE-ConnectionGUID: ascyzutlT9GVOcZ4S0gVPg==
X-CSE-MsgGUID: ix804Vj9TZCqkBqVQ6MSzg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,293,1747724400"; 
   d="scan'208";a="172314619"
Received: from igk-lkp-server01.igk.intel.com (HELO ca260db0ef79) ([10.91.175.65])
  by fmviesa004.fm.intel.com with ESMTP; 15 Aug 2025 14:31:34 -0700
Received: from kbuild by ca260db0ef79 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1un21M-0000Zz-1w;
	Fri, 15 Aug 2025 21:31:32 +0000
Date: Fri, 15 Aug 2025 23:31:00 +0200
From: kernel test robot <lkp@intel.com>
To: Yury Norov <yury.norov@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [norov:new 5/6] lib/group_cpus.c:151:26: warning: variable 'ncpus'
 is uninitialized when used here
Message-ID: <202508152342.WJ2bc3wG-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/norov/linux new
head:   4fc7e1084415908a0081790114aa1ad051a3d0ad
commit: 0abf2932250e37f9522170b6458f134869f76039 [5/6] group_cpus: don't call cpumask_weight() prematurely
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20250815/202508152342.WJ2bc3wG-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250815/202508152342.WJ2bc3wG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508152342.WJ2bc3wG-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> lib/group_cpus.c:151:26: warning: variable 'ncpus' is uninitialized when used here [-Wuninitialized]
     151 |                 node_groups[n].ncpus = ncpus;
         |                                        ^~~~~
   lib/group_cpus.c:145:17: note: initialize the variable 'ncpus' to silence this warning
     145 |                 unsigned ncpus;
         |                               ^
         |                                = 0
   1 warning generated.


vim +/ncpus +151 lib/group_cpus.c

f7b3ea8cf72f3d Ming Lei   2022-12-27  116  
f7b3ea8cf72f3d Ming Lei   2022-12-27  117  /*
f7b3ea8cf72f3d Ming Lei   2022-12-27  118   * Allocate group number for each node, so that for each node:
f7b3ea8cf72f3d Ming Lei   2022-12-27  119   *
f7b3ea8cf72f3d Ming Lei   2022-12-27  120   * 1) the allocated number is >= 1
f7b3ea8cf72f3d Ming Lei   2022-12-27  121   *
f7b3ea8cf72f3d Ming Lei   2022-12-27  122   * 2) the allocated number is <= active CPU number of this node
f7b3ea8cf72f3d Ming Lei   2022-12-27  123   *
f7b3ea8cf72f3d Ming Lei   2022-12-27  124   * The actual allocated total groups may be less than @numgrps when
f7b3ea8cf72f3d Ming Lei   2022-12-27  125   * active total CPU number is less than @numgrps.
f7b3ea8cf72f3d Ming Lei   2022-12-27  126   *
f7b3ea8cf72f3d Ming Lei   2022-12-27  127   * Active CPUs means the CPUs in '@cpu_mask AND @node_to_cpumask[]'
f7b3ea8cf72f3d Ming Lei   2022-12-27  128   * for each node.
f7b3ea8cf72f3d Ming Lei   2022-12-27  129   */
f7b3ea8cf72f3d Ming Lei   2022-12-27  130  static void alloc_nodes_groups(unsigned int numgrps,
f7b3ea8cf72f3d Ming Lei   2022-12-27  131  			       cpumask_var_t *node_to_cpumask,
f7b3ea8cf72f3d Ming Lei   2022-12-27  132  			       const struct cpumask *cpu_mask,
f7b3ea8cf72f3d Ming Lei   2022-12-27  133  			       const nodemask_t nodemsk,
f7b3ea8cf72f3d Ming Lei   2022-12-27  134  			       struct cpumask *nmsk,
f7b3ea8cf72f3d Ming Lei   2022-12-27  135  			       struct node_groups *node_groups)
f7b3ea8cf72f3d Ming Lei   2022-12-27  136  {
f7b3ea8cf72f3d Ming Lei   2022-12-27  137  	unsigned n, remaining_ncpus = 0;
f7b3ea8cf72f3d Ming Lei   2022-12-27  138  
f7b3ea8cf72f3d Ming Lei   2022-12-27  139  	for (n = 0; n < nr_node_ids; n++) {
f7b3ea8cf72f3d Ming Lei   2022-12-27  140  		node_groups[n].id = n;
f7b3ea8cf72f3d Ming Lei   2022-12-27  141  		node_groups[n].ncpus = UINT_MAX;
f7b3ea8cf72f3d Ming Lei   2022-12-27  142  	}
f7b3ea8cf72f3d Ming Lei   2022-12-27  143  
f7b3ea8cf72f3d Ming Lei   2022-12-27  144  	for_each_node_mask(n, nodemsk) {
f7b3ea8cf72f3d Ming Lei   2022-12-27  145  		unsigned ncpus;
f7b3ea8cf72f3d Ming Lei   2022-12-27  146  
0abf2932250e37 Yury Norov 2025-08-14  147  		if (!cpumask_and(nmsk, cpu_mask, node_to_cpumask[n]))
f7b3ea8cf72f3d Ming Lei   2022-12-27  148  			continue;
0abf2932250e37 Yury Norov 2025-08-14  149  
0abf2932250e37 Yury Norov 2025-08-14  150  		remaining_ncpus += cpumask_weight(nmsk);
f7b3ea8cf72f3d Ming Lei   2022-12-27 @151  		node_groups[n].ncpus = ncpus;
f7b3ea8cf72f3d Ming Lei   2022-12-27  152  	}
f7b3ea8cf72f3d Ming Lei   2022-12-27  153  
f7b3ea8cf72f3d Ming Lei   2022-12-27  154  	numgrps = min_t(unsigned, remaining_ncpus, numgrps);
f7b3ea8cf72f3d Ming Lei   2022-12-27  155  
f7b3ea8cf72f3d Ming Lei   2022-12-27  156  	sort(node_groups, nr_node_ids, sizeof(node_groups[0]),
f7b3ea8cf72f3d Ming Lei   2022-12-27  157  	     ncpus_cmp_func, NULL);
f7b3ea8cf72f3d Ming Lei   2022-12-27  158  
f7b3ea8cf72f3d Ming Lei   2022-12-27  159  	/*
f7b3ea8cf72f3d Ming Lei   2022-12-27  160  	 * Allocate groups for each node according to the ratio of this
f7b3ea8cf72f3d Ming Lei   2022-12-27  161  	 * node's nr_cpus to remaining un-assigned ncpus. 'numgrps' is
f7b3ea8cf72f3d Ming Lei   2022-12-27  162  	 * bigger than number of active numa nodes. Always start the
f7b3ea8cf72f3d Ming Lei   2022-12-27  163  	 * allocation from the node with minimized nr_cpus.
f7b3ea8cf72f3d Ming Lei   2022-12-27  164  	 *
f7b3ea8cf72f3d Ming Lei   2022-12-27  165  	 * This way guarantees that each active node gets allocated at
f7b3ea8cf72f3d Ming Lei   2022-12-27  166  	 * least one group, and the theory is simple: over-allocation
f7b3ea8cf72f3d Ming Lei   2022-12-27  167  	 * is only done when this node is assigned by one group, so
f7b3ea8cf72f3d Ming Lei   2022-12-27  168  	 * other nodes will be allocated >= 1 groups, since 'numgrps' is
f7b3ea8cf72f3d Ming Lei   2022-12-27  169  	 * bigger than number of numa nodes.
f7b3ea8cf72f3d Ming Lei   2022-12-27  170  	 *
f7b3ea8cf72f3d Ming Lei   2022-12-27  171  	 * One perfect invariant is that number of allocated groups for
f7b3ea8cf72f3d Ming Lei   2022-12-27  172  	 * each node is <= CPU count of this node:
f7b3ea8cf72f3d Ming Lei   2022-12-27  173  	 *
f7b3ea8cf72f3d Ming Lei   2022-12-27  174  	 * 1) suppose there are two nodes: A and B
f7b3ea8cf72f3d Ming Lei   2022-12-27  175  	 * 	ncpu(X) is CPU count of node X
f7b3ea8cf72f3d Ming Lei   2022-12-27  176  	 * 	grps(X) is the group count allocated to node X via this
f7b3ea8cf72f3d Ming Lei   2022-12-27  177  	 * 	algorithm
f7b3ea8cf72f3d Ming Lei   2022-12-27  178  	 *
f7b3ea8cf72f3d Ming Lei   2022-12-27  179  	 * 	ncpu(A) <= ncpu(B)
f7b3ea8cf72f3d Ming Lei   2022-12-27  180  	 * 	ncpu(A) + ncpu(B) = N
f7b3ea8cf72f3d Ming Lei   2022-12-27  181  	 * 	grps(A) + grps(B) = G
f7b3ea8cf72f3d Ming Lei   2022-12-27  182  	 *
f7b3ea8cf72f3d Ming Lei   2022-12-27  183  	 * 	grps(A) = max(1, round_down(G * ncpu(A) / N))
f7b3ea8cf72f3d Ming Lei   2022-12-27  184  	 * 	grps(B) = G - grps(A)
f7b3ea8cf72f3d Ming Lei   2022-12-27  185  	 *
f7b3ea8cf72f3d Ming Lei   2022-12-27  186  	 * 	both N and G are integer, and 2 <= G <= N, suppose
f7b3ea8cf72f3d Ming Lei   2022-12-27  187  	 * 	G = N - delta, and 0 <= delta <= N - 2
f7b3ea8cf72f3d Ming Lei   2022-12-27  188  	 *
f7b3ea8cf72f3d Ming Lei   2022-12-27  189  	 * 2) obviously grps(A) <= ncpu(A) because:
f7b3ea8cf72f3d Ming Lei   2022-12-27  190  	 *
f7b3ea8cf72f3d Ming Lei   2022-12-27  191  	 * 	if grps(A) is 1, then grps(A) <= ncpu(A) given
f7b3ea8cf72f3d Ming Lei   2022-12-27  192  	 * 	ncpu(A) >= 1
f7b3ea8cf72f3d Ming Lei   2022-12-27  193  	 *
f7b3ea8cf72f3d Ming Lei   2022-12-27  194  	 * 	otherwise,
f7b3ea8cf72f3d Ming Lei   2022-12-27  195  	 * 		grps(A) <= G * ncpu(A) / N <= ncpu(A), given G <= N
f7b3ea8cf72f3d Ming Lei   2022-12-27  196  	 *
f7b3ea8cf72f3d Ming Lei   2022-12-27  197  	 * 3) prove how grps(B) <= ncpu(B):
f7b3ea8cf72f3d Ming Lei   2022-12-27  198  	 *
f7b3ea8cf72f3d Ming Lei   2022-12-27  199  	 * 	if round_down(G * ncpu(A) / N) == 0, vecs(B) won't be
f7b3ea8cf72f3d Ming Lei   2022-12-27  200  	 * 	over-allocated, so grps(B) <= ncpu(B),
f7b3ea8cf72f3d Ming Lei   2022-12-27  201  	 *
f7b3ea8cf72f3d Ming Lei   2022-12-27  202  	 * 	otherwise:
f7b3ea8cf72f3d Ming Lei   2022-12-27  203  	 *
f7b3ea8cf72f3d Ming Lei   2022-12-27  204  	 * 	grps(A) =
f7b3ea8cf72f3d Ming Lei   2022-12-27  205  	 * 		round_down(G * ncpu(A) / N) =
f7b3ea8cf72f3d Ming Lei   2022-12-27  206  	 * 		round_down((N - delta) * ncpu(A) / N) =
f7b3ea8cf72f3d Ming Lei   2022-12-27  207  	 * 		round_down((N * ncpu(A) - delta * ncpu(A)) / N)	 >=
f7b3ea8cf72f3d Ming Lei   2022-12-27  208  	 * 		round_down((N * ncpu(A) - delta * N) / N)	 =
f7b3ea8cf72f3d Ming Lei   2022-12-27  209  	 * 		cpu(A) - delta
f7b3ea8cf72f3d Ming Lei   2022-12-27  210  	 *
f7b3ea8cf72f3d Ming Lei   2022-12-27  211  	 * 	then:
f7b3ea8cf72f3d Ming Lei   2022-12-27  212  	 *
f7b3ea8cf72f3d Ming Lei   2022-12-27  213  	 * 	grps(A) - G >= ncpu(A) - delta - G
f7b3ea8cf72f3d Ming Lei   2022-12-27  214  	 * 	=>
f7b3ea8cf72f3d Ming Lei   2022-12-27  215  	 * 	G - grps(A) <= G + delta - ncpu(A)
f7b3ea8cf72f3d Ming Lei   2022-12-27  216  	 * 	=>
f7b3ea8cf72f3d Ming Lei   2022-12-27  217  	 * 	grps(B) <= N - ncpu(A)
f7b3ea8cf72f3d Ming Lei   2022-12-27  218  	 * 	=>
f7b3ea8cf72f3d Ming Lei   2022-12-27  219  	 * 	grps(B) <= cpu(B)
f7b3ea8cf72f3d Ming Lei   2022-12-27  220  	 *
f7b3ea8cf72f3d Ming Lei   2022-12-27  221  	 * For nodes >= 3, it can be thought as one node and another big
f7b3ea8cf72f3d Ming Lei   2022-12-27  222  	 * node given that is exactly what this algorithm is implemented,
f7b3ea8cf72f3d Ming Lei   2022-12-27  223  	 * and we always re-calculate 'remaining_ncpus' & 'numgrps', and
f7b3ea8cf72f3d Ming Lei   2022-12-27  224  	 * finally for each node X: grps(X) <= ncpu(X).
f7b3ea8cf72f3d Ming Lei   2022-12-27  225  	 *
f7b3ea8cf72f3d Ming Lei   2022-12-27  226  	 */
f7b3ea8cf72f3d Ming Lei   2022-12-27  227  	for (n = 0; n < nr_node_ids; n++) {
f7b3ea8cf72f3d Ming Lei   2022-12-27  228  		unsigned ngroups, ncpus;
f7b3ea8cf72f3d Ming Lei   2022-12-27  229  
f7b3ea8cf72f3d Ming Lei   2022-12-27  230  		if (node_groups[n].ncpus == UINT_MAX)
f7b3ea8cf72f3d Ming Lei   2022-12-27  231  			continue;
f7b3ea8cf72f3d Ming Lei   2022-12-27  232  
f7b3ea8cf72f3d Ming Lei   2022-12-27  233  		WARN_ON_ONCE(numgrps == 0);
f7b3ea8cf72f3d Ming Lei   2022-12-27  234  
f7b3ea8cf72f3d Ming Lei   2022-12-27  235  		ncpus = node_groups[n].ncpus;
f7b3ea8cf72f3d Ming Lei   2022-12-27  236  		ngroups = max_t(unsigned, 1,
f7b3ea8cf72f3d Ming Lei   2022-12-27  237  				 numgrps * ncpus / remaining_ncpus);
f7b3ea8cf72f3d Ming Lei   2022-12-27  238  		WARN_ON_ONCE(ngroups > ncpus);
f7b3ea8cf72f3d Ming Lei   2022-12-27  239  
f7b3ea8cf72f3d Ming Lei   2022-12-27  240  		node_groups[n].ngroups = ngroups;
f7b3ea8cf72f3d Ming Lei   2022-12-27  241  
f7b3ea8cf72f3d Ming Lei   2022-12-27  242  		remaining_ncpus -= ncpus;
f7b3ea8cf72f3d Ming Lei   2022-12-27  243  		numgrps -= ngroups;
f7b3ea8cf72f3d Ming Lei   2022-12-27  244  	}
f7b3ea8cf72f3d Ming Lei   2022-12-27  245  }
f7b3ea8cf72f3d Ming Lei   2022-12-27  246  

:::::: The code at line 151 was first introduced by commit
:::::: f7b3ea8cf72f3d6060fe08e461805181e7450a13 genirq/affinity: Move group_cpus_evenly() into lib/

:::::: TO: Ming Lei <ming.lei@redhat.com>
:::::: CC: Thomas Gleixner <tglx@linutronix.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
