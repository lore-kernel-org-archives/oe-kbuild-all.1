Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D34C77F
	for <oe-kbuild-all@lists.linux.dev>; Sun, 24 Sep 2023 10:12:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695550366; x=1727086366;
  h=date:from:cc:subject:message-id:mime-version;
  bh=ShHAsM6SM/CWsgT31Je150AusQrBD3/l5GCZjTH7d3E=;
  b=n80MGB/AvDZ8hcf1LfkWgpnnf0as3UyxUs8cFivZdYBQ+0Gdk0c4gino
   QwwdumpOR51Ya0BlbRQGW9zrGUtUa6ebojMJ7iZvxdpPdb2o7MPTSp03U
   d73XezBTxpIKHSTdTfmqlb9l3Y9YaIMJC77JyBnX2veYnT3+wmqEjLfxy
   mI25X7E+XD8Itg6DP0w+kJigf6U3cb0fHYCZJmPDwIMA3GI4w+Ej4T6Tj
   aJK+ZoPm9JG3XxzpwHj0Vq5jRDWKDUosqT81Z+86vSQePEKgg+Gz+xB5u
   6K5vgsEgWnanxJbO0RqveSpzziXYFxAHd1rdsy/9Hh21y/e9JEQmixh7k
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10842"; a="378359187"
X-IronPort-AV: E=Sophos;i="6.03,173,1694761200"; 
   d="scan'208";a="378359187"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Sep 2023 03:12:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10842"; a="777359010"
X-IronPort-AV: E=Sophos;i="6.03,173,1694761200"; 
   d="scan'208";a="777359010"
Received: from lkp-server02.sh.intel.com (HELO 493f6c7fed5d) ([10.239.97.151])
  by orsmga008.jf.intel.com with ESMTP; 24 Sep 2023 03:12:44 -0700
Received: from kbuild by 493f6c7fed5d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qkM6U-0003TR-0k
	for oe-kbuild-all@lists.linux.dev;
	Sun, 24 Sep 2023 10:12:42 +0000
Date: Sun, 24 Sep 2023 18:12:42 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jsarha:topic/cros-sof-v4.19 2662/6555]
 drivers/mmc/host/sdhci-msm.c:1048:12: warning:
 'sdhci_msm_restore_sdr_dll_config' defined but not used
Message-ID: <202309241812.2UOnEFBI-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jsarha/linux topic/cros-sof-v4.19
head:   d7a3e91d8d16d1ef8653deec5a1fffc4de034a0c
commit: fb98d451bc99248bf9b0e562c18a68d8f8b68169 [2662/6555] FROMGIT: mmc: sdhci-msm: Re-initialize DLL if MCLK is gated dynamically
config: arm-randconfig-001-20230922 (https://download.01.org/0day-ci/archive/20230924/202309241812.2UOnEFBI-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230924/202309241812.2UOnEFBI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309241812.2UOnEFBI-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/mmc/host/sdhci-msm.c:17:
   include/linux/module.h:140:14: warning: 'cleanup_module' specifies less restrictive attribute than its target 'sdhci_msm_driver_exit': 'cold' [-Wmissing-attributes]
     140 |         void cleanup_module(void) __attribute__((alias(#exitfn)));
         |              ^~~~~~~~~~~~~~
   include/linux/device.h:1585:1: note: in expansion of macro 'module_exit'
    1585 | module_exit(__driver##_exit);
         | ^~~~~~~~~~~
   include/linux/platform_device.h:228:9: note: in expansion of macro 'module_driver'
     228 |         module_driver(__platform_driver, platform_driver_register, \
         |         ^~~~~~~~~~~~~
   drivers/mmc/host/sdhci-msm.c:2011:1: note: in expansion of macro 'module_platform_driver'
    2011 | module_platform_driver(sdhci_msm_driver);
         | ^~~~~~~~~~~~~~~~~~~~~~
   In file included from include/linux/node.h:18,
                    from include/linux/cpu.h:17,
                    from include/linux/of_device.h:5,
                    from drivers/mmc/host/sdhci-msm.c:18:
   drivers/mmc/host/sdhci-msm.c:2011:24: note: 'cleanup_module' target declared here
    2011 | module_platform_driver(sdhci_msm_driver);
         |                        ^~~~~~~~~~~~~~~~
   include/linux/device.h:1581:20: note: in definition of macro 'module_driver'
    1581 | static void __exit __driver##_exit(void) \
         |                    ^~~~~~~~
   drivers/mmc/host/sdhci-msm.c:2011:1: note: in expansion of macro 'module_platform_driver'
    2011 | module_platform_driver(sdhci_msm_driver);
         | ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/module.h:134:13: warning: 'init_module' specifies less restrictive attribute than its target 'sdhci_msm_driver_init': 'cold' [-Wmissing-attributes]
     134 |         int init_module(void) __attribute__((alias(#initfn)));
         |             ^~~~~~~~~~~
   include/linux/device.h:1580:1: note: in expansion of macro 'module_init'
    1580 | module_init(__driver##_init); \
         | ^~~~~~~~~~~
   include/linux/platform_device.h:228:9: note: in expansion of macro 'module_driver'
     228 |         module_driver(__platform_driver, platform_driver_register, \
         |         ^~~~~~~~~~~~~
   drivers/mmc/host/sdhci-msm.c:2011:1: note: in expansion of macro 'module_platform_driver'
    2011 | module_platform_driver(sdhci_msm_driver);
         | ^~~~~~~~~~~~~~~~~~~~~~
   drivers/mmc/host/sdhci-msm.c:2011:24: note: 'init_module' target declared here
    2011 | module_platform_driver(sdhci_msm_driver);
         |                        ^~~~~~~~~~~~~~~~
   include/linux/device.h:1576:19: note: in definition of macro 'module_driver'
    1576 | static int __init __driver##_init(void) \
         |                   ^~~~~~~~
   drivers/mmc/host/sdhci-msm.c:2011:1: note: in expansion of macro 'module_platform_driver'
    2011 | module_platform_driver(sdhci_msm_driver);
         | ^~~~~~~~~~~~~~~~~~~~~~
>> drivers/mmc/host/sdhci-msm.c:1048:12: warning: 'sdhci_msm_restore_sdr_dll_config' defined but not used [-Wunused-function]
    1048 | static int sdhci_msm_restore_sdr_dll_config(struct sdhci_host *host)
         |            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/mmc/host/sdhci-msm.c:1498: warning: Function parameter or member 'host' not described in '__sdhci_msm_set_clock'
   drivers/mmc/host/sdhci-msm.c:1498: warning: Function parameter or member 'clock' not described in '__sdhci_msm_set_clock'


vim +/sdhci_msm_restore_sdr_dll_config +1048 drivers/mmc/host/sdhci-msm.c

  1047	
> 1048	static int sdhci_msm_restore_sdr_dll_config(struct sdhci_host *host)
  1049	{
  1050		struct sdhci_pltfm_host *pltfm_host = sdhci_priv(host);
  1051		struct sdhci_msm_host *msm_host = sdhci_pltfm_priv(pltfm_host);
  1052		int ret;
  1053	
  1054		/*
  1055		 * SDR DLL comes into picture only for timing modes which needs
  1056		 * tuning.
  1057		 */
  1058		if (!sdhci_msm_is_tuning_needed(host))
  1059			return 0;
  1060	
  1061		/* Reset the tuning block */
  1062		ret = msm_init_cm_dll(host);
  1063		if (ret)
  1064			return ret;
  1065	
  1066		/* Restore the tuning block */
  1067		ret = msm_config_cm_dll_phase(host, msm_host->saved_tuning_phase);
  1068	
  1069		return ret;
  1070	}
  1071	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
