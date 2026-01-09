Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4052F2741B5
	for <oe-kbuild-all@lists.linux.dev>; Fri,  9 Jan 2026 18:37:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767983857; cv=none; b=ALxqf3uPmB03XdClWq/1pL/o0mKQYti7JaHvRj/622zBZvGmv3fA2ppenEYKqZ7Q7t4TBb3mRj38fp3S1zEoSpiMpdqKmV6gOTtzaFY3uI53maIp6UxHXiKWVogapNpDqGf6bFNOLKZZ4A8iyQ6H9UO1DdNCOeDpEv0QREiZOvk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767983857; c=relaxed/simple;
	bh=9KjQEDxUOxCCJQuijyCpUSUCuD9EKLUMUoDlB7TwslY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=eqKgRWszrGNxFQpzqr1lJEH70HWzKvJjKQcwmspx+S/RSz+tT1HAPAedPkYQq+5OjJnWefW/1oCyXEERw+7fSW/znkU3Ss8bXD9ENiKb79BFl1pWa26Qaq3c/Im2GmZXpcuiTww8estrnYw+zjBkIvT+h8RFZdKg8G3Byrdg/DY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=P1AVHKKF; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="P1AVHKKF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767983856; x=1799519856;
  h=date:from:to:cc:subject:message-id;
  bh=9KjQEDxUOxCCJQuijyCpUSUCuD9EKLUMUoDlB7TwslY=;
  b=P1AVHKKFZG3ZAdzbr30mc4zEnhVEmxHRZDdQebE5hhPAemHWV5w8Ilc6
   ydWAhnrsYukjR0ov8q9EbW6/SvsfmB/ocsE38XMNBZ+Xz75FUrH8sQIhO
   dS83KeYkAWITVPwGj/Y7wXcNi2xTpmdink2e+upvAg7uM85YU+h0PWA7q
   LSBuqptPoRF8oUeaRbtedk3QltC5gkkbWtHuDcZ1a+vmSzDYJUv0Atos7
   UlnxfTQisquETfB1zKvXAiMl8abejWXqWO8zPHC2RaijW3AwjNSLZ4p/v
   HQ6E/LCMhR8/8dbx0Xb8/KjoiwbzUy7ToenXiEyknCvBKptbb/caFyFjy
   g==;
X-CSE-ConnectionGUID: Ew4O6/InT3qLgBWbHTeQJg==
X-CSE-MsgGUID: pI2i+ZByTV2KNjA15MeTbA==
X-IronPort-AV: E=McAfee;i="6800,10657,11666"; a="69269280"
X-IronPort-AV: E=Sophos;i="6.21,214,1763452800"; 
   d="scan'208";a="69269280"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jan 2026 10:37:36 -0800
X-CSE-ConnectionGUID: F4l7l7S1QwyMqN5XNiNr7A==
X-CSE-MsgGUID: pCzUMMlWSeCDE5VT2+wDTA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,214,1763452800"; 
   d="scan'208";a="208065826"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 09 Jan 2026 10:37:34 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1veHMa-000000007cW-1Nis;
	Fri, 09 Jan 2026 18:37:32 +0000
Date: Sat, 10 Jan 2026 02:36:54 +0800
From: kernel test robot <lkp@intel.com>
To: Gregory Price <gourry@gourry.net>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [gourryinverse:scratch/gourry/isolation/v7 4/8]
 mm/hugetlb.c:4202:18: warning: implicit conversion from 'unsigned long long'
 to 'unsigned long' changes value from 17179869184 to 0
Message-ID: <202601100240.odZAUwQW-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/gourryinverse/linux scratch/gourry/isolation/v7
head:   354a292e4159ea3350cbb9653e8a16b0e34d04df
commit: 8e120b8da3a1fe6cd7d3321c333cba6b21d09601 [4/8] cpuset: introduce cpuset.mems.sysram
config: powerpc-randconfig-r062-20260109 (https://download.01.org/0day-ci/archive/20260110/202601100240.odZAUwQW-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 9b8addffa70cee5b2acc5454712d9cf78ce45710)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260110/202601100240.odZAUwQW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601100240.odZAUwQW-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from mm/hugetlb.c:17:
   include/linux/cpuset.h:312:20: error: redefinition of 'cpuset_sysram_nodes_allowed'
     312 | static inline void cpuset_sysram_nodes_allowed(struct cgroup *cgroup,
         |                    ^
   include/linux/cpuset.h:223:20: note: previous definition is here
     223 | static inline void cpuset_sysram_nodes_allowed(struct cgroup *cgroup,
         |                    ^
   include/linux/cpuset.h:318:19: error: redefinition of 'cpuset_sysram_nodemask'
     318 | static nodemask_t cpuset_sysram_nodemask(struct task_struct *p)
         |                   ^
   include/linux/cpuset.h:229:26: note: previous definition is here
     229 | static inline nodemask_t cpuset_sysram_nodemask(struct task_struct *p)
         |                          ^
>> mm/hugetlb.c:4202:18: warning: implicit conversion from 'unsigned long long' to 'unsigned long' changes value from 17179869184 to 0 [-Wconstant-conversion]
    4202 |         WARN_ON(order > MAX_FOLIO_ORDER);
         |                         ^~~~~~~~~~~~~~~
   include/linux/mm.h:2284:63: note: expanded from macro 'MAX_FOLIO_ORDER'
    2284 | #define MAX_FOLIO_ORDER         get_order(IS_ENABLED(CONFIG_64BIT) ? SZ_16G : SZ_1G)
         |                                 ~~~~~~~~~                            ^~~~~~
   include/linux/sizes.h:56:19: note: expanded from macro 'SZ_16G'
      56 | #define SZ_16G                          _AC(0x400000000, ULL)
         |                                         ^~~~~~~~~~~~~~~~~~~~~
   include/uapi/linux/const.h:21:18: note: expanded from macro '_AC'
      21 | #define _AC(X,Y)        __AC(X,Y)
         |                         ^~~~~~~~~
   include/uapi/linux/const.h:20:20: note: expanded from macro '__AC'
      20 | #define __AC(X,Y)       (X##Y)
         |                          ^~~~
   <scratch space>:119:1: note: expanded from here
     119 | 0x400000000ULL
         | ^~~~~~~~~~~~~~
   include/asm-generic/bug.h:110:25: note: expanded from macro 'WARN_ON'
     110 |         int __ret_warn_on = !!(condition);                              \
         |                                ^~~~~~~~~
   1 warning and 2 errors generated.


vim +4202 mm/hugetlb.c

9fee021d15ddd8 Vaishali Thakkar     2016-05-19  4191  
d00181b96eb86c Kiryl Shutsemau      2015-11-06  4192  void __init hugetlb_add_hstate(unsigned int order)
a3437870160cf2 Nishanth Aravamudan  2008-07-23  4193  {
a3437870160cf2 Nishanth Aravamudan  2008-07-23  4194  	struct hstate *h;
8faa8b077b2cdc Andi Kleen           2008-07-23  4195  	unsigned long i;
8faa8b077b2cdc Andi Kleen           2008-07-23  4196  
a3437870160cf2 Nishanth Aravamudan  2008-07-23  4197  	if (size_to_hstate(PAGE_SIZE << order)) {
a3437870160cf2 Nishanth Aravamudan  2008-07-23  4198  		return;
a3437870160cf2 Nishanth Aravamudan  2008-07-23  4199  	}
47d38344abd0c7 Aneesh Kumar K.V     2012-07-31  4200  	BUG_ON(hugetlb_max_hstate >= HUGE_MAX_HSTATE);
59838b2566f6d0 Frank van der Linden 2023-10-04  4201  	BUG_ON(order < order_base_2(__NR_USED_SUBPAGE));
7b4f21f5e0386d David Hildenbrand    2025-09-01 @4202  	WARN_ON(order > MAX_FOLIO_ORDER);
47d38344abd0c7 Aneesh Kumar K.V     2012-07-31  4203  	h = &hstates[hugetlb_max_hstate++];
667574e873b5f7 Miaohe Lin           2024-07-12  4204  	__mutex_init(&h->resize_lock, "resize mutex", &h->resize_key);
a3437870160cf2 Nishanth Aravamudan  2008-07-23  4205  	h->order = order;
aca78307bfdaf3 Miaohe Lin           2021-02-24  4206  	h->mask = ~(huge_page_size(h) - 1);
8faa8b077b2cdc Andi Kleen           2008-07-23  4207  	for (i = 0; i < MAX_NUMNODES; ++i)
8faa8b077b2cdc Andi Kleen           2008-07-23  4208  		INIT_LIST_HEAD(&h->hugepage_freelists[i]);
0edaecfab218d7 Aneesh Kumar K.V     2012-07-31  4209  	INIT_LIST_HEAD(&h->hugepage_activelist);
a3437870160cf2 Nishanth Aravamudan  2008-07-23  4210  	snprintf(h->name, HSTATE_NAME_LEN, "hugepages-%lukB",
c2c3a60a857bfe Miaohe Lin           2022-09-01  4211  					huge_page_size(h)/SZ_1K);
8faa8b077b2cdc Andi Kleen           2008-07-23  4212  
a3437870160cf2 Nishanth Aravamudan  2008-07-23  4213  	parsed_hstate = h;
a3437870160cf2 Nishanth Aravamudan  2008-07-23  4214  }
a3437870160cf2 Nishanth Aravamudan  2008-07-23  4215  

:::::: The code at line 4202 was first introduced by commit
:::::: 7b4f21f5e0386dfe02c68c009294d8f26e3c1bad mm/hugetlb: check for unreasonable folio sizes when registering hstate

:::::: TO: David Hildenbrand <david@redhat.com>
:::::: CC: Andrew Morton <akpm@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
