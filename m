Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 609D91078B
	for <oe-kbuild-all@lists.linux.dev>; Thu, 30 May 2024 03:24:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717039501; cv=none; b=I37C2lIg09F0TuNrI3GcMff4KM2jQkJ0vpk53+r8AG64QW33DVhRhzAyVOaf+lS2+XDRiyyWL6OJ7jXSJ0NvPB2k3SyOSprHRwRYC68LAi5EHavzX8eJGws6U9HgNs0IG/slH9w2oLs3upI9pP/oBj4zUOlcsBiidWkri5aH47o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717039501; c=relaxed/simple;
	bh=ST0p5M4YcsuoTkOvLcAvJAWKPf8gZ4K5KqYO+qxq4BM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=hRwQ+ITwuKMwQvg8JvuBYgihTIk1SeaotNExX9GQuNXRMCxacaVtA2M7bYMOr+jhIG6uxrBlYu+8jYzZhOY3l/Kh8ArQYw81HX3XE+W4ZkgA0KNXmz5iKNYWTC9TCKkVJWVfRhfZw4SzPPIGWrM7Ek9td1iytR76rJvL076aZPU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Z7lOl6cU; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Z7lOl6cU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717039499; x=1748575499;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ST0p5M4YcsuoTkOvLcAvJAWKPf8gZ4K5KqYO+qxq4BM=;
  b=Z7lOl6cUtjkqAnb4ztRqBprSGf7bySg111dAcO2zalI9bUNDaPrAoJWe
   HFHgOLPIESfqjwKdl7YDw7qx3B/2WbTA+W/wWqYQcUp/GVd4NdAacLt6i
   rHYtMWf4uEjdr38w6KgYX1cdYonZrB07mCCX+iZJfuitlFUnRjfZgu7ew
   +8cfqkfyw3as2kAA8Dw6BoQ+SldmYQGvze1WVotVBd/ozllJ8wWIsBcRz
   koRgQcgMAUZH7yS4Ze5SSLKsrVD3l5tS4qqiUHmkscp8wGLLANtiw0AWx
   2quHJ60Te4YqokSp2DNGGw9HrSAx09PXMVnRCmr3gGXqNccJD70oT6SZH
   A==;
X-CSE-ConnectionGUID: iGjP6agBR8mG+IP7XkXpRA==
X-CSE-MsgGUID: V913Ce7qSrKUYoAiFLTRbA==
X-IronPort-AV: E=McAfee;i="6600,9927,11087"; a="13257365"
X-IronPort-AV: E=Sophos;i="6.08,199,1712646000"; 
   d="scan'208";a="13257365"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 May 2024 20:24:58 -0700
X-CSE-ConnectionGUID: SgSQJAXIR5K4QoL81BHrJQ==
X-CSE-MsgGUID: TLXD8s+vSUexiycIBvBwIQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,199,1712646000"; 
   d="scan'208";a="40198563"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by fmviesa004.fm.intel.com with ESMTP; 29 May 2024 20:24:57 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sCWPP-000EWd-1R;
	Thu, 30 May 2024 03:24:55 +0000
Date: Thu, 30 May 2024 11:24:01 +0800
From: kernel test robot <lkp@intel.com>
To: Bart Van Assche <bvanassche@acm.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [bvanassche:struct-device 20/20] include/linux/topology.h:197:61:
 warning: left-hand operand of comma expression has no effect
Message-ID: <202405301141.yZ9ySyCe-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/bvanassche/linux struct-device
head:   6a39e6660e65ae3609a0114b7a5f458cbc5b3602
commit: f37061809bb98e131179785e0d1ff3fe5bfbd819 [20/20] driver core: Remove struct device::id
config: arm-randconfig-003-20240529 (https://download.01.org/0day-ci/archive/20240530/202405301141.yZ9ySyCe-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240530/202405301141.yZ9ySyCe-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405301141.yZ9ySyCe-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/gfp.h:8,
                    from include/linux/xarray.h:16,
                    from include/linux/radix-tree.h:21,
                    from include/linux/idr.h:15,
                    from include/linux/kernfs.h:12,
                    from include/linux/sysfs.h:16,
                    from include/linux/kobject.h:20,
                    from include/linux/of.h:18,
                    from include/linux/clk-provider.h:9,
                    from arch/arm/mach-versatile/spc.c:12:
   arch/arm/mach-versatile/spc.c: In function 've_init_opp_table':
   arch/arm/mach-versatile/spc.c:425:55: error: 'struct device' has no member named 'id'
     425 |         cluster = topology_physical_package_id(cpu_dev->id);
         |                                                       ^~
   include/linux/topology.h:197:57: note: in definition of macro 'topology_physical_package_id'
     197 | #define topology_physical_package_id(cpu)       ((void)(cpu), -1)
         |                                                         ^~~
>> include/linux/topology.h:197:61: warning: left-hand operand of comma expression has no effect [-Wunused-value]
     197 | #define topology_physical_package_id(cpu)       ((void)(cpu), -1)
         |                                                             ^
   arch/arm/mach-versatile/spc.c:425:19: note: in expansion of macro 'topology_physical_package_id'
     425 |         cluster = topology_physical_package_id(cpu_dev->id);
         |                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/arm/mach-versatile/spc.c: In function 've_spc_clk_register':
   arch/arm/mach-versatile/spc.c:532:60: error: 'struct device' has no member named 'id'
     532 |         spc->cluster = topology_physical_package_id(cpu_dev->id);
         |                                                            ^~
   include/linux/topology.h:197:57: note: in definition of macro 'topology_physical_package_id'
     197 | #define topology_physical_package_id(cpu)       ((void)(cpu), -1)
         |                                                         ^~~
>> include/linux/topology.h:197:61: warning: left-hand operand of comma expression has no effect [-Wunused-value]
     197 | #define topology_physical_package_id(cpu)       ((void)(cpu), -1)
         |                                                             ^
   arch/arm/mach-versatile/spc.c:532:24: note: in expansion of macro 'topology_physical_package_id'
     532 |         spc->cluster = topology_physical_package_id(cpu_dev->id);
         |                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/arm/mach-versatile/spc.c: In function 've_spc_clk_init':
   arch/arm/mach-versatile/spc.c:574:63: error: 'struct device' has no member named 'id'
     574 |                 cluster = topology_physical_package_id(cpu_dev->id);
         |                                                               ^~
   include/linux/topology.h:197:57: note: in definition of macro 'topology_physical_package_id'
     197 | #define topology_physical_package_id(cpu)       ((void)(cpu), -1)
         |                                                         ^~~
>> include/linux/topology.h:197:61: warning: left-hand operand of comma expression has no effect [-Wunused-value]
     197 | #define topology_physical_package_id(cpu)       ((void)(cpu), -1)
         |                                                             ^
   arch/arm/mach-versatile/spc.c:574:27: note: in expansion of macro 'topology_physical_package_id'
     574 |                 cluster = topology_physical_package_id(cpu_dev->id);
         |                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from include/linux/smp.h:13,
                    from include/linux/lockdep.h:14,
                    from include/linux/mutex.h:17,
                    from include/linux/kernfs.h:11:
   arch/arm/mach-versatile/spc.c:581:55: error: 'struct device' has no member named 'id'
     581 |                          topology_core_cpumask(cpu_dev->id)))
         |                                                       ^~
   include/linux/cpumask.h:860:39: note: in definition of macro 'cpumask_of'
     860 | #define cpumask_of(cpu) (get_cpu_mask(cpu))
         |                                       ^~~
   arch/arm/mach-versatile/spc.c:581:26: note: in expansion of macro 'topology_core_cpumask'
     581 |                          topology_core_cpumask(cpu_dev->id)))
         |                          ^~~~~~~~~~~~~~~~~~~~~


vim +197 include/linux/topology.h

2c4dcd7fd57b20 Heiko Carstens      2021-11-29  195  
c50cbb05a05cf1 Ben Hutchings       2008-06-04  196  #ifndef topology_physical_package_id
c50cbb05a05cf1 Ben Hutchings       2008-06-04 @197  #define topology_physical_package_id(cpu)	((void)(cpu), -1)
c50cbb05a05cf1 Ben Hutchings       2008-06-04  198  #endif
0e344d8c709fe0 Len Brown           2019-05-13  199  #ifndef topology_die_id
0e344d8c709fe0 Len Brown           2019-05-13  200  #define topology_die_id(cpu)			((void)(cpu), -1)
0e344d8c709fe0 Len Brown           2019-05-13  201  #endif
c5e22feffdd736 Jonathan Cameron    2021-09-24  202  #ifndef topology_cluster_id
c5e22feffdd736 Jonathan Cameron    2021-09-24  203  #define topology_cluster_id(cpu)		((void)(cpu), -1)
c5e22feffdd736 Jonathan Cameron    2021-09-24  204  #endif
c50cbb05a05cf1 Ben Hutchings       2008-06-04  205  #ifndef topology_core_id
c50cbb05a05cf1 Ben Hutchings       2008-06-04  206  #define topology_core_id(cpu)			((void)(cpu), 0)
c50cbb05a05cf1 Ben Hutchings       2008-06-04  207  #endif
f1045056c72644 Heiko Carstens      2021-11-29  208  #ifndef topology_book_id
f1045056c72644 Heiko Carstens      2021-11-29  209  #define topology_book_id(cpu)			((void)(cpu), -1)
f1045056c72644 Heiko Carstens      2021-11-29  210  #endif
f1045056c72644 Heiko Carstens      2021-11-29  211  #ifndef topology_drawer_id
f1045056c72644 Heiko Carstens      2021-11-29  212  #define topology_drawer_id(cpu)			((void)(cpu), -1)
f1045056c72644 Heiko Carstens      2021-11-29  213  #endif
ab28e944197fa7 Tony Luck           2022-01-31  214  #ifndef topology_ppin
ab28e944197fa7 Tony Luck           2022-01-31  215  #define topology_ppin(cpu)			((void)(cpu), 0ull)
ab28e944197fa7 Tony Luck           2022-01-31  216  #endif
06931e62246844 Bartosz Golaszewski 2015-05-26  217  #ifndef topology_sibling_cpumask
06931e62246844 Bartosz Golaszewski 2015-05-26  218  #define topology_sibling_cpumask(cpu)		cpumask_of(cpu)
fbd59a8d1f7cf3 Rusty Russell       2009-01-10  219  #endif
fbd59a8d1f7cf3 Rusty Russell       2009-01-10  220  #ifndef topology_core_cpumask
fbd59a8d1f7cf3 Rusty Russell       2009-01-10  221  #define topology_core_cpumask(cpu)		cpumask_of(cpu)
fbd59a8d1f7cf3 Rusty Russell       2009-01-10  222  #endif
c5e22feffdd736 Jonathan Cameron    2021-09-24  223  #ifndef topology_cluster_cpumask
c5e22feffdd736 Jonathan Cameron    2021-09-24  224  #define topology_cluster_cpumask(cpu)		cpumask_of(cpu)
c5e22feffdd736 Jonathan Cameron    2021-09-24  225  #endif
2e4c54dac7b360 Len Brown           2019-05-13  226  #ifndef topology_die_cpumask
2e4c54dac7b360 Len Brown           2019-05-13  227  #define topology_die_cpumask(cpu)		cpumask_of(cpu)
2e4c54dac7b360 Len Brown           2019-05-13  228  #endif
f1045056c72644 Heiko Carstens      2021-11-29  229  #ifndef topology_book_cpumask
f1045056c72644 Heiko Carstens      2021-11-29  230  #define topology_book_cpumask(cpu)		cpumask_of(cpu)
f1045056c72644 Heiko Carstens      2021-11-29  231  #endif
f1045056c72644 Heiko Carstens      2021-11-29  232  #ifndef topology_drawer_cpumask
f1045056c72644 Heiko Carstens      2021-11-29  233  #define topology_drawer_cpumask(cpu)		cpumask_of(cpu)
f1045056c72644 Heiko Carstens      2021-11-29  234  #endif
c50cbb05a05cf1 Ben Hutchings       2008-06-04  235  

:::::: The code at line 197 was first introduced by commit
:::::: c50cbb05a05cf1f9ca3592272eff053c847727d8 cpu topology: always define CPU topology information

:::::: TO: Ben Hutchings <bhutchings@solarflare.com>
:::::: CC: Ingo Molnar <mingo@elte.hu>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
