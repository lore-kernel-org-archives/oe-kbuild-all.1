Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FDC22E3FD
	for <oe-kbuild-all@lists.linux.dev>; Sat, 25 Nov 2023 18:23:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NwwbUy6l"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700936638; x=1732472638;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Ix/ZA2M2AcV+mEFiVP+jQf9Ly9wDAtJX8kkc6F1m/4E=;
  b=NwwbUy6l+B1XhDDxnd5XaK6bw37ovjwxU1VademolwS3SS04tvShbM3J
   Eolbk9JrMSice3SfSjcLAsycNU+YEFC9/c5KI92cYiSIHfRRUHh38DJwW
   ZVX17QUguTV6j+nP/A6HnuqlZejuSnAGO0nlnmUQN8xEjzW0JlWnZy0KB
   4k5zpgX/+EXoxXlp+zmqQVcl1NPXxOOTuXMSEIZAHyD3kF5IMbUP0HIpe
   YVMJG3SaI633rsPvOZrsWU4xxsV5Sz+dDb0OBCMhZ+M7xh0X5jE9pxh2m
   pcabIjF7qfNpx5IxZ68DXz4FaMVbuXYOCaOvx5JuN1/hhScwaCw95mTwj
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10905"; a="389682701"
X-IronPort-AV: E=Sophos;i="6.04,227,1695711600"; 
   d="scan'208";a="389682701"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2023 10:23:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10905"; a="885559548"
X-IronPort-AV: E=Sophos;i="6.04,227,1695711600"; 
   d="scan'208";a="885559548"
Received: from lkp-server01.sh.intel.com (HELO d584ee6ebdcc) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 25 Nov 2023 10:23:50 -0800
Received: from kbuild by d584ee6ebdcc with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r6xJk-0004Ik-2W;
	Sat, 25 Nov 2023 18:23:48 +0000
Date: Sun, 26 Nov 2023 02:22:57 +0800
From: kernel test robot <lkp@intel.com>
To: Tero Kristo <t-kristo@ti.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Tony Lindgren <tony@atomide.com>
Subject: arch/arm/mach-omap2/omap_hwmod.c:228: warning: No description found
 for parameter 'xlate_clkctrl'
Message-ID: <202311260151.b1ciS4X3-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   0f5cc96c367f2e780eb492cc9cab84e3b2ca88da
commit: 70f05be3213393f20f01e4d59625df7ee49fe32f ARM: OMAP2+: hwmod: populate clkctrl clocks for hwmods if available
date:   6 years ago
config: arm-randconfig-001-20231123 (https://download.01.org/0day-ci/archive/20231126/202311260151.b1ciS4X3-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231126/202311260151.b1ciS4X3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311260151.b1ciS4X3-lkp@intel.com/

All warnings (new ones prefixed by >>):

   arch/arm/mach-omap2/omap_hwmod.c:228: warning: No description found for parameter 'wait_target_ready'
   arch/arm/mach-omap2/omap_hwmod.c:228: warning: No description found for parameter 'assert_hardreset'
   arch/arm/mach-omap2/omap_hwmod.c:228: warning: No description found for parameter 'deassert_hardreset'
   arch/arm/mach-omap2/omap_hwmod.c:228: warning: No description found for parameter 'is_hardreset_asserted'
   arch/arm/mach-omap2/omap_hwmod.c:228: warning: No description found for parameter 'init_clkdm'
   arch/arm/mach-omap2/omap_hwmod.c:228: warning: No description found for parameter 'update_context_lost'
   arch/arm/mach-omap2/omap_hwmod.c:228: warning: No description found for parameter 'get_context_lost'
   arch/arm/mach-omap2/omap_hwmod.c:228: warning: No description found for parameter 'disable_direct_prcm'
>> arch/arm/mach-omap2/omap_hwmod.c:228: warning: No description found for parameter 'xlate_clkctrl'
   arch/arm/mach-omap2/omap_hwmod.c:583: warning: No description found for parameter 'v'
   arch/arm/mach-omap2/omap_hwmod.c:616: warning: No description found for parameter 'v'
   arch/arm/mach-omap2/omap_hwmod.c:670: warning: No description found for parameter 'init_oh'
   arch/arm/mach-omap2/omap_hwmod.c:699: warning: No description found for parameter 'init_oh'
   arch/arm/mach-omap2/omap_hwmod.c:1128: warning: No description found for parameter 'os'
   arch/arm/mach-omap2/omap_hwmod.c:1128: warning: Excess function parameter 'oh' description in '_count_ocp_if_addr_spaces'
   arch/arm/mach-omap2/omap_hwmod.c:2446: warning: No description found for parameter 'data'
   arch/arm/mach-omap2/omap_hwmod.c:2446: warning: Excess function parameter 'n' description in '_init'
   arch/arm/mach-omap2/omap_hwmod.c:2644: warning: No description found for parameter 'data'
   arch/arm/mach-omap2/omap_hwmod.c:2644: warning: Excess function parameter 'n' description in '_setup'


vim +/xlate_clkctrl +228 arch/arm/mach-omap2/omap_hwmod.c

70f05be3213393 Tero Kristo    2017-05-31  202  
9ebfd285371835 Kevin Hilman   2012-06-18  203  /**
9ebfd285371835 Kevin Hilman   2012-06-18  204   * struct omap_hwmod_soc_ops - fn ptrs for some SoC-specific operations
9ebfd285371835 Kevin Hilman   2012-06-18  205   * @enable_module: function to enable a module (via MODULEMODE)
9ebfd285371835 Kevin Hilman   2012-06-18  206   * @disable_module: function to disable a module (via MODULEMODE)
9ebfd285371835 Kevin Hilman   2012-06-18  207   *
9ebfd285371835 Kevin Hilman   2012-06-18  208   * XXX Eventually this functionality will be hidden inside the PRM/CM
9ebfd285371835 Kevin Hilman   2012-06-18  209   * device drivers.  Until then, this should avoid huge blocks of cpu_is_*()
9ebfd285371835 Kevin Hilman   2012-06-18  210   * conditionals in this code.
9ebfd285371835 Kevin Hilman   2012-06-18  211   */
9ebfd285371835 Kevin Hilman   2012-06-18  212  struct omap_hwmod_soc_ops {
9ebfd285371835 Kevin Hilman   2012-06-18  213  	void (*enable_module)(struct omap_hwmod *oh);
9ebfd285371835 Kevin Hilman   2012-06-18  214  	int (*disable_module)(struct omap_hwmod *oh);
8f6aa8ee114fb5 Kevin Hilman   2012-06-18  215  	int (*wait_target_ready)(struct omap_hwmod *oh);
b8249cf2d2b16d Kevin Hilman   2012-06-18  216  	int (*assert_hardreset)(struct omap_hwmod *oh,
b8249cf2d2b16d Kevin Hilman   2012-06-18  217  				struct omap_hwmod_rst_info *ohri);
b8249cf2d2b16d Kevin Hilman   2012-06-18  218  	int (*deassert_hardreset)(struct omap_hwmod *oh,
b8249cf2d2b16d Kevin Hilman   2012-06-18  219  				  struct omap_hwmod_rst_info *ohri);
b8249cf2d2b16d Kevin Hilman   2012-06-18  220  	int (*is_hardreset_asserted)(struct omap_hwmod *oh,
b8249cf2d2b16d Kevin Hilman   2012-06-18  221  				     struct omap_hwmod_rst_info *ohri);
0a179eaa436e58 Kevin Hilman   2012-06-18  222  	int (*init_clkdm)(struct omap_hwmod *oh);
e6d3a8b0bdcd8f Rajendra Nayak 2012-11-21  223  	void (*update_context_lost)(struct omap_hwmod *oh);
e6d3a8b0bdcd8f Rajendra Nayak 2012-11-21  224  	int (*get_context_lost)(struct omap_hwmod *oh);
9fabc1a26e37f8 Tero Kristo    2016-07-04  225  	int (*disable_direct_prcm)(struct omap_hwmod *oh);
70f05be3213393 Tero Kristo    2017-05-31  226  	u32 (*xlate_clkctrl)(struct omap_hwmod *oh,
70f05be3213393 Tero Kristo    2017-05-31  227  			     struct clkctrl_provider *provider);
9ebfd285371835 Kevin Hilman   2012-06-18 @228  };
9ebfd285371835 Kevin Hilman   2012-06-18  229  

:::::: The code at line 228 was first introduced by commit
:::::: 9ebfd285371835b1c0243d15aaacd72d5def76f8 ARM: OMAP2+: hwmod: use init-time function ptrs for enable/disable module

:::::: TO: Kevin Hilman <khilman@ti.com>
:::::: CC: Paul Walmsley <paul@pwsan.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
