Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A20D2CA5E
	for <oe-kbuild-all@lists.linux.dev>; Fri,  4 Aug 2023 14:58:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691161119; x=1722697119;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=K3TghzX6BAkEnhjbY6eQ1rGi04e8m9Xai9SeUExv1R0=;
  b=i3GUVK45yXPW3kbhUI1Fnq3oOKxNjBNtE139U3rC/xVEQqocKw+bQue6
   KxHutKSAtHVZNtQTncHsCjwGFbIf4iypXN921xDaFuUQnvCWtJ6Gnyyfr
   m1gJQ0ooVDuYXL2I+VyjwmA6i9rBhbPE5/1mc9KbQrrhoUitFP0DWUNnY
   S12PCuFmPPaWWLi0iWiqFq2jAKJ1rLBfwEuBAm6ZV/vodiv/Al3FQBynb
   2B6kogEeBRRSh3ZfsM2D/Xn0eH47b1/dHLx+6Zhsgj9LpS8ivLNwzHXJA
   o6Y8d28TRER8V7RzbhvNffn0VaiCYWrEQQc1Cik/7D+rW6ixYhChev8X8
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10792"; a="369069823"
X-IronPort-AV: E=Sophos;i="6.01,255,1684825200"; 
   d="scan'208";a="369069823"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Aug 2023 07:58:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10792"; a="765144191"
X-IronPort-AV: E=Sophos;i="6.01,255,1684825200"; 
   d="scan'208";a="765144191"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 04 Aug 2023 07:58:37 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qRwGC-0002uV-2b;
	Fri, 04 Aug 2023 14:58:36 +0000
Date: Fri, 4 Aug 2023 22:57:44 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [tglx-devel:x86/topo-full 146/149]
 arch/x86/include/asm/topology.h:222:19: error: conflicting types for
 'topology_max_dies_per_package'; have 'int(void)'
Message-ID: <202308042227.opcicZ19-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Thomas,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tglx/devel.git x86/topo-full
head:   280a9824f95c22e356f556329d2f22e613479be2
commit: 2c5be4884ee9aa9511aecce73e1240c27261a65e [146/149] x86/cpu/topology: Rename topology_max_die_per_package()
config: i386-randconfig-i002-20230731 (https://download.01.org/0day-ci/archive/20230804/202308042227.opcicZ19-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230804/202308042227.opcicZ19-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308042227.opcicZ19-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/topology.h:36,
                    from include/linux/gfp.h:8,
                    from include/linux/slab.h:16,
                    from include/linux/crypto.h:17,
                    from arch/x86/kernel/asm-offsets.c:9:
>> arch/x86/include/asm/topology.h:222:19: error: conflicting types for 'topology_max_dies_per_package'; have 'int(void)'
     222 | static inline int topology_max_dies_per_package(void) { return 1; }
         |                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/include/asm/topology.h:155:28: note: previous definition of 'topology_max_dies_per_package' with type 'unsigned int(void)'
     155 | static inline unsigned int topology_max_dies_per_package(void)
         |                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   make[3]: *** [scripts/Makefile.build:116: arch/x86/kernel/asm-offsets.s] Error 1 shuffle=3168384213
   make[3]: Target 'prepare' not remade because of errors.
   make[2]: *** [Makefile:1287: prepare0] Error 2 shuffle=3168384213
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:234: __sub-make] Error 2 shuffle=3168384213
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:234: __sub-make] Error 2 shuffle=3168384213
   make: Target 'prepare' not remade because of errors.


vim +222 arch/x86/include/asm/topology.h

   219	
   220	#else /* CONFIG_SMP */
   221	static inline int topology_phys_to_logical_pkg(unsigned int pkg) { return 0; }
 > 222	static inline int topology_max_dies_per_package(void) { return 1; }
   223	static inline int topology_max_smt_threads(void) { return 1; }
   224	static inline bool topology_is_primary_thread(unsigned int cpu) { return true; }
   225	static inline bool topology_smt_supported(void) { return false; }
   226	static inline unsigned int topology_amd_nodes_per_pkg(void) { return 0; };
   227	static inline void topology_apply_cmdline_limits_early(void) { }
   228	#endif /* !CONFIG_SMP */
   229	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
