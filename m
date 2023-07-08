Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52A347F
	for <oe-kbuild-all@lists.linux.dev>; Sat,  8 Jul 2023 01:35:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1688780120; x=1720316120;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=iETgqR9zXgClO867LOiIvfqdSK3NzzRUNarUdf9ZB3Y=;
  b=MRWQVZgo9GudPkE/4v6xd9NJzu1m51Vf7hrcyUv4wx/xagFC+RRLSh4r
   RQfQfSVagvvuIT89Dj5l7zTCLTNIoPjiJZL/n75ho9wkJfr50t9LHNSix
   B28rk/0BbI6jZxc9RmEbasMjwPgynnRuy+4lznTrJpoIdR5GSFTlL7Xto
   4Xkm+SiUgruVldhjH1po6gMAppJuIvxs3OJvCM+Bm5g2ju4+jFOpvV1Il
   Me+n/ig5WIskxEC2M63zqoFhavUbco29JP7jKf1E1B2RdUgS38KuwMQa2
   YJUZFp+MhGeHqsrobQZXUKjHsBgc5EvuMt70zmZNgVHe2Q6B0K6oAiQke
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10764"; a="430081191"
X-IronPort-AV: E=Sophos;i="6.01,189,1684825200"; 
   d="scan'208";a="430081191"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jul 2023 18:35:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10764"; a="894173458"
X-IronPort-AV: E=Sophos;i="6.01,189,1684825200"; 
   d="scan'208";a="894173458"
Received: from lkp-server01.sh.intel.com (HELO c544d7fc5005) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 07 Jul 2023 18:35:17 -0700
Received: from kbuild by c544d7fc5005 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qHwqy-0002T9-2D;
	Sat, 08 Jul 2023 01:35:16 +0000
Date: Sat, 8 Jul 2023 09:34:19 +0800
From: kernel test robot <lkp@intel.com>
To: Matthew Wilcox <willy@infradead.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [willy-pagecache:set_ptes 18/37] mm/userfaultfd.c:123:26: error:
 passing argument 1 of 'update_mmu_cache_range' from incompatible pointer
 type
Message-ID: <202307080917.tfTowcae-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.infradead.org/users/willy/pagecache set_ptes
head:   72c34bd0b2a432506d992bdc1e3a89260461667d
commit: 4759f93bef657de98286621060fbac30083b9fef [18/37] openrisc: Implement the new page table range API
config: openrisc-randconfig-r003-20230708 (https://download.01.org/0day-ci/archive/20230708/202307080917.tfTowcae-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230708/202307080917.tfTowcae-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307080917.tfTowcae-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/pgtable.h:6,
                    from include/linux/mm.h:29,
                    from mm/userfaultfd.c:8:
   arch/openrisc/include/asm/pgtable.h:383:50: warning: 'struct vm_failt' declared inside parameter list will not be visible outside of this definition or declaration
     383 | static inline void update_mmu_cache_range(struct vm_failt *vmf,
         |                                                  ^~~~~~~~
   mm/userfaultfd.c: In function 'mfill_atomic_install_pte':
>> mm/userfaultfd.c:123:26: error: passing argument 1 of 'update_mmu_cache_range' from incompatible pointer type [-Werror=incompatible-pointer-types]
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
   mm/userfaultfd.c:123:35: warning: passing argument 2 of 'update_mmu_cache_range' makes pointer from integer without a cast [-Wint-conversion]
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
   mm/userfaultfd.c:123:45: warning: passing argument 3 of 'update_mmu_cache_range' makes integer from pointer without a cast [-Wint-conversion]
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
   arch/openrisc/include/asm/pgtable.h:392:49: warning: passing argument 4 of 'update_mmu_cache_range' makes pointer from integer without a cast [-Wint-conversion]
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
>> arch/openrisc/include/asm/pgtable.h:392:9: error: too few arguments to function 'update_mmu_cache_range'
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
   arch/openrisc/include/asm/pgtable.h:392:49: warning: passing argument 4 of 'update_mmu_cache_range' makes pointer from integer without a cast [-Wint-conversion]
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
>> arch/openrisc/include/asm/pgtable.h:392:9: error: too few arguments to function 'update_mmu_cache_range'
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
   arch/openrisc/include/asm/pgtable.h:383:50: warning: 'struct vm_failt' declared inside parameter list will not be visible outside of this definition or declaration
     383 | static inline void update_mmu_cache_range(struct vm_failt *vmf,
         |                                                  ^~~~~~~~
   mm/memory.c: In function 'restore_exclusive_pte':
>> mm/memory.c:739:26: error: passing argument 1 of 'update_mmu_cache_range' from incompatible pointer type [-Werror=incompatible-pointer-types]
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
   mm/memory.c:739:31: warning: passing argument 2 of 'update_mmu_cache_range' makes pointer from integer without a cast [-Wint-conversion]
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
   mm/memory.c:739:40: warning: passing argument 3 of 'update_mmu_cache_range' makes integer from pointer without a cast [-Wint-conversion]
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
   arch/openrisc/include/asm/pgtable.h:392:49: warning: passing argument 4 of 'update_mmu_cache_range' makes pointer from integer without a cast [-Wint-conversion]
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
>> arch/openrisc/include/asm/pgtable.h:392:9: error: too few arguments to function 'update_mmu_cache_range'
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
   arch/openrisc/include/asm/pgtable.h:392:49: warning: passing argument 4 of 'update_mmu_cache_range' makes pointer from integer without a cast [-Wint-conversion]
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
>> arch/openrisc/include/asm/pgtable.h:392:9: error: too few arguments to function 'update_mmu_cache_range'
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
   arch/openrisc/include/asm/pgtable.h:392:49: warning: passing argument 4 of 'update_mmu_cache_range' makes pointer from integer without a cast [-Wint-conversion]
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
>> arch/openrisc/include/asm/pgtable.h:392:9: error: too few arguments to function 'update_mmu_cache_range'
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
   arch/openrisc/include/asm/pgtable.h:392:49: warning: passing argument 4 of 'update_mmu_cache_range' makes pointer from integer without a cast [-Wint-conversion]
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
>> arch/openrisc/include/asm/pgtable.h:392:9: error: too few arguments to function 'update_mmu_cache_range'
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
   arch/openrisc/include/asm/pgtable.h:392:49: warning: passing argument 4 of 'update_mmu_cache_range' makes pointer from integer without a cast [-Wint-conversion]
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
>> arch/openrisc/include/asm/pgtable.h:392:9: error: too few arguments to function 'update_mmu_cache_range'
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
   arch/openrisc/include/asm/pgtable.h:392:49: warning: passing argument 4 of 'update_mmu_cache_range' makes pointer from integer without a cast [-Wint-conversion]
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
>> arch/openrisc/include/asm/pgtable.h:392:9: error: too few arguments to function 'update_mmu_cache_range'
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
   arch/openrisc/include/asm/pgtable.h:392:49: warning: passing argument 4 of 'update_mmu_cache_range' makes pointer from integer without a cast [-Wint-conversion]
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
>> arch/openrisc/include/asm/pgtable.h:392:9: error: too few arguments to function 'update_mmu_cache_range'
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
   arch/openrisc/include/asm/pgtable.h:392:49: warning: passing argument 4 of 'update_mmu_cache_range' makes pointer from integer without a cast [-Wint-conversion]
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
>> arch/openrisc/include/asm/pgtable.h:392:9: error: too few arguments to function 'update_mmu_cache_range'
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
   arch/openrisc/include/asm/pgtable.h:392:49: warning: passing argument 4 of 'update_mmu_cache_range' makes pointer from integer without a cast [-Wint-conversion]
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
>> arch/openrisc/include/asm/pgtable.h:392:9: error: too few arguments to function 'update_mmu_cache_range'
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
   arch/openrisc/include/asm/pgtable.h:392:49: warning: passing argument 4 of 'update_mmu_cache_range' makes pointer from integer without a cast [-Wint-conversion]
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
>> arch/openrisc/include/asm/pgtable.h:392:9: error: too few arguments to function 'update_mmu_cache_range'
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
   arch/openrisc/include/asm/pgtable.h:392:49: warning: passing argument 4 of 'update_mmu_cache_range' makes pointer from integer without a cast [-Wint-conversion]
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
>> arch/openrisc/include/asm/pgtable.h:392:9: error: too few arguments to function 'update_mmu_cache_range'
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


vim +/update_mmu_cache_range +123 mm/userfaultfd.c

643aa36eadebdc Wei Yang              2019-11-30   47  
153132571f0204 Axel Rasmussen        2021-06-30   48  /*
153132571f0204 Axel Rasmussen        2021-06-30   49   * Install PTEs, to map dst_addr (within dst_vma) to page.
153132571f0204 Axel Rasmussen        2021-06-30   50   *
7d64ae3ab648a9 Axel Rasmussen        2021-06-30   51   * This function handles both MCOPY_ATOMIC_NORMAL and _CONTINUE for both shmem
7d64ae3ab648a9 Axel Rasmussen        2021-06-30   52   * and anon, and for both shared and private VMAs.
153132571f0204 Axel Rasmussen        2021-06-30   53   */
61c5004022f56c Axel Rasmussen        2023-03-14   54  int mfill_atomic_install_pte(pmd_t *dst_pmd,
153132571f0204 Axel Rasmussen        2021-06-30   55  			     struct vm_area_struct *dst_vma,
153132571f0204 Axel Rasmussen        2021-06-30   56  			     unsigned long dst_addr, struct page *page,
d9712937037e0c Axel Rasmussen        2023-03-14   57  			     bool newly_allocated, uffd_flags_t flags)
153132571f0204 Axel Rasmussen        2021-06-30   58  {
153132571f0204 Axel Rasmussen        2021-06-30   59  	int ret;
61c5004022f56c Axel Rasmussen        2023-03-14   60  	struct mm_struct *dst_mm = dst_vma->vm_mm;
153132571f0204 Axel Rasmussen        2021-06-30   61  	pte_t _dst_pte, *dst_pte;
153132571f0204 Axel Rasmussen        2021-06-30   62  	bool writable = dst_vma->vm_flags & VM_WRITE;
153132571f0204 Axel Rasmussen        2021-06-30   63  	bool vm_shared = dst_vma->vm_flags & VM_SHARED;
93b0d9178743a6 Peter Xu              2022-11-02   64  	bool page_in_cache = page_mapping(page);
153132571f0204 Axel Rasmussen        2021-06-30   65  	spinlock_t *ptl;
28965f0f8be62e Vishal Moola (Oracle  2022-11-01   66) 	struct folio *folio;
153132571f0204 Axel Rasmussen        2021-06-30   67  	struct inode *inode;
153132571f0204 Axel Rasmussen        2021-06-30   68  	pgoff_t offset, max_off;
153132571f0204 Axel Rasmussen        2021-06-30   69  
153132571f0204 Axel Rasmussen        2021-06-30   70  	_dst_pte = mk_pte(page, dst_vma->vm_page_prot);
9ae0f87d009ca6 Peter Xu              2021-11-05   71  	_dst_pte = pte_mkdirty(_dst_pte);
153132571f0204 Axel Rasmussen        2021-06-30   72  	if (page_in_cache && !vm_shared)
153132571f0204 Axel Rasmussen        2021-06-30   73  		writable = false;
8ee79edff6d3b4 Peter Xu              2022-05-12   74  	if (writable)
23a219c1860bc9 Rick Edgecombe        2023-06-12   75  		_dst_pte = pte_mkwrite(_dst_pte, dst_vma);
d9712937037e0c Axel Rasmussen        2023-03-14   76  	if (flags & MFILL_ATOMIC_WP)
f1eb1bacfba901 Peter Xu              2022-12-14   77  		_dst_pte = pte_mkuffd_wp(_dst_pte);
153132571f0204 Axel Rasmussen        2021-06-30   78  
3622d3cde30898 Hugh Dickins          2023-06-08   79  	ret = -EAGAIN;
153132571f0204 Axel Rasmussen        2021-06-30   80  	dst_pte = pte_offset_map_lock(dst_mm, dst_pmd, dst_addr, &ptl);
3622d3cde30898 Hugh Dickins          2023-06-08   81  	if (!dst_pte)
3622d3cde30898 Hugh Dickins          2023-06-08   82  		goto out;
153132571f0204 Axel Rasmussen        2021-06-30   83  
153132571f0204 Axel Rasmussen        2021-06-30   84  	if (vma_is_shmem(dst_vma)) {
153132571f0204 Axel Rasmussen        2021-06-30   85  		/* serialize against truncate with the page table lock */
153132571f0204 Axel Rasmussen        2021-06-30   86  		inode = dst_vma->vm_file->f_inode;
153132571f0204 Axel Rasmussen        2021-06-30   87  		offset = linear_page_index(dst_vma, dst_addr);
153132571f0204 Axel Rasmussen        2021-06-30   88  		max_off = DIV_ROUND_UP(i_size_read(inode), PAGE_SIZE);
153132571f0204 Axel Rasmussen        2021-06-30   89  		ret = -EFAULT;
153132571f0204 Axel Rasmussen        2021-06-30   90  		if (unlikely(offset >= max_off))
153132571f0204 Axel Rasmussen        2021-06-30   91  			goto out_unlock;
153132571f0204 Axel Rasmussen        2021-06-30   92  	}
153132571f0204 Axel Rasmussen        2021-06-30   93  
153132571f0204 Axel Rasmussen        2021-06-30   94  	ret = -EEXIST;
8ee79edff6d3b4 Peter Xu              2022-05-12   95  	/*
8ee79edff6d3b4 Peter Xu              2022-05-12   96  	 * We allow to overwrite a pte marker: consider when both MISSING|WP
8ee79edff6d3b4 Peter Xu              2022-05-12   97  	 * registered, we firstly wr-protect a none pte which has no page cache
8ee79edff6d3b4 Peter Xu              2022-05-12   98  	 * page backing it, then access the page.
8ee79edff6d3b4 Peter Xu              2022-05-12   99  	 */
c33c794828f212 Ryan Roberts          2023-06-12  100  	if (!pte_none_mostly(ptep_get(dst_pte)))
153132571f0204 Axel Rasmussen        2021-06-30  101  		goto out_unlock;
153132571f0204 Axel Rasmussen        2021-06-30  102  
28965f0f8be62e Vishal Moola (Oracle  2022-11-01  103) 	folio = page_folio(page);
cea86fe246b694 Hugh Dickins          2022-02-14  104  	if (page_in_cache) {
cea86fe246b694 Hugh Dickins          2022-02-14  105  		/* Usually, cache pages are already added to LRU */
cea86fe246b694 Hugh Dickins          2022-02-14  106  		if (newly_allocated)
28965f0f8be62e Vishal Moola (Oracle  2022-11-01  107) 			folio_add_lru(folio);
cea86fe246b694 Hugh Dickins          2022-02-14  108  		page_add_file_rmap(page, dst_vma, false);
cea86fe246b694 Hugh Dickins          2022-02-14  109  	} else {
40f2bbf71161fa David Hildenbrand     2022-05-09  110  		page_add_new_anon_rmap(page, dst_vma, dst_addr);
28965f0f8be62e Vishal Moola (Oracle  2022-11-01  111) 		folio_add_lru_vma(folio, dst_vma);
cea86fe246b694 Hugh Dickins          2022-02-14  112  	}
153132571f0204 Axel Rasmussen        2021-06-30  113  
153132571f0204 Axel Rasmussen        2021-06-30  114  	/*
153132571f0204 Axel Rasmussen        2021-06-30  115  	 * Must happen after rmap, as mm_counter() checks mapping (via
153132571f0204 Axel Rasmussen        2021-06-30  116  	 * PageAnon()), which is set by __page_set_anon_rmap().
153132571f0204 Axel Rasmussen        2021-06-30  117  	 */
153132571f0204 Axel Rasmussen        2021-06-30  118  	inc_mm_counter(dst_mm, mm_counter(page));
153132571f0204 Axel Rasmussen        2021-06-30  119  
153132571f0204 Axel Rasmussen        2021-06-30  120  	set_pte_at(dst_mm, dst_addr, dst_pte, _dst_pte);
153132571f0204 Axel Rasmussen        2021-06-30  121  
153132571f0204 Axel Rasmussen        2021-06-30  122  	/* No need to invalidate - it was non-present before */
153132571f0204 Axel Rasmussen        2021-06-30 @123  	update_mmu_cache(dst_vma, dst_addr, dst_pte);
153132571f0204 Axel Rasmussen        2021-06-30  124  	ret = 0;
153132571f0204 Axel Rasmussen        2021-06-30  125  out_unlock:
153132571f0204 Axel Rasmussen        2021-06-30  126  	pte_unmap_unlock(dst_pte, ptl);
3622d3cde30898 Hugh Dickins          2023-06-08  127  out:
153132571f0204 Axel Rasmussen        2021-06-30  128  	return ret;
153132571f0204 Axel Rasmussen        2021-06-30  129  }
153132571f0204 Axel Rasmussen        2021-06-30  130  

:::::: The code at line 123 was first introduced by commit
:::::: 153132571f0204dc5844faf6b0f8096c6c29d277 userfaultfd/shmem: support UFFDIO_CONTINUE for shmem

:::::: TO: Axel Rasmussen <axelrasmussen@google.com>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
