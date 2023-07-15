Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A53F78BFB
	for <oe-kbuild-all@lists.linux.dev>; Sat, 15 Jul 2023 20:06:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689451573; x=1720987573;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=m5jULdyhqsjFnJ85SA6y8jEXDhm8xj7qScu3FwoYkJA=;
  b=Dyez3+LjMpoFV4V+uyde7g7RZUY4w127y2juknfvTXGu/bjdIxXRAyC5
   JM8cnEiKdVxYhHYG4CpwWDUTxiO8Zo8/mCAFfegBA7dxu4SQoFRKAFsFX
   YeU3UGhD1jsI8qjpSt/plJr8ZYO2miSRVUqv6AH7nQfiU842pEAxAejBx
   CQ4bm+o7ZP4avBv33Ag2/dv0CNyv9gv2LR0w3tb/U2q+f88iixpEJp7q3
   X09l6uKuPCmfYc8YhteriDpvv9otUmdgsYP2eG0vmy8cUZMuaFNIcF41Q
   rHOKwcNPEh1EOahY5MaU21eBkr7SUzRnCiXzgzXKLCxU+R3/z61qtGYOv
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10772"; a="368338592"
X-IronPort-AV: E=Sophos;i="6.01,208,1684825200"; 
   d="scan'208";a="368338592"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jul 2023 13:06:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10772"; a="836409910"
X-IronPort-AV: E=Sophos;i="6.01,208,1684825200"; 
   d="scan'208";a="836409910"
Received: from lkp-server01.sh.intel.com (HELO c544d7fc5005) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 15 Jul 2023 13:06:06 -0700
Received: from kbuild by c544d7fc5005 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qKlWn-0008LZ-0E;
	Sat, 15 Jul 2023 20:06:05 +0000
Date: Sun, 16 Jul 2023 04:05:58 +0800
From: kernel test robot <lkp@intel.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Juri Lelli <juri.lelli@redhat.com>,
	Valentin Schneider <valentin.schneider@arm.com>,
	Connor O'Brien <connoro@google.com>,
	John Stultz <jstultz@google.com>
Subject: [arm-de:tip/sched/core_20232906_proxy_exec_v4 11/12]
 kernel/sched/fair.c:922:36: sparse: sparse: incorrect type in initializer
 (different address spaces)
Message-ID: <202307160400.fe4AkGBt-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.gitlab.arm.com/linux-arm/linux-de.git tip/sched/core_20232906_proxy_exec_v4
head:   6a8f4ce70148c468ef287fc38700ed2217f94c43
commit: 77312af3338107c40b838680697cfb854bcf7326 [11/12] sched: Add proxy execution
config: nios2-randconfig-r072-20230716 (https://download.01.org/0day-ci/archive/20230716/202307160400.fe4AkGBt-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230716/202307160400.fe4AkGBt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307160400.fe4AkGBt-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> kernel/sched/fair.c:922:36: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *curr @@     got struct task_struct [noderef] __rcu *curr_sched @@
   kernel/sched/fair.c:922:36: sparse:     expected struct task_struct *curr
   kernel/sched/fair.c:922:36: sparse:     got struct task_struct [noderef] __rcu *curr_sched
   kernel/sched/fair.c:967:32: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct sched_entity const *se @@     got struct sched_entity [noderef] __rcu * @@
   kernel/sched/fair.c:967:32: sparse:     expected struct sched_entity const *se
   kernel/sched/fair.c:967:32: sparse:     got struct sched_entity [noderef] __rcu *
   kernel/sched/fair.c:6248:36: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *curr @@     got struct task_struct [noderef] __rcu *curr_sched @@
   kernel/sched/fair.c:6248:36: sparse:     expected struct task_struct *curr
   kernel/sched/fair.c:6248:36: sparse:     got struct task_struct [noderef] __rcu *curr_sched
   kernel/sched/fair.c:7885:36: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *curr @@     got struct task_struct [noderef] __rcu *curr_sched @@
   kernel/sched/fair.c:7885:36: sparse:     expected struct task_struct *curr
   kernel/sched/fair.c:7885:36: sparse:     got struct task_struct [noderef] __rcu *curr_sched
   kernel/sched/fair.c:7919:37: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *tsk @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/fair.c:7919:37: sparse:     expected struct task_struct *tsk
   kernel/sched/fair.c:7919:37: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/fair.c:8185:38: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *curr @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/fair.c:8185:38: sparse:     expected struct task_struct *curr
   kernel/sched/fair.c:8185:38: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/fair.c:6177:35: sparse: sparse: marked inline, but without a definition
   kernel/sched/fair.c: note: in included file:
   kernel/sched/sched.h:2116:32: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2116:32: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2116:32: sparse:    struct task_struct *
   kernel/sched/sched.h:2293:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2293:9: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2293:9: sparse:    struct task_struct *
   kernel/sched/sched.h:2295:18: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2295:18: sparse:    struct task_struct *
   kernel/sched/sched.h:2295:18: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2116:32: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2116:32: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2116:32: sparse:    struct task_struct *
   kernel/sched/sched.h:2116:32: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2116:32: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2116:32: sparse:    struct task_struct *
--
   kernel/sched/build_policy.c: note: in included file:
   kernel/sched/rt.c:961:70: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/rt.c:961:70: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/rt.c:961:70: sparse:    struct task_struct *
>> kernel/sched/rt.c:1047:36: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *curr @@     got struct task_struct [noderef] __rcu *curr_sched @@
   kernel/sched/rt.c:1047:36: sparse:     expected struct task_struct *curr
   kernel/sched/rt.c:1047:36: sparse:     got struct task_struct [noderef] __rcu *curr_sched
   kernel/sched/rt.c:1586:31: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/rt.c:1586:31: sparse:     expected struct task_struct *p
   kernel/sched/rt.c:1586:31: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/rt.c:1711:36: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *curr @@     got struct task_struct [noderef] __rcu *curr_sched @@
   kernel/sched/rt.c:1711:36: sparse:     expected struct task_struct *curr
   kernel/sched/rt.c:1711:36: sparse:     got struct task_struct [noderef] __rcu *curr_sched
   kernel/sched/build_policy.c: note: in included file:
   kernel/sched/deadline.c:1941:40: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct sched_dl_entity const *b @@     got struct sched_dl_entity [noderef] __rcu * @@
   kernel/sched/deadline.c:1941:40: sparse:     expected struct sched_dl_entity const *b
   kernel/sched/deadline.c:1941:40: sparse:     got struct sched_dl_entity [noderef] __rcu *
>> kernel/sched/deadline.c:1175:21: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *curr_sched @@
   kernel/sched/deadline.c:1175:21: sparse:     expected struct task_struct *p
   kernel/sched/deadline.c:1175:21: sparse:     got struct task_struct [noderef] __rcu *curr_sched
>> kernel/sched/deadline.c:1302:36: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *curr @@     got struct task_struct [noderef] __rcu *curr_sched @@
   kernel/sched/deadline.c:1302:36: sparse:     expected struct task_struct *curr
   kernel/sched/deadline.c:1302:36: sparse:     got struct task_struct [noderef] __rcu *curr_sched
   kernel/sched/deadline.c:2633:29: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/deadline.c:2633:29: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/deadline.c:2633:29: sparse:    struct task_struct *
   kernel/sched/build_policy.c: note: in included file:
   kernel/sched/sched.h:2105:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2105:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2105:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2105:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2105:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2105:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2116:32: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2116:32: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2116:32: sparse:    struct task_struct *
   kernel/sched/sched.h:2105:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2105:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2105:25: sparse:    struct task_struct *

vim +922 kernel/sched/fair.c

0b0b470c4a2142 Peter Zijlstra 2023-06-01  916  
0b0b470c4a2142 Peter Zijlstra 2023-06-01  917  /*
0b0b470c4a2142 Peter Zijlstra 2023-06-01  918   * Used by other classes to account runtime.
0b0b470c4a2142 Peter Zijlstra 2023-06-01  919   */
0b0b470c4a2142 Peter Zijlstra 2023-06-01  920  s64 update_curr_common(struct rq *rq)
0b0b470c4a2142 Peter Zijlstra 2023-06-01  921  {
bc1277464259d6 Peter Zijlstra 2023-06-01 @922  	struct task_struct *curr = rq_selected(rq);
0b0b470c4a2142 Peter Zijlstra 2023-06-01  923  	s64 delta_exec;
9dbdb155532395 Peter Zijlstra 2013-11-18  924  
0b0b470c4a2142 Peter Zijlstra 2023-06-01  925  	delta_exec = update_curr_se(rq, &curr->se);
0b0b470c4a2142 Peter Zijlstra 2023-06-01  926  	if (unlikely(delta_exec <= 0))
0b0b470c4a2142 Peter Zijlstra 2023-06-01  927  		return delta_exec;
0b0b470c4a2142 Peter Zijlstra 2023-06-01  928  
0b0b470c4a2142 Peter Zijlstra 2023-06-01  929  	account_group_exec_runtime(curr, delta_exec);
0b0b470c4a2142 Peter Zijlstra 2023-06-01  930  	cgroup_account_cputime(curr, delta_exec);
0b0b470c4a2142 Peter Zijlstra 2023-06-01  931  
0b0b470c4a2142 Peter Zijlstra 2023-06-01  932  	return delta_exec;
0b0b470c4a2142 Peter Zijlstra 2023-06-01  933  }
0b0b470c4a2142 Peter Zijlstra 2023-06-01  934  

:::::: The code at line 922 was first introduced by commit
:::::: bc1277464259d65e5044dcd2c2d988170e70e12a sched: Split scheduler execution context

:::::: TO: Peter Zijlstra <peterz@infradead.org>
:::::: CC: Dietmar Eggemann <dietmar.eggemann@arm.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
