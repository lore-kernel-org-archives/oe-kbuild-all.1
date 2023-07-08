Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE24CA925
	for <oe-kbuild-all@lists.linux.dev>; Sat,  8 Jul 2023 19:36:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1688844995; x=1720380995;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=4kctwFID7xeJcXy3hDYivjLDO88moJQ/G3nkTXYryio=;
  b=lYEXSyluf+FVJzQE/reQqhrWAqscZeMGf6hKP6FHQxtG5wJZQZkdanKg
   3wxgrxQG//gU3RLayp9bxXi/7A7h0Qap+y0hoxafy8iqBc0eb1+f8Sfik
   HoADMXL2U9UgnhhG6PebmbU4CgE9bqddzuCZGynBsx+kvcVtGwoDxIvEn
   k1mHOYWzNUvboFbyfTtvYDX7sOBha+4Qj7/rYjStt8U9UnlOD9J9ie/ji
   Fg1N0SowJtNL7Xv3V6Cy8k+vMjZMguL/fCpWrO06prk29okuDRM4wPVjw
   DuAoOVSC0/as50S7+hqxH7RF+HTRiBDVXZ08HBVWPOUTEwtcWEWyj2xUa
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10765"; a="427780017"
X-IronPort-AV: E=Sophos;i="6.01,191,1684825200"; 
   d="scan'208";a="427780017"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jul 2023 12:36:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10765"; a="894330678"
X-IronPort-AV: E=Sophos;i="6.01,191,1684825200"; 
   d="scan'208";a="894330678"
Received: from lkp-server01.sh.intel.com (HELO c544d7fc5005) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 08 Jul 2023 12:36:34 -0700
Received: from kbuild by c544d7fc5005 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qIDjN-0002sc-0m;
	Sat, 08 Jul 2023 19:36:33 +0000
Date: Sun, 9 Jul 2023 03:36:21 +0800
From: kernel test robot <lkp@intel.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [peterz-queue:sched/maybe 13/13] kernel/sched/fair.c:7096:49:
 sparse: sparse: incorrect type in initializer (different address spaces)
Message-ID: <202307090324.j0H5Ekvl-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git sched/maybe
head:   442ca5588ff277c79f1cd6c29d4df9373c1006ad
commit: 442ca5588ff277c79f1cd6c29d4df9373c1006ad [13/13] sched/fair: Multi-LLC select_idle_sibling()
config: openrisc-randconfig-r073-20230708 (https://download.01.org/0day-ci/archive/20230709/202307090324.j0H5Ekvl-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230709/202307090324.j0H5Ekvl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307090324.j0H5Ekvl-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   kernel/sched/fair.c:939:34: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct sched_entity const *se @@     got struct sched_entity [noderef] __rcu * @@
   kernel/sched/fair.c:939:34: sparse:     expected struct sched_entity const *se
   kernel/sched/fair.c:939:34: sparse:     got struct sched_entity [noderef] __rcu *
   kernel/sched/fair.c:12070:9: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] sd @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/fair.c:12070:9: sparse:     expected struct sched_domain *[assigned] sd
   kernel/sched/fair.c:12070:9: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/fair.c:7086:41: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct sched_domain *parent @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/fair.c:7086:41: sparse:     expected struct sched_domain *parent
   kernel/sched/fair.c:7086:41: sparse:     got struct sched_domain [noderef] __rcu *parent
>> kernel/sched/fair.c:7096:49: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct sched_domain *sd_child @@     got struct sched_domain [noderef] __rcu * @@
   kernel/sched/fair.c:7096:49: sparse:     expected struct sched_domain *sd_child
   kernel/sched/fair.c:7096:49: sparse:     got struct sched_domain [noderef] __rcu *
   kernel/sched/fair.c:7622:20: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] sd @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/fair.c:7622:20: sparse:     expected struct sched_domain *[assigned] sd
   kernel/sched/fair.c:7622:20: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/fair.c:7824:9: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] tmp @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/fair.c:7824:9: sparse:     expected struct sched_domain *[assigned] tmp
   kernel/sched/fair.c:7824:9: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/fair.c:8001:38: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *curr @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/fair.c:8001:38: sparse:     expected struct task_struct *curr
   kernel/sched/fair.c:8001:38: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/fair.c:8299:38: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *curr @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/fair.c:8299:38: sparse:     expected struct task_struct *curr
   kernel/sched/fair.c:8299:38: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/fair.c:9295:40: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct sched_domain *child @@     got struct sched_domain [noderef] __rcu *child @@
   kernel/sched/fair.c:9295:40: sparse:     expected struct sched_domain *child
   kernel/sched/fair.c:9295:40: sparse:     got struct sched_domain [noderef] __rcu *child
   kernel/sched/fair.c:9922:22: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/fair.c:9922:22: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/fair.c:9922:22: sparse:    struct task_struct *
   kernel/sched/fair.c:11342:9: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] sd @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/fair.c:11342:9: sparse:     expected struct sched_domain *[assigned] sd
   kernel/sched/fair.c:11342:9: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/fair.c:11001:44: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct sched_domain *sd_parent @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/fair.c:11001:44: sparse:     expected struct sched_domain *sd_parent
   kernel/sched/fair.c:11001:44: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/fair.c:11438:9: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] sd @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/fair.c:11438:9: sparse:     expected struct sched_domain *[assigned] sd
   kernel/sched/fair.c:11438:9: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/fair.c:6198:35: sparse: sparse: marked inline, but without a definition
   kernel/sched/fair.c: note: in included file:
   kernel/sched/sched.h:2276:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2276:9: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2276:9: sparse:    struct task_struct *
   kernel/sched/sched.h:2114:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2114:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2114:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2114:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2114:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2114:25: sparse:    struct task_struct *

vim +7096 kernel/sched/fair.c

  7078	
  7079	/*
  7080	 * For the multiple-LLC per node case, make sure to try the other LLC's if the
  7081	 * local LLC comes up empty.
  7082	 */
  7083	static int
  7084	select_idle_node(struct task_struct *p, struct sched_domain *sd, int target)
  7085	{
  7086		struct sched_domain *parent = sd->parent;
  7087		struct sched_group *sg;
  7088	
  7089		/* Make sure to not cross nodes. */
  7090		if (!parent || parent->flags & SD_NUMA)
  7091			return -1;
  7092	
  7093		sg = parent->groups;
  7094		do {
  7095			int cpu = cpumask_first(sched_group_span(sg));
> 7096			struct sched_domain *sd_child = per_cpu(sd_llc, cpu);
  7097	
  7098			if (!cpus_share_cache(cpu, target) && sd_child) {
  7099				int i = select_idle_cpu(p, sd_child,
  7100							test_idle_cores(cpu), cpu);
  7101				if ((unsigned)i < nr_cpumask_bits)
  7102					return i;
  7103			}
  7104	
  7105			sg = sg->next;
  7106		} while (sg != parent->groups);
  7107	
  7108		return -1;
  7109	}
  7110	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
