Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56F1915B7
	for <oe-kbuild-all@lists.linux.dev>; Sun,  6 Aug 2023 04:11:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691295063; x=1722831063;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=4/c4ydww9iCzOLPN3vsVdfJri3vZwAi2WiaGOZpuui0=;
  b=OW2tKeHHyUtcZLchRl+yFfPdIpIjEIo457qxQKdszONWnA1rKsTLaAwi
   ++mIN413s7QKPfIuinjZ49NPIKjioGgdItjd2uXzg+xS17gjhPWWvQIh8
   69md51XmwXUt+A/ZSU6eeTSawb1SBHBqUyEHll8w90Y5bIdo0jEMdcn4j
   cv14C3DlY1Y2Zth0h1XJLL6uGU03W7idWuaDLOK2yml1uZD2m+YZvbcTB
   j5ct/a5w6+2ZEn4h/MiBHgZC7nxXGQS0IWNRrmIYiRndrx8L2ZG6JckUm
   enwhCnUss/7cPdH+OgnOrzDlQ+e59CYN7Jg4w7WOFNz2wKHnHOMDHi54R
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10793"; a="360423642"
X-IronPort-AV: E=Sophos;i="6.01,259,1684825200"; 
   d="scan'208";a="360423642"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Aug 2023 21:11:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10793"; a="760055860"
X-IronPort-AV: E=Sophos;i="6.01,259,1684825200"; 
   d="scan'208";a="760055860"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 05 Aug 2023 21:11:00 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qSV6Z-000413-2V;
	Sun, 06 Aug 2023 04:10:59 +0000
Date: Sun, 6 Aug 2023 12:10:22 +0800
From: kernel test robot <lkp@intel.com>
To: "Vishal Moola (Oracle)" <vishal.moola@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Andrew Morton <akpm@linux-foundation.org>
Subject: [linux-next:master 6109/6443] include/linux/pgtable.h:1041:5:
 warning: "ALLOC_SPLIT_PTLOCKS" is not defined, evaluates to 0
Message-ID: <202308061211.JH3SLigH-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   bdffb18b5dd8071cd25685b966f380a30b1fadaa
commit: 4d448d6c17c1bb5041ede2dcf2bf20e4a153fd4d [6109/6443] pgtable: create struct ptdesc
config: xtensa-nommu_kc705_defconfig (https://download.01.org/0day-ci/archive/20230806/202308061211.JH3SLigH-lkp@intel.com/config)
compiler: xtensa-de212-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230806/202308061211.JH3SLigH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308061211.JH3SLigH-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from arch/xtensa/include/asm/io.h:19,
                    from include/linux/io.h:13,
                    from arch/xtensa/platforms/xtfpga/setup.c:16:
>> include/linux/pgtable.h:1041:5: warning: "ALLOC_SPLIT_PTLOCKS" is not defined, evaluates to 0 [-Wundef]
    1041 | #if ALLOC_SPLIT_PTLOCKS
         |     ^~~~~~~~~~~~~~~~~~~
   include/linux/pgtable.h:1044:17: error: unknown type name 'spinlock_t'
    1044 |                 spinlock_t ptl;
         |                 ^~~~~~~~~~
   In file included from include/linux/container_of.h:5,
                    from include/linux/kernel.h:21,
                    from arch/xtensa/platforms/xtfpga/setup.c:14:
   include/linux/stddef.h:16:33: error: invalid use of undefined type 'struct page'
      16 | #define offsetof(TYPE, MEMBER)  __builtin_offsetof(TYPE, MEMBER)
         |                                 ^~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:78:56: note: in definition of macro '__static_assert'
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                                        ^~~~
   include/linux/pgtable.h:1055:9: note: in expansion of macro 'static_assert'
    1055 |         static_assert(offsetof(struct page, pg) == offsetof(struct ptdesc, pt))
         |         ^~~~~~~~~~~~~
   include/linux/pgtable.h:1055:23: note: in expansion of macro 'offsetof'
    1055 |         static_assert(offsetof(struct page, pg) == offsetof(struct ptdesc, pt))
         |                       ^~~~~~~~
   include/linux/pgtable.h:1056:1: note: in expansion of macro 'TABLE_MATCH'
    1056 | TABLE_MATCH(flags, __page_flags);
         | ^~~~~~~~~~~
   include/linux/stddef.h:16:33: error: expression in static assertion is not an integer
      16 | #define offsetof(TYPE, MEMBER)  __builtin_offsetof(TYPE, MEMBER)
         |                                 ^~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:78:56: note: in definition of macro '__static_assert'
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                                        ^~~~
   include/linux/pgtable.h:1055:9: note: in expansion of macro 'static_assert'
    1055 |         static_assert(offsetof(struct page, pg) == offsetof(struct ptdesc, pt))
         |         ^~~~~~~~~~~~~
   include/linux/pgtable.h:1055:23: note: in expansion of macro 'offsetof'
    1055 |         static_assert(offsetof(struct page, pg) == offsetof(struct ptdesc, pt))
         |                       ^~~~~~~~
   include/linux/pgtable.h:1056:1: note: in expansion of macro 'TABLE_MATCH'
    1056 | TABLE_MATCH(flags, __page_flags);
         | ^~~~~~~~~~~
   include/linux/stddef.h:16:33: error: invalid use of undefined type 'struct page'
      16 | #define offsetof(TYPE, MEMBER)  __builtin_offsetof(TYPE, MEMBER)
         |                                 ^~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:78:56: note: in definition of macro '__static_assert'
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                                        ^~~~
   include/linux/pgtable.h:1055:9: note: in expansion of macro 'static_assert'
    1055 |         static_assert(offsetof(struct page, pg) == offsetof(struct ptdesc, pt))
         |         ^~~~~~~~~~~~~
   include/linux/pgtable.h:1055:23: note: in expansion of macro 'offsetof'
    1055 |         static_assert(offsetof(struct page, pg) == offsetof(struct ptdesc, pt))
         |                       ^~~~~~~~
   include/linux/pgtable.h:1057:1: note: in expansion of macro 'TABLE_MATCH'
    1057 | TABLE_MATCH(compound_head, pt_list);
         | ^~~~~~~~~~~
   include/linux/stddef.h:16:33: error: expression in static assertion is not an integer
      16 | #define offsetof(TYPE, MEMBER)  __builtin_offsetof(TYPE, MEMBER)
         |                                 ^~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:78:56: note: in definition of macro '__static_assert'
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                                        ^~~~
   include/linux/pgtable.h:1055:9: note: in expansion of macro 'static_assert'
    1055 |         static_assert(offsetof(struct page, pg) == offsetof(struct ptdesc, pt))
         |         ^~~~~~~~~~~~~
   include/linux/pgtable.h:1055:23: note: in expansion of macro 'offsetof'
    1055 |         static_assert(offsetof(struct page, pg) == offsetof(struct ptdesc, pt))
         |                       ^~~~~~~~
   include/linux/pgtable.h:1057:1: note: in expansion of macro 'TABLE_MATCH'
    1057 | TABLE_MATCH(compound_head, pt_list);
         | ^~~~~~~~~~~
   include/linux/stddef.h:16:33: error: invalid use of undefined type 'struct page'
      16 | #define offsetof(TYPE, MEMBER)  __builtin_offsetof(TYPE, MEMBER)
         |                                 ^~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:78:56: note: in definition of macro '__static_assert'
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                                        ^~~~
   include/linux/pgtable.h:1055:9: note: in expansion of macro 'static_assert'
    1055 |         static_assert(offsetof(struct page, pg) == offsetof(struct ptdesc, pt))
         |         ^~~~~~~~~~~~~
   include/linux/pgtable.h:1055:23: note: in expansion of macro 'offsetof'
    1055 |         static_assert(offsetof(struct page, pg) == offsetof(struct ptdesc, pt))
         |                       ^~~~~~~~
   include/linux/pgtable.h:1058:1: note: in expansion of macro 'TABLE_MATCH'
    1058 | TABLE_MATCH(compound_head, _pt_pad_1);
         | ^~~~~~~~~~~
   include/linux/stddef.h:16:33: error: expression in static assertion is not an integer
      16 | #define offsetof(TYPE, MEMBER)  __builtin_offsetof(TYPE, MEMBER)
         |                                 ^~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:78:56: note: in definition of macro '__static_assert'
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                                        ^~~~
   include/linux/pgtable.h:1055:9: note: in expansion of macro 'static_assert'
    1055 |         static_assert(offsetof(struct page, pg) == offsetof(struct ptdesc, pt))
         |         ^~~~~~~~~~~~~
   include/linux/pgtable.h:1055:23: note: in expansion of macro 'offsetof'
    1055 |         static_assert(offsetof(struct page, pg) == offsetof(struct ptdesc, pt))
         |                       ^~~~~~~~
   include/linux/pgtable.h:1058:1: note: in expansion of macro 'TABLE_MATCH'
    1058 | TABLE_MATCH(compound_head, _pt_pad_1);
         | ^~~~~~~~~~~
   include/linux/stddef.h:16:33: error: invalid use of undefined type 'struct page'
      16 | #define offsetof(TYPE, MEMBER)  __builtin_offsetof(TYPE, MEMBER)


vim +/ALLOC_SPLIT_PTLOCKS +1041 include/linux/pgtable.h

  1000	
  1001	
  1002	/**
  1003	 * struct ptdesc -    Memory descriptor for page tables.
  1004	 * @__page_flags:     Same as page flags. Unused for page tables.
  1005	 * @pt_rcu_head:      For freeing page table pages.
  1006	 * @pt_list:          List of used page tables. Used for s390 and x86.
  1007	 * @_pt_pad_1:        Padding that aliases with page's compound head.
  1008	 * @pmd_huge_pte:     Protected by ptdesc->ptl, used for THPs.
  1009	 * @__page_mapping:   Aliases with page->mapping. Unused for page tables.
  1010	 * @pt_mm:            Used for x86 pgds.
  1011	 * @pt_frag_refcount: For fragmented page table tracking. Powerpc and s390 only.
  1012	 * @_pt_pad_2:        Padding to ensure proper alignment.
  1013	 * @ptl:              Lock for the page table.
  1014	 * @__page_type:      Same as page->page_type. Unused for page tables.
  1015	 * @_refcount:        Same as page refcount. Used for s390 page tables.
  1016	 * @pt_memcg_data:    Memcg data. Tracked for page tables here.
  1017	 *
  1018	 * This struct overlays struct page for now. Do not modify without a good
  1019	 * understanding of the issues.
  1020	 */
  1021	struct ptdesc {
  1022		unsigned long __page_flags;
  1023	
  1024		union {
  1025			struct rcu_head pt_rcu_head;
  1026			struct list_head pt_list;
  1027			struct {
  1028				unsigned long _pt_pad_1;
  1029				pgtable_t pmd_huge_pte;
  1030			};
  1031		};
  1032		unsigned long __page_mapping;
  1033	
  1034		union {
  1035			struct mm_struct *pt_mm;
  1036			atomic_t pt_frag_refcount;
  1037		};
  1038	
  1039		union {
  1040			unsigned long _pt_pad_2;
> 1041	#if ALLOC_SPLIT_PTLOCKS
  1042			spinlock_t *ptl;
  1043	#else
  1044			spinlock_t ptl;
  1045	#endif
  1046		};
  1047		unsigned int __page_type;
  1048		atomic_t _refcount;
  1049	#ifdef CONFIG_MEMCG
  1050		unsigned long pt_memcg_data;
  1051	#endif
  1052	};
  1053	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
