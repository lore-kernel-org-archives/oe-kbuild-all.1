Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 803761FA3
	for <oe-kbuild-all@lists.linux.dev>; Sat, 16 Sep 2023 08:26:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694852804; x=1726388804;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=L5PfTibJ2xl4gcHOLpqYOB4A4rhuMMtsy3JyFibK2lI=;
  b=PGAS0TFvk0yKshsPcgo+QRH9sM2n7zfamA42coyicPfHYgFU55yPVcxg
   T+zvEzP08+nNRpsBqPzVGt5YcoQ00l4uUVsvH4Az+WmyHIkN6A4Ju9SS6
   vkdppPyAL1b8Hvt3HF3d3rTGFTClQS+hKHkBhBk1uSl28ed//hLdOKHHT
   obqnrRwasHVmDH2frqIFqqY22+NuuLEuZW2AgZ9kAhF8oXGos50WuHG6E
   iXTqlLHZ5cZtOH4LIPKpiWSCarXPE0i1ww73qIr3Pz8rQo0KuVT/11ffi
   ldGDm6a+lAiUnfHu9AwMSLXTTi1lfbWuL5/OSGBmW0+/xdFrkCB+dWeYb
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10834"; a="382129991"
X-IronPort-AV: E=Sophos;i="6.02,151,1688454000"; 
   d="scan'208";a="382129991"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2023 01:26:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10834"; a="860428545"
X-IronPort-AV: E=Sophos;i="6.02,151,1688454000"; 
   d="scan'208";a="860428545"
Received: from lkp-server02.sh.intel.com (HELO 9ef86b2655e5) ([10.239.97.151])
  by fmsmga002.fm.intel.com with ESMTP; 16 Sep 2023 01:26:42 -0700
Received: from kbuild by 9ef86b2655e5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qhQdU-00045s-0q;
	Sat, 16 Sep 2023 08:26:40 +0000
Date: Sat, 16 Sep 2023 16:25:58 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:pr/641 3285/25020]
 drivers/input/touchscreen/vtl/vtl_ts.c:160 vtl_report_xy_coord() warn:
 inconsistent indenting
Message-ID: <202309161607.VV256Mms-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Freescale/linux-fslc pr/641
head:   ba2847ffebda28ba7be1b96bb506bfe5b67c856e
commit: 5fd1a9756fe0090bd795889b135e4dfb78141f0a [3285/25020] MLK-13244 input: touchscreen: add support for vtl touchscreen
config: i386-randconfig-141-20230911 (https://download.01.org/0day-ci/archive/20230916/202309161607.VV256Mms-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce: (https://download.01.org/0day-ci/archive/20230916/202309161607.VV256Mms-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309161607.VV256Mms-lkp@intel.com/

smatch warnings:
drivers/input/touchscreen/vtl/vtl_ts.c:160 vtl_report_xy_coord() warn: inconsistent indenting
drivers/input/touchscreen/vtl/vtl_ts.c:177 vtl_report_xy_coord() warn: curly braces intended?
drivers/input/touchscreen/vtl/vtl_ts.c:298 vtl_ts_remove() error: don't call input_free_device() after input_unregister_device()

vim +160 drivers/input/touchscreen/vtl/vtl_ts.c

   133	
   134	static void vtl_report_xy_coord(struct input_dev *input_dev,
   135					union ts_xy_data *xy_data,
   136					unsigned char touch_point_number)
   137	{
   138		struct ts_info *ts;
   139		int id;
   140		int sync;
   141		int x, y;
   142		unsigned int press;
   143		static unsigned int release;
   144	
   145		ts = pg_ts;
   146		DEBUG();
   147	
   148		/* report points */
   149		sync = 0;  press = 0;
   150		for (id = 0; id < touch_point_number; id++) {
   151			if ((xy_data->point[id].xhi != 0xFF) &&
   152			    (xy_data->point[id].yhi != 0xFF) &&
   153			   ((xy_data->point[id].status == 1) ||
   154			    (xy_data->point[id].status == 2))) {
   155				x = (xy_data->point[id].xhi<<4) |
   156				    (xy_data->point[id].xlo&0xF);
   157				y = (xy_data->point[id].yhi<<4) |
   158				    (xy_data->point[id].ylo&0xF);
   159	
 > 160			if (ts->config_info.exchange_x_y_flag)
   161				swap(x, y);
   162	
   163			if (ts->config_info.revert_x_flag)
   164				x = ts->config_info.screen_max_x - x;
   165	
   166			if (ts->config_info.revert_y_flag)
   167				y = ts->config_info.screen_max_y - y;
   168	#ifndef FORCE_SINGLE_EVENT
   169				input_mt_slot(input_dev, xy_data->point[id].id - 1);
   170				input_mt_report_slot_state(input_dev,
   171							   MT_TOOL_FINGER, true);
   172				input_report_abs(input_dev, ABS_MT_POSITION_X, x);
   173				input_report_abs(input_dev, ABS_MT_POSITION_Y, y);
   174				input_report_abs(input_dev, ABS_MT_TOUCH_MAJOR, 30);
   175				input_report_abs(input_dev, ABS_MT_WIDTH_MAJOR, 128);
   176	#else
 > 177				input_report_abs(input_dev, ABS_X, x);
   178				input_report_abs(input_dev, ABS_Y, y);
   179				input_report_key(input_dev, BTN_TOUCH, 1);
   180				input_report_abs(input_dev, ABS_PRESSURE, 1);
   181	#endif
   182				sync = 1;
   183				press |= 0x01 << (xy_data->point[id].id - 1);
   184			}
   185		}
   186	
   187		release &= (release ^ press); /*release point flag */
   188		for (id = 0; id < touch_point_number; id++) {
   189			if (release & (0x01 << id)) {
   190	#ifndef FORCE_SINGLE_EVENT
   191				input_mt_slot(input_dev, id);
   192				input_mt_report_slot_state(input_dev,
   193							   MT_TOOL_FINGER, false);
   194	#else
   195				input_report_key(input_dev, BTN_TOUCH, 0);
   196				input_report_abs(input_dev, ABS_PRESSURE, 0);
   197	#endif
   198				sync = 1;
   199			}
   200	
   201		}
   202		release = press;
   203	
   204		if (sync)
   205			input_sync(input_dev);
   206	}
   207	
   208	static void vtl_ts_workfunc(struct work_struct *work)
   209	{
   210	
   211		union ts_xy_data *xy_data;
   212		struct input_dev *input_dev;
   213		unsigned char touch_point_number;
   214	
   215		DEBUG();
   216	
   217		input_dev = pg_ts->driver->input_dev;
   218		touch_point_number = pg_ts->config_info.touch_point_number;
   219	
   220		xy_data = vtl_read_xy_data(pg_ts);
   221		if (xy_data != NULL)
   222			vtl_report_xy_coord(input_dev, xy_data, touch_point_number);
   223		else
   224			pr_err("____xy_data error___\n");
   225	}
   226	
   227	#ifdef CONFIG_PM_SLEEP
   228	int vtl_ts_suspend(struct device *dev)
   229	{
   230		struct ts_info *ts;
   231	
   232		ts = pg_ts;
   233		DEBUG();
   234	
   235		disable_irq(ts->config_info.irq_number);
   236		cancel_work_sync(&ts->driver->event_work);
   237	
   238		return 0;
   239	}
   240	
   241	int vtl_ts_resume(struct device *dev)
   242	{
   243		struct ts_info *ts;
   244	
   245		ts = pg_ts;
   246		DEBUG();
   247	
   248		/* Hardware reset */
   249		vtl_ts_hw_reset();
   250		enable_irq(ts->config_info.irq_number);
   251	
   252		return 0;
   253	}
   254	#endif
   255	
   256	#ifdef CONFIG_HAS_EARLYSUSPEND
   257	static void vtl_ts_early_suspend(struct early_suspend *handler)
   258	{
   259		struct ts_info *ts;
   260	
   261		ts = pg_ts;
   262		DEBUG();
   263	
   264		vtl_ts_suspend(ts->driver->client, PMSG_SUSPEND);
   265	}
   266	
   267	static void vtl_ts_early_resume(struct early_suspend *handler)
   268	{
   269		struct ts_info *ts;
   270	
   271		ts = pg_ts;
   272		DEBUG();
   273	
   274		vtl_ts_resume(ts->driver->client);
   275	}
   276	#endif
   277	
   278	int  vtl_ts_remove(struct i2c_client *client)
   279	{
   280		struct ts_info *ts;
   281	
   282		ts = pg_ts;
   283		DEBUG();
   284	
   285		/* Driver clean up */
   286	
   287		free_irq(ts->config_info.irq_number, ts);
   288		vtl_ts_free_gpio();
   289	
   290	#ifdef CONFIG_HAS_EARLYSUSPEND
   291		unregister_early_suspend(&ts->driver->early_suspend);
   292	#endif
   293	
   294		cancel_work_sync(&ts->driver->event_work);
   295		destroy_workqueue(ts->driver->workqueue);
   296	
   297		input_unregister_device(ts->driver->input_dev);
 > 298		input_free_device(ts->driver->input_dev);
   299	
   300		if (ts->driver->proc_entry != NULL)
   301			remove_proc_entry(DRIVER_NAME, NULL);
   302	
   303		return 0;
   304	}
   305	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
