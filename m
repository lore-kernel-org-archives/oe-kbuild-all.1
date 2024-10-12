Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 131DF1474B2
	for <oe-kbuild-all@lists.linux.dev>; Sat, 12 Oct 2024 11:57:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728734228; cv=none; b=PPaf0hoET8mu8/pxFdvZAh8vbkAiKgKTzMzxpUtZvXMvLDXJJnyIwLXIl63Bbm8n6NwjTJMQX8BwG3wLwzM8pTuHbkLzceICpxn5WGYR0nLhQFANN5mtwjuo8e96eOAqeshT+dEZMFZQvLGPwYfh3vnllVKFUNvXvoJNyxu/n8E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728734228; c=relaxed/simple;
	bh=yJsf784nst594VQSIhxafcd+jZXmLso22ue3gxNvPu8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=WfTDY0RwbSNxUCAMGmw9PzTrqrPySQiLEkZDpYslVDovgfWS6pezZtjOqJ1Y/Q49gT5SU4qfgUcMW6MDgF/dlhfGAvat51KWBjaHerGG67bRurNCkWHxzvRl3mcs4puin05Xisf77e767wDqIM1MB2JXMifvOFzr44eXgi+VeXo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QhMxwSta; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QhMxwSta"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728734226; x=1760270226;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=yJsf784nst594VQSIhxafcd+jZXmLso22ue3gxNvPu8=;
  b=QhMxwSta9ivWbbED7KmNKmbSK4H/NRVxN1swR2QK9V17T+r+s7fonSvH
   7xa10WqSl4hooW15O+GnEzIRN7bo6bPyuWVXySF8NwAzs8OKf2kRxc+7C
   LI7PdI90JJ1NFaImtwQd5lqcFoCnut7VfEAy+SCerKOU8ehFfgq/OOJZ7
   sCQL/bucawaDeIvfUMJZZmQEOWKgdpbv+IrzwwIKC7YvtvoJ4uidjOTD0
   Jg/a8/gDcYPFDNPXzL+kXjhydItc6qWrDIWq6sKr4s454tnjqOzEevhhz
   UkJh8pli2pMAqw06c3+5dgfGRoO2kSt7ZRfiWIMVKLTQBMKYr5i1dD4kq
   A==;
X-CSE-ConnectionGUID: 52Tez04iSJGGV1A0DyxAEA==
X-CSE-MsgGUID: QpO5O1TnRqm4QqZY4ti0xg==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="32043987"
X-IronPort-AV: E=Sophos;i="6.11,198,1725346800"; 
   d="scan'208";a="32043987"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Oct 2024 04:57:03 -0700
X-CSE-ConnectionGUID: VtSzSG+wS3aVX6Q3icxSNw==
X-CSE-MsgGUID: 9uEqVhccQx6ruudsCG1xqA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,198,1725346800"; 
   d="scan'208";a="100464172"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 12 Oct 2024 04:57:02 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1szak0-000DKR-0Q;
	Sat, 12 Oct 2024 11:57:00 +0000
Date: Sat, 12 Oct 2024 19:56:30 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <thomas.weissschuh@linutronix.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [thomas-weissschuh:vdso/store 39/75] ld.lld: error: relocation
 R_PPC_ADDR16_HA cannot be used against symbol '_timens_data'; recompile with
 -fPIC
Message-ID: <202410121916.bQOH3Iza-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/thomas.weissschuh/linux.git vdso/store
head:   79c4677efae9ab2e20e0ff126c6528160f57b5eb
commit: 9570200cf467f36d45b9b6ffb51aa988d9e5f163 [39/75] powerpc/vdso: Switch to generic storage implementation
config: powerpc-allyesconfig (https://download.01.org/0day-ci/archive/20241012/202410121916.bQOH3Iza-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 70e0a7e7e6a8541bcc46908c592eed561850e416)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241012/202410121916.bQOH3Iza-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410121916.bQOH3Iza-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/powerpc/kernel/asm-offsets.c:19:
   In file included from include/linux/mman.h:5:
   In file included from include/linux/mm.h:2213:
   include/linux/vmstat.h:504:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
   504 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
   |                            ~~~~~~~~~~~~~~~~~~~~~ ^
   505 |                            item];
   |                            ~~~~
   include/linux/vmstat.h:511:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
   511 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
   |                            ~~~~~~~~~~~~~~~~~~~~~ ^
   512 |                            NR_VM_NUMA_EVENT_ITEMS +
   |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:518:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
   518 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
   |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:524:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
   524 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
   |                            ~~~~~~~~~~~~~~~~~~~~~ ^
   525 |                            NR_VM_NUMA_EVENT_ITEMS +
   |                            ~~~~~~~~~~~~~~~~~~~~~~
   4 warnings generated.
>> ld.lld: error: relocation R_PPC_ADDR16_HA cannot be used against symbol '_timens_data'; recompile with -fPIC
   >>> defined in arch/powerpc/kernel/vdso/vdso32.lds:536
   >>> referenced by vgettimeofday.c
   >>>               arch/powerpc/kernel/vdso/vgettimeofday-32.o:(__c_kernel_clock_gettime)
--
>> ld.lld: error: relocation R_PPC_ADDR16_LO cannot be used against symbol '_timens_data'; recompile with -fPIC
   >>> defined in arch/powerpc/kernel/vdso/vdso32.lds:536
   >>> referenced by vgettimeofday.c
   >>>               arch/powerpc/kernel/vdso/vgettimeofday-32.o:(__c_kernel_clock_gettime)
--
>> ld.lld: error: relocation R_PPC_ADDR16_HA cannot be used against symbol '_timens_data'; recompile with -fPIC
   >>> defined in arch/powerpc/kernel/vdso/vdso32.lds:536
   >>> referenced by vgettimeofday.c
   >>>               arch/powerpc/kernel/vdso/vgettimeofday-32.o:(__c_kernel_gettimeofday)
--
>> ld.lld: error: relocation R_PPC_ADDR16_LO cannot be used against symbol '_timens_data'; recompile with -fPIC
   >>> defined in arch/powerpc/kernel/vdso/vdso32.lds:536
   >>> referenced by vgettimeofday.c
   >>>               arch/powerpc/kernel/vdso/vgettimeofday-32.o:(__c_kernel_gettimeofday)
--
>> ld.lld: error: relocation R_PPC_ADDR16_HA cannot be used against symbol '_timens_data'; recompile with -fPIC
   >>> defined in arch/powerpc/kernel/vdso/vdso32.lds:536
   >>> referenced by vgettimeofday.c
   >>>               arch/powerpc/kernel/vdso/vgettimeofday-32.o:(__c_kernel_clock_gettime)
--
>> ld.lld: error: relocation R_PPC_ADDR16_HA cannot be used against symbol '_timens_data'; recompile with -fPIC
   >>> defined in arch/powerpc/kernel/vdso/vdso32.lds:536
   >>> referenced by vgettimeofday.c
   >>>               arch/powerpc/kernel/vdso/vgettimeofday-32.o:(__c_kernel_clock_gettime64)
--
>> ld.lld: error: relocation R_PPC_ADDR16_LO cannot be used against symbol '_timens_data'; recompile with -fPIC
   >>> defined in arch/powerpc/kernel/vdso/vdso32.lds:536
   >>> referenced by vgettimeofday.c
   >>>               arch/powerpc/kernel/vdso/vgettimeofday-32.o:(__c_kernel_clock_gettime64)
--
>> ld.lld: error: relocation R_PPC_ADDR16_HA cannot be used against symbol '_timens_data'; recompile with -fPIC
   >>> defined in arch/powerpc/kernel/vdso/vdso32.lds:536
   >>> referenced by vgettimeofday.c
   >>>               arch/powerpc/kernel/vdso/vgettimeofday-32.o:(__c_kernel_clock_getres)
--
>> ld.lld: error: relocation R_PPC_ADDR16_LO cannot be used against symbol '_timens_data'; recompile with -fPIC
   >>> defined in arch/powerpc/kernel/vdso/vdso32.lds:536
   >>> referenced by vgettimeofday.c
   >>>               arch/powerpc/kernel/vdso/vgettimeofday-32.o:(__c_kernel_clock_getres)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
