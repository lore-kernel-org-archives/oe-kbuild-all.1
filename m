Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A629921A458
	for <oe-kbuild-all@lists.linux.dev>; Wed,  5 Feb 2025 09:44:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738748663; cv=none; b=tRJZmGPIr6sNrvnRlsgsUS01AKaVr0KS/rHSRIUp9HxIGoS8jiZ++HdC2rEAyNfgzA91IextWQnN3iKDIiRxkz4hwXmyQ+l6jxnamJZW7TxIuHyFhT6hFE4M+W5amY+7wC5pCO6LxxFXRKXI/fQcvNYrkdNBsKvCAbWQ2AXaYvU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738748663; c=relaxed/simple;
	bh=brk5QFwx5XcWUq9g1tc3iioO7QlqGPXi6atj7jQv2CM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=C22xAH8YNefaT3HJq/G4BjamJfEoeii8cR7TXqdWmde90UValiozg6Eg4Fk6kyDQdfDmZpzewaWKaaW1jfszbe9C8syd3z7fxSxar6MgqAC8tNj9jbspnw8llyK1XM7968vyXvbA1nzxuYOSdwTMgdvL+bHnnETMIFhyv0S/wX8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DhiN12Kq; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DhiN12Kq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738748658; x=1770284658;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=brk5QFwx5XcWUq9g1tc3iioO7QlqGPXi6atj7jQv2CM=;
  b=DhiN12KqUMsfJGQLNHAAqdpvSQhlpeQ8kZ70boo77CkVzqPpyLE9N4ES
   JfYYDAzx5dSlyaZ9ry7xjqWjq/TiHr5SNsBRRkZTHB8pDi2skrLseNZSh
   3xMeAM8WQGB577Ma8HQxqE5VKAD77dTbE6X6bJ0xqQMZPsFzC5Zoo2adV
   9RgtXdC426rEjqvcGLa5e8MNcnJpOYf3kI4qjxKVJBfFLlnh+vfe5NLCA
   GtshwX7et6EqT2OX6VvdCS7eHjxaPzwiggQ+AEUdYPYPNYUrqPv5vr4CV
   jVxxLzYTwJoiG22AfLqf0K2bn7rOGNGTFCktVazpnxdVEdYBTKNBlZ5sd
   g==;
X-CSE-ConnectionGUID: diU8iuURTvq2sWqYjrauIw==
X-CSE-MsgGUID: btTqb0dbQLiMOtaxoD1Itg==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="42142044"
X-IronPort-AV: E=Sophos;i="6.13,261,1732608000"; 
   d="scan'208";a="42142044"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Feb 2025 01:44:17 -0800
X-CSE-ConnectionGUID: uCvhU7bvTRCet4d8qSMEMA==
X-CSE-MsgGUID: XauHwmPATEyRaEXUnzrumg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,261,1732608000"; 
   d="scan'208";a="110838363"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 05 Feb 2025 01:44:15 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tfbx7-000ti3-1b;
	Wed, 05 Feb 2025 09:44:13 +0000
Date: Wed, 5 Feb 2025 17:43:52 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-6.6 192/192]
 drivers/thermal/mediatek/soc_temp_lvts_mt8196.c:74:28: warning: variable
 's_index' set but not used
Message-ID: <202502051701.stN88Tb9-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-6.6
head:   1b7d37693f7bd7e9f37c02d15753e16b5bac8c79
commit: da40e24aff5b36a331b3113fa10dcc46a6cdda9b [192/192] CHROMIUM: thermal/mediatek: add thermal driver
config: arm64-randconfig-003-20250205 (https://download.01.org/0day-ci/archive/20250205/202502051701.stN88Tb9-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250205/202502051701.stN88Tb9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502051701.stN88Tb9-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/thermal/mediatek/soc_temp_lvts_mt8196.c: In function 'lvts_read_all_tc_temperature':
>> drivers/thermal/mediatek/soc_temp_lvts_mt8196.c:74:28: warning: variable 's_index' set but not used [-Wunused-but-set-variable]
      74 |         unsigned int i, j, s_index, msr_raw;
         |                            ^~~~~~~
   drivers/thermal/mediatek/soc_temp_lvts_mt8196.c: At top level:
>> drivers/thermal/mediatek/soc_temp_lvts_mt8196.c:230:6: warning: no previous prototype for 'lvts_wait_for_all_sensing_point_idle' [-Wmissing-prototypes]
     230 | void lvts_wait_for_all_sensing_point_idle(struct lvts_data *lvts_data)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/thermal/mediatek/soc_temp_lvts_mt8196.c: In function 'lvts_resume_noirq':
>> drivers/thermal/mediatek/soc_temp_lvts_mt8196.c:860:27: warning: variable 'lvts_data' set but not used [-Wunused-but-set-variable]
     860 |         struct lvts_data *lvts_data;
         |                           ^~~~~~~~~


vim +/s_index +74 drivers/thermal/mediatek/soc_temp_lvts_mt8196.c

    70	
    71	static int __used lvts_read_all_tc_temperature(struct lvts_data *lvts_data, bool in_isr)
    72	{
    73		struct tc_settings *tc = lvts_data->tc;
  > 74		unsigned int i, j, s_index, msr_raw;
    75		int max_temp = THERMAL_TEMP_INVALID, current_temp;
    76		void __iomem *base;
    77		struct platform_ops *ops = &lvts_data->ops;
    78	
    79		for (i = 0; i < lvts_data->num_tc; i++) {
    80			base = GET_BASE_ADDR(i);
    81			for (j = 0; j < tc[i].num_sensor; j++) {
    82				if (tc[i].sensor_on_off[j] != SEN_ON)
    83					continue;
    84	
    85				s_index = tc[i].sensor_map[j];
    86	
    87				if (lvts_data->is_tsfdc_n3e_ver)
    88					msr_raw = lvts_read_tc_msr_raw(LVTSATP0_0 + base + 0x4 * j);
    89				else
    90					msr_raw = lvts_read_tc_msr_raw(LVTSMSR0_0 + base + 0x4 * j);
    91	
    92				if (msr_raw == 0)
    93					current_temp = THERMAL_TEMP_INVALID;
    94				else
    95					current_temp = ops->lvts_raw_to_temp(&(tc[i].coeff), j, msr_raw);
    96	
    97				if (current_temp > max_temp)
    98					max_temp = current_temp;
    99			}
   100		}
   101	
   102		return max_temp;
   103	}
   104	
   105	static int lvts_read_tc_temperature(struct lvts_data *lvts_data, unsigned int tz_id, bool in_isr)
   106	{
   107		struct tc_settings *tc = lvts_data->tc;
   108		unsigned int i, j, msr_raw;
   109		unsigned int s_index = tz_id - 1;
   110		int current_temp;
   111		void __iomem *base;
   112		struct platform_ops *ops = &lvts_data->ops;
   113	
   114		for (i = 0; i < lvts_data->num_tc; i++) {
   115			base = GET_BASE_ADDR(i);
   116			for (j = 0; j < tc[i].num_sensor; j++) {
   117				if (s_index != tc[i].sensor_map[j])
   118					continue;
   119	#ifdef GPU_POWERCHK
   120				if (lvts_data->gpu_power_ctrl_id)
   121					if (i == lvts_data->gpu_power_ctrl_id)
   122						if (mfg0_pwr_sta() != MFG0_PWR_ON)
   123							return THERMAL_TEMP_INVALID;
   124	#endif /* GPU_POWERCHK */
   125	
   126				if (lvts_data->is_tsfdc_n3e_ver)
   127					msr_raw = lvts_read_tc_msr_raw(LVTSATP0_0 + base + 0x4 * j);
   128				else
   129					msr_raw = lvts_read_tc_msr_raw(LVTSMSR0_0 + base + 0x4 * j);
   130	
   131				if (msr_raw == 0)
   132					current_temp = THERMAL_TEMP_INVALID;
   133				else
   134					current_temp = ops->lvts_raw_to_temp(&(tc[i].coeff), j, msr_raw);
   135	
   136				return current_temp;
   137			}
   138		}
   139	
   140		return THERMAL_TEMP_INVALID;
   141	}
   142	
   143	static int soc_temp_lvts_read_temp(struct thermal_zone_device *tz, int *temperature)
   144	{
   145		struct soc_temp_tz *lvts_tz = (struct soc_temp_tz *)tz->devdata;
   146		struct lvts_data *lvts_data = lvts_tz->lvts_data;
   147	
   148		if (lvts_tz->id == 0)
   149			*temperature = lvts_read_all_tc_temperature(lvts_data, false);
   150		else if (lvts_tz->id - 1 < lvts_data->num_sensor)
   151			*temperature = lvts_read_tc_temperature(lvts_data, lvts_tz->id, false);
   152		else
   153			return -EINVAL;
   154	
   155		return 0;
   156	}
   157	
   158	static void disable_all_sensing_points(struct lvts_data *lvts_data)
   159	{
   160		unsigned int i;
   161		void __iomem *base;
   162	
   163		for (i = 0; i < lvts_data->num_tc; i++) {
   164			base = GET_BASE_ADDR(i);
   165			writel(DISABLE_SENSING_POINT, LVTSMONCTL0_0 + base);
   166		}
   167	}
   168	
   169	static void enable_all_sensing_points(struct lvts_data *lvts_data)
   170	{
   171		struct device *dev = lvts_data->dev;
   172		struct tc_settings *tc = lvts_data->tc;
   173		unsigned int i, j, num;
   174		void __iomem *base;
   175		unsigned int flag;
   176	
   177		for (i = 0; i < lvts_data->num_tc; i++) {
   178			base = GET_BASE_ADDR(i);
   179			num = tc[i].num_sensor;
   180	
   181			if (num > ALL_SENSING_POINTS) {
   182				dev_err(dev,
   183					"%s, LVTS%d, illegal number of sensors: %d\n",
   184					__func__, i, tc[i].num_sensor);
   185				continue;
   186			}
   187	
   188			flag = LVTS_SINGLE_SENSE;
   189			for (j = 0; j < tc[i].num_sensor; j++) {
   190				if (tc[i].sensor_on_off[j] != SEN_ON)
   191					continue;
   192	
   193				flag = flag | (0x1<<j);
   194			}
   195			writel(flag, LVTSMONCTL0_0 + base);
   196		}
   197	}
   198	
   199	/*
   200	 * lvts_thermal_check_all_sensing_point_idle -
   201	 * Check if all sensing points are idle
   202	 * Return: 0 if all sensing points are idle
   203	 *         an error code if one of them is busy
   204	 * error code[31:16]: an index of LVTS thermal controller
   205	 * error code[2]: bit 10 of LVTSMSRCTL1
   206	 * error code[1]: bit 7 of LVTSMSRCTL1
   207	 * error code[0]: bit 0 of LVTSMSRCTL1
   208	 */
   209	static int lvts_thermal_check_all_sensing_point_idle(struct lvts_data *lvts_data)
   210	{
   211		int i, temp, error_code;
   212		void __iomem *base;
   213	
   214		for (i = 0; i < lvts_data->num_tc; i++) {
   215			base = GET_BASE_ADDR(i);
   216			temp = readl(base + LVTSMSRCTL1_0);
   217			/* Check if bit10=bit7=bit0=0 */
   218			if ((temp & 0x481) != 0) {
   219				error_code = (i << 16) + ((temp & BIT(10)) >> 8) +
   220					((temp & BIT(7)) >> 6) +
   221					(temp & BIT(0));
   222	
   223				return error_code;
   224			}
   225		}
   226	
   227		return 0;
   228	}
   229	
 > 230	void lvts_wait_for_all_sensing_point_idle(struct lvts_data *lvts_data)
   231	{
   232		struct device *dev = lvts_data->dev;
   233		int cnt = 0, i, error_code, mask;
   234		int temp;
   235		void __iomem *base;
   236	
   237		mask = BIT(10) | BIT(7) | BIT(0);
   238		/*
   239		 * Wait until all sensoring points idled.
   240		 * No need to check LVTS status when suspend/resume,
   241		 * this will spend extra 100us of suspend flow.
   242		 * LVTS status will be reset after resume.
   243		 */
   244		while (cnt < 80) {
   245			temp = lvts_thermal_check_all_sensing_point_idle(lvts_data);
   246			if (temp == 0)
   247				goto TAIL;
   248	
   249			udelay(2);
   250			cnt++;
   251		}
   252		for (i = 0; i < lvts_data->num_tc; i++) {
   253			base = GET_BASE_ADDR(i);
   254			temp = readl(LVTSMSRCTL1_0 + base);
   255			if ((temp & mask) != 0) {
   256				error_code = ((temp & BIT(10)) >> 8) +
   257					((temp & BIT(7)) >> 6) +
   258					(temp & BIT(0));
   259	
   260				dev_info(dev, "Error LVTS %d sensing points aren't idle, error_code %d\n",
   261					i, error_code);
   262			}
   263		}
   264	TAIL:
   265		return;
   266	}
   267	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
