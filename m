Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E3611FAC30
	for <oe-kbuild-all@lists.linux.dev>; Tue, 17 Dec 2024 23:43:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734478997; cv=none; b=HXci/D3FH1HFiGR4EHJDZHZA5h/KOGLfUw9LTkRqVfhG6fpW7j2eAItxV6GwKmXr0aJZbwHBTqfc/E/O/yvKFWUEea2ae7S8vzvCbZ24gEwGw9OVpQCAxsEwn2oJQccBUd96RrULxTvTGKgyOQJTmHdGiglbYx3w/MP+QirzDQA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734478997; c=relaxed/simple;
	bh=iiSoQ6RHtk4SfNY13U/1Q3JeaH6vwa1gP8W709HR0E8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=alKKgCakCK3FRaTEVUEj7XhM+sWk5AlsEs41P0mjC2r3Zgq/07NYteWu8feJCLUpsiA0evbpWOtAqKoMZRHne3YrYvtQVpBa6Y9Z2G+rJKC10WIvoqaJTujdmux8TsWYK/DgW4q205FaIdQldj8io2aFlXMxJposAb+vZRivrE8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nx0GqlQ+; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nx0GqlQ+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734478995; x=1766014995;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=iiSoQ6RHtk4SfNY13U/1Q3JeaH6vwa1gP8W709HR0E8=;
  b=nx0GqlQ+4uwKUUEZ73tzdMGJwC7IFD7RIZ3RumaDNVl8J85EDsb5x0o6
   ie2pClOr4ijhYsv6mJOJcN7ZwD09yAvKL86VJQ77fCZWCCNbVqpTKmXiH
   /R4ZVJVyEOWCewudMpgww68X6PVkOQCJwxDQOISXpYhQteuokvNJtt6RQ
   vRch5qhfN8L+2/yO16aHYJtpfFQ2JDYN6t9ixRP0emSS09kfQ7DqX6rvq
   kAatTBDX/HErSTfqUbiIqiHZqEupUcmgzdUTBuHQ4y36xsxDnuN2jrKgJ
   Dhcwub5iZc/7lQcE7TsBeR4NHcin9ompdKXVl+zJsBDYH4gMj0e4UD0C0
   A==;
X-CSE-ConnectionGUID: beBuKw6hSc2mAuSYDLRpcQ==
X-CSE-MsgGUID: kxC2juLDQ/CbYa2PJ9iNbA==
X-IronPort-AV: E=McAfee;i="6700,10204,11289"; a="35080804"
X-IronPort-AV: E=Sophos;i="6.12,243,1728975600"; 
   d="scan'208";a="35080804"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Dec 2024 15:43:14 -0800
X-CSE-ConnectionGUID: iKDfK+N2SbeEwqBUSlsDvA==
X-CSE-MsgGUID: Eja90CArSvyzSPlVj8X6Pg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="102761236"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 17 Dec 2024 15:43:12 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tNhDZ-000Fti-27;
	Tue, 17 Dec 2024 23:43:09 +0000
Date: Wed, 18 Dec 2024 07:42:13 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Xianglai Li <lixianglai@loongson.cn>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 1613/1613] kernel/sched/topology.c:2368:32:
 sparse: sparse: incorrect type in initializer (different base types)
Message-ID: <202412180753.EAU66qxV-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Xianglai,

First bad commit (maybe != root cause):

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   46064348cc445799cf9e8fd030323a0426fbb5e4
commit: 351aa968603500987e891b20cc97a677602ae7c2 [1613/1613] loongarch/kernel: Fix loongarch compilation error
config: loongarch-randconfig-r111-20241210 (https://download.01.org/0day-ci/archive/20241218/202412180753.EAU66qxV-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 14.2.0
reproduce: (https://download.01.org/0day-ci/archive/20241218/202412180753.EAU66qxV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412180753.EAU66qxV-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   kernel/sched/build_utility.c: note: in included file:
   kernel/sched/debug.c:468:17: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] sd @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/debug.c:468:17: sparse:     expected struct sched_domain *[assigned] sd
   kernel/sched/debug.c:468:17: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/debug.c:792:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *tsk @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/debug.c:792:9: sparse:     expected struct task_struct *tsk
   kernel/sched/debug.c:792:9: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/debug.c:792:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *tsk @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/debug.c:792:9: sparse:     expected struct task_struct *tsk
   kernel/sched/debug.c:792:9: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/build_utility.c: note: in included file:
   kernel/sched/stop_task.c:73:38: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *curr @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/stop_task.c:73:38: sparse:     expected struct task_struct *curr
   kernel/sched/stop_task.c:73:38: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/build_utility.c: note: in included file:
>> kernel/sched/topology.c:2368:32: sparse: sparse: incorrect type in initializer (different base types) @@     expected int flags @@     got restricted gfp_t @@
   kernel/sched/topology.c:2368:32: sparse:     expected int flags
   kernel/sched/topology.c:2368:32: sparse:     got restricted gfp_t
>> kernel/sched/topology.c:2376:61: sparse: sparse: incorrect type in argument 3 (different base types) @@     expected restricted gfp_t [usertype] flags @@     got int flags @@
   kernel/sched/topology.c:2376:61: sparse:     expected restricted gfp_t [usertype] flags
   kernel/sched/topology.c:2376:61: sparse:     got int flags
   kernel/sched/topology.c:2404:58: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] sd @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/topology.c:2404:58: sparse:     expected struct sched_domain *[assigned] sd
   kernel/sched/topology.c:2404:58: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/topology.c:123:56: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct sched_domain *sd @@     got struct sched_domain [noderef] __rcu *child @@
   kernel/sched/topology.c:123:56: sparse:     expected struct sched_domain *sd
   kernel/sched/topology.c:123:56: sparse:     got struct sched_domain [noderef] __rcu *child
   kernel/sched/topology.c:142:60: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct sched_domain *sd @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/topology.c:142:60: sparse:     expected struct sched_domain *sd
   kernel/sched/topology.c:142:60: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/topology.c:165:20: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *sd @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/topology.c:165:20: sparse:     expected struct sched_domain *sd
   kernel/sched/topology.c:165:20: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/topology.c:499:19: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct perf_domain *pd @@     got struct perf_domain [noderef] __rcu *pd @@
   kernel/sched/topology.c:499:19: sparse:     expected struct perf_domain *pd
   kernel/sched/topology.c:499:19: sparse:     got struct perf_domain [noderef] __rcu *pd
   kernel/sched/topology.c:663:49: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct sched_domain *parent @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/topology.c:663:49: sparse:     expected struct sched_domain *parent
   kernel/sched/topology.c:663:49: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/topology.c:718:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/topology.c:718:9: sparse:    struct sparsemask [noderef] __rcu *
   kernel/sched/topology.c:718:9: sparse:    struct sparsemask *
   kernel/sched/topology.c:758:50: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct sched_domain *parent @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/topology.c:766:55: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain [noderef] __rcu *[noderef] __rcu child @@     got struct sched_domain *[assigned] tmp @@
   kernel/sched/topology.c:779:29: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] tmp @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/topology.c:784:20: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *sd @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/topology.c:805:13: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] tmp @@     got struct sched_domain [noderef] __rcu *sd @@
   kernel/sched/topology.c:967:70: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct sched_domain *sd @@     got struct sched_domain [noderef] __rcu *child @@
   kernel/sched/topology.c:996:59: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct sched_domain *sd @@     got struct sched_domain [noderef] __rcu *child @@
   kernel/sched/topology.c:1042:57: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct sched_domain *sd @@     got struct sched_domain [noderef] __rcu *child @@
   kernel/sched/topology.c:1044:25: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *sibling @@     got struct sched_domain [noderef] __rcu *child @@
   kernel/sched/topology.c:1052:55: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct sched_domain *sd @@     got struct sched_domain [noderef] __rcu *child @@
   kernel/sched/topology.c:1054:25: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *sibling @@     got struct sched_domain [noderef] __rcu *child @@
   kernel/sched/topology.c:1124:62: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct sched_domain *sd @@     got struct sched_domain [noderef] __rcu *child @@
   kernel/sched/topology.c:1228:40: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct sched_domain *child @@     got struct sched_domain [noderef] __rcu *child @@
   kernel/sched/topology.c:1649:43: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct sched_domain [noderef] __rcu *child @@     got struct sched_domain *child @@
   kernel/sched/topology.c:2445:31: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain [noderef] __rcu *parent @@     got struct sched_domain *sd @@
   kernel/sched/topology.c:2549:57: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] sd @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/topology.c:2570:56: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct sched_domain *child @@     got struct sched_domain [noderef] __rcu *child @@
   kernel/sched/topology.c:2569:57: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] sd @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/topology.c:2624:57: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] sd @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/build_utility.c: note: in included file:
   kernel/sched/membarrier.c:206:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got int [noderef] __percpu * @@
   kernel/sched/membarrier.c:206:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got int [noderef] __percpu * @@
   kernel/sched/membarrier.c:206:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got int [noderef] __percpu * @@
   kernel/sched/membarrier.c:206:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got int [noderef] __percpu * @@
   kernel/sched/membarrier.c:230:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got int [noderef] __percpu * @@
   kernel/sched/membarrier.c:230:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got int [noderef] __percpu * @@
   kernel/sched/membarrier.c:230:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got int [noderef] __percpu * @@
   kernel/sched/membarrier.c:230:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got int [noderef] __percpu * @@
   kernel/sched/membarrier.c:433:17: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got int [noderef] __percpu * @@
   kernel/sched/membarrier.c:433:17: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got int [noderef] __percpu * @@
   kernel/sched/membarrier.c:433:17: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got int [noderef] __percpu * @@
   kernel/sched/membarrier.c:433:17: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got int [noderef] __percpu * @@
   kernel/sched/build_utility.c: note: in included file:
   kernel/sched/build_utility.c: note: in included file (through include/linux/mmzone.h, arch/loongarch/include/asm/pgtable.h, arch/loongarch/include/asm/uaccess.h, ...):
   include/linux/page-flags.h:245:46: sparse: sparse: self-comparison always evaluates to false
   kernel/sched/build_utility.c: note: in included file:
   kernel/sched/sched.h:2288:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2288:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2288:25: sparse:    struct task_struct *

vim +2368 kernel/sched/topology.c

f2cb13609d5397 Ingo Molnar   2017-02-01  2361  
e858b9ce14397a Cheng Jian    2024-01-02  2362  #ifdef CONFIG_SCHED_STEAL
476141f6c8e689 Steve Sistare 2024-01-02  2363  static int sd_llc_alloc(struct sched_domain *sd)
476141f6c8e689 Steve Sistare 2024-01-02  2364  {
0ccb3f810722de Steve Sistare 2024-01-02  2365  	struct sched_domain_shared *sds = sd->shared;
0ccb3f810722de Steve Sistare 2024-01-02  2366  	struct cpumask *span = sched_domain_span(sd);
0ccb3f810722de Steve Sistare 2024-01-02  2367  	int nid = cpu_to_node(cpumask_first(span));
0ccb3f810722de Steve Sistare 2024-01-02 @2368  	int flags = __GFP_ZERO | GFP_KERNEL;
0ccb3f810722de Steve Sistare 2024-01-02  2369  	struct sparsemask *mask;
0ccb3f810722de Steve Sistare 2024-01-02  2370  
0ccb3f810722de Steve Sistare 2024-01-02  2371  	/*
0ccb3f810722de Steve Sistare 2024-01-02  2372  	 * Allocate the bitmap if not already allocated.  This is called for
0ccb3f810722de Steve Sistare 2024-01-02  2373  	 * every CPU in the LLC but only allocates once per sd_llc_shared.
0ccb3f810722de Steve Sistare 2024-01-02  2374  	 */
0ccb3f810722de Steve Sistare 2024-01-02  2375  	if (!sds->cfs_overload_cpus) {
0ccb3f810722de Steve Sistare 2024-01-02 @2376  		mask = sparsemask_alloc_node(nr_cpu_ids, 3, flags, nid);
0ccb3f810722de Steve Sistare 2024-01-02  2377  		if (!mask)
0ccb3f810722de Steve Sistare 2024-01-02  2378  			return 1;
0ccb3f810722de Steve Sistare 2024-01-02  2379  		sds->cfs_overload_cpus = mask;
0ccb3f810722de Steve Sistare 2024-01-02  2380  	}
476141f6c8e689 Steve Sistare 2024-01-02  2381  
476141f6c8e689 Steve Sistare 2024-01-02  2382  	return 0;
476141f6c8e689 Steve Sistare 2024-01-02  2383  }
476141f6c8e689 Steve Sistare 2024-01-02  2384  

:::::: The code at line 2368 was first introduced by commit
:::::: 0ccb3f810722de634beed0dc6fe5c59d963b4c50 sched/topology: Provide cfs_overload_cpus bitmap

:::::: TO: Steve Sistare <steve.sistare@oracle.com>
:::::: CC: Cheng Yu <serein.chengyu@huawei.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
