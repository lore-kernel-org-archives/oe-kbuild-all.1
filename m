Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07DA021370
	for <oe-kbuild-all@lists.linux.dev>; Wed, 13 Mar 2024 19:18:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710357495; cv=none; b=DMeeAfJiNX1gOGoDR4r5nPTaGqEd+DveoQcgUzC0r6DyQpP5l5FpBb2MqNU7LbNKh8VSMiGGYPUsAYwa3NKJQ1WQl55SigkAfocBR5hx1hwPtdl/hZck6mITNg48mBTlGbOBePKAaKdcHQmkw29pvGigV3BJpsKK5jTCV6RcZW0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710357495; c=relaxed/simple;
	bh=d6CQjQGi1DlxtOTgvzaPex2NR+VV5ZnOIl1CQnBUXfc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=kmchM2eu3HU8ODVKI7E6CbohqN9LAtbJxdmmkOC6Tj9Z81gV2auicIu8vekw5REV07hHWkGobKRPW5npfxvAacD+SSOg5TZ/NcckyTWJ0Q1dFrbd4eGoB5y0MCbS7nlc37AXqQzHGUwIxNvHo58GcFNjRFfAAa1unL9vV6sBLU4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Co5Hb8mm; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Co5Hb8mm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710357493; x=1741893493;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=d6CQjQGi1DlxtOTgvzaPex2NR+VV5ZnOIl1CQnBUXfc=;
  b=Co5Hb8mm31PCXx0UmifBjZEQOoLOlI3ynCvnsH2pWf7MqtWbBd3PtSfQ
   ZhdBaNDZtvjSJ+J7rQ7OViccgkGCwmwS7IdtjbQoC303NbTcoa5ihZrhh
   3bHTyvvy3zW9EJ0tRrbV0YpBJTiEy7s731iAxGUKOA9LlTZVafvvsTt1z
   HE3sYT1lLkEsEfv202ewgapD56I0L1RsuXxiI+uGBsuekrR2vS/A9M3mW
   mNagpQsQys0ANhSz9h2SuXO+/6E48E1+KO/lBrAweNZVXnM31Fuwy/hQ9
   JwSxLl1jN3iSkqh9N+csgPQcJvzG5upgnLlH60eFtSK7mYfxnbcu0W5Ox
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11012"; a="16598243"
X-IronPort-AV: E=Sophos;i="6.07,123,1708416000"; 
   d="scan'208";a="16598243"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Mar 2024 12:18:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,123,1708416000"; 
   d="scan'208";a="16712982"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 13 Mar 2024 12:18:01 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rkU6x-000ChJ-18;
	Wed, 13 Mar 2024 19:17:59 +0000
Date: Thu, 14 Mar 2024 03:17:24 +0800
From: kernel test robot <lkp@intel.com>
To: jasperwang@tencent.com, kaixuxia@tencent.com, frankjpliu@tencent.com,
	kasong@tencent.com, sagazchen@tencent.com, kernelxing@tencent.com,
	aurelianliu@tencent.com, jason.zeng@intel.com, wu.zheng@intel.com,
	yingbao.jia@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: mm/filemap.c:869:17: error: implicit declaration of function
 'mem_cgroup_shrink_pagecache'; did you mean 'mem_cgroup_shrink_node'?
Message-ID: <202403140336.JHTswCIm-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/OpenCloudOS/OpenCloudOS-Kernel.git linux-5.4/lts/5.4.119-20.0009
head:   ef4270af264f76e609dfd098345acae7e024b403
commit: 06d37efeef4689ee10a610bbe91d85de62b88d6c mm: pagecache limit per cgroup support
date:   2 years, 5 months ago
config: x86_64-randconfig-011-20240313 (https://download.01.org/0day-ci/archive/20240314/202403140336.JHTswCIm-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240314/202403140336.JHTswCIm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403140336.JHTswCIm-lkp@intel.com/

All errors (new ones prefixed by >>):

   mm/filemap.c:849:14: warning: no previous prototype for '__add_to_page_cache_locked' [-Wmissing-prototypes]
     849 | noinline int __add_to_page_cache_locked(struct page *page,
         |              ^~~~~~~~~~~~~~~~~~~~~~~~~~
   mm/filemap.c: In function '__add_to_page_cache_locked':
>> mm/filemap.c:869:17: error: implicit declaration of function 'mem_cgroup_shrink_pagecache'; did you mean 'mem_cgroup_shrink_node'? [-Werror=implicit-function-declaration]
     869 |                 mem_cgroup_shrink_pagecache(memcg, gfp_mask);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                 mem_cgroup_shrink_node
   cc1: some warnings being treated as errors
--
   mm/vmscan.c: In function '__shrink_page_cache':
>> mm/vmscan.c:4356:33: error: implicit declaration of function 'for_each_mem_cgroup_tree' [-Werror=implicit-function-declaration]
    4356 |                                 for_each_mem_cgroup_tree(iter, memcg) {
         |                                 ^~~~~~~~~~~~~~~~~~~~~~~~
>> mm/vmscan.c:4356:70: error: expected ';' before '{' token
    4356 |                                 for_each_mem_cgroup_tree(iter, memcg) {
         |                                                                      ^~
         |                                                                      ;
   cc1: some warnings being treated as errors
--
>> kernel/sysctl.c:1634:36: error: 'vm_pagecache_limit_retry_times' undeclared here (not in a function); did you mean 'vm_pagecache_limit_ratio'?
    1634 |                 .data           = &vm_pagecache_limit_retry_times,
         |                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                                    vm_pagecache_limit_ratio
   kernel/sysctl.c:2649:5: warning: no previous prototype for 'setup_pagecache_limit' [-Wmissing-prototypes]
    2649 | int setup_pagecache_limit(void)
         |     ^~~~~~~~~~~~~~~~~~~~~
   kernel/sysctl.c: In function 'proc_dointvec_max_map_count':
   kernel/sysctl.c:3014:9: warning: ISO C90 forbids mixed declarations and code [-Wdeclaration-after-statement]
    3014 |         struct do_proc_dointvec_minmax_conv_param param = {
         |         ^~~~~~
--
>> kernel/tkernel/netatop/netatop.c:341:15: error: variable 'sockopts' has initializer but incomplete type
     341 | static struct nf_sockopt_ops sockopts = {
         |               ^~~~~~~~~~~~~~
>> kernel/tkernel/netatop/netatop.c:342:10: error: 'struct nf_sockopt_ops' has no member named 'pf'
     342 |         .pf             = PF_INET,
         |          ^~
   In file included from include/linux/skbuff.h:20,
                    from include/linux/netfilter.h:6,
                    from kernel/tkernel/netatop/netatop.c:87:
   include/linux/socket.h:165:25: warning: excess elements in struct initializer
     165 | #define AF_INET         2       /* Internet IP Protocol         */
         |                         ^
   include/linux/socket.h:219:25: note: in expansion of macro 'AF_INET'
     219 | #define PF_INET         AF_INET
         |                         ^~~~~~~
   kernel/tkernel/netatop/netatop.c:342:27: note: in expansion of macro 'PF_INET'
     342 |         .pf             = PF_INET,
         |                           ^~~~~~~
   include/linux/socket.h:165:25: note: (near initialization for 'sockopts')
     165 | #define AF_INET         2       /* Internet IP Protocol         */
         |                         ^
   include/linux/socket.h:219:25: note: in expansion of macro 'AF_INET'
     219 | #define PF_INET         AF_INET
         |                         ^~~~~~~
   kernel/tkernel/netatop/netatop.c:342:27: note: in expansion of macro 'PF_INET'
     342 |         .pf             = PF_INET,
         |                           ^~~~~~~
>> kernel/tkernel/netatop/netatop.c:343:10: error: 'struct nf_sockopt_ops' has no member named 'get_optmin'
     343 |         .get_optmin     = NETATOP_BASE_CTL,
         |          ^~~~~~~~~~
   In file included from kernel/tkernel/netatop/netatop.c:105:
   kernel/tkernel/netatop/netatop.h:29:33: warning: excess elements in struct initializer
      29 | #define NETATOP_BASE_CTL        15661
         |                                 ^~~~~
   kernel/tkernel/netatop/netatop.c:343:27: note: in expansion of macro 'NETATOP_BASE_CTL'
     343 |         .get_optmin     = NETATOP_BASE_CTL,
         |                           ^~~~~~~~~~~~~~~~
   kernel/tkernel/netatop/netatop.h:29:33: note: (near initialization for 'sockopts')
      29 | #define NETATOP_BASE_CTL        15661
         |                                 ^~~~~
   kernel/tkernel/netatop/netatop.c:343:27: note: in expansion of macro 'NETATOP_BASE_CTL'
     343 |         .get_optmin     = NETATOP_BASE_CTL,
         |                           ^~~~~~~~~~~~~~~~
>> kernel/tkernel/netatop/netatop.c:344:10: error: 'struct nf_sockopt_ops' has no member named 'get_optmax'
     344 |         .get_optmax     = NETATOP_BASE_CTL+6,
         |          ^~~~~~~~~~
   kernel/tkernel/netatop/netatop.h:29:33: warning: excess elements in struct initializer
      29 | #define NETATOP_BASE_CTL        15661
         |                                 ^~~~~
   kernel/tkernel/netatop/netatop.c:344:27: note: in expansion of macro 'NETATOP_BASE_CTL'
     344 |         .get_optmax     = NETATOP_BASE_CTL+6,
         |                           ^~~~~~~~~~~~~~~~
   kernel/tkernel/netatop/netatop.h:29:33: note: (near initialization for 'sockopts')
      29 | #define NETATOP_BASE_CTL        15661
         |                                 ^~~~~
   kernel/tkernel/netatop/netatop.c:344:27: note: in expansion of macro 'NETATOP_BASE_CTL'
     344 |         .get_optmax     = NETATOP_BASE_CTL+6,
         |                           ^~~~~~~~~~~~~~~~
>> kernel/tkernel/netatop/netatop.c:345:10: error: 'struct nf_sockopt_ops' has no member named 'get'
     345 |         .get            = getsockopt,
         |          ^~~
   kernel/tkernel/netatop/netatop.c:345:27: warning: excess elements in struct initializer
     345 |         .get            = getsockopt,
         |                           ^~~~~~~~~~
   kernel/tkernel/netatop/netatop.c:345:27: note: (near initialization for 'sockopts')
>> kernel/tkernel/netatop/netatop.c:346:10: error: 'struct nf_sockopt_ops' has no member named 'owner'
     346 |         .owner          = THIS_MODULE,
         |          ^~~~~
   In file included from include/linux/linkage.h:7,
                    from include/linux/kernel.h:8,
                    from kernel/tkernel/netatop/netatop.c:85:
   include/linux/export.h:16:21: warning: excess elements in struct initializer
      16 | #define THIS_MODULE (&__this_module)
         |                     ^
   kernel/tkernel/netatop/netatop.c:346:27: note: in expansion of macro 'THIS_MODULE'
     346 |         .owner          = THIS_MODULE,
         |                           ^~~~~~~~~~~
   include/linux/export.h:16:21: note: (near initialization for 'sockopts')
      16 | #define THIS_MODULE (&__this_module)
         |                     ^
   kernel/tkernel/netatop/netatop.c:346:27: note: in expansion of macro 'THIS_MODULE'
     346 |         .owner          = THIS_MODULE,
         |                           ^~~~~~~~~~~
   kernel/tkernel/netatop/netatop.c: In function 'gctaskexit':
   kernel/tkernel/netatop/netatop.c:1015:1: warning: old-style function definition [-Wold-style-definition]
    1015 | gctaskexit()
         | ^~~~~~~~~~
   kernel/tkernel/netatop/netatop.c: In function 'gcsockinfo':
   kernel/tkernel/netatop/netatop.c:1049:1: warning: old-style function definition [-Wold-style-definition]
    1049 | gcsockinfo()
         | ^~~~~~~~~~
   kernel/tkernel/netatop/netatop.c: In function 'gctaskinfo':
   kernel/tkernel/netatop/netatop.c:1259:1: warning: old-style function definition [-Wold-style-definition]
    1259 | gctaskinfo()
         | ^~~~~~~~~~
   kernel/tkernel/netatop/netatop.c: In function 'wipesockinfo':
   kernel/tkernel/netatop/netatop.c:1332:1: warning: old-style function definition [-Wold-style-definition]
    1332 | wipesockinfo()
         | ^~~~~~~~~~~~
   kernel/tkernel/netatop/netatop.c: In function 'wipetaskinfo':
   kernel/tkernel/netatop/netatop.c:1360:1: warning: old-style function definition [-Wold-style-definition]
    1360 | wipetaskinfo()
         | ^~~~~~~~~~~~
   kernel/tkernel/netatop/netatop.c: In function 'wipetaskexit':
   kernel/tkernel/netatop/netatop.c:1388:1: warning: old-style function definition [-Wold-style-definition]
    1388 | wipetaskexit()
         | ^~~~~~~~~~~~
   kernel/tkernel/netatop/netatop.c: In function 'init_module':
   kernel/tkernel/netatop/netatop.c:1673:1: warning: old-style function definition [-Wold-style-definition]
    1673 | init_module()
         | ^~~~~~~~~~~
>> kernel/tkernel/netatop/netatop.c:1712:13: error: implicit declaration of function 'nf_register_sockopt' [-Werror=implicit-function-declaration]
    1712 |         if (nf_register_sockopt(&sockopts) < 0) {
         |             ^~~~~~~~~~~~~~~~~~~
>> kernel/tkernel/netatop/netatop.c:1725:17: error: implicit declaration of function 'nf_unregister_sockopt' [-Werror=implicit-function-declaration]
    1725 |                 nf_unregister_sockopt(&sockopts);
         |                 ^~~~~~~~~~~~~~~~~~~~~
>> kernel/tkernel/netatop/netatop.c:1744:9: error: implicit declaration of function 'nf_register_net_hook' [-Werror=implicit-function-declaration]
    1744 |         nf_register_net_hook(&init_net, &hookin_ipv4);                  // register hook
         |         ^~~~~~~~~~~~~~~~~~~~
   kernel/tkernel/netatop/netatop.c: In function 'cleanup_module':
   kernel/tkernel/netatop/netatop.c:1764:1: warning: old-style function definition [-Wold-style-definition]
    1764 | cleanup_module()
         | ^~~~~~~~~~~~~~
>> kernel/tkernel/netatop/netatop.c:1774:9: error: implicit declaration of function 'nf_unregister_net_hook'; did you mean 'unregister_netdev'? [-Werror=implicit-function-declaration]
    1774 |         nf_unregister_net_hook(&init_net, &hookin_ipv4);
         |         ^~~~~~~~~~~~~~~~~~~~~~
         |         unregister_netdev
   kernel/tkernel/netatop/netatop.c: At top level:
>> kernel/tkernel/netatop/netatop.c:341:30: error: storage size of 'sockopts' isn't known
     341 | static struct nf_sockopt_ops sockopts = {
         |                              ^~~~~~~~
   cc1: some warnings being treated as errors


vim +869 mm/filemap.c

   848	
 > 849	noinline int __add_to_page_cache_locked(struct page *page,
   850						struct address_space *mapping,
   851						pgoff_t offset, gfp_t gfp_mask,
   852						void **shadowp)
   853	{
   854		XA_STATE(xas, &mapping->i_pages, offset);
   855		int huge = PageHuge(page);
   856		struct mem_cgroup *memcg;
   857		int error;
   858		void *old;
   859	
   860		VM_BUG_ON_PAGE(!PageLocked(page), page);
   861		VM_BUG_ON_PAGE(PageSwapBacked(page), page);
   862		mapping_set_update(&xas, mapping);
   863	
   864		if (!huge) {
   865			error = mem_cgroup_try_charge(page, current->mm,
   866						      gfp_mask, &memcg, false);
   867			if (error)
   868				return error;
 > 869			mem_cgroup_shrink_pagecache(memcg, gfp_mask);
   870		}
   871	
   872		get_page(page);
   873		page->mapping = mapping;
   874		page->index = offset;
   875	
   876		do {
   877			xas_lock_irq(&xas);
   878			old = xas_load(&xas);
   879			if (old && !xa_is_value(old))
   880				xas_set_err(&xas, -EEXIST);
   881			xas_store(&xas, page);
   882			if (xas_error(&xas))
   883				goto unlock;
   884	
   885			if (xa_is_value(old)) {
   886				mapping->nrexceptional--;
   887				if (shadowp)
   888					*shadowp = old;
   889			}
   890			mapping->nrpages++;
   891	
   892			/* hugetlb pages do not participate in page cache accounting */
   893			if (!huge)
   894				__inc_node_page_state(page, NR_FILE_PAGES);
   895	unlock:
   896			xas_unlock_irq(&xas);
   897		} while (xas_nomem(&xas, gfp_mask & GFP_RECLAIM_MASK));
   898	
   899		if (xas_error(&xas))
   900			goto error;
   901	
   902		if (!huge)
   903			mem_cgroup_commit_charge(page, memcg, false, false);
   904		trace_mm_filemap_add_to_page_cache(page);
   905		return 0;
   906	error:
   907		page->mapping = NULL;
   908		/* Leave page->index set: truncation relies upon it */
   909		if (!huge)
   910			mem_cgroup_cancel_charge(page, memcg, false);
   911		put_page(page);
   912		return xas_error(&xas);
   913	}
   914	ALLOW_ERROR_INJECTION(__add_to_page_cache_locked, ERRNO);
   915	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
