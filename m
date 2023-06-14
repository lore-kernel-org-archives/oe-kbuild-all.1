Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E5E4621
	for <oe-kbuild-all@lists.linux.dev>; Wed, 14 Jun 2023 03:32:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686713540; x=1718249540;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=CT55x2tL2fG/d4IOX+9OZ9stojWlPgduwPbXLbO2iOg=;
  b=XcHL1aWnZvhc9YYHnojyprv3dV7XJX7d/PMDVvMmb9DDAQt76PH9eigp
   f+sSj0M995Q8kwtySinTYQ7jiVOTAFc5/8H+zbuRNKsDkdUy5/xkE5+UH
   IF6Lw28gt1baXrkXuWoVJ+xiezkLVZcULFm6EBo1Ctp6Ra606rpCX0VXJ
   gOT7ufRTPZF/GJMjKb7htpO/LTqH03qRYGrc4mmvqbPQJSpjY+76tRXot
   pS0yHOtZYNoyuywrsX/TqnR817HE83Cukudnl1r2K2RxGpSWGn5lCQwVM
   T3MpQ6Od8ezuHyeqZ0Zm4yv+Z9nHZL1A2xQO9Q3e8A7U6jZra8p3VzJTh
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10740"; a="360989942"
X-IronPort-AV: E=Sophos;i="6.00,241,1681196400"; 
   d="scan'208";a="360989942"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jun 2023 20:32:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10740"; a="744925057"
X-IronPort-AV: E=Sophos;i="6.00,241,1681196400"; 
   d="scan'208";a="744925057"
Received: from lkp-server02.sh.intel.com (HELO d59cacf64e9e) ([10.239.97.151])
  by orsmga001.jf.intel.com with ESMTP; 13 Jun 2023 20:32:18 -0700
Received: from kbuild by d59cacf64e9e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q9HF3-00006F-22;
	Wed, 14 Jun 2023 03:32:17 +0000
Date: Wed, 14 Jun 2023 11:29:15 +0800
From: kernel test robot <lkp@intel.com>
To: Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [tomoyo-test1:master 1/1] include/linux/workqueue.h:582:9: error:
 call to '__warn_flushing_systemwide_wq' declared with attribute warning:
 Please avoid flushing system-wide workqueues.
Message-ID: <202306141124.CN4TQtBe-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://scm.osdn.net/gitroot/tomoyo/tomoyo-test1.git master
head:   e52fa5e9fbe1c842c6a974f9b25d0162bba778bf
commit: e52fa5e9fbe1c842c6a974f9b25d0162bba778bf [1/1] workqueue: Warn attempt to flush system-wide workqueues.
config: i386-defconfig (https://download.01.org/0day-ci/archive/20230614/202306141124.CN4TQtBe-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build):
        git remote add tomoyo-test1 https://scm.osdn.net/gitroot/tomoyo/tomoyo-test1.git
        git fetch --no-tags tomoyo-test1 master
        git checkout e52fa5e9fbe1c842c6a974f9b25d0162bba778bf
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=i386 olddefconfig
        make W=1 O=build_dir ARCH=i386 SHELL=/bin/bash drivers/gpu/drm/i915/

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306141124.CN4TQtBe-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/rhashtable-types.h:15,
                    from include/linux/ipc.h:7,
                    from include/uapi/linux/sem.h:5,
                    from include/linux/sem.h:5,
                    from include/linux/sched.h:15,
                    from include/linux/dma-fence.h:21,
                    from include/linux/dma-resv.h:43,
                    from drivers/gpu/drm/i915/display/intel_display.c:27:
   drivers/gpu/drm/i915/display/intel_display.c: In function 'intel_modeset_driver_remove_noirq':
>> include/linux/workqueue.h:582:9: error: call to '__warn_flushing_systemwide_wq' declared with attribute warning: Please avoid flushing system-wide workqueues. [-Werror=attribute-warning]
     582 |         __warn_flushing_systemwide_wq();                                \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/i915/display/intel_display.c:8741:9: note: in expansion of macro 'flush_scheduled_work'
    8741 |         flush_scheduled_work();
         |         ^~~~~~~~~~~~~~~~~~~~
   cc1: all warnings being treated as errors


vim +/__warn_flushing_systemwide_wq +582 include/linux/workqueue.h

8425e3d5bdbe8e Tejun Heo    2013-03-13  568  
c4f135d643823a Tetsuo Handa 2022-06-01  569  /*
c4f135d643823a Tetsuo Handa 2022-06-01  570   * Detect attempt to flush system-wide workqueues at compile time when possible.
e52fa5e9fbe1c8 Tetsuo Handa 2023-06-13  571   * Warn attempt to flush system-wide workqueues at runtime.
c4f135d643823a Tetsuo Handa 2022-06-01  572   *
c4f135d643823a Tetsuo Handa 2022-06-01  573   * See https://lkml.kernel.org/r/49925af7-78a8-a3dd-bce6-cfc02e1a9236@I-love.SAKURA.ne.jp
c4f135d643823a Tetsuo Handa 2022-06-01  574   * for reasons and steps for converting system-wide workqueues into local workqueues.
c4f135d643823a Tetsuo Handa 2022-06-01  575   */
c4f135d643823a Tetsuo Handa 2022-06-01  576  extern void __warn_flushing_systemwide_wq(void)
c4f135d643823a Tetsuo Handa 2022-06-01  577  	__compiletime_warning("Please avoid flushing system-wide workqueues.");
c4f135d643823a Tetsuo Handa 2022-06-01  578  
e52fa5e9fbe1c8 Tetsuo Handa 2023-06-13  579  /* Please stop using this function, for this function will be removed in near future. */
c4f135d643823a Tetsuo Handa 2022-06-01  580  #define flush_scheduled_work()						\
c4f135d643823a Tetsuo Handa 2022-06-01  581  ({									\
c4f135d643823a Tetsuo Handa 2022-06-01 @582  	__warn_flushing_systemwide_wq();				\
c4f135d643823a Tetsuo Handa 2022-06-01  583  	__flush_workqueue(system_wq);					\
c4f135d643823a Tetsuo Handa 2022-06-01  584  })
c4f135d643823a Tetsuo Handa 2022-06-01  585  

:::::: The code at line 582 was first introduced by commit
:::::: c4f135d643823a869becfa87539f7820ef9d5bfa workqueue: Wrap flush_workqueue() using a macro

:::::: TO: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
:::::: CC: Tejun Heo <tj@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
