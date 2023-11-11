Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5ABC11B27D
	for <oe-kbuild-all@lists.linux.dev>; Sat, 11 Nov 2023 19:20:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="i92JI7x0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699730455; x=1731266455;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=FUWt0zs1a70NNFIZXZPDAqKNlj2/BRGibeJKPAhnzNo=;
  b=i92JI7x0S7YDggLvNFS9IeqCo+IgwzvuNmZs/FuZ7w9tab7qJV0A10bd
   p6a2DOkEUqIi3VPbDNp5w+rRayfr4K2/EFrlXCa0KKpjG+rvdmqy1faXh
   G3sb+7WcohnQRYE+6EwGAUTlW0j3s1vdu/4m/j3fXi0udBS9pPlBQ1VbU
   m2G/U5xgB2IWsBsAyjLzhStPTyfIqagOBO+/FCoAWbkR077t/Ym2E7alq
   wbKhSrmydwzyZBskQmqDl00HDE3jNb2hZ7dEqW8Y/RBKgK4JoZCVznioA
   wPl0Ud2lSbhcWDQfh1CUplZWm7YFtFPri9V2evLkFFWp/TYdidAMQTrMD
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10891"; a="8938690"
X-IronPort-AV: E=Sophos;i="6.03,295,1694761200"; 
   d="scan'208";a="8938690"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2023 11:20:49 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10891"; a="798839138"
X-IronPort-AV: E=Sophos;i="6.03,295,1694761200"; 
   d="scan'208";a="798839138"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 11 Nov 2023 11:20:47 -0800
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r1tXB-000Ahr-1z;
	Sat, 11 Nov 2023 19:20:45 +0000
Date: Sun, 12 Nov 2023 03:20:10 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:pr/642 1573/30000]
 drivers/input/touchscreen/vtl/vtl_ts.c:228:5: sparse: sparse: symbol
 'vtl_ts_suspend' was not declared. Should it be static?
Message-ID: <202311120333.0qEGdfpW-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Freescale/linux-fslc pr/642
head:   c8b7cf62c7fea8456dec789d550b8006d73b8f04
commit: 3785cf3fded6ec2c0230baf53fca19a1e956446f [1573/30000] MLK-13244 input: touchscreen: add support for vtl touchscreen
config: i386-randconfig-063-20231021 (https://download.01.org/0day-ci/archive/20231112/202311120333.0qEGdfpW-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231112/202311120333.0qEGdfpW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311120333.0qEGdfpW-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/input/touchscreen/vtl/vtl_ts.c:80:6: sparse: sparse: symbol 'vtl_ts_free_gpio' was not declared. Should it be static?
   drivers/input/touchscreen/vtl/vtl_ts.c:90:6: sparse: sparse: symbol 'vtl_ts_hw_reset' was not declared. Should it be static?
>> drivers/input/touchscreen/vtl/vtl_ts.c:228:5: sparse: sparse: symbol 'vtl_ts_suspend' was not declared. Should it be static?
>> drivers/input/touchscreen/vtl/vtl_ts.c:241:5: sparse: sparse: symbol 'vtl_ts_resume' was not declared. Should it be static?
   drivers/input/touchscreen/vtl/vtl_ts.c:278:6: sparse: sparse: symbol 'vtl_ts_remove' was not declared. Should it be static?
   drivers/input/touchscreen/vtl/vtl_ts.c:366:5: sparse: sparse: symbol 'ct36x_test_tp' was not declared. Should it be static?
   drivers/input/touchscreen/vtl/vtl_ts.c:382:5: sparse: sparse: symbol 'vtl_ts_probe' was not declared. Should it be static?

vim +/vtl_ts_suspend +228 drivers/input/touchscreen/vtl/vtl_ts.c

    46	
    47	
    48	/* Global or static variables */
  > 49	struct ts_driver g_driver;
    50	
    51	static struct ts_info g_ts = {
    52		.driver = &g_driver,
    53	};
    54	static struct ts_info *pg_ts = &g_ts;
    55	
    56	static struct i2c_device_id vtl_ts_id[] = {
    57		{ DRIVER_NAME, 0 },
    58		{ }
    59	};
    60	MODULE_DEVICE_TABLE(i2c, vtl_ts_id);
    61	
    62	
    63	static int vtl_ts_config(struct ts_info *ts)
    64	{
    65		struct device *dev;
    66	
    67		DEBUG();
    68	
    69		dev = &ts->driver->client->dev;
    70	
    71		/* ts config */
    72		ts->config_info.touch_point_number = TOUCH_POINT_NUM;
    73	
    74		pr_info("Configuring vtl\n");
    75		ts->config_info.screen_max_x = SCREEN_MAX_X;
    76		ts->config_info.screen_max_y = SCREEN_MAX_y;
    77		return 0;
    78	}
    79	
    80	void vtl_ts_free_gpio(void)
    81	{
    82		struct ts_info *ts;
    83	
    84		ts = pg_ts;
    85		DEBUG();
    86	
    87		gpio_free(ts->config_info.irq_gpio_number);
    88	}
    89	
    90	void vtl_ts_hw_reset(void)
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
 > 228	int vtl_ts_suspend(struct device *dev)
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
 > 241	int vtl_ts_resume(struct device *dev)
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

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
