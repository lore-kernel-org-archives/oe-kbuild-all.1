Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B81671E7C2E
	for <oe-kbuild-all@lists.linux.dev>; Mon, 22 Dec 2025 17:30:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766424626; cv=none; b=Qg7Kn5qFvZx5utlMhKifKTUHK3EihiOKVtgfmunWDgpoKDqSPoZuuJkOyirag+NIElteRS0tBoAiZHqVJvMtpJts4jIn0XFWQ1njFHYQa60aFZSGQRKdsy+lLHrTf7J1bQ4P2h7WEUbQy4yisgYEEueD6oQqr7iKzSWbwnKSa6k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766424626; c=relaxed/simple;
	bh=+XWq99uUTmTdvUsvsTb32D8N3doBKKUrmz0SW3Bbk8g=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=fIVt3ijJMW7xJkCfUa63bLrtW+zi1hkuemenLRKw9hGv6NoDnUjbvDnVJclNNDItXLy4G4kzr633cGf387A+rx3Ta6XHhz+Qi5UpFR8eyfY+TKqwWqUMuPmeGVh7brJ92/mcq3GT9+89p2NBoPpymKMLbk+Q9uvZ+DCjV3Qn3NE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fJ5XS8cg; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fJ5XS8cg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766424624; x=1797960624;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+XWq99uUTmTdvUsvsTb32D8N3doBKKUrmz0SW3Bbk8g=;
  b=fJ5XS8cgkz9iUbTmeiGI5qrWoM1qxUYEMh4AKw3aDAXpo6Szjh+PLTWY
   WyEtvwYL/1DNMQqOLZBxSAgZ5yJ34U0hc+OAsT/C9mFzfjQGK+ETgeXfp
   2QR2krrrvSUMYTFbsU2NF4k26YeWXBTDzv5BNmEw3gIZ3QnMZq80gA3vc
   x0A2bCsFfPj9PfdM9pN7RwBvf2YD9CIJ0OGMUJrVwjoPXFYXFYKOdz1dG
   WlP5s0SMHOoftf3OXD/wVvg0xeAjycBN1KgpuH2baHs2rQr0qLcqKU7mi
   Hg0coWzde7OZqpzvdMim5ewj1Fc3vMEl60SJu62kDePuBZnI6k9B+xqH4
   g==;
X-CSE-ConnectionGUID: hnVlLN++TpaOs5uoUB5WeA==
X-CSE-MsgGUID: 0HUbIyyJSGS3hC2LlmZC7g==
X-IronPort-AV: E=McAfee;i="6800,10657,11650"; a="70858470"
X-IronPort-AV: E=Sophos;i="6.21,168,1763452800"; 
   d="scan'208";a="70858470"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Dec 2025 09:30:24 -0800
X-CSE-ConnectionGUID: 1itHutb2RVyIinTdT+7oqw==
X-CSE-MsgGUID: mLx52Z19S4qVQmvwV6XkAA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,168,1763452800"; 
   d="scan'208";a="199562279"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by orviesa007.jf.intel.com with ESMTP; 22 Dec 2025 09:30:22 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vXjjg-000000005ZE-2sEK;
	Mon, 22 Dec 2025 17:30:20 +0000
Date: Mon, 22 Dec 2025 18:29:27 +0100
From: kernel test robot <lkp@intel.com>
To: alexs@kernel.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [alexshi:ptdesc1215 1/1] ./arch/riscv/include/asm/pgalloc.h:29:54:
 error: passing argument 1 of 'lowmem_page_address' from incompatible pointer
 type
Message-ID: <202512221858.8l7ANfJZ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/alexshi/linux.git ptdesc1215
head:   f6b3ada105829eaafc93899aabaee60344844f57
commit: f6b3ada105829eaafc93899aabaee60344844f57 [1/1] mm/pgtable: convert pgtable_t to ptdesc pointer
config: riscv-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20251222/202512221858.8l7ANfJZ-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251222/202512221858.8l7ANfJZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512221858.8l7ANfJZ-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from ./arch/riscv/include/asm/page.h:12,
                    from ./arch/riscv/include/asm/thread_info.h:11,
                    from ./include/linux/thread_info.h:60,
                    from ./include/asm-generic/preempt.h:5,
                    from ./arch/riscv/include/generated/asm/preempt.h:1,
                    from ./include/linux/preempt.h:79,
                    from ./include/linux/spinlock.h:56,
                    from ./include/linux/mmzone.h:8,
                    from ./include/linux/gfp.h:7,
                    from ./include/linux/slab.h:16,
                    from kernel/fork.c:16:
   ./arch/riscv/include/asm/pgalloc.h: In function 'pmd_populate':
>> ./arch/riscv/include/asm/pgalloc.h:29:54: error: passing argument 1 of 'lowmem_page_address' from incompatible pointer type [-Wincompatible-pointer-types]
      29 |         unsigned long pfn = virt_to_pfn(page_address(pte));
         |                                                      ^~~
         |                                                      |
         |                                                      pgtable_t {aka struct ptdesc *}
   ./include/linux/pfn.h:11:27: note: in definition of macro 'PFN_DOWN'
      11 | #define PFN_DOWN(x)     ((x) >> PAGE_SHIFT)
         |                           ^
   ./arch/riscv/include/asm/page.h:187:34: note: in expansion of macro 'phys_to_pfn'
     187 | #define virt_to_pfn(vaddr)      (phys_to_pfn(__pa(vaddr)))
         |                                  ^~~~~~~~~~~
   ./arch/riscv/include/asm/page.h:176:33: note: in expansion of macro '__va_to_pa_nodebug'
     176 | #define __virt_to_phys(x)       __va_to_pa_nodebug(x)
         |                                 ^~~~~~~~~~~~~~~~~~
   ./arch/riscv/include/asm/page.h:181:25: note: in expansion of macro '__virt_to_phys'
     181 | #define __pa(x)         __virt_to_phys((unsigned long)(x))
         |                         ^~~~~~~~~~~~~~
   ./arch/riscv/include/asm/page.h:187:46: note: in expansion of macro '__pa'
     187 | #define virt_to_pfn(vaddr)      (phys_to_pfn(__pa(vaddr)))
         |                                              ^~~~
   ./arch/riscv/include/asm/pgalloc.h:29:29: note: in expansion of macro 'virt_to_pfn'
      29 |         unsigned long pfn = virt_to_pfn(page_address(pte));
         |                             ^~~~~~~~~~~
   ./arch/riscv/include/asm/pgalloc.h:29:41: note: in expansion of macro 'page_address'
      29 |         unsigned long pfn = virt_to_pfn(page_address(pte));
         |                                         ^~~~~~~~~~~~
   In file included from ./include/linux/pagemap.h:8,
                    from ./include/linux/mempolicy.h:16,
                    from kernel/fork.c:34:
   ./include/linux/mm.h:2510:69: note: expected 'const struct page *' but argument is of type 'pgtable_t' {aka 'struct ptdesc *'}
    2510 | static __always_inline void *lowmem_page_address(const struct page *page)
         |                                                  ~~~~~~~~~~~~~~~~~~~^~~~
   ./arch/riscv/include/asm/page.h:75:24: note: 'pgtable_t' declared here
      75 | typedef struct ptdesc *pgtable_t;
         |                        ^~~~~~~~~
   In file included from ./include/linux/mmzone.h:22:
   ./arch/riscv/include/asm/pgalloc.h: In function '__pte_free_tlb':
   ./include/linux/mm_types.h:633:51: error: '_Generic' selector of type 'struct ptdesc *' is not compatible with any association
     633 | #define page_ptdesc(p)                  (_Generic((p),                  \
         |                                                   ^
   ./arch/riscv/include/asm/pgalloc.h:136:32: note: in expansion of macro 'page_ptdesc'
     136 |         tlb_remove_ptdesc(tlb, page_ptdesc(pte));
         |                                ^~~~~~~~~~~


vim +/lowmem_page_address +29 ./arch/riscv/include/asm/pgalloc.h

07037db5d479f9 Palmer Dabbelt 2017-07-10  25  
07037db5d479f9 Palmer Dabbelt 2017-07-10  26  static inline void pmd_populate(struct mm_struct *mm,
07037db5d479f9 Palmer Dabbelt 2017-07-10  27  	pmd_t *pmd, pgtable_t pte)
07037db5d479f9 Palmer Dabbelt 2017-07-10  28  {
07037db5d479f9 Palmer Dabbelt 2017-07-10 @29  	unsigned long pfn = virt_to_pfn(page_address(pte));
07037db5d479f9 Palmer Dabbelt 2017-07-10  30  
07037db5d479f9 Palmer Dabbelt 2017-07-10  31  	set_pmd(pmd, __pmd((pfn << _PAGE_PFN_SHIFT) | _PAGE_TABLE));
07037db5d479f9 Palmer Dabbelt 2017-07-10  32  }
07037db5d479f9 Palmer Dabbelt 2017-07-10  33  

:::::: The code at line 29 was first introduced by commit
:::::: 07037db5d479f90377c998259a4f9a469c404edf RISC-V: Paging and MMU

:::::: TO: Palmer Dabbelt <palmer@dabbelt.com>
:::::: CC: Palmer Dabbelt <palmer@dabbelt.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
