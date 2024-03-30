Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C07DB64B
	for <oe-kbuild-all@lists.linux.dev>; Sat, 30 Mar 2024 06:53:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711781606; cv=none; b=f7jO62VFVCxb9txgW22RvZJMoyGAZuv73N8Y0xLVTtlkXWrSQIfHwa5sgdVvBY8wNsGRbAJK2Alk2E1Rc8rtkBq9t6XvN6CaefRrm61sv3uHJ7EJCUCE4iw6yLpul8AJJXq6kKcukDCOI4M1g/4liSadue1lPBIfAJE4y39LN38=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711781606; c=relaxed/simple;
	bh=U2X5wpKbuVyrnIB8Ng1AjP9jwGDPMgPYU8Fc/Yoowyk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=bq304x58a0vx7fSYgfanjWLi21xi6Ur7PfpTTJO0ctGjdMB8SHyzeAywOKb/4ocF12Btbxzt8rVWWdpBgJxtNfI1Y1i6AhawngMA3bqgRBzy1KudtMX4nYPN8NiYcVJwXWvKAIwaRGrJgkYQDVdY8Q/Sw9It4c6ZWpVtLC7bP0w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GMgfet/h; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GMgfet/h"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711781604; x=1743317604;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=U2X5wpKbuVyrnIB8Ng1AjP9jwGDPMgPYU8Fc/Yoowyk=;
  b=GMgfet/hnGgQ7w38TvMxYJPG0FjfurWIycNeUh4YiEz67QxSmYd/bGD8
   MnMUgimTJ/qtCNTI7gpZyhfXoMMoOUMwl2MSMQgQpqyE1r6E4UCUgBZrn
   BuxbAxDJEFudZwKpB428oEvX5itxGsiUh/zJcAnQNRxs47WZeUHWRRZqz
   ez8XYSHLwQlALJarIa3s1XOlmWEs2aAaaniARP1BPABojJlwVBXd0k22b
   fO7jXKnNloq34ri7r2fHuUJoNKtdV2XEahJes80+bbs3MrmUM0bfBEK73
   8E2Wh0/5yai2eyo5jRI/8Egomjq8xL/zOmHO/0Rwm3kcsQlF6nuGxZJIT
   w==;
X-CSE-ConnectionGUID: bCMIna+xQ0K76LK989gd1A==
X-CSE-MsgGUID: 15TR8aszR6eHNrXDdVHPPQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11028"; a="10753086"
X-IronPort-AV: E=Sophos;i="6.07,166,1708416000"; 
   d="scan'208";a="10753086"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Mar 2024 23:53:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,166,1708416000"; 
   d="scan'208";a="17254218"
Received: from lkp-server01.sh.intel.com (HELO be39aa325d23) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 29 Mar 2024 23:53:23 -0700
Received: from kbuild by be39aa325d23 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rqSae-00041a-1X;
	Sat, 30 Mar 2024 06:53:20 +0000
Date: Sat, 30 Mar 2024 14:52:20 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6 1/1]
 include/linux/page_size_compat.h:118:16: warning: division by zero is
 undefined
Message-ID: <202403301412.Xq9Q48QF-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android15-6.6
head:   ff3ecc94ab96bb59039aca3bbb8e1b12eb970d08
commit: 9e2b94a355b6ffc92bb88c6642a9c7babd3ebee6 [1/1] ANDROID: 16K: Fix __MAP_NO_COMPAT overflow
config: i386-buildonly-randconfig-006-20240329 (https://download.01.org/0day-ci/archive/20240330/202403301412.Xq9Q48QF-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240330/202403301412.Xq9Q48QF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403301412.Xq9Q48QF-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/mman.h:5:
   In file included from include/linux/mm.h:1081:
   In file included from include/linux/huge_mm.h:8:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:186:1: warning: array index 3 is past the end of the array (that has type 'unsigned long[2]') [-Warray-bounds]
     186 | _SIG_SET_OP(signotset, _sig_not)
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/signal.h:173:27: note: expanded from macro '_SIG_SET_OP'
     173 |         case 4: set->sig[3] = op(set->sig[3]);                          \
         |                                  ^        ~
   include/linux/signal.h:185:24: note: expanded from macro '_sig_not'
     185 | #define _sig_not(x)     (~(x))
         |                            ^
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
      24 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from drivers/gpio/gpio-74xx-mmio.c:12:
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
   include/linux/signal.h:186:1: warning: array index 3 is past the end of the array (that has type 'unsigned long[2]') [-Warray-bounds]
     186 | _SIG_SET_OP(signotset, _sig_not)
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/signal.h:173:10: note: expanded from macro '_SIG_SET_OP'
     173 |         case 4: set->sig[3] = op(set->sig[3]);                          \
         |                 ^        ~
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
      24 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from drivers/gpio/gpio-74xx-mmio.c:12:
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
   In file included from drivers/gpio/gpio-74xx-mmio.c:12:
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
   In file included from drivers/gpio/gpio-74xx-mmio.c:12:
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
   In file included from drivers/gpio/gpio-74xx-mmio.c:12:
   In file included from include/linux/module.h:19:
   In file included from include/linux/elf.h:6:
   In file included from arch/x86/include/asm/elf.h:8:
>> include/linux/page_size_compat.h:118:16: warning: division by zero is undefined [-Wdivision-by-zero]
     118 |                 flag_bits |= _calc_vm_trans(flags, __MAP_NO_COMPAT,  __VM_NO_COMPAT );
         |                              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/mman.h:136:21: note: expanded from macro '_calc_vm_trans'
     136 |    : ((x) & (bit1)) / ((bit1) / (bit2))))
         |                     ^ ~~~~~~~~~~~~~~~~~
   30 warnings and 1 error generated.


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
