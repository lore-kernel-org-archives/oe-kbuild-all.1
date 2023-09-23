Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3FEE1CF97
	for <oe-kbuild-all@lists.linux.dev>; Sat, 23 Sep 2023 14:16:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695478612; x=1727014612;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=uQqN9d1VVIbs2tEsBqyWaGrxpS0VzbBpF5hoekTCElg=;
  b=g0JBC61k32JKtwfTOtPORzxNXcyLuZzecKpDXF7dIfInhHEtkWsadUzM
   GlLBvbusBr1gD7yomWhJfukOKhrpzjBFffOjUZp+v9i972mgYT/MEjROK
   +nsJHcgxj/yMGqGxQ8uUfhyUyzVdrkw19ReQjowvQ+7WnOtG76xururJ2
   ZLPDEum2VNyNwCjbkehu8ZnOxM7L0X1VjgmTwW1IFyjUO1ZsCca+uyu0u
   wKeRTpRIRgr1yDZIeSkhz7HgchcN5HalDGNKbHeJsSVxvJ049MkaqQtWf
   WbvDkwK6LB4vLIpt3ebTJIWbEgtssoVOW8qeX7uFAQ1KUXMM6lTC59Oxk
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10842"; a="384857300"
X-IronPort-AV: E=Sophos;i="6.03,171,1694761200"; 
   d="scan'208";a="384857300"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2023 07:16:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10842"; a="838097891"
X-IronPort-AV: E=Sophos;i="6.03,171,1694761200"; 
   d="scan'208";a="838097891"
Received: from lkp-server02.sh.intel.com (HELO 493f6c7fed5d) ([10.239.97.151])
  by FMSMGA003.fm.intel.com with ESMTP; 23 Sep 2023 07:16:49 -0700
Received: from kbuild by 493f6c7fed5d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qk3R9-0002Sk-2h;
	Sat, 23 Sep 2023 14:16:47 +0000
Date: Sat, 23 Sep 2023 22:15:47 +0800
From: kernel test robot <lkp@intel.com>
To: steven@liquorix.net
Cc: oe-kbuild-all@lists.linux.dev
Subject: [zen:6.6/zen-sauce 32/32] kernel/sched/fair.c:7221:52: sparse:
 sparse: incorrect type in argument 2 (different address spaces)
Message-ID: <202309232212.WLSFsy83-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/zen-kernel/zen-kernel 6.6/zen-sauce
head:   de10967a8b79627cbe295d7331f84fc9cff3bcef
commit: de10967a8b79627cbe295d7331f84fc9cff3bcef [32/32] ZEN: sched/fair: Multi-LLC select_idle_sibling()
config: i386-randconfig-063-20230923 (https://download.01.org/0day-ci/archive/20230923/202309232212.WLSFsy83-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230923/202309232212.WLSFsy83-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309232212.WLSFsy83-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   kernel/sched/fair.c:1150:34: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct sched_entity const *se @@     got struct sched_entity [noderef] __rcu * @@
   kernel/sched/fair.c:1150:34: sparse:     expected struct sched_entity const *se
   kernel/sched/fair.c:1150:34: sparse:     got struct sched_entity [noderef] __rcu *
   kernel/sched/fair.c:12094:9: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] sd @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/fair.c:12094:9: sparse:     expected struct sched_domain *[assigned] sd
   kernel/sched/fair.c:12094:9: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/fair.c:6404:38: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *curr @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/fair.c:6404:38: sparse:     expected struct task_struct *curr
   kernel/sched/fair.c:6404:38: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/fair.c:7209:41: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct sched_domain *parent @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/fair.c:7209:41: sparse:     expected struct sched_domain *parent
   kernel/sched/fair.c:7209:41: sparse:     got struct sched_domain [noderef] __rcu *parent
>> kernel/sched/fair.c:7221:52: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct sched_domain *sd @@     got struct sched_domain [noderef] __rcu * @@
   kernel/sched/fair.c:7221:52: sparse:     expected struct sched_domain *sd
   kernel/sched/fair.c:7221:52: sparse:     got struct sched_domain [noderef] __rcu *
   kernel/sched/fair.c:7741:20: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] sd @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/fair.c:7741:20: sparse:     expected struct sched_domain *[assigned] sd
   kernel/sched/fair.c:7741:20: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/fair.c:7947:9: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] tmp @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/fair.c:7947:9: sparse:     expected struct sched_domain *[assigned] tmp
   kernel/sched/fair.c:7947:9: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/fair.c:8046:38: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *curr @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/fair.c:8046:38: sparse:     expected struct task_struct *curr
   kernel/sched/fair.c:8046:38: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/fair.c:8326:38: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *curr @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/fair.c:8326:38: sparse:     expected struct task_struct *curr
   kernel/sched/fair.c:8326:38: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/fair.c:9319:40: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct sched_domain *child @@     got struct sched_domain [noderef] __rcu *child @@
   kernel/sched/fair.c:9319:40: sparse:     expected struct sched_domain *child
   kernel/sched/fair.c:9319:40: sparse:     got struct sched_domain [noderef] __rcu *child
   kernel/sched/fair.c:9946:22: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/fair.c:9946:22: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/fair.c:9946:22: sparse:    struct task_struct *
   kernel/sched/fair.c:11366:9: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] sd @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/fair.c:11366:9: sparse:     expected struct sched_domain *[assigned] sd
   kernel/sched/fair.c:11366:9: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/fair.c:11025:44: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct sched_domain *sd_parent @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/fair.c:11025:44: sparse:     expected struct sched_domain *sd_parent
   kernel/sched/fair.c:11025:44: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/fair.c:11462:9: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] sd @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/fair.c:11462:9: sparse:     expected struct sched_domain *[assigned] sd
   kernel/sched/fair.c:11462:9: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/fair.c:6326:35: sparse: sparse: marked inline, but without a definition
   kernel/sched/fair.c: note: in included file:
   kernel/sched/sched.h:2133:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2133:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2133:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2297:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2297:9: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2297:9: sparse:    struct task_struct *
   kernel/sched/sched.h:2133:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2133:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2133:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2133:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2133:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2133:25: sparse:    struct task_struct *

vim +7221 kernel/sched/fair.c

  7201	
  7202	/*
  7203	 * For the multiple-LLC per node case, make sure to try the other LLC's if the
  7204	 * local LLC comes up empty.
  7205	 */
  7206	static int
  7207	select_idle_node(struct task_struct *p, struct sched_domain *sd, int target)
  7208	{
  7209		struct sched_domain *parent = sd->parent;
  7210		struct sched_group *sg;
  7211	
  7212		/* Make sure to not cross nodes. */
  7213		if (!parent || parent->flags & SD_NUMA)
  7214			return -1;
  7215	
  7216		sg = parent->groups;
  7217		do {
  7218			int cpu = cpumask_first(sched_group_span(sg));
  7219	
  7220			if (!cpus_share_cache(cpu, target)) {
> 7221				int i = select_idle_cpu(p, per_cpu(sd_llc, cpu),
  7222							test_idle_cores(cpu), cpu);
  7223				if ((unsigned)i < nr_cpumask_bits)
  7224					return i;
  7225			}
  7226	
  7227			sg = sg->next;
  7228		} while (sg != parent->groups);
  7229	
  7230		return -1;
  7231	}
  7232	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
