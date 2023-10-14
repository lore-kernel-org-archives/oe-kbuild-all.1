Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7665D1852
	for <oe-kbuild-all@lists.linux.dev>; Sat, 14 Oct 2023 04:15:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cyxv0bmx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697256950; x=1728792950;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=n7gQ4QnFPBf0opakKK2ysqkEpugSlCUAxkunf/agSug=;
  b=cyxv0bmxhC2kYeIBGECR0qiOYOZc8Dkefxjhegsu2MapSPK3vgvOjlGV
   vq4FUMRFBp7OBxvA0JtC3wy4xOaeYUaUUYuoB73vTEZEvMuKRjoQ9rRBq
   yUSBJr5tIW6Zm+uiPugvWNa4EEfPrDNopMvTj6wFgYy+2YZ3W8y6WNyv1
   Y4d8BDfREW7wDVgsN5bUXqpsHV3Edf/1noui43vfHnpHbt5QqqqES0bEO
   Bf5rMI1khRxJA9rxp9MOBx0fDpgydhXFlDwBIWy7dipPyjxEKLtLNiel7
   UwiHapRxhgAt0Z6Mzt9UBvFgL4tQ/JTvLEv63q7VD5EhsrwzlyA8OqpeB
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10862"; a="384172399"
X-IronPort-AV: E=Sophos;i="6.03,224,1694761200"; 
   d="scan'208";a="384172399"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2023 21:15:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10862"; a="928659401"
X-IronPort-AV: E=Sophos;i="6.03,224,1694761200"; 
   d="scan'208";a="928659401"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 13 Oct 2023 21:15:48 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qrW41-0005gV-3A;
	Sat, 14 Oct 2023 04:15:45 +0000
Date: Sat, 14 Oct 2023 12:15:38 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:pr/642 1862/30000]
 arch/arm/mach-imx/busfreq-imx.c:458:1: warning: 'static' is not at beginning
 of declaration
Message-ID: <202310141217.1ao0G7zV-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Freescale/linux-fslc pr/642
head:   c8b7cf62c7fea8456dec789d550b8006d73b8f04
commit: dc782dd284d797c5ca591b945c5a51e03698fb47 [1862/30000] ARM: imx: add i.MX7D bus-freq support
config: arm-randconfig-001-20231013 (https://download.01.org/0day-ci/archive/20231014/202310141217.1ao0G7zV-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231014/202310141217.1ao0G7zV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310141217.1ao0G7zV-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/arm/mach-imx/busfreq-imx.c:458:1: warning: 'static' is not at beginning of declaration [-Wold-style-declaration]
     458 | const static char *ddr_freq_iram_match[] __initconst = {
         | ^~~~~
   arch/arm/mach-imx/busfreq-imx.c: In function 'imx_dt_find_ddr_sram':
   arch/arm/mach-imx/busfreq-imx.c:469:13: error: implicit declaration of function 'of_flat_dt_match'; did you mean 'of_flat_dt_match_machine'? [-Werror=implicit-function-declaration]
     469 |         if (of_flat_dt_match(node, ddr_freq_iram_match)) {
         |             ^~~~~~~~~~~~~~~~
         |             of_flat_dt_match_machine
   In file included from arch/arm/mach-imx/busfreq-imx.c:38:
   arch/arm/mach-imx/common.h: At top level:
   arch/arm/mach-imx/common.h:121:18: warning: 'imx53_suspend_sz' defined but not used [-Wunused-const-variable=]
     121 | static const u32 imx53_suspend_sz;
         |                  ^~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors
--
>> arch/arm/mach-imx/ddrc.c:63:5: warning: no previous prototype for 'imx_ddrc_get_ddr_type' [-Wmissing-prototypes]
      63 | int imx_ddrc_get_ddr_type(void)
         |     ^~~~~~~~~~~~~~~~~~~~~
--
>> arch/arm/mach-imx/busfreq_ddr3.c:111:5: warning: no previous prototype for 'can_change_ddr_freq' [-Wmissing-prototypes]
     111 | int can_change_ddr_freq(void)
         |     ^~~~~~~~~~~~~~~~~~~
>> arch/arm/mach-imx/busfreq_ddr3.c:148:5: warning: no previous prototype for 'update_ddr_freq_imx_smp' [-Wmissing-prototypes]
     148 | int update_ddr_freq_imx_smp(int ddr_rate)
         |     ^~~~~~~~~~~~~~~~~~~~~~~
>> arch/arm/mach-imx/busfreq_ddr3.c:241:5: warning: no previous prototype for 'init_ddrc_ddr_settings' [-Wmissing-prototypes]
     241 | int init_ddrc_ddr_settings(struct platform_device *busfreq_pdev)
         |     ^~~~~~~~~~~~~~~~~~~~~~
   In file included from arch/arm/mach-imx/busfreq_ddr3.c:48:
   arch/arm/mach-imx/common.h:121:18: warning: 'imx53_suspend_sz' defined but not used [-Wunused-const-variable=]
     121 | static const u32 imx53_suspend_sz;
         |                  ^~~~~~~~~~~~~~~~
--
>> arch/arm/mach-imx/common.c:22:15: warning: no previous prototype for 'save_ttbr1' [-Wmissing-prototypes]
      22 | unsigned long save_ttbr1(void)
         |               ^~~~~~~~~~
>> arch/arm/mach-imx/common.c:33:6: warning: no previous prototype for 'restore_ttbr1' [-Wmissing-prototypes]
      33 | void restore_ttbr1(unsigned long ttbr1)
         |      ^~~~~~~~~~~~~
>> arch/arm/mach-imx/common.c:44:13: warning: no previous prototype for 'imx6_enet_mac_init' [-Wmissing-prototypes]
      44 | void __init imx6_enet_mac_init(const char *enet_compat, const char *ocotp_compat)
         |             ^~~~~~~~~~~~~~~~~~
>> arch/arm/mach-imx/common.c:132:6: warning: no previous prototype for 'mx6_lpddr2_freq_change' [-Wmissing-prototypes]
     132 | void mx6_lpddr2_freq_change(u32 freq, int bus_freq_mode) {}
         |      ^~~~~~~~~~~~~~~~~~~~~~
   arch/arm/mach-imx/common.c:149:6: warning: no previous prototype for 'imx6ull_low_power_idle' [-Wmissing-prototypes]
     149 | void imx6ull_low_power_idle(void) {}
         |      ^~~~~~~~~~~~~~~~~~~~~~


vim +/static +458 arch/arm/mach-imx/busfreq-imx.c

   457	
 > 458	const static char *ddr_freq_iram_match[] __initconst = {
   459		"fsl,ddr-lpm-sram",
   460		NULL
   461	};
   462	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
