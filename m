Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41B6564C
	for <oe-kbuild-all@lists.linux.dev>; Mon,  7 Aug 2023 01:53:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691373211; x=1722909211;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=y9D96tf/zEWZR3/JNaBcd0EJTDZsI7T/6yiZbSo50jE=;
  b=jlzVRI6e0+zWGl+mKMFKOwgx9AS9ICwAkwWsjQp1JCp4R1mr5XQMJgfW
   2AOImjUAEJaWY5sUuo+jzN7mYBua75KSN6SrYKfneypTfjouNhxuR0dHE
   zG9q9yz5npNNjH2TtQQ0gK6bU+ksSGGfUK98j2O1WsoBrX+aNDs0XmMr1
   TIV+EukfV7lHsEBUZWGoOFUUIykHZEjlVnUj0G3NrmzmqfYMmUUsI8xJK
   b5WV2oCROEUn7SZ3tu9PxbngeraJutMAf6FQjevyGbJqJ1yZD3hLOPSPw
   C1xxsMV8fnNH9h/ThK7e0rg2oQaDbIwWdiqEwueFn8qf45+AU/mk/dqt6
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10794"; a="360513017"
X-IronPort-AV: E=Sophos;i="6.01,261,1684825200"; 
   d="scan'208";a="360513017"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Aug 2023 18:53:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10794"; a="730765573"
X-IronPort-AV: E=Sophos;i="6.01,261,1684825200"; 
   d="scan'208";a="730765573"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 06 Aug 2023 18:53:28 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qSpR1-0004Tr-14;
	Mon, 07 Aug 2023 01:53:27 +0000
Date: Mon, 7 Aug 2023 09:52:55 +0800
From: kernel test robot <lkp@intel.com>
To: steven@liquorix.net
Cc: oe-kbuild-all@lists.linux.dev
Subject: [zen:6.4/fixes 1/5] kernel/sched/fair.c:7049:52: sparse: sparse:
 incorrect type in argument 2 (different address spaces)
Message-ID: <202308070928.09bKpZVv-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/zen-kernel/zen-kernel 6.4/fixes
head:   6acdaf41f812f2af2f3ede94fed13cd2b0f70b48
commit: d598f814c3958e284212acc8203a6d500389af74 [1/5] sched/fair: Multi-LLC select_idle_sibling()
config: arm64-randconfig-r092-20230807 (https://download.01.org/0day-ci/archive/20230807/202308070928.09bKpZVv-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230807/202308070928.09bKpZVv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308070928.09bKpZVv-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   kernel/sched/fair.c:939:34: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct sched_entity const *se @@     got struct sched_entity [noderef] __rcu * @@
   kernel/sched/fair.c:939:34: sparse:     expected struct sched_entity const *se
   kernel/sched/fair.c:939:34: sparse:     got struct sched_entity [noderef] __rcu *
   kernel/sched/fair.c:11840:9: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] sd @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/fair.c:11840:9: sparse:     expected struct sched_domain *[assigned] sd
   kernel/sched/fair.c:11840:9: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/fair.c:6220:38: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *curr @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/fair.c:6220:38: sparse:     expected struct task_struct *curr
   kernel/sched/fair.c:6220:38: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/fair.c:7037:41: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct sched_domain *parent @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/fair.c:7037:41: sparse:     expected struct sched_domain *parent
   kernel/sched/fair.c:7037:41: sparse:     got struct sched_domain [noderef] __rcu *parent
>> kernel/sched/fair.c:7049:52: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct sched_domain *sd @@     got struct sched_domain [noderef] __rcu * @@
   kernel/sched/fair.c:7049:52: sparse:     expected struct sched_domain *sd
   kernel/sched/fair.c:7049:52: sparse:     got struct sched_domain [noderef] __rcu *
   kernel/sched/fair.c:7515:20: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] sd @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/fair.c:7515:20: sparse:     expected struct sched_domain *[assigned] sd
   kernel/sched/fair.c:7515:20: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/fair.c:7717:9: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] tmp @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/fair.c:7717:9: sparse:     expected struct sched_domain *[assigned] tmp
   kernel/sched/fair.c:7717:9: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/fair.c:7894:38: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *curr @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/fair.c:7894:38: sparse:     expected struct task_struct *curr
   kernel/sched/fair.c:7894:38: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/fair.c:8192:38: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *curr @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/fair.c:8192:38: sparse:     expected struct task_struct *curr
   kernel/sched/fair.c:8192:38: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/fair.c:9182:40: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct sched_domain *child @@     got struct sched_domain [noderef] __rcu *child @@
   kernel/sched/fair.c:9182:40: sparse:     expected struct sched_domain *child
   kernel/sched/fair.c:9182:40: sparse:     got struct sched_domain [noderef] __rcu *child
   kernel/sched/fair.c:9747:22: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/fair.c:9747:22: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/fair.c:9747:22: sparse:    struct task_struct *
   kernel/sched/fair.c:11116:9: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] sd @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/fair.c:11116:9: sparse:     expected struct sched_domain *[assigned] sd
   kernel/sched/fair.c:11116:9: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/fair.c:10775:44: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct sched_domain *sd_parent @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/fair.c:10775:44: sparse:     expected struct sched_domain *sd_parent
   kernel/sched/fair.c:10775:44: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/fair.c:11212:9: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] sd @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/fair.c:11212:9: sparse:     expected struct sched_domain *[assigned] sd
   kernel/sched/fair.c:11212:9: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/fair.c:6149:35: sparse: sparse: marked inline, but without a definition
   kernel/sched/fair.c: note: in included file:
   kernel/sched/sched.h:2073:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2073:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2073:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2235:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2235:9: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2235:9: sparse:    struct task_struct *
   kernel/sched/sched.h:2073:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2073:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2073:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2073:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2073:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2073:25: sparse:    struct task_struct *

vim +7049 kernel/sched/fair.c

  7029	
  7030	/*
  7031	 * For the multiple-LLC per node case, make sure to try the other LLC's if the
  7032	 * local LLC comes up empty.
  7033	 */
  7034	static int
  7035	select_idle_node(struct task_struct *p, struct sched_domain *sd, int target)
  7036	{
  7037		struct sched_domain *parent = sd->parent;
  7038		struct sched_group *sg;
  7039	
  7040		/* Make sure to not cross nodes. */
  7041		if (!parent || parent->flags & SD_NUMA)
  7042			return -1;
  7043	
  7044		sg = parent->groups;
  7045		do {
  7046			int cpu = cpumask_first(sched_group_span(sg));
  7047	
  7048			if (!cpus_share_cache(cpu, target)) {
> 7049				int i = select_idle_cpu(p, per_cpu(sd_llc, cpu),
  7050							test_idle_cores(cpu), cpu);
  7051				if ((unsigned)i < nr_cpumask_bits)
  7052					return i;
  7053			}
  7054	
  7055			sg = sg->next;
  7056		} while (sg != parent->groups);
  7057	
  7058		return -1;
  7059	}
  7060	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
