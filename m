Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9683C2BAF8
	for <oe-kbuild-all@lists.linux.dev>; Sat, 27 Dec 2025 06:54:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766818453; cv=none; b=SC5IDmcFoiF29m41cy7Re8AIrZYsLFOIlOEQJiTDhxwUs1pzlrdyRXi5XE0bZpoQyfVS8/wUIzxKZjJXS2+IdY8rmE5zuS4C2bj/iFhwU5L1MJj8/VexM4V3FVfFknrjHnjk3WTybYlXpZ/FjBFi+aJBRO0PKNA/BCGsLxzZ8dQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766818453; c=relaxed/simple;
	bh=kSUKoVk3L63jU1wepUgWCIX0s+CjDa/cf4kE6tSCUgk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=cGfRbX1HNcb+jyb8X21JS0Df4KesmsGVY0ejBbanXB1PD+W6L/9NQDV+AoEYEfD06bdfBczPXyOoRGk3j7dmvvfZvpqMwIib5h7WcU114ZChxc7DS+ogvT79y+Arn9ddksRvVvZ7QCOIKHioLIHBJOXxIY2ziqI36VUNSKAyM5Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BmTa6HKr; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BmTa6HKr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766818451; x=1798354451;
  h=date:from:to:cc:subject:message-id;
  bh=kSUKoVk3L63jU1wepUgWCIX0s+CjDa/cf4kE6tSCUgk=;
  b=BmTa6HKrIeoqoxhdfoRPdXa0pDTbkGawLgjtb0FXpLEsK5UBDK4VSheE
   AuJqUYX+t9PBCrglizw3ZaGlMFcGBuCIn3o4/jiC64RTaKaO/gQ8Cp4/T
   vTljuXX3BV2g3CLrufbahJV/99u/Xbe+BjkWVmSooT+XVKAaSqZ6nK0Ef
   aojgWRHWfc6jkjq6pR8FlCOtRQE0SBC+ly+gNrHv+84r0cIJOlgBqyR3V
   YHAlJ2KLQjyFqbZpQ92FrFfNkhE6GW7Qk3ZVjanRxUdL0K2IH2sQz8CFJ
   z3EIgDCfK88QrZQt0ff9dNXqFZuUCpGTJO1yHjCScXoAyl8wbJ7gZ+snN
   Q==;
X-CSE-ConnectionGUID: V1S9auMWQM6AQVhsRy5ANg==
X-CSE-MsgGUID: cEv5Jq/RTWWi52FWwbe8hQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11653"; a="68422586"
X-IronPort-AV: E=Sophos;i="6.21,180,1763452800"; 
   d="scan'208";a="68422586"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Dec 2025 22:54:11 -0800
X-CSE-ConnectionGUID: noe7uegASauLP54PBXFKag==
X-CSE-MsgGUID: vBvAjW/tRaGKne4r8YkA/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,180,1763452800"; 
   d="scan'208";a="205041977"
Received: from lkp-server02.sh.intel.com (HELO dd3453e2b682) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 26 Dec 2025 22:54:10 -0800
Received: from kbuild by dd3453e2b682 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vZOBi-000000005cj-4Boc;
	Sat, 27 Dec 2025 06:54:07 +0000
Date: Sat, 27 Dec 2025 14:53:40 +0800
From: kernel test robot <lkp@intel.com>
To: alexs@kernel.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [alexshi:pmdunify 3/6]
 arch/sh/include/asm/pgtable-3level.h:38:29: error: 'pmd_t' has no member
 named 'entry'
Message-ID: <202512272012.bgl862Eo-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Alex,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://github.com/alexshi/linux.git pmdunify
head:   694b5dc7bcd7ba28db0bc95b24a78861bdffefc7
commit: 38ff6617fbf7d3b0ad7fda7fb1c5b0cdca9f7123 [3/6] arch/x86: unify pmd_t/pud_t/p4d_t member name to entry
config: sh-defconfig (https://download.01.org/0day-ci/archive/20251227/202512272012.bgl862Eo-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251227/202512272012.bgl862Eo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512272012.bgl862Eo-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from arch/sh/include/asm/pgtable.h:13,
                    from include/linux/pgtable.h:6,
                    from include/linux/mm.h:31,
                    from arch/sh/kernel/asm-offsets.c:15:
   arch/sh/include/asm/pgtable_32.h: In function 'pmd_page_vaddr':
>> arch/sh/include/asm/pgtable-3level.h:38:29: error: 'pmd_t' has no member named 'entry'
      38 | #define pmd_val(x)      ((x).entry)
         |                             ^
   arch/sh/include/asm/pgtable_32.h:397:31: note: in expansion of macro 'pmd_val'
     397 |         return (unsigned long)pmd_val(pmd);
         |                               ^~~~~~~
   In file included from arch/sh/include/asm/pgtable.h:80:
>> arch/sh/include/asm/pgtable_32.h:395:50: warning: parameter 'pmd' set but not used [-Wunused-but-set-parameter]
     395 | static inline unsigned long pmd_page_vaddr(pmd_t pmd)
         |                                            ~~~~~~^~~
   include/linux/pgtable.h: In function 'virt_to_kpte':
>> arch/sh/include/asm/pgtable-3level.h:38:29: error: 'pmd_t' has no member named 'entry'
      38 | #define pmd_val(x)      ((x).entry)
         |                             ^
   arch/sh/include/asm/pgtable_32.h:327:27: note: in expansion of macro 'pmd_val'
     327 | #define pmd_none(x)     (!pmd_val(x))
         |                           ^~~~~~~
   include/linux/pgtable.h:198:16: note: in expansion of macro 'pmd_none'
     198 |         return pmd_none(*pmd) ? NULL : pte_offset_kernel(pmd, vaddr);
         |                ^~~~~~~~
   include/linux/pgtable.h: In function 'pmd_same':
>> arch/sh/include/asm/pgtable-3level.h:38:29: error: 'pmd_t' has no member named 'entry'
      38 | #define pmd_val(x)      ((x).entry)
         |                             ^
   include/linux/pgtable.h:1119:16: note: in expansion of macro 'pmd_val'
    1119 |         return pmd_val(pmd_a) == pmd_val(pmd_b);
         |                ^~~~~~~
>> arch/sh/include/asm/pgtable-3level.h:38:29: error: 'pmd_t' has no member named 'entry'
      38 | #define pmd_val(x)      ((x).entry)
         |                             ^
   include/linux/pgtable.h:1119:34: note: in expansion of macro 'pmd_val'
    1119 |         return pmd_val(pmd_a) == pmd_val(pmd_b);
         |                                  ^~~~~~~
>> include/linux/pgtable.h:1117:34: warning: parameter 'pmd_a' set but not used [-Wunused-but-set-parameter]
    1117 | static inline int pmd_same(pmd_t pmd_a, pmd_t pmd_b)
         |                            ~~~~~~^~~~~
>> include/linux/pgtable.h:1117:47: warning: parameter 'pmd_b' set but not used [-Wunused-but-set-parameter]
    1117 | static inline int pmd_same(pmd_t pmd_a, pmd_t pmd_b)
         |                                         ~~~~~~^~~~~
   include/linux/pgtable.h: In function 'pmd_none_or_clear_bad':
>> arch/sh/include/asm/pgtable-3level.h:38:29: error: 'pmd_t' has no member named 'entry'
      38 | #define pmd_val(x)      ((x).entry)
         |                             ^
   arch/sh/include/asm/pgtable_32.h:327:27: note: in expansion of macro 'pmd_val'
     327 | #define pmd_none(x)     (!pmd_val(x))
         |                           ^~~~~~~
   include/linux/pgtable.h:1327:13: note: in expansion of macro 'pmd_none'
    1327 |         if (pmd_none(*pmd))
         |             ^~~~~~~~
   In file included from include/linux/export.h:5,
                    from include/linux/linkage.h:7,
                    from arch/sh/include/asm/bug.h:5,
                    from include/linux/bug.h:5,
                    from include/linux/mmdebug.h:5,
                    from include/linux/mm.h:6:
>> arch/sh/include/asm/pgtable-3level.h:38:29: error: 'pmd_t' has no member named 'entry'
      38 | #define pmd_val(x)      ((x).entry)
         |                             ^
   include/linux/compiler.h:77:45: note: in definition of macro 'unlikely'
      77 | # define unlikely(x)    __builtin_expect(!!(x), 0)
         |                                             ^
   arch/sh/include/asm/pgtable_32.h:330:26: note: in expansion of macro 'pmd_val'
     330 | #define pmd_bad(x)      (pmd_val(x) & ~PAGE_MASK)
         |                          ^~~~~~~
   include/linux/pgtable.h:1329:22: note: in expansion of macro 'pmd_bad'
    1329 |         if (unlikely(pmd_bad(*pmd))) {
         |                      ^~~~~~~
   In file included from include/linux/mmzone.h:22,
                    from include/linux/gfp.h:7,
                    from include/linux/mm.h:7:
   include/linux/mm.h: In function 'pte_lockptr':
>> arch/sh/include/asm/pgtable-3level.h:38:29: error: 'pmd_t' has no member named 'entry'
      38 | #define pmd_val(x)      ((x).entry)
         |                             ^
   include/linux/mm_types.h:633:52: note: in definition of macro 'page_ptdesc'
     633 | #define page_ptdesc(p)                  (_Generic((p),                  \
         |                                                    ^
   include/asm-generic/memory_model.h:74:21: note: in expansion of macro '__pfn_to_page'
      74 | #define pfn_to_page __pfn_to_page
         |                     ^~~~~~~~~~~~~
   arch/sh/include/asm/page.h:130:25: note: in expansion of macro '___pa'
     130 | #define __pa(x)         ___pa((unsigned long)x)
         |                         ^~~~~
   arch/sh/include/asm/page.h:157:45: note: in expansion of macro '__pa'
     157 | #define virt_to_page(kaddr)     pfn_to_page(__pa(kaddr) >> PAGE_SHIFT)
         |                                             ^~~~
   arch/sh/include/asm/pgtable_32.h:401:34: note: in expansion of macro 'virt_to_page'
     401 | #define pmd_page(pmd)           (virt_to_page(pmd_val(pmd)))
         |                                  ^~~~~~~~~~~~
   arch/sh/include/asm/pgtable_32.h:401:47: note: in expansion of macro 'pmd_val'
     401 | #define pmd_page(pmd)           (virt_to_page(pmd_val(pmd)))
         |                                               ^~~~~~~
   include/linux/mm.h:3260:39: note: in expansion of macro 'pmd_page'
    3260 |         return ptlock_ptr(page_ptdesc(pmd_page(*pmd)));
         |                                       ^~~~~~~~
>> arch/sh/include/asm/pgtable-3level.h:38:29: error: 'pmd_t' has no member named 'entry'
      38 | #define pmd_val(x)      ((x).entry)
         |                             ^
   include/linux/mm_types.h:634:65: note: in definition of macro 'page_ptdesc'
     634 |         const struct page *:            (const struct ptdesc *)(p),     \
         |                                                                 ^
   include/asm-generic/memory_model.h:74:21: note: in expansion of macro '__pfn_to_page'
      74 | #define pfn_to_page __pfn_to_page
         |                     ^~~~~~~~~~~~~
   arch/sh/include/asm/page.h:130:25: note: in expansion of macro '___pa'
     130 | #define __pa(x)         ___pa((unsigned long)x)
         |                         ^~~~~
   arch/sh/include/asm/page.h:157:45: note: in expansion of macro '__pa'
     157 | #define virt_to_page(kaddr)     pfn_to_page(__pa(kaddr) >> PAGE_SHIFT)
         |                                             ^~~~
   arch/sh/include/asm/pgtable_32.h:401:34: note: in expansion of macro 'virt_to_page'
     401 | #define pmd_page(pmd)           (virt_to_page(pmd_val(pmd)))
         |                                  ^~~~~~~~~~~~
   arch/sh/include/asm/pgtable_32.h:401:47: note: in expansion of macro 'pmd_val'
     401 | #define pmd_page(pmd)           (virt_to_page(pmd_val(pmd)))
         |                                               ^~~~~~~
   include/linux/mm.h:3260:39: note: in expansion of macro 'pmd_page'
    3260 |         return ptlock_ptr(page_ptdesc(pmd_page(*pmd)));
         |                                       ^~~~~~~~
>> arch/sh/include/asm/pgtable-3level.h:38:29: error: 'pmd_t' has no member named 'entry'
      38 | #define pmd_val(x)      ((x).entry)
         |                             ^
   include/linux/mm_types.h:635:59: note: in definition of macro 'page_ptdesc'
     635 |         struct page *:                  (struct ptdesc *)(p)))
         |                                                           ^
   include/asm-generic/memory_model.h:74:21: note: in expansion of macro '__pfn_to_page'
      74 | #define pfn_to_page __pfn_to_page
         |                     ^~~~~~~~~~~~~
   arch/sh/include/asm/page.h:130:25: note: in expansion of macro '___pa'
     130 | #define __pa(x)         ___pa((unsigned long)x)
         |                         ^~~~~
   arch/sh/include/asm/page.h:157:45: note: in expansion of macro '__pa'
     157 | #define virt_to_page(kaddr)     pfn_to_page(__pa(kaddr) >> PAGE_SHIFT)
         |                                             ^~~~
   arch/sh/include/asm/pgtable_32.h:401:34: note: in expansion of macro 'virt_to_page'
     401 | #define pmd_page(pmd)           (virt_to_page(pmd_val(pmd)))
         |                                  ^~~~~~~~~~~~
   arch/sh/include/asm/pgtable_32.h:401:47: note: in expansion of macro 'pmd_val'
     401 | #define pmd_page(pmd)           (virt_to_page(pmd_val(pmd)))
         |                                               ^~~~~~~
   include/linux/mm.h:3260:39: note: in expansion of macro 'pmd_page'
    3260 |         return ptlock_ptr(page_ptdesc(pmd_page(*pmd)));
         |                                       ^~~~~~~~
   make[3]: *** [scripts/Makefile.build:182: arch/sh/kernel/asm-offsets.s] Error 1
   make[3]: Target 'prepare' not remade because of errors.
   make[2]: *** [Makefile:1314: prepare0] Error 2
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:248: __sub-make] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:248: __sub-make] Error 2
   make: Target 'prepare' not remade because of errors.


vim +38 arch/sh/include/asm/pgtable-3level.h

    27	
    28	#define pmd_ERROR(e) \
    29		printk("%s:%d: bad pmd %016llx.\n", __FILE__, __LINE__, pmd_val(e))
    30	
    31	typedef union {
    32		struct {
    33			unsigned long pmd_low;
    34			unsigned long pmd_high;
    35		};
    36		unsigned long long pmd;
    37	} pmd_t;
  > 38	#define pmd_val(x)	((x).entry)
    39	#define __pmd(x)	((pmd_t) { .entry = (x) } )
    40	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
