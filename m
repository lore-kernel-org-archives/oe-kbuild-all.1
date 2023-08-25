Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA3F55CAC
	for <oe-kbuild-all@lists.linux.dev>; Fri, 25 Aug 2023 21:29:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692998997; x=1724534997;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=WCLiIGz31xYvZHa2uPL9OTEg0ilMuTSw9xfvoXDKlDE=;
  b=RQPvWxPt20BOafvSYAxgIftwsILCLKoSzx8+GlF6fttWyppQjtHi7/al
   ML64KGOgoFyd7n7BtHiFhujW/KBVqvahBVPRS0liy5MK926kFFR3nFCa8
   9K79BtpwhgBvA/IEFsKBYCE3fKqUUWJN8IRL5/P7anffNEXjRniI3v4NO
   BCWdacbUE8Gh8ng9mfoKXbLSazB3YI+tHzyn4Es7tEiyh2Z3vJAECiKob
   cj6P1jZwdshx/il7cmj6WTwPeZ3S7g08ANz1RNvn31G0F8T3TOflwB9WM
   x8ANRbpuUHD/G36HgQ79j/iOzclpZd/GJYZUy+CAfgA9SAvt/5TXykMmr
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10813"; a="372207349"
X-IronPort-AV: E=Sophos;i="6.02,202,1688454000"; 
   d="scan'208";a="372207349"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Aug 2023 14:29:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10813"; a="911405572"
X-IronPort-AV: E=Sophos;i="6.02,202,1688454000"; 
   d="scan'208";a="911405572"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 25 Aug 2023 14:29:55 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qZeNO-000413-1A;
	Fri, 25 Aug 2023 21:29:54 +0000
Date: Sat, 26 Aug 2023 05:29:32 +0800
From: kernel test robot <lkp@intel.com>
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [rt-devel:linux-6.5.y-rt-rebase 19/87] kernel/softirq.c:658:54:
 error: implicit declaration of function 'local_pending_timers'
Message-ID: <202308260559.am6njC1r-lkp@intel.com>
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
commit: 963a76cb4b565bcf6b770a1f42b573f64792f970 [19/87] softirq: Use a dedicated thread for timer wakeups.
config: i386-tinyconfig (https://download.01.org/0day-ci/archive/20230826/202308260559.am6njC1r-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230826/202308260559.am6njC1r-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308260559.am6njC1r-lkp@intel.com/

Note: the rt-devel/linux-6.5.y-rt-rebase HEAD c328ba8602906864849212de9927db3542a6d9f1 builds fine.
      It only hurts bisectability.

All errors (new ones prefixed by >>):

   kernel/softirq.c: In function '__irq_exit_rcu':
>> kernel/softirq.c:658:54: error: implicit declaration of function 'local_pending_timers' [-Werror=implicit-function-declaration]
     658 |                 if (IS_ENABLED(CONFIG_PREEMPT_RT) && local_pending_timers())
         |                                                      ^~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +/local_pending_timers +658 kernel/softirq.c

   644	
   645	static inline void __irq_exit_rcu(void)
   646	{
   647	#ifndef __ARCH_IRQ_EXIT_IRQS_DISABLED
   648		local_irq_disable();
   649	#else
   650		lockdep_assert_irqs_disabled();
   651	#endif
   652		account_hardirq_exit(current);
   653		preempt_count_sub(HARDIRQ_OFFSET);
   654		if (!in_interrupt()) {
   655			if (local_softirq_pending())
   656				invoke_softirq();
   657	
 > 658			if (IS_ENABLED(CONFIG_PREEMPT_RT) && local_pending_timers())
   659				wake_timersd();
   660		}
   661	
   662		tick_irq_exit();
   663	}
   664	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
