Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9938613D28A
	for <oe-kbuild-all@lists.linux.dev>; Sun, 29 Sep 2024 21:36:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727645780; cv=none; b=mWbJAVspCifaA+OszO5HPlilu5wsW0olcgnY+jOZfeIR8isB0kM4lZ8rd1xJEw3rXgiqiZZrwBOwJ93VKPxhdh0jUf6/e7PpWxhdt+jYzz0oUImnhsEd/4Nj0e762qZOuKEJufwx8mAhqnA8L1p1tqb4Fa1ZHQrzAO0GfixiTew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727645780; c=relaxed/simple;
	bh=ozUA4/H76ptq06bKSwtcsnwvwuLZYz0FLXEH07cjMik=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=msijrcYoohMP5hZxy1HCtXXLOOJ3qMdBcyk8FQ5GudIf+D20YIIWRq4lFdrN1FuFX2UtV7dFZ0VcqG6icY18KfqnIBu+dqYCNdgcog7K3q7n03Gh0+GBGdJ2Hi/m//78Eh6w55DBHznC70l6CdpdBP27EDZ6pLYYPU1A0V5unRc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=A7exkeyJ; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="A7exkeyJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727645779; x=1759181779;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ozUA4/H76ptq06bKSwtcsnwvwuLZYz0FLXEH07cjMik=;
  b=A7exkeyJ/6MIqT5sbwYuX5ScaVq5+EkUvo6vmHtLKi5P3rRo5HHgkZ2w
   ephNBWiBk/QCV+vZB7RUuxANQ0358G8RF4NFO/AmelkPosqEaNuqNsXKa
   RBYJJGuzcvpGqsngSclzBKCMUTbgXAEKjKJpmlE7UjauyQmFUkdavNv5F
   CVRxVrj68bsK7425WWddu5v6iHGPvGdmODaKunefi1bNjAfVLnHc3gVzm
   VdI2E8PPU/gYU4e6rJe1ha2JTTfWYW0eDZPlLqnVmn4udWkjna+If6coJ
   GhE2V2POrDp1s0fyBbzeUxqeQjheZSYLcN8yTuFt/qBVqLz13NFpDppQi
   g==;
X-CSE-ConnectionGUID: Gn15nWYLTKOooqs4Ovl/+w==
X-CSE-MsgGUID: NPwSrhw7RcKBhE7UiV2oeQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11210"; a="30424170"
X-IronPort-AV: E=Sophos;i="6.11,164,1725346800"; 
   d="scan'208";a="30424170"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Sep 2024 14:36:16 -0700
X-CSE-ConnectionGUID: 6QIizM9BQJKnTddGRnrCIQ==
X-CSE-MsgGUID: 9NIBfaLmSamVDJz2rsNkDQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,164,1725346800"; 
   d="scan'208";a="73888314"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 29 Sep 2024 14:36:15 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sv1aO-000Ojk-1X;
	Sun, 29 Sep 2024 21:36:12 +0000
Date: Mon, 30 Sep 2024 05:35:31 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, yanhaitao <yanhaitao2@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 2387/14244] kernel/sched/psi.c:387:1: error:
 function definition is not allowed here
Message-ID: <202409300544.lmhFdnFK-lkp@intel.com>
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
head:   91ff8f4b711382909faa289c49735e0514af6f76
commit: 654944510822988390470cbc5b6f914c19dd9b88 [2387/14244] sched/psi: add cpu fine grained stall tracking in pressure.stat
config: arm64-randconfig-001-20240930 (https://download.01.org/0day-ci/archive/20240930/202409300544.lmhFdnFK-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 7773243d9916f98ba0ffce0c3a960e4aa9f03e81)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240930/202409300544.lmhFdnFK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409300544.lmhFdnFK-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from kernel/sched/build_utility.c:24:
   In file included from include/linux/cpuset.h:17:
   In file included from include/linux/mm.h:2181:
   include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
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
   1 warning and 20 errors generated.


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
