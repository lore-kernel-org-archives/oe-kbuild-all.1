Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D30FD17C5
	for <oe-kbuild-all@lists.linux.dev>; Sat,  9 Sep 2023 07:08:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694243329; x=1725779329;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=fOe1Pb+OXPia4d0Nxht3aW7/9BVeC6OAefJ4/+vn/FA=;
  b=J10DILSuazSsz2PM3B1/zClaH8AwaN5NJMNcQyyYjVtDrVFyxCi9gXPq
   AuPAu2kEphTuGlTVF6Q2rp9IKrnEjDUyuh+Pb2HrAqXKQDOzd9WmoYWF8
   EeW2ggdy5niLQcjlUjsSTXXcutRSX9lKQBK++1G888ulmaBM0XpzO8Jmz
   HO/6IqyVQ524dsbBD39njjBK+d5uJHR8TTQqZaiJjGghlEY65ZKNa1qSb
   4nZkhqJ3i+A4CSLkSoD1Vj1O7nYOLdnZ0VehVeU6p78rOgfTB10S2kUSf
   JbTn+LYqTbG+RJ6TEqiSaY0iQ9lvV68uFQ3SECFVf4m2hbWkC2IS2lED4
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10827"; a="375173694"
X-IronPort-AV: E=Sophos;i="6.02,239,1688454000"; 
   d="scan'208";a="375173694"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2023 00:08:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10827"; a="1073563934"
X-IronPort-AV: E=Sophos;i="6.02,239,1688454000"; 
   d="scan'208";a="1073563934"
Received: from lkp-server01.sh.intel.com (HELO 59b3c6e06877) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 09 Sep 2023 00:08:48 -0700
Received: from kbuild by 59b3c6e06877 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qes5G-00032Y-0a;
	Sat, 09 Sep 2023 07:08:46 +0000
Date: Sat, 9 Sep 2023 15:08:03 +0800
From: kernel test robot <lkp@intel.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [peterz-queue:sched/maybe 2/2] kernel/sched/fair.c:7200:41: sparse:
 sparse: incorrect type in initializer (different address spaces)
Message-ID: <202309091524.GVrvIASG-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git sched/maybe
head:   3ae37dbd96d72ccfefa62f23a6f2d3733de634d4
commit: 3ae37dbd96d72ccfefa62f23a6f2d3733de634d4 [2/2] sched/fair: Multi-LLC select_idle_sibling()
config: i386-randconfig-063-20230909 (https://download.01.org/0day-ci/archive/20230909/202309091524.GVrvIASG-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230909/202309091524.GVrvIASG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309091524.GVrvIASG-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   kernel/sched/fair.c:702:6: sparse: sparse: symbol 'update_entity_lag' was not declared. Should it be static?
   kernel/sched/fair.c:1140:34: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct sched_entity const *se @@     got struct sched_entity [noderef] __rcu * @@
   kernel/sched/fair.c:1140:34: sparse:     expected struct sched_entity const *se
   kernel/sched/fair.c:1140:34: sparse:     got struct sched_entity [noderef] __rcu *
   kernel/sched/fair.c:12082:9: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] sd @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/fair.c:12082:9: sparse:     expected struct sched_domain *[assigned] sd
   kernel/sched/fair.c:12082:9: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/fair.c:6395:38: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *curr @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/fair.c:6395:38: sparse:     expected struct task_struct *curr
   kernel/sched/fair.c:6395:38: sparse:     got struct task_struct [noderef] __rcu *curr
>> kernel/sched/fair.c:7200:41: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct sched_domain *parent @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/fair.c:7200:41: sparse:     expected struct sched_domain *parent
   kernel/sched/fair.c:7200:41: sparse:     got struct sched_domain [noderef] __rcu *parent
>> kernel/sched/fair.c:7210:49: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct sched_domain *sd_child @@     got struct sched_domain [noderef] __rcu * @@
   kernel/sched/fair.c:7210:49: sparse:     expected struct sched_domain *sd_child
   kernel/sched/fair.c:7210:49: sparse:     got struct sched_domain [noderef] __rcu *
   kernel/sched/fair.c:7733:20: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] sd @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/fair.c:7733:20: sparse:     expected struct sched_domain *[assigned] sd
   kernel/sched/fair.c:7733:20: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/fair.c:7935:9: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] tmp @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/fair.c:7935:9: sparse:     expected struct sched_domain *[assigned] tmp
   kernel/sched/fair.c:7935:9: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/fair.c:8034:38: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *curr @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/fair.c:8034:38: sparse:     expected struct task_struct *curr
   kernel/sched/fair.c:8034:38: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/fair.c:8314:38: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *curr @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/fair.c:8314:38: sparse:     expected struct task_struct *curr
   kernel/sched/fair.c:8314:38: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/fair.c:9307:40: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct sched_domain *child @@     got struct sched_domain [noderef] __rcu *child @@
   kernel/sched/fair.c:9307:40: sparse:     expected struct sched_domain *child
   kernel/sched/fair.c:9307:40: sparse:     got struct sched_domain [noderef] __rcu *child
   kernel/sched/fair.c:9934:22: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/fair.c:9934:22: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/fair.c:9934:22: sparse:    struct task_struct *
   kernel/sched/fair.c:11354:9: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] sd @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/fair.c:11354:9: sparse:     expected struct sched_domain *[assigned] sd
   kernel/sched/fair.c:11354:9: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/fair.c:11013:44: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct sched_domain *sd_parent @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/fair.c:11013:44: sparse:     expected struct sched_domain *sd_parent
   kernel/sched/fair.c:11013:44: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/fair.c:11450:9: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] sd @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/fair.c:11450:9: sparse:     expected struct sched_domain *[assigned] sd
   kernel/sched/fair.c:11450:9: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/fair.c:6316:35: sparse: sparse: marked inline, but without a definition
   kernel/sched/fair.c: note: in included file:
   kernel/sched/sched.h:2137:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2137:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2137:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2300:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2300:9: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2300:9: sparse:    struct task_struct *
   kernel/sched/sched.h:2137:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2137:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2137:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2137:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2137:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2137:25: sparse:    struct task_struct *

vim +7200 kernel/sched/fair.c

  7192	
  7193	/*
  7194	 * For the multiple-LLC per node case, make sure to try the other LLC's if the
  7195	 * local LLC comes up empty.
  7196	 */
  7197	static int
  7198	select_idle_node(struct task_struct *p, struct sched_domain *sd, int target)
  7199	{
> 7200		struct sched_domain *parent = sd->parent;
  7201		struct sched_group *sg;
  7202	
  7203		/* Make sure to not cross nodes. */
  7204		if (!parent || parent->flags & SD_NUMA)
  7205			return -1;
  7206	
  7207		sg = parent->groups;
  7208		do {
  7209			int cpu = cpumask_first(sched_group_span(sg));
> 7210			struct sched_domain *sd_child = per_cpu(sd_llc, cpu);
  7211	
  7212			if (!cpus_share_cache(cpu, target) && sd_child) {
  7213				int i = select_idle_cpu(p, sd_child,
  7214							test_idle_cores(cpu), cpu);
  7215				if ((unsigned)i < nr_cpumask_bits)
  7216					return i;
  7217			}
  7218	
  7219			sg = sg->next;
  7220		} while (sg != parent->groups);
  7221	
  7222		return -1;
  7223	}
  7224	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
