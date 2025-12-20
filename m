Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CDB921FF25
	for <oe-kbuild-all@lists.linux.dev>; Sat, 20 Dec 2025 14:46:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766241975; cv=none; b=SNZ7QIQWNi6Kow0tPCwLyXYcnZ4nZ/+a6S6OmycvDxbci0Mly9yBIHxQIYE5bTMwPmKFi/YKvgQ1lj5iAcungnIOlN/xfRtF66eE30M5Xc+qM4uS6nq0+z0Jhh98y9HAe47K256s5xTAtuT0lf924RzfB7vm6/xDpxOMKXmaaQA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766241975; c=relaxed/simple;
	bh=3W/tb82EwF8AA85SO6Qs+AaxviexoIdxkzRVVxBXdG4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=CjvGU2Kc/j3BTWRhgkjv5H6vyQgOUa0avU1Q1jRL3UPsktYB3JVBxE2WSyr6S0uQwi5hEwpHMpdW7vGO4eKM8OnSDF0wAlJENQqKDzpoWuE4XZioCLm038Q5qE9tUxy+ILTJhdZS7xIowP5omFjheGNfB0viBmMirydIlyf9Qfw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Cbafusk2; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Cbafusk2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766241974; x=1797777974;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3W/tb82EwF8AA85SO6Qs+AaxviexoIdxkzRVVxBXdG4=;
  b=Cbafusk2gRnbYyaR+S3G+m0l88u8DCNKPjubPYXFlL8Y6NKvMxLUzFa7
   QNBAPivwTwONdpZutHh0g3IDbPvytyDJ1okNJ/2l1WbdoZF2TjURHgKKL
   eUQbmQ+0XsKdB9l5XeNJpuQ7qDnTK9mzaJ6KrurY7gz4caupk//6vWHXY
   22Zvb5ydL9f45yHijMEhkVRYg/gOv6dMcs0TVk6Dxc9/2MX3+TB6Nxdje
   Z/XGCJ3Ep9r3/y3JLLeq9u7Z0XnQ3B/cASYN9hcz2MwiyUO2GwNx94nOf
   taiF/kE8AtiFjQ8NyDBImaV4lc4Tw7c74uPuJLT54UdWNmCNoUjvqS09n
   Q==;
X-CSE-ConnectionGUID: pLKM5mtHRzmlM4W3LqgKdQ==
X-CSE-MsgGUID: oc3UjxXbQeSKSKN7RhdV1Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11648"; a="79294952"
X-IronPort-AV: E=Sophos;i="6.21,164,1763452800"; 
   d="scan'208";a="79294952"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Dec 2025 06:46:11 -0800
X-CSE-ConnectionGUID: exXWJ+hgTcGFff/v1jwqeA==
X-CSE-MsgGUID: da22qwOCQiefJHthkR8uRQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,164,1763452800"; 
   d="scan'208";a="199986989"
Received: from lkp-server01.sh.intel.com (HELO 0d09efa1b85f) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 20 Dec 2025 06:46:09 -0800
Received: from kbuild by 0d09efa1b85f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vWyDf-000000004fz-1qgW;
	Sat, 20 Dec 2025 14:46:07 +0000
Date: Sat, 20 Dec 2025 22:45:57 +0800
From: kernel test robot <lkp@intel.com>
To: alexs@kernel.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [alexshi:ptdesc1216 1/1] arch/mips/include/asm/pgalloc.h:29:49:
 error: incompatible pointer types passing 'pgtable_t' (aka 'struct ptdesc
 *') to parameter of type 'const struct page *'
Message-ID: <202512202257.tMzlj3RP-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/alexshi/linux.git ptdesc1216
head:   d02e2979ce67b963aaf8bdb8ec12e4dc8b294af8
commit: d02e2979ce67b963aaf8bdb8ec12e4dc8b294af8 [1/1] mm/pgtable: convert pgtable_t to ptdesc pointer
config: mips-rb532_defconfig (https://download.01.org/0day-ci/archive/20251220/202512202257.tMzlj3RP-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251220/202512202257.tMzlj3RP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512202257.tMzlj3RP-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from kernel/fork.c:109:
   In file included from include/linux/pgalloc.h:6:
>> arch/mips/include/asm/pgalloc.h:29:49: error: incompatible pointer types passing 'pgtable_t' (aka 'struct ptdesc *') to parameter of type 'const struct page *' [-Werror,-Wincompatible-pointer-types]
      29 |         set_pmd(pmd, __pmd((unsigned long)page_address(pte)));
         |                                                        ^~~
   include/linux/mm.h:2516:48: note: expanded from macro 'page_address'
    2516 | #define page_address(page) lowmem_page_address(page)
         |                                                ^~~~
   include/asm-generic/pgtable-nopmd.h:53:38: note: expanded from macro '__pmd'
      53 | #define __pmd(x)                                ((pmd_t) { __pud(x) } )
         |                                                                  ^
   include/asm-generic/pgtable-nopud.h:49:38: note: expanded from macro '__pud'
      49 | #define __pud(x)                                ((pud_t) { __p4d(x) })
         |                                                                  ^
   include/asm-generic/pgtable-nop4d.h:41:38: note: expanded from macro '__p4d'
      41 | #define __p4d(x)                                ((p4d_t) { __pgd(x) })
         |                                                                  ^
   arch/mips/include/asm/page.h:130:30: note: expanded from macro '__pgd'
     130 | #define __pgd(x)        ((pgd_t) { (x) } )
         |                                     ^
   arch/mips/include/asm/pgtable.h:236:51: note: expanded from macro 'set_pmd'
     236 | #define set_pmd(pmdptr, pmdval) do { *(pmdptr) = (pmdval); } while(0)
         |                                                   ^~~~~~
   include/linux/mm.h:2510:69: note: passing argument to parameter 'page' here
    2510 | static __always_inline void *lowmem_page_address(const struct page *page)
         |                                                                     ^
   1 error generated.
--
   In file included from mm/memory.c:79:
   In file included from include/linux/pgalloc.h:6:
>> arch/mips/include/asm/pgalloc.h:29:49: error: incompatible pointer types passing 'pgtable_t' (aka 'struct ptdesc *') to parameter of type 'const struct page *' [-Werror,-Wincompatible-pointer-types]
      29 |         set_pmd(pmd, __pmd((unsigned long)page_address(pte)));
         |                                                        ^~~
   include/linux/mm.h:2516:48: note: expanded from macro 'page_address'
    2516 | #define page_address(page) lowmem_page_address(page)
         |                                                ^~~~
   include/asm-generic/pgtable-nopmd.h:53:38: note: expanded from macro '__pmd'
      53 | #define __pmd(x)                                ((pmd_t) { __pud(x) } )
         |                                                                  ^
   include/asm-generic/pgtable-nopud.h:49:38: note: expanded from macro '__pud'
      49 | #define __pud(x)                                ((pud_t) { __p4d(x) })
         |                                                                  ^
   include/asm-generic/pgtable-nop4d.h:41:38: note: expanded from macro '__p4d'
      41 | #define __p4d(x)                                ((p4d_t) { __pgd(x) })
         |                                                                  ^
   arch/mips/include/asm/page.h:130:30: note: expanded from macro '__pgd'
     130 | #define __pgd(x)        ((pgd_t) { (x) } )
         |                                     ^
   arch/mips/include/asm/pgtable.h:236:51: note: expanded from macro 'set_pmd'
     236 | #define set_pmd(pmdptr, pmdval) do { *(pmdptr) = (pmdval); } while(0)
         |                                                   ^~~~~~
   include/linux/mm.h:2510:69: note: passing argument to parameter 'page' here
    2510 | static __always_inline void *lowmem_page_address(const struct page *page)
         |                                                                     ^
   mm/memory.c:194:2: error: controlling expression type 'pgtable_t' (aka 'struct ptdesc *') not compatible with any generic association type
     194 |         pte_free_tlb(tlb, token, addr);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/tlb.h:731:3: note: expanded from macro 'pte_free_tlb'
     731 |                 __pte_free_tlb(tlb, ptep, address);             \
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/mips/include/asm/pgalloc.h:52:27: note: expanded from macro '__pte_free_tlb'
      52 |         tlb_remove_ptdesc((tlb), page_ptdesc(pte))
         |                                  ^~~~~~~~~~~~~~~~
   include/linux/mm_types.h:633:36: note: expanded from macro 'page_ptdesc'
     633 | #define page_ptdesc(p)                  (_Generic((p),                  \
         |                                                   ^~~
   2 errors generated.


vim +29 arch/mips/include/asm/pgalloc.h

^1da177e4c3f41 include/asm-mips/pgalloc.h Linus Torvalds     2005-04-16  25  
^1da177e4c3f41 include/asm-mips/pgalloc.h Linus Torvalds     2005-04-16  26  static inline void pmd_populate(struct mm_struct *mm, pmd_t *pmd,
2f569afd9ced9e include/asm-mips/pgalloc.h Martin Schwidefsky 2008-02-08  27  	pgtable_t pte)
^1da177e4c3f41 include/asm-mips/pgalloc.h Linus Torvalds     2005-04-16  28  {
^1da177e4c3f41 include/asm-mips/pgalloc.h Linus Torvalds     2005-04-16 @29  	set_pmd(pmd, __pmd((unsigned long)page_address(pte)));
^1da177e4c3f41 include/asm-mips/pgalloc.h Linus Torvalds     2005-04-16  30  }
^1da177e4c3f41 include/asm-mips/pgalloc.h Linus Torvalds     2005-04-16  31  

:::::: The code at line 29 was first introduced by commit
:::::: 1da177e4c3f41524e886b7f1b8a0c1fc7321cac2 Linux-2.6.12-rc2

:::::: TO: Linus Torvalds <torvalds@ppc970.osdl.org>
:::::: CC: Linus Torvalds <torvalds@ppc970.osdl.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
