Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 683E72134D
	for <oe-kbuild-all@lists.linux.dev>; Fri, 13 Oct 2023 16:05:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TgUyzl2v"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697213148; x=1728749148;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Mi0b86YI0O30jbeoeZZpRcdvYdgVpp6V5Ti1PwYyjrU=;
  b=TgUyzl2v2DBSt2fqywvywfm1L5iafeq9E1B22srX6UWp+uycRM4fJW7l
   XXrg+hBUQsq5bkg6WOxI5Dra3H8McScZgCM5BIV9aN9vTiWTUKI/r3Ndf
   WqM4wxArWa/kgtL0Fl53LiU67coM/nFyqAaRO2DxR/PaYPcl8/9Oc/oF5
   fqbdeu20UgWTPnADMh8MZlTk/kf1Yp4en34/WG6xveY+QmkKTnBBEq2+F
   1v7E580hNts4KyWLCQJMSqYS3IDLCCx/eA9qt92ebuT1zbJNUqsfDuspB
   EDFBISNymxkUCw03EZmAXxM1S4c5Yv0itDkoWEJeBStHJ70CHyC883AzP
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10862"; a="370278247"
X-IronPort-AV: E=Sophos;i="6.03,222,1694761200"; 
   d="scan'208";a="370278247"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2023 09:05:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10862"; a="731407116"
X-IronPort-AV: E=Sophos;i="6.03,222,1694761200"; 
   d="scan'208";a="731407116"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 13 Oct 2023 09:05:46 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qrKfY-00054p-0I;
	Fri, 13 Oct 2023 16:05:44 +0000
Date: Sat, 14 Oct 2023 00:05:10 +0800
From: kernel test robot <lkp@intel.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jgunthorpe:for-nicolin2 9/10] include/linux/container_of.h:20:54:
 error: 'struct iommufd_hw_pagetable' has no member named 'hwpt_item'
Message-ID: <202310140041.0gChEx6l-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jgunthorpe/linux for-nicolin2
head:   8d234b4225ea7431b058eeb8eb3b92bbbdbdc6fd
commit: a05a58319088dd96951b1decf9e1777f17a76d02 [9/10] split the type
config: arc-randconfig-001-20231013 (https://download.01.org/0day-ci/archive/20231014/202310140041.0gChEx6l-lkp@intel.com/config)
compiler: arc-elf-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231014/202310140041.0gChEx6l-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310140041.0gChEx6l-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/container_of.h:5,
                    from include/linux/rbtree.h:20,
                    from include/linux/interval_tree.h:5,
                    from drivers/iommu/iommufd/vfio_compat.c:5:
   drivers/iommu/iommufd/vfio_compat.c: In function 'iommufd_vfio_cc_iommu':
>> include/linux/container_of.h:20:54: error: 'struct iommufd_hw_pagetable' has no member named 'hwpt_item'
      20 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |                                                      ^~
   include/linux/build_bug.h:78:56: note: in definition of macro '__static_assert'
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                                        ^~~~
   include/linux/container_of.h:20:9: note: in expansion of macro 'static_assert'
      20 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |         ^~~~~~~~~~~~~
   include/linux/container_of.h:20:23: note: in expansion of macro '__same_type'
      20 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |                       ^~~~~~~~~~~
   include/linux/list.h:601:9: note: in expansion of macro 'container_of'
     601 |         container_of(ptr, type, member)
         |         ^~~~~~~~~~~~
   include/linux/list.h:612:9: note: in expansion of macro 'list_entry'
     612 |         list_entry((ptr)->next, type, member)
         |         ^~~~~~~~~~
   include/linux/list.h:770:20: note: in expansion of macro 'list_first_entry'
     770 |         for (pos = list_first_entry(head, typeof(*pos), member);        \
         |                    ^~~~~~~~~~~~~~~~
   drivers/iommu/iommufd/vfio_compat.c:267:9: note: in expansion of macro 'list_for_each_entry'
     267 |         list_for_each_entry(hwpt, &ioas->hwpt_list, hwpt_item) {
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:366:27: error: expression in static assertion is not an integer
     366 | #define __same_type(a, b) __builtin_types_compatible_p(typeof(a), typeof(b))
         |                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:78:56: note: in definition of macro '__static_assert'
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                                        ^~~~
   include/linux/container_of.h:20:9: note: in expansion of macro 'static_assert'
      20 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |         ^~~~~~~~~~~~~
   include/linux/container_of.h:20:23: note: in expansion of macro '__same_type'
      20 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |                       ^~~~~~~~~~~
   include/linux/list.h:601:9: note: in expansion of macro 'container_of'
     601 |         container_of(ptr, type, member)
         |         ^~~~~~~~~~~~
   include/linux/list.h:612:9: note: in expansion of macro 'list_entry'
     612 |         list_entry((ptr)->next, type, member)
         |         ^~~~~~~~~~
   include/linux/list.h:770:20: note: in expansion of macro 'list_first_entry'
     770 |         for (pos = list_first_entry(head, typeof(*pos), member);        \
         |                    ^~~~~~~~~~~~~~~~
   drivers/iommu/iommufd/vfio_compat.c:267:9: note: in expansion of macro 'list_for_each_entry'
     267 |         list_for_each_entry(hwpt, &ioas->hwpt_list, hwpt_item) {
         |         ^~~~~~~~~~~~~~~~~~~
   In file included from include/uapi/linux/posix_types.h:5,
                    from include/uapi/linux/types.h:14,
                    from include/linux/types.h:6,
                    from include/linux/kasan-checks.h:5,
                    from include/asm-generic/rwonce.h:26,
                    from ./arch/arc/include/generated/asm/rwonce.h:1,
                    from include/linux/compiler.h:246,
                    from include/linux/file.h:9,
                    from drivers/iommu/iommufd/vfio_compat.c:4:
>> include/linux/stddef.h:16:33: error: 'struct iommufd_hw_pagetable' has no member named 'hwpt_item'
      16 | #define offsetof(TYPE, MEMBER)  __builtin_offsetof(TYPE, MEMBER)
         |                                 ^~~~~~~~~~~~~~~~~~
   include/linux/container_of.h:23:28: note: in expansion of macro 'offsetof'
      23 |         ((type *)(__mptr - offsetof(type, member))); })
         |                            ^~~~~~~~
   include/linux/list.h:601:9: note: in expansion of macro 'container_of'
     601 |         container_of(ptr, type, member)
         |         ^~~~~~~~~~~~
   include/linux/list.h:612:9: note: in expansion of macro 'list_entry'
     612 |         list_entry((ptr)->next, type, member)
         |         ^~~~~~~~~~
   include/linux/list.h:770:20: note: in expansion of macro 'list_first_entry'
     770 |         for (pos = list_first_entry(head, typeof(*pos), member);        \
         |                    ^~~~~~~~~~~~~~~~
   drivers/iommu/iommufd/vfio_compat.c:267:9: note: in expansion of macro 'list_for_each_entry'
     267 |         list_for_each_entry(hwpt, &ioas->hwpt_list, hwpt_item) {
         |         ^~~~~~~~~~~~~~~~~~~
   In file included from include/linux/preempt.h:12,
                    from include/linux/rcupdate.h:27,
                    from include/linux/rbtree.h:24:
>> include/linux/list.h:761:14: error: 'struct iommufd_hw_pagetable' has no member named 'hwpt_item'
     761 |         (&pos->member == (head))
         |              ^~
   include/linux/list.h:771:15: note: in expansion of macro 'list_entry_is_head'
     771 |              !list_entry_is_head(pos, head, member);                    \
         |               ^~~~~~~~~~~~~~~~~~
   drivers/iommu/iommufd/vfio_compat.c:267:9: note: in expansion of macro 'list_for_each_entry'
     267 |         list_for_each_entry(hwpt, &ioas->hwpt_list, hwpt_item) {
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/list.h:645:25: error: 'struct iommufd_hw_pagetable' has no member named 'hwpt_item'
     645 |         list_entry((pos)->member.next, typeof(*(pos)), member)
         |                         ^~
   include/linux/container_of.h:19:33: note: in definition of macro 'container_of'
      19 |         void *__mptr = (void *)(ptr);                                   \
         |                                 ^~~
   include/linux/list.h:645:9: note: in expansion of macro 'list_entry'
     645 |         list_entry((pos)->member.next, typeof(*(pos)), member)
         |         ^~~~~~~~~~
   include/linux/list.h:772:20: note: in expansion of macro 'list_next_entry'
     772 |              pos = list_next_entry(pos, member))
         |                    ^~~~~~~~~~~~~~~
   drivers/iommu/iommufd/vfio_compat.c:267:9: note: in expansion of macro 'list_for_each_entry'
     267 |         list_for_each_entry(hwpt, &ioas->hwpt_list, hwpt_item) {
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/list.h:645:25: error: 'struct iommufd_hw_pagetable' has no member named 'hwpt_item'
     645 |         list_entry((pos)->member.next, typeof(*(pos)), member)
         |                         ^~
   include/linux/build_bug.h:78:56: note: in definition of macro '__static_assert'
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                                        ^~~~
   include/linux/container_of.h:20:9: note: in expansion of macro 'static_assert'
      20 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |         ^~~~~~~~~~~~~
   include/linux/container_of.h:20:23: note: in expansion of macro '__same_type'
      20 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |                       ^~~~~~~~~~~
   include/linux/list.h:601:9: note: in expansion of macro 'container_of'
     601 |         container_of(ptr, type, member)
         |         ^~~~~~~~~~~~
   include/linux/list.h:645:9: note: in expansion of macro 'list_entry'
     645 |         list_entry((pos)->member.next, typeof(*(pos)), member)
         |         ^~~~~~~~~~
   include/linux/list.h:772:20: note: in expansion of macro 'list_next_entry'
     772 |              pos = list_next_entry(pos, member))
         |                    ^~~~~~~~~~~~~~~
   drivers/iommu/iommufd/vfio_compat.c:267:9: note: in expansion of macro 'list_for_each_entry'
     267 |         list_for_each_entry(hwpt, &ioas->hwpt_list, hwpt_item) {
         |         ^~~~~~~~~~~~~~~~~~~
>> include/linux/container_of.h:20:54: error: 'struct iommufd_hw_pagetable' has no member named 'hwpt_item'
      20 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |                                                      ^~
   include/linux/build_bug.h:78:56: note: in definition of macro '__static_assert'
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                                        ^~~~
   include/linux/container_of.h:20:9: note: in expansion of macro 'static_assert'
      20 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |         ^~~~~~~~~~~~~
   include/linux/container_of.h:20:23: note: in expansion of macro '__same_type'
      20 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |                       ^~~~~~~~~~~
   include/linux/list.h:601:9: note: in expansion of macro 'container_of'
     601 |         container_of(ptr, type, member)
         |         ^~~~~~~~~~~~
   include/linux/list.h:645:9: note: in expansion of macro 'list_entry'
     645 |         list_entry((pos)->member.next, typeof(*(pos)), member)
         |         ^~~~~~~~~~
   include/linux/list.h:772:20: note: in expansion of macro 'list_next_entry'
     772 |              pos = list_next_entry(pos, member))
         |                    ^~~~~~~~~~~~~~~
   drivers/iommu/iommufd/vfio_compat.c:267:9: note: in expansion of macro 'list_for_each_entry'
     267 |         list_for_each_entry(hwpt, &ioas->hwpt_list, hwpt_item) {
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/list.h:645:25: error: 'struct iommufd_hw_pagetable' has no member named 'hwpt_item'
     645 |         list_entry((pos)->member.next, typeof(*(pos)), member)
         |                         ^~
   include/linux/build_bug.h:78:56: note: in definition of macro '__static_assert'
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                                        ^~~~
   include/linux/container_of.h:20:9: note: in expansion of macro 'static_assert'
      20 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |         ^~~~~~~~~~~~~
   include/linux/container_of.h:21:23: note: in expansion of macro '__same_type'
      21 |                       __same_type(*(ptr), void),                        \
         |                       ^~~~~~~~~~~
   include/linux/list.h:601:9: note: in expansion of macro 'container_of'
     601 |         container_of(ptr, type, member)
         |         ^~~~~~~~~~~~
   include/linux/list.h:645:9: note: in expansion of macro 'list_entry'
     645 |         list_entry((pos)->member.next, typeof(*(pos)), member)
         |         ^~~~~~~~~~
   include/linux/list.h:772:20: note: in expansion of macro 'list_next_entry'
     772 |              pos = list_next_entry(pos, member))
         |                    ^~~~~~~~~~~~~~~
   drivers/iommu/iommufd/vfio_compat.c:267:9: note: in expansion of macro 'list_for_each_entry'
     267 |         list_for_each_entry(hwpt, &ioas->hwpt_list, hwpt_item) {
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:366:27: error: expression in static assertion is not an integer
     366 | #define __same_type(a, b) __builtin_types_compatible_p(typeof(a), typeof(b))
         |                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:78:56: note: in definition of macro '__static_assert'
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                                        ^~~~
   include/linux/container_of.h:20:9: note: in expansion of macro 'static_assert'
      20 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |         ^~~~~~~~~~~~~
   include/linux/container_of.h:20:23: note: in expansion of macro '__same_type'
      20 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |                       ^~~~~~~~~~~
   include/linux/list.h:601:9: note: in expansion of macro 'container_of'
     601 |         container_of(ptr, type, member)
         |         ^~~~~~~~~~~~
   include/linux/list.h:645:9: note: in expansion of macro 'list_entry'
     645 |         list_entry((pos)->member.next, typeof(*(pos)), member)
         |         ^~~~~~~~~~
   include/linux/list.h:772:20: note: in expansion of macro 'list_next_entry'
     772 |              pos = list_next_entry(pos, member))
         |                    ^~~~~~~~~~~~~~~
   drivers/iommu/iommufd/vfio_compat.c:267:9: note: in expansion of macro 'list_for_each_entry'
     267 |         list_for_each_entry(hwpt, &ioas->hwpt_list, hwpt_item) {
         |         ^~~~~~~~~~~~~~~~~~~
>> include/linux/stddef.h:16:33: error: 'struct iommufd_hw_pagetable' has no member named 'hwpt_item'
      16 | #define offsetof(TYPE, MEMBER)  __builtin_offsetof(TYPE, MEMBER)
         |                                 ^~~~~~~~~~~~~~~~~~
   include/linux/container_of.h:23:28: note: in expansion of macro 'offsetof'
      23 |         ((type *)(__mptr - offsetof(type, member))); })
         |                            ^~~~~~~~
   include/linux/list.h:601:9: note: in expansion of macro 'container_of'
     601 |         container_of(ptr, type, member)
         |         ^~~~~~~~~~~~
   include/linux/list.h:645:9: note: in expansion of macro 'list_entry'
     645 |         list_entry((pos)->member.next, typeof(*(pos)), member)
         |         ^~~~~~~~~~
   include/linux/list.h:772:20: note: in expansion of macro 'list_next_entry'
     772 |              pos = list_next_entry(pos, member))
         |                    ^~~~~~~~~~~~~~~
   drivers/iommu/iommufd/vfio_compat.c:267:9: note: in expansion of macro 'list_for_each_entry'
     267 |         list_for_each_entry(hwpt, &ioas->hwpt_list, hwpt_item) {
         |         ^~~~~~~~~~~~~~~~~~~
>> drivers/iommu/iommufd/vfio_compat.c:268:26: error: 'struct iommufd_hw_pagetable' has no member named 'enforce_cache_coherency'
     268 |                 if (!hwpt->enforce_cache_coherency) {
         |                          ^~


vim +20 include/linux/container_of.h

d2a8ebbf8192b8 Andy Shevchenko  2021-11-08   9  
d2a8ebbf8192b8 Andy Shevchenko  2021-11-08  10  /**
d2a8ebbf8192b8 Andy Shevchenko  2021-11-08  11   * container_of - cast a member of a structure out to the containing structure
d2a8ebbf8192b8 Andy Shevchenko  2021-11-08  12   * @ptr:	the pointer to the member.
d2a8ebbf8192b8 Andy Shevchenko  2021-11-08  13   * @type:	the type of the container struct this is embedded in.
d2a8ebbf8192b8 Andy Shevchenko  2021-11-08  14   * @member:	the name of the member within the struct.
d2a8ebbf8192b8 Andy Shevchenko  2021-11-08  15   *
7376e561fd2e01 Sakari Ailus     2022-10-24  16   * WARNING: any const qualifier of @ptr is lost.
d2a8ebbf8192b8 Andy Shevchenko  2021-11-08  17   */
d2a8ebbf8192b8 Andy Shevchenko  2021-11-08  18  #define container_of(ptr, type, member) ({				\
d2a8ebbf8192b8 Andy Shevchenko  2021-11-08  19  	void *__mptr = (void *)(ptr);					\
e1edc277e6f6df Rasmus Villemoes 2021-11-08 @20  	static_assert(__same_type(*(ptr), ((type *)0)->member) ||	\
e1edc277e6f6df Rasmus Villemoes 2021-11-08  21  		      __same_type(*(ptr), void),			\
d2a8ebbf8192b8 Andy Shevchenko  2021-11-08  22  		      "pointer type mismatch in container_of()");	\
d2a8ebbf8192b8 Andy Shevchenko  2021-11-08  23  	((type *)(__mptr - offsetof(type, member))); })
d2a8ebbf8192b8 Andy Shevchenko  2021-11-08  24  

:::::: The code at line 20 was first introduced by commit
:::::: e1edc277e6f6dfb372216522dfc57f9381c39e35 linux/container_of.h: switch to static_assert

:::::: TO: Rasmus Villemoes <linux@rasmusvillemoes.dk>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
