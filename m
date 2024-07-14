Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B4031FDD
	for <oe-kbuild-all@lists.linux.dev>; Sun, 14 Jul 2024 19:58:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720987109; cv=none; b=OOuBBVT0HgYDhusVMyD1Xh1Lh305lH/he74u1U/PKnWKXmCfRBRMMmXDohldIg39hjBonhGI4k5sObwpJZ7Wbz3hf31QE+05RZklWR/MCD1pP9CK8x3XuDSHn3C4SicAk8mMCH36MBf9X23SNin9bBtovj4Lp6Wm5sXKi+Tn4kA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720987109; c=relaxed/simple;
	bh=8e4u1L2a7+1AOqNogycBEk6BlHRAzpPj/m5nI0wNfFM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=cugE0ILnlsLvc1sywj3EZOH32UZZ4Bk2b0ixkpaajZ0fODcTMefDWt3Z9OQB5z1c5y/jF5prFSUSmZVnh5I7Tg8368MJ/SaVEiFboLlfPBsVWpAWw78VgTKtQmF1RVE9nXbVe0/GqI7pIuI3UwNC+XCfgtqUxzfXcPUJXKLeRlI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LCmcrl9J; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LCmcrl9J"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720987107; x=1752523107;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=8e4u1L2a7+1AOqNogycBEk6BlHRAzpPj/m5nI0wNfFM=;
  b=LCmcrl9J70ZxxEiuemf5VXTWQGapgLiIPGD5Wmbb1hS8sgEqGUoaWkCO
   pAk2DbZPZBvtrIkZ/ZE4hIKHOCQ5Gv0SyOxvKAx00nMJiiVH/MKD5PeYH
   YUeSdOFOd0ckpqIlWnhrHWSyGXsUvaf9rH0GFJgo/Ab0QmacZW6OX2j3R
   /6Ll8WiRpPVaxIh43KRQRDWaJ3x2cGDkss9P17GK5G+EIrEpQfTC3d9Ww
   8nEkh65LQ6/UtNNQZrJzvXxjynejg2swmMVvxUZ+4VMOZRTwRiFfM61ZN
   5R8TEwoamJY7unsnQFPIZQLClDGqv1AEry5Z71sKYhRXdNq04p4T+ZsqB
   w==;
X-CSE-ConnectionGUID: vexbtZIMRwW8l95V0E54pQ==
X-CSE-MsgGUID: /ZEIev3bR46n1dpDhzF0DQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11133"; a="22229707"
X-IronPort-AV: E=Sophos;i="6.09,208,1716274800"; 
   d="scan'208";a="22229707"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jul 2024 12:58:26 -0700
X-CSE-ConnectionGUID: RY4+5kwOScGhlV7+TD7baQ==
X-CSE-MsgGUID: 6HoTcsLvQ4en8lW5gu6mfA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,208,1716274800"; 
   d="scan'208";a="72637649"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 14 Jul 2024 12:58:26 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sT5MW-000dha-03;
	Sun, 14 Jul 2024 19:58:24 +0000
Date: Mon, 15 Jul 2024 03:58:05 +0800
From: kernel test robot <lkp@intel.com>
To: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, Mike Rapoport <rppt@kernel.org>
Subject: [rppt:numa/memblks/v0.1 17/17] include/linux/numa_memblks.h:49:42:
 warning: declaration of 'struct numa_meminfo' will not be visible outside of
 this function
Message-ID: <202407150303.HxzeAh5W-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/rppt/linux.git numa/memblks/v0.1
head:   1386d3ef0ea65efd26c4ad6b034910535f0a7f91
commit: 1386d3ef0ea65efd26c4ad6b034910535f0a7f91 [17/17] mm: make range-to-target_node lookup facility a part of numa_memblks
config: powerpc-allyesconfig (https://download.01.org/0day-ci/archive/20240715/202407150303.HxzeAh5W-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project a0c6b8aef853eedaa0980f07c0a502a5a8a9740e)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240715/202407150303.HxzeAh5W-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407150303.HxzeAh5W-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from mm/numa.c:3:
   In file included from include/linux/memblock.h:12:
   In file included from include/linux/mm.h:2258:
   include/linux/vmstat.h:500:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     500 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     501 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:507:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     507 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     508 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:514:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     514 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:519:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     519 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     520 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:528:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     528 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     529 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   In file included from mm/numa.c:6:
>> include/linux/numa_memblks.h:49:42: warning: declaration of 'struct numa_meminfo' will not be visible outside of this function [-Wvisibility]
      49 | static inline void numa_emulation(struct numa_meminfo *numa_meminfo,
         |                                          ^
   6 warnings generated.


vim +49 include/linux/numa_memblks.h

97c53b4731a18ba Mike Rapoport (Microsoft  2024-06-13  40) 
00ccaed699b5f8e Mike Rapoport (Microsoft  2024-07-11  41) #ifdef CONFIG_NUMA_EMU
00ccaed699b5f8e Mike Rapoport (Microsoft  2024-07-11  42) int numa_emu_cmdline(char *str);
00ccaed699b5f8e Mike Rapoport (Microsoft  2024-07-11  43) void __init numa_emu_update_cpu_to_node(int *emu_nid_to_phys,
00ccaed699b5f8e Mike Rapoport (Microsoft  2024-07-11  44) 					unsigned int nr_emu_nids);
00ccaed699b5f8e Mike Rapoport (Microsoft  2024-07-11  45) u64 __init numa_emu_dma_end(void);
00ccaed699b5f8e Mike Rapoport (Microsoft  2024-07-11  46) void __init numa_emulation(struct numa_meminfo *numa_meminfo,
00ccaed699b5f8e Mike Rapoport (Microsoft  2024-07-11  47) 			   int numa_dist_cnt);
00ccaed699b5f8e Mike Rapoport (Microsoft  2024-07-11  48) #else
00ccaed699b5f8e Mike Rapoport (Microsoft  2024-07-11 @49) static inline void numa_emulation(struct numa_meminfo *numa_meminfo,
00ccaed699b5f8e Mike Rapoport (Microsoft  2024-07-11  50) 				  int numa_dist_cnt)
00ccaed699b5f8e Mike Rapoport (Microsoft  2024-07-11  51) { }
00ccaed699b5f8e Mike Rapoport (Microsoft  2024-07-11  52) static inline int numa_emu_cmdline(char *str)
00ccaed699b5f8e Mike Rapoport (Microsoft  2024-07-11  53) {
00ccaed699b5f8e Mike Rapoport (Microsoft  2024-07-11  54) 	return -EINVAL;
00ccaed699b5f8e Mike Rapoport (Microsoft  2024-07-11  55) }
00ccaed699b5f8e Mike Rapoport (Microsoft  2024-07-11  56) #endif /* CONFIG_NUMA_EMU */
00ccaed699b5f8e Mike Rapoport (Microsoft  2024-07-11  57) 

:::::: The code at line 49 was first introduced by commit
:::::: 00ccaed699b5f8eaa463a7911e7cce631465f4da mm: introduce numa_emulationa

:::::: TO: Mike Rapoport (Microsoft) <rppt@kernel.org>
:::::: CC: Mike Rapoport (Microsoft) <rppt@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
