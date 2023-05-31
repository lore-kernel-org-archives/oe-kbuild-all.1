Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF93E1640F
	for <oe-kbuild-all@lists.linux.dev>; Wed, 31 May 2023 20:46:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685565963; x=1717101963;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=00AGTXHkvedmqfxcrd3YiPdAi0otzvcOvwQdGDyYLZE=;
  b=RJAEBi+LDiUpDPm0Fpz1YSqvDZxvPeNs1juS7gdVa2d6/1dXY62BJwI8
   r4w6FovHNJJyPaCCDKyk3Eb2wOSXUSgsH817jP0AVwS5EXCEC77fSRuS4
   1eOPLpWZLdNspKqWGKW97pqTkMLP+f4jg+XtmUcwGgF5HvyfhUGxpvBDT
   9Dz05GyJBjo1ydCHph5cFWllTJlrmcyCvi+/qLMgX9ibbxNRZoSqQIrKx
   fNHop8v1phqWdKDRxGRqL75UfBZ8wW0hI89p5iT9neIVOH67am6eNPgcQ
   awVilYEmYYmOarTPkJF45RXsxiQC4n18ZFhPPB4tWD8+C4MDp82ev8tMN
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10727"; a="383626954"
X-IronPort-AV: E=Sophos;i="6.00,207,1681196400"; 
   d="scan'208";a="383626954"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 May 2023 13:45:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10727"; a="740111475"
X-IronPort-AV: E=Sophos;i="6.00,207,1681196400"; 
   d="scan'208";a="740111475"
Received: from lkp-server01.sh.intel.com (HELO fb1ced2c09fb) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 31 May 2023 13:45:39 -0700
Received: from kbuild by fb1ced2c09fb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q4ShO-0001ad-1F;
	Wed, 31 May 2023 20:45:38 +0000
Date: Thu, 1 Jun 2023 04:45:26 +0800
From: kernel test robot <lkp@intel.com>
To: Keerthy <j-keerthy@ti.com>
Cc: oe-kbuild-all@lists.linux.dev, vigneshr@ti.com, nm@ti.com,
	Apurva Nandan <a-nandan@ti.com>
Subject: [ti:ti-rt-linux-6.1.y-cicd 68/88]
 drivers/thermal/k3_j72xx_bandgap.c:288:13: warning: variable 'id' set but
 not used
Message-ID: <202306010455.YoZSV8gb-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git ti-rt-linux-6.1.y-cicd
head:   8509e7bb5765732d005befcd277ade73a5df3760
commit: 38a145da1625c46c90e453d6e28537e6f97e2720 [68/88] thermal: k3_j72xx_bandgap: Add cooling device support
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20230601/202306010455.YoZSV8gb-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 12.3.0
reproduce (this is a W=1 build):
        mkdir -p ~/bin
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        git remote add ti git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git
        git fetch --no-tags ti ti-rt-linux-6.1.y-cicd
        git checkout 38a145da1625c46c90e453d6e28537e6f97e2720
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.3.0 ~/bin/make.cross W=1 O=build_dir ARCH=alpha olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.3.0 ~/bin/make.cross W=1 O=build_dir ARCH=alpha SHELL=/bin/bash drivers/thermal/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306010455.YoZSV8gb-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/thermal/k3_j72xx_bandgap.c: In function 'k3_thermal_get_trend':
>> drivers/thermal/k3_j72xx_bandgap.c:288:13: warning: variable 'id' set but not used [-Wunused-but-set-variable]
     288 |         int id, tr, ret = 0;
         |             ^~
   drivers/thermal/k3_j72xx_bandgap.c: At top level:
>> drivers/thermal/k3_j72xx_bandgap.c:407:5: warning: no previous prototype for 'k3_thermal_register_cpu_cooling' [-Wmissing-prototypes]
     407 | int k3_thermal_register_cpu_cooling(struct k3_j72xx_bandgap *bgp, int id)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/thermal/k3_j72xx_bandgap.c:449:5: warning: no previous prototype for 'ti_thermal_unregister_cpu_cooling' [-Wmissing-prototypes]
     449 | int ti_thermal_unregister_cpu_cooling(struct k3_j72xx_bandgap *bgp, int id)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/id +288 drivers/thermal/k3_j72xx_bandgap.c

   282	
   283	static int k3_thermal_get_trend(struct thermal_zone_device *tz, int trip, enum thermal_trend *trend)
   284	{
   285		struct k3_thermal_data *data = tz->devdata;
   286		struct k3_j72xx_bandgap *bgp;
   287		u32 temp1, temp2;
 > 288		int id, tr, ret = 0;
   289	
   290		bgp = data->bgp;
   291		id = data->sensor_id;
   292	
   293		ret = k3_thermal_get_temp(tz, &temp1);
   294		if (ret)
   295			return ret;
   296		temp2 = data->prev_temp;
   297	
   298		tr = temp1 - temp2;
   299	
   300		data->prev_temp = temp1;
   301	
   302		if (tr > 0)
   303			*trend = THERMAL_TREND_RAISING;
   304		else if (tr < 0)
   305			*trend = THERMAL_TREND_DROPPING;
   306		else
   307			*trend = THERMAL_TREND_STABLE;
   308	
   309		dev_dbg(bgp->dev, "The temperatures are t1 = %d and t2 = %d and trend =%d\n",
   310			temp1, temp2, *trend);
   311	
   312		return ret;
   313	}
   314	
   315	static const struct thermal_zone_device_ops k3_of_thermal_ops = {
   316		.get_temp = k3_thermal_get_temp,
   317		.get_trend = k3_thermal_get_trend,
   318	};
   319	
   320	static int k3_j72xx_bandgap_temp_to_adc_code(int temp)
   321	{
   322		int low = 0, high = TABLE_SIZE - 1, mid;
   323	
   324		if (temp > 160000 || temp < -50000)
   325			return -EINVAL;
   326	
   327		/* Binary search to find the adc code */
   328		while (low < (high - 1)) {
   329			mid = (low + high) / 2;
   330			if (temp <= derived_table[mid])
   331				high = mid;
   332			else
   333				low = mid;
   334		}
   335	
   336		return mid;
   337	}
   338	
   339	static void get_efuse_values(int id, struct k3_thermal_data *data, int *err,
   340				     struct k3_j72xx_bandgap *bgp)
   341	{
   342		int i, tmp, pow;
   343		int ct_offsets[5][K3_VTM_CORRECTION_TEMP_CNT] = {
   344			{ 0x0, 0x8, 0x4 },
   345			{ 0x0, 0x8, 0x4 },
   346			{ 0x0, -1,  0x4 },
   347			{ 0x0, 0xC, -1 },
   348			{ 0x0, 0xc, 0x8 }
   349		};
   350		int ct_bm[5][K3_VTM_CORRECTION_TEMP_CNT] = {
   351			{ 0x3f, 0x1fe000, 0x1ff },
   352			{ 0xfc0, 0x1fe000, 0x3fe00 },
   353			{ 0x3f000, 0x7f800000, 0x7fc0000 },
   354			{ 0xfc0000, 0x1fe0, 0x1f800000 },
   355			{ 0x3f000000, 0x1fe000, 0x1ff0 }
   356		};
   357	
   358		for (i = 0; i < 3; i++) {
   359			/* Extract the offset value using bit-mask */
   360			if (ct_offsets[id][i] == -1 && i == 1) {
   361				/* 25C offset Case of Sensor 2 split between 2 regs */
   362				tmp = (readl(bgp->fuse_base + 0x8) & 0xE0000000) >> (29);
   363				tmp |= ((readl(bgp->fuse_base + 0xC) & 0x1F) << 3);
   364				pow = tmp & 0x80;
   365			} else if (ct_offsets[id][i] == -1 && i == 2) {
   366				/* 125C Case of Sensor 3 split between 2 regs */
   367				tmp = (readl(bgp->fuse_base + 0x4) & 0xF8000000) >> (27);
   368				tmp |= ((readl(bgp->fuse_base + 0x8) & 0xF) << 5);
   369				pow = tmp & 0x100;
   370			} else {
   371				tmp = readl(bgp->fuse_base + ct_offsets[id][i]);
   372				tmp &= ct_bm[id][i];
   373				tmp = tmp >> __ffs(ct_bm[id][i]);
   374	
   375				/* Obtain the sign bit pow*/
   376				pow = ct_bm[id][i] >> __ffs(ct_bm[id][i]);
   377				pow += 1;
   378				pow /= 2;
   379			}
   380	
   381			/* Check for negative value */
   382			if (tmp & pow) {
   383				/* 2's complement value */
   384				tmp = two_cmp(tmp, ct_bm[id][i] >> __ffs(ct_bm[id][i]));
   385			}
   386			err[i] = tmp;
   387		}
   388	
   389		/* Err value for 150C is set to 0 */
   390		err[i] = 0;
   391	}
   392	
   393	static void print_look_up_table(struct device *dev, int *ref_table)
   394	{
   395		int i;
   396	
   397		dev_dbg(dev, "The contents of derived array\n");
   398		dev_dbg(dev, "Code   Temperature\n");
   399		for (i = 0; i < TABLE_SIZE; i++)
   400			dev_dbg(dev, "%d       %d %d\n", i, derived_table[i], ref_table[i]);
   401	}
   402	
   403	struct k3_j72xx_bandgap_data {
   404		unsigned int has_errata_i2128;
   405	};
   406	
 > 407	int k3_thermal_register_cpu_cooling(struct k3_j72xx_bandgap *bgp, int id)
   408	{
   409		struct k3_thermal_data *data;
   410		struct device_node *np = bgp->dev->of_node;
   411	
   412		/*
   413		 * We are assuming here that if one deploys the zone
   414		 * using DT, then it must be aware that the cooling device
   415		 * loading has to happen via cpufreq driver.
   416		 */
   417		if (of_find_property(np, "#thermal-sensor-cells", NULL))
   418			return 0;
   419	
   420		data = bgp->ts_data[id];
   421		if (!data)
   422			return -EINVAL;
   423	
   424		data->policy = cpufreq_cpu_get(0);
   425		if (!data->policy) {
   426			pr_debug("%s: CPUFreq policy not found\n", __func__);
   427			return -EPROBE_DEFER;
   428		}
   429	
   430		/* Register cooling device */
   431		data->cool_dev = cpufreq_cooling_register(data->policy);
   432		if (IS_ERR(data->cool_dev)) {
   433			int ret = PTR_ERR(data->cool_dev);
   434	
   435			dev_err(bgp->dev, "Failed to register cpu cooling device %d\n",
   436				ret);
   437			cpufreq_cpu_put(data->policy);
   438	
   439			return ret;
   440		}
   441	
   442		data->mode = THERMAL_DEVICE_ENABLED;
   443	
   444		INIT_WORK(&data->thermal_wq, k3_thermal_work);
   445	
   446		return 0;
   447	}
   448	
 > 449	int ti_thermal_unregister_cpu_cooling(struct k3_j72xx_bandgap *bgp, int id)
   450	{
   451		struct k3_thermal_data *data;
   452	
   453		data = bgp->ts_data[id];
   454	
   455		if (!IS_ERR_OR_NULL(data)) {
   456			cpufreq_cooling_unregister(data->cool_dev);
   457			if (data->policy)
   458				cpufreq_cpu_put(data->policy);
   459		}
   460	
   461		return 0;
   462	}
   463	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
