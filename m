Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A243D315
	for <oe-kbuild-all@lists.linux.dev>; Thu, 16 Feb 2023 05:01:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676523678; x=1708059678;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=pKGElPS7GoHNFoom7sR6hbX9Xw4OHXTh0pZPqleMlXE=;
  b=jTYzLLMrXMahRblcFV+SX4n0boI0rvzMqgiKa+4tVzo++4B7hkxtSzKq
   uZ7/A1k9KMRDLDG9XdFkxqNlfqIIGOtcz72H6bsj8HBAHdg8cdy+rS5bx
   uuQytS/fz2nm/UadH9ZDQA3BaOKAhEGJyheRZPGAMegerVRGxFlFtPAqx
   /WMvmPqEG4I+yiwGUaOsWvAswJikXAuU09ByiN/jRNMO7/2kuzAVeaHBt
   sE9s/QXjvTId4+TpwqRcLiihXj87E5rogShfFwpv+Tjfrt0pea1WBoMmL
   mFQs4Ddp5+DK/3pJTkn8czwqSnA3b1PKz63vh17Zgi/707/XTqR5X148l
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10622"; a="330266903"
X-IronPort-AV: E=Sophos;i="5.97,301,1669104000"; 
   d="scan'208";a="330266903"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Feb 2023 21:01:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10622"; a="915537052"
X-IronPort-AV: E=Sophos;i="5.97,301,1669104000"; 
   d="scan'208";a="915537052"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 15 Feb 2023 21:01:16 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pSWOR-000A1e-2x;
	Thu, 16 Feb 2023 05:01:15 +0000
Date: Thu, 16 Feb 2023 13:00:22 +0800
From: kernel test robot <lkp@intel.com>
To: "Joel Fernandes (Google)" <joel@joelfernandes.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jfern:timers/dyn_hrtimer 2/2] kernel/time/hrtimer.c:527: undefined
 reference to `tick_sched_timer'
Message-ID: <202302161249.KUlfISdr-lkp@intel.com>
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
config: nios2-defconfig (https://download.01.org/0day-ci/archive/20230216/202302161249.KUlfISdr-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/jfern/linux.git/commit/?id=6c6c32845db34e033bf1818442388e4287074f1e
        git remote add jfern https://git.kernel.org/pub/scm/linux/kernel/git/jfern/linux.git
        git fetch --no-tags jfern timers/dyn_hrtimer
        git checkout 6c6c32845db34e033bf1818442388e4287074f1e
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=nios2 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=nios2 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302161249.KUlfISdr-lkp@intel.com/

All errors (new ones prefixed by >>):

   nios2-linux-ld: kernel/time/hrtimer.o: in function `__hrtimer_next_event_base':
>> kernel/time/hrtimer.c:527: undefined reference to `tick_sched_timer'
>> nios2-linux-ld: kernel/time/hrtimer.c:527: undefined reference to `tick_sched_timer'


vim +527 kernel/time/hrtimer.c

   503	
   504	static ktime_t __hrtimer_next_event_base(struct hrtimer_cpu_base *cpu_base,
   505						 const struct hrtimer *exclude,
   506						 unsigned int active,
   507						 ktime_t expires_next)
   508	{
   509		struct hrtimer_clock_base *base;
   510		ktime_t expires;
   511	
   512		for_each_active_base(base, cpu_base, active) {
   513			struct timerqueue_node *next;
   514			struct hrtimer *timer;
   515	
   516			next = timerqueue_getnext(&base->active);
   517			timer = container_of(next, struct hrtimer, node);
   518			if (timer == exclude) {
   519				/* Get to the next timer in the queue. */
   520				next = timerqueue_iterate_next(next);
   521				if (!next)
   522					continue;
   523	
   524				timer = container_of(next, struct hrtimer, node);
   525			}
   526	
 > 527			if (timer->function != tick_sched_timer)
   528				continue;
   529	
   530			expires = ktime_sub(hrtimer_get_expires(timer), base->offset);
   531			trace_printk("Callback: %ps exp: %lld\n", timer->function, expires);
   532	
   533			if (expires < expires_next) {
   534				expires_next = expires;
   535	
   536				/* Skip cpu_base update if a timer is being excluded. */
   537				if (exclude)
   538					continue;
   539	
   540				if (timer->is_soft)
   541					cpu_base->softirq_next_timer = timer;
   542				else
   543					cpu_base->next_timer = timer;
   544			}
   545		}
   546		/*
   547		 * clock_was_set() might have changed base->offset of any of
   548		 * the clock bases so the result might be negative. Fix it up
   549		 * to prevent a false positive in clockevents_program_event().
   550		 */
   551		if (expires_next < 0)
   552			expires_next = 0;
   553		return expires_next;
   554	}
   555	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
