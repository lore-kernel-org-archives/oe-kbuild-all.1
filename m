Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D2B5C26E
	for <oe-kbuild-all@lists.linux.dev>; Thu,  9 Mar 2023 18:25:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678386348; x=1709922348;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3p8Lmw4FSUz3qKJop16MhJJ6ZgbdwRR7vubPWmu2qY8=;
  b=awrQL+v8IsUjYuRsNPWoK1ydgdxrOMJ8zhAydeuPEzb3Mwfl1isoiKgH
   V+h1dZ36S2P9WxM06o5o+DUYT0IDg2K76zKZ7uG+f0t1u92rGx/y4gn45
   xg7JIunM3rXZcVXPM5gSfVAX3gBuSW/Uj6RvGra5DEqK6TU48jCBy5BKv
   sLMfYfXayFjSWRiCdenkG8ZDWqEKY2bWzNVnC4G19eQSDerq+9IpmsLIY
   DZEL+jy0grf+C2Ey+svC4ZkcvXpXK8TCta8yDlaQ5FpERkJh1IWzXqeaK
   RsPe/mSy6zxN2So9zIHuQXodayO0hnfrlU5p2r4gcAApZ6Vtpvruqb11G
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10644"; a="364176943"
X-IronPort-AV: E=Sophos;i="5.98,247,1673942400"; 
   d="scan'208";a="364176943"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Mar 2023 10:25:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10644"; a="679871828"
X-IronPort-AV: E=Sophos;i="5.98,247,1673942400"; 
   d="scan'208";a="679871828"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 09 Mar 2023 10:25:36 -0800
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1paKxM-000391-13;
	Thu, 09 Mar 2023 18:25:36 +0000
Date: Fri, 10 Mar 2023 02:25:08 +0800
From: kernel test robot <lkp@intel.com>
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [rt-devel:linux-6.3.y-rt-rebase 6/47] kernel/softirq.c:676:54:
 error: implicit declaration of function 'local_pending_timers'
Message-ID: <202303100213.epzoP4c8-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/rt/linux-rt-devel.git linux-6.3.y-rt-rebase
head:   c0ca8b79d21d0c9a1ac7ed0ebebb5588804ba825
commit: 04fad7c63642399b29c7699bbd9f249560228a3b [6/47] softirq: Use a dedicated thread for timer wakeups.
config: i386-tinyconfig (https://download.01.org/0day-ci/archive/20230310/202303100213.epzoP4c8-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        # https://git.kernel.org/pub/scm/linux/kernel/git/rt/linux-rt-devel.git/commit/?id=04fad7c63642399b29c7699bbd9f249560228a3b
        git remote add rt-devel https://git.kernel.org/pub/scm/linux/kernel/git/rt/linux-rt-devel.git
        git fetch --no-tags rt-devel linux-6.3.y-rt-rebase
        git checkout 04fad7c63642399b29c7699bbd9f249560228a3b
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=i386 olddefconfig
        make W=1 O=build_dir ARCH=i386 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303100213.epzoP4c8-lkp@intel.com/

Note: the rt-devel/linux-6.3.y-rt-rebase HEAD c0ca8b79d21d0c9a1ac7ed0ebebb5588804ba825 builds fine.
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
