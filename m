Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3C502F4B
	for <oe-kbuild-all@lists.linux.dev>; Mon, 20 Feb 2023 13:23:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676899399; x=1708435399;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3acAtw58XjbM8Oppo9oplaRQIGXFSqZFUQuFHE5RTtY=;
  b=ji3z2KLjAJmAcB7BZWsKjqQMty5w/mOVI4Hiuumwxzj/OBA/KyW4I0pT
   I/UcF88GUIhFZkm1v9iVsFeIjkflYHJF2+LR+mZyxu5ajhUD7JG2nnu28
   iTGxpP7azoER/STnAzJNrgDtBLEQRQ/n+dF1z4nFRR3ioi8AY1wibCC1F
   yU+OvGwznpYIj/iozzcQnugCGr49dbJfJ2qzBOp4G67aw9QKB8pG2M7v9
   HwoO8w7cnyUE1RljVnJQiZWIYKiTOfvZ/iLihG7LTW7JmqgPBrDiFKrzc
   bwyXa6vqauVizhb1ZtOTEcVxF3RjHpTybubuAnT+vmvM68WnAAGmVB3iC
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10627"; a="312768566"
X-IronPort-AV: E=Sophos;i="5.97,312,1669104000"; 
   d="scan'208";a="312768566"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Feb 2023 05:23:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10627"; a="664632358"
X-IronPort-AV: E=Sophos;i="5.97,312,1669104000"; 
   d="scan'208";a="664632358"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 20 Feb 2023 05:23:17 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pU68S-000Dw3-2S;
	Mon, 20 Feb 2023 13:23:16 +0000
Date: Mon, 20 Feb 2023 21:22:52 +0800
From: kernel test robot <lkp@intel.com>
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [rt-devel:linux-6.2.y-rt-rebase 8/46] kernel/softirq.c:676:54:
 error: implicit declaration of function 'local_pending_timers'
Message-ID: <202302202117.tD1Y9akF-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/rt/linux-rt-devel.git linux-6.2.y-rt-rebase
head:   7496aedb6af6460e3d54a198986de37c2eb7ac8b
commit: b0d1c056bbeee175f3ec5ee276525c88ccb1e584 [8/46] softirq: Use a dedicated thread for timer wakeups.
config: i386-tinyconfig (https://download.01.org/0day-ci/archive/20230220/202302202117.tD1Y9akF-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        # https://git.kernel.org/pub/scm/linux/kernel/git/rt/linux-rt-devel.git/commit/?id=b0d1c056bbeee175f3ec5ee276525c88ccb1e584
        git remote add rt-devel https://git.kernel.org/pub/scm/linux/kernel/git/rt/linux-rt-devel.git
        git fetch --no-tags rt-devel linux-6.2.y-rt-rebase
        git checkout b0d1c056bbeee175f3ec5ee276525c88ccb1e584
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=i386 olddefconfig
        make W=1 O=build_dir ARCH=i386 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302202117.tD1Y9akF-lkp@intel.com/

Note: the rt-devel/linux-6.2.y-rt-rebase HEAD 7496aedb6af6460e3d54a198986de37c2eb7ac8b builds fine.
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
