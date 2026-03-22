Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3786C309EEC
	for <oe-kbuild-all@lists.linux.dev>; Sun, 22 Mar 2026 05:08:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774156082; cv=none; b=p7y23WBAF7U7/WdduiVdNUlhprTlY/tD2SZCC3TVBTbm+zoacQ/U4s6RcUPzN1zFm3Hkrr/wwhbkhRf1T98oXFk0fcUHBZiAqP4n/7ViSlxVYrQXEZ/tKJWKikI8OmAvgiqgHnGe6QPHB4j2/tqAUpiDb8+gOGOjS5sY1ob4gU4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774156082; c=relaxed/simple;
	bh=77TXCApDYgakiBZtORFRHae4gPM9ERBARwx7WRMQ7Oc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=KQPev4n80Ggx6aYrlYVrkryS1N79Z58hKlEXsYpEdnaKoozpx+X6cLsHKZf/ba3Vv27Z7J0nS/0Q96IkpP+UaAbwX2o5t/s2KOrr5gj2dif8alJl/6x5npIyi/SQAuSNOQkg+tOxvhQN0A1EjT2rWEzV4OS3VdJ2X6D86aIkeVs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WYPXzOjS; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WYPXzOjS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774156081; x=1805692081;
  h=date:from:to:cc:subject:message-id;
  bh=77TXCApDYgakiBZtORFRHae4gPM9ERBARwx7WRMQ7Oc=;
  b=WYPXzOjSIfbmNnIOwEIWGLWPzXnVTCoZfjA6c2m6FpE2feZNN/bnFBZq
   TlbFupwI0k0yd77UEeDXoP13WiNqm2m25O7gv++lczQ5jJvf+eD6vv84j
   yHbmQaSbPpt8aOVz7fxiCpNTvrOA/ne9vjAuTThIxCa9iqqBcGjZgpYhn
   fqtUpisA4M9pOLAIDpcYejnjgDAn9NP+/bl1diPAPuUIPTmwA2qG5YgSR
   ONcutmH6uMToKEgk4rzryWzxmAukNBku7ZQ4jzbZNgo89h8Ddsb8xXdGc
   6T8LlVcJ3t1XJdpeMndrC0PkXMSCZgBSi3Ewsqr3xwuN8vNWKatccfIQ4
   Q==;
X-CSE-ConnectionGUID: zeYJkH4/TeaVj98JYFyUrA==
X-CSE-MsgGUID: 6wcOORtHQeyblijrb/Gg/g==
X-IronPort-AV: E=McAfee;i="6800,10657,11736"; a="75098176"
X-IronPort-AV: E=Sophos;i="6.23,134,1770624000"; 
   d="scan'208";a="75098176"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Mar 2026 22:07:59 -0700
X-CSE-ConnectionGUID: qE3kqM0DRe6Mja5/2waMIQ==
X-CSE-MsgGUID: OuwRnfOaTDOGKhCdx6jjVg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,134,1770624000"; 
   d="scan'208";a="220508304"
Received: from lkp-server02.sh.intel.com (HELO d7fefbca0d04) ([10.239.97.151])
  by fmviesa007.fm.intel.com with ESMTP; 21 Mar 2026 22:07:58 -0700
Received: from kbuild by d7fefbca0d04 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w4B2Z-000000001ip-2vlT;
	Sun, 22 Mar 2026 05:07:55 +0000
Date: Sun, 22 Mar 2026 13:07:25 +0800
From: kernel test robot <lkp@intel.com>
To: "Kiryl Shutsemau (Meta)" <kas@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [kas:pte_size 14/30] include/linux/mm.h:2290:42: warning:
 suggest parentheses around arithmetic in operand of '|'
Message-ID: <202603221331.kXAGiz3W-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/kas/linux.git pte_size
head:   3ecd2bc82d7d0382233099de8d07616df26745c4
commit: cdc06b03f4725681883e0faf3b429849cd5c3475 [14/30] mm: Introduce mkpte() and folio_mkpte()
config: nios2-allnoconfig (https://download.01.org/0day-ci/archive/20260322/202603221331.kXAGiz3W-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260322/202603221331.kXAGiz3W-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603221331.kXAGiz3W-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from arch/nios2/include/asm/processor.h:22,
                    from include/linux/sched.h:13,
                    from arch/nios2/kernel/asm-offsets.c:8:
   include/linux/mm.h: In function 'mkpte':
>> include/linux/mm.h:2290:42: warning: suggest parentheses around arithmetic in operand of '|' [-Wparentheses]
    2290 |         return pfn_pte(page_to_pfn(page) + off, pgprot);
   arch/nios2/include/asm/page.h:65:37: note: in definition of macro '__pte'
      65 | #define __pte(x)        ((pte_t) { (x) })
         |                                     ^
   include/linux/mm.h:2290:16: note: in expansion of macro 'pfn_pte'
    2290 |         return pfn_pte(page_to_pfn(page) + off, pgprot);
         |                ^~~~~~~
   include/linux/mm.h: In function 'folio_mkpte':
   include/linux/mm.h:2309:41: warning: suggest parentheses around arithmetic in operand of '|' [-Wparentheses]
    2309 |         return pfn_pte(folio_pfn(folio) + off, pgprot);
         |                        ~~~~~~~~~~~~~~~~~^~~~~
   arch/nios2/include/asm/page.h:65:37: note: in definition of macro '__pte'
      65 | #define __pte(x)        ((pte_t) { (x) })
         |                                     ^
   include/linux/mm.h:2309:16: note: in expansion of macro 'pfn_pte'
    2309 |         return pfn_pte(folio_pfn(folio) + off, pgprot);
         |                ^~~~~~~
--
   In file included from arch/nios2/include/asm/processor.h:22,
                    from include/linux/spinlock_up.h:8,
                    from include/linux/spinlock.h:97,
                    from include/linux/mmzone.h:8,
                    from include/linux/gfp.h:7,
                    from include/linux/mm.h:8,
                    from arch/nios2/mm/dma-mapping.c:14:
   include/linux/mm.h: In function 'mkpte':
>> include/linux/mm.h:2290:42: warning: suggest parentheses around arithmetic in operand of '|' [-Wparentheses]
    2290 |         return pfn_pte(page_to_pfn(page) + off, pgprot);
   arch/nios2/include/asm/page.h:65:37: note: in definition of macro '__pte'
      65 | #define __pte(x)        ((pte_t) { (x) })
         |                                     ^
   include/linux/mm.h:2290:16: note: in expansion of macro 'pfn_pte'
    2290 |         return pfn_pte(page_to_pfn(page) + off, pgprot);
         |                ^~~~~~~
   include/linux/mm.h: In function 'folio_mkpte':
   include/linux/mm.h:2309:41: warning: suggest parentheses around arithmetic in operand of '|' [-Wparentheses]
    2309 |         return pfn_pte(folio_pfn(folio) + off, pgprot);
         |                        ~~~~~~~~~~~~~~~~~^~~~~
   arch/nios2/include/asm/page.h:65:37: note: in definition of macro '__pte'
      65 | #define __pte(x)        ((pte_t) { (x) })
         |                                     ^
   include/linux/mm.h:2309:16: note: in expansion of macro 'pfn_pte'
    2309 |         return pfn_pte(folio_pfn(folio) + off, pgprot);
         |                ^~~~~~~
   arch/nios2/mm/dma-mapping.c: At top level:
   arch/nios2/mm/dma-mapping.c:21:6: warning: no previous prototype for 'arch_sync_dma_for_device' [-Wmissing-prototypes]
      21 | void arch_sync_dma_for_device(phys_addr_t paddr, size_t size,
         |      ^~~~~~~~~~~~~~~~~~~~~~~~
   arch/nios2/mm/dma-mapping.c:45:6: warning: no previous prototype for 'arch_sync_dma_for_cpu' [-Wmissing-prototypes]
      45 | void arch_sync_dma_for_cpu(phys_addr_t paddr, size_t size,
         |      ^~~~~~~~~~~~~~~~~~~~~
   arch/nios2/mm/dma-mapping.c:63:6: warning: no previous prototype for 'arch_dma_prep_coherent' [-Wmissing-prototypes]
      63 | void arch_dma_prep_coherent(struct page *page, size_t size)
         |      ^~~~~~~~~~~~~~~~~~~~~~
   arch/nios2/mm/dma-mapping.c:70:7: warning: no previous prototype for 'arch_dma_set_uncached' [-Wmissing-prototypes]
      70 | void *arch_dma_set_uncached(void *ptr, size_t size)
         |       ^~~~~~~~~~~~~~~~~~~~~
--
   In file included from arch/nios2/include/asm/processor.h:22,
                    from include/linux/spinlock_up.h:8,
                    from include/linux/spinlock.h:97,
                    from include/linux/mmzone.h:8,
                    from include/linux/gfp.h:7,
                    from include/linux/mm.h:8,
                    from arch/nios2/mm/pgtable.c:10:
   include/linux/mm.h: In function 'mkpte':
>> include/linux/mm.h:2290:42: warning: suggest parentheses around arithmetic in operand of '|' [-Wparentheses]
    2290 |         return pfn_pte(page_to_pfn(page) + off, pgprot);
   arch/nios2/include/asm/page.h:65:37: note: in definition of macro '__pte'
      65 | #define __pte(x)        ((pte_t) { (x) })
         |                                     ^
   include/linux/mm.h:2290:16: note: in expansion of macro 'pfn_pte'
    2290 |         return pfn_pte(page_to_pfn(page) + off, pgprot);
         |                ^~~~~~~
   include/linux/mm.h: In function 'folio_mkpte':
   include/linux/mm.h:2309:41: warning: suggest parentheses around arithmetic in operand of '|' [-Wparentheses]
    2309 |         return pfn_pte(folio_pfn(folio) + off, pgprot);
         |                        ~~~~~~~~~~~~~~~~~^~~~~
   arch/nios2/include/asm/page.h:65:37: note: in definition of macro '__pte'
      65 | #define __pte(x)        ((pte_t) { (x) })
         |                                     ^
   include/linux/mm.h:2309:16: note: in expansion of macro 'pfn_pte'
    2309 |         return pfn_pte(folio_pfn(folio) + off, pgprot);
         |                ^~~~~~~
   arch/nios2/mm/pgtable.c: At top level:
   arch/nios2/mm/pgtable.c:69:13: warning: no previous prototype for 'pagetable_init' [-Wmissing-prototypes]
      69 | void __init pagetable_init(void)
         |             ^~~~~~~~~~~~~~
--
   In file included from arch/nios2/include/asm/processor.h:22,
                    from include/linux/sched.h:13,
                    from arch/nios2/mm/tlb.c:13:
   include/linux/mm.h: In function 'mkpte':
>> include/linux/mm.h:2290:42: warning: suggest parentheses around arithmetic in operand of '|' [-Wparentheses]
    2290 |         return pfn_pte(page_to_pfn(page) + off, pgprot);
   arch/nios2/include/asm/page.h:65:37: note: in definition of macro '__pte'
      65 | #define __pte(x)        ((pte_t) { (x) })
         |                                     ^
   include/linux/mm.h:2290:16: note: in expansion of macro 'pfn_pte'
    2290 |         return pfn_pte(page_to_pfn(page) + off, pgprot);
         |                ^~~~~~~
   include/linux/mm.h: In function 'folio_mkpte':
   include/linux/mm.h:2309:41: warning: suggest parentheses around arithmetic in operand of '|' [-Wparentheses]
    2309 |         return pfn_pte(folio_pfn(folio) + off, pgprot);
         |                        ~~~~~~~~~~~~~~~~~^~~~~
   arch/nios2/include/asm/page.h:65:37: note: in definition of macro '__pte'
      65 | #define __pte(x)        ((pte_t) { (x) })
         |                                     ^
   include/linux/mm.h:2309:16: note: in expansion of macro 'pfn_pte'
    2309 |         return pfn_pte(folio_pfn(folio) + off, pgprot);
         |                ^~~~~~~
   arch/nios2/mm/tlb.c: At top level:
   arch/nios2/mm/tlb.c:168:6: warning: no previous prototype for 'dump_tlb_line' [-Wmissing-prototypes]
     168 | void dump_tlb_line(unsigned long line)
         |      ^~~~~~~~~~~~~
   arch/nios2/mm/tlb.c:209:6: warning: no previous prototype for 'dump_tlb' [-Wmissing-prototypes]
     209 | void dump_tlb(void)
         |      ^~~~~~~~
   arch/nios2/mm/tlb.c:217:6: warning: no previous prototype for 'flush_tlb_pid' [-Wmissing-prototypes]
     217 | void flush_tlb_pid(unsigned long mmu_pid)
         |      ^~~~~~~~~~~~~
--
   In file included from arch/nios2/include/asm/processor.h:22,
                    from include/linux/sched.h:13,
                    from arch/nios2/kernel/asm-offsets.c:8:
   include/linux/mm.h: In function 'mkpte':
>> include/linux/mm.h:2290:42: warning: suggest parentheses around arithmetic in operand of '|' [-Wparentheses]
    2290 |         return pfn_pte(page_to_pfn(page) + off, pgprot);
   arch/nios2/include/asm/page.h:65:37: note: in definition of macro '__pte'
      65 | #define __pte(x)        ((pte_t) { (x) })
         |                                     ^
   include/linux/mm.h:2290:16: note: in expansion of macro 'pfn_pte'
    2290 |         return pfn_pte(page_to_pfn(page) + off, pgprot);
         |                ^~~~~~~
   include/linux/mm.h: In function 'folio_mkpte':
   include/linux/mm.h:2309:41: warning: suggest parentheses around arithmetic in operand of '|' [-Wparentheses]
    2309 |         return pfn_pte(folio_pfn(folio) + off, pgprot);
         |                        ~~~~~~~~~~~~~~~~~^~~~~
   arch/nios2/include/asm/page.h:65:37: note: in definition of macro '__pte'
      65 | #define __pte(x)        ((pte_t) { (x) })
         |                                     ^
   include/linux/mm.h:2309:16: note: in expansion of macro 'pfn_pte'
    2309 |         return pfn_pte(folio_pfn(folio) + off, pgprot);
         |                ^~~~~~~
   In file included from arch/nios2/include/asm/processor.h:22,
                    from include/linux/sched.h:13,
                    from include/linux/percpu.h:12,
                    from include/linux/prandom.h:13,
                    from kernel/sched/sched.h:8,
                    from kernel/sched/rq-offsets.c:5:
   include/linux/mm.h: In function 'mkpte':
>> include/linux/mm.h:2290:42: warning: suggest parentheses around arithmetic in operand of '|' [-Wparentheses]
    2290 |         return pfn_pte(page_to_pfn(page) + off, pgprot);
   arch/nios2/include/asm/page.h:65:37: note: in definition of macro '__pte'
      65 | #define __pte(x)        ((pte_t) { (x) })
         |                                     ^
   include/linux/mm.h:2290:16: note: in expansion of macro 'pfn_pte'
    2290 |         return pfn_pte(page_to_pfn(page) + off, pgprot);
         |                ^~~~~~~
   include/linux/mm.h: In function 'folio_mkpte':
   include/linux/mm.h:2309:41: warning: suggest parentheses around arithmetic in operand of '|' [-Wparentheses]
    2309 |         return pfn_pte(folio_pfn(folio) + off, pgprot);
         |                        ~~~~~~~~~~~~~~~~~^~~~~
   arch/nios2/include/asm/page.h:65:37: note: in definition of macro '__pte'
      65 | #define __pte(x)        ((pte_t) { (x) })
         |                                     ^
   include/linux/mm.h:2309:16: note: in expansion of macro 'pfn_pte'
    2309 |         return pfn_pte(folio_pfn(folio) + off, pgprot);
         |                ^~~~~~~


vim +2290 include/linux/mm.h

  2283	
  2284	#ifdef CONFIG_MMU
  2285	static inline pte_t mkpte(const struct page *page, unsigned long pteoff,
  2286			pgprot_t pgprot)
  2287	{
  2288		unsigned long off = pteoff & ((1UL << (PG_SHIFT - PTE_SHIFT)) - 1);
  2289	
> 2290		return pfn_pte(page_to_pfn(page) + off, pgprot);
  2291	}
  2292	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
