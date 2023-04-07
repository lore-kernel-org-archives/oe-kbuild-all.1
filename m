Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAE2C2583
	for <oe-kbuild-all@lists.linux.dev>; Fri,  7 Apr 2023 12:50:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680871847; x=1712407847;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=pjvRZXf/poztS4A7rFGy10p5Gf0c+nEJ35FBQad/lsU=;
  b=bE5S17Fp+JSSoxUP2dYpu50kWz6/nvokxn3LH6XNAc/ZlrVR8cnf1eEh
   um//oRoouK/TgFTX7/dZDCUR+wr0LWVt74kWAaEye3HOqKMZFicBp6YMM
   WauYNexmi6AHYbJ4qFfjrr5Wp2xznjSht6CGH7PD9UyXwMykDKcDnyKHz
   Lhaoi98ucWWLZ2E1e29hOaTlv9twj9niL4BrTmtVKBWF7q1IFiGqtqDLA
   0QbDFWbOzzkb+LJr9yZ1hjePerI3Pcp8/SvW8vQySN30XFZGiqYNwEAeT
   dt3N43X2AF9uhw039u1BsRW5elOuftEtqWip1Mm8kW++lX6I87qtuW+Uc
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10672"; a="340472125"
X-IronPort-AV: E=Sophos;i="5.98,326,1673942400"; 
   d="scan'208";a="340472125"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2023 05:50:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10672"; a="1017243623"
X-IronPort-AV: E=Sophos;i="5.98,326,1673942400"; 
   d="scan'208";a="1017243623"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 07 Apr 2023 05:50:45 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pklYC-000SV1-32;
	Fri, 07 Apr 2023 12:50:44 +0000
Date: Fri, 7 Apr 2023 20:50:17 +0800
From: kernel test robot <lkp@intel.com>
To: Keerthy <j-keerthy@ti.com>
Cc: oe-kbuild-all@lists.linux.dev, vigneshr@ti.com, nm@ti.com,
	Praneeth Bajjuri <praneeth@ti.com>
Subject: [ti:ti-linux-5.10.y-cicd 19558/22025]
 drivers/thermal/k3_j72xx_bandgap.c:408:5: warning: no previous prototype for
 'k3_thermal_register_cpu_cooling'
Message-ID: <202304072035.rEO0jufp-lkp@intel.com>
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

tree:   git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git ti-linux-5.10.y-cicd
head:   991c5ce91e43cb620f534dc9fe7b0ad21f4f4388
commit: 22d3f82184798e29c81c2a33b37d9e25d6869626 [19558/22025] thermal: k3_j72xx_bandgap: Add cooling device support
config: csky-randconfig-r013-20230403 (https://download.01.org/0day-ci/archive/20230407/202304072035.rEO0jufp-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        git remote add ti git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git
        git fetch --no-tags ti ti-linux-5.10.y-cicd
        git checkout 22d3f82184798e29c81c2a33b37d9e25d6869626
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=csky olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=csky SHELL=/bin/bash drivers/thermal/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304072035.rEO0jufp-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/thermal/k3_j72xx_bandgap.c: In function 'k3_thermal_get_trend':
   drivers/thermal/k3_j72xx_bandgap.c:289:13: warning: variable 'id' set but not used [-Wunused-but-set-variable]
     289 |         int id, tr, ret = 0;
         |             ^~
   drivers/thermal/k3_j72xx_bandgap.c: At top level:
>> drivers/thermal/k3_j72xx_bandgap.c:408:5: warning: no previous prototype for 'k3_thermal_register_cpu_cooling' [-Wmissing-prototypes]
     408 | int k3_thermal_register_cpu_cooling(struct k3_j72xx_bandgap *bgp, int id)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/thermal/k3_j72xx_bandgap.c:450:5: warning: no previous prototype for 'ti_thermal_unregister_cpu_cooling' [-Wmissing-prototypes]
     450 | int ti_thermal_unregister_cpu_cooling(struct k3_j72xx_bandgap *bgp, int id)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/k3_thermal_register_cpu_cooling +408 drivers/thermal/k3_j72xx_bandgap.c

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
