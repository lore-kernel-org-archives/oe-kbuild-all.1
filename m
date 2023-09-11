Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3101CBE6F
	for <oe-kbuild-all@lists.linux.dev>; Mon, 11 Sep 2023 11:59:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694433547; x=1725969547;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=MTep1SdtdlJjeCT/FDcS1DhLpjH+5P0wHxuzKPz6AMo=;
  b=SX82PxiLI/AhrM2n2xZu311Lf7ZYH1p83kACGU1INEbF/NsWbfJKawbh
   OsgnmBwUyXGVZhW2pjdU4DPkBBrio/MF+UnWU3MinYweNr+fIUspUQcVO
   DYuNm44OwIfWzebVe7vcYNWUdyPonBdcy+z52CbfoZtN/W0LbzfT3zCXp
   Rd+pgqFDPaKMjs9bWloGYlpW/rQVYdyPNncPCKh/GACKCn7J4JAuj8anQ
   mZegoI/W/deRJNxQFDkNmZH/QTmy+PhmqErXiq12HUU6Fr4v8DzC20xF1
   XQ7dG8cwLR71CfRF1RrTv6YE/3/ppgt6cCiz+ItvFfv6Golmp0zMfGIqz
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10830"; a="409029835"
X-IronPort-AV: E=Sophos;i="6.02,244,1688454000"; 
   d="scan'208";a="409029835"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Sep 2023 04:59:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10830"; a="772557316"
X-IronPort-AV: E=Sophos;i="6.02,244,1688454000"; 
   d="scan'208";a="772557316"
Received: from lkp-server01.sh.intel.com (HELO 59b3c6e06877) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 11 Sep 2023 04:59:04 -0700
Received: from kbuild by 59b3c6e06877 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qffZG-0006Bm-0Q;
	Mon, 11 Sep 2023 11:59:02 +0000
Date: Mon, 11 Sep 2023 19:58:24 +0800
From: kernel test robot <lkp@intel.com>
To: "Eric W. Biederman" <ebiederm@xmission.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: kernel/exit.c:738:45: sparse: sparse: incorrect type in initializer
 (different address spaces)
Message-ID: <202309111937.od6n6DD5-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   0bb80ecc33a8fb5a682236443c1e740d5c917d1d
commit: d80f7d7b2c75c5954d335dffbccca62a5002c3e0 signal: Guarantee that SIGNAL_GROUP_EXIT is set on process exit
date:   1 year, 2 months ago
config: i386-randconfig-061-20230909 (https://download.01.org/0day-ci/archive/20230911/202309111937.od6n6DD5-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230911/202309111937.od6n6DD5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309111937.od6n6DD5-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   kernel/exit.c:281:37: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *tsk @@     got struct task_struct [noderef] __rcu *real_parent @@
   kernel/exit.c:281:37: sparse:     expected struct task_struct *tsk
   kernel/exit.c:281:37: sparse:     got struct task_struct [noderef] __rcu *real_parent
   kernel/exit.c:284:32: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *task @@     got struct task_struct [noderef] __rcu *real_parent @@
   kernel/exit.c:284:32: sparse:     expected struct task_struct *task
   kernel/exit.c:284:32: sparse:     got struct task_struct [noderef] __rcu *real_parent
   kernel/exit.c:285:35: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *task @@     got struct task_struct [noderef] __rcu *real_parent @@
   kernel/exit.c:285:35: sparse:     expected struct task_struct *task
   kernel/exit.c:285:35: sparse:     got struct task_struct [noderef] __rcu *real_parent
   kernel/exit.c:330:24: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct task_struct *parent @@     got struct task_struct [noderef] __rcu *real_parent @@
   kernel/exit.c:330:24: sparse:     expected struct task_struct *parent
   kernel/exit.c:330:24: sparse:     got struct task_struct [noderef] __rcu *real_parent
   kernel/exit.c:357:27: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   kernel/exit.c:357:27: sparse:     expected struct spinlock [usertype] *lock
   kernel/exit.c:357:27: sparse:     got struct spinlock [noderef] __rcu *
   kernel/exit.c:360:29: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   kernel/exit.c:360:29: sparse:     expected struct spinlock [usertype] *lock
   kernel/exit.c:360:29: sparse:     got struct spinlock [noderef] __rcu *
   kernel/exit.c:583:29: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct task_struct *reaper @@     got struct task_struct [noderef] __rcu *real_parent @@
   kernel/exit.c:583:29: sparse:     expected struct task_struct *reaper
   kernel/exit.c:583:29: sparse:     got struct task_struct [noderef] __rcu *real_parent
   kernel/exit.c:585:29: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct task_struct *reaper @@     got struct task_struct [noderef] __rcu *real_parent @@
   kernel/exit.c:585:29: sparse:     expected struct task_struct *reaper
   kernel/exit.c:585:29: sparse:     got struct task_struct [noderef] __rcu *real_parent
>> kernel/exit.c:738:45: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct sighand_struct *sighand @@     got struct sighand_struct [noderef] __rcu *sighand @@
   kernel/exit.c:738:45: sparse:     expected struct sighand_struct *sighand
   kernel/exit.c:738:45: sparse:     got struct sighand_struct [noderef] __rcu *sighand
   kernel/exit.c:927:63: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct sighand_struct *const sighand @@     got struct sighand_struct [noderef] __rcu *sighand @@
   kernel/exit.c:927:63: sparse:     expected struct sighand_struct *const sighand
   kernel/exit.c:927:63: sparse:     got struct sighand_struct [noderef] __rcu *sighand
   kernel/exit.c:1082:39: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   kernel/exit.c:1082:39: sparse:     expected struct spinlock [usertype] *lock
   kernel/exit.c:1082:39: sparse:     got struct spinlock [noderef] __rcu *
   kernel/exit.c:1107:41: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   kernel/exit.c:1107:41: sparse:     expected struct spinlock [usertype] *lock
   kernel/exit.c:1107:41: sparse:     got struct spinlock [noderef] __rcu *
   kernel/exit.c:1196:25: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   kernel/exit.c:1196:25: sparse:     expected struct spinlock [usertype] *lock
   kernel/exit.c:1196:25: sparse:     got struct spinlock [noderef] __rcu *
   kernel/exit.c:1211:27: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   kernel/exit.c:1211:27: sparse:     expected struct spinlock [usertype] *lock
   kernel/exit.c:1211:27: sparse:     got struct spinlock [noderef] __rcu *
   kernel/exit.c:1262:25: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   kernel/exit.c:1262:25: sparse:     expected struct spinlock [usertype] *lock
   kernel/exit.c:1262:25: sparse:     got struct spinlock [noderef] __rcu *
   kernel/exit.c:1265:35: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   kernel/exit.c:1265:35: sparse:     expected struct spinlock [usertype] *lock
   kernel/exit.c:1265:35: sparse:     got struct spinlock [noderef] __rcu *
   kernel/exit.c:1271:27: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   kernel/exit.c:1271:27: sparse:     expected struct spinlock [usertype] *lock
   kernel/exit.c:1271:27: sparse:     got struct spinlock [noderef] __rcu *
   kernel/exit.c:1452:59: sparse: sparse: incompatible types in comparison expression (different base types):
   kernel/exit.c:1452:59: sparse:    void *
   kernel/exit.c:1452:59: sparse:    struct task_struct [noderef] __rcu *
   kernel/exit.c:1468:25: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *parent @@     got struct task_struct [noderef] __rcu * @@
   kernel/exit.c:1468:25: sparse:     expected struct task_struct *parent
   kernel/exit.c:1468:25: sparse:     got struct task_struct [noderef] __rcu *
   kernel/exit.c: note: in included file:
   include/linux/ptrace.h:92:40: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *p1 @@     got struct task_struct [noderef] __rcu *real_parent @@
   include/linux/ptrace.h:92:40: sparse:     expected struct task_struct *p1
   include/linux/ptrace.h:92:40: sparse:     got struct task_struct [noderef] __rcu *real_parent
   include/linux/ptrace.h:92:60: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct task_struct *p2 @@     got struct task_struct [noderef] __rcu *parent @@
   include/linux/ptrace.h:92:60: sparse:     expected struct task_struct *p2
   include/linux/ptrace.h:92:60: sparse:     got struct task_struct [noderef] __rcu *parent
   include/linux/ptrace.h:92:40: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *p1 @@     got struct task_struct [noderef] __rcu *real_parent @@
   include/linux/ptrace.h:92:40: sparse:     expected struct task_struct *p1
   include/linux/ptrace.h:92:40: sparse:     got struct task_struct [noderef] __rcu *real_parent
   include/linux/ptrace.h:92:60: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct task_struct *p2 @@     got struct task_struct [noderef] __rcu *parent @@
   include/linux/ptrace.h:92:60: sparse:     expected struct task_struct *p2
   include/linux/ptrace.h:92:60: sparse:     got struct task_struct [noderef] __rcu *parent
   kernel/exit.c: note: in included file (through include/linux/sched/signal.h, include/linux/rcuwait.h, include/linux/percpu-rwsem.h, ...):
   include/linux/sched/task.h:110:21: sparse: sparse: context imbalance in 'wait_task_zombie' - unexpected unlock
   include/linux/sched/task.h:110:21: sparse: sparse: context imbalance in 'wait_task_stopped' - unexpected unlock
   include/linux/sched/task.h:110:21: sparse: sparse: context imbalance in 'wait_task_continued' - unexpected unlock
   kernel/exit.c: note: in included file:
   include/linux/ptrace.h:92:40: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *p1 @@     got struct task_struct [noderef] __rcu *real_parent @@
   include/linux/ptrace.h:92:40: sparse:     expected struct task_struct *p1
   include/linux/ptrace.h:92:40: sparse:     got struct task_struct [noderef] __rcu *real_parent
   include/linux/ptrace.h:92:60: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct task_struct *p2 @@     got struct task_struct [noderef] __rcu *parent @@
   include/linux/ptrace.h:92:60: sparse:     expected struct task_struct *p2
   include/linux/ptrace.h:92:60: sparse:     got struct task_struct [noderef] __rcu *parent
   kernel/exit.c:1560:9: sparse: sparse: context imbalance in 'do_wait' - wrong count at exit

vim +738 kernel/exit.c

   735	
   736	static void synchronize_group_exit(struct task_struct *tsk, long code)
   737	{
 > 738		struct sighand_struct *sighand = tsk->sighand;
   739		struct signal_struct *signal = tsk->signal;
   740	
   741		spin_lock_irq(&sighand->siglock);
   742		signal->quick_threads--;
   743		if ((signal->quick_threads == 0) &&
   744		    !(signal->flags & SIGNAL_GROUP_EXIT)) {
   745			signal->flags = SIGNAL_GROUP_EXIT;
   746			signal->group_exit_code = code;
   747			signal->group_stop_count = 0;
   748		}
   749		spin_unlock_irq(&sighand->siglock);
   750	}
   751	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
