Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FB52539E
	for <oe-kbuild-all@lists.linux.dev>; Sun, 23 Jul 2023 16:30:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690129807; x=1721665807;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=37Y9/VIb82TGAKHLjJUyl7kmXvLujoYHT7M0BIoB+XQ=;
  b=MDPTvcvaCjVRNHAQrpAGaZOuOSf7XpGmuUkLeCAsNLQrBjFp0bNc1r+9
   fLAeRRnTTi+qqVuQbA6UyGYGvpTOmW1jXvfWa4k0Y+55N7u9tb2hSUbPN
   kRlmITI7CYpUKjTAimF/25QNhw3iczqcsZf06BEphsm4pRyBCv3dYDCcB
   ULM6Fm5SYk0oF2woRkz3DEPvpHb1TAnA+cENcqGvu4XP9QiaXaolJ1zMw
   XASKFEl0ieVUl3NPIeYTSQD+ds4FEaAySQ5l7KsLrz4Veg/VHHiJDPS5p
   AI3Jg0j7nb0EqidntBZG+4rfq9THED5inmnVkNpnIrGXvW0d96AG2cnWo
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10780"; a="431089223"
X-IronPort-AV: E=Sophos;i="6.01,227,1684825200"; 
   d="scan'208";a="431089223"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jul 2023 09:30:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10780"; a="849381320"
X-IronPort-AV: E=Sophos;i="6.01,227,1684825200"; 
   d="scan'208";a="849381320"
Received: from lkp-server02.sh.intel.com (HELO 36946fcf73d7) ([10.239.97.151])
  by orsmga004.jf.intel.com with ESMTP; 23 Jul 2023 09:30:05 -0700
Received: from kbuild by 36946fcf73d7 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qNbxr-00097r-22;
	Sun, 23 Jul 2023 16:29:55 +0000
Date: Mon, 24 Jul 2023 00:28:42 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [tglx-devel:x86/topology 77/87]
 arch/x86/include/asm/topology.h:192:71: error: expected ';' before '}' token
Message-ID: <202307240039.Tf9mKrTJ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tglx/devel.git x86/topology
head:   509d85a7567c105935a9080b84883f135451d3b0
commit: 97f82a5edca7bd876a8715ac3f1533e7ffabd7ad [77/87] x86/cpu/amd: Provide a separate acessor for Node ID
config: i386-randconfig-i015-20230723 (https://download.01.org/0day-ci/archive/20230724/202307240039.Tf9mKrTJ-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230724/202307240039.Tf9mKrTJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307240039.Tf9mKrTJ-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/topology.h:36,
                    from include/linux/gfp.h:8,
                    from include/linux/slab.h:16,
                    from include/linux/crypto.h:17,
                    from arch/x86/kernel/asm-offsets.c:9:
   arch/x86/include/asm/topology.h: In function 'topology_amd_nodes_per_pkg':
>> arch/x86/include/asm/topology.h:192:71: error: expected ';' before '}' token
     192 | static inline unsigned int topology_amd_nodes_per_pkg(void) { return 0 };
         |                                                                       ^~
         |                                                                       ;
   make[3]: *** [scripts/Makefile.build:116: arch/x86/kernel/asm-offsets.s] Error 1 shuffle=2623637627
   make[3]: Target 'prepare' not remade because of errors.
   make[2]: *** [Makefile:1275: prepare0] Error 2 shuffle=2623637627
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:234: __sub-make] Error 2 shuffle=2623637627
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:234: __sub-make] Error 2 shuffle=2623637627
   make: Target 'prepare' not remade because of errors.


vim +192 arch/x86/include/asm/topology.h

   172	
   173	/**
   174	 * topology_is_primary_thread - Check whether CPU is the primary SMT thread
   175	 * @cpu:	CPU to check
   176	 */
   177	static inline bool topology_is_primary_thread(unsigned int cpu)
   178	{
   179		return cpumask_test_cpu(cpu, cpu_primary_thread_mask);
   180	}
   181	#else /* CONFIG_SMP */
   182	#define topology_max_packages()			(1)
   183	static inline int
   184	topology_update_package_map(unsigned int apicid, unsigned int cpu) { return 0; }
   185	static inline int
   186	topology_update_die_map(unsigned int dieid, unsigned int cpu) { return 0; }
   187	static inline int topology_phys_to_logical_pkg(unsigned int pkg) { return 0; }
   188	static inline int topology_max_die_per_package(void) { return 1; }
   189	static inline int topology_max_smt_threads(void) { return 1; }
   190	static inline bool topology_is_primary_thread(unsigned int cpu) { return true; }
   191	static inline bool topology_smt_supported(void) { return false; }
 > 192	static inline unsigned int topology_amd_nodes_per_pkg(void) { return 0 };
   193	#endif /* !CONFIG_SMP */
   194	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
