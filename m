Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96B30F9E3
	for <oe-kbuild-all@lists.linux.dev>; Fri,  1 Sep 2023 22:29:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693607399; x=1725143399;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=uDDKwLTRdUJO7eYNJVI+uS1XGyu2DeJLrVNu1fLldPw=;
  b=KUVYDNxZM26l9iIUzikuU+NvlP8Tt+E+VAdHPbN1eMHkaRinbN+uHHKw
   EuWbWr3ZeJOmvWb2NkDv9/tgyif3gTMf6GWf7mSiV1+lV/N5QhZ0h47I9
   heLvKp++PilAKUFi73eHts44okIesAf0pa1ywfDS76h+7ZB/1+oIWSfed
   Jcry4rkB3xV1Es8uCGr2MP8CABJd8kKNtnNnOpxR/2Wc8umKAOv9ZG1Aj
   w8xnOGoxweTbiwDUsbKkz8GTIi5gX+Yc5eg24ud/Rac4cx2VXmRsjyehh
   v89LHpQBIqp89blNKGkx0OhLB3MUOrmk+lwAcPP8rvV+DBq1QCljm6lED
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10819"; a="440292580"
X-IronPort-AV: E=Sophos;i="6.02,221,1688454000"; 
   d="scan'208";a="440292580"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Sep 2023 15:29:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10819"; a="689906529"
X-IronPort-AV: E=Sophos;i="6.02,221,1688454000"; 
   d="scan'208";a="689906529"
Received: from lkp-server01.sh.intel.com (HELO 5d8055a4f6aa) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 01 Sep 2023 15:29:57 -0700
Received: from kbuild by 5d8055a4f6aa with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qcCeJ-0001i1-1D;
	Fri, 01 Sep 2023 22:29:55 +0000
Date: Sat, 2 Sep 2023 06:29:25 +0800
From: kernel test robot <lkp@intel.com>
To: Qais Yousef <qyousef@layalina.io>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [qais-yousef:remove-margins 8/11] kernel/sched/core.c:119:1: sparse:
 sparse: symbol '__pcpu_scope_dvfs_update_delay' was not declared. Should it
 be static?
Message-ID: <202309020608.U1QLJsuP-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/qais-yousef/linux remove-margins
head:   518908f762a679dfec42b0bdf0479f8e47f108a4
commit: 1160db790c00c8d3b7e0d9a7ae814ac1851347e7 [8/11] sched: cpufreq: Remove magic 1.25 headroom from apply_dvfs_headroom()
config: i386-randconfig-061-20230902 (https://download.01.org/0day-ci/archive/20230902/202309020608.U1QLJsuP-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230902/202309020608.U1QLJsuP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309020608.U1QLJsuP-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> kernel/sched/core.c:119:1: sparse: sparse: symbol '__pcpu_scope_dvfs_update_delay' was not declared. Should it be static?
   kernel/sched/core.c:726:31: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *task @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/core.c:726:31: sparse:     expected struct task_struct *task
   kernel/sched/core.c:726:31: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/core.c:727:25: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *task @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/core.c:727:25: sparse:     expected struct task_struct *task
   kernel/sched/core.c:727:25: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/core.c:797:48: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/core.c:797:48: sparse:     expected struct task_struct *p
   kernel/sched/core.c:797:48: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/core.c:1044:38: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *curr @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/core.c:1044:38: sparse:     expected struct task_struct *curr
   kernel/sched/core.c:1044:38: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/core.c:2233:33: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/core.c:2233:33: sparse:     expected struct task_struct *p
   kernel/sched/core.c:2233:33: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/core.c:2233:68: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *tsk @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/core.c:2233:68: sparse:     expected struct task_struct *tsk
   kernel/sched/core.c:2233:68: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/core.c:5644:38: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *curr @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/core.c:5644:38: sparse:     expected struct task_struct *curr
   kernel/sched/core.c:5644:38: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/core.c:6589:14: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct task_struct *prev @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/core.c:6589:14: sparse:     expected struct task_struct *prev
   kernel/sched/core.c:6589:14: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/core.c:7115:17: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/core.c:7115:17: sparse:    struct task_struct *
   kernel/sched/core.c:7115:17: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/core.c:7331:22: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/core.c:7331:22: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/core.c:7331:22: sparse:    struct task_struct *
   kernel/sched/core.c:11532:25: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/core.c:11532:25: sparse:     expected struct task_struct *p
   kernel/sched/core.c:11532:25: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/core.c:552:6: sparse: sparse: context imbalance in 'raw_spin_rq_lock_nested' - wrong count at exit
   kernel/sched/core.c:577:6: sparse: sparse: context imbalance in 'raw_spin_rq_trylock' - wrong count at exit
   kernel/sched/core.c:601:6: sparse: sparse: context imbalance in 'raw_spin_rq_unlock' - unexpected unlock
   kernel/sched/core.c:639:36: sparse: sparse: context imbalance in '__task_rq_lock' - wrong count at exit
   kernel/sched/core.c:680:36: sparse: sparse: context imbalance in 'task_rq_lock' - wrong count at exit
   kernel/sched/core.c:797:11: sparse: sparse: dereference of noderef expression
   kernel/sched/core.c:2224:33: sparse: sparse: dereference of noderef expression
   kernel/sched/core.c:2225:19: sparse: sparse: dereference of noderef expression
   kernel/sched/core.c:2226:18: sparse: sparse: dereference of noderef expression
   kernel/sched/core.c: note: in included file:
   kernel/sched/sched.h:2132:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2132:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2132:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2132:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2132:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2132:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2132:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2132:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2132:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2132:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2132:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2132:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2295:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2295:9: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2295:9: sparse:    struct task_struct *
   kernel/sched/sched.h:2295:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2295:9: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2295:9: sparse:    struct task_struct *
   kernel/sched/sched.h:2132:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2132:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2132:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2295:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2295:9: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2295:9: sparse:    struct task_struct *
   kernel/sched/sched.h:2132:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2132:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2132:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2295:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2295:9: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2295:9: sparse:    struct task_struct *
   kernel/sched/sched.h:2132:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2132:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2132:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2295:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2295:9: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2295:9: sparse:    struct task_struct *
   kernel/sched/sched.h:2132:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2132:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2132:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2132:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2132:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2132:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2295:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2295:9: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2295:9: sparse:    struct task_struct *

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
