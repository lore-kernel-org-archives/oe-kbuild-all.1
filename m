Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 540CB63C0
	for <oe-kbuild-all@lists.linux.dev>; Sat, 16 Sep 2023 00:11:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694823109; x=1726359109;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=YeFMK3r+EpE6YX5jZMF+npqjiRkqi/3cXQmMGcYpxYs=;
  b=Xtp3ZNgsvR4OTPn/MtePVLX6mxbQz7LU9b6AlE8qaMFy4MK3xK3SD32j
   AQeffjCHg5/qQF3v84NNlrSBXpgCU8MOAL2546Rjx60PHIyCjS8fBhf/D
   4NjxywknEiuCJexKU/I3MBP3M35MtEXMm/EtNlJa9zHxD/QnV72OZQCEx
   r81+Y4jBIHJrcvxwVmCkrph8XC33gl01Spz9ICj4AHdebhgn7IZWEh8xl
   mQMq6y9XV/p0GA0OvUbXVT3Vy1KIvIc4KVLRdBkxneH4uTsOmZF4YuO8j
   kLwHMqZQg+ueOV5dzPr45IP/fd5HJ4vHXPUPvt+H9bRAhwOXiaqSZn21y
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10834"; a="445838074"
X-IronPort-AV: E=Sophos;i="6.02,150,1688454000"; 
   d="scan'208";a="445838074"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2023 17:11:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10834"; a="1075948071"
X-IronPort-AV: E=Sophos;i="6.02,150,1688454000"; 
   d="scan'208";a="1075948071"
Received: from lkp-server02.sh.intel.com (HELO 9ef86b2655e5) ([10.239.97.151])
  by fmsmga005.fm.intel.com with ESMTP; 15 Sep 2023 17:11:47 -0700
Received: from kbuild by 9ef86b2655e5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qhIuW-0003de-2w;
	Sat, 16 Sep 2023 00:11:44 +0000
Date: Sat, 16 Sep 2023 08:11:31 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [tglx-devel:x86/topo-full 76/92] arch/x86/include/asm/apic.h:196:20:
 error: redefinition of 'topology_apply_cmdline_limits_early'
Message-ID: <202309160837.WLiwg9S0-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tglx/devel.git x86/topo-full
head:   a71fe714eb23e6465ebd4962d95ea340b20bd792
commit: 50068c105c93a41078efea87c4655bbeeb4b5a48 [76/92] x86/cpu/topology: Rework possible CPU management
config: i386-allnoconfig (https://download.01.org/0day-ci/archive/20230916/202309160837.WLiwg9S0-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230916/202309160837.WLiwg9S0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309160837.WLiwg9S0-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/x86/kernel/cpu/scattered.c:8:
>> arch/x86/include/asm/apic.h:196:20: error: redefinition of 'topology_apply_cmdline_limits_early'
     196 | static inline void topology_apply_cmdline_limits_early(void) { }
         |                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from include/linux/topology.h:36,
                    from include/linux/gfp.h:8,
                    from include/linux/xarray.h:15,
                    from include/linux/radix-tree.h:21,
                    from include/linux/idr.h:15,
                    from include/linux/kernfs.h:12,
                    from include/linux/sysfs.h:16,
                    from include/linux/kobject.h:20,
                    from include/linux/energy_model.h:7,
                    from include/linux/device.h:16,
                    from include/linux/node.h:18,
                    from include/linux/cpu.h:17,
                    from arch/x86/kernel/cpu/scattered.c:5:
   arch/x86/include/asm/topology.h:208:20: note: previous definition of 'topology_apply_cmdline_limits_early' with type 'void(void)'
     208 | static inline void topology_apply_cmdline_limits_early(void) { }
         |                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
--
   In file included from arch/x86/kernel/cpu/topology_common.c:6:
>> arch/x86/include/asm/apic.h:196:20: error: redefinition of 'topology_apply_cmdline_limits_early'
     196 | static inline void topology_apply_cmdline_limits_early(void) { }
         |                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from include/linux/topology.h:36,
                    from include/linux/gfp.h:8,
                    from include/linux/xarray.h:15,
                    from include/linux/radix-tree.h:21,
                    from include/linux/idr.h:15,
                    from include/linux/kernfs.h:12,
                    from include/linux/sysfs.h:16,
                    from include/linux/kobject.h:20,
                    from include/linux/energy_model.h:7,
                    from include/linux/device.h:16,
                    from include/linux/node.h:18,
                    from include/linux/cpu.h:17,
                    from arch/x86/kernel/cpu/topology_common.c:2:
   arch/x86/include/asm/topology.h:208:20: note: previous definition of 'topology_apply_cmdline_limits_early' with type 'void(void)'
     208 | static inline void topology_apply_cmdline_limits_early(void) { }
         |                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/kernel/cpu/topology_common.c: In function 'cpu_parse_topology':
   arch/x86/kernel/cpu/topology_common.c:185:31: error: 'cpuid_to_apicid' undeclared (first use in this function); did you mean 'x86_cpu_to_apicid'?
     185 |         if (c->topo.apicid != cpuid_to_apicid[cpu]) {
         |                               ^~~~~~~~~~~~~~~
         |                               x86_cpu_to_apicid
   arch/x86/kernel/cpu/topology_common.c:185:31: note: each undeclared identifier is reported only once for each function it appears in


vim +/topology_apply_cmdline_limits_early +196 arch/x86/include/asm/apic.h

   181	
   182	#else /* !CONFIG_X86_LOCAL_APIC */
   183	static inline void lapic_shutdown(void) { }
   184	#define local_apic_timer_c2_ok		1
   185	static inline void init_apic_mappings(void) { }
   186	static inline void disable_local_APIC(void) { }
   187	# define setup_boot_APIC_clock x86_init_noop
   188	# define setup_secondary_APIC_clock x86_init_noop
   189	static inline void lapic_update_tsc_freq(void) { }
   190	static inline void init_bsp_APIC(void) { }
   191	static inline void apic_intr_mode_select(void) { }
   192	static inline void apic_intr_mode_init(void) { }
   193	static inline void lapic_assign_system_vectors(void) { }
   194	static inline void lapic_assign_legacy_vector(unsigned int i, bool r) { }
   195	static inline bool apic_needs_pit(void) { return true; }
 > 196	static inline void topology_apply_cmdline_limits_early(void) { }
   197	static inline void topology_init_possible_cpus(void) { }
   198	#endif /* !CONFIG_X86_LOCAL_APIC */
   199	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
