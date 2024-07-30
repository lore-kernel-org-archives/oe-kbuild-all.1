Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7278019EEB8
	for <oe-kbuild-all@lists.linux.dev>; Tue, 30 Jul 2024 13:21:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722345704; cv=none; b=pMcju+vAhSbJ1I7RXVneAAKkv9rHZjYmlkFmiy+fiRbo6lePwVtbpLNx4y6sX729GG0Znex6mo9nbjJxEr3BES0Dxu/RMp7vxXVTr4iJixKRFBhDkEFhENxnfV3dcr2ffK9WybnnBBZM9oTK+ZNvaECBimIHZKA/PQuKweBxzkU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722345704; c=relaxed/simple;
	bh=SzZ1JiRbs0n/5+dngUWgyu6xHXGJCpWMaDdQaBU/t+I=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=dVIWKmWJUVbtYK7Eol1TftacVs/hw9IiE82OuPePnrQNr4SekBBUnvIunlDvZMV45q9Zesoh1hb3g8SuKGBldheeMnWPLJ/lhw7W/g6pb3xuZaeLNm+lEkOHDbwjO9kM40grHsvxXDpzBTcRR3rarmfHUiBqvOOtWlBv32UvP8g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SY5+jASB; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SY5+jASB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722345702; x=1753881702;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=SzZ1JiRbs0n/5+dngUWgyu6xHXGJCpWMaDdQaBU/t+I=;
  b=SY5+jASBCcZr0E5vVfSIt3jjMfB5FMlR0H8PQQHHkgjR8Foqtne8ULvF
   3cdLVFAhtkuoZR7BVWxprmAbbevmYC/TcyIC5PLd+OzqyKcvZh14mgYpf
   SyuJobA00+mWeviHIIJBYPKzL43x/tQsAGiYFwSqS/HcFYnuCWugm7wsT
   tSwt5sca1ukXQYR2XK0whdWJZBCfufcVYkiR61fpE2dZe/r69KH9v2xKX
   Y5ULxY8iAIPyecLtQnwCTaxwqIh8vZtGqa1K0igz9lzEY/bIAxMRsP0gw
   NEEVLagkR4zWX3b71+2DCVHOQG7wmV7Uz9O8xkgM/DVuM6Fc+ccVbCtNo
   g==;
X-CSE-ConnectionGUID: GWTRdjfcSL2EwM/GxB9p7Q==
X-CSE-MsgGUID: tdi8yJagQfKEqwnaQIU+Wg==
X-IronPort-AV: E=McAfee;i="6700,10204,11149"; a="30826161"
X-IronPort-AV: E=Sophos;i="6.09,248,1716274800"; 
   d="scan'208";a="30826161"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jul 2024 06:21:39 -0700
X-CSE-ConnectionGUID: b9HqrltZTR6EuKlGcrSFSg==
X-CSE-MsgGUID: v4i5ex/BRUinOeZuldnUmQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,248,1716274800"; 
   d="scan'208";a="54922073"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 30 Jul 2024 06:21:38 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sYmnH-000ssw-1U;
	Tue, 30 Jul 2024 13:21:35 +0000
Date: Tue, 30 Jul 2024 21:20:42 +0800
From: kernel test robot <lkp@intel.com>
To: David Hildenbrand <david@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [davidhildenbrand:folio_walk 1/11]
 arch/riscv/include/asm/sections.h:28:38: error: implicit declaration of
 function 'lm_alias'
Message-ID: <202407302141.shxmJD9r-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/davidhildenbrand/linux folio_walk
head:   96def1bb1fa490ec700ce6838ca58f4321a39af4
commit: 8219151a9ee46accd87b59292ae9f0c9b638dbd7 [1/11] mm/pagewalk: introduce folio_walk_start() + folio_walk_end()
config: riscv-allnoconfig (https://download.01.org/0day-ci/archive/20240730/202407302141.shxmJD9r-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240730/202407302141.shxmJD9r-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407302141.shxmJD9r-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/interrupt.h:22,
                    from arch/riscv/include/asm/irq.h:10,
                    from include/linux/irq.h:23,
                    from include/asm-generic/hardirq.h:17,
                    from ./arch/riscv/include/generated/asm/hardirq.h:1,
                    from include/linux/hardirq.h:11,
                    from include/linux/highmem.h:12,
                    from include/linux/pgtable.h:17,
                    from include/linux/mm.h:30,
                    from arch/riscv/kernel/asm-offsets.c:10:
   arch/riscv/include/asm/sections.h: In function 'is_va_kernel_lm_alias_text':
>> arch/riscv/include/asm/sections.h:28:38: error: implicit declaration of function 'lm_alias' [-Wimplicit-function-declaration]
      28 |         uintptr_t start = (uintptr_t)lm_alias(_start);
         |                                      ^~~~~~~~
   In file included from include/linux/highmem.h:14:
   include/linux/highmem-internal.h: In function 'kmap':
   include/linux/highmem-internal.h:165:16: error: implicit declaration of function 'page_address'; did you mean 'page_ptdesc'? [-Wimplicit-function-declaration]
     165 |         return page_address(page);
         |                ^~~~~~~~~~~~
         |                page_ptdesc
   include/linux/highmem-internal.h:165:16: error: returning 'int' from a function with return type 'void *' makes pointer from integer without a cast [-Wint-conversion]
     165 |         return page_address(page);
         |                ^~~~~~~~~~~~~~~~~~
   include/linux/highmem-internal.h: In function 'kmap_local_page':
   include/linux/highmem-internal.h:180:16: error: returning 'int' from a function with return type 'void *' makes pointer from integer without a cast [-Wint-conversion]
     180 |         return page_address(page);
         |                ^~~~~~~~~~~~~~~~~~
   include/linux/highmem-internal.h: In function 'kmap_local_folio':
>> include/linux/highmem-internal.h:185:43: error: returning 'size_t' {aka 'long unsigned int'} from a function with return type 'void *' makes pointer from integer without a cast [-Wint-conversion]
     185 |         return page_address(&folio->page) + offset;
         |                ~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~
   include/linux/highmem-internal.h: In function 'kmap_atomic':
   include/linux/highmem-internal.h:212:16: error: returning 'int' from a function with return type 'void *' makes pointer from integer without a cast [-Wint-conversion]
     212 |         return page_address(page);
         |                ^~~~~~~~~~~~~~~~~~
   In file included from arch/riscv/include/asm/bug.h:9,
                    from include/linux/bug.h:5,
                    from include/linux/mmdebug.h:5,
                    from include/linux/mm.h:6:
   include/linux/highmem.h: In function 'zero_user_segments':
   include/linux/highmem.h:275:23: error: implicit declaration of function 'page_size' [-Wimplicit-function-declaration]
     275 |         BUG_ON(end1 > page_size(page) || end2 > page_size(page));
         |                       ^~~~~~~~~
   include/linux/compiler.h:77:45: note: in definition of macro 'unlikely'
      77 | # define unlikely(x)    __builtin_expect(!!(x), 0)
         |                                             ^
   include/linux/highmem.h:275:9: note: in expansion of macro 'BUG_ON'
     275 |         BUG_ON(end1 > page_size(page) || end2 > page_size(page));
         |         ^~~~~~
   include/linux/highmem.h:284:25: error: implicit declaration of function 'compound_nr'; did you mean 'compound_head'? [-Wimplicit-function-declaration]
     284 |         for (i = 0; i < compound_nr(page); i++)
         |                         ^~~~~~~~~~~
         |                         compound_head
   include/linux/highmem.h: In function 'copy_user_highpage':
   include/linux/highmem.h:311:31: error: passing argument 1 of 'kmsan_unpoison_memory' makes pointer from integer without a cast [-Wint-conversion]
     311 |         kmsan_unpoison_memory(page_address(to), PAGE_SIZE);
         |                               ^~~~~~~~~~~~~~~~
         |                               |
         |                               int
   In file included from include/linux/instrumented.h:13,
                    from include/linux/atomic/atomic-instrumented.h:17,
                    from include/linux/atomic.h:82,
                    from include/linux/cpumask.h:14,
                    from arch/riscv/include/asm/processor.h:77,
                    from arch/riscv/include/asm/thread_info.h:37,
                    from include/linux/thread_info.h:60,
                    from include/asm-generic/preempt.h:5,
                    from ./arch/riscv/include/generated/asm/preempt.h:1,
                    from include/linux/preempt.h:79,
                    from include/linux/spinlock.h:56,
                    from include/linux/mmzone.h:8,
                    from include/linux/gfp.h:7,
                    from include/linux/mm.h:7:
   include/linux/kmsan-checks.h:81:54: note: expected 'const void *' but argument is of type 'int'
      81 | static inline void kmsan_unpoison_memory(const void *address, size_t size)
         |                                          ~~~~~~~~~~~~^~~~~~~
   In file included from include/linux/init.h:5,
                    from include/linux/printk.h:6,
                    from include/asm-generic/bug.h:22,
                    from arch/riscv/include/asm/bug.h:83:
   include/linux/highmem.h: In function 'memcpy_from_folio':
   include/linux/highmem.h:458:34: error: implicit declaration of function 'folio_size'; did you mean 'folio_page'? [-Wimplicit-function-declaration]
     458 |         VM_BUG_ON(offset + len > folio_size(folio));
         |                                  ^~~~~~~~~~
   include/linux/build_bug.h:30:63: note: in definition of macro 'BUILD_BUG_ON_INVALID'
      30 | #define BUILD_BUG_ON_INVALID(e) ((void)(sizeof((__force long)(e))))
         |                                                               ^
   include/linux/highmem.h:458:9: note: in expansion of macro 'VM_BUG_ON'
     458 |         VM_BUG_ON(offset + len > folio_size(folio));
         |         ^~~~~~~~~
   include/linux/highmem.h:465:41: error: implicit declaration of function 'offset_in_page' [-Wimplicit-function-declaration]
     465 |                     chunk > PAGE_SIZE - offset_in_page(offset))
         |                                         ^~~~~~~~~~~~~~
   include/linux/highmem.h: In function 'memcpy_from_file_folio':
   include/linux/highmem.h:597:25: error: implicit declaration of function 'offset_in_folio' [-Wimplicit-function-declaration]
     597 |         size_t offset = offset_in_folio(folio, pos);
         |                         ^~~~~~~~~~~~~~~
   include/linux/highmem.h: In function 'folio_release_kmap':
   include/linux/highmem.h:662:9: error: implicit declaration of function 'folio_put'; did you mean 'folio_page'? [-Wimplicit-function-declaration]
     662 |         folio_put(folio);
         |         ^~~~~~~~~
         |         folio_page
   include/linux/mm.h: At top level:
   include/linux/mm.h:1306:29: error: conflicting types for 'page_size'; have 'long unsigned int(struct page *)'
    1306 | static inline unsigned long page_size(struct page *page)
         |                             ^~~~~~~~~
   include/linux/highmem.h:275:23: note: previous implicit declaration of 'page_size' with type 'int()'
     275 |         BUG_ON(end1 > page_size(page) || end2 > page_size(page));
         |                       ^~~~~~~~~
   include/linux/compiler.h:77:45: note: in definition of macro 'unlikely'
      77 | # define unlikely(x)    __builtin_expect(!!(x), 0)
         |                                             ^
   include/linux/highmem.h:275:9: note: in expansion of macro 'BUG_ON'
     275 |         BUG_ON(end1 > page_size(page) || end2 > page_size(page));
         |         ^~~~~~
   include/linux/mm.h:1483:20: warning: conflicting types for 'folio_put'; have 'void(struct folio *)'
    1483 | static inline void folio_put(struct folio *folio)
         |                    ^~~~~~~~~
   include/linux/mm.h:1483:20: error: static declaration of 'folio_put' follows non-static declaration
   include/linux/highmem.h:662:9: note: previous implicit declaration of 'folio_put' with type 'void(struct folio *)'
     662 |         folio_put(folio);
         |         ^~~~~~~~~
   include/linux/mm.h:2076:29: error: conflicting types for 'compound_nr'; have 'long unsigned int(struct page *)'
    2076 | static inline unsigned long compound_nr(struct page *page)
         |                             ^~~~~~~~~~~
   include/linux/highmem.h:284:25: note: previous implicit declaration of 'compound_nr' with type 'int()'
     284 |         for (i = 0; i < compound_nr(page); i++)
         |                         ^~~~~~~~~~~
>> include/linux/mm.h:2142:22: error: conflicting types for 'folio_size'; have 'size_t(const struct folio *)' {aka 'long unsigned int(const struct folio *)'}
    2142 | static inline size_t folio_size(const struct folio *folio)
         |                      ^~~~~~~~~~
   include/linux/highmem.h:458:34: note: previous implicit declaration of 'folio_size' with type 'int()'
     458 |         VM_BUG_ON(offset + len > folio_size(folio));
         |                                  ^~~~~~~~~~
   include/linux/build_bug.h:30:63: note: in definition of macro 'BUILD_BUG_ON_INVALID'
      30 | #define BUILD_BUG_ON_INVALID(e) ((void)(sizeof((__force long)(e))))
         |                                                               ^
   include/linux/highmem.h:458:9: note: in expansion of macro 'VM_BUG_ON'
     458 |         VM_BUG_ON(offset + len > folio_size(folio));
         |         ^~~~~~~~~
   make[3]: *** [scripts/Makefile.build:117: arch/riscv/kernel/asm-offsets.s] Error 1
   make[3]: Target 'prepare' not remade because of errors.
   make[2]: *** [Makefile:1193: prepare0] Error 2
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:224: __sub-make] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:224: __sub-make] Error 2
   make: Target 'prepare' not remade because of errors.


vim +/lm_alias +28 arch/riscv/include/asm/sections.h

e5c35fa0401971 Alexandre Ghiti 2021-06-24  25  
e5c35fa0401971 Alexandre Ghiti 2021-06-24  26  static inline bool is_va_kernel_lm_alias_text(uintptr_t va)
e5c35fa0401971 Alexandre Ghiti 2021-06-24  27  {
e5c35fa0401971 Alexandre Ghiti 2021-06-24 @28  	uintptr_t start = (uintptr_t)lm_alias(_start);
e5c35fa0401971 Alexandre Ghiti 2021-06-24  29  	uintptr_t end = (uintptr_t)lm_alias(__init_data_begin);
e5c35fa0401971 Alexandre Ghiti 2021-06-24  30  
e5c35fa0401971 Alexandre Ghiti 2021-06-24  31  	return va >= start && va < end;
e5c35fa0401971 Alexandre Ghiti 2021-06-24  32  }
e5c35fa0401971 Alexandre Ghiti 2021-06-24  33  

:::::: The code at line 28 was first introduced by commit
:::::: e5c35fa0401971701dcd7675f471b664698244dd riscv: Map the kernel with correct permissions the first time

:::::: TO: Alexandre Ghiti <alex@ghiti.fr>
:::::: CC: Palmer Dabbelt <palmerdabbelt@google.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
