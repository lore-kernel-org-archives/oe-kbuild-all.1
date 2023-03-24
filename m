Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF9D82F2D
	for <oe-kbuild-all@lists.linux.dev>; Fri, 24 Mar 2023 09:04:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679648651; x=1711184651;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=EEra+NuPbf+cqeahJnEa/eQQ75a1aVrM8/XymWsFO9g=;
  b=YCFHOdAk5aG4FBKegX2jpe2nmAhKUA4LmOBhkSbAqFhfBXRlcOh0VHNX
   fuHt5XwLBoQRUOgy+QCPNge2aTk0i/Yx2KeTViS/5C5ZsSBR4srcwelDX
   AZ1+qq9MQoQ5vSjxQNpA7dSSlRub0XCLyjAVHpfA0k0mE/h6UmkQbW1/0
   +r58j9zCLh77KLYdLZJn9kNnXKogyDjH8xcZRwE+3R+24mr1gM7Zs+A+0
   rIlElU/qIRtte4PqC1x9m6xbfmVeuw5uSBMNAl0uSDy9nKBB3pqoxDiSR
   mvXVneNnGlxZhR0nbmBGNKfEfhpjL/icN3h3mNJmBlyLM54P99MWylBV8
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10658"; a="319385467"
X-IronPort-AV: E=Sophos;i="5.98,287,1673942400"; 
   d="scan'208";a="319385467"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Mar 2023 02:04:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10658"; a="793371940"
X-IronPort-AV: E=Sophos;i="5.98,287,1673942400"; 
   d="scan'208";a="793371940"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 24 Mar 2023 02:04:08 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pfdLD-000F9u-1W;
	Fri, 24 Mar 2023 09:04:07 +0000
Date: Fri, 24 Mar 2023 17:03:58 +0800
From: kernel test robot <lkp@intel.com>
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [rt-devel:linux-6.3.y-rt 4/5] kernel/printk/printk.c:3365:6:
 warning: no previous prototype for 'console_bkl_kthread_create'
Message-ID: <202303241710.83IbYO2x-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/rt/linux-rt-devel.git linux-6.3.y-rt
head:   93adb32305897d3e6cb5b333fb8873ecff8c68fe
commit: b111e33ae076e9a8cdedb202d0391d23ed420e96 [4/5] printk: Update John's printk series.
config: csky-randconfig-r025-20230322 (https://download.01.org/0day-ci/archive/20230324/202303241710.83IbYO2x-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/rt/linux-rt-devel.git/commit/?id=b111e33ae076e9a8cdedb202d0391d23ed420e96
        git remote add rt-devel https://git.kernel.org/pub/scm/linux/kernel/git/rt/linux-rt-devel.git
        git fetch --no-tags rt-devel linux-6.3.y-rt
        git checkout b111e33ae076e9a8cdedb202d0391d23ed420e96
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=csky olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=csky SHELL=/bin/bash kernel/printk/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303241710.83IbYO2x-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/printk/printk.c:3365:6: warning: no previous prototype for 'console_bkl_kthread_create' [-Wmissing-prototypes]
    3365 | void console_bkl_kthread_create(void)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/console_bkl_kthread_create +3365 kernel/printk/printk.c

  3364	
> 3365	void console_bkl_kthread_create(void)
  3366	{
  3367		struct task_struct *kt;
  3368		struct console *c;
  3369	
  3370		lockdep_assert_held(&console_mutex);
  3371	
  3372		if (!IS_ENABLED(CONFIG_PREEMPT_RT))
  3373			return;
  3374	
  3375		if (!printk_threads_enabled || console_bkl_kthread)
  3376			return;
  3377	
  3378		for_each_console(c) {
  3379			if (c->flags & CON_BOOT)
  3380				return;
  3381		}
  3382	
  3383		kt = kthread_run(console_bkl_kthread_func, NULL, "pr/bkl");
  3384		if (IS_ERR(kt)) {
  3385			pr_err("unable to start BKL printing thread\n");
  3386			return;
  3387		}
  3388	
  3389		console_bkl_kthread = kt;
  3390	
  3391		/*
  3392		 * It is important that console printing threads are scheduled
  3393		 * shortly after a printk call and with generous runtime budgets.
  3394		 */
  3395		sched_set_normal(console_bkl_kthread, -20);
  3396	}
  3397	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
