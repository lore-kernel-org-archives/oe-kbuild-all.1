Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C9E54749ED
	for <oe-kbuild-all@lists.linux.dev>; Fri, 14 Aug 2026 14:35:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786718137; cv=none; b=aaKpEcF7IkGfbfRqOP+SSzIUOcIM86aJniSljqNELpn9k4iqdZj0JVc8VKoQTQ442qNoHwp9Tu0hxKy7FCvQbcIqJiMjyzQ3NVPKfEncZsfqoPakroPtaREDldZciIQVdgO8FEXUJgyb1x74k1WK0zLpDV72vSycnDrYqMir8eg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786718137; c=relaxed/simple;
	bh=cCt3r/t/gK3Rb/baTGXOwbzNUz9NZVMFdfNxlTBT4Ws=;
	h=Date:From:To:Cc:Subject:Message-ID; b=jTLUUD1uZ8qlRJJcnLFEBPmiHHxnwQC9xQeIPYirX9yZ9+VHwjLqbxVUfjvgYfGIeFxr27Mgzh5VPC0EOBAFKB9iOj2L2WK9WdW+Ur7XkNZ3FSZReqq7d0cIRLV0kLPUvB4JRaUdLWhzAxtSbROMgvFDK2+ycYJkjynrIZC9sP8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fYd9eXpe; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fYd9eXpe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786718133; x=1818254133;
  h=date:from:to:cc:subject:message-id;
  bh=cCt3r/t/gK3Rb/baTGXOwbzNUz9NZVMFdfNxlTBT4Ws=;
  b=fYd9eXpeMIpjWnGsX1P0NTrY7g5vwsdg6AMwwtlC9lNrU+W0RALXuNzJ
   2YwX4pv8h0K990iFgFR6u7Izybs8V02XfpDxZ0cysnji1qP8fgViEctDv
   e0fiL3m9TbngTNgohlGlV/cdq6giK0muOjZK0hV5l33+6HmAba/NLN4kc
   7PDr4ELWRxaXAhKIWiTqs3c5fH902aE+SH6F+mFIc/haRZ4zo1f6CHn7V
   9iDF7v/82x2xXyqPGgHsdMIbAeVm4I0is8nC9ejH+pYyPNV8KLVbM+xyF
   1RopqkU/j9hH7o5iHkNFo9SXdIgPBR5V5hSciFXujaiNjLXOzqCbsqmPL
   w==;
X-CSE-ConnectionGUID: 4eBEPTDRT1iJNqd+9Jty+w==
X-CSE-MsgGUID: DOIfHfjsSjKquvrb83dQAw==
X-IronPort-AV: E=McAfee;i="6800,10657,11875"; a="112842095"
X-IronPort-AV: E=Sophos;i="6.25,222,1779174000"; 
   d="scan'208";a="112842095"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Aug 2026 07:35:26 -0700
X-CSE-ConnectionGUID: CIOM/p03QPmFR+BLNcoOfA==
X-CSE-MsgGUID: e2skKIHPTHqrobqSUXoLxA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,222,1779174000"; 
   d="scan'208";a="262478323"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 14 Aug 2026 07:35:25 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wut0E-00000000ZF2-3DOS;
	Fri, 14 Aug 2026 14:35:22 +0000
Date: Fri, 14 Aug 2026 22:35:18 +0800
From: kernel test robot <lkp@intel.com>
To: Matthew Wilcox <willy@infradead.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [willy-pagecache:headers 12/18]
 arch/sparc/include/asm/page_64.h:78:24: error: request for member 'pgd' in
 something not a structure or union
Message-ID: <202608142231.ejzF7wmj-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   git://git.infradead.org/users/willy/pagecache headers
head:   33e73a1e8175a4735e962dec9465e64e85d0a63d
commit: 6343ad5713adc6443ae88978dd3f981341d8dba1 [12/18] drm: Remove pagemap from ttm_tt.h header
config: sparc64-randconfig-001-20260814 (https://download.01.org/0day-ci/archive/20260814/202608142231.ejzF7wmj-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260814/202608142231.ejzF7wmj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608142231.ejzF7wmj-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from arch/sparc/include/asm/pgtable_64.h:16,
                    from arch/sparc/include/asm/pgtable.h:5,
                    from include/linux/pgtable.h:6,
                    from include/drm/ttm/ttm_caching.h:28,
                    from include/drm/ttm/ttm_tt.h:31,
                    from drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.c:8:
   include/asm-generic/pgtable-nop4d.h:9:18: error: unknown type name 'pgd_t'
    typedef struct { pgd_t pgd; } p4d_t;
                     ^~~~~
   include/asm-generic/pgtable-nop4d.h:21:28: error: unknown type name 'pgd_t'; did you mean 'p4d_t'?
    static inline int pgd_none(pgd_t pgd)  { return 0; }
                               ^~~~~
                               p4d_t
   include/asm-generic/pgtable-nop4d.h:22:27: error: unknown type name 'pgd_t'; did you mean 'p4d_t'?
    static inline int pgd_bad(pgd_t pgd)  { return 0; }
                              ^~~~~
                              p4d_t
   include/asm-generic/pgtable-nop4d.h:23:31: error: unknown type name 'pgd_t'; did you mean 'p4d_t'?
    static inline int pgd_present(pgd_t pgd) { return 1; }
                                  ^~~~~
                                  p4d_t
   include/asm-generic/pgtable-nop4d.h:24:30: error: unknown type name 'pgd_t'; did you mean 'p4d_t'?
    static inline void pgd_clear(pgd_t *pgd) { }
                                 ^~~~~
                                 p4d_t
   include/asm-generic/pgtable-nop4d.h:35:33: error: unknown type name 'pgd_t'; did you mean 'p4d_t'?
    static inline p4d_t *p4d_offset(pgd_t *pgd, unsigned long address)
                                    ^~~~~
                                    p4d_t
   In file included from arch/sparc/include/asm/page.h:6,
                    from arch/sparc/include/asm/pgtable_64.h:23,
                    from arch/sparc/include/asm/pgtable.h:5,
                    from include/linux/pgtable.h:6,
                    from include/drm/ttm/ttm_caching.h:28,
                    from include/drm/ttm/ttm_tt.h:31,
                    from drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.c:8:
   include/linux/pgtable.h: In function 'pud_offset':
>> arch/sparc/include/asm/page_64.h:78:24: error: request for member 'pgd' in something not a structure or union
    #define pgd_val(x) ((x).pgd)
                           ^
   arch/sparc/include/asm/page_64.h:146:46: note: in definition of macro '__va'
    #define __va(x)   ((void *)((unsigned long) (x) + PAGE_OFFSET))
                                                 ^
   include/asm-generic/pgtable-nop4d.h:40:24: note: in expansion of macro 'pgd_val'
    #define p4d_val(x)    (pgd_val((x).pgd))
                           ^~~~~~~
   arch/sparc/include/asm/pgtable_64.h:859:18: note: in expansion of macro 'p4d_val'
     ((pud_t *) __va(p4d_val(p4d)))
                     ^~~~~~~
   include/linux/pgtable.h:135:9: note: in expansion of macro 'p4d_pgtable'
     return p4d_pgtable(*p4d) + pud_index(address);
            ^~~~~~~~~~~
   In file included from include/drm/ttm/ttm_caching.h:28,
                    from include/drm/ttm/ttm_tt.h:31,
                    from drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.c:8:
   include/linux/pgtable.h: In function 'pmd_off':
   include/linux/pgtable.h:167:31: error: implicit declaration of function 'p4d_offset'; did you mean 'pud_offset'? [-Werror=implicit-function-declaration]
     return pmd_offset(pud_offset(p4d_offset(pgd_offset(mm, va), va), va), va);
                                  ^~~~~~~~~~
                                  pud_offset
>> include/linux/pgtable.h:167:31: warning: passing argument 1 of 'pud_offset' makes pointer from integer without a cast [-Wint-conversion]
     return pmd_offset(pud_offset(p4d_offset(pgd_offset(mm, va), va), va), va);
                                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/pgtable.h:133:40: note: expected 'p4d_t *' {aka 'struct <anonymous> *'} but argument is of type 'int'
    static inline pud_t *pud_offset(p4d_t *p4d, unsigned long address)
                                    ~~~~~~~^~~
   include/linux/pgtable.h: In function 'pmd_off_k':
   include/linux/pgtable.h:172:31: warning: passing argument 1 of 'pud_offset' makes pointer from integer without a cast [-Wint-conversion]
     return pmd_offset(pud_offset(p4d_offset(pgd_offset_k(va), va), va), va);
                                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/pgtable.h:133:40: note: expected 'p4d_t *' {aka 'struct <anonymous> *'} but argument is of type 'int'
    static inline pud_t *pud_offset(p4d_t *p4d, unsigned long address)
                                    ~~~~~~~^~~
   In file included from arch/sparc/include/asm/page.h:6,
                    from arch/sparc/include/asm/pgtable_64.h:23,
                    from arch/sparc/include/asm/pgtable.h:5,
                    from include/linux/pgtable.h:6,
                    from include/drm/ttm/ttm_caching.h:28,
                    from include/drm/ttm/ttm_tt.h:31,
                    from drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.c:8:
   include/linux/pgtable.h: In function 'p4d_same':
>> arch/sparc/include/asm/page_64.h:78:24: error: request for member 'pgd' in something not a structure or union
    #define pgd_val(x) ((x).pgd)
                           ^
   include/asm-generic/pgtable-nop4d.h:40:24: note: in expansion of macro 'pgd_val'
    #define p4d_val(x)    (pgd_val((x).pgd))
                           ^~~~~~~
   include/linux/pgtable.h:1384:9: note: in expansion of macro 'p4d_val'
     return p4d_val(p4d_a) == p4d_val(p4d_b);
            ^~~~~~~
>> arch/sparc/include/asm/page_64.h:78:24: error: request for member 'pgd' in something not a structure or union
    #define pgd_val(x) ((x).pgd)
                           ^
   include/asm-generic/pgtable-nop4d.h:40:24: note: in expansion of macro 'pgd_val'
    #define p4d_val(x)    (pgd_val((x).pgd))
                           ^~~~~~~
   include/linux/pgtable.h:1384:27: note: in expansion of macro 'p4d_val'
     return p4d_val(p4d_a) == p4d_val(p4d_b);
                              ^~~~~~~
   In file included from include/drm/ttm/ttm_caching.h:28,
                    from include/drm/ttm/ttm_tt.h:31,
                    from drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.c:8:
   include/linux/pgtable.h:1382:34: warning: parameter 'p4d_a' set but not used [-Wunused-but-set-parameter]
    static inline int p4d_same(p4d_t p4d_a, p4d_t p4d_b)
                               ~~~~~~^~~~~
   include/linux/pgtable.h:1382:47: warning: parameter 'p4d_b' set but not used [-Wunused-but-set-parameter]
    static inline int p4d_same(p4d_t p4d_a, p4d_t p4d_b)
                                            ~~~~~~^~~~~
   include/linux/pgtable.h: In function 'pgd_none_or_clear_bad':
   include/linux/pgtable.h:1544:6: error: implicit declaration of function 'pgd_none'; did you mean 'p4d_none'? [-Werror=implicit-function-declaration]
     if (pgd_none(*pgd))
         ^~~~~~~~
         p4d_none
   In file included from include/linux/export.h:5,
                    from drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.c:6:
   include/linux/pgtable.h:1546:15: error: implicit declaration of function 'pgd_bad'; did you mean 'pmd_bad'? [-Werror=implicit-function-declaration]
     if (unlikely(pgd_bad(*pgd))) {
                  ^~~~~~~
   include/linux/compiler.h:77:42: note: in definition of macro 'unlikely'
    # define unlikely(x) __builtin_expect(!!(x), 0)
                                             ^
   In file included from arch/sparc/include/asm/page.h:6,
                    from arch/sparc/include/asm/pgtable_64.h:23,
                    from arch/sparc/include/asm/pgtable.h:5,
                    from include/linux/pgtable.h:6,
                    from include/drm/ttm/ttm_caching.h:28,
                    from include/drm/ttm/ttm_tt.h:31,
                    from drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.c:8:
   include/linux/pgtable.h: In function 'p4d_none_or_clear_bad':
>> arch/sparc/include/asm/page_64.h:78:24: error: request for member 'pgd' in something not a structure or union
    #define pgd_val(x) ((x).pgd)
                           ^
   include/asm-generic/pgtable-nop4d.h:40:24: note: in expansion of macro 'pgd_val'
    #define p4d_val(x)    (pgd_val((x).pgd))
                           ^~~~~~~
   arch/sparc/include/asm/pgtable_64.h:809:27: note: in expansion of macro 'p4d_val'
    #define p4d_none(p4d)   (!p4d_val(p4d))
                              ^~~~~~~
   include/linux/pgtable.h:1555:6: note: in expansion of macro 'p4d_none'
     if (p4d_none(*p4d))
         ^~~~~~~~
   In file included from include/linux/export.h:5,
                    from drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.c:6:
>> arch/sparc/include/asm/page_64.h:78:24: error: request for member 'pgd' in something not a structure or union
    #define pgd_val(x) ((x).pgd)
                           ^
   include/linux/compiler.h:77:42: note: in definition of macro 'unlikely'
    # define unlikely(x) __builtin_expect(!!(x), 0)
                                             ^
   include/asm-generic/pgtable-nop4d.h:40:24: note: in expansion of macro 'pgd_val'
    #define p4d_val(x)    (pgd_val((x).pgd))
                           ^~~~~~~
   arch/sparc/include/asm/pgtable_64.h:811:25: note: in expansion of macro 'p4d_val'
    #define p4d_bad(p4d)   (p4d_val(p4d) & ~PAGE_MASK)
                            ^~~~~~~
   include/linux/pgtable.h:1557:15: note: in expansion of macro 'p4d_bad'
     if (unlikely(p4d_bad(*p4d))) {
                  ^~~~~~~
   In file included from include/linux/scatterlist.h:8,
                    from include/linux/dma-buf.h:19,
                    from include/drm/drm_gem.h:38,
                    from include/drm/ttm/ttm_bo.h:34,
                    from drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.h:10,
                    from drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.c:10:
   include/linux/mm.h: In function 'p4d_alloc':
>> include/linux/mm.h:3697:8: warning: pointer/integer type mismatch in conditional expression
      NULL : p4d_offset(pgd, address);
           ^
   In file included from include/linux/export.h:5,
                    from drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.c:6:
   include/linux/mm.h: In function 'pud_alloc':
>> arch/sparc/include/asm/page_64.h:78:24: error: request for member 'pgd' in something not a structure or union
    #define pgd_val(x) ((x).pgd)
                           ^
   include/linux/compiler.h:77:42: note: in definition of macro 'unlikely'
    # define unlikely(x) __builtin_expect(!!(x), 0)
                                             ^
   include/asm-generic/pgtable-nop4d.h:40:24: note: in expansion of macro 'pgd_val'
    #define p4d_val(x)    (pgd_val((x).pgd))
                           ^~~~~~~
   arch/sparc/include/asm/pgtable_64.h:809:27: note: in expansion of macro 'p4d_val'
    #define p4d_none(p4d)   (!p4d_val(p4d))
                              ^~~~~~~
   include/linux/mm.h:3703:19: note: in expansion of macro 'p4d_none'
     return (unlikely(p4d_none(*p4d)) && __pud_alloc(mm, p4d, address)) ?
                      ^~~~~~~~
   cc1: some warnings being treated as errors


vim +/pgd +78 arch/sparc/include/asm/page_64.h

f5e706ad886b6a include/asm-sparc/page_64.h      Sam Ravnborg    2008-07-17  73  
f5e706ad886b6a include/asm-sparc/page_64.h      Sam Ravnborg    2008-07-17  74  #define pte_val(x)	((x).pte)
f5e706ad886b6a include/asm-sparc/page_64.h      Sam Ravnborg    2008-07-17  75  #define iopte_val(x)	((x).iopte)
f5e706ad886b6a include/asm-sparc/page_64.h      Sam Ravnborg    2008-07-17  76  #define pmd_val(x)      ((x).pmd)
ac55c768143aa3 arch/sparc/include/asm/page_64.h David S. Miller 2014-09-26  77  #define pud_val(x)      ((x).pud)
f5e706ad886b6a include/asm-sparc/page_64.h      Sam Ravnborg    2008-07-17 @78  #define pgd_val(x)	((x).pgd)
f5e706ad886b6a include/asm-sparc/page_64.h      Sam Ravnborg    2008-07-17  79  #define pgprot_val(x)	((x).pgprot)
f5e706ad886b6a include/asm-sparc/page_64.h      Sam Ravnborg    2008-07-17  80  

:::::: The code at line 78 was first introduced by commit
:::::: f5e706ad886b6a5eb59637830110b09ccebf01c5 sparc: join the remaining header files

:::::: TO: Sam Ravnborg <sam@ravnborg.org>
:::::: CC: David S. Miller <davem@davemloft.net>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
