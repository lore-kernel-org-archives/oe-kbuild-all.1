Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CDAE7F
	for <oe-kbuild-all@lists.linux.dev>; Sat,  8 Jul 2023 00:42:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1688776938; x=1720312938;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=9pCgHCkaQtwhVOc6FKKmQHAWJuofQh5ZUXQQ7N0K3g8=;
  b=TgBcoafr2xSTDDiXWMcC7LAWoRpTgblOwM4v/KXZHbizNoH5rCyKeNh5
   1dHkuqIGi/Q64MGSquO9Uaj6X8vf0DaWYI+0BxnkERt6gyn9kT3EcrBLL
   oM1ypqvbBIDWPP10rdqR3vjSy2RSLzpKQoEbtPEfpqu6eogAAG+pgw5GO
   RgZdfNiGqHTKUsOT6oSFwfGrpBUSz87WeVqtzfvVDPrq0MMW3vCqOuWrG
   gn1Iq3fO4AyEEDsMLWmPdEL4trVUlNuCuwca9dAVKrJkN4h4z845eORGE
   Kuazhwj9TSpf4dDk+5kf4aQFJtgbLLiK1pyQrOo+GtJkqyUUQAIVvDz59
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10764"; a="367501273"
X-IronPort-AV: E=Sophos;i="6.01,189,1684825200"; 
   d="scan'208";a="367501273"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jul 2023 17:42:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10764"; a="810212493"
X-IronPort-AV: E=Sophos;i="6.01,189,1684825200"; 
   d="scan'208";a="810212493"
Received: from lkp-server01.sh.intel.com (HELO c544d7fc5005) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 07 Jul 2023 17:42:16 -0700
Received: from kbuild by c544d7fc5005 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qHw1f-0002R4-1M;
	Sat, 08 Jul 2023 00:42:15 +0000
Date: Sat, 8 Jul 2023 08:42:09 +0800
From: kernel test robot <lkp@intel.com>
To: steven@liquorix.net
Cc: oe-kbuild-all@lists.linux.dev
Subject: [zen:6.4/prjc 378/386] kernel/sched/alt_core.c:135:1: sparse:
 sparse: symbol '__pcpu_scope_sched_cpu_llc_mask' was not declared. Should it
 be static?
Message-ID: <202307080826.Oc4k3vDJ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Alfred,

First bad commit (maybe != root cause):

tree:   https://github.com/zen-kernel/zen-kernel 6.4/prjc
head:   ea6d5107f9aa76407998568ad4cbcf54879ee0c0
commit: 8541fa12f886cf52e531f9b31d76e9c0684d5c5e [378/386] sched/alt: [Sync] cc9cb0a71725 sched, smp: Trace IPIs sent via send_call_function_single_ipi()
config: x86_64-randconfig-x062-20230703 (https://download.01.org/0day-ci/archive/20230708/202307080826.Oc4k3vDJ-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230708/202307080826.Oc4k3vDJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307080826.Oc4k3vDJ-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> kernel/sched/alt_core.c:135:1: sparse: sparse: symbol '__pcpu_scope_sched_cpu_llc_mask' was not declared. Should it be static?
>> kernel/sched/alt_core.c:136:1: sparse: sparse: symbol '__pcpu_scope_sched_cpu_topo_end_mask' was not declared. Should it be static?
>> kernel/sched/alt_core.c:148:1: sparse: sparse: symbol '__pcpu_scope_sd_llc_id' was not declared. Should it be static?
   kernel/sched/alt_core.c:1008:38: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *curr @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/alt_core.c:1008:38: sparse:     expected struct task_struct *curr
   kernel/sched/alt_core.c:1008:38: sparse:     got struct task_struct [noderef] __rcu *curr
>> kernel/sched/alt_core.c:1044:6: sparse: sparse: symbol 'select_nohz_load_balancer' was not declared. Should it be static?
   kernel/sched/alt_core.c:1819:44: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/alt_core.c:1819:44: sparse:    struct task_struct *
   kernel/sched/alt_core.c:1819:44: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/alt_core.c:2600:28: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct const *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/alt_core.c:2600:28: sparse:     expected struct task_struct const *p
   kernel/sched/alt_core.c:2600:28: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/alt_core.c:7180:43: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *push_task @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/alt_core.c:7180:43: sparse:     expected struct task_struct *push_task
   kernel/sched/alt_core.c:7180:43: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/alt_core.c:4008:15: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/alt_core.c:4008:15: sparse:    struct task_struct *
   kernel/sched/alt_core.c:4008:15: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/alt_core.c:4727:14: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct task_struct *prev @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/alt_core.c:4727:14: sparse:     expected struct task_struct *prev
   kernel/sched/alt_core.c:4727:14: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/alt_core.c:5263:17: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/alt_core.c:5263:17: sparse:    struct task_struct *
   kernel/sched/alt_core.c:5263:17: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/alt_core.c:5413:22: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/alt_core.c:5413:22: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/alt_core.c:5413:22: sparse:    struct task_struct *
   kernel/sched/alt_core.c:7028:25: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/alt_core.c:7028:25: sparse:     expected struct task_struct *p
   kernel/sched/alt_core.c:7028:25: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/alt_core.c:535:6: sparse: sparse: context imbalance in 'raw_spin_rq_lock_nested' - wrong count at exit
   kernel/sched/alt_core.c:554:6: sparse: sparse: context imbalance in 'raw_spin_rq_unlock' - unexpected unlock
   kernel/sched/alt_core.c:1156:37: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/alt_core.c:1156:37: sparse:    struct task_struct *
   kernel/sched/alt_core.c:1156:37: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/alt_core.c:1777:38: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/alt_core.c:1777:38: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/alt_core.c:1777:38: sparse:    struct task_struct const *
   kernel/sched/alt_core.c:1156:37: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/alt_core.c:1156:37: sparse:    struct task_struct *
   kernel/sched/alt_core.c:1156:37: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/alt_core.c:1156:37: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/alt_core.c:1156:37: sparse:    struct task_struct *
   kernel/sched/alt_core.c:1156:37: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/alt_core.c:1156:37: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/alt_core.c:1156:37: sparse:    struct task_struct *
   kernel/sched/alt_core.c:1156:37: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/alt_core.c:1156:37: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/alt_core.c:1156:37: sparse:    struct task_struct *
   kernel/sched/alt_core.c:1156:37: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/alt_core.c:1156:37: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/alt_core.c:1156:37: sparse:    struct task_struct *
   kernel/sched/alt_core.c:1156:37: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/alt_core.c:1156:37: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/alt_core.c:1156:37: sparse:    struct task_struct *
   kernel/sched/alt_core.c:1156:37: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/alt_core.c:1156:37: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/alt_core.c:1156:37: sparse:    struct task_struct *
   kernel/sched/alt_core.c:1156:37: sparse:    struct task_struct [noderef] __rcu *

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
