Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D406D10FA
	for <oe-kbuild-all@lists.linux.dev>; Thu, 31 Aug 2023 01:44:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693446278; x=1724982278;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=J5v1j5nrqXkTwsmhLjpn8TlslPAX4+lKFjxr291q5Ew=;
  b=OSPh8K1s4yAe4PW0XBEesQPuM33Ng8NinskoJcfOvwAJJJrJc2p7arsu
   cUYHfYwKedWkDBNrBQ4MerB7gAAhzKJTeC9rYmGcNA/acYtbUcWujLit8
   ic5tIEJefnO6dqjLAXUzkl4rR0aWXeAPJMvFi+uNWgtPI8rQ96LOjGEgw
   pld/ZSqkVMkPBBZZYS5EaWuiC380dDGZcd3ayhoNkbqnlHyLI4AMgevhs
   9P811ByjvE3knm7tqvmd7IROF2yvPuVlD4c7RqGVahFsus02y8KjR04j8
   SYz6N3b2Gr5vrRPeywSz/gjLc3TELoP8WgNzRllyqzUi/AO7nb+oI1hVw
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10818"; a="379540179"
X-IronPort-AV: E=Sophos;i="6.02,215,1688454000"; 
   d="scan'208";a="379540179"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Aug 2023 18:44:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10818"; a="739293322"
X-IronPort-AV: E=Sophos;i="6.02,215,1688454000"; 
   d="scan'208";a="739293322"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by orsmga002.jf.intel.com with ESMTP; 30 Aug 2023 18:44:36 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qbWjX-000ASX-0s;
	Thu, 31 Aug 2023 01:44:32 +0000
Date: Thu, 31 Aug 2023 09:43:52 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:pr/639 3285/24603]
 drivers/input/touchscreen/vtl/vtl_ts.c:80:6: warning: no previous prototype
 for function 'vtl_ts_free_gpio'
Message-ID: <202308310937.Nx9GmCBa-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Alejandro,

FYI, the error/warning still remains.

tree:   https://github.com/Freescale/linux-fslc pr/639
head:   857fbf7cebaba3b1ffccc558deee1d13ac0e11d7
commit: 5fd1a9756fe0090bd795889b135e4dfb78141f0a [3285/24603] MLK-13244 input: touchscreen: add support for vtl touchscreen
config: hexagon-randconfig-r012-20230831 (https://download.01.org/0day-ci/archive/20230831/202308310937.Nx9GmCBa-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230831/202308310937.Nx9GmCBa-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308310937.Nx9GmCBa-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/input/touchscreen/vtl/vtl_ts.c:65:17: warning: variable 'dev' set but not used [-Wunused-but-set-variable]
      65 |         struct device *dev;
         |                        ^
>> drivers/input/touchscreen/vtl/vtl_ts.c:80:6: warning: no previous prototype for function 'vtl_ts_free_gpio' [-Wmissing-prototypes]
      80 | void vtl_ts_free_gpio(void)
         |      ^
   drivers/input/touchscreen/vtl/vtl_ts.c:80:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      80 | void vtl_ts_free_gpio(void)
         | ^
         | static 
>> drivers/input/touchscreen/vtl/vtl_ts.c:90:6: warning: no previous prototype for function 'vtl_ts_hw_reset' [-Wmissing-prototypes]
      90 | void vtl_ts_hw_reset(void)
         |      ^
   drivers/input/touchscreen/vtl/vtl_ts.c:90:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      90 | void vtl_ts_hw_reset(void)
         | ^
         | static 
>> drivers/input/touchscreen/vtl/vtl_ts.c:278:6: warning: no previous prototype for function 'vtl_ts_remove' [-Wmissing-prototypes]
     278 | int  vtl_ts_remove(struct i2c_client *client)
         |      ^
   drivers/input/touchscreen/vtl/vtl_ts.c:278:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     278 | int  vtl_ts_remove(struct i2c_client *client)
         | ^
         | static 
>> drivers/input/touchscreen/vtl/vtl_ts.c:366:5: warning: no previous prototype for function 'ct36x_test_tp' [-Wmissing-prototypes]
     366 | int ct36x_test_tp(struct i2c_client *client)
         |     ^
   drivers/input/touchscreen/vtl/vtl_ts.c:366:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     366 | int ct36x_test_tp(struct i2c_client *client)
         | ^
         | static 
>> drivers/input/touchscreen/vtl/vtl_ts.c:382:5: warning: no previous prototype for function 'vtl_ts_probe' [-Wmissing-prototypes]
     382 | int vtl_ts_probe(struct i2c_client *client, const struct i2c_device_id *id)
         |     ^
   drivers/input/touchscreen/vtl/vtl_ts.c:382:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     382 | int vtl_ts_probe(struct i2c_client *client, const struct i2c_device_id *id)
         | ^
         | static 
   6 warnings generated.


vim +/vtl_ts_free_gpio +80 drivers/input/touchscreen/vtl/vtl_ts.c

    79	
  > 80	void vtl_ts_free_gpio(void)
    81	{
    82		struct ts_info *ts;
    83	
    84		ts = pg_ts;
    85		DEBUG();
    86	
    87		gpio_free(ts->config_info.irq_gpio_number);
    88	}
    89	
  > 90	void vtl_ts_hw_reset(void)
    91	{
    92		struct ts_info *ts;
    93	
    94		ts = pg_ts;
    95		DEBUG();
    96	
    97		gpio_set_value(ts->config_info.rst_gpio_number, 0);
    98		mdelay(50);
    99		gpio_set_value(ts->config_info.rst_gpio_number, 1);
   100	}
   101	
   102	static irqreturn_t vtl_ts_irq(int irq, void *dev)
   103	{
   104		struct ts_info *ts;
   105	
   106		ts = pg_ts;
   107		DEBUG();
   108	
   109		queue_work(ts->driver->workqueue, &ts->driver->event_work);
   110	
   111		return IRQ_HANDLED;
   112	}
   113	
   114	static union ts_xy_data *vtl_read_xy_data(struct ts_info *ts)
   115	{
   116		struct i2c_msg msgs;
   117		int err;
   118	
   119		DEBUG();
   120	
   121		msgs.addr = ts->driver->client->addr;
   122		msgs.flags = 0x01;
   123		msgs.len = sizeof(ts->xy_data.buf);
   124		msgs.buf = ts->xy_data.buf;
   125	
   126		err = i2c_transfer(ts->driver->client->adapter, &msgs, 1);
   127		if (err != 1) {
   128			pr_err("___%s:i2c read err___\n", __func__);
   129			return NULL;
   130		}
   131		return &ts->xy_data;
   132	}
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
   160			if (ts->config_info.exchange_x_y_flag)
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
   177				input_report_abs(input_dev, ABS_X, x);
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
 > 278	int  vtl_ts_remove(struct i2c_client *client)
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

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
