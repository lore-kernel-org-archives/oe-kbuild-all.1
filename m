Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF27C158D66
	for <oe-kbuild-all@lists.linux.dev>; Wed, 24 Jul 2024 13:21:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721827285; cv=none; b=FXeXfkLmNyrx8Y9mgq9EaiAmf7oAI4o06nsJky3iLNihYaBXWqh7RWbG6v2WYiG2iPxnkEz76Uqm8hWE7xeEc/08vJWTJKKBCXFliOMhWFIAULXEoU+viHybaRNj6JoE3tOtCyjRLJOAbZbafnvNjLgfSed58HrZ+VukJTWIi+o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721827285; c=relaxed/simple;
	bh=meSbKyagrko0oStotfLvbZGhXvejl9zSye4urQRB2Pg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=VZjSYe7FLofdE8FMBB105An3/ufeag6qTPzqDqgE+8JQ2XOl2KNgmc0zja+FmjzBIcEL5vYuBAD3KwgQBSzHvnKpBrl7wG5KmAI8daYmNiSjgvuaUHraxOU2VNZGl75F+mIufuySFqD53GGgjlbEnEu6Ye+dq0U3IC/BHsKRivQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Rhg8ROaF; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Rhg8ROaF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1721827282; x=1753363282;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=meSbKyagrko0oStotfLvbZGhXvejl9zSye4urQRB2Pg=;
  b=Rhg8ROaFvYiT4KKzhJyyoiwI80dwLr/ZKqiBy6ze3ygn2x9VVVH3tLFB
   vDCEU+wN1SMUZyh7PNq8RKTIH8Tkdr6R+yr9v3mBTVN/xYLzTVZKNXmZP
   Yapu8sLgNDDZ625KMFnoqkEIKE+J3GeLDMei9Wy22SWMuOCwELt9RVgBO
   WuQsjyYc6i9YrGalN25/PFcpqRaMyM31XYAoBVBco1NVvt8ChzTI81HID
   xVb+7Bg0zru1MwQZ6YYj5fYBx80KHKPo+V+5laG5x1KRsgiSEzutEKCzl
   HG89ipVIVeoCOBwHxL4rKwuVus9kcnTM8YtHb3M76HL/TRMHcVqCqxSOf
   w==;
X-CSE-ConnectionGUID: pAL7OApaRKGiGn49tssIRw==
X-CSE-MsgGUID: sV+P10FaRkqm4Cw4kO+vDA==
X-IronPort-AV: E=McAfee;i="6700,10204,11143"; a="22411991"
X-IronPort-AV: E=Sophos;i="6.09,233,1716274800"; 
   d="scan'208";a="22411991"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jul 2024 06:21:21 -0700
X-CSE-ConnectionGUID: VgEP3+V6RfS3cZM5jKUECQ==
X-CSE-MsgGUID: ip+VO7vEQbaaWyqUbwcO6A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,233,1716274800"; 
   d="scan'208";a="52808813"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 24 Jul 2024 06:21:20 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sWbvh-000n1G-1b;
	Wed, 24 Jul 2024 13:21:17 +0000
Date: Wed, 24 Jul 2024 21:21:00 +0800
From: kernel test robot <lkp@intel.com>
To: alexs@kernel.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [alexshi:mmunstable 33/41] mm/memory.c:194:2: error: controlling
 expression type 'struct ptdesc *' not compatible with any generic
 association type
Message-ID: <202407242145.vvQWOrrl-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/alexshi/linux.git mmunstable
head:   45de53e1a6ceb1ede64b54126f9ee514f50c4e4c
commit: 887c1bf7c199edf9083e31d7959f92735d410ec9 [33/41] mm/pgtable: introduce ptdesc_pfn and use ptdesc in free_pte_range()
config: hexagon-allnoconfig (https://download.01.org/0day-ci/archive/20240724/202407242145.vvQWOrrl-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project ad154281230d83ee551e12d5be48bb956ef47ed3)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240724/202407242145.vvQWOrrl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407242145.vvQWOrrl-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from mm/memory.c:43:
   In file included from include/linux/kernel_stat.h:9:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:14:
   In file included from arch/hexagon/include/asm/io.h:328:
   include/asm-generic/io.h:548:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     548 |         val = __raw_readb(PCI_IOBASE + addr);
         |                           ~~~~~~~~~~ ^
   include/asm-generic/io.h:561:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     561 |         val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:37:51: note: expanded from macro '__le16_to_cpu'
      37 | #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
         |                                                   ^
   In file included from mm/memory.c:43:
   In file included from include/linux/kernel_stat.h:9:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:14:
   In file included from arch/hexagon/include/asm/io.h:328:
   include/asm-generic/io.h:574:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     574 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
         |                                                         ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
      35 | #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
         |                                                   ^
   In file included from mm/memory.c:43:
   In file included from include/linux/kernel_stat.h:9:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from ./arch/hexagon/include/generated/asm/hardirq.h:1:
   In file included from include/asm-generic/hardirq.h:17:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:14:
   In file included from arch/hexagon/include/asm/io.h:328:
   include/asm-generic/io.h:585:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     585 |         __raw_writeb(value, PCI_IOBASE + addr);
         |                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:595:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     595 |         __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   include/asm-generic/io.h:605:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
     605 |         __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
         |                                                       ~~~~~~~~~~ ^
   In file included from mm/memory.c:44:
   In file included from include/linux/mm.h:2221:
   include/linux/vmstat.h:514:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     514 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   In file included from mm/memory.c:45:
   include/linux/mm_inline.h:47:41: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
      47 |         __mod_lruvec_state(lruvec, NR_LRU_BASE + lru, nr_pages);
         |                                    ~~~~~~~~~~~ ^ ~~~
   include/linux/mm_inline.h:49:22: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
      49 |                                 NR_ZONE_LRU_BASE + lru, nr_pages);
         |                                 ~~~~~~~~~~~~~~~~ ^ ~~~
>> mm/memory.c:194:2: error: controlling expression type 'struct ptdesc *' not compatible with any generic association type
     194 |         pte_free_tlb(tlb, token, addr);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/tlb.h:706:3: note: expanded from macro 'pte_free_tlb'
     706 |                 __pte_free_tlb(tlb, ptep, address);             \
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/hexagon/include/asm/pgalloc.h:92:22: note: expanded from macro '__pte_free_tlb'
      92 |         pagetable_pte_dtor((page_ptdesc(pte)));                 \
         |                             ^~~~~~~~~~~~~~~~
   include/linux/mm_types.h:510:36: note: expanded from macro 'page_ptdesc'
     510 | #define page_ptdesc(p)                  (_Generic((p),                  \
         |                                                   ^~~
>> mm/memory.c:194:2: error: controlling expression type 'struct ptdesc *' not compatible with any generic association type
     194 |         pte_free_tlb(tlb, token, addr);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/tlb.h:706:3: note: expanded from macro 'pte_free_tlb'
     706 |                 __pte_free_tlb(tlb, ptep, address);             \
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/hexagon/include/asm/pgalloc.h:93:33: note: expanded from macro '__pte_free_tlb'
      93 |         tlb_remove_page_ptdesc((tlb), (page_ptdesc(pte)));      \
         |                                        ^~~~~~~~~~~~~~~~
   include/linux/mm_types.h:510:36: note: expanded from macro 'page_ptdesc'
     510 | #define page_ptdesc(p)                  (_Generic((p),                  \
         |                                                   ^~~
   9 warnings and 2 errors generated.


vim +194 mm/memory.c

d559db086ff5be KAMEZAWA Hiroyuki      2010-03-05  184  
^1da177e4c3f41 Linus Torvalds         2005-04-16  185  /*
^1da177e4c3f41 Linus Torvalds         2005-04-16  186   * Note: this doesn't free the actual pages themselves. That
^1da177e4c3f41 Linus Torvalds         2005-04-16  187   * has been handled earlier when unmapping all the memory regions.
^1da177e4c3f41 Linus Torvalds         2005-04-16  188   */
9e1b32caa525cb Benjamin Herrenschmidt 2009-07-22  189  static void free_pte_range(struct mmu_gather *tlb, pmd_t *pmd,
9e1b32caa525cb Benjamin Herrenschmidt 2009-07-22  190  			   unsigned long addr)
^1da177e4c3f41 Linus Torvalds         2005-04-16  191  {
887c1bf7c199ed Alex Shi               2024-07-22  192  	struct ptdesc *token = page_ptdesc(pmd_pgtable(*pmd));
^1da177e4c3f41 Linus Torvalds         2005-04-16  193  	pmd_clear(pmd);
9e1b32caa525cb Benjamin Herrenschmidt 2009-07-22 @194  	pte_free_tlb(tlb, token, addr);
c4812909f5d5a9 Kirill A. Shutemov     2017-11-15  195  	mm_dec_nr_ptes(tlb->mm);
^1da177e4c3f41 Linus Torvalds         2005-04-16  196  }
^1da177e4c3f41 Linus Torvalds         2005-04-16  197  

:::::: The code at line 194 was first introduced by commit
:::::: 9e1b32caa525cb236e80e9c671e179bcecccc657 mm: Pass virtual address to [__]p{te,ud,md}_free_tlb()

:::::: TO: Benjamin Herrenschmidt <benh@kernel.crashing.org>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
