Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F2EC19DF4B
	for <oe-kbuild-all@lists.linux.dev>; Mon,  9 Dec 2024 22:23:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733783000; cv=none; b=IMGH7hM3b3/KiyvM2lMWLOAU0ycNvgDzaCP4IypFP1YEEu4W2tRjqW2jS1C2BSqagHhsfwREfKenczZeyGaRVN4hKLF8ebZ43TMHLivMHEFz9qqEpcFY/FI2R3RoULS86ee8aDKa/E3Z/E1d23oHiXrPwKEt2zfuh0o00R8PoJs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733783000; c=relaxed/simple;
	bh=EdVwJPInQK0/WUA+trlh3vX/+2NdJVMDbPyUS7hmQ/I=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ue+cL5fNEo1MqKfiovePpjPwhYNhJenu4TwRldg+FeNyrJbk/H3dLwfZf9TwjKh5NA5oDyOHmWXD5KhgDv1rbHZK6LgfYmh+9kni5ZcnS1izTj5NArY6GgYD1CtUBhEEI5WajAr0OFkCo9GVAAixjTKE3+N9iIgZ9uIcCrfsUn0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Nc0oNWFi; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Nc0oNWFi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733782998; x=1765318998;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=EdVwJPInQK0/WUA+trlh3vX/+2NdJVMDbPyUS7hmQ/I=;
  b=Nc0oNWFiB9Ad13fFsCwEqmtfB4//AF1SeC6iQscQbqYG/HIdv37fmNIc
   mmLKfYd6o0XzoCj9WlBz1MuJ1MhZnOP4NlK7KVnOYOJuazGxqIDXjQe4t
   djLR3OyKrEfEGpRREapBIi75LAuKNN4NWUI/PIwNucT1Skt344x4jIUtL
   pSrTPdnehZpRAobE0yrkJDBA7fi7fzRGOUw1p3/IGuvlBqrf1KB17DnDd
   BJ3CEP7ii3Cs4UPZ67JaKPoXWX6TdDmHwSicTGMCqwR+nY0eytxXE5a+n
   7YrWe0P6X2GeUG4tmoJ2mLCLkJ+0Q9AH5TaD6Xj4WkitbOLVGylqG0XJA
   Q==;
X-CSE-ConnectionGUID: 1+6GVqziRD6SGhVG2TU5dg==
X-CSE-MsgGUID: 287d7/P7SByibOWe7N+0lQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11281"; a="34247948"
X-IronPort-AV: E=Sophos;i="6.12,220,1728975600"; 
   d="scan'208";a="34247948"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Dec 2024 14:23:16 -0800
X-CSE-ConnectionGUID: 9wn5iW5LRFOO9+UuTRUiGg==
X-CSE-MsgGUID: T3tzb+ZaQ0WNYhQHdasOwA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,220,1728975600"; 
   d="scan'208";a="95044560"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 09 Dec 2024 14:23:15 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tKm9o-0004rc-2e;
	Mon, 09 Dec 2024 22:23:12 +0000
Date: Tue, 10 Dec 2024 06:22:58 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, yanhaitao <yanhaitao2@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 1613/1613] kernel/sched/psi.c:387:1: error:
 function definition is not allowed here
Message-ID: <202412100613.fwDO1CD0-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Lu,

First bad commit (maybe != root cause):

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   db988390007bce595dba0dfd782c610578e26d2d
commit: 654944510822988390470cbc5b6f914c19dd9b88 [1613/1613] sched/psi: add cpu fine grained stall tracking in pressure.stat
config: arm64-randconfig-001-20241210 (https://download.01.org/0day-ci/archive/20241210/202412100613.fwDO1CD0-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 592c0fe55f6d9a811028b5f3507be91458ab2713)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241210/202412100613.fwDO1CD0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412100613.fwDO1CD0-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from kernel/sched/build_utility.c:24:
   In file included from include/linux/cpuset.h:17:
   In file included from include/linux/mm.h:2181:
   include/linux/vmstat.h:508:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     508 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     509 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:515:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     515 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     516 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:527:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     527 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     528 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:536:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     536 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     537 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   In file included from kernel/sched/build_utility.c:97:
>> kernel/sched/psi.c:387:1: error: function definition is not allowed here
     387 | {
         | ^
   kernel/sched/psi.c:421:1: error: function definition is not allowed here
     421 | {
         | ^
   kernel/sched/psi.c:449:1: error: function definition is not allowed here
     449 | {
         | ^
   kernel/sched/psi.c:471:1: error: function definition is not allowed here
     471 | {
         | ^
   kernel/sched/psi.c:517:17: error: function definition is not allowed here
     517 |                                         bool next) {}
         |                                                    ^
   kernel/sched/psi.c:523:1: error: function definition is not allowed here
     523 | {
         | ^
   kernel/sched/psi.c:590:1: error: function definition is not allowed here
     590 | {
         | ^
   kernel/sched/psi.c:608:1: error: function definition is not allowed here
     608 | {
         | ^
   kernel/sched/psi.c:635:1: error: function definition is not allowed here
     635 | {
         | ^
   kernel/sched/psi.c:707:1: error: function definition is not allowed here
     707 | {
         | ^
   kernel/sched/psi.c:772:1: error: function definition is not allowed here
     772 | {
         | ^
   kernel/sched/psi.c:808:1: error: function definition is not allowed here
     808 | {
         | ^
   kernel/sched/psi.c:822:1: error: function definition is not allowed here
     822 | {
         | ^
   kernel/sched/psi.c:848:1: error: function definition is not allowed here
     848 | {
         | ^
   kernel/sched/psi.c:932:1: error: function definition is not allowed here
     932 | {
         | ^
   kernel/sched/psi.c:950:1: error: function definition is not allowed here
     950 | {
         | ^
   kernel/sched/psi.c:958:1: error: function definition is not allowed here
     958 | {
         | ^
   kernel/sched/psi.c:993:1: error: function definition is not allowed here
     993 | {
         | ^
   kernel/sched/psi.c:1107:1: error: function definition is not allowed here
    1107 | {
         | ^
   fatal error: too many errors emitted, stopping now [-ferror-limit=]
   5 warnings and 20 errors generated.


vim +387 kernel/sched/psi.c

a65983d90bfb5e Lu Jialin 2024-01-04  383  
a65983d90bfb5e Lu Jialin 2024-01-04  384  static bool test_fine_grained_stat(unsigned int *stat_tasks,
a65983d90bfb5e Lu Jialin 2024-01-04  385  				   unsigned int nr_running,
a65983d90bfb5e Lu Jialin 2024-01-04  386  				   enum psi_stat_states state)
a65983d90bfb5e Lu Jialin 2024-01-04 @387  {
a65983d90bfb5e Lu Jialin 2024-01-04  388  	switch (state) {
a65983d90bfb5e Lu Jialin 2024-01-04  389  	case PSI_MEMCG_RECLAIM_SOME:
a65983d90bfb5e Lu Jialin 2024-01-04  390  		return unlikely(stat_tasks[NR_MEMCG_RECLAIM]);
a65983d90bfb5e Lu Jialin 2024-01-04  391  	case PSI_MEMCG_RECLAIM_FULL:
a65983d90bfb5e Lu Jialin 2024-01-04  392  		return unlikely(stat_tasks[NR_MEMCG_RECLAIM] &&
a65983d90bfb5e Lu Jialin 2024-01-04  393  		       nr_running == stat_tasks[NR_MEMCG_RECLAIM_RUNNING]);
25d00f6853c3c6 Lu Jialin 2024-01-04  394  	case PSI_GLOBAL_RECLAIM_SOME:
25d00f6853c3c6 Lu Jialin 2024-01-04  395  		return unlikely(stat_tasks[NR_GLOBAL_RECLAIM]);
25d00f6853c3c6 Lu Jialin 2024-01-04  396  	case PSI_GLOBAL_RECLAIM_FULL:
25d00f6853c3c6 Lu Jialin 2024-01-04  397  		return unlikely(stat_tasks[NR_GLOBAL_RECLAIM] &&
25d00f6853c3c6 Lu Jialin 2024-01-04  398  		       nr_running == stat_tasks[NR_GLOBAL_RECLAIM_RUNNING]);
25d00f6853c3c6 Lu Jialin 2024-01-04  399  	case PSI_COMPACT_SOME:
25d00f6853c3c6 Lu Jialin 2024-01-04  400  		return unlikely(stat_tasks[NR_COMPACT]);
25d00f6853c3c6 Lu Jialin 2024-01-04  401  	case PSI_COMPACT_FULL:
25d00f6853c3c6 Lu Jialin 2024-01-04  402  		return unlikely(stat_tasks[NR_COMPACT] &&
25d00f6853c3c6 Lu Jialin 2024-01-04  403  		       nr_running == stat_tasks[NR_COMPACT_RUNNING]);
25d00f6853c3c6 Lu Jialin 2024-01-04  404  	case PSI_ASYNC_MEMCG_RECLAIM_SOME:
25d00f6853c3c6 Lu Jialin 2024-01-04  405  		return unlikely(stat_tasks[NR_ASYNC_MEMCG_RECLAIM]);
25d00f6853c3c6 Lu Jialin 2024-01-04  406  	case PSI_ASYNC_MEMCG_RECLAIM_FULL:
25d00f6853c3c6 Lu Jialin 2024-01-04  407  		return unlikely(stat_tasks[NR_ASYNC_MEMCG_RECLAIM] &&
25d00f6853c3c6 Lu Jialin 2024-01-04  408  		      nr_running == stat_tasks[NR_ASYNC_MEMCG_RECLAIM_RUNNING]);
25d00f6853c3c6 Lu Jialin 2024-01-04  409  	case PSI_SWAP_SOME:
25d00f6853c3c6 Lu Jialin 2024-01-04  410  		return unlikely(stat_tasks[NR_SWAP]);
25d00f6853c3c6 Lu Jialin 2024-01-04  411  	case PSI_SWAP_FULL:
25d00f6853c3c6 Lu Jialin 2024-01-04  412  		return unlikely(stat_tasks[NR_SWAP] &&
25d00f6853c3c6 Lu Jialin 2024-01-04  413  		       nr_running == stat_tasks[NR_SWAP_RUNNING]);
a65983d90bfb5e Lu Jialin 2024-01-04  414  	default:
a65983d90bfb5e Lu Jialin 2024-01-04  415  		return false;
a65983d90bfb5e Lu Jialin 2024-01-04  416  	}
a65983d90bfb5e Lu Jialin 2024-01-04  417  }
a65983d90bfb5e Lu Jialin 2024-01-04  418  

:::::: The code at line 387 was first introduced by commit
:::::: a65983d90bfb5e031444fea492b32f931c83ffcf sched/psi: Introduce fine grained stall time collect for cgroup reclaim

:::::: TO: Lu Jialin <lujialin4@huawei.com>
:::::: CC: yanhaitao <yanhaitao2@huawei.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
