Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E75DE567B
	for <oe-kbuild-all@lists.linux.dev>; Tue,  4 Jul 2023 15:32:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1688484721; x=1720020721;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=DLDteazmp3KGZJV9V9I3X2v7AZPRNofhZanrbbITxVI=;
  b=KKxTrbMEn+j3XK+NXef1v7Ir/4i24h6N6hDjNpbuMVRdIIKFXlRqOfKD
   +39zK4g0yAusw1lyt2+u9yL02+VavZkQpiXCbNBZSNM/xk+lqCfj84GBI
   mdoio41AMhd8iymwA0Q2erDxMPc/Ny7aRT/zhes2y9Pltl3OLzmqRauVl
   EjWBseA9KkJFhu/3eU16UmVHzu3L4wWkVisN3G7gp5tdTRpbK+sNsj8lK
   TvgQaMml+FpAGtxWQS/wQ5m+tvgro8PWFzI+2nPvW/Ej+73LBu+dzZA5e
   1E69p7bVSRmyLMfZcEYILRpDCwPRtxKcXnhj7Ey8UF9ZtzOqSDu6aqWXa
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10760"; a="360623273"
X-IronPort-AV: E=Sophos;i="6.01,181,1684825200"; 
   d="scan'208";a="360623273"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jul 2023 08:31:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10760"; a="784265056"
X-IronPort-AV: E=Sophos;i="6.01,181,1684825200"; 
   d="scan'208";a="784265056"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 04 Jul 2023 08:31:58 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qGi0T-000IKZ-2J;
	Tue, 04 Jul 2023 15:31:57 +0000
Date: Tue, 4 Jul 2023 23:31:37 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com,
	Guenter Roeck <groeck@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-4.14 2/4] kernel/time/tick-sched.c:1244:6:
 warning: no previous prototype for 'tick_nohz_hres_to_lres'
Message-ID: <202307042306.MNev9yb6-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-4.14
head:   4d89af6ae49b62b28be9c5bacc14997e409188d3
commit: cdc5027eae87be4fbce2aa7892bdd12b38388f63 [2/4] CHROMIUM: hrtimer: Add a sysctl to lower resolution of timers
config: arc-randconfig-r032-20230704 (https://download.01.org/0day-ci/archive/20230704/202307042306.MNev9yb6-lkp@intel.com/config)
compiler: arceb-elf-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230704/202307042306.MNev9yb6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307042306.MNev9yb6-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/workqueue.h:9,
                    from include/linux/srcu.h:34,
                    from include/linux/notifier.h:16,
                    from include/linux/memory_hotplug.h:7,
                    from include/linux/mmzone.h:913,
                    from include/linux/gfp.h:6,
                    from include/linux/idr.h:16,
                    from include/linux/kernfs.h:14,
                    from include/linux/sysfs.h:16,
                    from include/linux/kobject.h:21,
                    from include/linux/device.h:17,
                    from include/linux/node.h:18,
                    from include/linux/cpu.h:17,
                    from kernel/time/tick-sched.c:14:
   include/linux/timer.h: In function 'timer_setup':
   include/linux/timer.h:179:30: warning: cast between incompatible function types from 'void (*)(struct timer_list *)' to 'void (*)(long unsigned int)' [-Wcast-function-type]
     179 |         __setup_timer(timer, (TIMER_FUNC_TYPE)callback,
         |                              ^
   include/linux/timer.h:144:39: note: in definition of macro '__setup_timer'
     144 |                 (_timer)->function = (_fn);                             \
         |                                       ^~~
   kernel/time/tick-sched.c: At top level:
>> kernel/time/tick-sched.c:1244:6: warning: no previous prototype for 'tick_nohz_hres_to_lres' [-Wmissing-prototypes]
    1244 | void tick_nohz_hres_to_lres(void)
         |      ^~~~~~~~~~~~~~~~~~~~~~


vim +/tick_nohz_hres_to_lres +1244 kernel/time/tick-sched.c

  1240	
  1241	/**
  1242	 * tick_nohz_hres_to_lres - switch from Highres to Lowres
  1243	 */
> 1244	void tick_nohz_hres_to_lres(void)
  1245	{
  1246		ktime_t next_tick;
  1247		struct tick_sched *ts = this_cpu_ptr(&tick_cpu_sched);
  1248		struct tick_device *td = this_cpu_ptr(&tick_cpu_device);
  1249	
  1250		if (WARN_ON(ts->nohz_mode != NOHZ_MODE_HIGHRES))
  1251			return;
  1252	
  1253		WARN_ON(td->mode != TICKDEV_MODE_ONESHOT);
  1254		WARN_ON(clockevent_get_state(td->evtdev) != CLOCK_EVT_STATE_ONESHOT);
  1255		td->evtdev->event_handler = tick_nohz_handler;
  1256	
  1257		hrtimer_cancel(&ts->sched_timer);
  1258		hrtimer_set_expires(&ts->sched_timer, ts->last_tick);
  1259	
  1260		/* Forward the time to expire in the future */
  1261		hrtimer_forward(&ts->sched_timer, ktime_get(), TICK_NSEC);
  1262		next_tick = hrtimer_get_expires(&ts->sched_timer);
  1263	
  1264		tick_program_event(next_tick, 1);
  1265		tick_nohz_activate(ts, NOHZ_MODE_LOWRES);
  1266	
  1267		if (ts->tick_stopped)
  1268			ts->next_tick = next_tick;
  1269	}
  1270	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
