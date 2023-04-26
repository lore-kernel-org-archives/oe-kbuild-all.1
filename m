Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FC1D6FC7
	for <oe-kbuild-all@lists.linux.dev>; Wed, 26 Apr 2023 21:11:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682543464; x=1714079464;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=oKqhfPsFxDT1Ku6RIfbc+jVaWCNZ6jnFalmbbyxsJS4=;
  b=CuIr83he3q1hXhrRdd98RUsrm+R/77Q0XvkHfaL7HNRk7ZPK2OTYbCer
   c/2Oa/6kKBgjMgrk1tq9G60fszK2BnlavMm4++UmCpPwpMnuJluMXaBPC
   7BAtGdWKUpzHvHH5mVvGnltfi98gVapuoF6c6x0I8J7x9hPtGM3ntJ9H4
   SDT27h4wHalga5DnU6CuVtW6PgeEWz45azVj/UCIfFrOqyXWTaeZ3Ewau
   4hBTDJwvZEORHcy2uElMGSDSifsdG38xDw5utc1PNC3uVrTXu/eksPr+H
   0Agfs0HCAv/WGKADcrDOlnIoDTsi+g7CwvpncQA5Og+/WGNkPEJSsAyit
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10692"; a="344685173"
X-IronPort-AV: E=Sophos;i="5.99,229,1677571200"; 
   d="scan'208";a="344685173"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Apr 2023 14:09:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10692"; a="724611729"
X-IronPort-AV: E=Sophos;i="5.99,229,1677571200"; 
   d="scan'208";a="724611729"
Received: from lkp-server01.sh.intel.com (HELO 041f065c1b1b) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 26 Apr 2023 14:09:53 -0700
Received: from kbuild by 041f065c1b1b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1prmOe-0000Wa-2e;
	Wed, 26 Apr 2023 21:09:52 +0000
Date: Thu, 27 Apr 2023 05:09:48 +0800
From: kernel test robot <lkp@intel.com>
To: Derek Basehore <dbasehore@chromium.org>
Cc: oe-kbuild-all@lists.linux.dev, Guenter Roeck <groeck@chromium.org>,
	Rajneesh Bhardwaj <rajneesh.bhardwaj@intel.com>,
	Furquan Shaikh <furquan@chromium.org>,
	Justin TerAvest <teravest@chromium.org>
Subject: [jsarha:topic/cros-sof-v4.19 699/6555]
 kernel/time/tick-common.c:510:5: warning: no previous prototype for
 'tick_set_freeze_event'
Message-ID: <202304270506.2EgXWRG6-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Derek,

FYI, the error/warning still remains.

tree:   https://github.com/jsarha/linux topic/cros-sof-v4.19
head:   d7a3e91d8d16d1ef8653deec5a1fffc4de034a0c
commit: 63c68db40b45828101f078b9a2569a01829c1ce0 [699/6555] FROMLIST: BACKPORT: tick: Add freeze timer events
config: x86_64-randconfig-a013 (https://download.01.org/0day-ci/archive/20230427/202304270506.2EgXWRG6-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build):
        # https://github.com/jsarha/linux/commit/63c68db40b45828101f078b9a2569a01829c1ce0
        git remote add jsarha https://github.com/jsarha/linux
        git fetch --no-tags jsarha topic/cros-sof-v4.19
        git checkout 63c68db40b45828101f078b9a2569a01829c1ce0
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=x86_64 olddefconfig
        make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash drivers/gpu/drm/ kernel/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304270506.2EgXWRG6-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/time/tick-common.c:510:5: warning: no previous prototype for 'tick_set_freeze_event' [-Wmissing-prototypes]
     510 | int tick_set_freeze_event(int cpu, ktime_t delta)
         |     ^~~~~~~~~~~~~~~~~~~~~
>> kernel/time/tick-common.c:560:5: warning: no previous prototype for 'tick_clear_freeze_event' [-Wmissing-prototypes]
     560 | int tick_clear_freeze_event(int cpu)
         |     ^~~~~~~~~~~~~~~~~~~~~~~


vim +/tick_set_freeze_event +510 kernel/time/tick-common.c

   501	
   502	/**
   503	 * tick_set_freeze_event - Set timer to wake up the CPU from freeze.
   504	 *
   505	 * @cpu:	CPU to set the clock event for
   506	 * @delta:	time to wait before waking the CPU
   507	 *
   508	 * Returns 0 on success and -EERROR on failure.
   509	 */
 > 510	int tick_set_freeze_event(int cpu, ktime_t delta)
   511	{
   512		struct clock_event_device *dev = per_cpu(tick_cpu_device, cpu).evtdev;
   513		u64 delta_ns;
   514		int ret;
   515	
   516		if (!dev->set_next_event ||
   517		    !(dev->features & CLOCK_EVT_FEAT_FREEZE_NONSTOP)) {
   518			printk_deferred(KERN_WARNING
   519					"[%s] unsupported by clock event device\n",
   520					__func__);
   521			return -EPERM;
   522		}
   523	
   524		if (!clockevent_state_shutdown(dev)) {
   525			printk_deferred(KERN_WARNING
   526					"[%s] clock event device in use\n",
   527					__func__);
   528			return -EBUSY;
   529		}
   530	
   531		delta_ns = ktime_to_ns(delta);
   532		if (delta_ns > dev->max_delta_ns || delta_ns < dev->min_delta_ns) {
   533			printk_deferred(KERN_WARNING
   534					"[%s] %lluns outside range: [%lluns, %lluns]\n",
   535					__func__, delta_ns, dev->min_delta_ns,
   536					dev->max_delta_ns);
   537			return -ERANGE;
   538		}
   539		clockevents_tick_resume(dev);
   540		clockevents_switch_state(dev, CLOCK_EVT_STATE_ONESHOT);
   541		ret = dev->set_next_event((delta_ns * dev->mult) >> dev->shift, dev);
   542		if (ret < 0) {
   543			printk_deferred(KERN_WARNING
   544					"Failed to program freeze event\n");
   545			clockevents_shutdown(dev);
   546		}
   547	
   548		return ret;
   549	}
   550	EXPORT_SYMBOL_GPL(tick_set_freeze_event);
   551	
   552	/**
   553	 * tick_clear_freeze_event - Shuts down the clock device after programming a
   554	 * freeze event.
   555	 *
   556	 * @cpu:	CPU to shutdown the clock device for
   557	 *
   558	 * Returns 0 on success and -EERROR otherwise.
   559	 */
 > 560	int tick_clear_freeze_event(int cpu)
   561	{
   562		struct clock_event_device *dev = per_cpu(tick_cpu_device, cpu).evtdev;
   563		int ret;
   564	
   565		if (!(dev && dev->event_expired))
   566			return 0;
   567	
   568		/* Must be called in oneshot mode and while
   569		 * timekeeping is suspended */
   570		if (!(clockevent_state_oneshot(dev) && timekeeping_suspended))
   571			return 0;
   572	
   573		ret = dev->event_expired(dev);
   574		clockevents_shutdown(dev);
   575		return ret;
   576	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
