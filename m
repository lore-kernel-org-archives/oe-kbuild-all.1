Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 968371AA83
	for <oe-kbuild-all@lists.linux.dev>; Wed,  9 Aug 2023 16:05:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691597111; x=1723133111;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=g/eO+MP+6x0vryMNGbbHV2zTpXRHiC80RiYyjlHcxGE=;
  b=j3ZT+9bt0ugtm396axIfJg09OiITBqZKv/x2j565nE9okmCkYOopLhYP
   vSFIvDhk/je4MWfsEnLc4wn0yGCCzVK4ZOl47tqebIyeyIxX1jAYqo4ZA
   GaRpUf5I6rqYjRS7AZQc1kyS63EBM/yJeWYOpNVDy1Q88IGzKoMNNrLSh
   X99Y8VmuO0f0Sn1WHS+jCD4BYgTcDbxqto6EEnvGYTgNzOTQjU37oblgo
   +NHf1VGU8qWjpHDltT5sksH2DrnTR1sPwZW4GN9Y1DvQeuh3l0vQDR1cW
   iMSFlcI7elVWudVlRF6aW2xQPWGIes25G5Ybm4ftJEx37XcxmjJLOliv2
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10797"; a="356128822"
X-IronPort-AV: E=Sophos;i="6.01,159,1684825200"; 
   d="scan'208";a="356128822"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Aug 2023 09:04:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10797"; a="731872895"
X-IronPort-AV: E=Sophos;i="6.01,159,1684825200"; 
   d="scan'208";a="731872895"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 09 Aug 2023 09:04:37 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qTlfp-0006E6-0T;
	Wed, 09 Aug 2023 16:04:37 +0000
Date: Thu, 10 Aug 2023 00:03:59 +0800
From: kernel test robot <lkp@intel.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [arm-integrator:virt-to-pfn-v6.5-rc1 11/12]
 arch/s390/include/asm/kfence.h:38:41: warning: passing argument 1 of
 'virt_to_pfn' makes pointer from integer without a cast
Message-ID: <202308100008.hyCH3AaH-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-integrator.git virt-to-pfn-v6.5-rc1
head:   b6a25d37eca4850c246b94d73bd2e3c75860d265
commit: b8edce3ddc7647f7d66a7d322afe9954fa707ee8 [11/12] s390/mm: Make virt_to_pfn() a static inline
config: s390-randconfig-r004-20230809 (https://download.01.org/0day-ci/archive/20230810/202308100008.hyCH3AaH-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230810/202308100008.hyCH3AaH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308100008.hyCH3AaH-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from arch/s390/include/asm/page.h:210,
                    from arch/s390/include/asm/thread_info.h:31,
                    from include/linux/thread_info.h:60,
                    from arch/s390/include/asm/preempt.h:6,
                    from include/linux/preempt.h:79,
                    from include/linux/spinlock.h:56,
                    from include/linux/mmzone.h:8,
                    from include/linux/gfp.h:7,
                    from include/linux/mm.h:7,
                    from include/linux/hugetlb.h:5,
                    from arch/s390/mm/pageattr.c:6:
   arch/s390/include/asm/kfence.h: In function 'kfence_protect_page':
>> arch/s390/include/asm/kfence.h:38:41: warning: passing argument 1 of 'virt_to_pfn' makes pointer from integer without a cast [-Wint-conversion]
      38 |         __kernel_map_pages(virt_to_page(addr), 1, !protect);
         |                                         ^~~~
         |                                         |
         |                                         long unsigned int
   include/asm-generic/memory_model.h:37:45: note: in definition of macro '__pfn_to_page'
      37 | #define __pfn_to_page(pfn)      (vmemmap + (pfn))
         |                                             ^~~
   arch/s390/include/asm/kfence.h:38:28: note: in expansion of macro 'virt_to_page'
      38 |         __kernel_map_pages(virt_to_page(addr), 1, !protect);
         |                            ^~~~~~~~~~~~
   arch/s390/include/asm/page.h:195:53: note: expected 'const void *' but argument is of type 'long unsigned int'
     195 | static inline unsigned long virt_to_pfn(const void *kaddr)
         |                                         ~~~~~~~~~~~~^~~~~
--
   arch/s390/mm/cmm.c: In function 'cmm_alloc_pages':
>> arch/s390/mm/cmm.c:93:42: warning: passing argument 1 of 'virt_to_pfn' makes pointer from integer without a cast [-Wint-conversion]
      93 |                 diag10_range(virt_to_pfn(addr), 1);
         |                                          ^~~~
         |                                          |
         |                                          long unsigned int
   In file included from arch/s390/include/asm/thread_info.h:31,
                    from include/linux/thread_info.h:60,
                    from arch/s390/include/asm/preempt.h:6,
                    from include/linux/preempt.h:79,
                    from include/linux/spinlock.h:56,
                    from include/linux/wait.h:9,
                    from include/linux/wait_bit.h:8,
                    from include/linux/fs.h:6,
                    from arch/s390/mm/cmm.c:11:
   arch/s390/include/asm/page.h:195:53: note: expected 'const void *' but argument is of type 'long unsigned int'
     195 | static inline unsigned long virt_to_pfn(const void *kaddr)
         |                                         ~~~~~~~~~~~~^~~~~
--
   In file included from include/linux/export.h:5,
                    from include/linux/linkage.h:7,
                    from include/linux/preempt.h:10,
                    from include/linux/spinlock.h:56,
                    from include/linux/mmzone.h:8,
                    from include/linux/memory_hotplug.h:5,
                    from arch/s390/mm/vmem.c:6:
   arch/s390/mm/vmem.c: In function 'vmem_free_pages':
>> arch/s390/mm/vmem.c:39:52: warning: passing argument 1 of 'virt_to_pfn' makes pointer from integer without a cast [-Wint-conversion]
      39 |             WARN_ON_ONCE(PageReserved(virt_to_page(addr))))
         |                                                    ^~~~
         |                                                    |
         |                                                    long unsigned int
   include/linux/compiler.h:57:52: note: in definition of macro '__trace_if_var'
      57 | #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
         |                                                    ^~~~
   arch/s390/mm/vmem.c:38:9: note: in expansion of macro 'if'
      38 |         if (!slab_is_available() ||
         |         ^~
   include/asm-generic/bug.h:181:33: note: in expansion of macro 'WARN_ON'
     181 | #define WARN_ON_ONCE(condition) WARN_ON(condition)
         |                                 ^~~~~~~
   arch/s390/mm/vmem.c:39:13: note: in expansion of macro 'WARN_ON_ONCE'
      39 |             WARN_ON_ONCE(PageReserved(virt_to_page(addr))))
         |             ^~~~~~~~~~~~
   include/asm-generic/memory_model.h:65:21: note: in expansion of macro '__pfn_to_page'
      65 | #define pfn_to_page __pfn_to_page
         |                     ^~~~~~~~~~~~~
   arch/s390/mm/vmem.c:39:39: note: in expansion of macro 'virt_to_page'
      39 |             WARN_ON_ONCE(PageReserved(virt_to_page(addr))))
         |                                       ^~~~~~~~~~~~
   In file included from arch/s390/include/asm/thread_info.h:31,
                    from include/linux/thread_info.h:60,
                    from arch/s390/include/asm/preempt.h:6,
                    from include/linux/preempt.h:79:
   arch/s390/include/asm/page.h:195:53: note: expected 'const void *' but argument is of type 'long unsigned int'
     195 | static inline unsigned long virt_to_pfn(const void *kaddr)
         |                                         ~~~~~~~~~~~~^~~~~
>> arch/s390/mm/vmem.c:39:52: warning: passing argument 1 of 'virt_to_pfn' makes pointer from integer without a cast [-Wint-conversion]
      39 |             WARN_ON_ONCE(PageReserved(virt_to_page(addr))))
         |                                                    ^~~~
         |                                                    |
         |                                                    long unsigned int
   include/linux/compiler.h:57:61: note: in definition of macro '__trace_if_var'
      57 | #define __trace_if_var(cond) (__builtin_constant_p(cond) ? (cond) : __trace_if_value(cond))
         |                                                             ^~~~
   arch/s390/mm/vmem.c:38:9: note: in expansion of macro 'if'
      38 |         if (!slab_is_available() ||
         |         ^~
   include/asm-generic/bug.h:181:33: note: in expansion of macro 'WARN_ON'
     181 | #define WARN_ON_ONCE(condition) WARN_ON(condition)
         |                                 ^~~~~~~
   arch/s390/mm/vmem.c:39:13: note: in expansion of macro 'WARN_ON_ONCE'
      39 |             WARN_ON_ONCE(PageReserved(virt_to_page(addr))))
         |             ^~~~~~~~~~~~
   include/asm-generic/memory_model.h:65:21: note: in expansion of macro '__pfn_to_page'
      65 | #define pfn_to_page __pfn_to_page
         |                     ^~~~~~~~~~~~~
   arch/s390/mm/vmem.c:39:39: note: in expansion of macro 'virt_to_page'
      39 |             WARN_ON_ONCE(PageReserved(virt_to_page(addr))))
         |                                       ^~~~~~~~~~~~
   arch/s390/include/asm/page.h:195:53: note: expected 'const void *' but argument is of type 'long unsigned int'
     195 | static inline unsigned long virt_to_pfn(const void *kaddr)
         |                                         ~~~~~~~~~~~~^~~~~
>> arch/s390/mm/vmem.c:39:52: warning: passing argument 1 of 'virt_to_pfn' makes pointer from integer without a cast [-Wint-conversion]
      39 |             WARN_ON_ONCE(PageReserved(virt_to_page(addr))))
         |                                                    ^~~~
         |                                                    |
         |                                                    long unsigned int
   include/linux/compiler.h:68:10: note: in definition of macro '__trace_if_value'
      68 |         (cond) ?                                        \
         |          ^~~~
   include/linux/compiler.h:55:28: note: in expansion of macro '__trace_if_var'
      55 | #define if(cond, ...) if ( __trace_if_var( !!(cond , ## __VA_ARGS__) ) )
         |                            ^~~~~~~~~~~~~~
   arch/s390/mm/vmem.c:38:9: note: in expansion of macro 'if'
      38 |         if (!slab_is_available() ||
         |         ^~
   include/asm-generic/bug.h:181:33: note: in expansion of macro 'WARN_ON'
     181 | #define WARN_ON_ONCE(condition) WARN_ON(condition)
         |                                 ^~~~~~~
   arch/s390/mm/vmem.c:39:13: note: in expansion of macro 'WARN_ON_ONCE'
      39 |             WARN_ON_ONCE(PageReserved(virt_to_page(addr))))
         |             ^~~~~~~~~~~~
   include/asm-generic/memory_model.h:65:21: note: in expansion of macro '__pfn_to_page'
      65 | #define pfn_to_page __pfn_to_page
         |                     ^~~~~~~~~~~~~
   arch/s390/mm/vmem.c:39:39: note: in expansion of macro 'virt_to_page'
      39 |             WARN_ON_ONCE(PageReserved(virt_to_page(addr))))
         |                                       ^~~~~~~~~~~~
   arch/s390/include/asm/page.h:195:53: note: expected 'const void *' but argument is of type 'long unsigned int'
     195 | static inline unsigned long virt_to_pfn(const void *kaddr)
         |                                         ~~~~~~~~~~~~^~~~~


vim +/virt_to_pfn +38 arch/s390/include/asm/kfence.h

e41ba1115a351d Sven Schnelle 2021-07-28  35  
e41ba1115a351d Sven Schnelle 2021-07-28  36  static inline bool kfence_protect_page(unsigned long addr, bool protect)
e41ba1115a351d Sven Schnelle 2021-07-28  37  {
e41ba1115a351d Sven Schnelle 2021-07-28 @38  	__kernel_map_pages(virt_to_page(addr), 1, !protect);
e41ba1115a351d Sven Schnelle 2021-07-28  39  	return true;
e41ba1115a351d Sven Schnelle 2021-07-28  40  }
e41ba1115a351d Sven Schnelle 2021-07-28  41  

:::::: The code at line 38 was first introduced by commit
:::::: e41ba1115a351dd037c21ac75660638219d51485 s390: add support for KFENCE

:::::: TO: Sven Schnelle <svens@linux.ibm.com>
:::::: CC: Heiko Carstens <hca@linux.ibm.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
