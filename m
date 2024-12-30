Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4C8418C31
	for <oe-kbuild-all@lists.linux.dev>; Mon, 30 Dec 2024 16:46:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735577178; cv=none; b=eQh4fOzUJuIApu9AbMK3UkTo+k/ab04+HJbaOmwf8cfWSxG2OXJFl3rv95+/rnAoN+1ZPSSkaMLDZp5XbJyQtb9UOvwXvrBHV2mdUOASOCuEsK0YgsYgNhrlZIapA4+4z7Oqig18XJyK5cBU0RlzPBdSKaLP6koAQ0/kUmcVpcU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735577178; c=relaxed/simple;
	bh=awqxSqMCdUML6EbnG0rMG2KU+j5RZV7gmP6e/irmsZc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=P9lriKzRcjzxjiEdtDhXnven+1E+hOQyPwPlHZbGBGE6f4ZazK7rBDChqkIqj5556C3FMm6CjcOcIJG1+2ZAOoH+eL2L80nDH8lEAP725O+4zLr17XwRxqWBms1x0PZOoElXVN2a50H2sZ4AGRckGMm4YQQ9i9wVcWPFO62sKvM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QUco8Qi8; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QUco8Qi8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735577176; x=1767113176;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=awqxSqMCdUML6EbnG0rMG2KU+j5RZV7gmP6e/irmsZc=;
  b=QUco8Qi800x3z+LnCRcm+DGrpFQVdJlZvjtnLHtOGFqupqfHsedKr6eh
   TZMGBw0+Rt1Ejk/QlMvnpr3VbeZYA5ej2GhVuCfLKuB+4fdk9eFhS6PXk
   tZ1f68gjpXNUOXrAGGe7UMDeoBsX+F5RVK0WOlhJbypGLYQh7GIGE9vOM
   hhK5L33MhIp030OM5V88BkK/n3lpyPGIVibv1fhgf4+MLimuoxV0Qo5yv
   QK8l5k6ytGP1gSh/mQo95Mqho9iR2t8k3xMz8hjW815DdpYdLtemooy5r
   4IIMlux+A24eXRACChaOpfaL7/03al6sPf4qlmAXGME/P0+9xujLy6Ei7
   w==;
X-CSE-ConnectionGUID: Yhg0mws0RG22z+Tq0ohdQA==
X-CSE-MsgGUID: 1KVnA9KdSGiuLAoOSIiMyA==
X-IronPort-AV: E=McAfee;i="6700,10204,11301"; a="53267111"
X-IronPort-AV: E=Sophos;i="6.12,276,1728975600"; 
   d="scan'208";a="53267111"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Dec 2024 08:46:16 -0800
X-CSE-ConnectionGUID: 7ptvfk/rT3WbsJsqYjkL9Q==
X-CSE-MsgGUID: 7dUD286aRkizAUj3n9esaw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,276,1728975600"; 
   d="scan'208";a="101245631"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 30 Dec 2024 08:46:15 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tSIuD-0006D0-07;
	Mon, 30 Dec 2024 16:46:13 +0000
Date: Tue, 31 Dec 2024 00:45:20 +0800
From: kernel test robot <lkp@intel.com>
To: steven@liquorix.net
Cc: oe-kbuild-all@lists.linux.dev
Subject: [zen:6.12/invlpgb 5/12] arch/x86/include/asm/invlpgb.h:23:34: error:
 invalid input size for constraint 'a'
Message-ID: <202412310013.lmpVMIUx-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/zen-kernel/zen-kernel 6.12/invlpgb
head:   6960238e894267da7a06ad453cebe17c2cf72f4a
commit: 39c0b57c90b5e9281dff6c35bd32d9695f328b17 [5/12] x86/mm: add INVLPGB support code
config: i386-buildonly-randconfig-003-20241230 (https://download.01.org/0day-ci/archive/20241231/202412310013.lmpVMIUx-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241231/202412310013.lmpVMIUx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412310013.lmpVMIUx-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/x86/kernel/asm-offsets.c:14:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:17:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:9:
   In file included from include/linux/sched/task.h:13:
   In file included from include/linux/uaccess.h:12:
   In file included from arch/x86/include/asm/uaccess.h:17:
   In file included from arch/x86/include/asm/tlbflush.h:13:
>> arch/x86/include/asm/invlpgb.h:23:34: error: invalid input size for constraint 'a'
      23 |         asm volatile("invlpgb" : : "a" (rax), "c" (ecx), "d" (edx));
         |                                         ^
   In file included from arch/x86/kernel/asm-offsets.c:14:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:21:
   In file included from include/linux/mm.h:2213:
   include/linux/vmstat.h:518:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     518 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   1 warning and 1 error generated.
   make[3]: *** [scripts/Makefile.build:102: arch/x86/kernel/asm-offsets.s] Error 1 shuffle=3619501446
   make[3]: Target 'prepare' not remade because of errors.
   make[2]: *** [Makefile:1203: prepare0] Error 2 shuffle=3619501446
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:224: __sub-make] Error 2 shuffle=3619501446
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:224: __sub-make] Error 2 shuffle=3619501446
   make: Target 'prepare' not remade because of errors.


vim +/a +23 arch/x86/include/asm/invlpgb.h

     6	
     7	/*
     8	 * INVLPGB does broadcast TLB invalidation across all the CPUs in the system.
     9	 *
    10	 * The INVLPGB instruction is weakly ordered, and a batch of invalidations can
    11	 * be done in a parallel fashion.
    12	 *
    13	 * TLBSYNC is used to ensure that pending INVLPGB invalidations initiated from
    14	 * this CPU have completed.
    15	 */
    16	static inline void __invlpgb(unsigned long asid, unsigned long pcid, unsigned long addr,
    17				    int extra_count, bool pmd_stride, unsigned long flags)
    18	{
    19		u64 rax = addr | flags;
    20		u32 ecx = (pmd_stride << 31) | extra_count;
    21		u32 edx = (pcid << 16) | asid;
    22	
  > 23		asm volatile("invlpgb" : : "a" (rax), "c" (ecx), "d" (edx));
    24	}
    25	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
