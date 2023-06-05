Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52A39AD2E
	for <oe-kbuild-all@lists.linux.dev>; Mon,  5 Jun 2023 18:15:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685988943; x=1717524943;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Iq/6l2MKXd/312oLRMbvL1xATJY/aiiiJ78uMwOqNpw=;
  b=Wakp7DDE2ZaKsdPTHzObAd20klNIVQIK9C60Ww3CQdK5IeO+be45Dk3C
   ZBFRHuhbrAm+IzaTmiiwnQfm0jXOVhcdG7lRRovqy9WbtsxK5vXyLxogm
   eWthaq4rnJbzMxMFrZxfkWBIc6PBKNlMiRbQKWhTfU3D7W6udyfnJNntH
   /uHU4jXKbRDXcUig6wYnpagw02zR/ZXOgd1Wi9UCCeMm0oi3A4A2xGpvx
   hHMSafkwfcA0yOep8BHx4pR+R3hNejuHbb9wWnFxnSgfd5ARbDTRL0i/c
   qgEEepBb87FE0MCNfMvtmy5a2bBNJfdl+Bve54A0O0A92immEcVk+VH1U
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10732"; a="355295413"
X-IronPort-AV: E=Sophos;i="6.00,218,1681196400"; 
   d="scan'208";a="355295413"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jun 2023 11:15:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10732"; a="778658997"
X-IronPort-AV: E=Sophos;i="6.00,218,1681196400"; 
   d="scan'208";a="778658997"
Received: from lkp-server01.sh.intel.com (HELO 15ab08e44a81) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 05 Jun 2023 11:15:17 -0700
Received: from kbuild by 15ab08e44a81 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q6Ejc-0004Kf-2V;
	Mon, 05 Jun 2023 18:15:16 +0000
Date: Tue, 6 Jun 2023 02:14:23 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	x86@kernel.org
Subject: [tip:timers/core 19/21] kernel/time/posix-timers.c:385:46: error:
 'TICK_NSECS' undeclared; did you mean 'TICK_NSEC'?
Message-ID: <202306060207.ZANMLerd-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git timers/core
head:   1263a2a9d71bac5ffabf9603c36e36cb6edbcdcf
commit: 63dede13d09850a8ace210f8e4227ac5a6b309ae [19/21] posix-timers: Clarify posix_timer_fn() comments
config: powerpc-allnoconfig (https://download.01.org/0day-ci/archive/20230606/202306060207.ZANMLerd-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 12.3.0
reproduce (this is a W=1 build):
        mkdir -p ~/bin
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git/commit/?id=63dede13d09850a8ace210f8e4227ac5a6b309ae
        git remote add tip https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git
        git fetch --no-tags tip timers/core
        git checkout 63dede13d09850a8ace210f8e4227ac5a6b309ae
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.3.0 ~/bin/make.cross W=1 O=build_dir ARCH=powerpc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.3.0 ~/bin/make.cross W=1 O=build_dir ARCH=powerpc SHELL=/bin/bash kernel/time/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306060207.ZANMLerd-lkp@intel.com/

All errors (new ones prefixed by >>):

   kernel/time/posix-timers.c: In function 'posix_timer_fn':
>> kernel/time/posix-timers.c:385:46: error: 'TICK_NSECS' undeclared (first use in this function); did you mean 'TICK_NSEC'?
     385 |                                 ktime_t kj = TICK_NSECS;
         |                                              ^~~~~~~~~~
         |                                              TICK_NSEC
   kernel/time/posix-timers.c:385:46: note: each undeclared identifier is reported only once for each function it appears in


vim +385 kernel/time/posix-timers.c

   327	
   328	/*
   329	 * This function gets called when a POSIX.1b interval timer expires from
   330	 * the HRTIMER interrupt (soft interrupt on RT kernels).
   331	 *
   332	 * Handles CLOCK_REALTIME, CLOCK_MONOTONIC, CLOCK_BOOTTIME and CLOCK_TAI
   333	 * based timers.
   334	 */
   335	static enum hrtimer_restart posix_timer_fn(struct hrtimer *timer)
   336	{
   337		struct k_itimer *timr;
   338		unsigned long flags;
   339		int si_private = 0;
   340		enum hrtimer_restart ret = HRTIMER_NORESTART;
   341	
   342		timr = container_of(timer, struct k_itimer, it.real.timer);
   343		spin_lock_irqsave(&timr->it_lock, flags);
   344	
   345		timr->it_active = 0;
   346		if (timr->it_interval != 0)
   347			si_private = ++timr->it_requeue_pending;
   348	
   349		if (posix_timer_event(timr, si_private)) {
   350			/*
   351			 * The signal was not queued due to SIG_IGN. As a
   352			 * consequence the timer is not going to be rearmed from
   353			 * the signal delivery path. But as a real signal handler
   354			 * can be installed later the timer must be rearmed here.
   355			 */
   356			if (timr->it_interval != 0) {
   357				ktime_t now = hrtimer_cb_get_time(timer);
   358	
   359				/*
   360				 * FIXME: What we really want, is to stop this
   361				 * timer completely and restart it in case the
   362				 * SIG_IGN is removed. This is a non trivial
   363				 * change to the signal handling code.
   364				 *
   365				 * For now let timers with an interval less than a
   366				 * jiffie expire every jiffie and recheck for a
   367				 * valid signal handler.
   368				 *
   369				 * This avoids interrupt starvation in case of a
   370				 * very small interval, which would expire the
   371				 * timer immediately again.
   372				 *
   373				 * Moving now ahead of time by one jiffie tricks
   374				 * hrtimer_forward() to expire the timer later,
   375				 * while it still maintains the overrun accuracy
   376				 * for the price of a slight inconsistency in the
   377				 * timer_gettime() case. This is at least better
   378				 * than a timer storm.
   379				 *
   380				 * Only required when high resolution timers are
   381				 * enabled as the periodic tick based timers are
   382				 * automatically aligned to the next tick.
   383				 */
   384				if (IS_ENABLED(CONFIG_HIGHRES_TIMERS)) {
 > 385					ktime_t kj = TICK_NSECS;
   386	
   387					if (timr->it_interval < kj)
   388						now = ktime_add(now, kj);
   389				}
   390	
   391				timr->it_overrun += hrtimer_forward(timer, now, timr->it_interval);
   392				ret = HRTIMER_RESTART;
   393				++timr->it_requeue_pending;
   394				timr->it_active = 1;
   395			}
   396		}
   397	
   398		unlock_timer(timr, flags);
   399		return ret;
   400	}
   401	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
