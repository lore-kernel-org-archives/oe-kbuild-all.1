Received: from mgamail.intel.com (unknown [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70C031ADC0
	for <oe-kbuild-all@lists.linux.dev>; Tue,  1 Aug 2023 15:09:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690902552; x=1722438552;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ITtBn86Jh7ibVuJyeZXtgXxxEY2IKGjUX+/h4y3bgs4=;
  b=Bl+MjafYp2siBUwjAldiCRFIFQOOttVdNxiMffqiaT3iM6M2PAtWifyy
   HGhSKXX4D+r3vwkwSIjemjJnvNIY+jGNiYCE02IFOhx5T8Hfw8ZB5mADy
   y2HrJzLKdvfMGTprKBh1DyRFURyJ8S1D1tI3HxWsUQ6jdykZNfVGFme2m
   fZGl306zLTCTBwekgoP/hNV+qdA9g0KpnxsUNVsJ1TwEjo2ftiFNehSGg
   ZcPVfQBqq/HJmtUdT7xnUs+9U991+gf26YfQ7D47QhOJANHHyp4de7G6Q
   DV7dU4vwprvlaEFK6pnSFGT7gPnBR3NIAzLwYvWJ86HEjPfGQljRI2eGu
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10789"; a="400272257"
X-IronPort-AV: E=Sophos;i="6.01,247,1684825200"; 
   d="scan'208";a="400272257"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Aug 2023 08:09:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10789"; a="798683906"
X-IronPort-AV: E=Sophos;i="6.01,247,1684825200"; 
   d="scan'208";a="798683906"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 01 Aug 2023 08:09:00 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qQqzb-0000NT-38;
	Tue, 01 Aug 2023 15:08:59 +0000
Date: Tue, 1 Aug 2023 23:08:05 +0800
From: kernel test robot <lkp@intel.com>
To: Frederic Weisbecker <frederic@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frederic-dynticks:timers/softirq-preemptible 1/6]
 kernel/softirq.c:535:9: error: implicit declaration of function
 'reset_softirq_pending'; did you mean 'set_softirq_pending'?
Message-ID: <202308012311.4O9tjMUE-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/frederic/linux-dynticks.git timers/softirq-preemptible
head:   c233aee141ddb78d07b2f7311be38cfc286de654
commit: 0f12659dd62d91c765a711ed6cac3dca5786c620 [1/6] softirq: Turn set_softirq_pending() to reset_softirq_pending()
config: s390-defconfig (https://download.01.org/0day-ci/archive/20230801/202308012311.4O9tjMUE-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230801/202308012311.4O9tjMUE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308012311.4O9tjMUE-lkp@intel.com/

All errors (new ones prefixed by >>):

   kernel/softirq.c: In function '__do_softirq':
>> kernel/softirq.c:535:9: error: implicit declaration of function 'reset_softirq_pending'; did you mean 'set_softirq_pending'? [-Werror=implicit-function-declaration]
     535 |         reset_softirq_pending();
         |         ^~~~~~~~~~~~~~~~~~~~~
         |         set_softirq_pending
   cc1: some warnings being treated as errors


vim +535 kernel/softirq.c

   509	
   510	asmlinkage __visible void __softirq_entry __do_softirq(void)
   511	{
   512		unsigned long end = jiffies + MAX_SOFTIRQ_TIME;
   513		unsigned long old_flags = current->flags;
   514		int max_restart = MAX_SOFTIRQ_RESTART;
   515		struct softirq_action *h;
   516		bool in_hardirq;
   517		__u32 pending;
   518		int softirq_bit;
   519	
   520		/*
   521		 * Mask out PF_MEMALLOC as the current task context is borrowed for the
   522		 * softirq. A softirq handled, such as network RX, might set PF_MEMALLOC
   523		 * again if the socket is related to swapping.
   524		 */
   525		current->flags &= ~PF_MEMALLOC;
   526	
   527		pending = local_softirq_pending();
   528	
   529		softirq_handle_begin();
   530		in_hardirq = lockdep_softirq_start();
   531		account_softirq_enter(current);
   532	
   533	restart:
   534		/* Reset the pending bitmask before enabling irqs */
 > 535		reset_softirq_pending();
   536	
   537		local_irq_enable();
   538	
   539		h = softirq_vec;
   540	
   541		while ((softirq_bit = ffs(pending))) {
   542			unsigned int vec_nr;
   543			int prev_count;
   544	
   545			h += softirq_bit - 1;
   546	
   547			vec_nr = h - softirq_vec;
   548			prev_count = preempt_count();
   549	
   550			kstat_incr_softirqs_this_cpu(vec_nr);
   551	
   552			trace_softirq_entry(vec_nr);
   553			h->action(h);
   554			trace_softirq_exit(vec_nr);
   555			if (unlikely(prev_count != preempt_count())) {
   556				pr_err("huh, entered softirq %u %s %p with preempt_count %08x, exited with %08x?\n",
   557				       vec_nr, softirq_to_name[vec_nr], h->action,
   558				       prev_count, preempt_count());
   559				preempt_count_set(prev_count);
   560			}
   561			h++;
   562			pending >>= softirq_bit;
   563		}
   564	
   565		if (!IS_ENABLED(CONFIG_PREEMPT_RT) &&
   566		    __this_cpu_read(ksoftirqd) == current)
   567			rcu_softirq_qs();
   568	
   569		local_irq_disable();
   570	
   571		pending = local_softirq_pending();
   572		if (pending) {
   573			if (time_before(jiffies, end) && !need_resched() &&
   574			    --max_restart)
   575				goto restart;
   576	
   577			wakeup_softirqd();
   578		}
   579	
   580		account_softirq_exit(current);
   581		lockdep_softirq_end(in_hardirq);
   582		softirq_handle_end();
   583		current_restore_flags(old_flags, PF_MEMALLOC);
   584	}
   585	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
