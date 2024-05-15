Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 775BF433BC
	for <oe-kbuild-all@lists.linux.dev>; Wed, 15 May 2024 18:18:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715797141; cv=none; b=EuLyCAFUmBBvng/J7CaleiC7IbPfBHnvNzF8bMcz37KBYkkcRBskpWbNE8VebfjjQCFh8/GOLYit7p6PM4c+canFJBZHWzIRd7KRbmbodqL000aK2kgHHiFxSROqaiECIYEC1caiNFMAZnXzpVKqiBvi1VlQYVF1F7oigTEdtZM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715797141; c=relaxed/simple;
	bh=Ftt1OjoeRTgDKY94jevRs51f2FL4h9Kh8jiEHUejt2o=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=dWHLOLqXSmRU2U/nbbnzCwntJTsysmMq/QN8HMENpaYjJ0D17vWvkSrsy7mlp2zRZvnyzifS7hYeO6pR1VoXsaq+J+4/ckrOsNxHmBWrGk82tCehBRabh6S0n5CpGi4e5dr41zcn7ca9Zilu3TAaR/AwIsnvgwFLEVRDYHF/0oQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lJ0hfuGz; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lJ0hfuGz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715797139; x=1747333139;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Ftt1OjoeRTgDKY94jevRs51f2FL4h9Kh8jiEHUejt2o=;
  b=lJ0hfuGzm1KOlcfZ7MBTCiOv09zOzqM2vvRDNCD8MJ7Wg4MmuQK6H+Fc
   wlRM2NoafdhF14Gc6HUm8OeWWrNP/fYl1K94f4NxvidwM7PGs56mYBebQ
   Woddij4n7mKWvTt9DvE9J+WbyqGlsbXt8fw5sR/43cSzxOjroyHk7aeV2
   fv1fdXmcdqeJFjWl8zJYkWnHr7RtwXC38AwAdbka7o+Iop4q9k/4nBxrS
   3dxVXu1BF3OIw+jpDa4hEeXTicBb/lc/28Ozg2bf+5+uU2+YBPLra3jCW
   f/5voI93QUyOk6iXH7Z18ewP55ChEzKWJq+3Ud1u/EljAxrtBX679sGy9
   A==;
X-CSE-ConnectionGUID: kS4gZP12QSip5uVQL0peKQ==
X-CSE-MsgGUID: EGz/kSEvSQur9YBuKz8kLQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11074"; a="11980485"
X-IronPort-AV: E=Sophos;i="6.08,162,1712646000"; 
   d="scan'208";a="11980485"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 May 2024 11:18:59 -0700
X-CSE-ConnectionGUID: hOgMG3DCRSqpBDX4qW2Ehg==
X-CSE-MsgGUID: YQjN/8cvTAKgbb+DsfL2mg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,162,1712646000"; 
   d="scan'208";a="35683963"
Received: from lkp-server01.sh.intel.com (HELO f8b243fe6e68) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 15 May 2024 11:18:58 -0700
Received: from kbuild by f8b243fe6e68 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s7JDL-000D8p-2w;
	Wed, 15 May 2024 18:18:55 +0000
Date: Thu, 16 May 2024 02:18:38 +0800
From: kernel test robot <lkp@intel.com>
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jic23-cxl-staging:arm-numa-fixes 10/11] arch/arm64/mm/init.c:54:12:
 warning: no previous prototype for 'numa_fill_memblks'
Message-ID: <202405160243.2ZnSE7fA-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jic23/cxl-staging.git arm-numa-fixes
head:   d077bf9570e8024f6d670d5662b62778715084fc
commit: f4ce7f00375d478828eebf7618d56dce35607227 [10/11] arm64: mm: numa_fill_memblks() to add a memblock.reserved region if match.
config: arm64-allnoconfig (https://download.01.org/0day-ci/archive/20240516/202405160243.2ZnSE7fA-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240516/202405160243.2ZnSE7fA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405160243.2ZnSE7fA-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/arm64/mm/init.c:54:12: warning: no previous prototype for 'numa_fill_memblks' [-Wmissing-prototypes]
      54 | int __init numa_fill_memblks(u64 start, u64 end)
         |            ^~~~~~~~~~~~~~~~~
   In file included from include/linux/page-flags-layout.h:30,
                    from include/linux/mmzone.h:20,
                    from include/linux/swap.h:7,
                    from arch/arm64/mm/init.c:12:
   arch/arm64/include/asm/sparsemem.h:32:36: error: redefinition of 'memory_add_physaddr_to_nid'
      32 | #define memory_add_physaddr_to_nid memory_add_physaddr_to_nid
         |                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/mm/init.c:89:5: note: in expansion of macro 'memory_add_physaddr_to_nid'
      89 | int memory_add_physaddr_to_nid(u64 start)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from include/linux/cpumask.h:17,
                    from arch/arm64/include/asm/cpufeature.h:27,
                    from arch/arm64/include/asm/ptrace.h:11,
                    from arch/arm64/include/asm/irqflags.h:10,
                    from include/linux/irqflags.h:18,
                    from include/linux/spinlock.h:59,
                    from include/linux/swap.h:5:
   include/linux/numa.h:47:19: note: previous definition of 'memory_add_physaddr_to_nid' with type 'int(u64)' {aka 'int(long long unsigned int)'}
      47 | static inline int memory_add_physaddr_to_nid(u64 start)
         |                   ^~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/include/asm/sparsemem.h:34:29: error: redefinition of 'phys_to_target_node'
      34 | #define phys_to_target_node phys_to_target_node
         |                             ^~~~~~~~~~~~~~~~~~~
   arch/arm64/mm/init.c:101:5: note: in expansion of macro 'phys_to_target_node'
     101 | int phys_to_target_node(phys_addr_t start)
         |     ^~~~~~~~~~~~~~~~~~~
   include/linux/numa.h:51:19: note: previous definition of 'phys_to_target_node' with type 'int(phys_addr_t)' {aka 'int(long long unsigned int)'}
      51 | static inline int phys_to_target_node(u64 start)
         |                   ^~~~~~~~~~~~~~~~~~~


vim +/numa_fill_memblks +54 arch/arm64/mm/init.c

    49	
    50	/*
    51	 * Scan existing memblocks and if this region overlaps with a region with
    52	 * a nid set, add a reserved memblock.
    53	 */
  > 54	int __init numa_fill_memblks(u64 start, u64 end)
    55	{
    56		struct memblock_region *region;
    57	
    58		for_each_mem_region(region) {
    59			int nid = memblock_get_region_node(region);
    60	
    61			if (nid == NUMA_NO_NODE)
    62				continue;
    63			if (!(end < region->base || start >= region->base + region->size)) {
    64				memblock_add_reserved_node(start, end - start, nid,
    65							   MEMBLOCK_RSRV_NOINIT);
    66				return 0;
    67			}
    68		}
    69	
    70		memblock_add_reserved_node(start, end - start, NUMA_NO_NODE,
    71					   MEMBLOCK_RSRV_NOINIT);
    72	
    73		return NUMA_NO_MEMBLK;
    74	}
    75	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
