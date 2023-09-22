Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD6A35660
	for <oe-kbuild-all@lists.linux.dev>; Fri, 22 Sep 2023 06:59:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695365968; x=1726901968;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=0BwymBhUpLKMSBRLPmBCYKw1e3DzCf2eEKTtpvUDm/s=;
  b=QdxP1b/R2cQhENqZyx4MTe/v7EWNwd9rdYFnVr+8Zcb1XqXjCRB7ywRl
   iyJSQNTsbS1PLTcdYrMOM/DvBpaHmLPrk7bH2HBdFzHPGqzsP2QtgRUwk
   qLrRXadoZR8iMCLqv835BzqPHeUIFCrehz0BCroWwXqutPqoKHW1UlqFc
   8SJdagr0zvqYLlTKrspOocDNYtxenDPnL2x0lkD85QcfGJC1oC8iULUQQ
   WxIkphyFl4kSUt/fFuxZRbVKwiXz/1waPzp8zUwolRoZUTaF1LWkX0baT
   x4wDYfNCDXXEcifEPno9EiTNRcjGOQzToqAprGA10Xdl98U1c7PGaQ17u
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10840"; a="411698543"
X-IronPort-AV: E=Sophos;i="6.03,167,1694761200"; 
   d="scan'208";a="411698543"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Sep 2023 23:59:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10840"; a="1078261979"
X-IronPort-AV: E=Sophos;i="6.03,167,1694761200"; 
   d="scan'208";a="1078261979"
Received: from lkp-server02.sh.intel.com (HELO 493f6c7fed5d) ([10.239.97.151])
  by fmsmga005.fm.intel.com with ESMTP; 21 Sep 2023 23:59:26 -0700
Received: from kbuild by 493f6c7fed5d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qja8K-0000FB-1a;
	Fri, 22 Sep 2023 06:59:24 +0000
Date: Fri, 22 Sep 2023 14:58:40 +0800
From: kernel test robot <lkp@intel.com>
To: John Ogness <john.ogness@linutronix.de>
Cc: oe-kbuild-all@lists.linux.dev,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Subject: [rt-devel:linux-6.4.y-rt-rebase 46/79]
 kernel/printk/printk.c:3361:6: warning: no previous prototype for
 'console_bkl_kthread_create'
Message-ID: <202309221431.jWGSVvmz-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/rt/linux-rt-devel.git linux-6.4.y-rt-rebase
head:   fb7828286d1ee12dc132500e9fc84085ceadabc3
commit: 094c02761170c2bb60bfd8203fde8c553e30871c [46/79] printk: Add threaded printing support for BKL consoles.
config: csky-randconfig-001-20230922 (https://download.01.org/0day-ci/archive/20230922/202309221431.jWGSVvmz-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230922/202309221431.jWGSVvmz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309221431.jWGSVvmz-lkp@intel.com/

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
