Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72C6427E049
	for <oe-kbuild-all@lists.linux.dev>; Mon,  8 Sep 2025 19:41:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757360504; cv=none; b=GUeyGdCEMhBbRb07RCr1f4hPq1BLvsE4Uh/f1n9NXGCaTn+tpPvMtqjIqA5smWhcalD/vf6dv6+wElHWmM0wCsF1HicXieJ7in1qblrasCWQLSd4EJu27ubmUbCwY6vkkQxmS6D5f6d2Q8IA0SIWcgoK+654yF7RsaVqxxDOHb4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757360504; c=relaxed/simple;
	bh=K9102wDEJIWL3bH2DZ/koZOjSRhkrkVaFTpo9zDEWxY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=OZyPWOXLVexMhYJMZJbFWkdxTG+QATtWhp+Qc++fjCbO6esGGSnmTg12UVdo5ofYb2O1vE4R+sJhc7+GZAyfsZChfGwN+J53bAvnebp8aARQpKhBCYSJpMXWzmEyT3BhmtrG9nL2araOHwjdMrDEK3ddK5d/QnYrbqpLkg8zIwQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=G+nWQ0HE; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="G+nWQ0HE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757360500; x=1788896500;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=K9102wDEJIWL3bH2DZ/koZOjSRhkrkVaFTpo9zDEWxY=;
  b=G+nWQ0HEA62gB1ybFXl75YdFKd98B6EPJRI4jsggyFdrGsLjVluTJ6+N
   AxpTot2FMa1T8jpWAybvgWdYoc+y4EGp/jYbBzBKKZ0PZUofgrk3a1Rqs
   JPfKoUcminOgBbxxd5z5eCEbI8cKcQ9bq/T+p+73sA4+noX+JYOQ+tVO1
   cYbm2O5DuthjsCUXJGm8omMe2xulkupQLH3E0pdTHj4vJ+X8aqzoKIRQe
   HPmXoRiosjTaPaNI3QP8jmq53Z9gwV/GBy5cURbaK2DsTJYZ10Na9/dH8
   JWbO1Rws814W5yKJ55MHt5e3MTaht0A31kzcWhVZJ0vgGzCE3u0/eVNYu
   w==;
X-CSE-ConnectionGUID: ipR9cLBhTXaChHMMO5qb8g==
X-CSE-MsgGUID: AedUH5eMRxKlIsOJgADsqQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="63462268"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="63462268"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Sep 2025 12:41:40 -0700
X-CSE-ConnectionGUID: v4cmRN5rSfiq/gQyuoiyag==
X-CSE-MsgGUID: cS2/AY52RWKD1kiOckOkmA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,249,1751266800"; 
   d="scan'208";a="173010842"
Received: from lkp-server01.sh.intel.com (HELO 114d98da2b6c) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 08 Sep 2025 12:41:38 -0700
Received: from kbuild by 114d98da2b6c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uvhk8-00047D-1A;
	Mon, 08 Sep 2025 19:41:36 +0000
Date: Tue, 9 Sep 2025 03:41:35 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6 0/1]
 include/linux/page_size_compat.h:118:16: warning: division by zero is
 undefined
Message-ID: <202509090330.ULLr3WLn-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Kalesh,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android15-6.6
head:   4a6f590554cba5f428f4668b72ce7eec4588dc6c
commit: 9e2b94a355b6ffc92bb88c6642a9c7babd3ebee6 [0/1] ANDROID: 16K: Fix __MAP_NO_COMPAT overflow
config: i386-buildonly-randconfig-005-20250909 (https://download.01.org/0day-ci/archive/20250909/202509090330.ULLr3WLn-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250909/202509090330.ULLr3WLn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509090330.ULLr3WLn-lkp@intel.com/

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
   In file included from drivers/input/keyboard/adp5588-keys.c:16:
   In file included from include/linux/i2c.h:13:
   In file included from include/linux/acpi.h:14:
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
   In file included from drivers/input/keyboard/adp5588-keys.c:16:
   In file included from include/linux/i2c.h:13:
   In file included from include/linux/acpi.h:14:
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
   In file included from drivers/input/keyboard/adp5588-keys.c:16:
   In file included from include/linux/i2c.h:13:
   In file included from include/linux/acpi.h:14:
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
   In file included from drivers/input/keyboard/adp5588-keys.c:16:
   In file included from include/linux/i2c.h:13:
   In file included from include/linux/acpi.h:14:
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
   In file included from drivers/input/keyboard/adp5588-keys.c:16:
   In file included from include/linux/i2c.h:13:
   In file included from include/linux/acpi.h:14:
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
