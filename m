Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A32018AE2
	for <oe-kbuild-all@lists.linux.dev>; Thu, 27 Mar 2025 19:58:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743105526; cv=none; b=Iqh6bIW3LSXH3rbm+Y2ferdFtxXRW9MKIxb0JWFtzvWQxekaJRlFlRtVu38Nt2iGoolvbV5OB5hgF+Ed/gmlkUpbHJDRUQeiGMS4dqYT5pvwoA9vdV9UVeRFkjFuhZ88Dzfy1R+QCO0eODrRzZNtV8je6Xe10TvxdJds9SNMIuU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743105526; c=relaxed/simple;
	bh=6UKftQmYbBWcrXtJ2c/MWayiYQLyGUxzcIbjP53EcH8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=OcmULwvBtxI3pnl0XPGNZRwb19kwXtMlY60eFSi/svk21sB2OFMx9AsbyuvAVDTWfBAv5MqyZrIndaeLGQxkWWIL2BJEqxJF80IJG9Clb965rNh9xAgyQjWLixoQ4KbBo4LO6oWL7feQjOBqedru9yQqcT9ldkyY1p9tTh24rm0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ITI5TX+a; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ITI5TX+a"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743105524; x=1774641524;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6UKftQmYbBWcrXtJ2c/MWayiYQLyGUxzcIbjP53EcH8=;
  b=ITI5TX+anAlnq0PqEEIu3bpkYk2GxYI/pZv3Pw++15c0Q1Vv7e+QxuF0
   ixaLYhuXaVHYh5CQ9QFTht283bpKpZx/b9+7vdjz+PKRZOUhBikSVqTuY
   POT4jaqn0i7jcPQiYUS7E+beDN0JnaSp1HjwpILNhO9ncLgX9ClT1WFpT
   O7HS2O8h9gxW1LjGz53oerlntxu4xx1rZZqs31KhQN4srAF55rw28mXmm
   ZyJUtHnpwIT/TlZbZ52V9qSASEDltI9ZIbvoKJNKtgDVbaq+vzzDTIkO5
   wGu2ygz6fw16NeTeCIP+coY0HtAsBdCwmPjLgfrcM8RW/Nc5bD5+MCPNk
   A==;
X-CSE-ConnectionGUID: 66ym4E0rRWCQSFLTq56DrQ==
X-CSE-MsgGUID: zIHi2NgZQWWZhXWqSsp48A==
X-IronPort-AV: E=McAfee;i="6700,10204,11385"; a="43697626"
X-IronPort-AV: E=Sophos;i="6.14,281,1736841600"; 
   d="scan'208";a="43697626"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Mar 2025 12:58:40 -0700
X-CSE-ConnectionGUID: But1N440Qey8zEQ9jZUHug==
X-CSE-MsgGUID: 6UxwGUFwQAy+dTh0WdE2LA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,281,1736841600"; 
   d="scan'208";a="130346481"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by fmviesa004.fm.intel.com with ESMTP; 27 Mar 2025 12:58:39 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1txtN7-0006vt-0b;
	Thu, 27 Mar 2025 19:58:37 +0000
Date: Fri, 28 Mar 2025 03:58:17 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Jinjie Ruan <ruanjinjie@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 2063/2063] error: unknown target ABI 'ilp32'
Message-ID: <202503280313.olFyEFIT-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Andrew,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   b28aab59b06935f0d1c9bce8f013f25b4094764d
commit: f9b54a6714445cde83aeff0318cf767b3b81229d [2063/2063] arm64:ilp32: add ARM64_ILP32 to Kconfig
config: arm64-randconfig-r112-20250328 (https://download.01.org/0day-ci/archive/20250328/202503280313.olFyEFIT-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project c2692afc0a92cd5da140dfcdfff7818a5b8ce997)
reproduce: (https://download.01.org/0day-ci/archive/20250328/202503280313.olFyEFIT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503280313.olFyEFIT-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from arch/arm64/kernel/asm-offsets.c:12:
   In file included from include/linux/ftrace.h:13:
   In file included from include/linux/kallsyms.h:13:
   In file included from include/linux/mm.h:2168:
   include/linux/vmstat.h:508:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     508 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     509 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:515:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     515 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     516 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:527:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     527 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     528 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   4 warnings generated.
   arch/arm64/kernel/vdso-ilp32/Makefile:84: FORCE prerequisite is missing
   arch/arm64/kernel/vdso-ilp32/Makefile:87: FORCE prerequisite is missing
   arch/arm64/kernel/vdso-ilp32/Makefile:90: FORCE prerequisite is missing
>> clang: warning: -Wl,-soname=linux-ilp32-vdso.so.1: 'linker' input unused [-Wunused-command-line-argument]
>> error: unknown target ABI 'ilp32'
>> error: unknown target ABI 'ilp32'
   make[3]: *** [scripts/Makefile.build:373: arch/arm64/kernel/vdso-ilp32/vdso-ilp32.lds] Error 1
   make[3]: *** [arch/arm64/kernel/vdso-ilp32/Makefile:84: arch/arm64/kernel/vdso-ilp32/vgettimeofday-ilp32.o] Error 1
>> error: error: unknown target ABI 'ilp32'
   unknown target ABI 'ilp32'
   make[3]: *** [arch/arm64/kernel/vdso-ilp32/Makefile:87: arch/arm64/kernel/vdso-ilp32/note-ilp32.o] Error 1
   make[3]: *** [arch/arm64/kernel/vdso-ilp32/Makefile:90: arch/arm64/kernel/vdso-ilp32/sigreturn-ilp32.o] Error 1
   make[3]: Target 'include/generated/vdso-ilp32-offsets.h' not remade because of errors.
   make[2]: *** [arch/arm64/Makefile:201: vdso_prepare] Error 2
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:234: __sub-make] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:234: __sub-make] Error 2
   make: Target 'prepare' not remade because of errors.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
