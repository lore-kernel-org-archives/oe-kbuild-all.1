Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A1A448D87C
	for <oe-kbuild-all@lists.linux.dev>; Thu, 13 Aug 2026 15:40:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786635655; cv=none; b=ODgAfGSBJ0Vubu0+1WzH67+nhS1dJkj1DjLV11KpUMZ/r8ZX+60dWF9n6VBlvCUu21RTjgwTs7cOftNSbn+ZGtkP2y3uI6jKwb15c+WqHTXGGqMHJhdr1rG/NPIPTjcxXxruAIIVsoYWMBRko5MigxW4EoadPTNNrVVghbO9DsU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786635655; c=relaxed/simple;
	bh=5WG8OgQDq4R0HseXMWe4anOnaWwAxgKAkx+ywB1rHFU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=HpGwGXr5aKh2A/EdUiklH1P7VXNcsPHum3Un6m816B8SnpFnBTXcQs77Wy5O9RQnKS7RANwPC7+vc365zaAJl2ioN0AKn9vq1/2mdDF78/llvT0bIRlCLD9nWnxPyBLquATpzJ0TsbKRD1kruUPYGyU/hPAzVnB4tHvU759NpyU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Geno8wfA; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Geno8wfA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786635650; x=1818171650;
  h=date:from:to:cc:subject:message-id;
  bh=5WG8OgQDq4R0HseXMWe4anOnaWwAxgKAkx+ywB1rHFU=;
  b=Geno8wfAB3vTXNtYxtlhzvQSU5n2FKEHoRAO+M5vc51J/YjaGh0QCaEn
   plLnAQVSHOBsAWTz+L7AfEOhof6zxa08JglEZ+QapLQF/zP10vO6dlgd2
   jnsbWbQDKf/lZ3TUg5DjMaEJoi0y6i2BxGQC1toDwmZrV485ZKU+ukalU
   5kySb1H185h0K8/DzWOFKGGGBlmcg418g6+apORVkoLDrQ137msu6MxbF
   XAWP1wkimvTP+47kHEe5DgZjCFz2PqwSGuksVJdnSlWriFzGHQ3naW6gc
   X1QR1SISKJLi6CutzGTEY+7GMSaek9E+YCxvm/yeGS0XshKCGDhf7OAPi
   A==;
X-CSE-ConnectionGUID: KUY87ru2SgKhrenZrTHs/A==
X-CSE-MsgGUID: mhxpBrPsSo22QOXL8yooOw==
X-IronPort-AV: E=McAfee;i="6800,10657,11874"; a="97877583"
X-IronPort-AV: E=Sophos;i="6.25,221,1779174000"; 
   d="scan'208";a="97877583"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Aug 2026 08:40:46 -0700
X-CSE-ConnectionGUID: v14mB0duRVqKdwj2XZGsKQ==
X-CSE-MsgGUID: sQIPBRp4SzqQA/xg9FZf3g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,221,1779174000"; 
   d="scan'208";a="287421056"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 13 Aug 2026 08:40:45 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wuXXu-00000000Vjf-2NTe;
	Thu, 13 Aug 2026 15:40:42 +0000
Date: Thu, 13 Aug 2026 23:40:24 +0800
From: kernel test robot <lkp@intel.com>
To: Matthew Wilcox <willy@infradead.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [willy-pagecache:headers 10/12]
 include/asm-generic/pgtable-nop4d.h:9:18: error: unknown type name 'pgd_t';
 did you mean 'pid_t'?
Message-ID: <202608132303.fSfX99I5-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   git://git.infradead.org/users/willy/pagecache headers
head:   05cde35b55fa761ee403c3df91a8de767f452935
commit: 407c67a9d6183fc8f62b6a9cf1c153a8cd49cbf3 [10/12] drm: Remove pagemap from ttm_tt.h header
config: arc-allmodconfig (https://download.01.org/0day-ci/archive/20260813/202608132303.fSfX99I5-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260813/202608132303.fSfX99I5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608132303.fSfX99I5-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from include/asm-generic/pgtable-nopud.h:7,
                    from include/asm-generic/pgtable-nopmd.h:7,
                    from arch/arc/include/asm/pgtable-levels.h:95,
                    from arch/arc/include/asm/pgtable.h:11,
                    from include/linux/pgtable.h:6,
                    from include/drm/ttm/ttm_caching.h:28,
                    from include/drm/ttm/ttm_tt.h:31,
                    from drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.c:8:
>> include/asm-generic/pgtable-nop4d.h:9:18: error: unknown type name 'pgd_t'; did you mean 'pid_t'?
       9 | typedef struct { pgd_t pgd; } p4d_t;
         |                  ^~~~~
         |                  pid_t
   include/asm-generic/pgtable-nop4d.h:21:28: error: unknown type name 'pgd_t'; did you mean 'p4d_t'?
      21 | static inline int pgd_none(pgd_t pgd)           { return 0; }
         |                            ^~~~~
         |                            p4d_t
   include/asm-generic/pgtable-nop4d.h:22:27: error: unknown type name 'pgd_t'; did you mean 'p4d_t'?
      22 | static inline int pgd_bad(pgd_t pgd)            { return 0; }
         |                           ^~~~~
         |                           p4d_t
   include/asm-generic/pgtable-nop4d.h:23:31: error: unknown type name 'pgd_t'; did you mean 'p4d_t'?
      23 | static inline int pgd_present(pgd_t pgd)        { return 1; }
         |                               ^~~~~
         |                               p4d_t
   include/asm-generic/pgtable-nop4d.h:24:30: error: unknown type name 'pgd_t'; did you mean 'p4d_t'?
      24 | static inline void pgd_clear(pgd_t *pgd)        { }
         |                              ^~~~~
         |                              p4d_t
   include/asm-generic/pgtable-nop4d.h:35:33: error: unknown type name 'pgd_t'; did you mean 'p4d_t'?
      35 | static inline p4d_t *p4d_offset(pgd_t *pgd, unsigned long address)
         |                                 ^~~~~
         |                                 p4d_t
   In file included from arch/arc/include/asm/pgtable.h:12:
>> arch/arc/include/asm/pgtable-bits-arcv2.h:86:23: error: unknown type name 'pte_t'
      86 |         static inline pte_t pte_##fn(pte_t pte) { pte_val(pte) op; return pte; }
         |                       ^~~~~
   arch/arc/include/asm/pgtable-bits-arcv2.h:88:1: note: in expansion of macro 'PTE_BIT_FUNC'
      88 | PTE_BIT_FUNC(mknotpresent,     &= ~(_PAGE_PRESENT));
         | ^~~~~~~~~~~~
   arch/arc/include/asm/pgtable-bits-arcv2.h:86:38: error: unknown type name 'pte_t'
      86 |         static inline pte_t pte_##fn(pte_t pte) { pte_val(pte) op; return pte; }
         |                                      ^~~~~
   arch/arc/include/asm/pgtable-bits-arcv2.h:88:1: note: in expansion of macro 'PTE_BIT_FUNC'
      88 | PTE_BIT_FUNC(mknotpresent,     &= ~(_PAGE_PRESENT));
         | ^~~~~~~~~~~~
>> arch/arc/include/asm/pgtable-bits-arcv2.h:86:23: error: unknown type name 'pte_t'
      86 |         static inline pte_t pte_##fn(pte_t pte) { pte_val(pte) op; return pte; }
         |                       ^~~~~
   arch/arc/include/asm/pgtable-bits-arcv2.h:89:1: note: in expansion of macro 'PTE_BIT_FUNC'
      89 | PTE_BIT_FUNC(wrprotect, &= ~(_PAGE_WRITE));
         | ^~~~~~~~~~~~
   arch/arc/include/asm/pgtable-bits-arcv2.h:86:38: error: unknown type name 'pte_t'
      86 |         static inline pte_t pte_##fn(pte_t pte) { pte_val(pte) op; return pte; }
         |                                      ^~~~~
   arch/arc/include/asm/pgtable-bits-arcv2.h:89:1: note: in expansion of macro 'PTE_BIT_FUNC'
      89 | PTE_BIT_FUNC(wrprotect, &= ~(_PAGE_WRITE));
         | ^~~~~~~~~~~~
>> arch/arc/include/asm/pgtable-bits-arcv2.h:86:23: error: unknown type name 'pte_t'
      86 |         static inline pte_t pte_##fn(pte_t pte) { pte_val(pte) op; return pte; }
         |                       ^~~~~
   arch/arc/include/asm/pgtable-bits-arcv2.h:90:1: note: in expansion of macro 'PTE_BIT_FUNC'
      90 | PTE_BIT_FUNC(mkwrite_novma,     |= (_PAGE_WRITE));
         | ^~~~~~~~~~~~
   arch/arc/include/asm/pgtable-bits-arcv2.h:86:38: error: unknown type name 'pte_t'
      86 |         static inline pte_t pte_##fn(pte_t pte) { pte_val(pte) op; return pte; }
         |                                      ^~~~~
   arch/arc/include/asm/pgtable-bits-arcv2.h:90:1: note: in expansion of macro 'PTE_BIT_FUNC'
      90 | PTE_BIT_FUNC(mkwrite_novma,     |= (_PAGE_WRITE));
         | ^~~~~~~~~~~~
>> arch/arc/include/asm/pgtable-bits-arcv2.h:86:23: error: unknown type name 'pte_t'
      86 |         static inline pte_t pte_##fn(pte_t pte) { pte_val(pte) op; return pte; }
         |                       ^~~~~
   arch/arc/include/asm/pgtable-bits-arcv2.h:91:1: note: in expansion of macro 'PTE_BIT_FUNC'
      91 | PTE_BIT_FUNC(mkclean,   &= ~(_PAGE_DIRTY));
         | ^~~~~~~~~~~~
   arch/arc/include/asm/pgtable-bits-arcv2.h:86:38: error: unknown type name 'pte_t'
      86 |         static inline pte_t pte_##fn(pte_t pte) { pte_val(pte) op; return pte; }
         |                                      ^~~~~
   arch/arc/include/asm/pgtable-bits-arcv2.h:91:1: note: in expansion of macro 'PTE_BIT_FUNC'
      91 | PTE_BIT_FUNC(mkclean,   &= ~(_PAGE_DIRTY));
         | ^~~~~~~~~~~~
>> arch/arc/include/asm/pgtable-bits-arcv2.h:86:23: error: unknown type name 'pte_t'
      86 |         static inline pte_t pte_##fn(pte_t pte) { pte_val(pte) op; return pte; }
         |                       ^~~~~
   arch/arc/include/asm/pgtable-bits-arcv2.h:92:1: note: in expansion of macro 'PTE_BIT_FUNC'
      92 | PTE_BIT_FUNC(mkdirty,   |= (_PAGE_DIRTY));
         | ^~~~~~~~~~~~
   arch/arc/include/asm/pgtable-bits-arcv2.h:86:38: error: unknown type name 'pte_t'
      86 |         static inline pte_t pte_##fn(pte_t pte) { pte_val(pte) op; return pte; }
         |                                      ^~~~~
   arch/arc/include/asm/pgtable-bits-arcv2.h:92:1: note: in expansion of macro 'PTE_BIT_FUNC'
      92 | PTE_BIT_FUNC(mkdirty,   |= (_PAGE_DIRTY));
         | ^~~~~~~~~~~~
>> arch/arc/include/asm/pgtable-bits-arcv2.h:86:23: error: unknown type name 'pte_t'
      86 |         static inline pte_t pte_##fn(pte_t pte) { pte_val(pte) op; return pte; }
         |                       ^~~~~
   arch/arc/include/asm/pgtable-bits-arcv2.h:93:1: note: in expansion of macro 'PTE_BIT_FUNC'
      93 | PTE_BIT_FUNC(mkold,     &= ~(_PAGE_ACCESSED));
         | ^~~~~~~~~~~~
   arch/arc/include/asm/pgtable-bits-arcv2.h:86:38: error: unknown type name 'pte_t'
      86 |         static inline pte_t pte_##fn(pte_t pte) { pte_val(pte) op; return pte; }
         |                                      ^~~~~
   arch/arc/include/asm/pgtable-bits-arcv2.h:93:1: note: in expansion of macro 'PTE_BIT_FUNC'
      93 | PTE_BIT_FUNC(mkold,     &= ~(_PAGE_ACCESSED));
         | ^~~~~~~~~~~~
>> arch/arc/include/asm/pgtable-bits-arcv2.h:86:23: error: unknown type name 'pte_t'
      86 |         static inline pte_t pte_##fn(pte_t pte) { pte_val(pte) op; return pte; }
         |                       ^~~~~
   arch/arc/include/asm/pgtable-bits-arcv2.h:94:1: note: in expansion of macro 'PTE_BIT_FUNC'
      94 | PTE_BIT_FUNC(mkyoung,   |= (_PAGE_ACCESSED));
         | ^~~~~~~~~~~~
   arch/arc/include/asm/pgtable-bits-arcv2.h:86:38: error: unknown type name 'pte_t'
      86 |         static inline pte_t pte_##fn(pte_t pte) { pte_val(pte) op; return pte; }
         |                                      ^~~~~
   arch/arc/include/asm/pgtable-bits-arcv2.h:94:1: note: in expansion of macro 'PTE_BIT_FUNC'
      94 | PTE_BIT_FUNC(mkyoung,   |= (_PAGE_ACCESSED));
         | ^~~~~~~~~~~~
>> arch/arc/include/asm/pgtable-bits-arcv2.h:86:23: error: unknown type name 'pte_t'
      86 |         static inline pte_t pte_##fn(pte_t pte) { pte_val(pte) op; return pte; }
         |                       ^~~~~
   arch/arc/include/asm/pgtable-bits-arcv2.h:95:1: note: in expansion of macro 'PTE_BIT_FUNC'
      95 | PTE_BIT_FUNC(mkspecial, |= (_PAGE_SPECIAL));
         | ^~~~~~~~~~~~
   arch/arc/include/asm/pgtable-bits-arcv2.h:86:38: error: unknown type name 'pte_t'
      86 |         static inline pte_t pte_##fn(pte_t pte) { pte_val(pte) op; return pte; }
         |                                      ^~~~~
   arch/arc/include/asm/pgtable-bits-arcv2.h:95:1: note: in expansion of macro 'PTE_BIT_FUNC'
      95 | PTE_BIT_FUNC(mkspecial, |= (_PAGE_SPECIAL));
         | ^~~~~~~~~~~~
>> arch/arc/include/asm/pgtable-bits-arcv2.h:86:23: error: unknown type name 'pte_t'
      86 |         static inline pte_t pte_##fn(pte_t pte) { pte_val(pte) op; return pte; }
         |                       ^~~~~
   arch/arc/include/asm/pgtable-bits-arcv2.h:96:1: note: in expansion of macro 'PTE_BIT_FUNC'
      96 | PTE_BIT_FUNC(mkhuge,    |= (_PAGE_HW_SZ));
         | ^~~~~~~~~~~~
   arch/arc/include/asm/pgtable-bits-arcv2.h:86:38: error: unknown type name 'pte_t'
      86 |         static inline pte_t pte_##fn(pte_t pte) { pte_val(pte) op; return pte; }
         |                                      ^~~~~
   arch/arc/include/asm/pgtable-bits-arcv2.h:96:1: note: in expansion of macro 'PTE_BIT_FUNC'
      96 | PTE_BIT_FUNC(mkhuge,    |= (_PAGE_HW_SZ));
         | ^~~~~~~~~~~~
   arch/arc/include/asm/pgtable-bits-arcv2.h:98:15: error: unknown type name 'pte_t'
      98 | static inline pte_t pte_modify(pte_t pte, pgprot_t newprot)
         |               ^~~~~
   arch/arc/include/asm/pgtable-bits-arcv2.h:98:32: error: unknown type name 'pte_t'
      98 | static inline pte_t pte_modify(pte_t pte, pgprot_t newprot)
         |                                ^~~~~
>> arch/arc/include/asm/pgtable-bits-arcv2.h:98:43: error: unknown type name 'pgprot_t'
      98 | static inline pte_t pte_modify(pte_t pte, pgprot_t newprot)
         |                                           ^~~~~~~~
   arch/arc/include/asm/pgtable-bits-arcv2.h:105:40: error: unknown type name 'pte_t'
     105 |                 unsigned long address, pte_t *ptep, unsigned int nr);
         |                                        ^~~~~
   arch/arc/include/asm/pgtable-bits-arcv2.h:133:38: error: unknown type name 'pte_t'
     133 | static inline bool pte_swp_exclusive(pte_t pte)
         |                                      ^~~~~
>> arch/arc/include/asm/pgtable-bits-arcv2.h:86:23: error: unknown type name 'pte_t'
      86 |         static inline pte_t pte_##fn(pte_t pte) { pte_val(pte) op; return pte; }
         |                       ^~~~~
   arch/arc/include/asm/pgtable-bits-arcv2.h:138:1: note: in expansion of macro 'PTE_BIT_FUNC'
     138 | PTE_BIT_FUNC(swp_mkexclusive, |= (_PAGE_SWP_EXCLUSIVE));
         | ^~~~~~~~~~~~
   arch/arc/include/asm/pgtable-bits-arcv2.h:86:38: error: unknown type name 'pte_t'
      86 |         static inline pte_t pte_##fn(pte_t pte) { pte_val(pte) op; return pte; }
         |                                      ^~~~~
   arch/arc/include/asm/pgtable-bits-arcv2.h:138:1: note: in expansion of macro 'PTE_BIT_FUNC'
     138 | PTE_BIT_FUNC(swp_mkexclusive, |= (_PAGE_SWP_EXCLUSIVE));
         | ^~~~~~~~~~~~
>> arch/arc/include/asm/pgtable-bits-arcv2.h:86:23: error: unknown type name 'pte_t'
      86 |         static inline pte_t pte_##fn(pte_t pte) { pte_val(pte) op; return pte; }
         |                       ^~~~~
   arch/arc/include/asm/pgtable-bits-arcv2.h:139:1: note: in expansion of macro 'PTE_BIT_FUNC'
     139 | PTE_BIT_FUNC(swp_clear_exclusive, &= ~(_PAGE_SWP_EXCLUSIVE));
         | ^~~~~~~~~~~~
   arch/arc/include/asm/pgtable-bits-arcv2.h:86:38: error: unknown type name 'pte_t'
      86 |         static inline pte_t pte_##fn(pte_t pte) { pte_val(pte) op; return pte; }
         |                                      ^~~~~
   arch/arc/include/asm/pgtable-bits-arcv2.h:139:1: note: in expansion of macro 'PTE_BIT_FUNC'
     139 | PTE_BIT_FUNC(swp_clear_exclusive, &= ~(_PAGE_SWP_EXCLUSIVE));
         | ^~~~~~~~~~~~
   In file included from arch/arc/include/asm/pgtable-bits-arcv2.h:142:
>> arch/arc/include/asm/hugepage.h:20:15: error: unknown type name 'pte_t'
      20 | static inline pte_t pmd_pte(pmd_t pmd)
         |               ^~~~~
   arch/arc/include/asm/hugepage.h: In function 'pmd_pte':
>> arch/arc/include/asm/hugepage.h:22:16: error: implicit declaration of function '__pte'; did you mean 'pmd_pte'? [-Wimplicit-function-declaration]
      22 |         return __pte(pmd_val(pmd));
         |                ^~~~~
         |                pmd_pte
>> include/asm-generic/pgtable-nop4d.h:40:50: error: implicit declaration of function 'pgd_val'; did you mean 'pud_val'? [-Wimplicit-function-declaration]
      40 | #define p4d_val(x)                              (pgd_val((x).pgd))
         |                                                  ^~~~~~~
   include/asm-generic/pgtable-nopud.h:48:50: note: in expansion of macro 'p4d_val'
      48 | #define pud_val(x)                              (p4d_val((x).p4d))
         |                                                  ^~~~~~~
   include/asm-generic/pgtable-nopmd.h:52:50: note: in expansion of macro 'pud_val'
      52 | #define pmd_val(x)                              (pud_val((x).pud))
         |                                                  ^~~~~~~
   arch/arc/include/asm/hugepage.h:22:22: note: in expansion of macro 'pmd_val'
      22 |         return __pte(pmd_val(pmd));
         |                      ^~~~~~~
   arch/arc/include/asm/hugepage.h: At top level:
   arch/arc/include/asm/hugepage.h:25:29: error: unknown type name 'pte_t'
      25 | static inline pmd_t pte_pmd(pte_t pte)
         |                             ^~~~~
>> arch/arc/include/asm/hugepage.h:47:43: error: unknown type name 'pgprot_t'
      47 | static inline pmd_t pmd_modify(pmd_t pmd, pgprot_t newprot)
         |                                           ^~~~~~~~
>> arch/arc/include/asm/hugepage.h:62:41: warning: 'struct vm_area_struct' declared inside parameter list will not be visible outside of this definition or declaration
      62 | extern void update_mmu_cache_pmd(struct vm_area_struct *vma, unsigned long addr,
         |                                         ^~~~~~~~~~~~~~
   arch/arc/include/asm/hugepage.h:66:40: warning: 'struct vm_area_struct' declared inside parameter list will not be visible outside of this definition or declaration
      66 | extern void flush_pmd_tlb_range(struct vm_area_struct *vma, unsigned long start,
         |                                        ^~~~~~~~~~~~~~
   In file included from arch/arc/include/asm/pgtable.h:13:
   include/linux/pgtable.h: In function 'pte_offset_kernel':
>> arch/arc/include/asm/page.h:43:29: error: request for member 'pgd' in something not a structure or union
      43 | #define pgd_val(x)      ((x).pgd)
         |                             ^
   include/asm-generic/pgtable-nop4d.h:40:50: note: in expansion of macro 'pgd_val'
      40 | #define p4d_val(x)                              (pgd_val((x).pgd))
         |                                                  ^~~~~~~
   include/asm-generic/pgtable-nopud.h:48:50: note: in expansion of macro 'p4d_val'
      48 | #define pud_val(x)                              (p4d_val((x).p4d))
         |                                                  ^~~~~~~
   include/asm-generic/pgtable-nopmd.h:52:50: note: in expansion of macro 'pud_val'
      52 | #define pmd_val(x)                              (pud_val((x).pud))
         |                                                  ^~~~~~~
   arch/arc/include/asm/pgtable-levels.h:159:34: note: in expansion of macro 'pmd_val'
     159 | #define pmd_page_vaddr(pmd)     (pmd_val(pmd) & PAGE_MASK)
         |                                  ^~~~~~~
   include/linux/pgtable.h:98:25: note: in expansion of macro 'pmd_page_vaddr'
      98 |         return (pte_t *)pmd_page_vaddr(*pmd) + pte_index(address);
         |                         ^~~~~~~~~~~~~~
   include/linux/pgtable.h: In function 'pmd_off':
>> include/linux/pgtable.h:167:38: error: implicit declaration of function 'p4d_offset'; did you mean 'pmd_offset'? [-Wimplicit-function-declaration]
     167 |         return pmd_offset(pud_offset(p4d_offset(pgd_offset(mm, va), va), va), va);
         |                                      ^~~~~~~~~~
         |                                      pmd_offset
   include/linux/pgtable.h:167:38: error: passing argument 1 of 'pud_offset' makes pointer from integer without a cast [-Wint-conversion]
     167 |         return pmd_offset(pud_offset(p4d_offset(pgd_offset(mm, va), va), va), va);
         |                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                                      |
         |                                      int
   include/asm-generic/pgtable-nopud.h:42:40: note: expected 'p4d_t *' but argument is of type 'int'
      42 | static inline pud_t *pud_offset(p4d_t *p4d, unsigned long address)
         |                                 ~~~~~~~^~~
   include/linux/pgtable.h: In function 'pmd_off_k':
   include/linux/pgtable.h:172:38: error: passing argument 1 of 'pud_offset' makes pointer from integer without a cast [-Wint-conversion]
     172 |         return pmd_offset(pud_offset(p4d_offset(pgd_offset_k(va), va), va), va);
         |                                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                                      |
         |                                      int
   include/asm-generic/pgtable-nopud.h:42:40: note: expected 'p4d_t *' but argument is of type 'int'
      42 | static inline pud_t *pud_offset(p4d_t *p4d, unsigned long address)
         |                                 ~~~~~~~^~~
   include/linux/pgtable.h: In function 'virt_to_kpte':
   arch/arc/include/asm/page.h:43:29: error: request for member 'pgd' in something not a structure or union
      43 | #define pgd_val(x)      ((x).pgd)
         |                             ^
   include/asm-generic/pgtable-nop4d.h:40:50: note: in expansion of macro 'pgd_val'
      40 | #define p4d_val(x)                              (pgd_val((x).pgd))
         |                                                  ^~~~~~~
   include/asm-generic/pgtable-nopud.h:48:50: note: in expansion of macro 'p4d_val'
      48 | #define pud_val(x)                              (p4d_val((x).p4d))
         |                                                  ^~~~~~~
   include/asm-generic/pgtable-nopmd.h:52:50: note: in expansion of macro 'pud_val'
      52 | #define pmd_val(x)                              (pud_val((x).pud))
         |                                                  ^~~~~~~
   arch/arc/include/asm/pgtable-levels.h:155:35: note: in expansion of macro 'pmd_val'
     155 | #define pmd_none(x)             (!pmd_val(x))
         |                                   ^~~~~~~
   include/linux/pgtable.h:179:16: note: in expansion of macro 'pmd_none'
     179 |         return pmd_none(*pmd) ? NULL : pte_offset_kernel(pmd, vaddr);
         |                ^~~~~~~~
   include/linux/pgtable.h: In function 'ptep_test_and_clear_young':
   include/linux/pgtable.h:537:55: error: implicit declaration of function 'pte_mkold'; did you mean 'pmd_mkold'? [-Wimplicit-function-declaration]
     537 |                 set_pte_at(vma->vm_mm, address, ptep, pte_mkold(pte));
         |                                                       ^~~~~~~~~
   include/linux/pgtable.h:458:66: note: in definition of macro 'set_pte_at'
     458 | #define set_pte_at(mm, addr, ptep, pte) set_ptes(mm, addr, ptep, pte, 1)
         |                                                                  ^~~
   include/linux/pgtable.h:537:55: error: incompatible type for argument 4 of 'set_ptes'
     537 |                 set_pte_at(vma->vm_mm, address, ptep, pte_mkold(pte));
         |                                                       ^~~~~~~~~~~~~~
         |                                                       |
         |                                                       int
   include/linux/pgtable.h:458:66: note: in definition of macro 'set_pte_at'
     458 | #define set_pte_at(mm, addr, ptep, pte) set_ptes(mm, addr, ptep, pte, 1)
         |                                                                  ^~~
   include/linux/pgtable.h:445:36: note: expected 'pte_t' but argument is of type 'int'
     445 |                 pte_t *ptep, pte_t pte, unsigned int nr)
         |                              ~~~~~~^~~
   include/linux/pgtable.h: In function 'pmdp_test_and_clear_young':
   arch/arc/include/asm/page.h:76:29: error: request for member 'pte' in something not a structure or union
      76 | #define pte_val(x)      ((x).pte)
         |                             ^
   arch/arc/include/asm/pgtable-bits-arcv2.h:82:34: note: in expansion of macro 'pte_val'
      82 | #define pte_young(pte)          (pte_val(pte) & _PAGE_ACCESSED)
         |                                  ^~~~~~~
   arch/arc/include/asm/hugepage.h:40:33: note: in expansion of macro 'pte_young'
      40 | #define pmd_young(pmd)          pte_young(pmd_pte(pmd))
         |                                 ^~~~~~~~~
   include/linux/pgtable.h:550:14: note: in expansion of macro 'pmd_young'
     550 |         if (!pmd_young(pmd))
         |              ^~~~~~~~~
   arch/arc/include/asm/hugepage.h:33:33: error: implicit declaration of function 'pte_pmd'; did you mean 'pfn_pmd'? [-Wimplicit-function-declaration]
      33 | #define pmd_mkold(pmd)          pte_pmd(pte_mkold(pmd_pte(pmd)))
         |                                 ^~~~~~~
   include/linux/pgtable.h:553:55: note: in expansion of macro 'pmd_mkold'
     553 |                 set_pmd_at(vma->vm_mm, address, pmdp, pmd_mkold(pmd));
         |                                                       ^~~~~~~~~
   arch/arc/include/asm/hugepage.h:33:33: error: incompatible type for argument 4 of 'set_pmd_at'
      33 | #define pmd_mkold(pmd)          pte_pmd(pte_mkold(pmd_pte(pmd)))
         |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                                 |
         |                                 int
   include/linux/pgtable.h:553:55: note: in expansion of macro 'pmd_mkold'
     553 |                 set_pmd_at(vma->vm_mm, address, pmdp, pmd_mkold(pmd));
         |                                                       ^~~~~~~~~
   arch/arc/include/asm/hugepage.h:57:50: note: expected 'pmd_t' but argument is of type 'int'
      57 |                               pmd_t *pmdp, pmd_t pmd)
         |                                            ~~~~~~^~~
   include/linux/pgtable.h: In function 'clear_young_dirty_ptes':
   include/linux/pgtable.h:687:39: error: incompatible types when assigning to type 'pte_t' from type 'int'
     687 |                                 pte = pte_mkold(pte);
         |                                       ^~~~~~~~~
   include/linux/pgtable.h:689:39: error: implicit declaration of function 'pte_mkclean'; did you mean 'pmd_mkclean'? [-Wimplicit-function-declaration]
     689 |                                 pte = pte_mkclean(pte);
         |                                       ^~~~~~~~~~~
         |                                       pmd_mkclean
   include/linux/pgtable.h:689:39: error: incompatible types when assigning to type 'pte_t' from type 'int'
   include/linux/pgtable.h: In function 'pmdp_huge_get_and_clear':
   arch/arc/include/asm/page.h:43:29: error: request for member 'pgd' in something not a structure or union
      43 | #define pgd_val(x)      ((x).pgd)
         |                             ^


vim +9 include/asm-generic/pgtable-nop4d.h

048456dcf2c56a Kiryl Shutsemau 2017-03-09   8  
048456dcf2c56a Kiryl Shutsemau 2017-03-09  @9  typedef struct { pgd_t pgd; } p4d_t;
048456dcf2c56a Kiryl Shutsemau 2017-03-09  10  
048456dcf2c56a Kiryl Shutsemau 2017-03-09  11  #define P4D_SHIFT		PGDIR_SHIFT
048456dcf2c56a Kiryl Shutsemau 2017-03-09  12  #define PTRS_PER_P4D		1
048456dcf2c56a Kiryl Shutsemau 2017-03-09  13  #define P4D_SIZE		(1UL << P4D_SHIFT)
048456dcf2c56a Kiryl Shutsemau 2017-03-09  14  #define P4D_MASK		(~(P4D_SIZE-1))
048456dcf2c56a Kiryl Shutsemau 2017-03-09  15  
048456dcf2c56a Kiryl Shutsemau 2017-03-09  16  /*
048456dcf2c56a Kiryl Shutsemau 2017-03-09  17   * The "pgd_xxx()" functions here are trivial for a folded two-level
048456dcf2c56a Kiryl Shutsemau 2017-03-09  18   * setup: the p4d is never bad, and a p4d always exists (as it's folded
048456dcf2c56a Kiryl Shutsemau 2017-03-09  19   * into the pgd entry)
048456dcf2c56a Kiryl Shutsemau 2017-03-09  20   */
048456dcf2c56a Kiryl Shutsemau 2017-03-09  21  static inline int pgd_none(pgd_t pgd)		{ return 0; }
048456dcf2c56a Kiryl Shutsemau 2017-03-09  22  static inline int pgd_bad(pgd_t pgd)		{ return 0; }
048456dcf2c56a Kiryl Shutsemau 2017-03-09  23  static inline int pgd_present(pgd_t pgd)	{ return 1; }
048456dcf2c56a Kiryl Shutsemau 2017-03-09  24  static inline void pgd_clear(pgd_t *pgd)	{ }
048456dcf2c56a Kiryl Shutsemau 2017-03-09  25  #define p4d_ERROR(p4d)				(pgd_ERROR((p4d).pgd))
048456dcf2c56a Kiryl Shutsemau 2017-03-09  26  
048456dcf2c56a Kiryl Shutsemau 2017-03-09  27  #define pgd_populate(mm, pgd, p4d)		do { } while (0)
0a9fe8ca844d43 Dan Williams    2018-12-04  28  #define pgd_populate_safe(mm, pgd, p4d)		do { } while (0)
048456dcf2c56a Kiryl Shutsemau 2017-03-09  29  /*
048456dcf2c56a Kiryl Shutsemau 2017-03-09  30   * (p4ds are folded into pgds so this doesn't get actually called,
048456dcf2c56a Kiryl Shutsemau 2017-03-09  31   * but the define is needed for a generic inline function.)
048456dcf2c56a Kiryl Shutsemau 2017-03-09  32   */
048456dcf2c56a Kiryl Shutsemau 2017-03-09  33  #define set_pgd(pgdptr, pgdval)	set_p4d((p4d_t *)(pgdptr), (p4d_t) { pgdval })
048456dcf2c56a Kiryl Shutsemau 2017-03-09  34  
048456dcf2c56a Kiryl Shutsemau 2017-03-09  35  static inline p4d_t *p4d_offset(pgd_t *pgd, unsigned long address)
048456dcf2c56a Kiryl Shutsemau 2017-03-09  36  {
048456dcf2c56a Kiryl Shutsemau 2017-03-09  37  	return (p4d_t *)pgd;
048456dcf2c56a Kiryl Shutsemau 2017-03-09  38  }
048456dcf2c56a Kiryl Shutsemau 2017-03-09  39  
048456dcf2c56a Kiryl Shutsemau 2017-03-09 @40  #define p4d_val(x)				(pgd_val((x).pgd))
048456dcf2c56a Kiryl Shutsemau 2017-03-09  41  #define __p4d(x)				((p4d_t) { __pgd(x) })
048456dcf2c56a Kiryl Shutsemau 2017-03-09  42  

:::::: The code at line 9 was first introduced by commit
:::::: 048456dcf2c56ad6f6248e2899dda92fb6a613f6 asm-generic: introduce <asm-generic/pgtable-nop4d.h>

:::::: TO: Kirill A. Shutemov <kirill.shutemov@linux.intel.com>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
