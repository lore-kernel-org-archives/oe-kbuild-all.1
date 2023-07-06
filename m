Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C02DB63BA
	for <oe-kbuild-all@lists.linux.dev>; Thu,  6 Jul 2023 22:41:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1688683306; x=1720219306;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=OsvN0bzqwmnB24bz7ypxnl2ETr+cco+I5Dzx3gjaol8=;
  b=MxXxXqCle3PN9Go1T2btFxYonqoPzJh1GYSd4f/rAp4xpWlHAMeZ8U9w
   mOD4hTTce3alWzJV4PmLFQkPqZ1E+PEM4XgSBkzFrRbXBgrvmTKzGmTwL
   6Pi92BZH3hBf70qOfaf9CdLoOaFA0M8sapBtpstIP7iG11cKJgFMj40A7
   V1jc2kikTlwnPBOEkxu3blk3RUSOG4EoqEEZs9v2CIMX2ZAaSmBWVJJyB
   4YlbPkCasFSjKeyfWoD43YVvsdA/C7ByGmE+6rNcwWyCp7I8lwq2qBlm2
   H1NOS4zDyIBnsqVJOcWUL7JCMCkD2Eg2KNxbsk8/pPgGE2c5+SEi+QLrr
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10763"; a="362611026"
X-IronPort-AV: E=Sophos;i="6.01,187,1684825200"; 
   d="scan'208";a="362611026"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jul 2023 15:41:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10763"; a="809818569"
X-IronPort-AV: E=Sophos;i="6.01,187,1684825200"; 
   d="scan'208";a="809818569"
Received: from lkp-server01.sh.intel.com (HELO c544d7fc5005) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 06 Jul 2023 15:41:44 -0700
Received: from kbuild by c544d7fc5005 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qHXfT-0001ao-2N;
	Thu, 06 Jul 2023 22:41:43 +0000
Date: Fri, 7 Jul 2023 06:40:44 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com,
	Guenter Roeck <groeck@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-5.15 8/19] kernel/time/tick-sched.c:1367:6:
 warning: no previous prototype for 'tick_nohz_hres_to_lres'
Message-ID: <202307070650.otnLfv7i-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-5.15
head:   1399e15df0015b10457b746f91a91c16a8d6274c
commit: b9937f09c9e0ab857c06ec9360be17f860be5d42 [8/19] CHROMIUM: hrtimer: Add a sysctl to lower resolution of timers
config: arc-randconfig-r043-20230707 (https://download.01.org/0day-ci/archive/20230707/202307070650.otnLfv7i-lkp@intel.com/config)
compiler: arc-elf-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230707/202307070650.otnLfv7i-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307070650.otnLfv7i-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/time/tick-sched.c:1367:6: warning: no previous prototype for 'tick_nohz_hres_to_lres' [-Wmissing-prototypes]
    1367 | void tick_nohz_hres_to_lres(void)
         |      ^~~~~~~~~~~~~~~~~~~~~~


vim +/tick_nohz_hres_to_lres +1367 kernel/time/tick-sched.c

  1363	
  1364	/**
  1365	 * tick_nohz_hres_to_lres - switch from Highres to Lowres
  1366	 */
> 1367	void tick_nohz_hres_to_lres(void)
  1368	{
  1369		ktime_t next_tick;
  1370		struct tick_sched *ts = this_cpu_ptr(&tick_cpu_sched);
  1371		struct tick_device *td = this_cpu_ptr(&tick_cpu_device);
  1372	
  1373		if (WARN_ON(ts->nohz_mode != NOHZ_MODE_HIGHRES))
  1374			return;
  1375	
  1376		WARN_ON(td->mode != TICKDEV_MODE_ONESHOT);
  1377		WARN_ON(clockevent_get_state(td->evtdev) != CLOCK_EVT_STATE_ONESHOT);
  1378		td->evtdev->event_handler = tick_nohz_handler;
  1379	
  1380		hrtimer_cancel(&ts->sched_timer);
  1381		hrtimer_set_expires(&ts->sched_timer, ts->last_tick);
  1382	
  1383		/* Forward the time to expire in the future */
  1384		hrtimer_forward(&ts->sched_timer, ktime_get(), TICK_NSEC);
  1385		next_tick = hrtimer_get_expires(&ts->sched_timer);
  1386	
  1387		tick_program_event(next_tick, 1);
  1388		tick_nohz_activate(ts, NOHZ_MODE_LOWRES);
  1389	
  1390		if (ts->tick_stopped)
  1391			ts->next_tick = next_tick;
  1392	}
  1393	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
