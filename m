Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6935C1DE2A7
	for <oe-kbuild-all@lists.linux.dev>; Mon,  2 Dec 2024 19:24:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733167445; cv=none; b=qPLeJjtSROzBLqNBGZeAgYvHpHSOXq9lB8oqBkFrXi1oAl1fjIy2iVqE6+rbnSNScCol9ASjC5WTHDyrzfiJf4j5slDEY/BZxJYsnWvPb8WTvQGxmcCIOME8dPRx5s0VpBtENuLGxuSE+OkawenGwwloAoI82rrYVb4cmDjUtjQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733167445; c=relaxed/simple;
	bh=uEwgqPSBstWCg/ju47WqnIQEWPog9iRiE8WszpqSgcM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ijaLyljWuRbZMwFQHHS3p6tdTPOUgSYWqLpWj9WIvYHF1256yUiMG+LmxI8YAHNUnUnoQQdZi4zsJfXJUI/ECFTYPU3Vhk/H6jvR0zxH1ZIlcnitZqrvhSsHLuurHNHGzjuhnpdhkjc2B5NVI+DqRKotAOIRoWEy1bI8/MCupZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bLzupcp9; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bLzupcp9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733167444; x=1764703444;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=uEwgqPSBstWCg/ju47WqnIQEWPog9iRiE8WszpqSgcM=;
  b=bLzupcp9/JRQrQbRtXi+2m3eN+dGX8I4q/HH4Eo7d5l/vdS1d/vZ9Km5
   +CB/B9QqcQl2hVqn965VyVjjkl2YX0ggN4IbABz2U5RtbM4+I0yxfEkJo
   LMVUo1Ek14nDLNu9atN++XyNZD5M3I5dkZuwulFoiBdCF6hCwrA24mDAa
   5GafxQX4Xd89OywrctDXz3MaHeGmRNCM8raDKP+TyGwGlka7E6w8zqfyo
   HsB4MWwIdQovrlcABT5h24KJ4viNQBrvXrGCGkT2tnSLX84yBUMwBUVpI
   uxGLX3fCpQmKg3WtpmKEVumVfnq/FVeTI91MSqEUaEZm4EHN8o4oWhgjd
   g==;
X-CSE-ConnectionGUID: +T0WGh7mRxy1MOQGoTxi1A==
X-CSE-MsgGUID: mRADM/awQZCChO235zdZ/g==
X-IronPort-AV: E=McAfee;i="6700,10204,11274"; a="20943689"
X-IronPort-AV: E=Sophos;i="6.12,203,1728975600"; 
   d="scan'208";a="20943689"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Dec 2024 11:24:03 -0800
X-CSE-ConnectionGUID: oVJrLOM0Tx2KdUTrT2cQsw==
X-CSE-MsgGUID: hNoy/kpPSWy989kO52hufg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,203,1728975600"; 
   d="scan'208";a="97274378"
Received: from lkp-server02.sh.intel.com (HELO 36a1563c48ff) ([10.239.97.151])
  by fmviesa003.fm.intel.com with ESMTP; 02 Dec 2024 11:24:02 -0800
Received: from kbuild by 36a1563c48ff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tIC1X-0002oR-1s;
	Mon, 02 Dec 2024 19:23:59 +0000
Date: Tue, 3 Dec 2024 03:21:38 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas =?unknown-8bit?Q?Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [thomas-weissschuh:vdso/store 12/51] <unknown>:0: error: expected
 relocatable expression
Message-ID: <202412030335.lC2gD6h6-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/thomas.weissschuh/linux.git vdso/store
head:   a95e7753c5ad15dc4eb14aa2316b3cbb1d6d0207
commit: cf12edf49ddeec322f85c02db634a59671b6a661 [12/51] powerpc/vdso: Switch to generic storage implementation
config: powerpc-allyesconfig (https://download.01.org/0day-ci/archive/20241203/202412030335.lC2gD6h6-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 592c0fe55f6d9a811028b5f3507be91458ab2713)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241203/202412030335.lC2gD6h6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412030335.lC2gD6h6-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/powerpc/kernel/asm-offsets.c:19:
   In file included from include/linux/mman.h:6:
   In file included from include/linux/mm.h:2223:
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
>> <unknown>:0: error: expected relocatable expression
>> <unknown>:0: error: expected relocatable expression
   make[3]: *** [arch/powerpc/kernel/vdso/Makefile:85: arch/powerpc/kernel/vdso/cacheflush-32.o] Error 1
   make[3]: Target 'include/generated/vdso32-offsets.h' not remade because of errors.
   make[2]: *** [arch/powerpc/Makefile:388: vdso_prepare] Error 2
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:251: __sub-make] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:251: __sub-make] Error 2
   make: Target 'prepare' not remade because of errors.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
