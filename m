Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52C4AD2E2
	for <oe-kbuild-all@lists.linux.dev>; Thu, 23 Mar 2023 21:18:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679606327; x=1711142327;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=8et/kjxUipom70a5RxYsn29cJcLfQMfyC+HWlg0obng=;
  b=PaWZniZxJxNkt4Ez8t9m84KxnI5MHvXcAkP59cnQu5BQUgcAz59d3np1
   bsHXrI2yC+buB5OxIzeItHGfA3swHn+HEscTIxn54rJk6Ul3NsS11nMZ7
   cIu+/ktta4+neWDZ35ezSWgMBZxv7hTWrLGmPUKkAUt8iQG3GQ6s+szHg
   i8rA4npWfO9mPTPZfWh+2KpTKLWI8cPJyutGlmmIL1Yb630jPQDS7cmRk
   AOT89d9ELY3bGIL4uEPeacxiE1xhan2Rs19YqsZGZ0rPxOCLf1qzI1lFB
   rJVmdWQCoyHRPxHTaAEdTKn/zz0LU1JNzCFiXDOripvH+9CvRPgWsSjxP
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10658"; a="402208315"
X-IronPort-AV: E=Sophos;i="5.98,285,1673942400"; 
   d="scan'208";a="402208315"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Mar 2023 14:18:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10658"; a="806427472"
X-IronPort-AV: E=Sophos;i="5.98,286,1673942400"; 
   d="scan'208";a="806427472"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 23 Mar 2023 14:18:44 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pfSKa-000EiQ-0P;
	Thu, 23 Mar 2023 21:18:44 +0000
Date: Fri, 24 Mar 2023 05:17:45 +0800
From: kernel test robot <lkp@intel.com>
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [rt-devel:linux-6.3.y-rt-rebase 9/70] kernel/softirq.c:676:54:
 error: implicit declaration of function 'local_pending_timers'
Message-ID: <202303240517.bBGmUVau-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/rt/linux-rt-devel.git linux-6.3.y-rt-rebase
head:   3ce3071e7d6e66ee5718dc83577b5fae58535971
commit: 23e9c277ba3a8b6aca855318306c7e5180a38963 [9/70] softirq: Use a dedicated thread for timer wakeups.
config: i386-tinyconfig (https://download.01.org/0day-ci/archive/20230324/202303240517.bBGmUVau-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        # https://git.kernel.org/pub/scm/linux/kernel/git/rt/linux-rt-devel.git/commit/?id=23e9c277ba3a8b6aca855318306c7e5180a38963
        git remote add rt-devel https://git.kernel.org/pub/scm/linux/kernel/git/rt/linux-rt-devel.git
        git fetch --no-tags rt-devel linux-6.3.y-rt-rebase
        git checkout 23e9c277ba3a8b6aca855318306c7e5180a38963
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=i386 olddefconfig
        make W=1 O=build_dir ARCH=i386 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303240517.bBGmUVau-lkp@intel.com/

Note: the rt-devel/linux-6.3.y-rt-rebase HEAD 3ce3071e7d6e66ee5718dc83577b5fae58535971 builds fine.
      It only hurts bisectability.

All errors (new ones prefixed by >>):

   kernel/softirq.c: In function '__irq_exit_rcu':
>> kernel/softirq.c:676:54: error: implicit declaration of function 'local_pending_timers' [-Werror=implicit-function-declaration]
     676 |                 if (IS_ENABLED(CONFIG_PREEMPT_RT) && local_pending_timers())
         |                                                      ^~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +/local_pending_timers +676 kernel/softirq.c

   662	
   663	static inline void __irq_exit_rcu(void)
   664	{
   665	#ifndef __ARCH_IRQ_EXIT_IRQS_DISABLED
   666		local_irq_disable();
   667	#else
   668		lockdep_assert_irqs_disabled();
   669	#endif
   670		account_hardirq_exit(current);
   671		preempt_count_sub(HARDIRQ_OFFSET);
   672		if (!in_interrupt()) {
   673			if (local_softirq_pending())
   674				invoke_softirq();
   675	
 > 676			if (IS_ENABLED(CONFIG_PREEMPT_RT) && local_pending_timers())
   677				wake_timersd();
   678		}
   679	
   680		tick_irq_exit();
   681	}
   682	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
