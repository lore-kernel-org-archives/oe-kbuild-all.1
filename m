Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BC53210D
	for <oe-kbuild-all@lists.linux.dev>; Sun, 15 Oct 2023 10:42:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bHIksbwq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697366551; x=1728902551;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=B+PyauTKFbeBJj3RyY+9Uph/+LeeiLaKegMM5ToI2Eg=;
  b=bHIksbwq/Cnoc247mSYs59TQx9w/ax1+XQyWwWSOnVydLjvoZQw2lnC+
   gBATeI9ISBSxyRtLQZW4vhOzMbmNEruciwMOgWgAO9H6vVp7A1QxVq5gl
   tpAGnHGNlLD48CS3tccw+VHQ2piIlNd8MJ+yimWUkMkSfmvvXoZhRWh3W
   ILDb7dvJyhBxHJym5YGbkAbrfPSBkjN46kDUszJPTTwYETltEhK26ffqA
   KDfTt5XyV9odL5ITGn9KVZHLCiG+ixRWCF1M9EOyuZjnDtv+h/6fxKkOs
   3KOaQbh2+8gLPwYy/e0XB5hEIFLj9cFiHruJFlTlV/PpLqSyPQIyvW3bM
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10863"; a="384253558"
X-IronPort-AV: E=Sophos;i="6.03,226,1694761200"; 
   d="scan'208";a="384253558"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Oct 2023 03:42:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10863"; a="784734538"
X-IronPort-AV: E=Sophos;i="6.03,226,1694761200"; 
   d="scan'208";a="784734538"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by orsmga008.jf.intel.com with ESMTP; 15 Oct 2023 03:42:29 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qryZn-0007Ka-0H;
	Sun, 15 Oct 2023 10:42:27 +0000
Date: Sun, 15 Oct 2023 18:42:20 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:pr/642 2284/30000]
 arch/arm/mach-imx/busfreq-imx.c:89: warning: Cannot understand  * @brief
  Functions to init and update the busfreq function of
Message-ID: <202310151859.Wgel4Cta-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Dong,

First bad commit (maybe != root cause):

tree:   https://github.com/Freescale/linux-fslc pr/642
head:   c8b7cf62c7fea8456dec789d550b8006d73b8f04
commit: 9872ac864756839cbe0557ba4cdc975c44ec70d7 [2284/30000] Merge branch 'clock/next' into next
config: arm-randconfig-001-20231013 (https://download.01.org/0day-ci/archive/20231015/202310151859.Wgel4Cta-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231015/202310151859.Wgel4Cta-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310151859.Wgel4Cta-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/arm/mach-imx/busfreq-imx.c:89: warning: Cannot understand  * @brief  Functions to init and update the busfreq function of
    on line 89 - I thought it was a doc line
--
   arch/arm/mach-imx/busfreq_ddr3.c:217:5: warning: no previous prototype for 'can_change_ddr_freq' [-Wmissing-prototypes]
     217 | int can_change_ddr_freq(void)
         |     ^~~~~~~~~~~~~~~~~~~
   arch/arm/mach-imx/busfreq_ddr3.c:254:5: warning: no previous prototype for 'update_ddr_freq_imx_smp' [-Wmissing-prototypes]
     254 | int update_ddr_freq_imx_smp(int ddr_rate)
         |     ^~~~~~~~~~~~~~~~~~~~~~~
>> arch/arm/mach-imx/busfreq_ddr3.c:379:5: warning: no previous prototype for 'update_ddr_freq_imx6_up' [-Wmissing-prototypes]
     379 | int update_ddr_freq_imx6_up(int ddr_rate)
         |     ^~~~~~~~~~~~~~~~~~~~~~~
   arch/arm/mach-imx/busfreq_ddr3.c:424:5: warning: no previous prototype for 'init_ddrc_ddr_settings' [-Wmissing-prototypes]
     424 | int init_ddrc_ddr_settings(struct platform_device *busfreq_pdev)
         |     ^~~~~~~~~~~~~~~~~~~~~~
>> arch/arm/mach-imx/busfreq_ddr3.c:496:5: warning: no previous prototype for 'init_mmdc_ddr3_settings_imx6_up' [-Wmissing-prototypes]
     496 | int init_mmdc_ddr3_settings_imx6_up(struct platform_device *busfreq_pdev)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> arch/arm/mach-imx/busfreq_ddr3.c:593:5: warning: no previous prototype for 'init_mmdc_ddr3_settings_imx6_smp' [-Wmissing-prototypes]
     593 | int init_mmdc_ddr3_settings_imx6_smp(struct platform_device *busfreq_pdev)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from arch/arm/mach-imx/busfreq_ddr3.c:48:
   arch/arm/mach-imx/common.h:183:18: warning: 'imx53_suspend_sz' defined but not used [-Wunused-const-variable=]
     183 | static const u32 imx53_suspend_sz;
         |                  ^~~~~~~~~~~~~~~~
--
>> arch/arm/mach-imx/pm-imx7.c:874:13: warning: no previous prototype for 'imx7_pm_set_ccm_base' [-Wmissing-prototypes]
     874 | void __init imx7_pm_set_ccm_base(void __iomem *base)
         |             ^~~~~~~~~~~~~~~~~~~~
   In file included from arch/arm/mach-imx/pm-imx7.c:43:
   arch/arm/mach-imx/common.h:183:18: warning: 'imx53_suspend_sz' defined but not used [-Wunused-const-variable=]
     183 | static const u32 imx53_suspend_sz;
         |                  ^~~~~~~~~~~~~~~~
--
>> arch/arm/mach-imx/gpc.c:116:6: warning: no previous prototype for 'imx_gpc_usb_wakeup_enabled' [-Wmissing-prototypes]
     116 | bool imx_gpc_usb_wakeup_enabled(void)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~
>> arch/arm/mach-imx/gpc.c:135:6: warning: no previous prototype for 'imx_gpc_enet_wakeup_enabled' [-Wmissing-prototypes]
     135 | bool imx_gpc_enet_wakeup_enabled(void)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~
>> arch/arm/mach-imx/gpc.c:371:5: warning: no previous prototype for 'imx_gpc_mf_power_on' [-Wmissing-prototypes]
     371 | int imx_gpc_mf_power_on(unsigned int irq, unsigned int on)
         |     ^~~~~~~~~~~~~~~~~~~
>> arch/arm/mach-imx/gpc.c:387:5: warning: no previous prototype for 'imx_gpc_mf_request_on' [-Wmissing-prototypes]
     387 | int imx_gpc_mf_request_on(unsigned int irq, unsigned int on)
         |     ^~~~~~~~~~~~~~~~~~~~~
   In file included from arch/arm/mach-imx/gpc.c:14:
   arch/arm/mach-imx/common.h:183:18: warning: 'imx53_suspend_sz' defined but not used [-Wunused-const-variable=]
     183 | static const u32 imx53_suspend_sz;
         |                  ^~~~~~~~~~~~~~~~
--
>> arch/arm/mach-imx/busfreq_lpddr2.c:124:5: warning: no previous prototype for 'update_lpddr2_freq' [-Wmissing-prototypes]
     124 | int update_lpddr2_freq(int ddr_rate)
         |     ^~~~~~~~~~~~~~~~~~
>> arch/arm/mach-imx/busfreq_lpddr2.c:159:5: warning: no previous prototype for 'init_mmdc_lpddr2_settings' [-Wmissing-prototypes]
     159 | int init_mmdc_lpddr2_settings(struct platform_device *busfreq_pdev)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~
>> arch/arm/mach-imx/busfreq_lpddr2.c:185:5: warning: no previous prototype for 'update_lpddr2_freq_smp' [-Wmissing-prototypes]
     185 | int update_lpddr2_freq_smp(int ddr_rate)
         |     ^~~~~~~~~~~~~~~~~~~~~~
>> arch/arm/mach-imx/busfreq_lpddr2.c:283:5: warning: no previous prototype for 'init_mmdc_lpddr2_settings_mx6q' [-Wmissing-prototypes]
     283 | int init_mmdc_lpddr2_settings_mx6q(struct platform_device *busfreq_pdev)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from arch/arm/mach-imx/busfreq_lpddr2.c:48:
   arch/arm/mach-imx/common.h:183:18: warning: 'imx53_suspend_sz' defined but not used [-Wunused-const-variable=]
     183 | static const u32 imx53_suspend_sz;
         |                  ^~~~~~~~~~~~~~~~
--
>> arch/arm/mach-imx/gpcv2.c:148:6: warning: no previous prototype for 'imx_gpcv2_mask_all' [-Wmissing-prototypes]
     148 | void imx_gpcv2_mask_all(void)
         |      ^~~~~~~~~~~~~~~~~~
>> arch/arm/mach-imx/gpcv2.c:159:6: warning: no previous prototype for 'imx_gpcv2_restore_all' [-Wmissing-prototypes]
     159 | void imx_gpcv2_restore_all(void)
         |      ^~~~~~~~~~~~~~~~~~~~~
>> arch/arm/mach-imx/gpcv2.c:168:6: warning: no previous prototype for 'imx_gpcv2_hwirq_unmask' [-Wmissing-prototypes]
     168 | void imx_gpcv2_hwirq_unmask(unsigned int hwirq)
         |      ^~~~~~~~~~~~~~~~~~~~~~
>> arch/arm/mach-imx/gpcv2.c:179:6: warning: no previous prototype for 'imx_gpcv2_hwirq_mask' [-Wmissing-prototypes]
     179 | void imx_gpcv2_hwirq_mask(unsigned int hwirq)
         |      ^~~~~~~~~~~~~~~~~~~~
>> arch/arm/mach-imx/gpcv2.c:202:6: warning: no previous prototype for 'imx_gpcv2_set_slot_ack' [-Wmissing-prototypes]
     202 | void imx_gpcv2_set_slot_ack(u32 index, enum imx_gpc_slot m_core,
         |      ^~~~~~~~~~~~~~~~~~~~~~
>> arch/arm/mach-imx/gpcv2.c:289:6: warning: no previous prototype for 'imx_gpcv2_set_plat_power_gate_by_lpm' [-Wmissing-prototypes]
     289 | void imx_gpcv2_set_plat_power_gate_by_lpm(bool pdn)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> arch/arm/mach-imx/gpcv2.c:300:6: warning: no previous prototype for 'imx_gpcv2_set_m_core_pgc' [-Wmissing-prototypes]
     300 | void imx_gpcv2_set_m_core_pgc(bool enable, u32 offset)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~
>> arch/arm/mach-imx/gpcv2.c:327:6: warning: no previous prototype for 'imx_gpcv2_set_cpu_power_gate_by_wfi' [-Wmissing-prototypes]
     327 | void imx_gpcv2_set_cpu_power_gate_by_wfi(u32 cpu, bool pdn)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> arch/arm/mach-imx/gpcv2.c:361:6: warning: no previous prototype for 'imx_gpcv2_set_cpu_power_gate_by_lpm' [-Wmissing-prototypes]
     361 | void imx_gpcv2_set_cpu_power_gate_by_lpm(u32 cpu, bool pdn)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> arch/arm/mach-imx/gpcv2.c:430:6: warning: no previous prototype for 'imx_gpcv2_set_mix_phy_gate_by_lpm' [-Wmissing-prototypes]
     430 | void imx_gpcv2_set_mix_phy_gate_by_lpm(u32 pdn_index, u32 pup_index)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from arch/arm/mach-imx/gpcv2.c:24:
   arch/arm/mach-imx/common.h:183:18: warning: 'imx53_suspend_sz' defined but not used [-Wunused-const-variable=]
     183 | static const u32 imx53_suspend_sz;
         |                  ^~~~~~~~~~~~~~~~


vim +89 arch/arm/mach-imx/busfreq-imx.c

dc782dd284d797 Anson Huang 2019-04-12  86  
dc782dd284d797 Anson Huang 2019-04-12  87  
dc782dd284d797 Anson Huang 2019-04-12  88  /**
dc782dd284d797 Anson Huang 2019-04-12 @89   * @brief  Functions to init and update the busfreq function of
dc782dd284d797 Anson Huang 2019-04-12  90   *         device and memory type
dc782dd284d797 Anson Huang 2019-04-12  91   */
dc782dd284d797 Anson Huang 2019-04-12  92  static struct busfreq_func {
dc782dd284d797 Anson Huang 2019-04-12  93  	int (*init)(struct platform_device *dev);
dc782dd284d797 Anson Huang 2019-04-12  94  	int (*update)(int ddr_rate);
dc782dd284d797 Anson Huang 2019-04-12  95  } busfreq_func = {NULL, NULL};
dc782dd284d797 Anson Huang 2019-04-12  96  

:::::: The code at line 89 was first introduced by commit
:::::: dc782dd284d797c5ca591b945c5a51e03698fb47 ARM: imx: add i.MX7D bus-freq support

:::::: TO: Anson Huang <Anson.Huang@nxp.com>
:::::: CC: Dong Aisheng <aisheng.dong@nxp.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
