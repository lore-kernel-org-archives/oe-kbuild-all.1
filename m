Received: from mgamail.intel.com (unknown [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73CAF174F4
	for <oe-kbuild-all@lists.linux.dev>; Thu, 27 Jul 2023 14:11:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690467114; x=1722003114;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=QYpsTfU85fv+WzWEIABnx7+T9WeA0wobsRj1ERV9QsU=;
  b=naHS7jW1dZ1gfHlxpObNvB5C6x1Ey6Ymd7uYkhe264tkgK4AuoGWW3Bn
   dz559KdqhVPnqtdB/fj9g9gO8ZcEe2wi734W9vP4SAj9cGfDTKsl4TcGS
   iph+aYwj5w269cFfIOWoExbAupG5NF7SNHywcjzhdPjjsNBJFkfkvriXp
   a2SsSPEWn92mGmcUA+mwhQdTnAyoc8AtiCj8fpPYm0rpAnAJTlTnN4E7a
   qA6ofYW9Z7ikMGwsHIlpgY/4ysUCS2LJOUHGVqY2xnd00666q8Pw33glf
   clYYriBX3T+0n+zDJCjy4rVX5qE/VB+Izu9e1yeV+20TZ2vMvfogtFeCR
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10784"; a="399256849"
X-IronPort-AV: E=Sophos;i="6.01,235,1684825200"; 
   d="scan'208";a="399256849"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jul 2023 07:11:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10784"; a="720891890"
X-IronPort-AV: E=Sophos;i="6.01,235,1684825200"; 
   d="scan'208";a="720891890"
Received: from lkp-server02.sh.intel.com (HELO 953e8cd98f7d) ([10.239.97.151])
  by orsmga007.jf.intel.com with ESMTP; 27 Jul 2023 07:11:51 -0700
Received: from kbuild by 953e8cd98f7d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qP1iY-0002Jl-2R;
	Thu, 27 Jul 2023 14:11:50 +0000
Date: Thu, 27 Jul 2023 22:10:56 +0800
From: kernel test robot <lkp@intel.com>
To: John Ogness <john.ogness@linutronix.de>
Cc: oe-kbuild-all@lists.linux.dev,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Subject: [rt-devel:linux-6.4.y-rt-rebase 50/85]
 kernel/printk/printk.c:3361:6: warning: no previous prototype for
 'console_bkl_kthread_create'
Message-ID: <202307272211.Nmc1i9bc-lkp@intel.com>
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
commit: 6222f512e52abd73ca47462f12ede8872ff59f0f [50/85] printk: Add threaded printing support for BKL consoles.
config: microblaze-randconfig-r025-20230727 (https://download.01.org/0day-ci/archive/20230727/202307272211.Nmc1i9bc-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230727/202307272211.Nmc1i9bc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307272211.Nmc1i9bc-lkp@intel.com/

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
