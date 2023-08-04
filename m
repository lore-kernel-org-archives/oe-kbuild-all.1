Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D9531988A
	for <oe-kbuild-all@lists.linux.dev>; Fri,  4 Aug 2023 20:26:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691180808; x=1722716808;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/okhqx97CEntg1Ei4099TmKo7lffOzdG86l+Z3WBswI=;
  b=d6QsArhzmVEchUZusUr+ppQxyM+KmRBifNCWTOLDccB3XJI+uUx4eePl
   OByBsNQunUHtN+sIGF+/jUnG/UPXTK/5VZdd54ktX3HBep6HhXHIN27cW
   jUAx5fNFFja8tbxZl1xtGrlxaa2HTyV5J4lVHTR/aPoOrf5qYIwJApeOD
   B3pHWBRTo/TbeRnAT6/VZLKbO9fDZ1dl96OH/Er1DqTXrxTtUP4AZTUhw
   Bv0AQQbL+1yWUa0w1To+m0fkrvQPukKHQjTBwChLRrDKaCspn3ccVMQN5
   3z7LkMxW/bnG1jyg+wqyHpna3dFThIfyQ84oSOdV4rW+2+yLvGBYPzFeo
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10792"; a="456617912"
X-IronPort-AV: E=Sophos;i="6.01,255,1684825200"; 
   d="scan'208";a="456617912"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Aug 2023 13:26:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10792"; a="733402805"
X-IronPort-AV: E=Sophos;i="6.01,255,1684825200"; 
   d="scan'208";a="733402805"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 04 Aug 2023 13:26:46 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qS1Nl-00035D-1L;
	Fri, 04 Aug 2023 20:26:45 +0000
Date: Sat, 5 Aug 2023 04:26:32 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [tglx-devel:x86/topo-full 142/149]
 arch/x86/include/asm/topology.h:205:19: error: redefinition of
 'topology_phys_to_logical_pkg'
Message-ID: <202308050429.0GAb5xNQ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tglx/devel.git x86/topo-full
head:   ef76f58d8b34b1c6af83139c7d7cbf2a53c50bf2
commit: dbef13142df070d1598f85df56f0f1879bf50fff [142/149] x86/cpu/topology: Use topology logical mapping mechanism
config: i386-buildonly-randconfig-r004-20230731 (https://download.01.org/0day-ci/archive/20230805/202308050429.0GAb5xNQ-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230805/202308050429.0GAb5xNQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308050429.0GAb5xNQ-lkp@intel.com/

All errors (new ones prefixed by >>):

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
   make[3]: *** [scripts/Makefile.build:116: arch/x86/kernel/asm-offsets.s] Error 1 shuffle=2746773645
   make[3]: Target 'prepare' not remade because of errors.
   make[2]: *** [Makefile:1287: prepare0] Error 2 shuffle=2746773645
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:234: __sub-make] Error 2 shuffle=2746773645
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:234: __sub-make] Error 2 shuffle=2746773645
   make: Target 'prepare' not remade because of errors.


vim +/topology_phys_to_logical_pkg +205 arch/x86/include/asm/topology.h

fae50c56bf5c4d0 arch/x86/include/asm/topology.h Thomas Gleixner 2023-07-26  203  
f54d4434c281f38 arch/x86/include/asm/topology.h Thomas Gleixner 2023-05-12  204  #else /* CONFIG_SMP */
1f12e32f4cd5243 arch/x86/include/asm/topology.h Thomas Gleixner 2016-02-22 @205  static inline int topology_phys_to_logical_pkg(unsigned int pkg) { return 0; }
70b8301f6b8f7bc arch/x86/include/asm/topology.h Andi Kleen      2016-05-19  206  static inline int topology_max_smt_threads(void) { return 1; }
6a4d2657e048f09 arch/x86/include/asm/topology.h Thomas Gleixner 2018-05-29  207  static inline bool topology_is_primary_thread(unsigned int cpu) { return true; }
f048c399e0f7490 arch/x86/include/asm/topology.h Thomas Gleixner 2018-06-21  208  static inline bool topology_smt_supported(void) { return false; }
324469c2f4cec15 arch/x86/include/asm/topology.h Thomas Gleixner 2023-07-12  209  static inline unsigned int topology_amd_nodes_per_pkg(void) { return 0; };
fae50c56bf5c4d0 arch/x86/include/asm/topology.h Thomas Gleixner 2023-07-26  210  static inline void topology_apply_cmdline_limits_early(void) { }
f54d4434c281f38 arch/x86/include/asm/topology.h Thomas Gleixner 2023-05-12  211  #endif /* !CONFIG_SMP */
3367e56f26a3a86 include/asm-x86/topology.h      Thomas Gleixner 2008-01-30  212  

:::::: The code at line 205 was first introduced by commit
:::::: 1f12e32f4cd5243ae46d8b933181be0d022c6793 x86/topology: Create logical package id

:::::: TO: Thomas Gleixner <tglx@linutronix.de>
:::::: CC: Ingo Molnar <mingo@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
