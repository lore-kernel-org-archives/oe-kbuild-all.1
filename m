Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FAAA4AEEF
	for <oe-kbuild-all@lists.linux.dev>; Wed,  8 Jul 2026 18:05:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783533912; cv=none; b=IGmpv3xk5VuPv8pNpd8ZZ1ilF2n3rHIOPR2MlEzhrPbvr+8oHB7TwaSlr4Us/cYVi+NLpKTmqJ7pFX/avw5HlZTqgsgyiS1SBeuxEwuEd+YIfZO0566QComO7u1TFd4c85FaGX4XQ27JnhraEXbWnzMRFW4n945GGJJZNTZqdjI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783533912; c=relaxed/simple;
	bh=w8YZfzSYmLjuVSvhGwmj/GE7s4AQATearYgxjsD7kTI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=QwWJ4KY5/dbXz3RGpMfIynnW8iLYMWqEQ5bdWlIExAqgFXmPefPtrsluU96N1yXWSAkid9gPtlUPnhL1zYa2TXmPkDHvsgx6qk8qaOn3dAL4i1u0QsUPICIex2aVVJLXJ0UYcbGSOTVo4I9BboeIaOKN2YwDxSvfiKY5VqBlNuc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jZhpYwLS; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jZhpYwLS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783533910; x=1815069910;
  h=date:from:to:cc:subject:message-id;
  bh=w8YZfzSYmLjuVSvhGwmj/GE7s4AQATearYgxjsD7kTI=;
  b=jZhpYwLSkw+jNgrru90QmpWrQL+HEexfUbo8nfnQXGgFw7+Rs2Kp5p7q
   u9x2CTBKiA/DhXwbvTN+bJPg+RtPy32aCxscriXRLL7MtMV9mTW2J9X+a
   YU8eZYCt4OGvY++4Smi2WDTsoXysq+A40+j0YR9Gppx+TTYLOEMQiFlyx
   xyQDD+xuy+Zf8dB0WnmIBnuLuFLI+XytkZzVtVEeHArCpSlfyZ83UwO0G
   bvOsEy8yhVmFCci6Xqz27bgyRNX/hyxngoV4FJC2uEpuCpbUxnBBQc5qa
   zs6PtL1sjirNf3qgWZaO43MizxH/tEAbWa2qICN/TCV5I1AMvNdnFnVr7
   A==;
X-CSE-ConnectionGUID: gmobZQejQI2mFIa/0kF6SQ==
X-CSE-MsgGUID: 9EAmtAszQMS6VOfE0T3CLQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="88030806"
X-IronPort-AV: E=Sophos;i="6.25,153,1779174000"; 
   d="scan'208";a="88030806"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jul 2026 11:05:10 -0700
X-CSE-ConnectionGUID: HBcPJ82sRXeheDGnFpThSw==
X-CSE-MsgGUID: NJDAoCBvTj2YuQ7cXSgbPQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,153,1779174000"; 
   d="scan'208";a="250359977"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa010.fm.intel.com with ESMTP; 08 Jul 2026 11:05:08 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1whWdt-00000000Ghz-42M9;
	Wed, 08 Jul 2026 18:05:05 +0000
Date: Thu, 09 Jul 2026 02:04:22 +0800
From: kernel test robot <lkp@intel.com>
To: Richard Kuo <rkuo@quicinc.com>
Cc: oe-kbuild-all@lists.linux.dev, Brian Cain <bcain@kernel.org>
Subject: [bcain:bcain/qemu_boot 26/69]
 arch/hexagon/kernel/devtree.c:130:12: error: call to undeclared function
 'of_get_flat_dt_root'; ISO C99 and later do not support implicit function
 declarations
Message-ID: <202607090147.zIkmN0f0-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/bcain/linux.git bcain/qemu_boot
head:   89efd48e5609f41280973bc49df20ffe80177690
commit: c01c2aee2f3a158faf365c893a4578a5a0dee73f [26/69] hexagon: add memory management enhancements
config: hexagon-randconfig-r121-20260708 (https://download.01.org/0day-ci/archive/20260709/202607090147.zIkmN0f0-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project c279890c85da307abe34f10333442bbf72a60644)
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260709/202607090147.zIkmN0f0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607090147.zIkmN0f0-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/hexagon/kernel/devtree.c:17:13: warning: no previous prototype for function 'early_init_dt_add_memory_arch' [-Wmissing-prototypes]
      17 | void __init early_init_dt_add_memory_arch(u64 base, u64 size)
         |             ^
   arch/hexagon/kernel/devtree.c:17:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      17 | void __init early_init_dt_add_memory_arch(u64 base, u64 size)
         | ^
         | static 
   arch/hexagon/kernel/devtree.c:50:6: error: call to undeclared function 'of_get_flat_dt_prop'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
      50 |         p = of_get_flat_dt_prop(node, "bootargs", &l);
         |             ^
   arch/hexagon/kernel/devtree.c:50:4: error: incompatible integer to pointer conversion assigning to 'char *' from 'int' [-Wint-conversion]
      50 |         p = of_get_flat_dt_prop(node, "bootargs", &l);
         |           ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/hexagon/kernel/devtree.c:104:29: warning: attribute declaration must precede definition [-Wignored-attributes]
     104 | const struct machine_desc * __init setup_machine_fdt(void *dt_phys)
         |                             ^
   include/linux/init.h:45:17: note: expanded from macro '__init'
      45 | #define __init          __section(".init.text") __cold __latent_entropy \
         |                         ^
   include/linux/compiler_attributes.h:330:56: note: expanded from macro '__section'
     330 | #define __section(section)              __attribute__((__section__(section)))
         |                                                        ^
   arch/hexagon/include/asm/prom.h:14:42: note: previous definition is here
      14 | static inline const struct machine_desc *setup_machine_fdt(void *dt_phys)
         |                                          ^
   arch/hexagon/kernel/devtree.c:104:29: warning: attribute declaration must precede definition [-Wignored-attributes]
     104 | const struct machine_desc * __init setup_machine_fdt(void *dt_phys)
         |                             ^
   include/linux/init.h:45:41: note: expanded from macro '__init'
      45 | #define __init          __section(".init.text") __cold __latent_entropy \
         |                                                 ^
   include/linux/compiler_types.h:112:34: note: expanded from macro '__cold'
     112 | #define __cold                          __attribute__((__cold__))
         |                                                        ^
   arch/hexagon/include/asm/prom.h:14:42: note: previous definition is here
      14 | static inline const struct machine_desc *setup_machine_fdt(void *dt_phys)
         |                                          ^
   arch/hexagon/kernel/devtree.c:104:36: error: redefinition of 'setup_machine_fdt'
     104 | const struct machine_desc * __init setup_machine_fdt(void *dt_phys)
         |                                    ^
   arch/hexagon/include/asm/prom.h:14:42: note: previous definition is here
      14 | static inline const struct machine_desc *setup_machine_fdt(void *dt_phys)
         |                                          ^
   arch/hexagon/kernel/devtree.c:120:2: error: use of undeclared identifier 'initial_boot_params'
     120 |         initial_boot_params = dt_phys;
         |         ^~~~~~~~~~~~~~~~~~~
   arch/hexagon/kernel/devtree.c:126:23: error: use of undeclared identifier 'initial_boot_params'
     126 |         if (fdt_magic(initial_boot_params) != OF_DT_HEADER) {
         |                       ^~~~~~~~~~~~~~~~~~~
>> arch/hexagon/kernel/devtree.c:130:12: error: call to undeclared function 'of_get_flat_dt_root'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     130 |         dt_root = of_get_flat_dt_root();
         |                   ^
>> arch/hexagon/kernel/devtree.c:132:15: error: call to undeclared function 'of_flat_dt_match_machine'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     132 |         mdesc_best = of_flat_dt_match_machine(NULL, arch_get_next_mach);
         |                      ^
>> arch/hexagon/kernel/devtree.c:132:13: error: incompatible integer to pointer conversion assigning to 'const struct machine_desc *' from 'int' [-Wint-conversion]
     132 |         mdesc_best = of_flat_dt_match_machine(NULL, arch_get_next_mach);
         |                    ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> arch/hexagon/kernel/devtree.c:142:9: error: call to undeclared function 'early_init_dt_scan_root'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     142 |         early_init_dt_scan_root();
         |         ^
>> arch/hexagon/kernel/devtree.c:147:2: error: call to undeclared function 'early_init_dt_scan_chosen'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     147 |         early_init_dt_scan_chosen(boot_command_line);
         |         ^
   3 warnings and 10 errors generated.


vim +/of_get_flat_dt_root +130 arch/hexagon/kernel/devtree.c

288801685d7137 Richard Kuo 2025-08-18  124  
288801685d7137 Richard Kuo 2025-08-18  125          /* check device tree validity */
288801685d7137 Richard Kuo 2025-08-18  126          if (fdt_magic(initial_boot_params) != OF_DT_HEADER) {
288801685d7137 Richard Kuo 2025-08-18  127                  return NULL;
288801685d7137 Richard Kuo 2025-08-18  128  	}
288801685d7137 Richard Kuo 2025-08-18  129  
288801685d7137 Richard Kuo 2025-08-18 @130  	dt_root = of_get_flat_dt_root();
288801685d7137 Richard Kuo 2025-08-18  131  
5d4b53d10af44d Brian Cain  2026-01-24 @132  	mdesc_best = of_flat_dt_match_machine(NULL, arch_get_next_mach);
288801685d7137 Richard Kuo 2025-08-18  133  
288801685d7137 Richard Kuo 2025-08-18  134  	if (!mdesc_best) {
288801685d7137 Richard Kuo 2025-08-18  135  		panic("Unrecognized device tree\n");
288801685d7137 Richard Kuo 2025-08-18  136  	}
288801685d7137 Richard Kuo 2025-08-18  137  
288801685d7137 Richard Kuo 2025-08-18  138          /*
288801685d7137 Richard Kuo 2025-08-18  139  	 * Sets the top level address and size cells which are stored
288801685d7137 Richard Kuo 2025-08-18  140  	 * in globals by the devtree infrastructure.
288801685d7137 Richard Kuo 2025-08-18  141  	 */
288801685d7137 Richard Kuo 2025-08-18 @142          early_init_dt_scan_root();
288801685d7137 Richard Kuo 2025-08-18  143  
288801685d7137 Richard Kuo 2025-08-18  144          /*  Retrieve various information from the /chosen node  */
288801685d7137 Richard Kuo 2025-08-18  145  #ifndef CONFIG_HEXAGON_MSM8974_FLUID
288801685d7137 Richard Kuo 2025-08-18  146  	//  Fixme:  do this consistently for platforms
288801685d7137 Richard Kuo 2025-08-18 @147  	early_init_dt_scan_chosen(boot_command_line);
288801685d7137 Richard Kuo 2025-08-18  148  #endif
288801685d7137 Richard Kuo 2025-08-18  149          /*  Setup memory  */
288801685d7137 Richard Kuo 2025-08-18  150  	//of_scan_flat_dt(early_init_dt_scan_memory, NULL);
288801685d7137 Richard Kuo 2025-08-18  151  
288801685d7137 Richard Kuo 2025-08-18  152  	return mdesc_best;
288801685d7137 Richard Kuo 2025-08-18  153  }
288801685d7137 Richard Kuo 2025-08-18  154  

:::::: The code at line 130 was first introduced by commit
:::::: 288801685d71376da5644b5f11ea806fc06ccea1 hexagon: add device tree support

:::::: TO: Richard Kuo <rkuo@quicinc.com>
:::::: CC: Brian Cain <brian.cain@oss.qualcomm.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
