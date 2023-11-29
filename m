Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F8ED39D
	for <oe-kbuild-all@lists.linux.dev>; Wed, 29 Nov 2023 02:43:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DgL+5J6a"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701225781; x=1732761781;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=2oWYUgbWic/cgY5HL6A5peNmyhFkv74lSgVw5rXmt6k=;
  b=DgL+5J6aRh773pm0TxMDsVUdAg3OZR7AT51AM+HXietTmYPm7JP+UeaF
   S/uTIrqFtQrpP9ax5LZv+oLEI0rReMawagxI27jfKiNyLCZZShgZiPGty
   hE1ZeQRc7X973tZpKuD9s9B9UBezq2lduUGFsJAHgjAztloEpVWJuBJ/S
   XE38LamMhFbLfciHesmgLHYz71zqMou7C90RJkLWzPXjf2jvz0GYI/AoG
   vDg4rdJsto9g8XVoSicrZ/Wx+B/tKl022oyt2I1l3JSKDw+0Pk7T/k3sP
   4GH+p/ofZ9oAyKq34T/hsewvLs3tJlz27rXCxmdeqOP1CJX1RHp1P50Id
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10908"; a="372449065"
X-IronPort-AV: E=Sophos;i="6.04,234,1695711600"; 
   d="scan'208";a="372449065"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Nov 2023 18:43:01 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10908"; a="745107782"
X-IronPort-AV: E=Sophos;i="6.04,234,1695711600"; 
   d="scan'208";a="745107782"
Received: from lkp-server01.sh.intel.com (HELO d584ee6ebdcc) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 28 Nov 2023 18:42:59 -0800
Received: from kbuild by d584ee6ebdcc with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r8AXR-0008SZ-0C;
	Wed, 29 Nov 2023 02:42:57 +0000
Date: Wed, 29 Nov 2023 10:40:03 +0800
From: kernel test robot <lkp@intel.com>
To: Weixi Zhu <weixi.zhu@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH 5/6] mm/gmem: resolve VMA conflicts for attached peer
 devices
Message-ID: <202311290729.Q8ZWUxoY-lkp@intel.com>
References: <20231128125025.4449-6-weixi.zhu@huawei.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231128125025.4449-6-weixi.zhu@huawei.com>

Hi Weixi,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on arnd-asm-generic/master]
[also build test ERROR on linus/master v6.7-rc3]
[cannot apply to akpm-mm/mm-everything arm64/for-next/core next-20231128]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Weixi-Zhu/mm-gmem-add-heterogeneous-NUMA-node/20231128-205404
base:   https://git.kernel.org/pub/scm/linux/kernel/git/arnd/asm-generic.git master
patch link:    https://lore.kernel.org/r/20231128125025.4449-6-weixi.zhu%40huawei.com
patch subject: [RFC PATCH 5/6] mm/gmem: resolve VMA conflicts for attached peer devices
config: i386-buildonly-randconfig-003-20231129 (https://download.01.org/0day-ci/archive/20231129/202311290729.Q8ZWUxoY-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231129/202311290729.Q8ZWUxoY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311290729.Q8ZWUxoY-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from mm/mmap.c:50:
>> include/linux/gmem.h:338:65: warning: 'struct gm_as' declared inside parameter list will not be visible outside of this definition or declaration
     338 | int gm_as_create(unsigned long begin, unsigned long end, struct gm_as **new_as)
         |                                                                 ^~~~~
>> include/linux/gmem.h:338:5: warning: no previous prototype for 'gm_as_create' [-Wmissing-prototypes]
     338 | int gm_as_create(unsigned long begin, unsigned long end, struct gm_as **new_as)
         |     ^~~~~~~~~~~~
   include/linux/gmem.h:342:26: warning: 'struct gm_as' declared inside parameter list will not be visible outside of this definition or declaration
     342 | int gm_as_destroy(struct gm_as *as)
         |                          ^~~~~
>> include/linux/gmem.h:342:5: warning: no previous prototype for 'gm_as_destroy' [-Wmissing-prototypes]
     342 | int gm_as_destroy(struct gm_as *as)
         |     ^~~~~~~~~~~~~
>> include/linux/gmem.h:347:40: warning: 'struct gm_context' declared inside parameter list will not be visible outside of this definition or declaration
     347 |                  bool activate, struct gm_context **out_ctx)
         |                                        ^~~~~~~~~~
>> include/linux/gmem.h:346:61: warning: 'enum gm_mmu_mode' declared inside parameter list will not be visible outside of this definition or declaration
     346 | int gm_as_attach(struct gm_as *as, struct gm_dev *dev, enum gm_mmu_mode mode,
         |                                                             ^~~~~~~~~~~
>> include/linux/gmem.h:346:43: warning: 'struct gm_dev' declared inside parameter list will not be visible outside of this definition or declaration
     346 | int gm_as_attach(struct gm_as *as, struct gm_dev *dev, enum gm_mmu_mode mode,
         |                                           ^~~~~~
   include/linux/gmem.h:346:25: warning: 'struct gm_as' declared inside parameter list will not be visible outside of this definition or declaration
     346 | int gm_as_attach(struct gm_as *as, struct gm_dev *dev, enum gm_mmu_mode mode,
         |                         ^~~~~
>> include/linux/gmem.h:346:73: error: parameter 3 ('mode') has incomplete type
     346 | int gm_as_attach(struct gm_as *as, struct gm_dev *dev, enum gm_mmu_mode mode,
         |                                                        ~~~~~~~~~~~~~~~~~^~~~
>> include/linux/gmem.h:346:5: error: function declaration isn't a prototype [-Werror=strict-prototypes]
     346 | int gm_as_attach(struct gm_as *as, struct gm_dev *dev, enum gm_mmu_mode mode,
         |     ^~~~~~~~~~~~
   mm/mmap.c: In function 'mmap_region':
>> mm/mmap.c:2965:28: error: 'GM_RET_NOMEM' undeclared (first use in this function)
    2965 |                 if (ret == GM_RET_NOMEM && retry_times < GMEM_MMAP_RETRY_TIMES) {
         |                            ^~~~~~~~~~~~
   mm/mmap.c:2965:28: note: each undeclared identifier is reported only once for each function it appears in
>> mm/mmap.c:2965:58: error: 'GMEM_MMAP_RETRY_TIMES' undeclared (first use in this function)
    2965 |                 if (ret == GM_RET_NOMEM && retry_times < GMEM_MMAP_RETRY_TIMES) {
         |                                                          ^~~~~~~~~~~~~~~~~~~~~
>> mm/mmap.c:2970:35: error: 'GM_RET_SUCCESS' undeclared (first use in this function); did you mean 'PGMIGRATE_SUCCESS'?
    2970 |                 } else if (ret != GM_RET_SUCCESS) {
         |                                   ^~~~~~~~~~~~~~
         |                                   PGMIGRATE_SUCCESS
   mm/mmap.c: In function 'exit_mmap':
>> mm/mmap.c:3369:31: error: passing argument 1 of 'vm_object_drop_locked' from incompatible pointer type [-Werror=incompatible-pointer-types]
    3369 |         vm_object_drop_locked(mm);
         |                               ^~
         |                               |
         |                               struct mm_struct *
   include/linux/gmem.h:309:65: note: expected 'struct vm_area_struct *' but argument is of type 'struct mm_struct *'
     309 | static inline void vm_object_drop_locked(struct vm_area_struct *vma)
         |                                          ~~~~~~~~~~~~~~~~~~~~~~~^~~
   cc1: some warnings being treated as errors


vim +346 include/linux/gmem.h

a679a015c3a306 Weixi Zhu 2023-11-28  285  
a679a015c3a306 Weixi Zhu 2023-11-28  286  /* GMEM address space KPI */
a679a015c3a306 Weixi Zhu 2023-11-28  287  int gm_as_create(unsigned long begin, unsigned long end, struct gm_as **new_as);
a679a015c3a306 Weixi Zhu 2023-11-28  288  int gm_as_destroy(struct gm_as *as);
a679a015c3a306 Weixi Zhu 2023-11-28  289  int gm_as_attach(struct gm_as *as, struct gm_dev *dev, enum gm_mmu_mode mode,
a679a015c3a306 Weixi Zhu 2023-11-28  290  		 bool activate, struct gm_context **out_ctx);
8d56b5ab31c4b4 Weixi Zhu 2023-11-28  291  
8d56b5ab31c4b4 Weixi Zhu 2023-11-28  292  int gm_alloc_va_in_peer_devices(struct mm_struct *mm,
8d56b5ab31c4b4 Weixi Zhu 2023-11-28  293  				struct vm_area_struct *vma, unsigned long addr,
8d56b5ab31c4b4 Weixi Zhu 2023-11-28  294  				unsigned long len, vm_flags_t vm_flags);
85cef3f0c5cea7 Weixi Zhu 2023-11-28  295  #else
a679a015c3a306 Weixi Zhu 2023-11-28  296  static inline bool gmem_is_enabled(void) { return false; }
b3fd21907d9fa3 Weixi Zhu 2023-11-28  297  static inline bool vma_is_peer_shared(struct vm_area_struct *vma)
b3fd21907d9fa3 Weixi Zhu 2023-11-28  298  {
b3fd21907d9fa3 Weixi Zhu 2023-11-28  299  	return false;
b3fd21907d9fa3 Weixi Zhu 2023-11-28  300  }
85cef3f0c5cea7 Weixi Zhu 2023-11-28  301  static inline void hnuma_init(void) {}
f51e98e3dccaee Weixi Zhu 2023-11-28  302  static inline void __init vm_object_init(void)
f51e98e3dccaee Weixi Zhu 2023-11-28  303  {
f51e98e3dccaee Weixi Zhu 2023-11-28  304  }
f51e98e3dccaee Weixi Zhu 2023-11-28  305  static inline struct vm_object *vm_object_create(struct vm_area_struct *vma)
f51e98e3dccaee Weixi Zhu 2023-11-28  306  {
f51e98e3dccaee Weixi Zhu 2023-11-28  307  	return NULL;
f51e98e3dccaee Weixi Zhu 2023-11-28  308  }
f51e98e3dccaee Weixi Zhu 2023-11-28  309  static inline void vm_object_drop_locked(struct vm_area_struct *vma)
f51e98e3dccaee Weixi Zhu 2023-11-28  310  {
f51e98e3dccaee Weixi Zhu 2023-11-28  311  }
f51e98e3dccaee Weixi Zhu 2023-11-28  312  static inline struct gm_mapping *alloc_gm_mapping(void)
f51e98e3dccaee Weixi Zhu 2023-11-28  313  {
f51e98e3dccaee Weixi Zhu 2023-11-28  314  	return NULL;
f51e98e3dccaee Weixi Zhu 2023-11-28  315  }
f51e98e3dccaee Weixi Zhu 2023-11-28  316  static inline void free_gm_mappings(struct vm_area_struct *vma)
f51e98e3dccaee Weixi Zhu 2023-11-28  317  {
f51e98e3dccaee Weixi Zhu 2023-11-28  318  }
f51e98e3dccaee Weixi Zhu 2023-11-28  319  static inline struct gm_mapping *vm_object_lookup(struct vm_object *obj,
f51e98e3dccaee Weixi Zhu 2023-11-28  320  						  unsigned long va)
f51e98e3dccaee Weixi Zhu 2023-11-28  321  {
f51e98e3dccaee Weixi Zhu 2023-11-28  322  	return NULL;
f51e98e3dccaee Weixi Zhu 2023-11-28  323  }
f51e98e3dccaee Weixi Zhu 2023-11-28  324  static inline void vm_object_mapping_create(struct vm_object *obj,
f51e98e3dccaee Weixi Zhu 2023-11-28  325  					    unsigned long start)
f51e98e3dccaee Weixi Zhu 2023-11-28  326  {
f51e98e3dccaee Weixi Zhu 2023-11-28  327  }
f51e98e3dccaee Weixi Zhu 2023-11-28  328  static inline void unmap_gm_mappings_range(struct vm_area_struct *vma,
f51e98e3dccaee Weixi Zhu 2023-11-28  329  					   unsigned long start,
f51e98e3dccaee Weixi Zhu 2023-11-28  330  					   unsigned long end)
f51e98e3dccaee Weixi Zhu 2023-11-28  331  {
f51e98e3dccaee Weixi Zhu 2023-11-28  332  }
f51e98e3dccaee Weixi Zhu 2023-11-28  333  static inline void munmap_in_peer_devices(struct mm_struct *mm,
f51e98e3dccaee Weixi Zhu 2023-11-28  334  					  unsigned long start,
f51e98e3dccaee Weixi Zhu 2023-11-28  335  					  unsigned long end)
f51e98e3dccaee Weixi Zhu 2023-11-28  336  {
f51e98e3dccaee Weixi Zhu 2023-11-28  337  }
a679a015c3a306 Weixi Zhu 2023-11-28 @338  int gm_as_create(unsigned long begin, unsigned long end, struct gm_as **new_as)
a679a015c3a306 Weixi Zhu 2023-11-28  339  {
a679a015c3a306 Weixi Zhu 2023-11-28  340  	return 0;
a679a015c3a306 Weixi Zhu 2023-11-28  341  }
a679a015c3a306 Weixi Zhu 2023-11-28 @342  int gm_as_destroy(struct gm_as *as)
a679a015c3a306 Weixi Zhu 2023-11-28  343  {
a679a015c3a306 Weixi Zhu 2023-11-28  344  	return 0;
a679a015c3a306 Weixi Zhu 2023-11-28  345  }
a679a015c3a306 Weixi Zhu 2023-11-28 @346  int gm_as_attach(struct gm_as *as, struct gm_dev *dev, enum gm_mmu_mode mode,
a679a015c3a306 Weixi Zhu 2023-11-28 @347  		 bool activate, struct gm_context **out_ctx)
a679a015c3a306 Weixi Zhu 2023-11-28  348  {
a679a015c3a306 Weixi Zhu 2023-11-28  349  	return 0;
a679a015c3a306 Weixi Zhu 2023-11-28  350  }
8d56b5ab31c4b4 Weixi Zhu 2023-11-28  351  static inline void gm_reserve_vma(struct vm_area_struct *value,
8d56b5ab31c4b4 Weixi Zhu 2023-11-28  352  				  struct list_head *head)
8d56b5ab31c4b4 Weixi Zhu 2023-11-28  353  {
8d56b5ab31c4b4 Weixi Zhu 2023-11-28  354  }
8d56b5ab31c4b4 Weixi Zhu 2023-11-28  355  static inline void gm_release_vma(struct mm_struct *mm, struct list_head *head)
8d56b5ab31c4b4 Weixi Zhu 2023-11-28  356  {
8d56b5ab31c4b4 Weixi Zhu 2023-11-28  357  }
8d56b5ab31c4b4 Weixi Zhu 2023-11-28  358  static inline int gm_alloc_va_in_peer_devices(struct mm_struct *mm,
8d56b5ab31c4b4 Weixi Zhu 2023-11-28  359  					      struct vm_area_struct *vma,
8d56b5ab31c4b4 Weixi Zhu 2023-11-28  360  					      unsigned long addr,
8d56b5ab31c4b4 Weixi Zhu 2023-11-28  361  					      unsigned long len,
8d56b5ab31c4b4 Weixi Zhu 2023-11-28  362  					      vm_flags_t vm_flags)
8d56b5ab31c4b4 Weixi Zhu 2023-11-28  363  {
8d56b5ab31c4b4 Weixi Zhu 2023-11-28  364  	return 0;
8d56b5ab31c4b4 Weixi Zhu 2023-11-28  365  }
85cef3f0c5cea7 Weixi Zhu 2023-11-28  366  #endif
85cef3f0c5cea7 Weixi Zhu 2023-11-28  367  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
