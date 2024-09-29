Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E43613FB1B
	for <oe-kbuild-all@lists.linux.dev>; Sun, 29 Sep 2024 10:58:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727607508; cv=none; b=IfE5wze6UFe6ju0+qWuIPEQbMOyFxhb+JjCOZS9YdKX2Vb6XkSeS5rrH0STG/hQSFux+LCh7+s7tiV5+QZAdjDAb/ujA2SRrsYs6ZAr/wAueoaQm2p4Yp+NaB9p7wk6csRczT5RQt6cdHnBkaR73/0QHBf5ECZqoJ3eYOYezNT0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727607508; c=relaxed/simple;
	bh=PZ6CWpBD8sppART9Uh9G/xgZiJ9JNFOSquDG0EZKGVw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=GdmWWrzexmMtwJg2BFMunXB7D0DZyJJsRk9FmZXo9Pgt0THLj50VxjWL4pi8Jdnc3khMou2UXmxLVXHo1by6e4j0rUHaoim59JWZ8eQBag7ezbeamfb9ISmGW26ReOW7Bz2FQlYIQoz8xjM3Kj8e8ybf5pCPvKZ/iftsSGb6Xvc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gE2cP1Yw; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gE2cP1Yw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727607506; x=1759143506;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=PZ6CWpBD8sppART9Uh9G/xgZiJ9JNFOSquDG0EZKGVw=;
  b=gE2cP1Yw0O22hueJTg1jtXHcwtwZe1u86cBRwE0IteM5IwSL6BXS46+p
   Ukvu4SIo2C+p/ZER3dIRWY244DKBDSPzquKNSWmMtM9SjxGWblRoahWpx
   WsWOyaWM3a8Q+bJThj0aZG3KSOfL9omcXTOUOT5QNlhqvnGqxT08v+yPC
   s36GrqhvPgG1mCtF4mXT4hMvX9sJOKye8hLs/glkbHXl83BcybAVe8JSM
   JK8iYK2jdgWu6L+w1Zfq0MZzoj4RFPWosHKVr/8ecb10jeR1oDjvKJyEn
   cA/HODaFnnjNWbAeTbZBgbUa0wgiEpfHJBNj7VWdRimU8JTiEJ74Bt7XY
   Q==;
X-CSE-ConnectionGUID: Mi6Cs6xfRz6mzmgyzEA9EQ==
X-CSE-MsgGUID: pvzO2Rg4QUa4vIOq7F6NgQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11209"; a="38062413"
X-IronPort-AV: E=Sophos;i="6.11,162,1725346800"; 
   d="scan'208";a="38062413"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Sep 2024 03:58:26 -0700
X-CSE-ConnectionGUID: +vGkKWDHSReM2EifK2d63A==
X-CSE-MsgGUID: fmkDLoC+Su2gffoH+0g2JA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,162,1725346800"; 
   d="scan'208";a="72581960"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 29 Sep 2024 03:58:24 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1surd8-000ODd-1J;
	Sun, 29 Sep 2024 10:58:22 +0000
Date: Sun, 29 Sep 2024 18:57:38 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:6.6-2.0.x-imx 5875/16788]
 arch/arm/mach-imx/busfreq-imx.c:102:19: error: a randomized struct can only
 be initialized with a designated initializer
Message-ID: <202409291842.WLJARvdj-lkp@intel.com>
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

tree:   https://github.com/Freescale/linux-fslc 6.6-2.0.x-imx
head:   ac32ba5fe66266329914d2020570364afe217bec
commit: 8edc700dd52e0961f046aa8e47e812efc10ae588 [5875/16788] Merge branch 'clock/next' into next
config: arm-randconfig-003-20240928 (https://download.01.org/0day-ci/archive/20240929/202409291842.WLJARvdj-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 7773243d9916f98ba0ffce0c3a960e4aa9f03e81)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240929/202409291842.WLJARvdj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409291842.WLJARvdj-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from arch/arm/mach-imx/busfreq_ddr3.c:21:
   In file included from arch/arm/include/asm/cacheflush.h:10:
   In file included from include/linux/mm.h:2168:
   include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
>> arch/arm/mach-imx/busfreq_ddr3.c:217:5: warning: no previous prototype for function 'can_change_ddr_freq' [-Wmissing-prototypes]
     217 | int can_change_ddr_freq(void)
         |     ^
   arch/arm/mach-imx/busfreq_ddr3.c:217:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     217 | int can_change_ddr_freq(void)
         | ^
         | static 
>> arch/arm/mach-imx/busfreq_ddr3.c:254:5: warning: no previous prototype for function 'update_ddr_freq_imx_smp' [-Wmissing-prototypes]
     254 | int update_ddr_freq_imx_smp(int ddr_rate)
         |     ^
   arch/arm/mach-imx/busfreq_ddr3.c:254:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     254 | int update_ddr_freq_imx_smp(int ddr_rate)
         | ^
         | static 
>> arch/arm/mach-imx/busfreq_ddr3.c:379:5: warning: no previous prototype for function 'update_ddr_freq_imx6_up' [-Wmissing-prototypes]
     379 | int update_ddr_freq_imx6_up(int ddr_rate)
         |     ^
   arch/arm/mach-imx/busfreq_ddr3.c:379:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     379 | int update_ddr_freq_imx6_up(int ddr_rate)
         | ^
         | static 
>> arch/arm/mach-imx/busfreq_ddr3.c:424:5: warning: no previous prototype for function 'init_ddrc_ddr_settings' [-Wmissing-prototypes]
     424 | int init_ddrc_ddr_settings(struct platform_device *busfreq_pdev)
         |     ^
   arch/arm/mach-imx/busfreq_ddr3.c:424:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     424 | int init_ddrc_ddr_settings(struct platform_device *busfreq_pdev)
         | ^
         | static 
>> arch/arm/mach-imx/busfreq_ddr3.c:496:5: warning: no previous prototype for function 'init_mmdc_ddr3_settings_imx6_up' [-Wmissing-prototypes]
     496 | int init_mmdc_ddr3_settings_imx6_up(struct platform_device *busfreq_pdev)
         |     ^
   arch/arm/mach-imx/busfreq_ddr3.c:496:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     496 | int init_mmdc_ddr3_settings_imx6_up(struct platform_device *busfreq_pdev)
         | ^
         | static 
>> arch/arm/mach-imx/busfreq_ddr3.c:593:5: warning: no previous prototype for function 'init_mmdc_ddr3_settings_imx6_smp' [-Wmissing-prototypes]
     593 | int init_mmdc_ddr3_settings_imx6_smp(struct platform_device *busfreq_pdev)
         |     ^
   arch/arm/mach-imx/busfreq_ddr3.c:593:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     593 | int init_mmdc_ddr3_settings_imx6_smp(struct platform_device *busfreq_pdev)
         | ^
         | static 
   7 warnings generated.
--
   In file included from arch/arm/mach-imx/busfreq-imx.c:17:
   In file included from arch/arm/include/asm/cacheflush.h:10:
   In file included from include/linux/mm.h:2168:
   include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
>> arch/arm/mach-imx/busfreq-imx.c:102:19: error: a randomized struct can only be initialized with a designated initializer
     102 | } busfreq_func = {NULL, NULL};
         |                   ^
   include/linux/stddef.h:8:14: note: expanded from macro 'NULL'
       8 | #define NULL ((void *)0)
         |              ^
   1 warning and 1 error generated.
--
   In file included from arch/arm/mach-imx/busfreq_lpddr2.c:22:
   In file included from arch/arm/include/asm/cacheflush.h:10:
   In file included from include/linux/mm.h:2168:
   include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
>> arch/arm/mach-imx/busfreq_lpddr2.c:124:5: warning: no previous prototype for function 'update_lpddr2_freq' [-Wmissing-prototypes]
     124 | int update_lpddr2_freq(int ddr_rate)
         |     ^
   arch/arm/mach-imx/busfreq_lpddr2.c:124:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     124 | int update_lpddr2_freq(int ddr_rate)
         | ^
         | static 
>> arch/arm/mach-imx/busfreq_lpddr2.c:159:5: warning: no previous prototype for function 'init_mmdc_lpddr2_settings' [-Wmissing-prototypes]
     159 | int init_mmdc_lpddr2_settings(struct platform_device *busfreq_pdev)
         |     ^
   arch/arm/mach-imx/busfreq_lpddr2.c:159:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     159 | int init_mmdc_lpddr2_settings(struct platform_device *busfreq_pdev)
         | ^
         | static 
>> arch/arm/mach-imx/busfreq_lpddr2.c:185:5: warning: no previous prototype for function 'update_lpddr2_freq_smp' [-Wmissing-prototypes]
     185 | int update_lpddr2_freq_smp(int ddr_rate)
         |     ^
   arch/arm/mach-imx/busfreq_lpddr2.c:185:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     185 | int update_lpddr2_freq_smp(int ddr_rate)
         | ^
         | static 
>> arch/arm/mach-imx/busfreq_lpddr2.c:283:5: warning: no previous prototype for function 'init_mmdc_lpddr2_settings_mx6q' [-Wmissing-prototypes]
     283 | int init_mmdc_lpddr2_settings_mx6q(struct platform_device *busfreq_pdev)
         |     ^
   arch/arm/mach-imx/busfreq_lpddr2.c:283:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     283 | int init_mmdc_lpddr2_settings_mx6q(struct platform_device *busfreq_pdev)
         | ^
         | static 
   5 warnings generated.


vim +102 arch/arm/mach-imx/busfreq-imx.c

4c3e8cf9f9519b Anson Huang 2019-04-12   94  
4c3e8cf9f9519b Anson Huang 2019-04-12   95  /**
4c3e8cf9f9519b Anson Huang 2019-04-12   96   * @brief  Functions to init and update the busfreq function of
4c3e8cf9f9519b Anson Huang 2019-04-12   97   *         device and memory type
4c3e8cf9f9519b Anson Huang 2019-04-12   98   */
4c3e8cf9f9519b Anson Huang 2019-04-12   99  static struct busfreq_func {
4c3e8cf9f9519b Anson Huang 2019-04-12  100  	int (*init)(struct platform_device *dev);
4c3e8cf9f9519b Anson Huang 2019-04-12  101  	int (*update)(int ddr_rate);
4c3e8cf9f9519b Anson Huang 2019-04-12 @102  } busfreq_func = {NULL, NULL};
4c3e8cf9f9519b Anson Huang 2019-04-12  103  

:::::: The code at line 102 was first introduced by commit
:::::: 4c3e8cf9f9519b5341c4bd58a692a92e63450464 ARM: imx: add i.MX7D bus-freq support

:::::: TO: Anson Huang <Anson.Huang@nxp.com>
:::::: CC: Dong Aisheng <aisheng.dong@nxp.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
