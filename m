Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CA9D22F16F
	for <oe-kbuild-all@lists.linux.dev>; Fri, 21 Mar 2025 18:43:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742582622; cv=none; b=u+r0icXcEWPPGL5AAaaEwzg606ddPjBDZ+Le+sK0HhPkTaWu8xahcsKwnwivW6D9wRGVm4CU/xQA97v9w4D6TDOyomviXNtXEXQs0VKo19DYJ+pKkZyCni1TbjWr+Nlxme7MSEUwYt6NauFP29U9hudo8FGgvHkKqte5JOlJlq4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742582622; c=relaxed/simple;
	bh=nPC+uQ14uFURP1w0oeMghB/ijxSy5QW8TNO5YXeDCbs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Uv6nR5WOyz22pABerHoOy/NcMEpOeQT2oax30BdBnbv13z0t/fWypjZx7bXEgFxKpLWA7lBFmYendXZGUVYQslLaNJliZ9QjMmd1mTBObx2+wTNwtkdStx5GmZRESI+48fLCL1iITQdSpD/CqM1MUkZRSmYhoo8EJ81KFQ6xgiM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bD1Jn1vy; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bD1Jn1vy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742582620; x=1774118620;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=nPC+uQ14uFURP1w0oeMghB/ijxSy5QW8TNO5YXeDCbs=;
  b=bD1Jn1vyXs+1bu6pZE38OLe22RLkJb0kI+uRuWqgHZuG4o4QP4Nq9T//
   KY6VZZprih5/Xb8UwXTtVgkbponWCjAkcec53QJ7SWoNkqKfdK69fFK7d
   I7lX7R/1UU7AJN5Ry0WinfSoAb3DisMRFnSHeszb34UKVhMCHm6a8jAbq
   cIql9Y0+eMnHzaq6z5xjcDTYS47T1bc5xZu2LgOY+Fzdn8aXrp7/wTYTp
   eBHWejfFvAJM6P3clL0mNJq/IOyIti9VofjHiXbUFyt0bNz9wsnoG/vJ6
   ayhZjLBsJSCyUOPulzxq+jaVPWVlPK4NhnSZ5EnBwZZyXJKmP+LSdeF54
   g==;
X-CSE-ConnectionGUID: F6yZz2M9S8qnCTRIOcTJXw==
X-CSE-MsgGUID: Vs38P2aiSVWsUA+oJPBRPA==
X-IronPort-AV: E=McAfee;i="6700,10204,11380"; a="43741996"
X-IronPort-AV: E=Sophos;i="6.14,265,1736841600"; 
   d="scan'208";a="43741996"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Mar 2025 11:43:39 -0700
X-CSE-ConnectionGUID: WSQsw1oLRfS5dmcudH4xxQ==
X-CSE-MsgGUID: F8nA1ra6TJWM/M41hhhf2Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,265,1736841600"; 
   d="scan'208";a="154376583"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 21 Mar 2025 11:43:37 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tvhL8-0001b9-2y;
	Fri, 21 Mar 2025 18:43:32 +0000
Date: Sat, 22 Mar 2025 02:42:43 +0800
From: kernel test robot <lkp@intel.com>
To: Jani Nikula <jani.nikula@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [linux-next:master 2309/13068] include/linux/pgtable.h:380:41:
 error: implicit declaration of function 'pte_mkold'; did you mean
 'pte_none'?
Message-ID: <202503220245.l17uRQ49-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   9388ec571cb1adba59d1cded2300eeb11827679c
commit: 62ae45687e43574f6c13158f8b8c5e10d3d22fc4 [2309/13068] drm: ensure drm headers are self-contained and pass kernel-doc
config: arc-randconfig-002-20250322 (https://download.01.org/0day-ci/archive/20250322/202503220245.l17uRQ49-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250322/202503220245.l17uRQ49-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503220245.l17uRQ49-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   arch/arc/include/asm/pgtable-bits-arcv2.h:94:1: note: in expansion of macro 'PTE_BIT_FUNC'
    PTE_BIT_FUNC(mkyoung, |= (_PAGE_ACCESSED));
    ^~~~~~~~~~~~
   arch/arc/include/asm/pgtable-bits-arcv2.h:86:16: error: unknown type name 'pte_t'
     static inline pte_t pte_##fn(pte_t pte) { pte_val(pte) op; return pte; }
                   ^~~~~
   arch/arc/include/asm/pgtable-bits-arcv2.h:95:1: note: in expansion of macro 'PTE_BIT_FUNC'
    PTE_BIT_FUNC(mkspecial, |= (_PAGE_SPECIAL));
    ^~~~~~~~~~~~
   arch/arc/include/asm/pgtable-bits-arcv2.h:86:31: error: unknown type name 'pte_t'; did you mean 'pmd_t'?
     static inline pte_t pte_##fn(pte_t pte) { pte_val(pte) op; return pte; }
                                  ^~~~~
   arch/arc/include/asm/pgtable-bits-arcv2.h:95:1: note: in expansion of macro 'PTE_BIT_FUNC'
    PTE_BIT_FUNC(mkspecial, |= (_PAGE_SPECIAL));
    ^~~~~~~~~~~~
   arch/arc/include/asm/pgtable-bits-arcv2.h:86:16: error: unknown type name 'pte_t'
     static inline pte_t pte_##fn(pte_t pte) { pte_val(pte) op; return pte; }
                   ^~~~~
   arch/arc/include/asm/pgtable-bits-arcv2.h:96:1: note: in expansion of macro 'PTE_BIT_FUNC'
    PTE_BIT_FUNC(mkhuge, |= (_PAGE_HW_SZ));
    ^~~~~~~~~~~~
   arch/arc/include/asm/pgtable-bits-arcv2.h:86:31: error: unknown type name 'pte_t'; did you mean 'pmd_t'?
     static inline pte_t pte_##fn(pte_t pte) { pte_val(pte) op; return pte; }
                                  ^~~~~
   arch/arc/include/asm/pgtable-bits-arcv2.h:96:1: note: in expansion of macro 'PTE_BIT_FUNC'
    PTE_BIT_FUNC(mkhuge, |= (_PAGE_HW_SZ));
    ^~~~~~~~~~~~
   arch/arc/include/asm/pgtable-bits-arcv2.h:98:15: error: unknown type name 'pte_t'
    static inline pte_t pte_modify(pte_t pte, pgprot_t newprot)
                  ^~~~~
   arch/arc/include/asm/pgtable-bits-arcv2.h:98:32: error: unknown type name 'pte_t'; did you mean 'pmd_t'?
    static inline pte_t pte_modify(pte_t pte, pgprot_t newprot)
                                   ^~~~~
                                   pmd_t
   arch/arc/include/asm/pgtable-bits-arcv2.h:98:43: error: unknown type name 'pgprot_t'; did you mean 'pgoff_t'?
    static inline pte_t pte_modify(pte_t pte, pgprot_t newprot)
                                              ^~~~~~~~
                                              pgoff_t
   arch/arc/include/asm/pgtable-bits-arcv2.h:105:26: error: unknown type name 'pte_t'; did you mean 'pmd_t'?
      unsigned long address, pte_t *ptep, unsigned int nr);
                             ^~~~~
                             pmd_t
   arch/arc/include/asm/pgtable-bits-arcv2.h:133:37: error: unknown type name 'pte_t'; did you mean 'pmd_t'?
    static inline int pte_swp_exclusive(pte_t pte)
                                        ^~~~~
                                        pmd_t
   arch/arc/include/asm/pgtable-bits-arcv2.h:86:16: error: unknown type name 'pte_t'
     static inline pte_t pte_##fn(pte_t pte) { pte_val(pte) op; return pte; }
                   ^~~~~
   arch/arc/include/asm/pgtable-bits-arcv2.h:138:1: note: in expansion of macro 'PTE_BIT_FUNC'
    PTE_BIT_FUNC(swp_mkexclusive, |= (_PAGE_SWP_EXCLUSIVE));
    ^~~~~~~~~~~~
   arch/arc/include/asm/pgtable-bits-arcv2.h:86:31: error: unknown type name 'pte_t'; did you mean 'pmd_t'?
     static inline pte_t pte_##fn(pte_t pte) { pte_val(pte) op; return pte; }
                                  ^~~~~
   arch/arc/include/asm/pgtable-bits-arcv2.h:138:1: note: in expansion of macro 'PTE_BIT_FUNC'
    PTE_BIT_FUNC(swp_mkexclusive, |= (_PAGE_SWP_EXCLUSIVE));
    ^~~~~~~~~~~~
   arch/arc/include/asm/pgtable-bits-arcv2.h:86:16: error: unknown type name 'pte_t'
     static inline pte_t pte_##fn(pte_t pte) { pte_val(pte) op; return pte; }
                   ^~~~~
   arch/arc/include/asm/pgtable-bits-arcv2.h:139:1: note: in expansion of macro 'PTE_BIT_FUNC'
    PTE_BIT_FUNC(swp_clear_exclusive, &= ~(_PAGE_SWP_EXCLUSIVE));
    ^~~~~~~~~~~~
   arch/arc/include/asm/pgtable-bits-arcv2.h:86:31: error: unknown type name 'pte_t'; did you mean 'pmd_t'?
     static inline pte_t pte_##fn(pte_t pte) { pte_val(pte) op; return pte; }
                                  ^~~~~
   arch/arc/include/asm/pgtable-bits-arcv2.h:139:1: note: in expansion of macro 'PTE_BIT_FUNC'
    PTE_BIT_FUNC(swp_clear_exclusive, &= ~(_PAGE_SWP_EXCLUSIVE));
    ^~~~~~~~~~~~
   In file included from arch/arc/include/asm/pgtable.h:13,
                    from include/linux/pgtable.h:6,
                    from include/drm/ttm/ttm_caching.h:28,
                    from <command-line>:
   include/linux/pgtable.h: In function 'pte_offset_kernel':
   arch/arc/include/asm/page.h:41:24: error: request for member 'pgd' in something not a structure or union
    #define pgd_val(x) ((x).pgd)
                           ^
   include/asm-generic/pgtable-nop4d.h:40:24: note: in expansion of macro 'pgd_val'
    #define p4d_val(x)    (pgd_val((x).pgd))
                           ^~~~~~~
   include/asm-generic/pgtable-nopud.h:48:24: note: in expansion of macro 'p4d_val'
    #define pud_val(x)    (p4d_val((x).p4d))
                           ^~~~~~~
   include/asm-generic/pgtable-nopmd.h:52:24: note: in expansion of macro 'pud_val'
    #define pmd_val(x)    (pud_val((x).pud))
                           ^~~~~~~
   arch/arc/include/asm/pgtable-levels.h:160:30: note: in expansion of macro 'pmd_val'
    #define pmd_page_vaddr(pmd) (pmd_val(pmd) & PAGE_MASK)
                                 ^~~~~~~
   include/linux/pgtable.h:117:18: note: in expansion of macro 'pmd_page_vaddr'
     return (pte_t *)pmd_page_vaddr(*pmd) + pte_index(address);
                     ^~~~~~~~~~~~~~
   In file included from include/drm/ttm/ttm_caching.h:28,
                    from <command-line>:
   include/linux/pgtable.h: In function 'pmd_off':
   include/linux/pgtable.h:186:31: error: implicit declaration of function 'p4d_offset'; did you mean 'pmd_offset'? [-Werror=implicit-function-declaration]
     return pmd_offset(pud_offset(p4d_offset(pgd_offset(mm, va), va), va), va);
                                  ^~~~~~~~~~
                                  pmd_offset
>> include/linux/pgtable.h:186:31: warning: passing argument 1 of 'pud_offset' makes pointer from integer without a cast [-Wint-conversion]
     return pmd_offset(pud_offset(p4d_offset(pgd_offset(mm, va), va), va), va);
                                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from include/asm-generic/pgtable-nopmd.h:7,
                    from arch/arc/include/asm/pgtable-levels.h:95,
                    from arch/arc/include/asm/pgtable.h:11,
                    from include/linux/pgtable.h:6,
                    from include/drm/ttm/ttm_caching.h:28,
                    from <command-line>:
   include/asm-generic/pgtable-nopud.h:42:40: note: expected 'p4d_t *' {aka 'struct <anonymous> *'} but argument is of type 'int'
    static inline pud_t *pud_offset(p4d_t *p4d, unsigned long address)
                                    ~~~~~~~^~~
   In file included from include/drm/ttm/ttm_caching.h:28,
                    from <command-line>:
   include/linux/pgtable.h: In function 'pmd_off_k':
   include/linux/pgtable.h:191:31: warning: passing argument 1 of 'pud_offset' makes pointer from integer without a cast [-Wint-conversion]
     return pmd_offset(pud_offset(p4d_offset(pgd_offset_k(va), va), va), va);
                                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from include/asm-generic/pgtable-nopmd.h:7,
                    from arch/arc/include/asm/pgtable-levels.h:95,
                    from arch/arc/include/asm/pgtable.h:11,
                    from include/linux/pgtable.h:6,
                    from include/drm/ttm/ttm_caching.h:28,
                    from <command-line>:
   include/asm-generic/pgtable-nopud.h:42:40: note: expected 'p4d_t *' {aka 'struct <anonymous> *'} but argument is of type 'int'
    static inline pud_t *pud_offset(p4d_t *p4d, unsigned long address)
                                    ~~~~~~~^~~
   In file included from arch/arc/include/asm/pgtable.h:13,
                    from include/linux/pgtable.h:6,
                    from include/drm/ttm/ttm_caching.h:28,
                    from <command-line>:
   include/linux/pgtable.h: In function 'virt_to_kpte':
   arch/arc/include/asm/page.h:41:24: error: request for member 'pgd' in something not a structure or union
    #define pgd_val(x) ((x).pgd)
                           ^
   include/asm-generic/pgtable-nop4d.h:40:24: note: in expansion of macro 'pgd_val'
    #define p4d_val(x)    (pgd_val((x).pgd))
                           ^~~~~~~
   include/asm-generic/pgtable-nopud.h:48:24: note: in expansion of macro 'p4d_val'
    #define pud_val(x)    (p4d_val((x).p4d))
                           ^~~~~~~
   include/asm-generic/pgtable-nopmd.h:52:24: note: in expansion of macro 'pud_val'
    #define pmd_val(x)    (pud_val((x).pud))
                           ^~~~~~~
   arch/arc/include/asm/pgtable-levels.h:156:24: note: in expansion of macro 'pmd_val'
    #define pmd_none(x)  (!pmd_val(x))
                           ^~~~~~~
   include/linux/pgtable.h:198:9: note: in expansion of macro 'pmd_none'
     return pmd_none(*pmd) ? NULL : pte_offset_kernel(pmd, vaddr);
            ^~~~~~~~
   In file included from include/drm/ttm/ttm_caching.h:28,
                    from <command-line>:
   include/linux/pgtable.h: In function 'ptep_test_and_clear_young':
>> include/linux/pgtable.h:380:41: error: implicit declaration of function 'pte_mkold'; did you mean 'pte_none'? [-Werror=implicit-function-declaration]
      set_pte_at(vma->vm_mm, address, ptep, pte_mkold(pte));
                                            ^~~~~~~~~
   include/linux/pgtable.h:301:66: note: in definition of macro 'set_pte_at'
    #define set_pte_at(mm, addr, ptep, pte) set_ptes(mm, addr, ptep, pte, 1)
                                                                     ^~~
>> include/linux/pgtable.h:380:41: error: incompatible type for argument 4 of 'set_ptes'
      set_pte_at(vma->vm_mm, address, ptep, pte_mkold(pte));
                                            ^~~~~~~~~~~~~~
   include/linux/pgtable.h:301:66: note: in definition of macro 'set_pte_at'
    #define set_pte_at(mm, addr, ptep, pte) set_ptes(mm, addr, ptep, pte, 1)
                                                                     ^~~
   include/linux/pgtable.h:286:22: note: expected 'pte_t' {aka 'struct <anonymous>'} but argument is of type 'int'
      pte_t *ptep, pte_t pte, unsigned int nr)
                   ~~~~~~^~~
   include/linux/pgtable.h: In function 'clear_young_dirty_ptes':
>> include/linux/pgtable.h:520:9: error: incompatible types when assigning to type 'pte_t' {aka 'struct <anonymous>'} from type 'int'
        pte = pte_mkold(pte);
            ^
>> include/linux/pgtable.h:522:11: error: implicit declaration of function 'pte_mkclean'; did you mean 'pte_clear'? [-Werror=implicit-function-declaration]
        pte = pte_mkclean(pte);
              ^~~~~~~~~~~
              pte_clear
   include/linux/pgtable.h:522:9: error: incompatible types when assigning to type 'pte_t' {aka 'struct <anonymous>'} from type 'int'
        pte = pte_mkclean(pte);
            ^
   include/linux/pgtable.h: In function 'get_and_clear_full_ptes':
>> include/linux/pgtable.h:718:10: error: implicit declaration of function 'pte_mkdirty'; did you mean 'pte_dirty'? [-Werror=implicit-function-declaration]
       pte = pte_mkdirty(pte);
             ^~~~~~~~~~~
             pte_dirty
   include/linux/pgtable.h:718:8: error: incompatible types when assigning to type 'pte_t' {aka 'struct <anonymous>'} from type 'int'
       pte = pte_mkdirty(pte);
           ^
>> include/linux/pgtable.h:720:10: error: implicit declaration of function 'pte_mkyoung'; did you mean 'pte_young'? [-Werror=implicit-function-declaration]
       pte = pte_mkyoung(pte);
             ^~~~~~~~~~~
             pte_young
   include/linux/pgtable.h:720:8: error: incompatible types when assigning to type 'pte_t' {aka 'struct <anonymous>'} from type 'int'
       pte = pte_mkyoung(pte);
           ^
   include/linux/pgtable.h: In function 'pte_mkwrite':
>> include/linux/pgtable.h:841:9: error: implicit declaration of function 'pte_mkwrite_novma'; did you mean 'pte_mkwrite'? [-Werror=implicit-function-declaration]
     return pte_mkwrite_novma(pte);
            ^~~~~~~~~~~~~~~~~
            pte_mkwrite
>> include/linux/pgtable.h:841:9: error: incompatible types when returning type 'int' but 'pte_t' {aka 'struct <anonymous>'} was expected
     return pte_mkwrite_novma(pte);
            ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/pgtable.h: In function 'ptep_set_wrprotect':
>> include/linux/pgtable.h:857:32: error: implicit declaration of function 'pte_wrprotect'; did you mean 'ptep_set_wrprotect'? [-Werror=implicit-function-declaration]
     set_pte_at(mm, address, ptep, pte_wrprotect(old_pte));
                                   ^~~~~~~~~~~~~
   include/linux/pgtable.h:301:66: note: in definition of macro 'set_pte_at'
    #define set_pte_at(mm, addr, ptep, pte) set_ptes(mm, addr, ptep, pte, 1)
                                                                     ^~~
   include/linux/pgtable.h:857:32: error: incompatible type for argument 4 of 'set_ptes'
     set_pte_at(mm, address, ptep, pte_wrprotect(old_pte));
                                   ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/pgtable.h:301:66: note: in definition of macro 'set_pte_at'
    #define set_pte_at(mm, addr, ptep, pte) set_ptes(mm, addr, ptep, pte, 1)
                                                                     ^~~
   include/linux/pgtable.h:286:22: note: expected 'pte_t' {aka 'struct <anonymous>'} but argument is of type 'int'
      pte_t *ptep, pte_t pte, unsigned int nr)
                   ~~~~~~^~~
   In file included from arch/arc/include/asm/pgtable.h:13,
                    from include/linux/pgtable.h:6,
                    from include/drm/ttm/ttm_caching.h:28,
                    from <command-line>:
   include/linux/pgtable.h: In function 'pmd_same':
   arch/arc/include/asm/page.h:41:24: error: request for member 'pgd' in something not a structure or union
    #define pgd_val(x) ((x).pgd)
                           ^
   include/asm-generic/pgtable-nop4d.h:40:24: note: in expansion of macro 'pgd_val'
    #define p4d_val(x)    (pgd_val((x).pgd))
                           ^~~~~~~
   include/asm-generic/pgtable-nopud.h:48:24: note: in expansion of macro 'p4d_val'
    #define pud_val(x)    (p4d_val((x).p4d))
                           ^~~~~~~
   include/asm-generic/pgtable-nopmd.h:52:24: note: in expansion of macro 'pud_val'
    #define pmd_val(x)    (pud_val((x).pud))
                           ^~~~~~~
   include/linux/pgtable.h:1061:9: note: in expansion of macro 'pmd_val'
     return pmd_val(pmd_a) == pmd_val(pmd_b);
            ^~~~~~~
   arch/arc/include/asm/page.h:41:24: error: request for member 'pgd' in something not a structure or union
    #define pgd_val(x) ((x).pgd)
                           ^
   include/asm-generic/pgtable-nop4d.h:40:24: note: in expansion of macro 'pgd_val'
    #define p4d_val(x)    (pgd_val((x).pgd))
                           ^~~~~~~
   include/asm-generic/pgtable-nopud.h:48:24: note: in expansion of macro 'p4d_val'
    #define pud_val(x)    (p4d_val((x).p4d))
                           ^~~~~~~
   include/asm-generic/pgtable-nopmd.h:52:24: note: in expansion of macro 'pud_val'
    #define pmd_val(x)    (pud_val((x).pud))
                           ^~~~~~~
   include/linux/pgtable.h:1061:27: note: in expansion of macro 'pmd_val'
     return pmd_val(pmd_a) == pmd_val(pmd_b);
                              ^~~~~~~
   In file included from include/drm/ttm/ttm_caching.h:28,
                    from <command-line>:
   include/linux/pgtable.h:1059:34: warning: parameter 'pmd_a' set but not used [-Wunused-but-set-parameter]
    static inline int pmd_same(pmd_t pmd_a, pmd_t pmd_b)
                               ~~~~~~^~~~~
   include/linux/pgtable.h:1059:47: warning: parameter 'pmd_b' set but not used [-Wunused-but-set-parameter]
    static inline int pmd_same(pmd_t pmd_a, pmd_t pmd_b)
                                            ~~~~~~^~~~~
   In file included from arch/arc/include/asm/pgtable.h:13,
                    from include/linux/pgtable.h:6,
                    from include/drm/ttm/ttm_caching.h:28,
                    from <command-line>:
   include/linux/pgtable.h: In function 'pud_same':
   arch/arc/include/asm/page.h:41:24: error: request for member 'pgd' in something not a structure or union
    #define pgd_val(x) ((x).pgd)
                           ^
   include/asm-generic/pgtable-nop4d.h:40:24: note: in expansion of macro 'pgd_val'
    #define p4d_val(x)    (pgd_val((x).pgd))
                           ^~~~~~~
   include/asm-generic/pgtable-nopud.h:48:24: note: in expansion of macro 'p4d_val'
    #define pud_val(x)    (p4d_val((x).p4d))
                           ^~~~~~~
   include/linux/pgtable.h:1068:9: note: in expansion of macro 'pud_val'
     return pud_val(pud_a) == pud_val(pud_b);
            ^~~~~~~
   arch/arc/include/asm/page.h:41:24: error: request for member 'pgd' in something not a structure or union
    #define pgd_val(x) ((x).pgd)
                           ^
   include/asm-generic/pgtable-nop4d.h:40:24: note: in expansion of macro 'pgd_val'
    #define p4d_val(x)    (pgd_val((x).pgd))
                           ^~~~~~~
   include/asm-generic/pgtable-nopud.h:48:24: note: in expansion of macro 'p4d_val'
    #define pud_val(x)    (p4d_val((x).p4d))
                           ^~~~~~~
   include/linux/pgtable.h:1068:27: note: in expansion of macro 'pud_val'
     return pud_val(pud_a) == pud_val(pud_b);
                              ^~~~~~~
   In file included from include/drm/ttm/ttm_caching.h:28,
                    from <command-line>:
   include/linux/pgtable.h:1066:34: warning: parameter 'pud_a' set but not used [-Wunused-but-set-parameter]
    static inline int pud_same(pud_t pud_a, pud_t pud_b)
                               ~~~~~~^~~~~
   include/linux/pgtable.h:1066:47: warning: parameter 'pud_b' set but not used [-Wunused-but-set-parameter]
    static inline int pud_same(pud_t pud_a, pud_t pud_b)
                                            ~~~~~~^~~~~
   In file included from arch/arc/include/asm/pgtable.h:13,
                    from include/linux/pgtable.h:6,
                    from include/drm/ttm/ttm_caching.h:28,
                    from <command-line>:
   include/linux/pgtable.h: In function 'p4d_same':
   arch/arc/include/asm/page.h:41:24: error: request for member 'pgd' in something not a structure or union


vim +380 include/linux/pgtable.h

974b9b2c68f3d3 include/linux/pgtable.h       Mike Rapoport           2020-06-08  176  
e05c7b1f2bc4b7 include/linux/pgtable.h       Mike Rapoport           2020-06-08  177  /*
e05c7b1f2bc4b7 include/linux/pgtable.h       Mike Rapoport           2020-06-08  178   * In many cases it is known that a virtual address is mapped at PMD or PTE
e05c7b1f2bc4b7 include/linux/pgtable.h       Mike Rapoport           2020-06-08  179   * level, so instead of traversing all the page table levels, we can get a
e05c7b1f2bc4b7 include/linux/pgtable.h       Mike Rapoport           2020-06-08  180   * pointer to the PMD entry in user or kernel page table or translate a virtual
e05c7b1f2bc4b7 include/linux/pgtable.h       Mike Rapoport           2020-06-08  181   * address to the pointer in the PTE in the kernel page tables with simple
e05c7b1f2bc4b7 include/linux/pgtable.h       Mike Rapoport           2020-06-08  182   * helpers.
e05c7b1f2bc4b7 include/linux/pgtable.h       Mike Rapoport           2020-06-08  183   */
e05c7b1f2bc4b7 include/linux/pgtable.h       Mike Rapoport           2020-06-08  184  static inline pmd_t *pmd_off(struct mm_struct *mm, unsigned long va)
e05c7b1f2bc4b7 include/linux/pgtable.h       Mike Rapoport           2020-06-08  185  {
e05c7b1f2bc4b7 include/linux/pgtable.h       Mike Rapoport           2020-06-08 @186  	return pmd_offset(pud_offset(p4d_offset(pgd_offset(mm, va), va), va), va);
e05c7b1f2bc4b7 include/linux/pgtable.h       Mike Rapoport           2020-06-08  187  }
e05c7b1f2bc4b7 include/linux/pgtable.h       Mike Rapoport           2020-06-08  188  
e05c7b1f2bc4b7 include/linux/pgtable.h       Mike Rapoport           2020-06-08  189  static inline pmd_t *pmd_off_k(unsigned long va)
e05c7b1f2bc4b7 include/linux/pgtable.h       Mike Rapoport           2020-06-08  190  {
e05c7b1f2bc4b7 include/linux/pgtable.h       Mike Rapoport           2020-06-08  191  	return pmd_offset(pud_offset(p4d_offset(pgd_offset_k(va), va), va), va);
e05c7b1f2bc4b7 include/linux/pgtable.h       Mike Rapoport           2020-06-08  192  }
e05c7b1f2bc4b7 include/linux/pgtable.h       Mike Rapoport           2020-06-08  193  
e05c7b1f2bc4b7 include/linux/pgtable.h       Mike Rapoport           2020-06-08  194  static inline pte_t *virt_to_kpte(unsigned long vaddr)
e05c7b1f2bc4b7 include/linux/pgtable.h       Mike Rapoport           2020-06-08  195  {
e05c7b1f2bc4b7 include/linux/pgtable.h       Mike Rapoport           2020-06-08  196  	pmd_t *pmd = pmd_off_k(vaddr);
e05c7b1f2bc4b7 include/linux/pgtable.h       Mike Rapoport           2020-06-08  197  
e05c7b1f2bc4b7 include/linux/pgtable.h       Mike Rapoport           2020-06-08 @198  	return pmd_none(*pmd) ? NULL : pte_offset_kernel(pmd, vaddr);
e05c7b1f2bc4b7 include/linux/pgtable.h       Mike Rapoport           2020-06-08  199  }
e05c7b1f2bc4b7 include/linux/pgtable.h       Mike Rapoport           2020-06-08  200  
6617da8fb56544 include/linux/pgtable.h       Juergen Gross           2022-11-30  201  #ifndef pmd_young
6617da8fb56544 include/linux/pgtable.h       Juergen Gross           2022-11-30  202  static inline int pmd_young(pmd_t pmd)
6617da8fb56544 include/linux/pgtable.h       Juergen Gross           2022-11-30  203  {
6617da8fb56544 include/linux/pgtable.h       Juergen Gross           2022-11-30  204  	return 0;
6617da8fb56544 include/linux/pgtable.h       Juergen Gross           2022-11-30  205  }
6617da8fb56544 include/linux/pgtable.h       Juergen Gross           2022-11-30  206  #endif
6617da8fb56544 include/linux/pgtable.h       Juergen Gross           2022-11-30  207  
533c67e6358406 include/linux/pgtable.h       Kinsey Ho               2023-12-27  208  #ifndef pmd_dirty
533c67e6358406 include/linux/pgtable.h       Kinsey Ho               2023-12-27  209  static inline int pmd_dirty(pmd_t pmd)
533c67e6358406 include/linux/pgtable.h       Kinsey Ho               2023-12-27  210  {
533c67e6358406 include/linux/pgtable.h       Kinsey Ho               2023-12-27  211  	return 0;
533c67e6358406 include/linux/pgtable.h       Kinsey Ho               2023-12-27  212  }
533c67e6358406 include/linux/pgtable.h       Kinsey Ho               2023-12-27  213  #endif
533c67e6358406 include/linux/pgtable.h       Kinsey Ho               2023-12-27  214  
bcc6cc832573a9 include/linux/pgtable.h       Matthew Wilcox (Oracle  2023-08-02  215) /*
bcc6cc832573a9 include/linux/pgtable.h       Matthew Wilcox (Oracle  2023-08-02  216)  * A facility to provide lazy MMU batching.  This allows PTE updates and
bcc6cc832573a9 include/linux/pgtable.h       Matthew Wilcox (Oracle  2023-08-02  217)  * page invalidations to be delayed until a call to leave lazy MMU mode
bcc6cc832573a9 include/linux/pgtable.h       Matthew Wilcox (Oracle  2023-08-02  218)  * is issued.  Some architectures may benefit from doing this, and it is
bcc6cc832573a9 include/linux/pgtable.h       Matthew Wilcox (Oracle  2023-08-02  219)  * beneficial for both shadow and direct mode hypervisors, which may batch
bcc6cc832573a9 include/linux/pgtable.h       Matthew Wilcox (Oracle  2023-08-02  220)  * the PTE updates which happen during this window.  Note that using this
bcc6cc832573a9 include/linux/pgtable.h       Matthew Wilcox (Oracle  2023-08-02  221)  * interface requires that read hazards be removed from the code.  A read
bcc6cc832573a9 include/linux/pgtable.h       Matthew Wilcox (Oracle  2023-08-02  222)  * hazard could result in the direct mode hypervisor case, since the actual
bcc6cc832573a9 include/linux/pgtable.h       Matthew Wilcox (Oracle  2023-08-02  223)  * write to the page tables may not yet have taken place, so reads though
bcc6cc832573a9 include/linux/pgtable.h       Matthew Wilcox (Oracle  2023-08-02  224)  * a raw PTE pointer after it has been modified are not guaranteed to be
bcc6cc832573a9 include/linux/pgtable.h       Matthew Wilcox (Oracle  2023-08-02  225)  * up to date.  This mode can only be entered and left under the protection of
bcc6cc832573a9 include/linux/pgtable.h       Matthew Wilcox (Oracle  2023-08-02  226)  * the page table locks for all page tables which may be modified.  In the UP
bcc6cc832573a9 include/linux/pgtable.h       Matthew Wilcox (Oracle  2023-08-02  227)  * case, this is required so that preemption is disabled, and in the SMP case,
bcc6cc832573a9 include/linux/pgtable.h       Matthew Wilcox (Oracle  2023-08-02  228)  * it must synchronize the delayed page table writes properly on other CPUs.
bcc6cc832573a9 include/linux/pgtable.h       Matthew Wilcox (Oracle  2023-08-02  229)  */
bcc6cc832573a9 include/linux/pgtable.h       Matthew Wilcox (Oracle  2023-08-02  230) #ifndef __HAVE_ARCH_ENTER_LAZY_MMU_MODE
bcc6cc832573a9 include/linux/pgtable.h       Matthew Wilcox (Oracle  2023-08-02  231) #define arch_enter_lazy_mmu_mode()	do {} while (0)
bcc6cc832573a9 include/linux/pgtable.h       Matthew Wilcox (Oracle  2023-08-02  232) #define arch_leave_lazy_mmu_mode()	do {} while (0)
bcc6cc832573a9 include/linux/pgtable.h       Matthew Wilcox (Oracle  2023-08-02  233) #define arch_flush_lazy_mmu_mode()	do {} while (0)
bcc6cc832573a9 include/linux/pgtable.h       Matthew Wilcox (Oracle  2023-08-02  234) #endif
bcc6cc832573a9 include/linux/pgtable.h       Matthew Wilcox (Oracle  2023-08-02  235) 
c6ec76a2ebc582 include/linux/pgtable.h       Ryan Roberts            2024-02-15  236  #ifndef pte_batch_hint
c6ec76a2ebc582 include/linux/pgtable.h       Ryan Roberts            2024-02-15  237  /**
c6ec76a2ebc582 include/linux/pgtable.h       Ryan Roberts            2024-02-15  238   * pte_batch_hint - Number of pages that can be added to batch without scanning.
c6ec76a2ebc582 include/linux/pgtable.h       Ryan Roberts            2024-02-15  239   * @ptep: Page table pointer for the entry.
c6ec76a2ebc582 include/linux/pgtable.h       Ryan Roberts            2024-02-15  240   * @pte: Page table entry.
c6ec76a2ebc582 include/linux/pgtable.h       Ryan Roberts            2024-02-15  241   *
c6ec76a2ebc582 include/linux/pgtable.h       Ryan Roberts            2024-02-15  242   * Some architectures know that a set of contiguous ptes all map the same
c6ec76a2ebc582 include/linux/pgtable.h       Ryan Roberts            2024-02-15  243   * contiguous memory with the same permissions. In this case, it can provide a
c6ec76a2ebc582 include/linux/pgtable.h       Ryan Roberts            2024-02-15  244   * hint to aid pte batching without the core code needing to scan every pte.
c6ec76a2ebc582 include/linux/pgtable.h       Ryan Roberts            2024-02-15  245   *
c6ec76a2ebc582 include/linux/pgtable.h       Ryan Roberts            2024-02-15  246   * An architecture implementation may ignore the PTE accessed state. Further,
c6ec76a2ebc582 include/linux/pgtable.h       Ryan Roberts            2024-02-15  247   * the dirty state must apply atomically to all the PTEs described by the hint.
c6ec76a2ebc582 include/linux/pgtable.h       Ryan Roberts            2024-02-15  248   *
c6ec76a2ebc582 include/linux/pgtable.h       Ryan Roberts            2024-02-15  249   * May be overridden by the architecture, else pte_batch_hint is always 1.
c6ec76a2ebc582 include/linux/pgtable.h       Ryan Roberts            2024-02-15  250   */
c6ec76a2ebc582 include/linux/pgtable.h       Ryan Roberts            2024-02-15  251  static inline unsigned int pte_batch_hint(pte_t *ptep, pte_t pte)
c6ec76a2ebc582 include/linux/pgtable.h       Ryan Roberts            2024-02-15  252  {
c6ec76a2ebc582 include/linux/pgtable.h       Ryan Roberts            2024-02-15  253  	return 1;
c6ec76a2ebc582 include/linux/pgtable.h       Ryan Roberts            2024-02-15  254  }
c6ec76a2ebc582 include/linux/pgtable.h       Ryan Roberts            2024-02-15  255  #endif
c6ec76a2ebc582 include/linux/pgtable.h       Ryan Roberts            2024-02-15  256  
583ceaaa339960 include/linux/pgtable.h       Ryan Roberts            2024-02-15  257  #ifndef pte_advance_pfn
583ceaaa339960 include/linux/pgtable.h       Ryan Roberts            2024-02-15  258  static inline pte_t pte_advance_pfn(pte_t pte, unsigned long nr)
ce60f27bb62dfe include/linux/pgtable.h       Matthew Wilcox (Oracle  2023-09-20  259) {
583ceaaa339960 include/linux/pgtable.h       Ryan Roberts            2024-02-15  260  	return __pte(pte_val(pte) + (nr << PFN_PTE_SHIFT));
ce60f27bb62dfe include/linux/pgtable.h       Matthew Wilcox (Oracle  2023-09-20  261) }
ce60f27bb62dfe include/linux/pgtable.h       Matthew Wilcox (Oracle  2023-09-20  262) #endif
ce60f27bb62dfe include/linux/pgtable.h       Matthew Wilcox (Oracle  2023-09-20  263) 
583ceaaa339960 include/linux/pgtable.h       Ryan Roberts            2024-02-15  264  #define pte_next_pfn(pte) pte_advance_pfn(pte, 1)
583ceaaa339960 include/linux/pgtable.h       Ryan Roberts            2024-02-15  265  
6cdfa1d5d5d828 include/linux/pgtable.h       David Hildenbrand       2024-01-29  266  #ifndef set_ptes
bcc6cc832573a9 include/linux/pgtable.h       Matthew Wilcox (Oracle  2023-08-02  267) /**
bcc6cc832573a9 include/linux/pgtable.h       Matthew Wilcox (Oracle  2023-08-02  268)  * set_ptes - Map consecutive pages to a contiguous range of addresses.
bcc6cc832573a9 include/linux/pgtable.h       Matthew Wilcox (Oracle  2023-08-02  269)  * @mm: Address space to map the pages into.
bcc6cc832573a9 include/linux/pgtable.h       Matthew Wilcox (Oracle  2023-08-02  270)  * @addr: Address to map the first page at.
bcc6cc832573a9 include/linux/pgtable.h       Matthew Wilcox (Oracle  2023-08-02  271)  * @ptep: Page table pointer for the first entry.
bcc6cc832573a9 include/linux/pgtable.h       Matthew Wilcox (Oracle  2023-08-02  272)  * @pte: Page table entry for the first page.
bcc6cc832573a9 include/linux/pgtable.h       Matthew Wilcox (Oracle  2023-08-02  273)  * @nr: Number of pages to map.
bcc6cc832573a9 include/linux/pgtable.h       Matthew Wilcox (Oracle  2023-08-02  274)  *
6280d7317ccae1 include/linux/pgtable.h       Ryan Roberts            2024-02-15  275   * When nr==1, initial state of pte may be present or not present, and new state
6280d7317ccae1 include/linux/pgtable.h       Ryan Roberts            2024-02-15  276   * may be present or not present. When nr>1, initial state of all ptes must be
6280d7317ccae1 include/linux/pgtable.h       Ryan Roberts            2024-02-15  277   * not present, and new state must be present.
6280d7317ccae1 include/linux/pgtable.h       Ryan Roberts            2024-02-15  278   *
bcc6cc832573a9 include/linux/pgtable.h       Matthew Wilcox (Oracle  2023-08-02  279)  * May be overridden by the architecture, or the architecture can define
bcc6cc832573a9 include/linux/pgtable.h       Matthew Wilcox (Oracle  2023-08-02  280)  * set_pte() and PFN_PTE_SHIFT.
bcc6cc832573a9 include/linux/pgtable.h       Matthew Wilcox (Oracle  2023-08-02  281)  *
bcc6cc832573a9 include/linux/pgtable.h       Matthew Wilcox (Oracle  2023-08-02  282)  * Context: The caller holds the page table lock.  The pages all belong
bcc6cc832573a9 include/linux/pgtable.h       Matthew Wilcox (Oracle  2023-08-02  283)  * to the same folio.  The PTEs are all in the same PMD.
bcc6cc832573a9 include/linux/pgtable.h       Matthew Wilcox (Oracle  2023-08-02  284)  */
bcc6cc832573a9 include/linux/pgtable.h       Matthew Wilcox (Oracle  2023-08-02  285) static inline void set_ptes(struct mm_struct *mm, unsigned long addr,
bcc6cc832573a9 include/linux/pgtable.h       Matthew Wilcox (Oracle  2023-08-02 @286) 		pte_t *ptep, pte_t pte, unsigned int nr)
bcc6cc832573a9 include/linux/pgtable.h       Matthew Wilcox (Oracle  2023-08-02  287) {
bcc6cc832573a9 include/linux/pgtable.h       Matthew Wilcox (Oracle  2023-08-02  288) 	page_table_check_ptes_set(mm, ptep, pte, nr);
bcc6cc832573a9 include/linux/pgtable.h       Matthew Wilcox (Oracle  2023-08-02  289) 
bcc6cc832573a9 include/linux/pgtable.h       Matthew Wilcox (Oracle  2023-08-02  290) 	arch_enter_lazy_mmu_mode();
bcc6cc832573a9 include/linux/pgtable.h       Matthew Wilcox (Oracle  2023-08-02  291) 	for (;;) {
bcc6cc832573a9 include/linux/pgtable.h       Matthew Wilcox (Oracle  2023-08-02  292) 		set_pte(ptep, pte);
bcc6cc832573a9 include/linux/pgtable.h       Matthew Wilcox (Oracle  2023-08-02  293) 		if (--nr == 0)
bcc6cc832573a9 include/linux/pgtable.h       Matthew Wilcox (Oracle  2023-08-02  294) 			break;
bcc6cc832573a9 include/linux/pgtable.h       Matthew Wilcox (Oracle  2023-08-02  295) 		ptep++;
ce60f27bb62dfe include/linux/pgtable.h       Matthew Wilcox (Oracle  2023-09-20  296) 		pte = pte_next_pfn(pte);
bcc6cc832573a9 include/linux/pgtable.h       Matthew Wilcox (Oracle  2023-08-02  297) 	}
bcc6cc832573a9 include/linux/pgtable.h       Matthew Wilcox (Oracle  2023-08-02  298) 	arch_leave_lazy_mmu_mode();
bcc6cc832573a9 include/linux/pgtable.h       Matthew Wilcox (Oracle  2023-08-02  299) }
bcc6cc832573a9 include/linux/pgtable.h       Matthew Wilcox (Oracle  2023-08-02  300) #endif
bcc6cc832573a9 include/linux/pgtable.h       Matthew Wilcox (Oracle  2023-08-02 @301) #define set_pte_at(mm, addr, ptep, pte) set_ptes(mm, addr, ptep, pte, 1)
bcc6cc832573a9 include/linux/pgtable.h       Matthew Wilcox (Oracle  2023-08-02  302) 
^1da177e4c3f41 include/asm-generic/pgtable.h Linus Torvalds          2005-04-16  303  #ifndef __HAVE_ARCH_PTEP_SET_ACCESS_FLAGS
e2cda322648122 include/asm-generic/pgtable.h Andrea Arcangeli        2011-01-13  304  extern int ptep_set_access_flags(struct vm_area_struct *vma,
e2cda322648122 include/asm-generic/pgtable.h Andrea Arcangeli        2011-01-13  305  				 unsigned long address, pte_t *ptep,
e2cda322648122 include/asm-generic/pgtable.h Andrea Arcangeli        2011-01-13  306  				 pte_t entry, int dirty);
e2cda322648122 include/asm-generic/pgtable.h Andrea Arcangeli        2011-01-13  307  #endif
e2cda322648122 include/asm-generic/pgtable.h Andrea Arcangeli        2011-01-13  308  
e2cda322648122 include/asm-generic/pgtable.h Andrea Arcangeli        2011-01-13  309  #ifndef __HAVE_ARCH_PMDP_SET_ACCESS_FLAGS
bd5e88ad72b26e include/asm-generic/pgtable.h Vineet Gupta            2015-07-09  310  #ifdef CONFIG_TRANSPARENT_HUGEPAGE
e2cda322648122 include/asm-generic/pgtable.h Andrea Arcangeli        2011-01-13  311  extern int pmdp_set_access_flags(struct vm_area_struct *vma,
e2cda322648122 include/asm-generic/pgtable.h Andrea Arcangeli        2011-01-13  312  				 unsigned long address, pmd_t *pmdp,
e2cda322648122 include/asm-generic/pgtable.h Andrea Arcangeli        2011-01-13  313  				 pmd_t entry, int dirty);
a00cc7d9dd93d6 include/asm-generic/pgtable.h Matthew Wilcox          2017-02-24  314  extern int pudp_set_access_flags(struct vm_area_struct *vma,
a00cc7d9dd93d6 include/asm-generic/pgtable.h Matthew Wilcox          2017-02-24  315  				 unsigned long address, pud_t *pudp,
a00cc7d9dd93d6 include/asm-generic/pgtable.h Matthew Wilcox          2017-02-24  316  				 pud_t entry, int dirty);
bd5e88ad72b26e include/asm-generic/pgtable.h Vineet Gupta            2015-07-09  317  #else
bd5e88ad72b26e include/asm-generic/pgtable.h Vineet Gupta            2015-07-09  318  static inline int pmdp_set_access_flags(struct vm_area_struct *vma,
bd5e88ad72b26e include/asm-generic/pgtable.h Vineet Gupta            2015-07-09  319  					unsigned long address, pmd_t *pmdp,
bd5e88ad72b26e include/asm-generic/pgtable.h Vineet Gupta            2015-07-09  320  					pmd_t entry, int dirty)
bd5e88ad72b26e include/asm-generic/pgtable.h Vineet Gupta            2015-07-09  321  {
bd5e88ad72b26e include/asm-generic/pgtable.h Vineet Gupta            2015-07-09  322  	BUILD_BUG();
bd5e88ad72b26e include/asm-generic/pgtable.h Vineet Gupta            2015-07-09  323  	return 0;
bd5e88ad72b26e include/asm-generic/pgtable.h Vineet Gupta            2015-07-09  324  }
a00cc7d9dd93d6 include/asm-generic/pgtable.h Matthew Wilcox          2017-02-24  325  static inline int pudp_set_access_flags(struct vm_area_struct *vma,
a00cc7d9dd93d6 include/asm-generic/pgtable.h Matthew Wilcox          2017-02-24  326  					unsigned long address, pud_t *pudp,
a00cc7d9dd93d6 include/asm-generic/pgtable.h Matthew Wilcox          2017-02-24  327  					pud_t entry, int dirty)
a00cc7d9dd93d6 include/asm-generic/pgtable.h Matthew Wilcox          2017-02-24  328  {
a00cc7d9dd93d6 include/asm-generic/pgtable.h Matthew Wilcox          2017-02-24  329  	BUILD_BUG();
a00cc7d9dd93d6 include/asm-generic/pgtable.h Matthew Wilcox          2017-02-24  330  	return 0;
a00cc7d9dd93d6 include/asm-generic/pgtable.h Matthew Wilcox          2017-02-24  331  }
bd5e88ad72b26e include/asm-generic/pgtable.h Vineet Gupta            2015-07-09  332  #endif /* CONFIG_TRANSPARENT_HUGEPAGE */
^1da177e4c3f41 include/asm-generic/pgtable.h Linus Torvalds          2005-04-16  333  #endif
^1da177e4c3f41 include/asm-generic/pgtable.h Linus Torvalds          2005-04-16  334  
6c1d2a073a1d85 include/linux/pgtable.h       Ryan Roberts            2023-06-12  335  #ifndef ptep_get
6c1d2a073a1d85 include/linux/pgtable.h       Ryan Roberts            2023-06-12  336  static inline pte_t ptep_get(pte_t *ptep)
6c1d2a073a1d85 include/linux/pgtable.h       Ryan Roberts            2023-06-12  337  {
6c1d2a073a1d85 include/linux/pgtable.h       Ryan Roberts            2023-06-12  338  	return READ_ONCE(*ptep);
6c1d2a073a1d85 include/linux/pgtable.h       Ryan Roberts            2023-06-12  339  }
6c1d2a073a1d85 include/linux/pgtable.h       Ryan Roberts            2023-06-12  340  #endif
6c1d2a073a1d85 include/linux/pgtable.h       Ryan Roberts            2023-06-12  341  
6c1d2a073a1d85 include/linux/pgtable.h       Ryan Roberts            2023-06-12  342  #ifndef pmdp_get
6c1d2a073a1d85 include/linux/pgtable.h       Ryan Roberts            2023-06-12  343  static inline pmd_t pmdp_get(pmd_t *pmdp)
6c1d2a073a1d85 include/linux/pgtable.h       Ryan Roberts            2023-06-12  344  {
6c1d2a073a1d85 include/linux/pgtable.h       Ryan Roberts            2023-06-12  345  	return READ_ONCE(*pmdp);
6c1d2a073a1d85 include/linux/pgtable.h       Ryan Roberts            2023-06-12  346  }
6c1d2a073a1d85 include/linux/pgtable.h       Ryan Roberts            2023-06-12  347  #endif
6c1d2a073a1d85 include/linux/pgtable.h       Ryan Roberts            2023-06-12  348  
eba2591d99d1f1 include/linux/pgtable.h       Alexandre Ghiti         2023-12-13  349  #ifndef pudp_get
eba2591d99d1f1 include/linux/pgtable.h       Alexandre Ghiti         2023-12-13  350  static inline pud_t pudp_get(pud_t *pudp)
eba2591d99d1f1 include/linux/pgtable.h       Alexandre Ghiti         2023-12-13  351  {
eba2591d99d1f1 include/linux/pgtable.h       Alexandre Ghiti         2023-12-13  352  	return READ_ONCE(*pudp);
eba2591d99d1f1 include/linux/pgtable.h       Alexandre Ghiti         2023-12-13  353  }
eba2591d99d1f1 include/linux/pgtable.h       Alexandre Ghiti         2023-12-13  354  #endif
eba2591d99d1f1 include/linux/pgtable.h       Alexandre Ghiti         2023-12-13  355  
eba2591d99d1f1 include/linux/pgtable.h       Alexandre Ghiti         2023-12-13  356  #ifndef p4dp_get
eba2591d99d1f1 include/linux/pgtable.h       Alexandre Ghiti         2023-12-13  357  static inline p4d_t p4dp_get(p4d_t *p4dp)
eba2591d99d1f1 include/linux/pgtable.h       Alexandre Ghiti         2023-12-13  358  {
eba2591d99d1f1 include/linux/pgtable.h       Alexandre Ghiti         2023-12-13  359  	return READ_ONCE(*p4dp);
eba2591d99d1f1 include/linux/pgtable.h       Alexandre Ghiti         2023-12-13  360  }
eba2591d99d1f1 include/linux/pgtable.h       Alexandre Ghiti         2023-12-13  361  #endif
eba2591d99d1f1 include/linux/pgtable.h       Alexandre Ghiti         2023-12-13  362  
eba2591d99d1f1 include/linux/pgtable.h       Alexandre Ghiti         2023-12-13  363  #ifndef pgdp_get
eba2591d99d1f1 include/linux/pgtable.h       Alexandre Ghiti         2023-12-13  364  static inline pgd_t pgdp_get(pgd_t *pgdp)
eba2591d99d1f1 include/linux/pgtable.h       Alexandre Ghiti         2023-12-13  365  {
eba2591d99d1f1 include/linux/pgtable.h       Alexandre Ghiti         2023-12-13  366  	return READ_ONCE(*pgdp);
eba2591d99d1f1 include/linux/pgtable.h       Alexandre Ghiti         2023-12-13  367  }
eba2591d99d1f1 include/linux/pgtable.h       Alexandre Ghiti         2023-12-13  368  #endif
eba2591d99d1f1 include/linux/pgtable.h       Alexandre Ghiti         2023-12-13  369  
^1da177e4c3f41 include/asm-generic/pgtable.h Linus Torvalds          2005-04-16  370  #ifndef __HAVE_ARCH_PTEP_TEST_AND_CLEAR_YOUNG
e2cda322648122 include/asm-generic/pgtable.h Andrea Arcangeli        2011-01-13  371  static inline int ptep_test_and_clear_young(struct vm_area_struct *vma,
e2cda322648122 include/asm-generic/pgtable.h Andrea Arcangeli        2011-01-13  372  					    unsigned long address,
e2cda322648122 include/asm-generic/pgtable.h Andrea Arcangeli        2011-01-13  373  					    pte_t *ptep)
e2cda322648122 include/asm-generic/pgtable.h Andrea Arcangeli        2011-01-13  374  {
c33c794828f212 include/linux/pgtable.h       Ryan Roberts            2023-06-12  375  	pte_t pte = ptep_get(ptep);
e2cda322648122 include/asm-generic/pgtable.h Andrea Arcangeli        2011-01-13  376  	int r = 1;
e2cda322648122 include/asm-generic/pgtable.h Andrea Arcangeli        2011-01-13  377  	if (!pte_young(pte))
e2cda322648122 include/asm-generic/pgtable.h Andrea Arcangeli        2011-01-13  378  		r = 0;
e2cda322648122 include/asm-generic/pgtable.h Andrea Arcangeli        2011-01-13  379  	else
e2cda322648122 include/asm-generic/pgtable.h Andrea Arcangeli        2011-01-13 @380  		set_pte_at(vma->vm_mm, address, ptep, pte_mkold(pte));
e2cda322648122 include/asm-generic/pgtable.h Andrea Arcangeli        2011-01-13  381  	return r;
e2cda322648122 include/asm-generic/pgtable.h Andrea Arcangeli        2011-01-13  382  }
e2cda322648122 include/asm-generic/pgtable.h Andrea Arcangeli        2011-01-13  383  #endif
e2cda322648122 include/asm-generic/pgtable.h Andrea Arcangeli        2011-01-13  384  
e2cda322648122 include/asm-generic/pgtable.h Andrea Arcangeli        2011-01-13  385  #ifndef __HAVE_ARCH_PMDP_TEST_AND_CLEAR_YOUNG
eed9a328aa1ae6 include/linux/pgtable.h       Yu Zhao                 2022-09-18  386  #if defined(CONFIG_TRANSPARENT_HUGEPAGE) || defined(CONFIG_ARCH_HAS_NONLEAF_PMD_YOUNG)
e2cda322648122 include/asm-generic/pgtable.h Andrea Arcangeli        2011-01-13  387  static inline int pmdp_test_and_clear_young(struct vm_area_struct *vma,
e2cda322648122 include/asm-generic/pgtable.h Andrea Arcangeli        2011-01-13  388  					    unsigned long address,
e2cda322648122 include/asm-generic/pgtable.h Andrea Arcangeli        2011-01-13  389  					    pmd_t *pmdp)
e2cda322648122 include/asm-generic/pgtable.h Andrea Arcangeli        2011-01-13  390  {
e2cda322648122 include/asm-generic/pgtable.h Andrea Arcangeli        2011-01-13  391  	pmd_t pmd = *pmdp;
e2cda322648122 include/asm-generic/pgtable.h Andrea Arcangeli        2011-01-13  392  	int r = 1;
e2cda322648122 include/asm-generic/pgtable.h Andrea Arcangeli        2011-01-13  393  	if (!pmd_young(pmd))
e2cda322648122 include/asm-generic/pgtable.h Andrea Arcangeli        2011-01-13  394  		r = 0;
e2cda322648122 include/asm-generic/pgtable.h Andrea Arcangeli        2011-01-13  395  	else
e2cda322648122 include/asm-generic/pgtable.h Andrea Arcangeli        2011-01-13  396  		set_pmd_at(vma->vm_mm, address, pmdp, pmd_mkold(pmd));
e2cda322648122 include/asm-generic/pgtable.h Andrea Arcangeli        2011-01-13  397  	return r;
e2cda322648122 include/asm-generic/pgtable.h Andrea Arcangeli        2011-01-13  398  }
bd5e88ad72b26e include/asm-generic/pgtable.h Vineet Gupta            2015-07-09  399  #else
e2cda322648122 include/asm-generic/pgtable.h Andrea Arcangeli        2011-01-13  400  static inline int pmdp_test_and_clear_young(struct vm_area_struct *vma,
e2cda322648122 include/asm-generic/pgtable.h Andrea Arcangeli        2011-01-13  401  					    unsigned long address,
e2cda322648122 include/asm-generic/pgtable.h Andrea Arcangeli        2011-01-13  402  					    pmd_t *pmdp)
e2cda322648122 include/asm-generic/pgtable.h Andrea Arcangeli        2011-01-13  403  {
bd5e88ad72b26e include/asm-generic/pgtable.h Vineet Gupta            2015-07-09  404  	BUILD_BUG();
e2cda322648122 include/asm-generic/pgtable.h Andrea Arcangeli        2011-01-13  405  	return 0;
e2cda322648122 include/asm-generic/pgtable.h Andrea Arcangeli        2011-01-13  406  }
eed9a328aa1ae6 include/linux/pgtable.h       Yu Zhao                 2022-09-18  407  #endif /* CONFIG_TRANSPARENT_HUGEPAGE || CONFIG_ARCH_HAS_NONLEAF_PMD_YOUNG */
^1da177e4c3f41 include/asm-generic/pgtable.h Linus Torvalds          2005-04-16  408  #endif
^1da177e4c3f41 include/asm-generic/pgtable.h Linus Torvalds          2005-04-16  409  
^1da177e4c3f41 include/asm-generic/pgtable.h Linus Torvalds          2005-04-16  410  #ifndef __HAVE_ARCH_PTEP_CLEAR_YOUNG_FLUSH
e2cda322648122 include/asm-generic/pgtable.h Andrea Arcangeli        2011-01-13  411  int ptep_clear_flush_young(struct vm_area_struct *vma,
e2cda322648122 include/asm-generic/pgtable.h Andrea Arcangeli        2011-01-13  412  			   unsigned long address, pte_t *ptep);
e2cda322648122 include/asm-generic/pgtable.h Andrea Arcangeli        2011-01-13  413  #endif
e2cda322648122 include/asm-generic/pgtable.h Andrea Arcangeli        2011-01-13  414  
e2cda322648122 include/asm-generic/pgtable.h Andrea Arcangeli        2011-01-13  415  #ifndef __HAVE_ARCH_PMDP_CLEAR_YOUNG_FLUSH
bd5e88ad72b26e include/asm-generic/pgtable.h Vineet Gupta            2015-07-09  416  #ifdef CONFIG_TRANSPARENT_HUGEPAGE
bd5e88ad72b26e include/asm-generic/pgtable.h Vineet Gupta            2015-07-09  417  extern int pmdp_clear_flush_young(struct vm_area_struct *vma,
e2cda322648122 include/asm-generic/pgtable.h Andrea Arcangeli        2011-01-13  418  				  unsigned long address, pmd_t *pmdp);
bd5e88ad72b26e include/asm-generic/pgtable.h Vineet Gupta            2015-07-09  419  #else
bd5e88ad72b26e include/asm-generic/pgtable.h Vineet Gupta            2015-07-09  420  /*
bd5e88ad72b26e include/asm-generic/pgtable.h Vineet Gupta            2015-07-09  421   * Despite relevant to THP only, this API is called from generic rmap code
bd5e88ad72b26e include/asm-generic/pgtable.h Vineet Gupta            2015-07-09  422   * under PageTransHuge(), hence needs a dummy implementation for !THP
bd5e88ad72b26e include/asm-generic/pgtable.h Vineet Gupta            2015-07-09  423   */
bd5e88ad72b26e include/asm-generic/pgtable.h Vineet Gupta            2015-07-09  424  static inline int pmdp_clear_flush_young(struct vm_area_struct *vma,
bd5e88ad72b26e include/asm-generic/pgtable.h Vineet Gupta            2015-07-09  425  					 unsigned long address, pmd_t *pmdp)
bd5e88ad72b26e include/asm-generic/pgtable.h Vineet Gupta            2015-07-09  426  {
bd5e88ad72b26e include/asm-generic/pgtable.h Vineet Gupta            2015-07-09  427  	BUILD_BUG();
bd5e88ad72b26e include/asm-generic/pgtable.h Vineet Gupta            2015-07-09  428  	return 0;
bd5e88ad72b26e include/asm-generic/pgtable.h Vineet Gupta            2015-07-09  429  }
bd5e88ad72b26e include/asm-generic/pgtable.h Vineet Gupta            2015-07-09  430  #endif /* CONFIG_TRANSPARENT_HUGEPAGE */
^1da177e4c3f41 include/asm-generic/pgtable.h Linus Torvalds          2005-04-16  431  #endif
^1da177e4c3f41 include/asm-generic/pgtable.h Linus Torvalds          2005-04-16  432  
4aaf269c768dba include/linux/pgtable.h       Juergen Gross           2022-11-23  433  #ifndef arch_has_hw_nonleaf_pmd_young
4aaf269c768dba include/linux/pgtable.h       Juergen Gross           2022-11-23  434  /*
4aaf269c768dba include/linux/pgtable.h       Juergen Gross           2022-11-23  435   * Return whether the accessed bit in non-leaf PMD entries is supported on the
4aaf269c768dba include/linux/pgtable.h       Juergen Gross           2022-11-23  436   * local CPU.
4aaf269c768dba include/linux/pgtable.h       Juergen Gross           2022-11-23  437   */
4aaf269c768dba include/linux/pgtable.h       Juergen Gross           2022-11-23  438  static inline bool arch_has_hw_nonleaf_pmd_young(void)
4aaf269c768dba include/linux/pgtable.h       Juergen Gross           2022-11-23  439  {
4aaf269c768dba include/linux/pgtable.h       Juergen Gross           2022-11-23  440  	return IS_ENABLED(CONFIG_ARCH_HAS_NONLEAF_PMD_YOUNG);
4aaf269c768dba include/linux/pgtable.h       Juergen Gross           2022-11-23  441  }
4aaf269c768dba include/linux/pgtable.h       Juergen Gross           2022-11-23  442  #endif
4aaf269c768dba include/linux/pgtable.h       Juergen Gross           2022-11-23  443  
e1fd09e3d1dd4a include/linux/pgtable.h       Yu Zhao                 2022-09-18  444  #ifndef arch_has_hw_pte_young
e1fd09e3d1dd4a include/linux/pgtable.h       Yu Zhao                 2022-09-18  445  /*
e1fd09e3d1dd4a include/linux/pgtable.h       Yu Zhao                 2022-09-18  446   * Return whether the accessed bit is supported on the local CPU.
e1fd09e3d1dd4a include/linux/pgtable.h       Yu Zhao                 2022-09-18  447   *
e1fd09e3d1dd4a include/linux/pgtable.h       Yu Zhao                 2022-09-18  448   * This stub assumes accessing through an old PTE triggers a page fault.
e1fd09e3d1dd4a include/linux/pgtable.h       Yu Zhao                 2022-09-18  449   * Architectures that automatically set the access bit should overwrite it.
e1fd09e3d1dd4a include/linux/pgtable.h       Yu Zhao                 2022-09-18  450   */
e1fd09e3d1dd4a include/linux/pgtable.h       Yu Zhao                 2022-09-18  451  static inline bool arch_has_hw_pte_young(void)
e1fd09e3d1dd4a include/linux/pgtable.h       Yu Zhao                 2022-09-18  452  {
71ce1ab54a5057 include/linux/pgtable.h       Kinsey Ho               2023-12-27  453  	return IS_ENABLED(CONFIG_ARCH_HAS_HW_PTE_YOUNG);
e1fd09e3d1dd4a include/linux/pgtable.h       Yu Zhao                 2022-09-18  454  }
e1fd09e3d1dd4a include/linux/pgtable.h       Yu Zhao                 2022-09-18  455  #endif
e1fd09e3d1dd4a include/linux/pgtable.h       Yu Zhao                 2022-09-18  456  
e5136e876581ba include/linux/pgtable.h       Rick Edgecombe          2023-06-12  457  #ifndef arch_check_zapped_pte
e5136e876581ba include/linux/pgtable.h       Rick Edgecombe          2023-06-12  458  static inline void arch_check_zapped_pte(struct vm_area_struct *vma,
e5136e876581ba include/linux/pgtable.h       Rick Edgecombe          2023-06-12  459  					 pte_t pte)
e5136e876581ba include/linux/pgtable.h       Rick Edgecombe          2023-06-12  460  {
e5136e876581ba include/linux/pgtable.h       Rick Edgecombe          2023-06-12  461  }
e5136e876581ba include/linux/pgtable.h       Rick Edgecombe          2023-06-12  462  #endif
e5136e876581ba include/linux/pgtable.h       Rick Edgecombe          2023-06-12  463  
e5136e876581ba include/linux/pgtable.h       Rick Edgecombe          2023-06-12  464  #ifndef arch_check_zapped_pmd
e5136e876581ba include/linux/pgtable.h       Rick Edgecombe          2023-06-12  465  static inline void arch_check_zapped_pmd(struct vm_area_struct *vma,
e5136e876581ba include/linux/pgtable.h       Rick Edgecombe          2023-06-12  466  					 pmd_t pmd)
e5136e876581ba include/linux/pgtable.h       Rick Edgecombe          2023-06-12  467  {
e5136e876581ba include/linux/pgtable.h       Rick Edgecombe          2023-06-12  468  }
e5136e876581ba include/linux/pgtable.h       Rick Edgecombe          2023-06-12  469  #endif
e5136e876581ba include/linux/pgtable.h       Rick Edgecombe          2023-06-12  470  
1c399e74a97ca7 include/linux/pgtable.h       Peter Xu                2024-08-12  471  #ifndef arch_check_zapped_pud
1c399e74a97ca7 include/linux/pgtable.h       Peter Xu                2024-08-12  472  static inline void arch_check_zapped_pud(struct vm_area_struct *vma, pud_t pud)
1c399e74a97ca7 include/linux/pgtable.h       Peter Xu                2024-08-12  473  {
1c399e74a97ca7 include/linux/pgtable.h       Peter Xu                2024-08-12  474  }
1c399e74a97ca7 include/linux/pgtable.h       Peter Xu                2024-08-12  475  #endif
1c399e74a97ca7 include/linux/pgtable.h       Peter Xu                2024-08-12  476  
^1da177e4c3f41 include/asm-generic/pgtable.h Linus Torvalds          2005-04-16  477  #ifndef __HAVE_ARCH_PTEP_GET_AND_CLEAR
e2cda322648122 include/asm-generic/pgtable.h Andrea Arcangeli        2011-01-13  478  static inline pte_t ptep_get_and_clear(struct mm_struct *mm,
e2cda322648122 include/asm-generic/pgtable.h Andrea Arcangeli        2011-01-13  479  				       unsigned long address,
e2cda322648122 include/asm-generic/pgtable.h Andrea Arcangeli        2011-01-13  480  				       pte_t *ptep)
e2cda322648122 include/asm-generic/pgtable.h Andrea Arcangeli        2011-01-13  481  {
c33c794828f212 include/linux/pgtable.h       Ryan Roberts            2023-06-12  482  	pte_t pte = ptep_get(ptep);
e2cda322648122 include/asm-generic/pgtable.h Andrea Arcangeli        2011-01-13  483  	pte_clear(mm, address, ptep);
aa232204c46894 include/linux/pgtable.h       Kemeng Shi              2023-07-14  484  	page_table_check_pte_clear(mm, pte);
e2cda322648122 include/asm-generic/pgtable.h Andrea Arcangeli        2011-01-13  485  	return pte;
e2cda322648122 include/asm-generic/pgtable.h Andrea Arcangeli        2011-01-13  486  }
e2cda322648122 include/asm-generic/pgtable.h Andrea Arcangeli        2011-01-13  487  #endif
e2cda322648122 include/asm-generic/pgtable.h Andrea Arcangeli        2011-01-13  488  
1b68112c40395b include/linux/pgtable.h       Lance Yang              2024-04-18  489  #ifndef clear_young_dirty_ptes
1b68112c40395b include/linux/pgtable.h       Lance Yang              2024-04-18  490  /**
1b68112c40395b include/linux/pgtable.h       Lance Yang              2024-04-18  491   * clear_young_dirty_ptes - Mark PTEs that map consecutive pages of the
1b68112c40395b include/linux/pgtable.h       Lance Yang              2024-04-18  492   *		same folio as old/clean.
1b68112c40395b include/linux/pgtable.h       Lance Yang              2024-04-18  493   * @mm: Address space the pages are mapped into.
1b68112c40395b include/linux/pgtable.h       Lance Yang              2024-04-18  494   * @addr: Address the first page is mapped at.
1b68112c40395b include/linux/pgtable.h       Lance Yang              2024-04-18  495   * @ptep: Page table pointer for the first entry.
1b68112c40395b include/linux/pgtable.h       Lance Yang              2024-04-18  496   * @nr: Number of entries to mark old/clean.
1b68112c40395b include/linux/pgtable.h       Lance Yang              2024-04-18  497   * @flags: Flags to modify the PTE batch semantics.
1b68112c40395b include/linux/pgtable.h       Lance Yang              2024-04-18  498   *
1b68112c40395b include/linux/pgtable.h       Lance Yang              2024-04-18  499   * May be overridden by the architecture; otherwise, implemented by
1b68112c40395b include/linux/pgtable.h       Lance Yang              2024-04-18  500   * get_and_clear/modify/set for each pte in the range.
1b68112c40395b include/linux/pgtable.h       Lance Yang              2024-04-18  501   *
1b68112c40395b include/linux/pgtable.h       Lance Yang              2024-04-18  502   * Note that PTE bits in the PTE range besides the PFN can differ. For example,
1b68112c40395b include/linux/pgtable.h       Lance Yang              2024-04-18  503   * some PTEs might be write-protected.
1b68112c40395b include/linux/pgtable.h       Lance Yang              2024-04-18  504   *
1b68112c40395b include/linux/pgtable.h       Lance Yang              2024-04-18  505   * Context: The caller holds the page table lock.  The PTEs map consecutive
1b68112c40395b include/linux/pgtable.h       Lance Yang              2024-04-18  506   * pages that belong to the same folio.  The PTEs are all in the same PMD.
1b68112c40395b include/linux/pgtable.h       Lance Yang              2024-04-18  507   */
1b68112c40395b include/linux/pgtable.h       Lance Yang              2024-04-18  508  static inline void clear_young_dirty_ptes(struct vm_area_struct *vma,
1b68112c40395b include/linux/pgtable.h       Lance Yang              2024-04-18  509  					  unsigned long addr, pte_t *ptep,
1b68112c40395b include/linux/pgtable.h       Lance Yang              2024-04-18  510  					  unsigned int nr, cydp_t flags)
1b68112c40395b include/linux/pgtable.h       Lance Yang              2024-04-18  511  {
1b68112c40395b include/linux/pgtable.h       Lance Yang              2024-04-18  512  	pte_t pte;
1b68112c40395b include/linux/pgtable.h       Lance Yang              2024-04-18  513  
1b68112c40395b include/linux/pgtable.h       Lance Yang              2024-04-18  514  	for (;;) {
1b68112c40395b include/linux/pgtable.h       Lance Yang              2024-04-18  515  		if (flags == CYDP_CLEAR_YOUNG)
1b68112c40395b include/linux/pgtable.h       Lance Yang              2024-04-18  516  			ptep_test_and_clear_young(vma, addr, ptep);
1b68112c40395b include/linux/pgtable.h       Lance Yang              2024-04-18  517  		else {
1b68112c40395b include/linux/pgtable.h       Lance Yang              2024-04-18  518  			pte = ptep_get_and_clear(vma->vm_mm, addr, ptep);
1b68112c40395b include/linux/pgtable.h       Lance Yang              2024-04-18  519  			if (flags & CYDP_CLEAR_YOUNG)
1b68112c40395b include/linux/pgtable.h       Lance Yang              2024-04-18 @520  				pte = pte_mkold(pte);
1b68112c40395b include/linux/pgtable.h       Lance Yang              2024-04-18  521  			if (flags & CYDP_CLEAR_DIRTY)
1b68112c40395b include/linux/pgtable.h       Lance Yang              2024-04-18 @522  				pte = pte_mkclean(pte);
1b68112c40395b include/linux/pgtable.h       Lance Yang              2024-04-18  523  			set_pte_at(vma->vm_mm, addr, ptep, pte);
1b68112c40395b include/linux/pgtable.h       Lance Yang              2024-04-18  524  		}
1b68112c40395b include/linux/pgtable.h       Lance Yang              2024-04-18  525  		if (--nr == 0)
1b68112c40395b include/linux/pgtable.h       Lance Yang              2024-04-18  526  			break;
1b68112c40395b include/linux/pgtable.h       Lance Yang              2024-04-18  527  		ptep++;
1b68112c40395b include/linux/pgtable.h       Lance Yang              2024-04-18  528  		addr += PAGE_SIZE;
1b68112c40395b include/linux/pgtable.h       Lance Yang              2024-04-18  529  	}
1b68112c40395b include/linux/pgtable.h       Lance Yang              2024-04-18  530  }
1b68112c40395b include/linux/pgtable.h       Lance Yang              2024-04-18  531  #endif
1b68112c40395b include/linux/pgtable.h       Lance Yang              2024-04-18  532  

:::::: The code at line 380 was first introduced by commit
:::::: e2cda322648122dc400c85ada80eaddbc612ef6a thp: add pmd mangling generic functions

:::::: TO: Andrea Arcangeli <aarcange@redhat.com>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
