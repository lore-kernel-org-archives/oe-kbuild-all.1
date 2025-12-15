Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C9BF41C72
	for <oe-kbuild-all@lists.linux.dev>; Mon, 15 Dec 2025 09:05:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765789518; cv=none; b=cQwFFJF3WUbUXjJhUUX5j55Qs1IIJvHS6PJW3cyzrQUJrhagr+UfSwNSEc/1CHjkaGN7fE8pEudU06Iw4r6bck5iwpNeKTQI5xQYlBKA1WH7uqMDMsuJR8N1IVjsXjUlKSoq99/G5b2fTrm8ystirEWDkEk4wV3srEqVR9guXRI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765789518; c=relaxed/simple;
	bh=ZVFKG61buukB3+CDMosJ3TLW5v7ORAe9IfV0+nQUB1o=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=BhXFmWJvRr7qdXvP7v7VDnepZ9MWdJcagsqEAsHXj5XuvNpZVli3PrUZ5LOehv9jGPfAJ3rEqzFc0+3FBCDuRDuIdFPmyRriP6SNml2hMHffLFlQrWYKI359cH4fqnT9ilhKAEemM71RUR6tQv/V0RmGEu0H1oIEzDdjCJKA5NU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cgVsexFq; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cgVsexFq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765789516; x=1797325516;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ZVFKG61buukB3+CDMosJ3TLW5v7ORAe9IfV0+nQUB1o=;
  b=cgVsexFqe57ikloYvRHKHYDziFKFMxPJWwi7BnTdpEB4xQfcKCIuPfhI
   ExiIknZw5lA+jZu3TKEU5VFx5hx0mX2WK1T2CfTGIP/jLAaWRx+ZufMXO
   YQXbpyWQgouYsxNU5GbNx3aXX1tB1t0MoZPO09mru2MDyA8ApsKIIglsb
   xi1VPhY1DumKPppe93SIkUcLA1f6yBfvUaI+NMXIcVrhG6ifWSnL+Wnb3
   S4oFyfwzZFoHUeCfmWkEoNrYBtIoI+tVjUJB/NvxpJZhzDqDFbBtEMwvI
   wpxVQ69EdrABqM3m86FlF0GBDuqSAcDh+WduH13QfGEInkBXD0UU8T/5b
   g==;
X-CSE-ConnectionGUID: jj2OxvkgR46YVXZVlFL/EQ==
X-CSE-MsgGUID: t1ulHVqQTk+2CQNkOXGo/A==
X-IronPort-AV: E=McAfee;i="6800,10657,11635"; a="67623915"
X-IronPort-AV: E=Sophos;i="6.20,256,1758610800"; 
   d="scan'208";a="67623915"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Dec 2025 01:05:16 -0800
X-CSE-ConnectionGUID: kQGUBtTMRM2WeSzbuCUAUg==
X-CSE-MsgGUID: LCsCryNJRkSu0RT/U63RGA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,150,1763452800"; 
   d="scan'208";a="197288992"
Received: from lkp-server02.sh.intel.com (HELO 034c7e8e53c3) ([10.239.97.151])
  by fmviesa007.fm.intel.com with ESMTP; 15 Dec 2025 01:05:14 -0800
Received: from kbuild by 034c7e8e53c3 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vV4W0-0000000007B-22Kx;
	Mon, 15 Dec 2025 09:05:12 +0000
Date: Mon, 15 Dec 2025 17:04:40 +0800
From: kernel test robot <lkp@intel.com>
To: alexs@kernel.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [alexshi:ptdesc 1/1] arch/arc/include/asm/pgalloc.h:51:56: error:
 passing argument 1 of 'page_address' from incompatible pointer type
Message-ID: <202512151716.TKvPzMpi-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/alexshi/linux.git ptdesc
head:   70d5b71dd5496fcb74a973de41e3f18249c1f37f
commit: 70d5b71dd5496fcb74a973de41e3f18249c1f37f [1/1] convert pgtable_t to ptdesc pointer
config: arc-allnoconfig (https://download.01.org/0day-ci/archive/20251215/202512151716.TKvPzMpi-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251215/202512151716.TKvPzMpi-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512151716.TKvPzMpi-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/arc/include/asm/pgtable.h:11,
                    from include/linux/pgtable.h:6,
                    from include/linux/mm.h:31,
                    from include/linux/pagemap.h:8,
                    from include/linux/mempolicy.h:16,
                    from kernel/fork.c:34:
   arch/arc/include/asm/pgalloc.h: In function 'pmd_populate':
>> arch/arc/include/asm/pgalloc.h:51:56: error: passing argument 1 of 'page_address' from incompatible pointer type [-Wincompatible-pointer-types]
      51 |         set_pmd(pmd, __pmd((unsigned long)page_address(pte_page)));
         |                                                        ^~~~~~~~
         |                                                        |
         |                                                        pgtable_t {aka struct ptdesc *}
   arch/arc/include/asm/pgtable-levels.h:162:44: note: in definition of macro 'set_pmd'
     162 | #define set_pmd(pmdp, pmd)      (*(pmdp) = pmd)
         |                                            ^~~
   include/asm-generic/pgtable-nop4d.h:41:60: note: in expansion of macro '__pgd'
      41 | #define __p4d(x)                                ((p4d_t) { __pgd(x) })
         |                                                            ^~~~~
   include/asm-generic/pgtable-nopud.h:49:60: note: in expansion of macro '__p4d'
      49 | #define __pud(x)                                ((pud_t) { __p4d(x) })
         |                                                            ^~~~~
   include/asm-generic/pgtable-nopmd.h:53:60: note: in expansion of macro '__pud'
      53 | #define __pmd(x)                                ((pmd_t) { __pud(x) } )
         |                                                            ^~~~~
   arch/arc/include/asm/pgalloc.h:51:22: note: in expansion of macro '__pmd'
      51 |         set_pmd(pmd, __pmd((unsigned long)page_address(pte_page)));
         |                      ^~~~~
   include/linux/mm.h:2493:53: note: expected 'const struct page *' but argument is of type 'pgtable_t' {aka 'struct ptdesc *'}
    2493 | static inline void *page_address(const struct page *page)
         |                                  ~~~~~~~~~~~~~~~~~~~^~~~
   In file included from arch/arc/include/asm/thread_info.h:16,
                    from include/linux/thread_info.h:60,
                    from include/asm-generic/preempt.h:5,
                    from ./arch/arc/include/generated/asm/preempt.h:1,
                    from include/linux/preempt.h:79,
                    from include/linux/spinlock.h:56,
                    from include/linux/mmzone.h:8,
                    from include/linux/gfp.h:7,
                    from include/linux/slab.h:16,
                    from kernel/fork.c:16:
   arch/arc/include/asm/page.h:85:24: note: 'pgtable_t' declared here
      85 | typedef struct ptdesc *pgtable_t;
         |                        ^~~~~~~~~


vim +/page_address +51 arch/arc/include/asm/pgalloc.h

5dda4dc570ac41 Vineet Gupta 2013-01-18  48  
d9820ff76f95fa Vineet Gupta 2021-08-12  49  static inline void pmd_populate(struct mm_struct *mm, pmd_t *pmd, pgtable_t pte_page)
5dda4dc570ac41 Vineet Gupta 2013-01-18  50  {
d9820ff76f95fa Vineet Gupta 2021-08-12 @51  	set_pmd(pmd, __pmd((unsigned long)page_address(pte_page)));
5dda4dc570ac41 Vineet Gupta 2013-01-18  52  }
5dda4dc570ac41 Vineet Gupta 2013-01-18  53  

:::::: The code at line 51 was first introduced by commit
:::::: d9820ff76f95fa26d33e412254a89cd65b23142d ARC: mm: switch pgtable_t back to struct page *

:::::: TO: Vineet Gupta <vgupta@kernel.org>
:::::: CC: Vineet Gupta <vgupta@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
