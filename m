Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89A381E4BE
	for <oe-kbuild-all@lists.linux.dev>; Sat,  9 Nov 2024 20:51:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731185462; cv=none; b=OxWJXXHfZDwQ8p+otIHvXqRVLa6KxyGuTdIhM4DRZZjDbszTGj89av1o5raR+v9rHZsUOL0DxfhNHlvmLAkfCktwWHccSJZvydXgEvmSO2t6C5ymaOMWfzuX1xlIGhJVKypeEF237s5GAigu1XW/pTxsI/qixEPax6F2jRVYn6I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731185462; c=relaxed/simple;
	bh=t7sfGMHxo9gP0a5B9kjaOjBkAGdVrutLhnGDc/20YPg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=s1sPzxVo1ITE2BJmC8hLiIpxgqZKj9TrBOXitq3Hh9q2T4vM2o9KIVcmbdzjStv3vnmg3lyI0d27Rj6yILwYZeCUy/ltRPzKSkqh7Q1sk96I2o9AIVNC/tCg7S99NS6ZP/2xhCLtm9p2h5Sr1bzGfm2gHkb7dFvQ1ciuR8IRGrk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dvdpn2Rf; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dvdpn2Rf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731185460; x=1762721460;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=t7sfGMHxo9gP0a5B9kjaOjBkAGdVrutLhnGDc/20YPg=;
  b=dvdpn2RfqeT/qP+hX3ilih/JA3PTNLur6nzvU+vgihWF/NRm+NnpwAT6
   NRe5UyYQ4u+lJQ0cHTnDdoco/8Wq4MGHvddrGQ8RjVt5m6lUXiTq6kuWR
   DYPmU+AldNx3d40i4xZXWA11YLh6E77VSD09eOurOYYpAubQ4YkHrxAzU
   MLwVwCz12/YsN2zCTrG/mv/kx7d0WLfjYkuljkPY4gksTK223PfOLe533
   1PWHhTwqUKKLA9LKSPV7KlT8SIw1zqa03Q51eTuOjVxbXm4gkLGCOdaAO
   jKpazdrYGwl83+C5N0Rqhu/+fmNUgaouK5Fh0jMghhD75P1ihU2udVZtl
   Q==;
X-CSE-ConnectionGUID: C32/p5LBSOGIt0CRkk6kxA==
X-CSE-MsgGUID: z2exxVmCTRuO7G5dBPRegg==
X-IronPort-AV: E=McAfee;i="6700,10204,11251"; a="31264494"
X-IronPort-AV: E=Sophos;i="6.12,141,1728975600"; 
   d="scan'208";a="31264494"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2024 12:51:00 -0800
X-CSE-ConnectionGUID: zKzxZYGbRc2iNBjCeu9pFQ==
X-CSE-MsgGUID: vqnk0j3JQfCI+mecewaaTA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,141,1728975600"; 
   d="scan'208";a="86485220"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 09 Nov 2024 12:50:58 -0800
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t9sQ4-000scs-24;
	Sat, 09 Nov 2024 20:50:56 +0000
Date: Sun, 10 Nov 2024 04:50:50 +0800
From: kernel test robot <lkp@intel.com>
To: Christopher Taylor <ctaylor@tactcomplabs.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Dennis Dalessandro <dennis.dalessandro@cornelisnetworks.com>
Subject: [cornelisnetworks:pr/1 1/1] include/linux/highmem-internal.h:25:10:
 fatal error: 'asm/highmem.h' file not found
Message-ID: <202411100446.RbtlFRBR-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/cornelisnetworks/linux.git pr/1
head:   6f9ce1f156a4d597e2e447443a2655fb0b288337
commit: 6f9ce1f156a4d597e2e447443a2655fb0b288337 [1/1] initial import
config: riscv-allmodconfig (https://download.01.org/0day-ci/archive/20241110/202411100446.RbtlFRBR-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 592c0fe55f6d9a811028b5f3507be91458ab2713)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241110/202411100446.RbtlFRBR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411100446.RbtlFRBR-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/riscv/kernel/asm-offsets.c:10:
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
   In file included from arch/riscv/kernel/asm-offsets.c:13:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:23:
   In file included from include/linux/writeback.h:13:
   In file included from include/linux/blk_types.h:10:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:14:
>> include/linux/highmem-internal.h:25:10: fatal error: 'asm/highmem.h' file not found
      25 | #include <asm/highmem.h>
         |          ^~~~~~~~~~~~~~~
   4 warnings and 1 error generated.
   make[3]: *** [scripts/Makefile.build:102: arch/riscv/kernel/asm-offsets.s] Error 1
   make[3]: Target 'prepare' not remade because of errors.
   make[2]: *** [Makefile:1203: prepare0] Error 2
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:224: __sub-make] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:224: __sub-make] Error 2
   make: Target 'prepare' not remade because of errors.


vim +25 include/linux/highmem-internal.h

13f876ba77ebd5 Thomas Gleixner 2020-11-03  23  
13f876ba77ebd5 Thomas Gleixner 2020-11-03  24  #ifdef CONFIG_HIGHMEM
13f876ba77ebd5 Thomas Gleixner 2020-11-03 @25  #include <asm/highmem.h>
13f876ba77ebd5 Thomas Gleixner 2020-11-03  26  

:::::: The code at line 25 was first introduced by commit
:::::: 13f876ba77ebd5125799bb042201f22cf73df154 highmem: High implementation details and document API

:::::: TO: Thomas Gleixner <tglx@linutronix.de>
:::::: CC: Thomas Gleixner <tglx@linutronix.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
