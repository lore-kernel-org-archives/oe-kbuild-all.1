Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABD7663BF
	for <oe-kbuild-all@lists.linux.dev>; Thu,  1 Jun 2023 04:12:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685592725; x=1717128725;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=cu4GmSjnvyftsuvM0Kxe1+exNTi+719t0xYrC+PlZKc=;
  b=DuXF4jSwPkjQOSnfcD0+A+snh0Q4MD1aNcSD+Qz4lZJXXbzQMklEK0zh
   ZVcPAvhYlFhd+5F/jKFOWhqZ0r61DHME7wPWSAeDOZL0z4grupiHiI9sq
   zvdqZQNfBzet0/znKBdlKN06Fhqm4pBr/Vsa8uRCgmFHyaecWSkFTeAuJ
   ICFXfVp82JviID11XMqPrypSHlLgN3iLXQQaXHlm2i+HFHjRhHuSB3t9w
   A23WWkL/c+/2YHnbIFJfylx9i8M/ciq9S78SvDexLEmL8T37NDmPA69K5
   VCb1QJk3wn2ZjyT2rj1QHn8pHW6ItmH0OAH0Yu+MKxnmuiZBB0SPDVT+T
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10727"; a="418945928"
X-IronPort-AV: E=Sophos;i="6.00,209,1681196400"; 
   d="scan'208";a="418945928"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 May 2023 21:12:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10727"; a="953908009"
X-IronPort-AV: E=Sophos;i="6.00,209,1681196400"; 
   d="scan'208";a="953908009"
Received: from lkp-server01.sh.intel.com (HELO fb1ced2c09fb) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 31 May 2023 21:12:00 -0700
Received: from kbuild by fb1ced2c09fb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q4ZfL-0001th-2K;
	Thu, 01 Jun 2023 04:11:59 +0000
Date: Thu, 1 Jun 2023 12:11:43 +0800
From: kernel test robot <lkp@intel.com>
To: Keerthy <j-keerthy@ti.com>
Cc: oe-kbuild-all@lists.linux.dev, vigneshr@ti.com, nm@ti.com,
	Apurva Nandan <a-nandan@ti.com>
Subject: [ti:ti-rt-linux-6.1.y-cicd 68/88]
 drivers/thermal/k3_j72xx_bandgap.c:407:5: warning: no previous prototype for
 function 'k3_thermal_register_cpu_cooling'
Message-ID: <202306011222.PXt0Xh5J-lkp@intel.com>
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
config: arm64-randconfig-r021-20230531 (https://download.01.org/0day-ci/archive/20230601/202306011222.PXt0Xh5J-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project 4faf3aaf28226a4e950c103a14f6fc1d1fdabb1b)
reproduce (this is a W=1 build):
        mkdir -p ~/bin
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm64 cross compiling tool for clang build
        # apt-get install binutils-aarch64-linux-gnu
        git remote add ti git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git
        git fetch --no-tags ti ti-rt-linux-6.1.y-cicd
        git checkout 38a145da1625c46c90e453d6e28537e6f97e2720
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang ~/bin/make.cross W=1 O=build_dir ARCH=arm64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang ~/bin/make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash drivers/thermal/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306011222.PXt0Xh5J-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/thermal/k3_j72xx_bandgap.c:288:6: warning: variable 'id' set but not used [-Wunused-but-set-variable]
           int id, tr, ret = 0;
               ^
>> drivers/thermal/k3_j72xx_bandgap.c:407:5: warning: no previous prototype for function 'k3_thermal_register_cpu_cooling' [-Wmissing-prototypes]
   int k3_thermal_register_cpu_cooling(struct k3_j72xx_bandgap *bgp, int id)
       ^
   drivers/thermal/k3_j72xx_bandgap.c:407:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int k3_thermal_register_cpu_cooling(struct k3_j72xx_bandgap *bgp, int id)
   ^
   static 
>> drivers/thermal/k3_j72xx_bandgap.c:449:5: warning: no previous prototype for function 'ti_thermal_unregister_cpu_cooling' [-Wmissing-prototypes]
   int ti_thermal_unregister_cpu_cooling(struct k3_j72xx_bandgap *bgp, int id)
       ^
   drivers/thermal/k3_j72xx_bandgap.c:449:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int ti_thermal_unregister_cpu_cooling(struct k3_j72xx_bandgap *bgp, int id)
   ^
   static 
   3 warnings generated.


vim +/k3_thermal_register_cpu_cooling +407 drivers/thermal/k3_j72xx_bandgap.c

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
