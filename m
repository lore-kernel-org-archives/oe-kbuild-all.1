Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C84D1C26
	for <oe-kbuild-all@lists.linux.dev>; Sun,  6 Aug 2023 05:43:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691300584; x=1722836584;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=4eEh3Of/i1CYwdfoZgh7UoCjO1J0dZ1tchZLzh3M38s=;
  b=d4O9Nk1HNcfw71Cfx2mYzzu+7VsDdM2S2955cMKHGStuFvM8XFgjWCBD
   gOXQa42h/i7fswh2TxRwaDCOtbuT4u1BmV2kEn7Z1OmLg/pt32RvbUUCa
   OGyKYk7rRkxWSh/qBQdfWH1z6GKNYdY2bSmGHAcCiCx+IuEnr88HgIiSe
   th28DZBbk++PadMyrioehmBFP90xS72rMfM0T73y4x6x9LOO4wnryiT9a
   NCxXAATcLgmFNFUTDKa2mDq/2mjoVxoPkHji2xjIEmuvMKWmXTqNZ30Sf
   ksZyhrwLiSLFyPXHewDy2c/U9K4AQ+95j83FC0MbR45/D8LhHRWY8JiXP
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10793"; a="360426952"
X-IronPort-AV: E=Sophos;i="6.01,259,1684825200"; 
   d="scan'208";a="360426952"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Aug 2023 22:43:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10793"; a="1061217286"
X-IronPort-AV: E=Sophos;i="6.01,259,1684825200"; 
   d="scan'208";a="1061217286"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 05 Aug 2023 22:43:01 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qSWXc-000435-2a;
	Sun, 06 Aug 2023 05:43:00 +0000
Date: Sun, 6 Aug 2023 13:42:23 +0800
From: kernel test robot <lkp@intel.com>
To: "Vishal Moola (Oracle)" <vishal.moola@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Andrew Morton <akpm@linux-foundation.org>
Subject: [linux-next:master 6109/6443] include/linux/pgtable.h:1044:17:
 error: unknown type name 'spinlock_t'
Message-ID: <202308061331.VqEtceSZ-lkp@intel.com>
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
config: xtensa-nommu_kc705_defconfig (https://download.01.org/0day-ci/archive/20230806/202308061331.VqEtceSZ-lkp@intel.com/config)
compiler: xtensa-de212-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230806/202308061331.VqEtceSZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308061331.VqEtceSZ-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/xtensa/include/asm/io.h:19,
                    from include/linux/io.h:13,
                    from lib/iomap_copy.c:7:
   include/linux/pgtable.h:1041:5: warning: "ALLOC_SPLIT_PTLOCKS" is not defined, evaluates to 0 [-Wundef]
    1041 | #if ALLOC_SPLIT_PTLOCKS
         |     ^~~~~~~~~~~~~~~~~~~
>> include/linux/pgtable.h:1044:17: error: unknown type name 'spinlock_t'
    1044 |                 spinlock_t ptl;
         |                 ^~~~~~~~~~
   In file included from include/linux/init.h:5,
                    from include/linux/io.h:10:
>> include/linux/stddef.h:16:33: error: invalid use of undefined type 'struct page'
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
>> include/linux/stddef.h:16:33: error: expression in static assertion is not an integer
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
>> include/linux/stddef.h:16:33: error: invalid use of undefined type 'struct page'
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
>> include/linux/stddef.h:16:33: error: expression in static assertion is not an integer
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
>> include/linux/stddef.h:16:33: error: invalid use of undefined type 'struct page'
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
>> include/linux/stddef.h:16:33: error: expression in static assertion is not an integer
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
>> include/linux/stddef.h:16:33: error: invalid use of undefined type 'struct page'
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
   include/linux/pgtable.h:1059:1: note: in expansion of macro 'TABLE_MATCH'
    1059 | TABLE_MATCH(pmd_huge_pte, pmd_huge_pte);
         | ^~~~~~~~~~~
>> include/linux/stddef.h:16:33: error: expression in static assertion is not an integer
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
   include/linux/pgtable.h:1059:1: note: in expansion of macro 'TABLE_MATCH'
    1059 | TABLE_MATCH(pmd_huge_pte, pmd_huge_pte);
         | ^~~~~~~~~~~
>> include/linux/stddef.h:16:33: error: invalid use of undefined type 'struct page'
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
   include/linux/pgtable.h:1060:1: note: in expansion of macro 'TABLE_MATCH'
    1060 | TABLE_MATCH(mapping, __page_mapping);
         | ^~~~~~~~~~~
>> include/linux/stddef.h:16:33: error: expression in static assertion is not an integer
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
   include/linux/pgtable.h:1060:1: note: in expansion of macro 'TABLE_MATCH'
    1060 | TABLE_MATCH(mapping, __page_mapping);
         | ^~~~~~~~~~~
>> include/linux/stddef.h:16:33: error: invalid use of undefined type 'struct page'
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
   include/linux/pgtable.h:1061:1: note: in expansion of macro 'TABLE_MATCH'
    1061 | TABLE_MATCH(pt_mm, pt_mm);
         | ^~~~~~~~~~~
>> include/linux/stddef.h:16:33: error: expression in static assertion is not an integer
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
   include/linux/pgtable.h:1061:1: note: in expansion of macro 'TABLE_MATCH'
    1061 | TABLE_MATCH(pt_mm, pt_mm);
         | ^~~~~~~~~~~
>> include/linux/stddef.h:16:33: error: invalid use of undefined type 'struct page'
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
   include/linux/pgtable.h:1062:1: note: in expansion of macro 'TABLE_MATCH'
    1062 | TABLE_MATCH(ptl, ptl);
         | ^~~~~~~~~~~
>> include/linux/stddef.h:16:33: error: expression in static assertion is not an integer
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
   include/linux/pgtable.h:1062:1: note: in expansion of macro 'TABLE_MATCH'
    1062 | TABLE_MATCH(ptl, ptl);
         | ^~~~~~~~~~~
>> include/linux/stddef.h:16:33: error: invalid use of undefined type 'struct page'
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
   include/linux/pgtable.h:1063:1: note: in expansion of macro 'TABLE_MATCH'
    1063 | TABLE_MATCH(rcu_head, pt_rcu_head);
         | ^~~~~~~~~~~
>> include/linux/stddef.h:16:33: error: expression in static assertion is not an integer
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
   include/linux/pgtable.h:1063:1: note: in expansion of macro 'TABLE_MATCH'
    1063 | TABLE_MATCH(rcu_head, pt_rcu_head);
         | ^~~~~~~~~~~
>> include/linux/stddef.h:16:33: error: invalid use of undefined type 'struct page'
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
   include/linux/pgtable.h:1064:1: note: in expansion of macro 'TABLE_MATCH'
    1064 | TABLE_MATCH(page_type, __page_type);
         | ^~~~~~~~~~~
>> include/linux/stddef.h:16:33: error: expression in static assertion is not an integer
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
   include/linux/pgtable.h:1064:1: note: in expansion of macro 'TABLE_MATCH'
    1064 | TABLE_MATCH(page_type, __page_type);
         | ^~~~~~~~~~~
>> include/linux/stddef.h:16:33: error: invalid use of undefined type 'struct page'
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
   include/linux/pgtable.h:1065:1: note: in expansion of macro 'TABLE_MATCH'
    1065 | TABLE_MATCH(_refcount, _refcount);
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
   include/linux/pgtable.h:1065:1: note: in expansion of macro 'TABLE_MATCH'
    1065 | TABLE_MATCH(_refcount, _refcount);
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
   include/linux/pgtable.h:1067:1: note: in expansion of macro 'TABLE_MATCH'
    1067 | TABLE_MATCH(memcg_data, pt_memcg_data);
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
   include/linux/pgtable.h:1067:1: note: in expansion of macro 'TABLE_MATCH'
    1067 | TABLE_MATCH(memcg_data, pt_memcg_data);
         | ^~~~~~~~~~~
   include/linux/pgtable.h:1070:47: error: invalid application of 'sizeof' to incomplete type 'struct page'
    1070 | static_assert(sizeof(struct ptdesc) <= sizeof(struct page));
         |                                               ^~~~~~
   include/linux/build_bug.h:78:56: note: in definition of macro '__static_assert'
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                                        ^~~~
   include/linux/pgtable.h:1070:1: note: in expansion of macro 'static_assert'
    1070 | static_assert(sizeof(struct ptdesc) <= sizeof(struct page));
         | ^~~~~~~~~~~~~
   include/linux/pgtable.h:1070:15: error: expression in static assertion is not an integer
    1070 | static_assert(sizeof(struct ptdesc) <= sizeof(struct page));
         |               ^~~~~~
   include/linux/build_bug.h:78:56: note: in definition of macro '__static_assert'
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                                        ^~~~
   include/linux/pgtable.h:1070:1: note: in expansion of macro 'static_assert'
    1070 | static_assert(sizeof(struct ptdesc) <= sizeof(struct page));
         | ^~~~~~~~~~~~~


vim +/spinlock_t +1044 include/linux/pgtable.h

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
  1041	#if ALLOC_SPLIT_PTLOCKS
  1042			spinlock_t *ptl;
  1043	#else
> 1044			spinlock_t ptl;
  1045	#endif
  1046		};
  1047		unsigned int __page_type;
  1048		atomic_t _refcount;
  1049	#ifdef CONFIG_MEMCG
  1050		unsigned long pt_memcg_data;
  1051	#endif
  1052	};
  1053	
  1054	#define TABLE_MATCH(pg, pt)						\
  1055		static_assert(offsetof(struct page, pg) == offsetof(struct ptdesc, pt))
  1056	TABLE_MATCH(flags, __page_flags);
  1057	TABLE_MATCH(compound_head, pt_list);
  1058	TABLE_MATCH(compound_head, _pt_pad_1);
  1059	TABLE_MATCH(pmd_huge_pte, pmd_huge_pte);
  1060	TABLE_MATCH(mapping, __page_mapping);
  1061	TABLE_MATCH(pt_mm, pt_mm);
  1062	TABLE_MATCH(ptl, ptl);
  1063	TABLE_MATCH(rcu_head, pt_rcu_head);
  1064	TABLE_MATCH(page_type, __page_type);
  1065	TABLE_MATCH(_refcount, _refcount);
  1066	#ifdef CONFIG_MEMCG
  1067	TABLE_MATCH(memcg_data, pt_memcg_data);
  1068	#endif
  1069	#undef TABLE_MATCH
> 1070	static_assert(sizeof(struct ptdesc) <= sizeof(struct page));
  1071	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
