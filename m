Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8787E5243
	for <oe-kbuild-all@lists.linux.dev>; Fri,  7 Jul 2023 06:18:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1688710735; x=1720246735;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=t4m5WZBlz8FNlKpYAYf744j9lcXlxgTa0jLPawuAyPg=;
  b=JUOxXIJQIjZrXTCwCWSNMueNueFosBZqOn9OCOSDM/7ScsPXkHXoM4e/
   EkFTv93EQVdLphZ3Spst6D5VzYgpZaC5uNKa0aUfWDwy2bfj9ZZmgIALw
   yMo9RjIw8mLfAk9AqvUGBqKF9uKKNvZ+CFTC0PXyi2ECZ6DJGw6D2HpsW
   GPjWrXVSEUdjinh8erPFCmm+3vBoWiqOAimsJVpE21V/SZOkTs2i02u5C
   2am3zHo7mRcAovZd1u2PKZGFNthmDX1AT6y/fc3BVK9Rnpv+J8bwSt+6y
   rEppA7W9o5CqJC98j6uzw9SSy1oFORHf4wkk2gEWfOD7iklDxBLI4UHLu
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10763"; a="394581933"
X-IronPort-AV: E=Sophos;i="6.01,187,1684825200"; 
   d="scan'208";a="394581933"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jul 2023 23:18:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10763"; a="789835999"
X-IronPort-AV: E=Sophos;i="6.01,187,1684825200"; 
   d="scan'208";a="789835999"
Received: from lkp-server01.sh.intel.com (HELO c544d7fc5005) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 06 Jul 2023 23:18:53 -0700
Received: from kbuild by c544d7fc5005 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qHens-0001pc-1L;
	Fri, 07 Jul 2023 06:18:52 +0000
Date: Fri, 7 Jul 2023 14:18:23 +0800
From: kernel test robot <lkp@intel.com>
To: steven@liquorix.net
Cc: oe-kbuild-all@lists.linux.dev
Subject: [zen:6.4/prjc 381/386] kernel/sched/alt_core.c:136:1: sparse:
 sparse: symbol 'sched_cpu_llc_mask' was not declared. Should it be static?
Message-ID: <202307071407.3qjKNaNH-lkp@intel.com>
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
commit: 4facf7f6e34125d06a1fc94cbc716e2cb1e09f82 [381/386] sched/alt: [Sync] 223baf9d17f2 sched: Fix performance regression introduced by mm_cid
config: i386-randconfig-i062-20230704 (https://download.01.org/0day-ci/archive/20230707/202307071407.3qjKNaNH-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230707/202307071407.3qjKNaNH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307071407.3qjKNaNH-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> kernel/sched/alt_core.c:136:1: sparse: sparse: symbol 'sched_cpu_llc_mask' was not declared. Should it be static?
>> kernel/sched/alt_core.c:595:25: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *task @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/alt_core.c:595:25: sparse:     expected struct task_struct *task
   kernel/sched/alt_core.c:595:25: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/alt_core.c:1009:38: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *curr @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/alt_core.c:1009:38: sparse:     expected struct task_struct *curr
   kernel/sched/alt_core.c:1009:38: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/alt_core.c:1826:44: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/alt_core.c:1826:44: sparse:    struct task_struct *
   kernel/sched/alt_core.c:1826:44: sparse:    struct task_struct [noderef] __rcu *
>> kernel/sched/alt_core.c:2611:28: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct const *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/alt_core.c:2611:28: sparse:     expected struct task_struct const *p
   kernel/sched/alt_core.c:2611:28: sparse:     got struct task_struct [noderef] __rcu *curr
>> kernel/sched/alt_core.c:7200:43: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *push_task @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/alt_core.c:7200:43: sparse:     expected struct task_struct *push_task
   kernel/sched/alt_core.c:7200:43: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/alt_core.c:4025:15: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/alt_core.c:4025:15: sparse:    struct task_struct *
   kernel/sched/alt_core.c:4025:15: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/alt_core.c:4128:32: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct task_struct *curr @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/alt_core.c:4128:32: sparse:     expected struct task_struct *curr
   kernel/sched/alt_core.c:4128:32: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/alt_core.c:4747:14: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct task_struct *prev @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/alt_core.c:4747:14: sparse:     expected struct task_struct *prev
   kernel/sched/alt_core.c:4747:14: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/alt_core.c:5283:17: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/alt_core.c:5283:17: sparse:    struct task_struct *
   kernel/sched/alt_core.c:5283:17: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/alt_core.c:5433:22: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/alt_core.c:5433:22: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/alt_core.c:5433:22: sparse:    struct task_struct *
   kernel/sched/alt_core.c:7048:25: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/alt_core.c:7048:25: sparse:     expected struct task_struct *p
   kernel/sched/alt_core.c:7048:25: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/alt_core.c:536:6: sparse: sparse: context imbalance in 'raw_spin_rq_lock_nested' - wrong count at exit
   kernel/sched/alt_core.c:555:6: sparse: sparse: context imbalance in 'raw_spin_rq_unlock' - unexpected unlock
   kernel/sched/alt_core.c:1157:37: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/alt_core.c:1157:37: sparse:    struct task_struct *
   kernel/sched/alt_core.c:1157:37: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/alt_core.c:1784:38: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/alt_core.c:1784:38: sparse:    struct task_struct [noderef] __rcu *
>> kernel/sched/alt_core.c:1784:38: sparse:    struct task_struct const *
   kernel/sched/alt_core.c:1157:37: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/alt_core.c:1157:37: sparse:    struct task_struct *
   kernel/sched/alt_core.c:1157:37: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/alt_core.c:1157:37: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/alt_core.c:1157:37: sparse:    struct task_struct *
   kernel/sched/alt_core.c:1157:37: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/alt_core.c:1157:37: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/alt_core.c:1157:37: sparse:    struct task_struct *
   kernel/sched/alt_core.c:1157:37: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/alt_core.c:1157:37: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/alt_core.c:1157:37: sparse:    struct task_struct *
   kernel/sched/alt_core.c:1157:37: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/alt_core.c:1157:37: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/alt_core.c:1157:37: sparse:    struct task_struct *
   kernel/sched/alt_core.c:1157:37: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/alt_core.c:1157:37: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/alt_core.c:1157:37: sparse:    struct task_struct *
   kernel/sched/alt_core.c:1157:37: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/alt_core.c:1157:37: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/alt_core.c:1157:37: sparse:    struct task_struct *
   kernel/sched/alt_core.c:1157:37: sparse:    struct task_struct [noderef] __rcu *

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
