Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84CC14AF94
	for <oe-kbuild-all@lists.linux.dev>; Thu, 14 Dec 2023 12:30:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="db5pNB+X"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702557003; x=1734093003;
  h=date:from:cc:subject:message-id:mime-version;
  bh=2ZQuHVcYHvnbCdJPkNZOH8wgNsrdyb3OVKZjVwKIO6Y=;
  b=db5pNB+XdZbiX9p7Gpy4XKflRxqkoWGTcuUN4TSnfNjOgl08WnT6u93X
   FUPyXC0mNRC+1Z2PC+Sc0HADaSD+nPqvvVunPWKMpC8kLiNEPMiAf0mdr
   4wbmT6iabbtljVkHaPKoLpMq5qQfrLo0am4iXf/36SQMpizVsw2exdliR
   phRNjpiFGBir2MTUVRWUAzrfGzrkARbfScmFzFTbhzkd6xKUEL3SY3hCW
   cZ+71rp2BOblsRuYvdKyqyQw5Hzs6GZm1xRf1z6J/1xlf9a+VUzPHeOVc
   cU6VFoHDshhgDA3PKPhfpldDVxLHrrcE5ZoJIDNtHpnVbds4Hs7vEaILe
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10923"; a="426242916"
X-IronPort-AV: E=Sophos;i="6.04,275,1695711600"; 
   d="scan'208";a="426242916"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Dec 2023 04:30:01 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10923"; a="767591843"
X-IronPort-AV: E=Sophos;i="6.04,275,1695711600"; 
   d="scan'208";a="767591843"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga007.jf.intel.com with ESMTP; 14 Dec 2023 04:30:01 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rDkqk-000M3Q-1w
	for oe-kbuild-all@lists.linux.dev;
	Thu, 14 Dec 2023 12:29:58 +0000
Date: Thu, 14 Dec 2023 20:29:47 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [intel-lts:4.19/android_s 13723/30000]
 arch/arm64/kernel/smp.c:601:1: sparse: sparse: symbol
 '__pcpu_scope_pending_ipi' was not declared. Should it be static?
Message-ID: <202312142055.2WCjnue9-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel/linux-intel-lts.git 4.19/android_s
head:   a45f8ae6659a25c2743eb4a9bc5ee7954a00d784
commit: aa006282c8dd224dc3a8ca2e0e78c2089faed309 [13723/30000] ANDROID: GKI: ARM64: smp: add vendor field pending_ipi
config: arm64-randconfig-r121-20231209 (https://download.01.org/0day-ci/archive/20231214/202312142055.2WCjnue9-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231214/202312142055.2WCjnue9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312142055.2WCjnue9-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> arch/arm64/kernel/smp.c:601:1: sparse: sparse: symbol '__pcpu_scope_pending_ipi' was not declared. Should it be static?
   arch/arm64/kernel/smp.c:818:6: warning: no previous prototype for 'arch_irq_work_raise' [-Wmissing-prototypes]
     818 | void arch_irq_work_raise(void)
         |      ^~~~~~~~~~~~~~~~~~~
   arch/arm64/kernel/smp.c:1042:5: warning: no previous prototype for 'setup_profiling_timer' [-Wmissing-prototypes]
    1042 | int setup_profiling_timer(unsigned int multiplier)
         |     ^~~~~~~~~~~~~~~~~~~~~
   In file included from include/linux/kernel.h:14,
                    from include/linux/list.h:9,
                    from include/linux/resource_ext.h:17,
                    from include/linux/acpi.h:26,
                    from arch/arm64/kernel/smp.c:20:
   arch/arm64/kernel/smp.c: In function '__cpu_up':
   include/linux/printk.h:306:9: warning: this statement may fall through [-Wimplicit-fallthrough=]
     306 |         printk(KERN_CRIT pr_fmt(fmt), ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kernel/smp.c:172:25: note: in expansion of macro 'pr_crit'
     172 |                         pr_crit("CPU%u: may not have shut down cleanlyn", cpu);
         |                         ^~~~~~~
   arch/arm64/kernel/smp.c:173:17: note: here
     173 |                 case CPU_STUCK_IN_KERNEL:
         |                 ^~~~

vim +/__pcpu_scope_pending_ipi +601 arch/arm64/kernel/smp.c

   571	
   572	static void __init acpi_parse_and_init_cpus(void)
   573	{
   574		int i;
   575	
   576		/*
   577		 * do a walk of MADT to determine how many CPUs
   578		 * we have including disabled CPUs, and get information
   579		 * we need for SMP init.
   580		 */
   581		acpi_table_parse_madt(ACPI_MADT_TYPE_GENERIC_INTERRUPT,
   582					      acpi_parse_gic_cpu_interface, 0);
   583	
   584		/*
   585		 * In ACPI, SMP and CPU NUMA information is provided in separate
   586		 * static tables, namely the MADT and the SRAT.
   587		 *
   588		 * Thus, it is simpler to first create the cpu logical map through
   589		 * an MADT walk and then map the logical cpus to their node ids
   590		 * as separate steps.
   591		 */
   592		acpi_map_cpus_to_nodes();
   593	
   594		for (i = 0; i < nr_cpu_ids; i++)
   595			early_map_cpu_to_node(i, acpi_numa_get_nid(i));
   596	}
   597	#else
   598	#define acpi_parse_and_init_cpus(...)	do { } while (0)
   599	#endif
   600	/* Dummy vendor field */
 > 601	DEFINE_PER_CPU(bool, pending_ipi);
   602	EXPORT_SYMBOL_GPL(pending_ipi);
   603	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
