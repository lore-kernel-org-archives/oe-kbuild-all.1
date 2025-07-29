Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84028278E75
	for <oe-kbuild-all@lists.linux.dev>; Tue, 29 Jul 2025 20:59:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753822752; cv=none; b=aroVWCsAsBaWvzy/rDhJJt1L9DdC5bLH2Mh7mK7mhsyxFvY8pCwGJKrIju6814xB+6Lkm0BXgkjHvfuoPPWR8HFLEvOnurbK5Ekf3X6tRYhvybO6Bdmxp7pw8VMthRdO4yb/rqbBtqUD6j/BfVXjfyrKNQwYdAny0F208omJh/8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753822752; c=relaxed/simple;
	bh=8ebkpUQtwkvr+xboIPWdzY8H/GQCbAMRarBAVwfNelg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=iP266vVFGiWAfgfyGJgwVQelHmYWtLN9v13kRT55jZGAR5IoK0JmhtHqU0E3TcWot/ssHaKl15aDWMJcEHvA3hq0rMgiws3kC3SdJXV98sS/SBhWuNACfSfNzDP9JNAjOinUlAOdgdy5w6lCqEMBhWHR0Q4bN4PrkHJ3zsdado0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RMzcsshg; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RMzcsshg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753822750; x=1785358750;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=8ebkpUQtwkvr+xboIPWdzY8H/GQCbAMRarBAVwfNelg=;
  b=RMzcsshg7GUqR6QAGucAmSo6YH4VULjt0q0xkTOsLD0w5SvwcKsmEJzU
   JoJp8QctGUA3eIg/pYt2TQaZsw5eJnAOn2ZghuPYCM697XbYt4EazMN6h
   Qb3FWALOdXjyP5yKFaAjVq1Teg7eJWXcBNTe/Sw+W1lUMhPUq4jLMYUJ9
   JqDRRZsqOttX8CFahmynaWHIGXji9rHl7L/QzGRC31nPSoF+5a/JZHph+
   3YE3uLkkAwjo7CDO+ZhmYJssszKF/7naoyXhr/A/wsaqsHdaAWoAuK1d7
   99L70gXBqpE31IO6vQiGeCwVms7kE8ooG4f2sMO3edRI+c0Om4Ezy9vBH
   g==;
X-CSE-ConnectionGUID: 0wgUVIssSPOgvvxJYIUW3A==
X-CSE-MsgGUID: u45ljTsNR7OIHWRLcenWSg==
X-IronPort-AV: E=McAfee;i="6800,10657,11506"; a="55810574"
X-IronPort-AV: E=Sophos;i="6.16,350,1744095600"; 
   d="scan'208";a="55810574"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jul 2025 13:59:10 -0700
X-CSE-ConnectionGUID: 0EUr7URlRqmVAA+cq/Ptlw==
X-CSE-MsgGUID: UQHEB/+hQSOlRbVb/DY6hQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,350,1744095600"; 
   d="scan'208";a="162074883"
Received: from igk-lkp-server01.igk.intel.com (HELO b3b7d4258b7c) ([10.91.175.65])
  by orviesa006.jf.intel.com with ESMTP; 29 Jul 2025 13:59:08 -0700
Received: from kbuild by b3b7d4258b7c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ugrPe-0000gl-1W;
	Tue, 29 Jul 2025 20:59:06 +0000
Date: Tue, 29 Jul 2025 22:58:54 +0200
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6-2024-12 0/33]
 include/linux/page_size_compat.h:118:16: warning: division by zero is
 undefined
Message-ID: <202507292237.cdjcQ6kJ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android15-6.6-2024-12
head:   c7d3f561226819435c6c188a202ad531a108e5c4
commit: 9e2b94a355b6ffc92bb88c6642a9c7babd3ebee6 [0/33] ANDROID: 16K: Fix __MAP_NO_COMPAT overflow
config: i386-buildonly-randconfig-2001-20250719 (https://download.01.org/0day-ci/archive/20250729/202507292237.cdjcQ6kJ-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250729/202507292237.cdjcQ6kJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507292237.cdjcQ6kJ-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:186:1: warning: array index 3 is past the end of the array (that has type 'unsigned long[2]') [-Warray-bounds]
     186 | _SIG_SET_OP(signotset, _sig_not)
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/signal.h:173:10: note: expanded from macro '_SIG_SET_OP'
     173 |         case 4: set->sig[3] = op(set->sig[3]);                          \
         |                 ^        ~
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
      24 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from drivers/gpio/gpiolib-swnode.c:17:
   In file included from drivers/gpio/gpiolib.h:12:
   In file included from include/linux/cdev.h:8:
   In file included from include/linux/device.h:32:
   In file included from include/linux/device/driver.h:21:
   In file included from include/linux/module.h:19:
   In file included from include/linux/elf.h:6:
   In file included from arch/x86/include/asm/elf.h:8:
   In file included from include/linux/page_size_compat.h:27:
   In file included from include/linux/mman.h:5:
   In file included from include/linux/mm.h:1081:
   In file included from include/linux/huge_mm.h:8:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:186:1: warning: array index 2 is past the end of the array (that has type 'unsigned long[2]') [-Warray-bounds]
     186 | _SIG_SET_OP(signotset, _sig_not)
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/signal.h:174:20: note: expanded from macro '_SIG_SET_OP'
     174 |                 set->sig[2] = op(set->sig[2]);                          \
         |                                  ^        ~
   include/linux/signal.h:185:24: note: expanded from macro '_sig_not'
     185 | #define _sig_not(x)     (~(x))
         |                            ^
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
      24 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from drivers/gpio/gpiolib-swnode.c:17:
   In file included from drivers/gpio/gpiolib.h:12:
   In file included from include/linux/cdev.h:8:
   In file included from include/linux/device.h:32:
   In file included from include/linux/device/driver.h:21:
   In file included from include/linux/module.h:19:
   In file included from include/linux/elf.h:6:
   In file included from arch/x86/include/asm/elf.h:8:
   In file included from include/linux/page_size_compat.h:27:
   In file included from include/linux/mman.h:5:
   In file included from include/linux/mm.h:1081:
   In file included from include/linux/huge_mm.h:8:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:186:1: warning: array index 2 is past the end of the array (that has type 'unsigned long[2]') [-Warray-bounds]
     186 | _SIG_SET_OP(signotset, _sig_not)
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/signal.h:174:3: note: expanded from macro '_SIG_SET_OP'
     174 |                 set->sig[2] = op(set->sig[2]);                          \
         |                 ^        ~
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
      24 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from drivers/gpio/gpiolib-swnode.c:17:
   In file included from drivers/gpio/gpiolib.h:12:
   In file included from include/linux/cdev.h:8:
   In file included from include/linux/device.h:32:
   In file included from include/linux/device/driver.h:21:
   In file included from include/linux/module.h:19:
   In file included from include/linux/elf.h:6:
   In file included from arch/x86/include/asm/elf.h:8:
   In file included from include/linux/page_size_compat.h:27:
   In file included from include/linux/mman.h:5:
   In file included from include/linux/mm.h:2174:
   include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   In file included from drivers/gpio/gpiolib-swnode.c:17:
   In file included from drivers/gpio/gpiolib.h:12:
   In file included from include/linux/cdev.h:8:
   In file included from include/linux/device.h:32:
   In file included from include/linux/device/driver.h:21:
   In file included from include/linux/module.h:19:
   In file included from include/linux/elf.h:6:
   In file included from arch/x86/include/asm/elf.h:8:
   In file included from include/linux/page_size_compat.h:27:
   include/linux/mman.h:158:9: warning: division by zero is undefined [-Wdivision-by-zero]
     158 |                _calc_vm_trans(flags, MAP_SYNC,       VM_SYNC      ) |
         |                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/mman.h:136:21: note: expanded from macro '_calc_vm_trans'
     136 |    : ((x) & (bit1)) / ((bit1) / (bit2))))
         |                     ^ ~~~~~~~~~~~~~~~~~
   In file included from drivers/gpio/gpiolib-swnode.c:17:
   In file included from drivers/gpio/gpiolib.h:12:
   In file included from include/linux/cdev.h:8:
   In file included from include/linux/device.h:32:
   In file included from include/linux/device/driver.h:21:
   In file included from include/linux/module.h:19:
   In file included from include/linux/elf.h:6:
   In file included from arch/x86/include/asm/elf.h:8:
>> include/linux/page_size_compat.h:118:16: warning: division by zero is undefined [-Wdivision-by-zero]
     118 |                 flag_bits |= _calc_vm_trans(flags, __MAP_NO_COMPAT,  __VM_NO_COMPAT );
         |                              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/mman.h:136:21: note: expanded from macro '_calc_vm_trans'
     136 |    : ((x) & (bit1)) / ((bit1) / (bit2))))
         |                     ^ ~~~~~~~~~~~~~~~~~
   31 warnings and 1 error generated.
--
   In file included from drivers/gpio/gpio-da9052.c:10:
   include/linux/gpio/driver.h:39:19: error: field has incomplete type 'msi_alloc_info_t' (aka 'struct irq_alloc_info')
      39 |         msi_alloc_info_t        msiinfo;
         |                                 ^
   arch/x86/include/asm/msi.h:7:16: note: forward declaration of 'struct irq_alloc_info'
       7 | typedef struct irq_alloc_info msi_alloc_info_t;
         |                ^
   In file included from drivers/gpio/gpio-da9052.c:11:
   In file included from include/linux/module.h:19:
   In file included from include/linux/elf.h:6:
   In file included from arch/x86/include/asm/elf.h:8:
   In file included from include/linux/page_size_compat.h:27:
   In file included from include/linux/mman.h:5:
   In file included from include/linux/mm.h:2174:
   include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   In file included from drivers/gpio/gpio-da9052.c:11:
   In file included from include/linux/module.h:19:
   In file included from include/linux/elf.h:6:
   In file included from arch/x86/include/asm/elf.h:8:
   In file included from include/linux/page_size_compat.h:27:
   include/linux/mman.h:158:9: warning: division by zero is undefined [-Wdivision-by-zero]
     158 |                _calc_vm_trans(flags, MAP_SYNC,       VM_SYNC      ) |
         |                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/mman.h:136:21: note: expanded from macro '_calc_vm_trans'
     136 |    : ((x) & (bit1)) / ((bit1) / (bit2))))
         |                     ^ ~~~~~~~~~~~~~~~~~
   In file included from drivers/gpio/gpio-da9052.c:11:
   In file included from include/linux/module.h:19:
   In file included from include/linux/elf.h:6:
   In file included from arch/x86/include/asm/elf.h:8:
>> include/linux/page_size_compat.h:118:16: warning: division by zero is undefined [-Wdivision-by-zero]
     118 |                 flag_bits |= _calc_vm_trans(flags, __MAP_NO_COMPAT,  __VM_NO_COMPAT );
         |                              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/mman.h:136:21: note: expanded from macro '_calc_vm_trans'
     136 |    : ((x) & (bit1)) / ((bit1) / (bit2))))
         |                     ^ ~~~~~~~~~~~~~~~~~
   3 warnings and 1 error generated.


vim +118 include/linux/page_size_compat.h

e9c73e0594e0bd Kalesh Singh 2024-02-06   98  
66197e927d9f4f Kalesh Singh 2024-02-06   99  /*
66197e927d9f4f Kalesh Singh 2024-02-06  100   * Conditional page-alignment based on mmap flags
66197e927d9f4f Kalesh Singh 2024-02-06  101   *
66197e927d9f4f Kalesh Singh 2024-02-06  102   * If the VMA is allowed to not respect the emulated page size, align using the
66197e927d9f4f Kalesh Singh 2024-02-06  103   * base PAGE_SIZE, else align using the emulated __PAGE_SIZE.
66197e927d9f4f Kalesh Singh 2024-02-06  104   */
66197e927d9f4f Kalesh Singh 2024-02-06  105  #define __COMPAT_PAGE_ALIGN(size, flags) \
66197e927d9f4f Kalesh Singh 2024-02-06  106  	(flags & __MAP_NO_COMPAT) ? PAGE_ALIGN(size) : __PAGE_ALIGN(size)
66197e927d9f4f Kalesh Singh 2024-02-06  107  
66197e927d9f4f Kalesh Singh 2024-02-06  108  /*
66197e927d9f4f Kalesh Singh 2024-02-06  109   * Combines the mmap "flags" argument into "vm_flags"
66197e927d9f4f Kalesh Singh 2024-02-06  110   *
66197e927d9f4f Kalesh Singh 2024-02-06  111   * If page size emulation is enabled, adds translation of the no-compat flag.
66197e927d9f4f Kalesh Singh 2024-02-06  112   */
66197e927d9f4f Kalesh Singh 2024-02-06  113  static __always_inline unsigned long calc_vm_flag_bits(unsigned long flags)
e9c73e0594e0bd Kalesh Singh 2024-02-06  114  {
66197e927d9f4f Kalesh Singh 2024-02-06  115  	unsigned long flag_bits = __calc_vm_flag_bits(flags);
66197e927d9f4f Kalesh Singh 2024-02-06  116  
66197e927d9f4f Kalesh Singh 2024-02-06  117  	if (static_branch_unlikely(&page_shift_compat_enabled))
66197e927d9f4f Kalesh Singh 2024-02-06 @118  		flag_bits |= _calc_vm_trans(flags, __MAP_NO_COMPAT,  __VM_NO_COMPAT );
66197e927d9f4f Kalesh Singh 2024-02-06  119  
66197e927d9f4f Kalesh Singh 2024-02-06  120  	return flag_bits;
66197e927d9f4f Kalesh Singh 2024-02-06  121  }
66197e927d9f4f Kalesh Singh 2024-02-06  122  

:::::: The code at line 118 was first introduced by commit
:::::: 66197e927d9f4f6fe4d6cc90da3894a95daa71d8 ANDROID: 16K: Handle filemap faults

:::::: TO: Kalesh Singh <kaleshsingh@google.com>
:::::: CC: Kalesh Singh <kaleshsingh@google.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
