Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D16681FAF
	for <oe-kbuild-all@lists.linux.dev>; Sun,  6 Aug 2023 07:37:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691307427; x=1722843427;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=WXFXxR5jzBNEu5woOgVJZ0tk5jUrw/muIlfz5y8MSvE=;
  b=Xnjh7qb8oIo/8M921/k+vDOZS5+AmCvgh51uMdE3i96TlcuKgoH9CD7l
   h11ZyBaFYmN7/G+MhHRJIeoYIMjBGXDzGvM/dtPtf3oYx5W923AAjpZE4
   3TU/Xb5uKTVgbV1SvTIZzrcwSQa+OW//xZJBHmhd8d5dqVc/EjzSmWHf5
   g6E1wbpSPI0eZuUySiu1mAl7of4QePAaHsv4NK77cA3yBeC5CX2mhPZW5
   WpF5aLTcuLPhW2831Sa26z7BWIwAgGntiefRjriEDlbO0+4Nmvwc1OVgA
   ZcRr6nG80E2w/ckVTtfb7HwrPYHfhfuiTAI0Ov3Xruqp0MA/Z/lZZnwZ4
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10793"; a="436693042"
X-IronPort-AV: E=Sophos;i="6.01,259,1684825200"; 
   d="scan'208";a="436693042"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Aug 2023 00:37:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10793"; a="730539161"
X-IronPort-AV: E=Sophos;i="6.01,259,1684825200"; 
   d="scan'208";a="730539161"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 06 Aug 2023 00:37:05 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qSYK0-00047H-3D;
	Sun, 06 Aug 2023 07:37:04 +0000
Date: Sun, 6 Aug 2023 15:36:45 +0800
From: kernel test robot <lkp@intel.com>
To: Ramesh Babu <ramesh.babu@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, "Pan, Kris" <kris.pan@intel.com>,
	Guneshwor Singh <guneshwor.o.singh@intel.com>
Subject: [intel-lts:4.19/android_s 3772/30000]
 drivers/mfd/arizona-i2c.c:131:18: sparse: sparse: Using plain integer as
 NULL pointer
Message-ID: <202308061521.2Y4a32I5-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel/linux-intel-lts.git 4.19/android_s
head:   7f46da99d47faba52b98b09371755ba4821a116d
commit: 90f1d221943f2adfc6a62813733d6dc0347ab20c [3772/30000] ASoC: mfd: Intel changes for WM8281 integration on K4.0
config: sh-randconfig-r093-20230806 (https://download.01.org/0day-ci/archive/20230806/202308061521.2Y4a32I5-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230806/202308061521.2Y4a32I5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308061521.2Y4a32I5-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/mfd/arizona-i2c.c:131:18: sparse: sparse: Using plain integer as NULL pointer
   In file included from include/linux/gfp.h:6,
                    from include/linux/idr.h:16,
                    from include/linux/kernfs.h:14,
                    from include/linux/sysfs.h:16,
                    from include/linux/kobject.h:20,
                    from include/linux/device.h:16,
                    from include/linux/i2c.h:30,
                    from drivers/mfd/arizona-i2c.c:14:
   include/linux/mmzone.h: In function '__nr_to_section':
   include/linux/mmzone.h:1156:13: warning: the comparison will always evaluate as 'true' for the address of 'mem_section' will never be NULL [-Waddress]
    1156 |         if (!mem_section[SECTION_NR_TO_ROOT(nr)])
         |             ^
   include/linux/mmzone.h:1147:27: note: 'mem_section' declared here
    1147 | extern struct mem_section mem_section[NR_SECTION_ROOTS][SECTIONS_PER_ROOT];
         |                           ^~~~~~~~~~~
   drivers/mfd/arizona-i2c.c: At top level:
   drivers/mfd/arizona-i2c.c:115:40: warning: 'micd_ctp_ranges' defined but not used [-Wunused-const-variable=]
     115 | static const struct arizona_micd_range micd_ctp_ranges[] = {
         |                                        ^~~~~~~~~~~~~~~

vim +131 drivers/mfd/arizona-i2c.c

   129	
   130	static struct arizona_pdata __maybe_unused florida_pdata  = {
 > 131		.reset = 0, /*No Reset GPIO from AP, use SW reset*/
   132		.irq_flags = IRQF_TRIGGER_LOW | IRQF_ONESHOT,
   133		.clk32k_src = ARIZONA_32KZ_MCLK2, /*Onboard OSC provides 32K on MCLK2*/
   134		/*
   135		 * IN1 uses both MICBIAS1 and MICBIAS2 based on jack polarity,
   136		 * the below values in dmic_ref only has meaning for DMIC's and not
   137		 * AMIC's
   138		 */
   139	#ifdef CONFIG_SND_SOC_INTEL_CNL_FPGA
   140		.dmic_ref = {ARIZONA_DMIC_MICBIAS1, ARIZONA_DMIC_MICBIAS3, 0, 0},
   141		.inmode = {ARIZONA_INMODE_DIFF, ARIZONA_INMODE_DMIC, 0, 0},
   142	#else
   143		.dmic_ref = {ARIZONA_DMIC_MICBIAS1, 0, ARIZONA_DMIC_MICVDD, 0},
   144		.inmode = {ARIZONA_INMODE_SE, 0, ARIZONA_INMODE_DMIC, 0},
   145	#endif
   146		.gpio_base = 0, /* Base allocated by gpio core */
   147		.micd_pol_gpio = 2, /* GPIO3 (offset 2 from gpio_base) of the codec */
   148		.micd_configs = micd_modes,
   149		.num_micd_configs = ARRAY_SIZE(micd_modes),
   150		.micd_force_micbias = true,
   151	};
   152	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
