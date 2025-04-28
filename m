Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D21919C542
	for <oe-kbuild-all@lists.linux.dev>; Tue, 29 Apr 2025 01:19:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745889580; cv=none; b=lDPlPfkSQ3dxmrRfS14m1160YEXGWK8fyigA0I6zA8gcoi8tiaupoa5mmSGSCnWoIuzyLv+4Zalm7IZ/apwa43FJX1ktXJ2HhPffprDqejl7UMRf+2LwVODW4U3NagtwyItSA0/WKZ4bZswpx5kZVCc646f4gT8fGVZJZUID6gk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745889580; c=relaxed/simple;
	bh=P1nU5QfSR+839MftMt4ODSWSNA/xgup5s6/GNGz+GCQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=q2RC7QCplmWoyRbZ8+2zzU/f3uyHQsjGCmMDvkLQmi+xR5Exnrr9HHMO4oGpRho2H0GjG0Xg8IqRfH6WhelEEfVPV82G9vcjuum8HxgZ0rz9XO4t29wE+wtfuCNFvE6OJJ78+wc7aDdiEU7G+c7Dn9l/0qFjcJ4WKqMLdmQFTxc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kgOnow20; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kgOnow20"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745889578; x=1777425578;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=P1nU5QfSR+839MftMt4ODSWSNA/xgup5s6/GNGz+GCQ=;
  b=kgOnow20qevxrsIZKSTeH6fndsyOGJBolf+N8itHNoPFF2AvB/8p36hI
   xjfmMAcuuMNKw0iC7Q35HN8PtkOxLH2XnHz6gJgjKGDA/brwXnxaEUNqX
   V86tdApRxBEotzQRQuk50WmYTmnO4VC/fPcvtU5bjdF7f9bSvaekXg7G2
   s+kLN+B0qT+9fMpi2p76GL7SOEfotSYv/FSXOKcrxKdHi3z5S3h1hwY+3
   YSVqnGi7mV6U7O70CRCHZ+jyIUUKoN5jzc3mpwo3Dhy9D33DC+x2Jj/cB
   Ru2/OCeo8J1vAh4HPjzt/9ZqA0MOvclNNTWorNwkN/ZylHTojRjZnBYgW
   Q==;
X-CSE-ConnectionGUID: pMBpmu/2TXW8SAYErbVYSw==
X-CSE-MsgGUID: KQOR8NFaTPW+wACnPe1/1w==
X-IronPort-AV: E=McAfee;i="6700,10204,11417"; a="51313327"
X-IronPort-AV: E=Sophos;i="6.15,247,1739865600"; 
   d="scan'208";a="51313327"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Apr 2025 18:19:35 -0700
X-CSE-ConnectionGUID: w8k5LgrBS52TZQR7josnVA==
X-CSE-MsgGUID: j1ld44X1R6uh8HqUYvg6gQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,247,1739865600"; 
   d="scan'208";a="164637814"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 28 Apr 2025 18:19:35 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u9ZdE-0000Ea-0w;
	Tue, 29 Apr 2025 01:19:32 +0000
Date: Tue, 29 Apr 2025 05:43:17 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 2880/2880] include/linux/backing-dev.h:418:49:
 warning: 'struct cgroup_subsys' declared inside parameter list will not be
 visible outside of this definition or declaration
Message-ID: <202504290538.Gt6tWC7N-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi wangyigen,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   f6ce6a14f5841221e47ea0192331253223bdab2d
commit: 13e5c52d7cec7621f78bce452b78785e689ed0b2 [2880/2880] cgroup_writeback: bind blkcg and memcg
config: arm64-allnoconfig (https://download.01.org/0day-ci/archive/20250429/202504290538.Gt6tWC7N-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250429/202504290538.Gt6tWC7N-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504290538.Gt6tWC7N-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from mm/filemap.c:32:
>> include/linux/backing-dev.h:418:49: warning: 'struct cgroup_subsys' declared inside parameter list will not be visible outside of this definition or declaration
     418 | static inline void bind_memcg_blkcg_link(struct cgroup_subsys *ss,
         |                                                 ^~~~~~~~~~~~~
   mm/filemap.c:823:14: warning: no previous prototype for '__add_to_page_cache_locked' [-Wmissing-prototypes]
     823 | noinline int __add_to_page_cache_locked(struct page *page,
         |              ^~~~~~~~~~~~~~~~~~~~~~~~~~
--
   In file included from mm/fadvise.c:16:
>> include/linux/backing-dev.h:418:49: warning: 'struct cgroup_subsys' declared inside parameter list will not be visible outside of this definition or declaration
     418 | static inline void bind_memcg_blkcg_link(struct cgroup_subsys *ss,
         |                                                 ^~~~~~~~~~~~~
--
   In file included from mm/page_alloc.c:50:
>> include/linux/backing-dev.h:418:49: warning: 'struct cgroup_subsys' declared inside parameter list will not be visible outside of this definition or declaration
     418 | static inline void bind_memcg_blkcg_link(struct cgroup_subsys *ss,
         |                                                 ^~~~~~~~~~~~~
   mm/page_alloc.c:2609:5: warning: no previous prototype for 'find_suitable_fallback' [-Wmissing-prototypes]
    2609 | int find_suitable_fallback(struct free_area *area, unsigned int order,
         |     ^~~~~~~~~~~~~~~~~~~~~~
   mm/page_alloc.c:3040:6: warning: no previous prototype for '__drain_all_pages' [-Wmissing-prototypes]
    3040 | void __drain_all_pages(struct zone *zone, bool force_all_cpus)
         |      ^~~~~~~~~~~~~~~~~
   mm/page_alloc.c:3603:15: warning: no previous prototype for 'should_fail_alloc_page' [-Wmissing-prototypes]
    3603 | noinline bool should_fail_alloc_page(gfp_t gfp_mask, unsigned int order)
         |               ^~~~~~~~~~~~~~~~~~~~~~
   mm/page_alloc.c:6753:20: warning: no previous prototype for 'memmap_init' [-Wmissing-prototypes]
    6753 | void __init __weak memmap_init(void)
         |                    ^~~~~~~~~~~
   mm/page_alloc.c:6791:23: warning: no previous prototype for 'arch_memmap_init' [-Wmissing-prototypes]
    6791 | void __meminit __weak arch_memmap_init(unsigned long size, int nid,
         |                       ^~~~~~~~~~~~~~~~
   mm/page_alloc.c:6909:6: warning: no previous prototype for '__zone_set_pageset_high_and_batch' [-Wmissing-prototypes]
    6909 | void __zone_set_pageset_high_and_batch(struct zone *zone, unsigned long high,
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +418 include/linux/backing-dev.h

   417	
 > 418	static inline void bind_memcg_blkcg_link(struct cgroup_subsys *ss,
   419						   struct css_set *cset)
   420	{
   421	}
   422	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
