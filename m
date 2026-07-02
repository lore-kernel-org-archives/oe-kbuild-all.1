Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B07431A6835
	for <oe-kbuild-all@lists.linux.dev>; Thu,  2 Jul 2026 03:44:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782963857; cv=none; b=CWSm5ZK5l0b51Vr8iRmTQO5ArND5v58K/1cMwZ+RX2i8wwGly6kDa9S53k0y3K8yYG681b03m3cxJ3288OuI5wODRqLVPVmRvmP5uxfY40LSuNLZ+tGMQ6poaO2ATSJJ/0DJkLB7bjtJDr3juti+n0HfrLTQxkfbLmMoItpFKBk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782963857; c=relaxed/simple;
	bh=7np6p9YHywy2QSII4GqmtLoGaZ+XgbMBNnmckMOYHZg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=pON05a0Z6uE8vQbArMFmBIZNFkO5lEc7KVviMvBzEkkeffSu/WfSHVhVuNN6+TggBx3P2IJpKYvkieM+jGOX4Q/XI7StdbqzUWVGw192UlCUHdMIlSB6DlQcvaJse72Me7zJ3eW8UFBup+cZs8t+KcK4kcQbeaxx13zLWSjcIck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=d/Xi6EsG; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="d/Xi6EsG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782963856; x=1814499856;
  h=date:from:to:cc:subject:message-id;
  bh=7np6p9YHywy2QSII4GqmtLoGaZ+XgbMBNnmckMOYHZg=;
  b=d/Xi6EsGLTjFGt253VzpsWkYzalhDTFUcxf5WoTiabWS09YSw5mXTRR/
   1e2ekmtEXK4TYBTV2m1jeZfjp0UfFh7Fp3qXALbO19kDExi+SNsA/2XnC
   5M/BdDMM4aaoNHi0h3M5qGKQRT/TG7FTuaKhfY+yJXTQIVL2Ruahjr2pR
   oiqQJyNfgeCVOBd/lCjJlqVNpr7ze5JO3ln3N+YEWszVZj/cG7EFx+deB
   id2WFtxyp6gwQ4N6CilGXnnXNgLg5fLZ7/BijxDcLY2S10/W5KkRW8a6j
   L1WMWszdjAg1uINwveBxLHdrA6EEDOfP1yYNgOAA/3OaNKsvcLe94h0Ku
   w==;
X-CSE-ConnectionGUID: xWDh7I35Snu+X2Q//SrAtA==
X-CSE-MsgGUID: U1+Y4/DRSJimcgg79d8+Wg==
X-IronPort-AV: E=McAfee;i="6800,10657,11834"; a="83696518"
X-IronPort-AV: E=Sophos;i="6.25,143,1779174000"; 
   d="scan'208";a="83696518"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jul 2026 20:44:14 -0700
X-CSE-ConnectionGUID: Ihd2RyghQ/aN9C1aZWctlw==
X-CSE-MsgGUID: YnTPaEv0RqO1kpYb3VpnrQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,143,1779174000"; 
   d="scan'208";a="251696604"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa010.jf.intel.com with ESMTP; 01 Jul 2026 20:44:12 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wf8LR-000000009x7-2bnF;
	Thu, 02 Jul 2026 03:44:09 +0000
Date: Thu, 02 Jul 2026 11:43:37 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6-2026-07 1/1] mm/memory.c:95:2:
 warning: Unfortunate NUMA and NUMA Balancing config, growing page-frame for
 last_cpupid.
Message-ID: <202607021146.c2GuuGHT-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Xiaofeng,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android15-6.6-2026-07
head:   5556e039c32fa02b239611dc8e5ebb958a7f12e1
commit: 2729133c1b5b2ed86b546b4c096ba101ec9141db [1/1] ANDROID: GKI: Add pageflags for OEM
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20260702/202607021146.c2GuuGHT-lkp@intel.com/config)
compiler: clang version 22.1.3 (https://github.com/llvm/llvm-project e9846648fd6183ee6d8cbdb4502213fcf902a211)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260702/202607021146.c2GuuGHT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607021146.c2GuuGHT-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from mm/memory.c:43:
   In file included from include/linux/mm.h:2222:
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
   In file included from mm/memory.c:44:
   include/linux/mm_inline.h:46:41: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
      46 |         __mod_lruvec_state(lruvec, NR_LRU_BASE + lru, nr_pages);
         |                                    ~~~~~~~~~~~ ^ ~~~
   include/linux/mm_inline.h:48:22: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
      48 |                                 NR_ZONE_LRU_BASE + lru, nr_pages);
         |                                 ~~~~~~~~~~~~~~~~ ^ ~~~
>> mm/memory.c:95:2: warning: Unfortunate NUMA and NUMA Balancing config, growing page-frame for last_cpupid. [-W#warnings]
      95 | #warning Unfortunate NUMA and NUMA Balancing config, growing page-frame for last_cpupid.
         |  ^
   8 warnings generated.


vim +95 mm/memory.c

42b7772812d15b Jan Beulich    2008-07-23  93  
af27d9403f5b80 Arnd Bergmann  2018-02-16  94  #if defined(LAST_CPUPID_NOT_IN_PAGE_FLAGS) && !defined(CONFIG_COMPILE_TEST)
90572890d20252 Peter Zijlstra 2013-10-07 @95  #warning Unfortunate NUMA and NUMA Balancing config, growing page-frame for last_cpupid.
75980e97daccfc Peter Zijlstra 2013-02-22  96  #endif
75980e97daccfc Peter Zijlstra 2013-02-22  97  

:::::: The code at line 95 was first introduced by commit
:::::: 90572890d202527c366aa9489b32404e88a7c020 mm: numa: Change page last {nid,pid} into {cpu,pid}

:::::: TO: Peter Zijlstra <peterz@infradead.org>
:::::: CC: Ingo Molnar <mingo@kernel.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
