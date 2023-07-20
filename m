Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 985AD39B
	for <oe-kbuild-all@lists.linux.dev>; Thu, 20 Jul 2023 01:08:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689815289; x=1721351289;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=kewh3byW0eEkENTnQkmOA1dmXpBKAZY0Z8RnXdJbpuI=;
  b=mgtMNX9L1XdewCCbgmFy2GhIorHYi1t244XySK7kX/iGI+RYfaUMRfpi
   iy7CldTfd29aQs0CUNQRmUDp4L6azjjTEhsqqdaL/LUNtaVtjbMS4+qtn
   5Dk28MX41vPsBJBfroduayas2jwmNXxfbaHIFr6tRp1ga5Xz4Uuepni9i
   tm7H9n/miODppMdamkzaMLubUDvcrb81WapyqTvvZiHJXfeNfSvH92eVH
   gNglqIT0uhU1JxfL0PRW0XvqQfUBd+Nd7sUxb4ru6rV+zogSld5WKKpHu
   a63lfqMZZ8ouDWQ3c3k1lUVL9dLZZhU8o4G3+x6fNN11vFI7RLE24wSJW
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10776"; a="364064793"
X-IronPort-AV: E=Sophos;i="6.01,216,1684825200"; 
   d="scan'208";a="364064793"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jul 2023 18:08:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10776"; a="674514638"
X-IronPort-AV: E=Sophos;i="6.01,216,1684825200"; 
   d="scan'208";a="674514638"
Received: from lkp-server02.sh.intel.com (HELO 36946fcf73d7) ([10.239.97.151])
  by orsmga003.jf.intel.com with ESMTP; 19 Jul 2023 18:08:07 -0700
Received: from kbuild by 36946fcf73d7 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qMI9G-0005dl-2F;
	Thu, 20 Jul 2023 01:08:06 +0000
Date: Thu, 20 Jul 2023 09:07:21 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:pr/638 24/12469] arch/arm/mach-imx/common.c:136:6:
 warning: no previous prototype for 'imx6sll_lpddr2_freq_change'
Message-ID: <202307200923.emVfJ8AC-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Freescale/linux-fslc pr/638
head:   3f1f2ea7295505de340ba4089817ae1021920928
commit: e30da6831ebcd0bcbe7c36485526255eb66b354a [24/12469] ARM: imx: add i.MX7D bus-freq support
config: arm-randconfig-r011-20230720 (https://download.01.org/0day-ci/archive/20230720/202307200923.emVfJ8AC-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230720/202307200923.emVfJ8AC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307200923.emVfJ8AC-lkp@intel.com/

All warnings (new ones prefixed by >>):

   arch/arm/mach-imx/common.c:22:15: warning: no previous prototype for 'save_ttbr1' [-Wmissing-prototypes]
      22 | unsigned long save_ttbr1(void)
         |               ^~~~~~~~~~
   arch/arm/mach-imx/common.c:33:6: warning: no previous prototype for 'restore_ttbr1' [-Wmissing-prototypes]
      33 | void restore_ttbr1(unsigned long ttbr1)
         |      ^~~~~~~~~~~~~
   arch/arm/mach-imx/common.c:44:13: warning: no previous prototype for 'imx6_enet_mac_init' [-Wmissing-prototypes]
      44 | void __init imx6_enet_mac_init(const char *enet_compat, const char *ocotp_compat)
         |             ^~~~~~~~~~~~~~~~~~
   arch/arm/mach-imx/common.c: In function 'imx6_enet_mac_init':
   arch/arm/mach-imx/common.c:62:21: error: too few arguments to function 'of_get_mac_address'
      62 |                 if (of_get_mac_address(enet_np))
         |                     ^~~~~~~~~~~~~~~~~~
   In file included from arch/arm/mach-imx/common.c:14:
   include/linux/of_net.h:16:12: note: declared here
      16 | extern int of_get_mac_address(struct device_node *np, u8 *mac);
         |            ^~~~~~~~~~~~~~~~~~
   arch/arm/mach-imx/common.c: At top level:
>> arch/arm/mach-imx/common.c:136:6: warning: no previous prototype for 'imx6sll_lpddr2_freq_change' [-Wmissing-prototypes]
     136 | void imx6sll_lpddr2_freq_change(u32 freq, int bus_freq_mode) {}
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/arm/mach-imx/common.c:149:6: warning: no previous prototype for 'imx6ull_low_power_idle' [-Wmissing-prototypes]
     149 | void imx6ull_low_power_idle(void) {}
         |      ^~~~~~~~~~~~~~~~~~~~~~
>> arch/arm/mach-imx/common.c:163:6: warning: no previous prototype for 'imx7_smp_wfe' [-Wmissing-prototypes]
     163 | void imx7_smp_wfe(u32 cpuid, u32 ocram_base) {}
         |      ^~~~~~~~~~~~
>> arch/arm/mach-imx/common.c:164:6: warning: no previous prototype for 'imx7d_ddr3_freq_change' [-Wmissing-prototypes]
     164 | void imx7d_ddr3_freq_change(u32 freq) {}
         |      ^~~~~~~~~~~~~~~~~~~~~~


vim +/imx6sll_lpddr2_freq_change +136 arch/arm/mach-imx/common.c

   134	
   135	#if !defined(CONFIG_SOC_IMX6SLL)
 > 136	void imx6sll_lpddr2_freq_change(u32 freq, int bus_freq_mode) {}
   137	#endif
   138	
   139	#if !defined(CONFIG_SOC_IMX6SX) && !defined(CONFIG_SOC_IMX6UL)
   140	u32 imx6_up_ddr3_freq_change_start, imx6_up_ddr3_freq_change_end;
   141	struct imx6_busfreq_info {
   142	} __aligned(8);
   143	void imx6_up_ddr3_freq_change(struct imx6_busfreq_info *busfreq_info) {}
   144	void imx6_up_lpddr2_freq_change(u32 freq, int bus_freq_mode) {}
   145	#endif
   146	
   147	#if !defined(CONFIG_SOC_IMX6ULL)
   148	u32 mx6ull_lpm_wfi_start, mx6ull_lpm_wfi_end;
   149	void imx6ull_low_power_idle(void) {}
   150	#endif
   151	
   152	#if !defined(CONFIG_SOC_IMX6Q)
   153	u32 mx6_ddr3_freq_change_start, mx6_ddr3_freq_change_end;
   154	u32 mx6q_lpddr2_freq_change_start, mx6q_lpddr2_freq_change_end;
   155	u32 wfe_smp_freq_change_start, wfe_smp_freq_change_end;
   156	void mx6_ddr3_freq_change(u32 freq, void *ddr_settings,
   157		bool dll_mode, void *iomux_offsets) {}
   158	void mx6q_lpddr2_freq_change(u32 freq, void *ddr_settings) {}
   159	void wfe_smp_freq_change(u32 cpuid, u32 *ddr_freq_change_done) {}
   160	#endif
   161	
   162	#if !defined(CONFIG_SOC_IMX7D)
 > 163	void imx7_smp_wfe(u32 cpuid, u32 ocram_base) {}
 > 164	void imx7d_ddr3_freq_change(u32 freq) {}

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
