Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16A2F37D
	for <oe-kbuild-all@lists.linux.dev>; Sat, 26 Aug 2023 04:42:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693024956; x=1724560956;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=G186fX7IPFIIHSTymQZFOSf2GGGEWaMR5LqS2UtCo1c=;
  b=WbI9fY05ec/4Pnx3Ps6rRLowdoJwRpGJKu87QWZzfdlhSxo02CSM1gkh
   4F0k7xiuHGwj14i+K63po0PFTwUdPWzWOueXxTIftAb6t2/Idr1WND1aJ
   wNUyeikUmhparabEP0gpd4+UTrK/rr4NaDisDpeRwv5ryw5F0ChbhJ0pY
   XvNYxZ771Sikb/gSPcoUeVLbmSP0w2+8npGKVxlzThJ8IQpWP9udGHUwy
   z1Guto8cCY9GgNnU9MeheFBDp8UMgPIqGCFndD7VTlkgqUyXj6iyWSZmZ
   uWeh3Zz6lqvd0FeQGfNExi4+BYGgopZwYGM3C+NF6FfG5YobE1DIet06p
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10813"; a="374821120"
X-IronPort-AV: E=Sophos;i="6.02,202,1688454000"; 
   d="scan'208";a="374821120"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Aug 2023 21:42:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10813"; a="984320344"
X-IronPort-AV: E=Sophos;i="6.02,202,1688454000"; 
   d="scan'208";a="984320344"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by fmsmga006.fm.intel.com with ESMTP; 25 Aug 2023 21:42:33 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qZl84-0004M5-38;
	Sat, 26 Aug 2023 04:42:32 +0000
Date: Sat, 26 Aug 2023 12:42:23 +0800
From: kernel test robot <lkp@intel.com>
To: John Ogness <john.ogness@linutronix.de>
Cc: oe-kbuild-all@lists.linux.dev,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Subject: [rt-devel:linux-6.5.y-rt-rebase 49/87]
 kernel/printk/printk.c:3361:6: warning: no previous prototype for
 'console_bkl_kthread_create'
Message-ID: <202308261233.8h02eVis-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/rt/linux-rt-devel.git linux-6.5.y-rt-rebase
head:   c328ba8602906864849212de9927db3542a6d9f1
commit: ebf7d7c2929535b0203001866e5d1f816bc46c6f [49/87] printk: Add threaded printing support for BKL consoles.
config: arc-randconfig-r015-20230826 (https://download.01.org/0day-ci/archive/20230826/202308261233.8h02eVis-lkp@intel.com/config)
compiler: arceb-elf-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230826/202308261233.8h02eVis-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308261233.8h02eVis-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/printk/printk.c:3361:6: warning: no previous prototype for 'console_bkl_kthread_create' [-Wmissing-prototypes]
    3361 | void console_bkl_kthread_create(void)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/console_bkl_kthread_create +3361 kernel/printk/printk.c

  3360	
> 3361	void console_bkl_kthread_create(void)
  3362	{
  3363		struct task_struct *kt;
  3364		struct console *c;
  3365	
  3366		lockdep_assert_held(&console_mutex);
  3367	
  3368		if (!IS_ENABLED(CONFIG_PREEMPT_RT))
  3369			return;
  3370	
  3371		if (!printk_threads_enabled || console_bkl_kthread)
  3372			return;
  3373	
  3374		for_each_console(c) {
  3375			if (c->flags & CON_BOOT)
  3376				return;
  3377		}
  3378	
  3379		kt = kthread_run(console_bkl_kthread_func, NULL, "pr/bkl");
  3380		if (IS_ERR(kt)) {
  3381			pr_err("unable to start BKL printing thread\n");
  3382			return;
  3383		}
  3384	
  3385		console_bkl_kthread = kt;
  3386	
  3387		/*
  3388		 * It is important that console printing threads are scheduled
  3389		 * shortly after a printk call and with generous runtime budgets.
  3390		 */
  3391		sched_set_normal(console_bkl_kthread, -20);
  3392	}
  3393	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
