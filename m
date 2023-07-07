Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD405171C7
	for <oe-kbuild-all@lists.linux.dev>; Fri,  7 Jul 2023 21:35:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1688765713; x=1720301713;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=RmiOi0QsdcR17oq96/K9yrDYl+SxD4+ZTwQN/gQQnLQ=;
  b=a1+EKk6hHZm03BcEyPJly4QNlEolE55KHt8+Qmqkrm0YZdYoC1BD1YQy
   R42T3Apr0jMTh+i3URjt8mw0Qac+sWCeY/DLl98mFyihO2oyUYA2eDhSd
   R2u+0WlBtGRAv+2RphFTE6hw9UUaD80RpGsw6BQbXBfm7yuUvUsF1TWDu
   Hf33X3Vz6MP2WhvIxnK5DxMS+KLmb1OaENeHKyajoyOnceNWwl3X6y+6t
   SiSfhMZKhfj6mDXy4RslCpi6Pik3HNR1XUA8YgsQXB2Huf9TEe63mxco+
   3guFhTbkpFre1A/39FmERQvzRkM8oVck3nalyJVMwZJvGJ2FxSDcVVo6n
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10764"; a="450344279"
X-IronPort-AV: E=Sophos;i="6.01,189,1684825200"; 
   d="scan'208";a="450344279"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jul 2023 14:35:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10764"; a="810170357"
X-IronPort-AV: E=Sophos;i="6.01,189,1684825200"; 
   d="scan'208";a="810170357"
Received: from lkp-server01.sh.intel.com (HELO c544d7fc5005) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 07 Jul 2023 14:35:11 -0700
Received: from kbuild by c544d7fc5005 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qHt6c-0002Ju-1g;
	Fri, 07 Jul 2023 21:35:10 +0000
Date: Sat, 8 Jul 2023 05:34:49 +0800
From: kernel test robot <lkp@intel.com>
To: Matthew Wilcox <willy@infradead.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [willy-pagecache:set_ptes 18/37]
 arch/openrisc/include/asm/pgtable.h:383:50: warning: 'struct vm_failt'
 declared inside parameter list will not be visible outside of this
 definition or declaration
Message-ID: <202307080535.TR3rzZHW-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.infradead.org/users/willy/pagecache set_ptes
head:   a357c8502e070a8a7aa2fa94492fd040ae053b78
commit: 4759f93bef657de98286621060fbac30083b9fef [18/37] openrisc: Implement the new page table range API
config: openrisc-randconfig-r003-20230708 (https://download.01.org/0day-ci/archive/20230708/202307080535.TR3rzZHW-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230708/202307080535.TR3rzZHW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307080535.TR3rzZHW-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/pgtable.h:6,
                    from include/linux/mm.h:29,
                    from include/linux/pid_namespace.h:7,
                    from include/linux/ptrace.h:10,
                    from arch/openrisc/kernel/asm-offsets.c:28:
>> arch/openrisc/include/asm/pgtable.h:383:50: warning: 'struct vm_failt' declared inside parameter list will not be visible outside of this definition or declaration
     383 | static inline void update_mmu_cache_range(struct vm_failt *vmf,
         |                                                  ^~~~~~~~
--
   In file included from include/linux/pgtable.h:6,
                    from include/linux/mm.h:29,
                    from mm/userfaultfd.c:8:
>> arch/openrisc/include/asm/pgtable.h:383:50: warning: 'struct vm_failt' declared inside parameter list will not be visible outside of this definition or declaration
     383 | static inline void update_mmu_cache_range(struct vm_failt *vmf,
         |                                                  ^~~~~~~~
   mm/userfaultfd.c: In function 'mfill_atomic_install_pte':
   mm/userfaultfd.c:123:26: error: passing argument 1 of 'update_mmu_cache_range' from incompatible pointer type [-Werror=incompatible-pointer-types]
     123 |         update_mmu_cache(dst_vma, dst_addr, dst_pte);
         |                          ^~~~~~~
         |                          |
         |                          struct vm_area_struct *
   arch/openrisc/include/asm/pgtable.h:392:32: note: in definition of macro 'update_mmu_cache'
     392 |         update_mmu_cache_range(vma, addr, ptep, 1)
         |                                ^~~
   arch/openrisc/include/asm/pgtable.h:383:60: note: expected 'struct vm_failt *' but argument is of type 'struct vm_area_struct *'
     383 | static inline void update_mmu_cache_range(struct vm_failt *vmf,
         |                                           ~~~~~~~~~~~~~~~~~^~~
>> mm/userfaultfd.c:123:35: warning: passing argument 2 of 'update_mmu_cache_range' makes pointer from integer without a cast [-Wint-conversion]
     123 |         update_mmu_cache(dst_vma, dst_addr, dst_pte);
         |                                   ^~~~~~~~
         |                                   |
         |                                   long unsigned int
   arch/openrisc/include/asm/pgtable.h:392:37: note: in definition of macro 'update_mmu_cache'
     392 |         update_mmu_cache_range(vma, addr, ptep, 1)
         |                                     ^~~~
   arch/openrisc/include/asm/pgtable.h:384:40: note: expected 'struct vm_area_struct *' but argument is of type 'long unsigned int'
     384 |                 struct vm_area_struct *vma, unsigned long address,
         |                 ~~~~~~~~~~~~~~~~~~~~~~~^~~
>> mm/userfaultfd.c:123:45: warning: passing argument 3 of 'update_mmu_cache_range' makes integer from pointer without a cast [-Wint-conversion]
     123 |         update_mmu_cache(dst_vma, dst_addr, dst_pte);
         |                                             ^~~~~~~
         |                                             |
         |                                             pte_t *
   arch/openrisc/include/asm/pgtable.h:392:43: note: in definition of macro 'update_mmu_cache'
     392 |         update_mmu_cache_range(vma, addr, ptep, 1)
         |                                           ^~~~
   arch/openrisc/include/asm/pgtable.h:384:59: note: expected 'long unsigned int' but argument is of type 'pte_t *'
     384 |                 struct vm_area_struct *vma, unsigned long address,
         |                                             ~~~~~~~~~~~~~~^~~~~~~
>> arch/openrisc/include/asm/pgtable.h:392:49: warning: passing argument 4 of 'update_mmu_cache_range' makes pointer from integer without a cast [-Wint-conversion]
     392 |         update_mmu_cache_range(vma, addr, ptep, 1)
         |                                                 ^
         |                                                 |
         |                                                 int
   mm/userfaultfd.c:123:9: note: in expansion of macro 'update_mmu_cache'
     123 |         update_mmu_cache(dst_vma, dst_addr, dst_pte);
         |         ^~~~~~~~~~~~~~~~
   arch/openrisc/include/asm/pgtable.h:385:24: note: expected 'pte_t *' but argument is of type 'int'
     385 |                 pte_t *ptep, unsigned int nr)
         |                 ~~~~~~~^~~~
   arch/openrisc/include/asm/pgtable.h:392:9: error: too few arguments to function 'update_mmu_cache_range'
     392 |         update_mmu_cache_range(vma, addr, ptep, 1)
         |         ^~~~~~~~~~~~~~~~~~~~~~
   mm/userfaultfd.c:123:9: note: in expansion of macro 'update_mmu_cache'
     123 |         update_mmu_cache(dst_vma, dst_addr, dst_pte);
         |         ^~~~~~~~~~~~~~~~
   arch/openrisc/include/asm/pgtable.h:383:20: note: declared here
     383 | static inline void update_mmu_cache_range(struct vm_failt *vmf,
         |                    ^~~~~~~~~~~~~~~~~~~~~~
   mm/userfaultfd.c: In function 'mfill_atomic_pte_zeropage':
   mm/userfaultfd.c:237:26: error: passing argument 1 of 'update_mmu_cache_range' from incompatible pointer type [-Werror=incompatible-pointer-types]
     237 |         update_mmu_cache(dst_vma, dst_addr, dst_pte);
         |                          ^~~~~~~
         |                          |
         |                          struct vm_area_struct *
   arch/openrisc/include/asm/pgtable.h:392:32: note: in definition of macro 'update_mmu_cache'
     392 |         update_mmu_cache_range(vma, addr, ptep, 1)
         |                                ^~~
   arch/openrisc/include/asm/pgtable.h:383:60: note: expected 'struct vm_failt *' but argument is of type 'struct vm_area_struct *'
     383 | static inline void update_mmu_cache_range(struct vm_failt *vmf,
         |                                           ~~~~~~~~~~~~~~~~~^~~
   mm/userfaultfd.c:237:35: warning: passing argument 2 of 'update_mmu_cache_range' makes pointer from integer without a cast [-Wint-conversion]
     237 |         update_mmu_cache(dst_vma, dst_addr, dst_pte);
         |                                   ^~~~~~~~
         |                                   |
         |                                   long unsigned int
   arch/openrisc/include/asm/pgtable.h:392:37: note: in definition of macro 'update_mmu_cache'
     392 |         update_mmu_cache_range(vma, addr, ptep, 1)
         |                                     ^~~~
   arch/openrisc/include/asm/pgtable.h:384:40: note: expected 'struct vm_area_struct *' but argument is of type 'long unsigned int'
     384 |                 struct vm_area_struct *vma, unsigned long address,
         |                 ~~~~~~~~~~~~~~~~~~~~~~~^~~
   mm/userfaultfd.c:237:45: warning: passing argument 3 of 'update_mmu_cache_range' makes integer from pointer without a cast [-Wint-conversion]
     237 |         update_mmu_cache(dst_vma, dst_addr, dst_pte);
         |                                             ^~~~~~~
         |                                             |
         |                                             pte_t *
   arch/openrisc/include/asm/pgtable.h:392:43: note: in definition of macro 'update_mmu_cache'
     392 |         update_mmu_cache_range(vma, addr, ptep, 1)
         |                                           ^~~~
   arch/openrisc/include/asm/pgtable.h:384:59: note: expected 'long unsigned int' but argument is of type 'pte_t *'
     384 |                 struct vm_area_struct *vma, unsigned long address,
         |                                             ~~~~~~~~~~~~~~^~~~~~~
>> arch/openrisc/include/asm/pgtable.h:392:49: warning: passing argument 4 of 'update_mmu_cache_range' makes pointer from integer without a cast [-Wint-conversion]
     392 |         update_mmu_cache_range(vma, addr, ptep, 1)
         |                                                 ^
         |                                                 |
         |                                                 int
   mm/userfaultfd.c:237:9: note: in expansion of macro 'update_mmu_cache'
     237 |         update_mmu_cache(dst_vma, dst_addr, dst_pte);
         |         ^~~~~~~~~~~~~~~~
   arch/openrisc/include/asm/pgtable.h:385:24: note: expected 'pte_t *' but argument is of type 'int'
     385 |                 pte_t *ptep, unsigned int nr)
         |                 ~~~~~~~^~~~
   arch/openrisc/include/asm/pgtable.h:392:9: error: too few arguments to function 'update_mmu_cache_range'
     392 |         update_mmu_cache_range(vma, addr, ptep, 1)
         |         ^~~~~~~~~~~~~~~~~~~~~~
   mm/userfaultfd.c:237:9: note: in expansion of macro 'update_mmu_cache'
     237 |         update_mmu_cache(dst_vma, dst_addr, dst_pte);
         |         ^~~~~~~~~~~~~~~~
   arch/openrisc/include/asm/pgtable.h:383:20: note: declared here
     383 | static inline void update_mmu_cache_range(struct vm_failt *vmf,
         |                    ^~~~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors
--
   In file included from include/linux/pgtable.h:6,
                    from include/linux/mm.h:29,
                    from arch/openrisc/include/asm/pgalloc.h:20,
                    from arch/openrisc/include/asm/io.h:18,
                    from include/linux/io.h:13,
                    from include/linux/irq.h:20,
                    from include/asm-generic/hardirq.h:17,
                    from ./arch/openrisc/include/generated/asm/hardirq.h:1,
                    from include/linux/hardirq.h:11,
                    from include/linux/interrupt.h:11,
                    from include/linux/kernel_stat.h:9,
                    from mm/memory.c:42:
>> arch/openrisc/include/asm/pgtable.h:383:50: warning: 'struct vm_failt' declared inside parameter list will not be visible outside of this definition or declaration
     383 | static inline void update_mmu_cache_range(struct vm_failt *vmf,
         |                                                  ^~~~~~~~
   mm/memory.c: In function 'restore_exclusive_pte':
   mm/memory.c:739:26: error: passing argument 1 of 'update_mmu_cache_range' from incompatible pointer type [-Werror=incompatible-pointer-types]
     739 |         update_mmu_cache(vma, address, ptep);
         |                          ^~~
         |                          |
         |                          struct vm_area_struct *
   arch/openrisc/include/asm/pgtable.h:392:32: note: in definition of macro 'update_mmu_cache'
     392 |         update_mmu_cache_range(vma, addr, ptep, 1)
         |                                ^~~
   arch/openrisc/include/asm/pgtable.h:383:60: note: expected 'struct vm_failt *' but argument is of type 'struct vm_area_struct *'
     383 | static inline void update_mmu_cache_range(struct vm_failt *vmf,
         |                                           ~~~~~~~~~~~~~~~~~^~~
>> mm/memory.c:739:31: warning: passing argument 2 of 'update_mmu_cache_range' makes pointer from integer without a cast [-Wint-conversion]
     739 |         update_mmu_cache(vma, address, ptep);
         |                               ^~~~~~~
         |                               |
         |                               long unsigned int
   arch/openrisc/include/asm/pgtable.h:392:37: note: in definition of macro 'update_mmu_cache'
     392 |         update_mmu_cache_range(vma, addr, ptep, 1)
         |                                     ^~~~
   arch/openrisc/include/asm/pgtable.h:384:40: note: expected 'struct vm_area_struct *' but argument is of type 'long unsigned int'
     384 |                 struct vm_area_struct *vma, unsigned long address,
         |                 ~~~~~~~~~~~~~~~~~~~~~~~^~~
>> mm/memory.c:739:40: warning: passing argument 3 of 'update_mmu_cache_range' makes integer from pointer without a cast [-Wint-conversion]
     739 |         update_mmu_cache(vma, address, ptep);
         |                                        ^~~~
         |                                        |
         |                                        pte_t *
   arch/openrisc/include/asm/pgtable.h:392:43: note: in definition of macro 'update_mmu_cache'
     392 |         update_mmu_cache_range(vma, addr, ptep, 1)
         |                                           ^~~~
   arch/openrisc/include/asm/pgtable.h:384:59: note: expected 'long unsigned int' but argument is of type 'pte_t *'
     384 |                 struct vm_area_struct *vma, unsigned long address,
         |                                             ~~~~~~~~~~~~~~^~~~~~~
>> arch/openrisc/include/asm/pgtable.h:392:49: warning: passing argument 4 of 'update_mmu_cache_range' makes pointer from integer without a cast [-Wint-conversion]
     392 |         update_mmu_cache_range(vma, addr, ptep, 1)
         |                                                 ^
         |                                                 |
         |                                                 int
   mm/memory.c:739:9: note: in expansion of macro 'update_mmu_cache'
     739 |         update_mmu_cache(vma, address, ptep);
         |         ^~~~~~~~~~~~~~~~
   arch/openrisc/include/asm/pgtable.h:385:24: note: expected 'pte_t *' but argument is of type 'int'
     385 |                 pte_t *ptep, unsigned int nr)
         |                 ~~~~~~~^~~~
   arch/openrisc/include/asm/pgtable.h:392:9: error: too few arguments to function 'update_mmu_cache_range'
     392 |         update_mmu_cache_range(vma, addr, ptep, 1)
         |         ^~~~~~~~~~~~~~~~~~~~~~
   mm/memory.c:739:9: note: in expansion of macro 'update_mmu_cache'
     739 |         update_mmu_cache(vma, address, ptep);
         |         ^~~~~~~~~~~~~~~~
   arch/openrisc/include/asm/pgtable.h:383:20: note: declared here
     383 | static inline void update_mmu_cache_range(struct vm_failt *vmf,
         |                    ^~~~~~~~~~~~~~~~~~~~~~
   mm/memory.c: In function 'insert_pfn':
   mm/memory.c:2151:50: error: passing argument 1 of 'update_mmu_cache_range' from incompatible pointer type [-Werror=incompatible-pointer-types]
    2151 |                                 update_mmu_cache(vma, addr, pte);
         |                                                  ^~~
         |                                                  |
         |                                                  struct vm_area_struct *
   arch/openrisc/include/asm/pgtable.h:392:32: note: in definition of macro 'update_mmu_cache'
     392 |         update_mmu_cache_range(vma, addr, ptep, 1)
         |                                ^~~
   arch/openrisc/include/asm/pgtable.h:383:60: note: expected 'struct vm_failt *' but argument is of type 'struct vm_area_struct *'
     383 | static inline void update_mmu_cache_range(struct vm_failt *vmf,
         |                                           ~~~~~~~~~~~~~~~~~^~~
   mm/memory.c:2151:55: warning: passing argument 2 of 'update_mmu_cache_range' makes pointer from integer without a cast [-Wint-conversion]
    2151 |                                 update_mmu_cache(vma, addr, pte);
         |                                                       ^~~~
         |                                                       |
         |                                                       long unsigned int
   arch/openrisc/include/asm/pgtable.h:392:37: note: in definition of macro 'update_mmu_cache'
     392 |         update_mmu_cache_range(vma, addr, ptep, 1)
         |                                     ^~~~
   arch/openrisc/include/asm/pgtable.h:384:40: note: expected 'struct vm_area_struct *' but argument is of type 'long unsigned int'
     384 |                 struct vm_area_struct *vma, unsigned long address,
         |                 ~~~~~~~~~~~~~~~~~~~~~~~^~~
   mm/memory.c:2151:61: warning: passing argument 3 of 'update_mmu_cache_range' makes integer from pointer without a cast [-Wint-conversion]
    2151 |                                 update_mmu_cache(vma, addr, pte);
         |                                                             ^~~
         |                                                             |
         |                                                             pte_t *
   arch/openrisc/include/asm/pgtable.h:392:43: note: in definition of macro 'update_mmu_cache'
     392 |         update_mmu_cache_range(vma, addr, ptep, 1)
         |                                           ^~~~
   arch/openrisc/include/asm/pgtable.h:384:59: note: expected 'long unsigned int' but argument is of type 'pte_t *'
     384 |                 struct vm_area_struct *vma, unsigned long address,
         |                                             ~~~~~~~~~~~~~~^~~~~~~
>> arch/openrisc/include/asm/pgtable.h:392:49: warning: passing argument 4 of 'update_mmu_cache_range' makes pointer from integer without a cast [-Wint-conversion]
     392 |         update_mmu_cache_range(vma, addr, ptep, 1)
         |                                                 ^
         |                                                 |
         |                                                 int
   mm/memory.c:2151:33: note: in expansion of macro 'update_mmu_cache'
    2151 |                                 update_mmu_cache(vma, addr, pte);
         |                                 ^~~~~~~~~~~~~~~~
   arch/openrisc/include/asm/pgtable.h:385:24: note: expected 'pte_t *' but argument is of type 'int'
     385 |                 pte_t *ptep, unsigned int nr)
         |                 ~~~~~~~^~~~
   arch/openrisc/include/asm/pgtable.h:392:9: error: too few arguments to function 'update_mmu_cache_range'
     392 |         update_mmu_cache_range(vma, addr, ptep, 1)
         |         ^~~~~~~~~~~~~~~~~~~~~~
   mm/memory.c:2151:33: note: in expansion of macro 'update_mmu_cache'
    2151 |                                 update_mmu_cache(vma, addr, pte);
         |                                 ^~~~~~~~~~~~~~~~
   arch/openrisc/include/asm/pgtable.h:383:20: note: declared here
     383 | static inline void update_mmu_cache_range(struct vm_failt *vmf,
         |                    ^~~~~~~~~~~~~~~~~~~~~~
   mm/memory.c:2168:26: error: passing argument 1 of 'update_mmu_cache_range' from incompatible pointer type [-Werror=incompatible-pointer-types]
    2168 |         update_mmu_cache(vma, addr, pte); /* XXX: why not for insert_page? */
         |                          ^~~
         |                          |
         |                          struct vm_area_struct *
   arch/openrisc/include/asm/pgtable.h:392:32: note: in definition of macro 'update_mmu_cache'
     392 |         update_mmu_cache_range(vma, addr, ptep, 1)
         |                                ^~~
   arch/openrisc/include/asm/pgtable.h:383:60: note: expected 'struct vm_failt *' but argument is of type 'struct vm_area_struct *'
     383 | static inline void update_mmu_cache_range(struct vm_failt *vmf,
         |                                           ~~~~~~~~~~~~~~~~~^~~
   mm/memory.c:2168:31: warning: passing argument 2 of 'update_mmu_cache_range' makes pointer from integer without a cast [-Wint-conversion]
    2168 |         update_mmu_cache(vma, addr, pte); /* XXX: why not for insert_page? */
         |                               ^~~~
         |                               |
         |                               long unsigned int
   arch/openrisc/include/asm/pgtable.h:392:37: note: in definition of macro 'update_mmu_cache'
     392 |         update_mmu_cache_range(vma, addr, ptep, 1)
         |                                     ^~~~
   arch/openrisc/include/asm/pgtable.h:384:40: note: expected 'struct vm_area_struct *' but argument is of type 'long unsigned int'
     384 |                 struct vm_area_struct *vma, unsigned long address,
         |                 ~~~~~~~~~~~~~~~~~~~~~~~^~~
   mm/memory.c:2168:37: warning: passing argument 3 of 'update_mmu_cache_range' makes integer from pointer without a cast [-Wint-conversion]
    2168 |         update_mmu_cache(vma, addr, pte); /* XXX: why not for insert_page? */
         |                                     ^~~
         |                                     |
         |                                     pte_t *
   arch/openrisc/include/asm/pgtable.h:392:43: note: in definition of macro 'update_mmu_cache'
     392 |         update_mmu_cache_range(vma, addr, ptep, 1)
         |                                           ^~~~
   arch/openrisc/include/asm/pgtable.h:384:59: note: expected 'long unsigned int' but argument is of type 'pte_t *'
     384 |                 struct vm_area_struct *vma, unsigned long address,
         |                                             ~~~~~~~~~~~~~~^~~~~~~
>> arch/openrisc/include/asm/pgtable.h:392:49: warning: passing argument 4 of 'update_mmu_cache_range' makes pointer from integer without a cast [-Wint-conversion]
     392 |         update_mmu_cache_range(vma, addr, ptep, 1)
         |                                                 ^
         |                                                 |
         |                                                 int
   mm/memory.c:2168:9: note: in expansion of macro 'update_mmu_cache'
    2168 |         update_mmu_cache(vma, addr, pte); /* XXX: why not for insert_page? */
         |         ^~~~~~~~~~~~~~~~
   arch/openrisc/include/asm/pgtable.h:385:24: note: expected 'pte_t *' but argument is of type 'int'
     385 |                 pte_t *ptep, unsigned int nr)
         |                 ~~~~~~~^~~~
   arch/openrisc/include/asm/pgtable.h:392:9: error: too few arguments to function 'update_mmu_cache_range'
     392 |         update_mmu_cache_range(vma, addr, ptep, 1)
         |         ^~~~~~~~~~~~~~~~~~~~~~
   mm/memory.c:2168:9: note: in expansion of macro 'update_mmu_cache'
    2168 |         update_mmu_cache(vma, addr, pte); /* XXX: why not for insert_page? */
         |         ^~~~~~~~~~~~~~~~
   arch/openrisc/include/asm/pgtable.h:383:20: note: declared here
     383 | static inline void update_mmu_cache_range(struct vm_failt *vmf,
         |                    ^~~~~~~~~~~~~~~~~~~~~~
   mm/memory.c: In function '__wp_page_copy_user':
   mm/memory.c:2867:42: error: passing argument 1 of 'update_mmu_cache_range' from incompatible pointer type [-Werror=incompatible-pointer-types]
    2867 |                         update_mmu_cache(vma, addr, vmf->pte);
         |                                          ^~~
         |                                          |
         |                                          struct vm_area_struct *
   arch/openrisc/include/asm/pgtable.h:392:32: note: in definition of macro 'update_mmu_cache'
     392 |         update_mmu_cache_range(vma, addr, ptep, 1)
         |                                ^~~
   arch/openrisc/include/asm/pgtable.h:383:60: note: expected 'struct vm_failt *' but argument is of type 'struct vm_area_struct *'
     383 | static inline void update_mmu_cache_range(struct vm_failt *vmf,
         |                                           ~~~~~~~~~~~~~~~~~^~~
   mm/memory.c:2867:47: warning: passing argument 2 of 'update_mmu_cache_range' makes pointer from integer without a cast [-Wint-conversion]
    2867 |                         update_mmu_cache(vma, addr, vmf->pte);
         |                                               ^~~~
         |                                               |
         |                                               long unsigned int
   arch/openrisc/include/asm/pgtable.h:392:37: note: in definition of macro 'update_mmu_cache'
     392 |         update_mmu_cache_range(vma, addr, ptep, 1)
         |                                     ^~~~
   arch/openrisc/include/asm/pgtable.h:384:40: note: expected 'struct vm_area_struct *' but argument is of type 'long unsigned int'
     384 |                 struct vm_area_struct *vma, unsigned long address,
         |                 ~~~~~~~~~~~~~~~~~~~~~~~^~~
   mm/memory.c:2867:56: warning: passing argument 3 of 'update_mmu_cache_range' makes integer from pointer without a cast [-Wint-conversion]
    2867 |                         update_mmu_cache(vma, addr, vmf->pte);
         |                                                     ~~~^~~~~
         |                                                        |
         |                                                        pte_t *
   arch/openrisc/include/asm/pgtable.h:392:43: note: in definition of macro 'update_mmu_cache'
     392 |         update_mmu_cache_range(vma, addr, ptep, 1)
         |                                           ^~~~
   arch/openrisc/include/asm/pgtable.h:384:59: note: expected 'long unsigned int' but argument is of type 'pte_t *'
     384 |                 struct vm_area_struct *vma, unsigned long address,
         |                                             ~~~~~~~~~~~~~~^~~~~~~
>> arch/openrisc/include/asm/pgtable.h:392:49: warning: passing argument 4 of 'update_mmu_cache_range' makes pointer from integer without a cast [-Wint-conversion]
     392 |         update_mmu_cache_range(vma, addr, ptep, 1)
         |                                                 ^
         |                                                 |
         |                                                 int
   mm/memory.c:2867:25: note: in expansion of macro 'update_mmu_cache'
    2867 |                         update_mmu_cache(vma, addr, vmf->pte);
         |                         ^~~~~~~~~~~~~~~~
   arch/openrisc/include/asm/pgtable.h:385:24: note: expected 'pte_t *' but argument is of type 'int'
     385 |                 pte_t *ptep, unsigned int nr)
         |                 ~~~~~~~^~~~
   arch/openrisc/include/asm/pgtable.h:392:9: error: too few arguments to function 'update_mmu_cache_range'
     392 |         update_mmu_cache_range(vma, addr, ptep, 1)
         |         ^~~~~~~~~~~~~~~~~~~~~~
   mm/memory.c:2867:25: note: in expansion of macro 'update_mmu_cache'
    2867 |                         update_mmu_cache(vma, addr, vmf->pte);
         |                         ^~~~~~~~~~~~~~~~
   arch/openrisc/include/asm/pgtable.h:383:20: note: declared here
     383 | static inline void update_mmu_cache_range(struct vm_failt *vmf,
         |                    ^~~~~~~~~~~~~~~~~~~~~~
   mm/memory.c: In function 'wp_page_reuse':
   mm/memory.c:3045:34: error: passing argument 1 of 'update_mmu_cache_range' from incompatible pointer type [-Werror=incompatible-pointer-types]
    3045 |                 update_mmu_cache(vma, vmf->address, vmf->pte);
         |                                  ^~~
         |                                  |
         |                                  struct vm_area_struct *
   arch/openrisc/include/asm/pgtable.h:392:32: note: in definition of macro 'update_mmu_cache'
     392 |         update_mmu_cache_range(vma, addr, ptep, 1)
         |                                ^~~
   arch/openrisc/include/asm/pgtable.h:383:60: note: expected 'struct vm_failt *' but argument is of type 'struct vm_area_struct *'
     383 | static inline void update_mmu_cache_range(struct vm_failt *vmf,
         |                                           ~~~~~~~~~~~~~~~~~^~~
   mm/memory.c:3045:42: warning: passing argument 2 of 'update_mmu_cache_range' makes pointer from integer without a cast [-Wint-conversion]
    3045 |                 update_mmu_cache(vma, vmf->address, vmf->pte);
         |                                       ~~~^~~~~~~~~
         |                                          |
         |                                          long unsigned int
   arch/openrisc/include/asm/pgtable.h:392:37: note: in definition of macro 'update_mmu_cache'
     392 |         update_mmu_cache_range(vma, addr, ptep, 1)
         |                                     ^~~~
   arch/openrisc/include/asm/pgtable.h:384:40: note: expected 'struct vm_area_struct *' but argument is of type 'long unsigned int'
     384 |                 struct vm_area_struct *vma, unsigned long address,
         |                 ~~~~~~~~~~~~~~~~~~~~~~~^~~
   mm/memory.c:3045:56: warning: passing argument 3 of 'update_mmu_cache_range' makes integer from pointer without a cast [-Wint-conversion]
    3045 |                 update_mmu_cache(vma, vmf->address, vmf->pte);
         |                                                     ~~~^~~~~
         |                                                        |
         |                                                        pte_t *
   arch/openrisc/include/asm/pgtable.h:392:43: note: in definition of macro 'update_mmu_cache'
     392 |         update_mmu_cache_range(vma, addr, ptep, 1)
         |                                           ^~~~
   arch/openrisc/include/asm/pgtable.h:384:59: note: expected 'long unsigned int' but argument is of type 'pte_t *'
     384 |                 struct vm_area_struct *vma, unsigned long address,
         |                                             ~~~~~~~~~~~~~~^~~~~~~
>> arch/openrisc/include/asm/pgtable.h:392:49: warning: passing argument 4 of 'update_mmu_cache_range' makes pointer from integer without a cast [-Wint-conversion]
     392 |         update_mmu_cache_range(vma, addr, ptep, 1)
         |                                                 ^
         |                                                 |
         |                                                 int
   mm/memory.c:3045:17: note: in expansion of macro 'update_mmu_cache'
    3045 |                 update_mmu_cache(vma, vmf->address, vmf->pte);
         |                 ^~~~~~~~~~~~~~~~
   arch/openrisc/include/asm/pgtable.h:385:24: note: expected 'pte_t *' but argument is of type 'int'
     385 |                 pte_t *ptep, unsigned int nr)
         |                 ~~~~~~~^~~~
   arch/openrisc/include/asm/pgtable.h:392:9: error: too few arguments to function 'update_mmu_cache_range'
     392 |         update_mmu_cache_range(vma, addr, ptep, 1)
         |         ^~~~~~~~~~~~~~~~~~~~~~
   mm/memory.c:3045:17: note: in expansion of macro 'update_mmu_cache'
    3045 |                 update_mmu_cache(vma, vmf->address, vmf->pte);
         |                 ^~~~~~~~~~~~~~~~
   arch/openrisc/include/asm/pgtable.h:383:20: note: declared here
     383 | static inline void update_mmu_cache_range(struct vm_failt *vmf,
         |                    ^~~~~~~~~~~~~~~~~~~~~~
   mm/memory.c: In function 'wp_page_copy':
   mm/memory.c:3169:34: error: passing argument 1 of 'update_mmu_cache_range' from incompatible pointer type [-Werror=incompatible-pointer-types]
    3169 |                 update_mmu_cache(vma, vmf->address, vmf->pte);
         |                                  ^~~
         |                                  |
         |                                  struct vm_area_struct *
   arch/openrisc/include/asm/pgtable.h:392:32: note: in definition of macro 'update_mmu_cache'
     392 |         update_mmu_cache_range(vma, addr, ptep, 1)
         |                                ^~~
   arch/openrisc/include/asm/pgtable.h:383:60: note: expected 'struct vm_failt *' but argument is of type 'struct vm_area_struct *'
     383 | static inline void update_mmu_cache_range(struct vm_failt *vmf,
         |                                           ~~~~~~~~~~~~~~~~~^~~
   mm/memory.c:3169:42: warning: passing argument 2 of 'update_mmu_cache_range' makes pointer from integer without a cast [-Wint-conversion]
    3169 |                 update_mmu_cache(vma, vmf->address, vmf->pte);
         |                                       ~~~^~~~~~~~~
         |                                          |
         |                                          long unsigned int
   arch/openrisc/include/asm/pgtable.h:392:37: note: in definition of macro 'update_mmu_cache'
     392 |         update_mmu_cache_range(vma, addr, ptep, 1)
         |                                     ^~~~
   arch/openrisc/include/asm/pgtable.h:384:40: note: expected 'struct vm_area_struct *' but argument is of type 'long unsigned int'
     384 |                 struct vm_area_struct *vma, unsigned long address,
         |                 ~~~~~~~~~~~~~~~~~~~~~~~^~~
   mm/memory.c:3169:56: warning: passing argument 3 of 'update_mmu_cache_range' makes integer from pointer without a cast [-Wint-conversion]
    3169 |                 update_mmu_cache(vma, vmf->address, vmf->pte);
         |                                                     ~~~^~~~~
         |                                                        |
         |                                                        pte_t *
   arch/openrisc/include/asm/pgtable.h:392:43: note: in definition of macro 'update_mmu_cache'
     392 |         update_mmu_cache_range(vma, addr, ptep, 1)
         |                                           ^~~~
   arch/openrisc/include/asm/pgtable.h:384:59: note: expected 'long unsigned int' but argument is of type 'pte_t *'
     384 |                 struct vm_area_struct *vma, unsigned long address,
         |                                             ~~~~~~~~~~~~~~^~~~~~~
>> arch/openrisc/include/asm/pgtable.h:392:49: warning: passing argument 4 of 'update_mmu_cache_range' makes pointer from integer without a cast [-Wint-conversion]
     392 |         update_mmu_cache_range(vma, addr, ptep, 1)
         |                                                 ^
         |                                                 |
         |                                                 int
   mm/memory.c:3169:17: note: in expansion of macro 'update_mmu_cache'
    3169 |                 update_mmu_cache(vma, vmf->address, vmf->pte);
         |                 ^~~~~~~~~~~~~~~~
   arch/openrisc/include/asm/pgtable.h:385:24: note: expected 'pte_t *' but argument is of type 'int'
     385 |                 pte_t *ptep, unsigned int nr)
         |                 ~~~~~~~^~~~
   arch/openrisc/include/asm/pgtable.h:392:9: error: too few arguments to function 'update_mmu_cache_range'
     392 |         update_mmu_cache_range(vma, addr, ptep, 1)
         |         ^~~~~~~~~~~~~~~~~~~~~~
   mm/memory.c:3169:17: note: in expansion of macro 'update_mmu_cache'
    3169 |                 update_mmu_cache(vma, vmf->address, vmf->pte);
         |                 ^~~~~~~~~~~~~~~~
   arch/openrisc/include/asm/pgtable.h:383:20: note: declared here
     383 | static inline void update_mmu_cache_range(struct vm_failt *vmf,
         |                    ^~~~~~~~~~~~~~~~~~~~~~
   mm/memory.c: In function 'do_swap_page':
   mm/memory.c:4039:26: error: passing argument 1 of 'update_mmu_cache_range' from incompatible pointer type [-Werror=incompatible-pointer-types]
    4039 |         update_mmu_cache(vma, vmf->address, vmf->pte);
         |                          ^~~
         |                          |
         |                          struct vm_area_struct *
   arch/openrisc/include/asm/pgtable.h:392:32: note: in definition of macro 'update_mmu_cache'
     392 |         update_mmu_cache_range(vma, addr, ptep, 1)
         |                                ^~~
   arch/openrisc/include/asm/pgtable.h:383:60: note: expected 'struct vm_failt *' but argument is of type 'struct vm_area_struct *'
     383 | static inline void update_mmu_cache_range(struct vm_failt *vmf,
         |                                           ~~~~~~~~~~~~~~~~~^~~
   mm/memory.c:4039:34: warning: passing argument 2 of 'update_mmu_cache_range' makes pointer from integer without a cast [-Wint-conversion]
    4039 |         update_mmu_cache(vma, vmf->address, vmf->pte);
         |                               ~~~^~~~~~~~~
         |                                  |
         |                                  long unsigned int
   arch/openrisc/include/asm/pgtable.h:392:37: note: in definition of macro 'update_mmu_cache'
     392 |         update_mmu_cache_range(vma, addr, ptep, 1)
         |                                     ^~~~
   arch/openrisc/include/asm/pgtable.h:384:40: note: expected 'struct vm_area_struct *' but argument is of type 'long unsigned int'
     384 |                 struct vm_area_struct *vma, unsigned long address,
         |                 ~~~~~~~~~~~~~~~~~~~~~~~^~~
   mm/memory.c:4039:48: warning: passing argument 3 of 'update_mmu_cache_range' makes integer from pointer without a cast [-Wint-conversion]
    4039 |         update_mmu_cache(vma, vmf->address, vmf->pte);
         |                                             ~~~^~~~~
         |                                                |
         |                                                pte_t *
   arch/openrisc/include/asm/pgtable.h:392:43: note: in definition of macro 'update_mmu_cache'
     392 |         update_mmu_cache_range(vma, addr, ptep, 1)
         |                                           ^~~~
   arch/openrisc/include/asm/pgtable.h:384:59: note: expected 'long unsigned int' but argument is of type 'pte_t *'
     384 |                 struct vm_area_struct *vma, unsigned long address,
         |                                             ~~~~~~~~~~~~~~^~~~~~~
>> arch/openrisc/include/asm/pgtable.h:392:49: warning: passing argument 4 of 'update_mmu_cache_range' makes pointer from integer without a cast [-Wint-conversion]
     392 |         update_mmu_cache_range(vma, addr, ptep, 1)
         |                                                 ^
         |                                                 |
         |                                                 int
   mm/memory.c:4039:9: note: in expansion of macro 'update_mmu_cache'
    4039 |         update_mmu_cache(vma, vmf->address, vmf->pte);
         |         ^~~~~~~~~~~~~~~~
   arch/openrisc/include/asm/pgtable.h:385:24: note: expected 'pte_t *' but argument is of type 'int'
     385 |                 pte_t *ptep, unsigned int nr)
         |                 ~~~~~~~^~~~
   arch/openrisc/include/asm/pgtable.h:392:9: error: too few arguments to function 'update_mmu_cache_range'
     392 |         update_mmu_cache_range(vma, addr, ptep, 1)
         |         ^~~~~~~~~~~~~~~~~~~~~~
   mm/memory.c:4039:9: note: in expansion of macro 'update_mmu_cache'
    4039 |         update_mmu_cache(vma, vmf->address, vmf->pte);
         |         ^~~~~~~~~~~~~~~~
   arch/openrisc/include/asm/pgtable.h:383:20: note: declared here
     383 | static inline void update_mmu_cache_range(struct vm_failt *vmf,
         |                    ^~~~~~~~~~~~~~~~~~~~~~
   mm/memory.c: In function 'do_anonymous_page':
   mm/memory.c:4163:26: error: passing argument 1 of 'update_mmu_cache_range' from incompatible pointer type [-Werror=incompatible-pointer-types]
    4163 |         update_mmu_cache(vma, vmf->address, vmf->pte);
         |                          ^~~
         |                          |
         |                          struct vm_area_struct *
   arch/openrisc/include/asm/pgtable.h:392:32: note: in definition of macro 'update_mmu_cache'
     392 |         update_mmu_cache_range(vma, addr, ptep, 1)
         |                                ^~~
   arch/openrisc/include/asm/pgtable.h:383:60: note: expected 'struct vm_failt *' but argument is of type 'struct vm_area_struct *'
     383 | static inline void update_mmu_cache_range(struct vm_failt *vmf,
         |                                           ~~~~~~~~~~~~~~~~~^~~
   mm/memory.c:4163:34: warning: passing argument 2 of 'update_mmu_cache_range' makes pointer from integer without a cast [-Wint-conversion]
    4163 |         update_mmu_cache(vma, vmf->address, vmf->pte);
         |                               ~~~^~~~~~~~~
         |                                  |
         |                                  long unsigned int
   arch/openrisc/include/asm/pgtable.h:392:37: note: in definition of macro 'update_mmu_cache'
     392 |         update_mmu_cache_range(vma, addr, ptep, 1)
         |                                     ^~~~
   arch/openrisc/include/asm/pgtable.h:384:40: note: expected 'struct vm_area_struct *' but argument is of type 'long unsigned int'
     384 |                 struct vm_area_struct *vma, unsigned long address,
         |                 ~~~~~~~~~~~~~~~~~~~~~~~^~~
   mm/memory.c:4163:48: warning: passing argument 3 of 'update_mmu_cache_range' makes integer from pointer without a cast [-Wint-conversion]
    4163 |         update_mmu_cache(vma, vmf->address, vmf->pte);
         |                                             ~~~^~~~~
         |                                                |
         |                                                pte_t *
   arch/openrisc/include/asm/pgtable.h:392:43: note: in definition of macro 'update_mmu_cache'
     392 |         update_mmu_cache_range(vma, addr, ptep, 1)
         |                                           ^~~~
   arch/openrisc/include/asm/pgtable.h:384:59: note: expected 'long unsigned int' but argument is of type 'pte_t *'
     384 |                 struct vm_area_struct *vma, unsigned long address,
         |                                             ~~~~~~~~~~~~~~^~~~~~~
>> arch/openrisc/include/asm/pgtable.h:392:49: warning: passing argument 4 of 'update_mmu_cache_range' makes pointer from integer without a cast [-Wint-conversion]
     392 |         update_mmu_cache_range(vma, addr, ptep, 1)
         |                                                 ^
         |                                                 |
         |                                                 int
   mm/memory.c:4163:9: note: in expansion of macro 'update_mmu_cache'
    4163 |         update_mmu_cache(vma, vmf->address, vmf->pte);
         |         ^~~~~~~~~~~~~~~~
   arch/openrisc/include/asm/pgtable.h:385:24: note: expected 'pte_t *' but argument is of type 'int'
     385 |                 pte_t *ptep, unsigned int nr)
         |                 ~~~~~~~^~~~
   arch/openrisc/include/asm/pgtable.h:392:9: error: too few arguments to function 'update_mmu_cache_range'
     392 |         update_mmu_cache_range(vma, addr, ptep, 1)
         |         ^~~~~~~~~~~~~~~~~~~~~~
   mm/memory.c:4163:9: note: in expansion of macro 'update_mmu_cache'
    4163 |         update_mmu_cache(vma, vmf->address, vmf->pte);
         |         ^~~~~~~~~~~~~~~~
   arch/openrisc/include/asm/pgtable.h:383:20: note: declared here
     383 | static inline void update_mmu_cache_range(struct vm_failt *vmf,
         |                    ^~~~~~~~~~~~~~~~~~~~~~
   mm/memory.c: In function 'finish_fault':
   mm/memory.c:4425:34: error: passing argument 1 of 'update_mmu_cache_range' from incompatible pointer type [-Werror=incompatible-pointer-types]
    4425 |                 update_mmu_cache(vma, vmf->address, vmf->pte);
         |                                  ^~~
         |                                  |
         |                                  struct vm_area_struct *
   arch/openrisc/include/asm/pgtable.h:392:32: note: in definition of macro 'update_mmu_cache'
     392 |         update_mmu_cache_range(vma, addr, ptep, 1)
         |                                ^~~
   arch/openrisc/include/asm/pgtable.h:383:60: note: expected 'struct vm_failt *' but argument is of type 'struct vm_area_struct *'
     383 | static inline void update_mmu_cache_range(struct vm_failt *vmf,
         |                                           ~~~~~~~~~~~~~~~~~^~~
   mm/memory.c:4425:42: warning: passing argument 2 of 'update_mmu_cache_range' makes pointer from integer without a cast [-Wint-conversion]
    4425 |                 update_mmu_cache(vma, vmf->address, vmf->pte);
         |                                       ~~~^~~~~~~~~
         |                                          |
         |                                          long unsigned int
   arch/openrisc/include/asm/pgtable.h:392:37: note: in definition of macro 'update_mmu_cache'
     392 |         update_mmu_cache_range(vma, addr, ptep, 1)
         |                                     ^~~~
   arch/openrisc/include/asm/pgtable.h:384:40: note: expected 'struct vm_area_struct *' but argument is of type 'long unsigned int'
     384 |                 struct vm_area_struct *vma, unsigned long address,
         |                 ~~~~~~~~~~~~~~~~~~~~~~~^~~
   mm/memory.c:4425:56: warning: passing argument 3 of 'update_mmu_cache_range' makes integer from pointer without a cast [-Wint-conversion]
    4425 |                 update_mmu_cache(vma, vmf->address, vmf->pte);
         |                                                     ~~~^~~~~
         |                                                        |
         |                                                        pte_t *
   arch/openrisc/include/asm/pgtable.h:392:43: note: in definition of macro 'update_mmu_cache'
     392 |         update_mmu_cache_range(vma, addr, ptep, 1)
         |                                           ^~~~
   arch/openrisc/include/asm/pgtable.h:384:59: note: expected 'long unsigned int' but argument is of type 'pte_t *'
     384 |                 struct vm_area_struct *vma, unsigned long address,
         |                                             ~~~~~~~~~~~~~~^~~~~~~
>> arch/openrisc/include/asm/pgtable.h:392:49: warning: passing argument 4 of 'update_mmu_cache_range' makes pointer from integer without a cast [-Wint-conversion]
     392 |         update_mmu_cache_range(vma, addr, ptep, 1)
         |                                                 ^
         |                                                 |
         |                                                 int
   mm/memory.c:4425:17: note: in expansion of macro 'update_mmu_cache'
    4425 |                 update_mmu_cache(vma, vmf->address, vmf->pte);
         |                 ^~~~~~~~~~~~~~~~
   arch/openrisc/include/asm/pgtable.h:385:24: note: expected 'pte_t *' but argument is of type 'int'
     385 |                 pte_t *ptep, unsigned int nr)
         |                 ~~~~~~~^~~~
   arch/openrisc/include/asm/pgtable.h:392:9: error: too few arguments to function 'update_mmu_cache_range'
     392 |         update_mmu_cache_range(vma, addr, ptep, 1)
         |         ^~~~~~~~~~~~~~~~~~~~~~
   mm/memory.c:4425:17: note: in expansion of macro 'update_mmu_cache'
    4425 |                 update_mmu_cache(vma, vmf->address, vmf->pte);
         |                 ^~~~~~~~~~~~~~~~
   arch/openrisc/include/asm/pgtable.h:383:20: note: declared here
     383 | static inline void update_mmu_cache_range(struct vm_failt *vmf,
         |                    ^~~~~~~~~~~~~~~~~~~~~~
   mm/memory.c: In function 'do_numa_page':
   mm/memory.c:4823:26: error: passing argument 1 of 'update_mmu_cache_range' from incompatible pointer type [-Werror=incompatible-pointer-types]
    4823 |         update_mmu_cache(vma, vmf->address, vmf->pte);
         |                          ^~~
         |                          |
         |                          struct vm_area_struct *
   arch/openrisc/include/asm/pgtable.h:392:32: note: in definition of macro 'update_mmu_cache'
     392 |         update_mmu_cache_range(vma, addr, ptep, 1)
         |                                ^~~
   arch/openrisc/include/asm/pgtable.h:383:60: note: expected 'struct vm_failt *' but argument is of type 'struct vm_area_struct *'
     383 | static inline void update_mmu_cache_range(struct vm_failt *vmf,
         |                                           ~~~~~~~~~~~~~~~~~^~~
   mm/memory.c:4823:34: warning: passing argument 2 of 'update_mmu_cache_range' makes pointer from integer without a cast [-Wint-conversion]
    4823 |         update_mmu_cache(vma, vmf->address, vmf->pte);
         |                               ~~~^~~~~~~~~
         |                                  |
         |                                  long unsigned int
   arch/openrisc/include/asm/pgtable.h:392:37: note: in definition of macro 'update_mmu_cache'
     392 |         update_mmu_cache_range(vma, addr, ptep, 1)
         |                                     ^~~~
   arch/openrisc/include/asm/pgtable.h:384:40: note: expected 'struct vm_area_struct *' but argument is of type 'long unsigned int'
     384 |                 struct vm_area_struct *vma, unsigned long address,
         |                 ~~~~~~~~~~~~~~~~~~~~~~~^~~
   mm/memory.c:4823:48: warning: passing argument 3 of 'update_mmu_cache_range' makes integer from pointer without a cast [-Wint-conversion]
    4823 |         update_mmu_cache(vma, vmf->address, vmf->pte);
         |                                             ~~~^~~~~
         |                                                |
         |                                                pte_t *
   arch/openrisc/include/asm/pgtable.h:392:43: note: in definition of macro 'update_mmu_cache'
     392 |         update_mmu_cache_range(vma, addr, ptep, 1)
         |                                           ^~~~
   arch/openrisc/include/asm/pgtable.h:384:59: note: expected 'long unsigned int' but argument is of type 'pte_t *'
     384 |                 struct vm_area_struct *vma, unsigned long address,
         |                                             ~~~~~~~~~~~~~~^~~~~~~
>> arch/openrisc/include/asm/pgtable.h:392:49: warning: passing argument 4 of 'update_mmu_cache_range' makes pointer from integer without a cast [-Wint-conversion]
     392 |         update_mmu_cache_range(vma, addr, ptep, 1)
         |                                                 ^
         |                                                 |
         |                                                 int
   mm/memory.c:4823:9: note: in expansion of macro 'update_mmu_cache'
    4823 |         update_mmu_cache(vma, vmf->address, vmf->pte);
         |         ^~~~~~~~~~~~~~~~
   arch/openrisc/include/asm/pgtable.h:385:24: note: expected 'pte_t *' but argument is of type 'int'
     385 |                 pte_t *ptep, unsigned int nr)
         |                 ~~~~~~~^~~~
   arch/openrisc/include/asm/pgtable.h:392:9: error: too few arguments to function 'update_mmu_cache_range'
     392 |         update_mmu_cache_range(vma, addr, ptep, 1)
         |         ^~~~~~~~~~~~~~~~~~~~~~
   mm/memory.c:4823:9: note: in expansion of macro 'update_mmu_cache'
    4823 |         update_mmu_cache(vma, vmf->address, vmf->pte);
         |         ^~~~~~~~~~~~~~~~
   arch/openrisc/include/asm/pgtable.h:383:20: note: declared here
     383 | static inline void update_mmu_cache_range(struct vm_failt *vmf,
         |                    ^~~~~~~~~~~~~~~~~~~~~~
   mm/memory.c: In function 'handle_pte_fault':
   mm/memory.c:4972:37: error: passing argument 1 of 'update_mmu_cache_range' from incompatible pointer type [-Werror=incompatible-pointer-types]
    4972 |                 update_mmu_cache(vmf->vma, vmf->address, vmf->pte);
         |                                  ~~~^~~~~
         |                                     |
         |                                     struct vm_area_struct *
   arch/openrisc/include/asm/pgtable.h:392:32: note: in definition of macro 'update_mmu_cache'
     392 |         update_mmu_cache_range(vma, addr, ptep, 1)
         |                                ^~~
   arch/openrisc/include/asm/pgtable.h:383:60: note: expected 'struct vm_failt *' but argument is of type 'struct vm_area_struct *'
     383 | static inline void update_mmu_cache_range(struct vm_failt *vmf,
         |                                           ~~~~~~~~~~~~~~~~~^~~
   mm/memory.c:4972:47: warning: passing argument 2 of 'update_mmu_cache_range' makes pointer from integer without a cast [-Wint-conversion]
    4972 |                 update_mmu_cache(vmf->vma, vmf->address, vmf->pte);
         |                                            ~~~^~~~~~~~~
         |                                               |
         |                                               long unsigned int
   arch/openrisc/include/asm/pgtable.h:392:37: note: in definition of macro 'update_mmu_cache'
     392 |         update_mmu_cache_range(vma, addr, ptep, 1)
         |                                     ^~~~
   arch/openrisc/include/asm/pgtable.h:384:40: note: expected 'struct vm_area_struct *' but argument is of type 'long unsigned int'
     384 |                 struct vm_area_struct *vma, unsigned long address,
         |                 ~~~~~~~~~~~~~~~~~~~~~~~^~~
   mm/memory.c:4972:61: warning: passing argument 3 of 'update_mmu_cache_range' makes integer from pointer without a cast [-Wint-conversion]
    4972 |                 update_mmu_cache(vmf->vma, vmf->address, vmf->pte);
         |                                                          ~~~^~~~~
         |                                                             |
         |                                                             pte_t *
   arch/openrisc/include/asm/pgtable.h:392:43: note: in definition of macro 'update_mmu_cache'
     392 |         update_mmu_cache_range(vma, addr, ptep, 1)
         |                                           ^~~~
   arch/openrisc/include/asm/pgtable.h:384:59: note: expected 'long unsigned int' but argument is of type 'pte_t *'
     384 |                 struct vm_area_struct *vma, unsigned long address,
         |                                             ~~~~~~~~~~~~~~^~~~~~~
>> arch/openrisc/include/asm/pgtable.h:392:49: warning: passing argument 4 of 'update_mmu_cache_range' makes pointer from integer without a cast [-Wint-conversion]
     392 |         update_mmu_cache_range(vma, addr, ptep, 1)
         |                                                 ^
         |                                                 |
         |                                                 int
   mm/memory.c:4972:17: note: in expansion of macro 'update_mmu_cache'
    4972 |                 update_mmu_cache(vmf->vma, vmf->address, vmf->pte);
         |                 ^~~~~~~~~~~~~~~~
   arch/openrisc/include/asm/pgtable.h:385:24: note: expected 'pte_t *' but argument is of type 'int'
     385 |                 pte_t *ptep, unsigned int nr)
         |                 ~~~~~~~^~~~
   arch/openrisc/include/asm/pgtable.h:392:9: error: too few arguments to function 'update_mmu_cache_range'
     392 |         update_mmu_cache_range(vma, addr, ptep, 1)
         |         ^~~~~~~~~~~~~~~~~~~~~~
   mm/memory.c:4972:17: note: in expansion of macro 'update_mmu_cache'
    4972 |                 update_mmu_cache(vmf->vma, vmf->address, vmf->pte);
         |                 ^~~~~~~~~~~~~~~~
   arch/openrisc/include/asm/pgtable.h:383:20: note: declared here
     383 | static inline void update_mmu_cache_range(struct vm_failt *vmf,
         |                    ^~~~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors
..


vim +383 arch/openrisc/include/asm/pgtable.h

   379	
   380	extern void update_cache(struct vm_area_struct *vma,
   381		unsigned long address, pte_t *pte);
   382	
 > 383	static inline void update_mmu_cache_range(struct vm_failt *vmf,
   384			struct vm_area_struct *vma, unsigned long address,
   385			pte_t *ptep, unsigned int nr)
   386	{
   387		update_tlb(vma, address, ptep);
   388		update_cache(vma, address, ptep);
   389	}
   390	
   391	#define update_mmu_cache(vma, addr, ptep) \
 > 392		update_mmu_cache_range(vma, addr, ptep, 1)
   393	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
