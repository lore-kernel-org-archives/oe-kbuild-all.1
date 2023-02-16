Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5A8ED314
	for <oe-kbuild-all@lists.linux.dev>; Thu, 16 Feb 2023 04:50:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676523017; x=1708059017;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=LtnyayX13OFI8VsbgArUW68eyd9Id5T1xy3Tzkjghzw=;
  b=T/1vHQLlcN2P6pS2V0i767fs1ctuM1FZdW/YnV8N1o7ala4cosM64F0d
   cPaozg7A0zyAmwp9GcVNmWQUG275EXHcpuXtmVwj/jEeC+hPQC9EJRQVK
   Wck8tR55x8bOL0dbzUoDhkXTn5VS48FctABIvDXPEjRJBYpDct9ZOpwn/
   WY1ow78Xp6cl7mDKnXRkCqBcVBhEdz1vwzaryDx+sLRJ6TBaJwLoPreuX
   diCvjMgz3xQeKbiImGWNbgyYbo1dg36YJi04YD7WOEZRC6BUyOBGVdPVd
   2DT3HhbON6hbT3+7UBTY0x57GMERSiRTZplCRasYOF9YAun30UN+gjQe8
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10622"; a="311992291"
X-IronPort-AV: E=Sophos;i="5.97,301,1669104000"; 
   d="scan'208";a="311992291"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Feb 2023 20:50:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10622"; a="844005708"
X-IronPort-AV: E=Sophos;i="5.97,301,1669104000"; 
   d="scan'208";a="844005708"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 15 Feb 2023 20:50:16 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pSWDn-000A1F-20;
	Thu, 16 Feb 2023 04:50:15 +0000
Date: Thu, 16 Feb 2023 12:49:57 +0800
From: kernel test robot <lkp@intel.com>
To: "Joel Fernandes (Google)" <joel@joelfernandes.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jfern:timers/dyn_hrtimer 2/2] kernel/time/tick-sched.c:1466:22:
 warning: no previous prototype for 'tick_sched_timer'
Message-ID: <202302161215.HJkSudft-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jfern/linux.git timers/dyn_hrtimer
head:   6c6c32845db34e033bf1818442388e4287074f1e
commit: 6c6c32845db34e033bf1818442388e4287074f1e [2/2] HACK: Only expire tick_sched_timer and run hrtimers via wheel
config: csky-defconfig (https://download.01.org/0day-ci/archive/20230216/202302161215.HJkSudft-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/jfern/linux.git/commit/?id=6c6c32845db34e033bf1818442388e4287074f1e
        git remote add jfern https://git.kernel.org/pub/scm/linux/kernel/git/jfern/linux.git
        git fetch --no-tags jfern timers/dyn_hrtimer
        git checkout 6c6c32845db34e033bf1818442388e4287074f1e
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=csky olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=csky SHELL=/bin/bash kernel/time/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302161215.HJkSudft-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/time/tick-sched.c:1466:22: warning: no previous prototype for 'tick_sched_timer' [-Wmissing-prototypes]
    1466 | enum hrtimer_restart tick_sched_timer(struct hrtimer *timer)
         |                      ^~~~~~~~~~~~~~~~


vim +/tick_sched_timer +1466 kernel/time/tick-sched.c

  1457	
  1458	/*
  1459	 * High resolution timer specific code
  1460	 */
  1461	#ifdef CONFIG_HIGH_RES_TIMERS
  1462	/*
  1463	 * We rearm the timer until we get disabled by the idle code.
  1464	 * Called with interrupts disabled.
  1465	 */
> 1466	enum hrtimer_restart tick_sched_timer(struct hrtimer *timer)
  1467	{
  1468		struct tick_sched *ts =
  1469			container_of(timer, struct tick_sched, sched_timer);
  1470		struct pt_regs *regs = get_irq_regs();
  1471		ktime_t now = ktime_get();
  1472	
  1473		tick_sched_do_timer(ts, now);
  1474	
  1475		/*
  1476		 * Do not call, when we are not in irq context and have
  1477		 * no valid regs pointer
  1478		 */
  1479		if (regs)
  1480			tick_sched_handle(ts, regs);
  1481		else
  1482			ts->next_tick = 0;
  1483	
  1484		/* No need to reprogram if we are in idle or full dynticks mode */
  1485		if (unlikely(ts->tick_stopped))
  1486			return HRTIMER_NORESTART;
  1487	
  1488		hrtimer_forward(timer, now, TICK_NSEC);
  1489	
  1490		return HRTIMER_RESTART;
  1491	}
  1492	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
