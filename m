Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B31CF19B3EE
	for <oe-kbuild-all@lists.linux.dev>; Mon,  9 Dec 2024 23:42:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733787722; cv=none; b=s94itTGlPXK0FYuA4jkB6WTc+5KQY+ujqisR4GEQNqJRj0v8anOvLPT9EkxLCWxylgZ5mRM6oHrP42jsX8QhkWheKuPapUjpDYjqoljZx5kSvr9K8KUbffNmh1nDXKkmbZGsF8Ftox9M71xMpM7dpIgM1uztb6H/Jyn7N2S8cVc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733787722; c=relaxed/simple;
	bh=8HczzigI34Omk2GpKqfD30P6+GdiqA82IWpQBcaOTCs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=BeZuvonRx+5YUtP3xPNysoWya6Pjftec26ho5L/2kItmP1G+E2AHppNrDm6/7njH7BtSSLpIZzDwXhoD4yuisYE2os6m2u/FNS0QT89GGAKB4rYYvU7S8FhCgQY41oJlqodSpKD7fIRiyLMi3J+JX0Rrir6eznC9dr0/RWGqWTw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CQ/lIbjj; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CQ/lIbjj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733787721; x=1765323721;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=8HczzigI34Omk2GpKqfD30P6+GdiqA82IWpQBcaOTCs=;
  b=CQ/lIbjj17FL2LeHQXDCCgPyi9gdVQjoiVceSA8tdT0eTPsRio4x3wtt
   YZUFlEHNCkEotuiFSLUi9DdPiudL4Y09OTnRUn5nHDUPgw8mPC5Ot5iLi
   C1YGeW3lpcjBuMvvogeeyvIZvBWGH09MsoQ+x4XFb5XoSLXXJCWNdgnwT
   igPgbPvoVjoiYz+WoPfGB4ASB47C/cDjwhk7UlJe4jGON4tvwq8or6xAO
   sQ9ftM9CQd24QUwyQOo/u22JhyKgFozcxiUD859xzA5G/pqVxboW/35dg
   lM5XM6ujnO4sNIosi0d32swuUUhn+p/DiEnoD/BeO/o19z/EIwRImtCtw
   Q==;
X-CSE-ConnectionGUID: jjZgQE1/SxignNJQgiMCeA==
X-CSE-MsgGUID: IclnOv8KTwemNtWOimISxQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11281"; a="34245099"
X-IronPort-AV: E=Sophos;i="6.12,220,1728975600"; 
   d="scan'208";a="34245099"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Dec 2024 15:42:01 -0800
X-CSE-ConnectionGUID: XZNXikM5Sayp0p0b29Gm/w==
X-CSE-MsgGUID: MZkW17vmS2qt4s6ol7QQ9w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,220,1728975600"; 
   d="scan'208";a="126049232"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 09 Dec 2024 15:41:59 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tKnO1-0004vf-03;
	Mon, 09 Dec 2024 23:41:57 +0000
Date: Tue, 10 Dec 2024 07:41:37 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Jinjie Ruan <ruanjinjie@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 1613/1613] arch/arm64/kernel/cpufeature.c:2387:6:
 warning: no previous prototype for function 'fast_syscall_enabled'
Message-ID: <202412100701.gJFnUZcV-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   db988390007bce595dba0dfd782c610578e26d2d
commit: 5c3cf22892983304b18d87296ed96ff0ab7d6c95 [1613/1613] arm64: Introduce xcall a faster svc exception handling
config: arm64-randconfig-001-20241210 (https://download.01.org/0day-ci/archive/20241210/202412100701.gJFnUZcV-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 592c0fe55f6d9a811028b5f3507be91458ab2713)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241210/202412100701.gJFnUZcV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412100701.gJFnUZcV-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from arch/arm64/kernel/cpufeature.c:67:
   In file included from include/linux/crash_dump.h:5:
   In file included from include/linux/kexec.h:18:
   In file included from include/linux/crash_core.h:6:
   In file included from include/linux/elfcore.h:11:
   In file included from include/linux/ptrace.h:10:
   In file included from include/linux/pid_namespace.h:7:
   In file included from include/linux/mm.h:2247:
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
   include/linux/vmstat.h:536:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     536 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     537 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
>> arch/arm64/kernel/cpufeature.c:2387:6: warning: no previous prototype for function 'fast_syscall_enabled' [-Wmissing-prototypes]
    2387 | bool fast_syscall_enabled(void)
         |      ^
   arch/arm64/kernel/cpufeature.c:2387:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    2387 | bool fast_syscall_enabled(void)
         | ^
         | static 
   6 warnings generated.


vim +/fast_syscall_enabled +2387 arch/arm64/kernel/cpufeature.c

  2386	
> 2387	bool fast_syscall_enabled(void)
  2388	{
  2389		return is_xcall_support;
  2390	}
  2391	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
