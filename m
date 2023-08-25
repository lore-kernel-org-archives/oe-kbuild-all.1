Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4128618052
	for <oe-kbuild-all@lists.linux.dev>; Fri, 25 Aug 2023 20:48:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692996501; x=1724532501;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=gpwBnjdXkFz1zRWRJvCnOqfnWpfGzDYHLHQLX3m9yro=;
  b=VdGGWcnp7DSw++fr7d0t0ZrO3U4bUrO0ATno8nnpNUmGWVP6McNkA5dR
   npQ/0afZ+eDYLTb1x3yATTBGRyOYH+AnBLE0yu4UTJzVvQCfGtPHXwPGL
   pOIcnSprDIOajfFwEH8pXUT54xvdH6fqSB2XYx7LZCsBIJ/74VjmpR0/K
   OUKX9ggdj1CI3MpHcM2LapEqpBBR0OVvMAD5X8Fg7wJftLPgP6d2EzUoz
   soIxDlwNM93XDqoUvEl/cxwLZ2P47rWcUHxsKaXTQXtp66dt9OBtKN+um
   Oe15wGBKfi+lxh7WT7uF5dYiSA/yc6Dv/V+setJOBF8YpgcHNeW4N0/xS
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10813"; a="441145941"
X-IronPort-AV: E=Sophos;i="6.02,201,1688454000"; 
   d="scan'208";a="441145941"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Aug 2023 13:48:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10813"; a="861191939"
X-IronPort-AV: E=Sophos;i="6.02,201,1688454000"; 
   d="scan'208";a="861191939"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by orsmga004.jf.intel.com with ESMTP; 25 Aug 2023 13:48:18 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qZdj7-0003zV-25;
	Fri, 25 Aug 2023 20:48:17 +0000
Date: Sat, 26 Aug 2023 04:48:08 +0800
From: kernel test robot <lkp@intel.com>
To: John Ogness <john.ogness@linutronix.de>
Cc: oe-kbuild-all@lists.linux.dev,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Subject: [rt-devel:linux-6.5.y-rt 44/87] kernel/printk/printk.c:3361:6:
 warning: no previous prototype for 'console_bkl_kthread_create'
Message-ID: <202308260422.p6OXOdIS-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/rt/linux-rt-devel.git linux-6.5.y-rt
head:   698472ad9b305446b9cb07a0a56d9e28f525b557
commit: 184530c511550e6ddeacb1d86df7b8c0b923e0bc [44/87] printk: Add threaded printing support for BKL consoles.
config: i386-tinyconfig (https://download.01.org/0day-ci/archive/20230826/202308260422.p6OXOdIS-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230826/202308260422.p6OXOdIS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308260422.p6OXOdIS-lkp@intel.com/

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
