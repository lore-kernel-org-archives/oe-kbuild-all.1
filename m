Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDAE518454C
	for <oe-kbuild-all@lists.linux.dev>; Sat, 28 Sep 2024 14:22:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727533340; cv=none; b=Rz9rfAxASNjEuzZonZKS6aH3WE3VULUf2lVuh64SxWatZ/ia6uzTlqolEQ5a/lbQ2j2lf5xqunIyB34y/NP5ypE2qLCQeZQq2ARZcIR6fAYSoyuhmKZSJ4PWhc1aRZITEl3f6ttd34peZ7AC1wVs0eU5skVbqk0pYROYkfB8VCU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727533340; c=relaxed/simple;
	bh=UDivFHbnktvx5Ke2FqhlK4acqVIeedkHVlZBEoZLvTk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=PvFSi01LV7nGYa2FXdcXTz/fFEFpL7/hOq2q7Ljnd11UXMpe7GYgADHH7+aNM3inUzWiLlZG219pF8cuShs2pIAxh+iJg5ju8aEbb/hK/O48davx9dp4654NhIXZpML1BwbNUlZh+eoubo/gpszdciZz4PPkLPZJOVET6JgaifU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OkV1FL28; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OkV1FL28"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727533339; x=1759069339;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=UDivFHbnktvx5Ke2FqhlK4acqVIeedkHVlZBEoZLvTk=;
  b=OkV1FL28a54UrCKCFwGyv1fVK98j3kBXRqLbZw0zRaxNQ5+J7Ov8JsLX
   6EcwzTOlLXeQn5T3+KFDevudlvaQBOK5uYB8Yh58Mc6eBYDoHwd7qicOg
   vBZ28/11rDo2sO9+/e6A4sGP4+/qy9iVM3taH1EdngbVFulV09ixCDeUP
   oTuEM2Uc6UJz450xTVeymb8vSYzvC1HR+sFbBGhgf/IfeJL5G0JE8CJkH
   yOc9yso7EPbgcBGYypljVGoqN3zVhXXTTGjEus0LCiHj5WdISLHU1FKun
   sRPy+64B6tt+FFXUAYuRSaBctoPXl2Blg/SYDK0ambwWGgp/8Ts+097eD
   Q==;
X-CSE-ConnectionGUID: Id2/lGWYQ42zyN+wxvqwUw==
X-CSE-MsgGUID: s0TwaTnKS6+Kzs+VcpvNfA==
X-IronPort-AV: E=McAfee;i="6700,10204,11209"; a="26799584"
X-IronPort-AV: E=Sophos;i="6.11,160,1725346800"; 
   d="scan'208";a="26799584"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Sep 2024 07:22:18 -0700
X-CSE-ConnectionGUID: QU5FHB5QTQ2fCImsJ60qjA==
X-CSE-MsgGUID: 1gukxBTXQ+22LRHwbXEzEw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,160,1725346800"; 
   d="scan'208";a="77758028"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 28 Sep 2024 07:22:18 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1suYKs-000NK5-1x;
	Sat, 28 Sep 2024 14:22:14 +0000
Date: Sat, 28 Sep 2024 22:21:37 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:6.6-2.0.x-imx 5875/16788]
 arch/arm/mach-imx/mach-imx7ulp.c:22:24: warning: 'mx7ulp_io_desc' defined
 but not used
Message-ID: <202409282245.vUXo49RF-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Freescale/linux-fslc 6.6-2.0.x-imx
head:   ac32ba5fe66266329914d2020570364afe217bec
commit: 8edc700dd52e0961f046aa8e47e812efc10ae588 [5875/16788] Merge branch 'clock/next' into next
config: arm-randconfig-001-20240928 (https://download.01.org/0day-ci/archive/20240928/202409282245.vUXo49RF-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240928/202409282245.vUXo49RF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409282245.vUXo49RF-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/arm/mach-imx/mach-imx7ulp.c:22:24: warning: 'mx7ulp_io_desc' defined but not used [-Wunused-variable]
      22 | static struct map_desc mx7ulp_io_desc[] __initdata = {
         |                        ^~~~~~~~~~~~~~
   In file included from arch/arm/mach-imx/mach-imx7ulp.c:15:
   arch/arm/mach-imx/common.h:164:18: warning: 'imx53_suspend_sz' defined but not used [-Wunused-const-variable=]
     164 | static const u32 imx53_suspend_sz;
         |                  ^~~~~~~~~~~~~~~~
--
>> arch/arm/mach-imx/pm-imx7ulp.c:649:13: warning: no previous prototype for 'imx7ulp_pm_common_init' [-Wmissing-prototypes]
     649 | void __init imx7ulp_pm_common_init(const struct imx7ulp_pm_socdata
         |             ^~~~~~~~~~~~~~~~~~~~~~
   In file included from arch/arm/mach-imx/pm-imx7ulp.c:34:
   arch/arm/mach-imx/common.h:164:18: warning: 'imx53_suspend_sz' defined but not used [-Wunused-const-variable=]
     164 | static const u32 imx53_suspend_sz;
         |                  ^~~~~~~~~~~~~~~~
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
   arch/arm/mach-imx/common.h:164:18: warning: 'imx53_suspend_sz' defined but not used [-Wunused-const-variable=]
     164 | static const u32 imx53_suspend_sz;
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
   arch/arm/mach-imx/common.h:164:18: warning: 'imx53_suspend_sz' defined but not used [-Wunused-const-variable=]
     164 | static const u32 imx53_suspend_sz;
         |                  ^~~~~~~~~~~~~~~~
--
>> arch/arm/mach-imx/busfreq-imx.c:96: warning: Cannot understand  * @brief  Functions to init and update the busfreq function of
    on line 96 - I thought it was a doc line


vim +/mx7ulp_io_desc +22 arch/arm/mach-imx/mach-imx7ulp.c

9edf908a16c43c Anson Huang 2019-01-11  20  
eeff332d6fc9b2 Anson Huang 2019-08-07  21  /* static IO mapping, and ioremap() could always share the same mapping. */
eeff332d6fc9b2 Anson Huang 2019-08-07 @22  static struct map_desc mx7ulp_io_desc[] __initdata = {
eeff332d6fc9b2 Anson Huang 2019-08-07  23  	mx7ulp_aips_map_entry(1, MT_DEVICE),
eeff332d6fc9b2 Anson Huang 2019-08-07  24  	mx7ulp_aips_map_entry(2, MT_DEVICE),
eeff332d6fc9b2 Anson Huang 2019-08-07  25  	mx7ulp_aips_map_entry(3, MT_DEVICE),
eeff332d6fc9b2 Anson Huang 2019-08-07  26  	mx7ulp_aips_map_entry(4, MT_DEVICE),
eeff332d6fc9b2 Anson Huang 2019-08-07  27  	mx7ulp_aips_map_entry(5, MT_DEVICE),
eeff332d6fc9b2 Anson Huang 2019-08-07  28  };
eeff332d6fc9b2 Anson Huang 2019-08-07  29  

:::::: The code at line 22 was first introduced by commit
:::::: eeff332d6fc9b27509e378e29ce956bf9e8342f3 ARM: imx: Add i.MX7ULP suspend/resume support

:::::: TO: Anson Huang <Anson.Huang@nxp.com>
:::::: CC: Dong Aisheng <aisheng.dong@nxp.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
