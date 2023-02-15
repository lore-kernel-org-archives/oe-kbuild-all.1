Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5D0B7B
	for <oe-kbuild-all@lists.linux.dev>; Wed, 15 Feb 2023 18:16:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676484964; x=1708020964;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=pEvqDKiiCcIm7EK/HayHRUz8QCGN9fGPC9UJij9G9ys=;
  b=g8wbMmQmFFWayUHavhCats1xgH478hiNjSvg2BVlh4IRzA0NRTTh15Ci
   vKnPqiR+kMDsZciejauHFk0kvcEHNEaPqEulg3v4Pk5oARkxZiQr8QhsW
   ZdbO60zek7TDNExLYGQEUphtySlTPTnj79A7c8AeDZV395dDm4Fr6mxPZ
   RW2wGJE4N9ZdqXMVfTCBml0ZvoHxPCMQ6qkgCw64wBKQmY8rHxZK3OfU1
   gCGZbLeUeMByVuGKhqYOyYN+/RKfKlsLQrw4EtteMO7lTWljivfy32cit
   uYUFQ/sVDw7zwmimH30IHmX6Yr6ILpZe7qZG4IIhoAlKVmWLUQGc1xXyX
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10622"; a="417723639"
X-IronPort-AV: E=Sophos;i="5.97,300,1669104000"; 
   d="scan'208";a="417723639"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Feb 2023 10:16:01 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10622"; a="663092150"
X-IronPort-AV: E=Sophos;i="5.97,300,1669104000"; 
   d="scan'208";a="663092150"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 15 Feb 2023 10:15:59 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pSMJy-0009eL-1S;
	Wed, 15 Feb 2023 18:15:58 +0000
Date: Thu, 16 Feb 2023 02:15:51 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH 07/16] drm/ttm: Reduce the number of used allocation
 orders for TTM pages
Message-ID: <202302160200.e1ivYOxh-lkp@intel.com>
References: <20230215161405.187368-8-thomas.hellstrom@linux.intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230215161405.187368-8-thomas.hellstrom@linux.intel.com>

Hi Thomas,

[FYI, it's a private test report for your RFC patch.]
[auto build test WARNING on drm-misc/drm-misc-next]
[also build test WARNING on drm-intel/for-linux-next]
[cannot apply to drm-intel/for-linux-next-fixes linus/master v6.2-rc8]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Thomas-Hellstr-m/drm-ttm-Fix-a-NULL-pointer-dereference/20230216-001727
base:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
patch link:    https://lore.kernel.org/r/20230215161405.187368-8-thomas.hellstrom%40linux.intel.com
patch subject: [RFC PATCH 07/16] drm/ttm: Reduce the number of used allocation orders for TTM pages
config: powerpc-allyesconfig (https://download.01.org/0day-ci/archive/20230216/202302160200.e1ivYOxh-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/4925cefe2ad6e10e768cebed1a78bfde13199195
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Thomas-Hellstr-m/drm-ttm-Fix-a-NULL-pointer-dereference/20230216-001727
        git checkout 4925cefe2ad6e10e768cebed1a78bfde13199195
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=powerpc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=powerpc SHELL=/bin/bash drivers/gpu/drm/ttm/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302160200.e1ivYOxh-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from arch/powerpc/include/asm/page.h:256,
                    from arch/powerpc/include/asm/thread_info.h:13,
                    from include/linux/thread_info.h:60,
                    from arch/powerpc/include/asm/ptrace.h:342,
                    from arch/powerpc/include/asm/hw_irq.h:12,
                    from arch/powerpc/include/asm/irqflags.h:12,
                    from include/linux/irqflags.h:16,
                    from include/asm-generic/cmpxchg-local.h:6,
                    from arch/powerpc/include/asm/cmpxchg.h:755,
                    from arch/powerpc/include/asm/atomic.h:11,
                    from include/linux/atomic.h:7,
                    from include/linux/mm_types_task.h:13,
                    from include/linux/mm_types.h:5,
                    from include/linux/buildid.h:5,
                    from include/linux/module.h:14,
                    from drivers/gpu/drm/ttm/ttm_pool.c:36:
>> arch/powerpc/include/asm/page_32.h:58:26: warning: "__builtin_ffs" is not defined, evaluates to 0 [-Wundef]
      58 | #define PTE_T_LOG2      (__builtin_ffs(sizeof(pte_t)) - 1)
         |                          ^~~~~~~~~~~~~
   arch/powerpc/include/asm/page_32.h:23:39: note: in expansion of macro 'PTE_T_LOG2'
      23 | #define PTE_SHIFT       (PAGE_SHIFT - PTE_T_LOG2)       /* full page */
         |                                       ^~~~~~~~~~
   arch/powerpc/include/asm/book3s/32/pgtable.h:120:25: note: in expansion of macro 'PTE_SHIFT'
     120 | #define PTE_INDEX_SIZE  PTE_SHIFT
         |                         ^~~~~~~~~
   arch/powerpc/include/asm/book3s/32/pgtable.h:152:39: note: in expansion of macro 'PTE_INDEX_SIZE'
     152 | #define PGDIR_SHIFT     (PAGE_SHIFT + PTE_INDEX_SIZE)
         |                                       ^~~~~~~~~~~~~~
   include/asm-generic/pgtable-nop4d.h:11:33: note: in expansion of macro 'PGDIR_SHIFT'
      11 | #define P4D_SHIFT               PGDIR_SHIFT
         |                                 ^~~~~~~~~~~
   include/asm-generic/pgtable-nopud.h:18:25: note: in expansion of macro 'P4D_SHIFT'
      18 | #define PUD_SHIFT       P4D_SHIFT
         |                         ^~~~~~~~~
   include/asm-generic/pgtable-nopmd.h:20:25: note: in expansion of macro 'PUD_SHIFT'
      20 | #define PMD_SHIFT       PUD_SHIFT
         |                         ^~~~~~~~~
   drivers/gpu/drm/ttm/ttm_pool.c:52:24: note: in expansion of macro 'PMD_SHIFT'
      52 | #define TTM_MAX_ORDER (PMD_SHIFT - PAGE_SHIFT)
         |                        ^~~~~~~~~
   drivers/gpu/drm/ttm/ttm_pool.c:54:6: note: in expansion of macro 'TTM_MAX_ORDER'
      54 | #if (TTM_MAX_ORDER < TTM_64K_ORDER)
         |      ^~~~~~~~~~~~~
   arch/powerpc/include/asm/page_32.h:58:39: error: missing binary operator before token "("
      58 | #define PTE_T_LOG2      (__builtin_ffs(sizeof(pte_t)) - 1)
         |                                       ^
   arch/powerpc/include/asm/page_32.h:23:39: note: in expansion of macro 'PTE_T_LOG2'
      23 | #define PTE_SHIFT       (PAGE_SHIFT - PTE_T_LOG2)       /* full page */
         |                                       ^~~~~~~~~~
   arch/powerpc/include/asm/book3s/32/pgtable.h:120:25: note: in expansion of macro 'PTE_SHIFT'
     120 | #define PTE_INDEX_SIZE  PTE_SHIFT
         |                         ^~~~~~~~~
   arch/powerpc/include/asm/book3s/32/pgtable.h:152:39: note: in expansion of macro 'PTE_INDEX_SIZE'
     152 | #define PGDIR_SHIFT     (PAGE_SHIFT + PTE_INDEX_SIZE)
         |                                       ^~~~~~~~~~~~~~
   include/asm-generic/pgtable-nop4d.h:11:33: note: in expansion of macro 'PGDIR_SHIFT'
      11 | #define P4D_SHIFT               PGDIR_SHIFT
         |                                 ^~~~~~~~~~~
   include/asm-generic/pgtable-nopud.h:18:25: note: in expansion of macro 'P4D_SHIFT'
      18 | #define PUD_SHIFT       P4D_SHIFT
         |                         ^~~~~~~~~
   include/asm-generic/pgtable-nopmd.h:20:25: note: in expansion of macro 'PUD_SHIFT'
      20 | #define PMD_SHIFT       PUD_SHIFT
         |                         ^~~~~~~~~
   drivers/gpu/drm/ttm/ttm_pool.c:52:24: note: in expansion of macro 'PMD_SHIFT'
      52 | #define TTM_MAX_ORDER (PMD_SHIFT - PAGE_SHIFT)
         |                        ^~~~~~~~~
   drivers/gpu/drm/ttm/ttm_pool.c:54:6: note: in expansion of macro 'TTM_MAX_ORDER'
      54 | #if (TTM_MAX_ORDER < TTM_64K_ORDER)
         |      ^~~~~~~~~~~~~
>> arch/powerpc/include/asm/page_32.h:58:26: warning: "__builtin_ffs" is not defined, evaluates to 0 [-Wundef]
      58 | #define PTE_T_LOG2      (__builtin_ffs(sizeof(pte_t)) - 1)
         |                          ^~~~~~~~~~~~~
   arch/powerpc/include/asm/page_32.h:23:39: note: in expansion of macro 'PTE_T_LOG2'
      23 | #define PTE_SHIFT       (PAGE_SHIFT - PTE_T_LOG2)       /* full page */
         |                                       ^~~~~~~~~~
   arch/powerpc/include/asm/book3s/32/pgtable.h:120:25: note: in expansion of macro 'PTE_SHIFT'
     120 | #define PTE_INDEX_SIZE  PTE_SHIFT
         |                         ^~~~~~~~~
   arch/powerpc/include/asm/book3s/32/pgtable.h:152:39: note: in expansion of macro 'PTE_INDEX_SIZE'
     152 | #define PGDIR_SHIFT     (PAGE_SHIFT + PTE_INDEX_SIZE)
         |                                       ^~~~~~~~~~~~~~
   include/asm-generic/pgtable-nop4d.h:11:33: note: in expansion of macro 'PGDIR_SHIFT'
      11 | #define P4D_SHIFT               PGDIR_SHIFT
         |                                 ^~~~~~~~~~~
   include/asm-generic/pgtable-nopud.h:18:25: note: in expansion of macro 'P4D_SHIFT'
      18 | #define PUD_SHIFT       P4D_SHIFT
         |                         ^~~~~~~~~
   include/asm-generic/pgtable-nopmd.h:20:25: note: in expansion of macro 'PUD_SHIFT'
      20 | #define PMD_SHIFT       PUD_SHIFT
         |                         ^~~~~~~~~
   drivers/gpu/drm/ttm/ttm_pool.c:52:24: note: in expansion of macro 'PMD_SHIFT'
      52 | #define TTM_MAX_ORDER (PMD_SHIFT - PAGE_SHIFT)
         |                        ^~~~~~~~~
   drivers/gpu/drm/ttm/ttm_pool.c:58:24: note: in expansion of macro 'TTM_MAX_ORDER'
      58 | #if ((MAX_ORDER - 1) < TTM_MAX_ORDER)
         |                        ^~~~~~~~~~~~~
   arch/powerpc/include/asm/page_32.h:58:39: error: missing binary operator before token "("
      58 | #define PTE_T_LOG2      (__builtin_ffs(sizeof(pte_t)) - 1)
         |                                       ^
   arch/powerpc/include/asm/page_32.h:23:39: note: in expansion of macro 'PTE_T_LOG2'
      23 | #define PTE_SHIFT       (PAGE_SHIFT - PTE_T_LOG2)       /* full page */
         |                                       ^~~~~~~~~~
   arch/powerpc/include/asm/book3s/32/pgtable.h:120:25: note: in expansion of macro 'PTE_SHIFT'
     120 | #define PTE_INDEX_SIZE  PTE_SHIFT
         |                         ^~~~~~~~~
   arch/powerpc/include/asm/book3s/32/pgtable.h:152:39: note: in expansion of macro 'PTE_INDEX_SIZE'
     152 | #define PGDIR_SHIFT     (PAGE_SHIFT + PTE_INDEX_SIZE)
         |                                       ^~~~~~~~~~~~~~
   include/asm-generic/pgtable-nop4d.h:11:33: note: in expansion of macro 'PGDIR_SHIFT'
      11 | #define P4D_SHIFT               PGDIR_SHIFT
         |                                 ^~~~~~~~~~~
   include/asm-generic/pgtable-nopud.h:18:25: note: in expansion of macro 'P4D_SHIFT'
      18 | #define PUD_SHIFT       P4D_SHIFT
         |                         ^~~~~~~~~
   include/asm-generic/pgtable-nopmd.h:20:25: note: in expansion of macro 'PUD_SHIFT'
      20 | #define PMD_SHIFT       PUD_SHIFT
         |                         ^~~~~~~~~
   drivers/gpu/drm/ttm/ttm_pool.c:52:24: note: in expansion of macro 'PMD_SHIFT'
      52 | #define TTM_MAX_ORDER (PMD_SHIFT - PAGE_SHIFT)
         |                        ^~~~~~~~~
   drivers/gpu/drm/ttm/ttm_pool.c:58:24: note: in expansion of macro 'TTM_MAX_ORDER'
      58 | #if ((MAX_ORDER - 1) < TTM_MAX_ORDER)
         |                        ^~~~~~~~~~~~~


vim +/__builtin_ffs +58 arch/powerpc/include/asm/page_32.h

5cd16ee934eafc include/asm-powerpc/page_32.h      Michael Ellerman 2005-11-11  56  
ca9153a3a2a755 arch/powerpc/include/asm/page_32.h Ilya Yanok       2008-12-11  57  #define PGD_T_LOG2	(__builtin_ffs(sizeof(pgd_t)) - 1)
ca9153a3a2a755 arch/powerpc/include/asm/page_32.h Ilya Yanok       2008-12-11 @58  #define PTE_T_LOG2	(__builtin_ffs(sizeof(pte_t)) - 1)
ca9153a3a2a755 arch/powerpc/include/asm/page_32.h Ilya Yanok       2008-12-11  59  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
