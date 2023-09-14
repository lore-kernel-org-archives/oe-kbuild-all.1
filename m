Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DE20191
	for <oe-kbuild-all@lists.linux.dev>; Thu, 14 Sep 2023 00:13:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694650392; x=1726186392;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=0rNiidysu0zuOCDcWEYsUBTD9iX0XSgg4rbWVA1o/s0=;
  b=J3gYpfbDDWig4syH0gSXnS04LynTJERWBnXjVlkQvrSqRZDXzI03bPBI
   R6/vLq9GnYKd+mCeVo2oZLC9cvz1uVeVizHoRCkU8uS9EKa347hmk6TSi
   PxuZzQoMH3kO9oUr3eVL4377Wv0fDKgN4SOARQiupKWQPoeiK2DvX2vOd
   RqVcKgIn7ItvdzG/6E4m6wdMujtny1YxkLaRW7T0lKteXc40mgio9i6ZD
   TNBVd1DACKksMgGxo4riMJf5V6/We99GM5IQaHHxdDyjq5daOBhmX1uWo
   F+T2Gh8w9MNq/OEn0ExgILo19pAN/D60PNUNm84MDHE2m1gGPaPChb4N5
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10832"; a="442847337"
X-IronPort-AV: E=Sophos;i="6.02,144,1688454000"; 
   d="scan'208";a="442847337"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Sep 2023 17:13:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10832"; a="779417765"
X-IronPort-AV: E=Sophos;i="6.02,144,1688454000"; 
   d="scan'208";a="779417765"
Received: from lkp-server02.sh.intel.com (HELO 9ef86b2655e5) ([10.239.97.151])
  by orsmga001.jf.intel.com with ESMTP; 13 Sep 2023 17:13:08 -0700
Received: from kbuild by 9ef86b2655e5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qgZyk-0000qv-2H;
	Thu, 14 Sep 2023 00:13:06 +0000
Date: Thu, 14 Sep 2023 08:12:32 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [tglx-devel:x86/topo-full 87/92]
 arch/x86/include/asm/topology.h:205:19: error: redefinition of
 'topology_phys_to_logical_pkg'
Message-ID: <202309140846.gYDzBzVa-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tglx/devel.git x86/topo-full
head:   f7b1efba77bb35bcd0c67d5d2c87216727ebaf2c
commit: 61f282009fb449046eafc6c1458444f3ebd5efbe [87/92] x86/cpu/topology: Use topology logical mapping mechanism
config: x86_64-randconfig-011-20230914 (https://download.01.org/0day-ci/archive/20230914/202309140846.gYDzBzVa-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230914/202309140846.gYDzBzVa-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309140846.gYDzBzVa-lkp@intel.com/

All errors (new ones prefixed by >>):

   WARNING: unmet direct dependencies detected for VIDEO_MT9V011
   Depends on [n]: MEDIA_SUPPORT [=y] && VIDEO_DEV [=y] && VIDEO_CAMERA_SENSOR [=n]
   Selected by [y]:
   - VIDEO_EM28XX_V4L2 [=y] && USB [=y] && MEDIA_SUPPORT [=y] && MEDIA_USB_SUPPORT [=y] && (MEDIA_CAMERA_SUPPORT [=y] || MEDIA_ANALOG_TV_SUPPORT [=n] || MEDIA_DIGITAL_TV_SUPPORT [=n]) && VIDEO_EM28XX [=y] && MEDIA_SUBDRV_AUTOSELECT [=y] && MEDIA_CAMERA_SUPPORT [=y]
   In file included from include/linux/topology.h:36,
   from include/linux/gfp.h:8,
   from include/linux/slab.h:16,
   from include/linux/crypto.h:17,
   from arch/x86/kernel/asm-offsets.c:9:
>> arch/x86/include/asm/topology.h:205:19: error: redefinition of 'topology_phys_to_logical_pkg'
   205 | static inline int topology_phys_to_logical_pkg(unsigned int pkg) { return 0; }
   |                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/include/asm/topology.h:161:19: note: previous definition of 'topology_phys_to_logical_pkg' with type 'int(unsigned int)'
   161 | static inline int topology_phys_to_logical_pkg(unsigned int pkg)
   |                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   make[3]: *** [scripts/Makefile.build:116: arch/x86/kernel/asm-offsets.s] Error 1 shuffle=2259675972
   make[3]: Target 'prepare' not remade because of errors.
   make[2]: *** [Makefile:1202: prepare0] Error 2 shuffle=2259675972
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:234: __sub-make] Error 2 shuffle=2259675972
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:234: __sub-make] Error 2 shuffle=2259675972
   make: Target 'prepare' not remade because of errors.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for VIDEO_OV2640
   Depends on [n]: MEDIA_SUPPORT [=y] && VIDEO_DEV [=y] && VIDEO_CAMERA_SENSOR [=n]
   Selected by [y]:
   - VIDEO_EM28XX_V4L2 [=y] && USB [=y] && MEDIA_SUPPORT [=y] && MEDIA_USB_SUPPORT [=y] && (MEDIA_CAMERA_SUPPORT [=y] || MEDIA_ANALOG_TV_SUPPORT [=n] || MEDIA_DIGITAL_TV_SUPPORT [=n]) && VIDEO_EM28XX [=y] && MEDIA_SUBDRV_AUTOSELECT [=y] && MEDIA_CAMERA_SUPPORT [=y]
   WARNING: unmet direct dependencies detected for VIDEO_MT9V011
   Depends on [n]: MEDIA_SUPPORT [=y] && VIDEO_DEV [=y] && VIDEO_CAMERA_SENSOR [=n]
   Selected by [y]:
   - VIDEO_EM28XX_V4L2 [=y] && USB [=y] && MEDIA_SUPPORT [=y] && MEDIA_USB_SUPPORT [=y] && (MEDIA_CAMERA_SUPPORT [=y] || MEDIA_ANALOG_TV_SUPPORT [=n] || MEDIA_DIGITAL_TV_SUPPORT [=n]) && VIDEO_EM28XX [=y] && MEDIA_SUBDRV_AUTOSELECT [=y] && MEDIA_CAMERA_SUPPORT [=y]


vim +/topology_phys_to_logical_pkg +205 arch/x86/include/asm/topology.h

119a5667ef8883 arch/x86/include/asm/topology.h Thomas Gleixner 2023-07-26  203  
f54d4434c281f3 arch/x86/include/asm/topology.h Thomas Gleixner 2023-05-12  204  #else /* CONFIG_SMP */
1f12e32f4cd524 arch/x86/include/asm/topology.h Thomas Gleixner 2016-02-22 @205  static inline int topology_phys_to_logical_pkg(unsigned int pkg) { return 0; }
70b8301f6b8f7b arch/x86/include/asm/topology.h Andi Kleen      2016-05-19  206  static inline int topology_max_smt_threads(void) { return 1; }
6a4d2657e048f0 arch/x86/include/asm/topology.h Thomas Gleixner 2018-05-29  207  static inline bool topology_is_primary_thread(unsigned int cpu) { return true; }
678bb358dfa128 arch/x86/include/asm/topology.h Thomas Gleixner 2023-08-14  208  static inline unsigned int topology_amd_nodes_per_pkg(void) { return 0; };
119a5667ef8883 arch/x86/include/asm/topology.h Thomas Gleixner 2023-07-26  209  static inline void topology_apply_cmdline_limits_early(void) { }
f54d4434c281f3 arch/x86/include/asm/topology.h Thomas Gleixner 2023-05-12  210  #endif /* !CONFIG_SMP */
3367e56f26a3a8 include/asm-x86/topology.h      Thomas Gleixner 2008-01-30  211  

:::::: The code at line 205 was first introduced by commit
:::::: 1f12e32f4cd5243ae46d8b933181be0d022c6793 x86/topology: Create logical package id

:::::: TO: Thomas Gleixner <tglx@linutronix.de>
:::::: CC: Ingo Molnar <mingo@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
