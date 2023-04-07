Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0AD44C79
	for <oe-kbuild-all@lists.linux.dev>; Fri,  7 Apr 2023 13:11:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680873108; x=1712409108;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=MisGipAXw2/ecf7gkxUeee9Dd+d2Z7cGB0HNChZo3oM=;
  b=RqczVP7rGvqMD92BZLAA/xzFysA+GqndFowO7IbqSFwU0xdDFaXCh66V
   bnYAn3cuOUXoW8YPO74N/m8JHTWHIVlfCdnqxqwQFRTnw/KDy3EMYQB8U
   g/Na65V9MuOLZds9AvVBAF95j9S5rLcW11x9fzKIY1twvkfhAGNvcsV+m
   mXT/X0kzkLxYyXv11WR0HoIUoSbPKs/H0i4hy46lzs/vTCrDGFNIQ/Utl
   F953XQwup4UFOfUg5SqvE2krXKPJQMV6RkbZQiJt6SbR8b3i7EkPZ93Mo
   cEm47FSNeY3RwZ/f0HD+W7PTzVpQHF08gbRVM7ZfsnF+LJM+EjNmmEDTo
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10672"; a="341735371"
X-IronPort-AV: E=Sophos;i="5.98,327,1673942400"; 
   d="scan'208";a="341735371"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2023 06:11:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10672"; a="933583608"
X-IronPort-AV: E=Sophos;i="5.98,327,1673942400"; 
   d="scan'208";a="933583608"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 07 Apr 2023 06:11:46 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pklsX-000SW8-1t;
	Fri, 07 Apr 2023 13:11:45 +0000
Date: Fri, 7 Apr 2023 21:11:21 +0800
From: kernel test robot <lkp@intel.com>
To: Keerthy <j-keerthy@ti.com>
Cc: oe-kbuild-all@lists.linux.dev, vigneshr@ti.com, nm@ti.com,
	Praneeth Bajjuri <praneeth@ti.com>
Subject: [ti:ti-linux-5.10.y-cicd 19558/22025]
 drivers/thermal/k3_j72xx_bandgap.c:289:6: warning: variable 'id' set but not
 used
Message-ID: <202304072115.ttWSqRzh-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git ti-linux-5.10.y-cicd
head:   991c5ce91e43cb620f534dc9fe7b0ad21f4f4388
commit: 22d3f82184798e29c81c2a33b37d9e25d6869626 [19558/22025] thermal: k3_j72xx_bandgap: Add cooling device support
config: mips-randconfig-r024-20230403 (https://download.01.org/0day-ci/archive/20230407/202304072115.ttWSqRzh-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project 2c57868e2e877f73c339796c3374ae660bb77f0d)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install mips cross compiling tool for clang build
        # apt-get install binutils-mipsel-linux-gnu
        git remote add ti git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git
        git fetch --no-tags ti ti-linux-5.10.y-cicd
        git checkout 22d3f82184798e29c81c2a33b37d9e25d6869626
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=mips olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=mips SHELL=/bin/bash drivers/thermal/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304072115.ttWSqRzh-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/thermal/k3_j72xx_bandgap.c:289:6: warning: variable 'id' set but not used [-Wunused-but-set-variable]
           int id, tr, ret = 0;
               ^
>> drivers/thermal/k3_j72xx_bandgap.c:408:5: warning: no previous prototype for function 'k3_thermal_register_cpu_cooling' [-Wmissing-prototypes]
   int k3_thermal_register_cpu_cooling(struct k3_j72xx_bandgap *bgp, int id)
       ^
   drivers/thermal/k3_j72xx_bandgap.c:408:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int k3_thermal_register_cpu_cooling(struct k3_j72xx_bandgap *bgp, int id)
   ^
   static 
>> drivers/thermal/k3_j72xx_bandgap.c:450:5: warning: no previous prototype for function 'ti_thermal_unregister_cpu_cooling' [-Wmissing-prototypes]
   int ti_thermal_unregister_cpu_cooling(struct k3_j72xx_bandgap *bgp, int id)
       ^
   drivers/thermal/k3_j72xx_bandgap.c:450:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int ti_thermal_unregister_cpu_cooling(struct k3_j72xx_bandgap *bgp, int id)
   ^
   static 
   3 warnings generated.


vim +/id +289 drivers/thermal/k3_j72xx_bandgap.c

   283	
   284	static int k3_thermal_get_trend(void *p, int trip, enum thermal_trend *trend)
   285	{
   286		struct k3_thermal_data *data = p;
   287		struct k3_j72xx_bandgap *bgp;
   288		u32 temp1, temp2;
 > 289		int id, tr, ret = 0;
   290	
   291		bgp = data->bgp;
   292		id = data->sensor_id;
   293	
   294		ret = k3_thermal_get_temp(data, &temp1);
   295		if (ret)
   296			return ret;
   297		temp2 = data->prev_temp;
   298	
   299		tr = temp1 - temp2;
   300	
   301		data->prev_temp = temp1;
   302	
   303		if (tr > 0)
   304			*trend = THERMAL_TREND_RAISING;
   305		else if (tr < 0)
   306			*trend = THERMAL_TREND_DROPPING;
   307		else
   308			*trend = THERMAL_TREND_STABLE;
   309	
   310		dev_dbg(bgp->dev, "The temperatures are t1 = %d and t2 = %d and trend =%d\n",
   311			temp1, temp2, *trend);
   312	
   313		return ret;
   314	}
   315	
   316	static const struct thermal_zone_of_device_ops k3_of_thermal_ops = {
   317		.get_temp = k3_thermal_get_temp,
   318		.get_trend = k3_thermal_get_trend,
   319	};
   320	
   321	static int k3_j72xx_bandgap_temp_to_adc_code(int temp)
   322	{
   323		int low = 0, high = TABLE_SIZE - 1, mid;
   324	
   325		if (temp > 160000 || temp < -50000)
   326			return -EINVAL;
   327	
   328		/* Binary search to find the adc code */
   329		while (low < (high - 1)) {
   330			mid = (low + high) / 2;
   331			if (temp <= derived_table[mid])
   332				high = mid;
   333			else
   334				low = mid;
   335		}
   336	
   337		return mid;
   338	}
   339	
   340	static void get_efuse_values(int id, struct k3_thermal_data *data, int *err,
   341				     struct k3_j72xx_bandgap *bgp)
   342	{
   343		int i, tmp, pow;
   344		int ct_offsets[5][K3_VTM_CORRECTION_TEMP_CNT] = {
   345			{ 0x0, 0x8, 0x4 },
   346			{ 0x0, 0x8, 0x4 },
   347			{ 0x0, -1,  0x4 },
   348			{ 0x0, 0xC, -1 },
   349			{ 0x0, 0xc, 0x8 }
   350		};
   351		int ct_bm[5][K3_VTM_CORRECTION_TEMP_CNT] = {
   352			{ 0x3f, 0x1fe000, 0x1ff },
   353			{ 0xfc0, 0x1fe000, 0x3fe00 },
   354			{ 0x3f000, 0x7f800000, 0x7fc0000 },
   355			{ 0xfc0000, 0x1fe0, 0x1f800000 },
   356			{ 0x3f000000, 0x1fe000, 0x1ff0 }
   357		};
   358	
   359		for (i = 0; i < 3; i++) {
   360			/* Extract the offset value using bit-mask */
   361			if (ct_offsets[id][i] == -1 && i == 1) {
   362				/* 25C offset Case of Sensor 2 split between 2 regs */
   363				tmp = (readl(bgp->fuse_base + 0x8) & 0xE0000000) >> (29);
   364				tmp |= ((readl(bgp->fuse_base + 0xC) & 0x1F) << 3);
   365				pow = tmp & 0x80;
   366			} else if (ct_offsets[id][i] == -1 && i == 2) {
   367				/* 125C Case of Sensor 3 split between 2 regs */
   368				tmp = (readl(bgp->fuse_base + 0x4) & 0xF8000000) >> (27);
   369				tmp |= ((readl(bgp->fuse_base + 0x8) & 0xF) << 5);
   370				pow = tmp & 0x100;
   371			} else {
   372				tmp = readl(bgp->fuse_base + ct_offsets[id][i]);
   373				tmp &= ct_bm[id][i];
   374				tmp = tmp >> __ffs(ct_bm[id][i]);
   375	
   376				/* Obtain the sign bit pow*/
   377				pow = ct_bm[id][i] >> __ffs(ct_bm[id][i]);
   378				pow += 1;
   379				pow /= 2;
   380			}
   381	
   382			/* Check for negative value */
   383			if (tmp & pow) {
   384				/* 2's complement value */
   385				tmp = two_cmp(tmp, ct_bm[id][i] >> __ffs(ct_bm[id][i]));
   386			}
   387			err[i] = tmp;
   388		}
   389	
   390		/* Err value for 150C is set to 0 */
   391		err[i] = 0;
   392	}
   393	
   394	static void print_look_up_table(struct device *dev, int *ref_table)
   395	{
   396		int i;
   397	
   398		dev_dbg(dev, "The contents of derived array\n");
   399		dev_dbg(dev, "Code   Temperature\n");
   400		for (i = 0; i < TABLE_SIZE; i++)
   401			dev_dbg(dev, "%d       %d %d\n", i, derived_table[i], ref_table[i]);
   402	}
   403	
   404	struct k3_j72xx_bandgap_data {
   405		unsigned int has_errata_i2128;
   406	};
   407	
 > 408	int k3_thermal_register_cpu_cooling(struct k3_j72xx_bandgap *bgp, int id)
   409	{
   410		struct k3_thermal_data *data;
   411		struct device_node *np = bgp->dev->of_node;
   412	
   413		/*
   414		 * We are assuming here that if one deploys the zone
   415		 * using DT, then it must be aware that the cooling device
   416		 * loading has to happen via cpufreq driver.
   417		 */
   418		if (of_find_property(np, "#thermal-sensor-cells", NULL))
   419			return 0;
   420	
   421		data = bgp->ts_data[id];
   422		if (!data)
   423			return -EINVAL;
   424	
   425		data->policy = cpufreq_cpu_get(0);
   426		if (!data->policy) {
   427			pr_debug("%s: CPUFreq policy not found\n", __func__);
   428			return -EPROBE_DEFER;
   429		}
   430	
   431		/* Register cooling device */
   432		data->cool_dev = cpufreq_cooling_register(data->policy);
   433		if (IS_ERR(data->cool_dev)) {
   434			int ret = PTR_ERR(data->cool_dev);
   435	
   436			dev_err(bgp->dev, "Failed to register cpu cooling device %d\n",
   437				ret);
   438			cpufreq_cpu_put(data->policy);
   439	
   440			return ret;
   441		}
   442	
   443		data->mode = THERMAL_DEVICE_ENABLED;
   444	
   445		INIT_WORK(&data->thermal_wq, k3_thermal_work);
   446	
   447		return 0;
   448	}
   449	
 > 450	int ti_thermal_unregister_cpu_cooling(struct k3_j72xx_bandgap *bgp, int id)
   451	{
   452		struct k3_thermal_data *data;
   453	
   454		data = bgp->ts_data[id];
   455	
   456		if (!IS_ERR_OR_NULL(data)) {
   457			cpufreq_cooling_unregister(data->cool_dev);
   458			if (data->policy)
   459				cpufreq_cpu_put(data->policy);
   460		}
   461	
   462		return 0;
   463	}
   464	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
