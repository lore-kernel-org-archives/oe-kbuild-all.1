Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B5BC100C6
	for <oe-kbuild-all@lists.linux.dev>; Mon,  3 Jul 2023 19:08:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1688411303; x=1719947303;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=R4Bms0hXJrqtEiZKys4mZhezepGTYfQAa4RpsPT4x1A=;
  b=jLzL29TyxFJnOoJP89okwL8IACics0V8G6wLyXaYLUAbFB9yBo2E8/k1
   IO1Ahib9OnMdbJkST6G3iph3z3N+YKZgb7LhZmqCd0b3IlLsTAEu6eYm9
   Ih4kGT310lp32kpeMy6gCBccXSXsSVvLQShyCt2/wo03tkAWBs/wvmcFb
   K37U/8X1s5NdadK/W3vR5vesDy98jx4phZ+1iFmiD4B+DjbhV/2HWfh/2
   mZrMz61fmeEsMidhdWrl3pBBmAeD+Ds0sVl6M2ikPorUKlfMk5s7Zm0iJ
   Uc1/S41ZH+c7cmkdED+iZvnzdBqvGSS6tVS+uKHDhB6z0Xa1f6Tmtdo9R
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10760"; a="342541442"
X-IronPort-AV: E=Sophos;i="6.01,178,1684825200"; 
   d="scan'208";a="342541442"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jul 2023 12:08:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10760"; a="748201578"
X-IronPort-AV: E=Sophos;i="6.01,178,1684825200"; 
   d="scan'208";a="748201578"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 03 Jul 2023 12:08:20 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qGOuJ-000Had-1J;
	Mon, 03 Jul 2023 19:08:19 +0000
Date: Tue, 4 Jul 2023 03:07:23 +0800
From: kernel test robot <lkp@intel.com>
To: Keerthy <j-keerthy@ti.com>
Cc: oe-kbuild-all@lists.linux.dev, vigneshr@ti.com, nm@ti.com,
	Apurva Nandan <a-nandan@ti.com>
Subject: [ti:ti-rt-linux-6.1.y-cicd 68/128]
 drivers/thermal/k3_j72xx_bandgap.c:407:5: warning: no previous prototype for
 function 'k3_thermal_register_cpu_cooling'
Message-ID: <202307040254.vDiu6jRh-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Keerthy,

FYI, the error/warning still remains.

tree:   git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git ti-rt-linux-6.1.y-cicd
head:   11eab69ca57cdcb02cd5cd1bcb1d722724b581dd
commit: 38a145da1625c46c90e453d6e28537e6f97e2720 [68/128] thermal: k3_j72xx_bandgap: Add cooling device support
config: arm64-randconfig-r016-20230703 (https://download.01.org/0day-ci/archive/20230704/202307040254.vDiu6jRh-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce: (https://download.01.org/0day-ci/archive/20230704/202307040254.vDiu6jRh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307040254.vDiu6jRh-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/thermal/k3_j72xx_bandgap.c:288:6: warning: variable 'id' set but not used [-Wunused-but-set-variable]
     288 |         int id, tr, ret = 0;
         |             ^
>> drivers/thermal/k3_j72xx_bandgap.c:407:5: warning: no previous prototype for function 'k3_thermal_register_cpu_cooling' [-Wmissing-prototypes]
     407 | int k3_thermal_register_cpu_cooling(struct k3_j72xx_bandgap *bgp, int id)
         |     ^
   drivers/thermal/k3_j72xx_bandgap.c:407:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     407 | int k3_thermal_register_cpu_cooling(struct k3_j72xx_bandgap *bgp, int id)
         | ^
         | static 
>> drivers/thermal/k3_j72xx_bandgap.c:449:5: warning: no previous prototype for function 'ti_thermal_unregister_cpu_cooling' [-Wmissing-prototypes]
     449 | int ti_thermal_unregister_cpu_cooling(struct k3_j72xx_bandgap *bgp, int id)
         |     ^
   drivers/thermal/k3_j72xx_bandgap.c:449:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     449 | int ti_thermal_unregister_cpu_cooling(struct k3_j72xx_bandgap *bgp, int id)
         | ^
         | static 
   3 warnings generated.


vim +/k3_thermal_register_cpu_cooling +407 drivers/thermal/k3_j72xx_bandgap.c

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
