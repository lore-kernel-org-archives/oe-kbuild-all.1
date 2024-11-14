Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE1278F62
	for <oe-kbuild-all@lists.linux.dev>; Thu, 14 Nov 2024 16:36:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731602186; cv=none; b=aHCvM+aUdJrpZvZBHBEnGDoWv2m1dFqjvTOV0hzWptYlorJDQoSFtAb/EokGrMvkDWgpCX+p2OjPBk+02JklvkEsrvhesuY/57MGh31q9L5i14LvUoQGeD4xE6o21qHspSq/E1ImZSJwkpxkRDHCaWDDsELwLJcVTl2mAcEZRrY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731602186; c=relaxed/simple;
	bh=wVgd2Fkxolwq6zeqsBghnr0FSHrYA7pFdTgbYMsirPc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=rkCV2WYf3u1q+Q7uoDvyN6pQDT8GSjo3YrN/dnoHZpW/eNIKqWV7Zi+erkXlQcbaxWjjhVMZILdpf/zTt4PDTPUu2asmZOWSmlDs63dLquXesQ3gzDJrkopfNp0rreXs6y7kculmLIoxAHdvpPtm+c/5xhX5emBsiGhUIfIVLRs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EZ2965FD; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EZ2965FD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731602184; x=1763138184;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=wVgd2Fkxolwq6zeqsBghnr0FSHrYA7pFdTgbYMsirPc=;
  b=EZ2965FD6xDu3lmzoqdfG448zGZVgI0Czyo9sbQ66gvDXaAQzBRt2jch
   Brop5WnCAGxFL+LEHcjnq9Fr9kquSC9k2q2iWY9t6W5bvI4ovC5mYCFHa
   YGkC00ZIRKPrVHxj7KEI6DZYAzhuN8KXhW54WIXvw6s+VRXpldoX5+wqF
   4Fsz5/lTlSAHervV6AISdiBEMo1NheyjLwEECfsldDmRNvPq2oWsuBNtR
   amorYXv161Onj6ZP2z0mxpIX8ClJylo69c8Fd1NyN+YlBVT77ohu7UwQF
   UiheLYZJMSzYNJ+cAon/Lqh8NAVfxAqdKIByPyBWRaOoQgywsTDKqaOcf
   A==;
X-CSE-ConnectionGUID: ZutqOr6sSpupd+IN4iH99w==
X-CSE-MsgGUID: btaUFNvGS3+KdYA8AnXh5g==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="31724219"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="31724219"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Nov 2024 08:36:14 -0800
X-CSE-ConnectionGUID: NtBsQJ8XRjScifSVybyiKw==
X-CSE-MsgGUID: bOyoXgC3T5may4gSbin5rg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,154,1728975600"; 
   d="scan'208";a="87827957"
Received: from lkp-server01.sh.intel.com (HELO c7bc087bbc55) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 14 Nov 2024 08:36:12 -0800
Received: from kbuild by c7bc087bbc55 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tBcpF-0000AJ-2m;
	Thu, 14 Nov 2024 16:36:09 +0000
Date: Fri, 15 Nov 2024 00:35:56 +0800
From: kernel test robot <lkp@intel.com>
To: Roman Gushchin <roman.gushchin@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [rgushchin:swap_pages.1 1/2] mm/swap_cgroup.c:152:17: warning:
 variable 'length' is uninitialized when used here
Message-ID: <202411150037.UPDfEt8x-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/rgushchin/linux.git swap_pages.1
head:   aeaf7a1c697bd0eefe5632f89b289c82ba39b177
commit: c8954052619e6d17c4530852977306ec5590492a [1/2] mm: swap_cgroup: allocate swap_cgroup map using kcalloc
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20241115/202411150037.UPDfEt8x-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241115/202411150037.UPDfEt8x-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411150037.UPDfEt8x-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from mm/swap_cgroup.c:2:
   In file included from include/linux/swap_cgroup.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:21:
   In file included from include/linux/mm.h:2211:
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
>> mm/swap_cgroup.c:152:17: warning: variable 'length' is uninitialized when used here [-Wuninitialized]
     152 |         ctrl->length = length;
         |                        ^~~~~~
   mm/swap_cgroup.c:140:22: note: initialize the variable 'length' to silence this warning
     140 |         unsigned long length;
         |                             ^
         |                              = 0
   5 warnings generated.


vim +/length +152 mm/swap_cgroup.c

27a7faa0779dd1 mm/page_cgroup.c KAMEZAWA Hiroyuki 2009-01-07  136  
27a7faa0779dd1 mm/page_cgroup.c KAMEZAWA Hiroyuki 2009-01-07  137  int swap_cgroup_swapon(int type, unsigned long max_pages)
27a7faa0779dd1 mm/page_cgroup.c KAMEZAWA Hiroyuki 2009-01-07  138  {
c8954052619e6d mm/swap_cgroup.c Roman Gushchin    2024-11-14  139  	struct swap_cgroup **map;
27a7faa0779dd1 mm/page_cgroup.c KAMEZAWA Hiroyuki 2009-01-07  140  	unsigned long length;
27a7faa0779dd1 mm/page_cgroup.c KAMEZAWA Hiroyuki 2009-01-07  141  	struct swap_cgroup_ctrl *ctrl;
27a7faa0779dd1 mm/page_cgroup.c KAMEZAWA Hiroyuki 2009-01-07  142  
c91bdc93589928 mm/swap_cgroup.c Johannes Weiner   2022-09-26  143  	if (mem_cgroup_disabled())
c91bdc93589928 mm/swap_cgroup.c Johannes Weiner   2022-09-26  144  		return 0;
c91bdc93589928 mm/swap_cgroup.c Johannes Weiner   2022-09-26  145  
c8954052619e6d mm/swap_cgroup.c Roman Gushchin    2024-11-14  146  	map = vcalloc(max_pages, sizeof(struct swap_cgroup));
c8954052619e6d mm/swap_cgroup.c Roman Gushchin    2024-11-14  147  	if (!map)
27a7faa0779dd1 mm/page_cgroup.c KAMEZAWA Hiroyuki 2009-01-07  148  		goto nomem;
27a7faa0779dd1 mm/page_cgroup.c KAMEZAWA Hiroyuki 2009-01-07  149  
27a7faa0779dd1 mm/page_cgroup.c KAMEZAWA Hiroyuki 2009-01-07  150  	ctrl = &swap_cgroup_ctrl[type];
27a7faa0779dd1 mm/page_cgroup.c KAMEZAWA Hiroyuki 2009-01-07  151  	mutex_lock(&swap_cgroup_mutex);
27a7faa0779dd1 mm/page_cgroup.c KAMEZAWA Hiroyuki 2009-01-07 @152  	ctrl->length = length;
c8954052619e6d mm/swap_cgroup.c Roman Gushchin    2024-11-14  153  	ctrl->map = map;
e9e58a4ec3b108 mm/page_cgroup.c KAMEZAWA Hiroyuki 2010-03-15  154  	spin_lock_init(&ctrl->lock);
27a7faa0779dd1 mm/page_cgroup.c KAMEZAWA Hiroyuki 2009-01-07  155  	mutex_unlock(&swap_cgroup_mutex);
27a7faa0779dd1 mm/page_cgroup.c KAMEZAWA Hiroyuki 2009-01-07  156  
27a7faa0779dd1 mm/page_cgroup.c KAMEZAWA Hiroyuki 2009-01-07  157  	return 0;
27a7faa0779dd1 mm/page_cgroup.c KAMEZAWA Hiroyuki 2009-01-07  158  nomem:
1170532bb49f94 mm/swap_cgroup.c Joe Perches       2016-03-17  159  	pr_info("couldn't allocate enough memory for swap_cgroup\n");
1170532bb49f94 mm/swap_cgroup.c Joe Perches       2016-03-17  160  	pr_info("swap_cgroup can be disabled by swapaccount=0 boot option\n");
27a7faa0779dd1 mm/page_cgroup.c KAMEZAWA Hiroyuki 2009-01-07  161  	return -ENOMEM;
27a7faa0779dd1 mm/page_cgroup.c KAMEZAWA Hiroyuki 2009-01-07  162  }
27a7faa0779dd1 mm/page_cgroup.c KAMEZAWA Hiroyuki 2009-01-07  163  

:::::: The code at line 152 was first introduced by commit
:::::: 27a7faa0779dd13729196c1a818c294f44bbd1ee memcg: swap cgroup for remembering usage

:::::: TO: KAMEZAWA Hiroyuki <kamezawa.hiroyu@jp.fujitsu.com>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
