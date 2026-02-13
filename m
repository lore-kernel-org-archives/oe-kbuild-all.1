Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C46CF3164BA
	for <oe-kbuild-all@lists.linux.dev>; Fri, 13 Feb 2026 12:06:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770984392; cv=none; b=CMUQS+Bq88d2Tfh1z9CqneGdB8DxalX59skRgjXFfmIiqXB/FCHvub5UchADZSFF33S6hvr0GNP+6RaBIYKvGsRAFp8BfnESr2/C9lSZg08jfj+KCttNYoRRmxfgadrbLZrLkCqUDfjKkab4F5l4OCZjFij5Fhb6VmNw9Qw9qPQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770984392; c=relaxed/simple;
	bh=mwThUoHokliXqRnOmf+WvaMyMZkfFBE6I7KdtwfwE1A=;
	h=Date:From:To:Cc:Subject:Message-ID; b=uWoMmO2zxjaVAaPR8MGcAaeiSK2WwplwF2nvv+RPY5qBQ+m9PxnzSYlnFsL+YWw6ajNnE+I8vjsW2dredXgY7SPbMgiQkISlSyqah9SKXGJZ/BqpX8kgdGv8pY+XE8gVYrjhTPJrNB/8UDvUPNHjzaZx9QiecyrsbVZZ85ofJ6w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BWqqXfMU; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BWqqXfMU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770984391; x=1802520391;
  h=date:from:to:cc:subject:message-id;
  bh=mwThUoHokliXqRnOmf+WvaMyMZkfFBE6I7KdtwfwE1A=;
  b=BWqqXfMUcD2LT703pCBbT51MJPH/VJJJ6vy9qWEqkntLFaro/05DarXN
   esKMkWH8gnamdZWO7XaNQzcQM9B9FoBT2fUFtyeBXtKHs0W0jmzgXBANd
   nL2AdyhVfuUJlST/ykBrr0GL59yPE0SfwUt3dWlGzWViomP0FMljG59Sm
   zVktMkfty9/Y/qfHAoYXmMc8M47tNL4FjLUolmYURmAH0YG/TBQIeIV0H
   TDDVJ1MN7DMkGMBrJKw60mRKBQtFaw//6MID8dBUKxqF3aOh/LJbukgIJ
   FPfg4ZDhc2aPWRe5craGL3zbfhbnKpxB9IhsFu+VblXRfTOWNfWLzYrYx
   g==;
X-CSE-ConnectionGUID: 7fn7wLp0RQGq6eJsyVWq7Q==
X-CSE-MsgGUID: /CYrixH9S06z/Z8r/Y5/Iw==
X-IronPort-AV: E=McAfee;i="6800,10657,11699"; a="71193577"
X-IronPort-AV: E=Sophos;i="6.21,288,1763452800"; 
   d="scan'208";a="71193577"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Feb 2026 04:06:28 -0800
X-CSE-ConnectionGUID: GSFE9geDSFWi01TbGARnKw==
X-CSE-MsgGUID: gNxAwMnhSyCHubmTw2BJ1A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,288,1763452800"; 
   d="scan'208";a="211614503"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 13 Feb 2026 04:06:26 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vqrwG-00000000vLs-1x2U;
	Fri, 13 Feb 2026 12:06:24 +0000
Date: Fri, 13 Feb 2026 20:06:09 +0800
From: kernel test robot <lkp@intel.com>
To: Kiryl Shutsemau <kas@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [kas:pte_size 14/16]
 include/asm-generic/memory_model.h:62:23: error: expected '=', ',', ';',
 'asm' or '__attribute__' before '__ret'
Message-ID: <202602132017.Ac6QZFTU-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Kiryl,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/kas/linux.git pte_size
head:   f562d70c53ccc0213b4afbf20fc312d85f9972bb
commit: 2821e424a84cabe5f937347a2f1d6f6d69e995d3 [14/16] treewide: The rest of the owl
config: sh-allnoconfig (https://download.01.org/0day-ci/archive/20260213/202602132017.Ac6QZFTU-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260213/202602132017.Ac6QZFTU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602132017.Ac6QZFTU-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/sh/include/asm/thread_info.h:13,
                    from include/linux/thread_info.h:60,
                    from include/asm-generic/preempt.h:5,
                    from ./arch/sh/include/generated/asm/preempt.h:1,
                    from include/linux/preempt.h:79,
                    from include/linux/spinlock.h:56,
                    from include/linux/mmzone.h:8,
                    from include/linux/gfp.h:7,
                    from include/linux/mm.h:7,
                    from arch/sh/kernel/asm-offsets.c:14:
   arch/sh/include/asm/page.h:13:9: warning: 'PTE_MASK' redefined
      13 | #define PTE_MASK        PAGE_MASK
         |         ^~~~~~~~
   In file included from arch/sh/include/asm/page.h:11:
   include/vdso/page.h:26:9: note: this is the location of the previous definition
      26 | #define PTE_MASK        (~((1 << CONFIG_PTE_SHIFT) - 1))
         |         ^~~~~~~~
   In file included from arch/sh/include/asm/pgtable.h:15,
                    from include/linux/pgtable.h:6,
                    from include/linux/mm.h:31:
   arch/sh/include/asm/pgtable-2level.h:15:9: warning: 'PTE_SHIFT' redefined
      15 | #define PTE_SHIFT               PAGE_SHIFT
         |         ^~~~~~~~~
   include/vdso/page.h:13:9: note: this is the location of the previous definition
      13 | #define PTE_SHIFT      CONFIG_PTE_SHIFT
         |         ^~~~~~~~~
   In file included from arch/sh/include/asm/page.h:160:
   include/linux/mm.h: In function 'folio_pfn':
>> include/asm-generic/memory_model.h:62:23: error: expected '=', ',', ';', 'asm' or '__attribute__' before '__ret'
      62 |         unsigned logn __ret;                                            \
         |                       ^~~~~
   include/asm-generic/memory_model.h:81:21: note: in expansion of macro '__page_to_pfn'
      81 | #define page_to_pfn __page_to_pfn
         |                     ^~~~~~~~~~~~~
   include/linux/mm.h:1789:16: note: in expansion of macro 'page_to_pfn'
    1789 |         return page_to_pfn(&folio->page);
         |                ^~~~~~~~~~~
>> include/asm-generic/memory_model.h:62:23: error: '__ret' undeclared (first use in this function)
      62 |         unsigned logn __ret;                                            \
         |                       ^~~~~
   include/asm-generic/memory_model.h:81:21: note: in expansion of macro '__page_to_pfn'
      81 | #define page_to_pfn __page_to_pfn
         |                     ^~~~~~~~~~~~~
   include/linux/mm.h:1789:16: note: in expansion of macro 'page_to_pfn'
    1789 |         return page_to_pfn(&folio->page);
         |                ^~~~~~~~~~~
   include/asm-generic/memory_model.h:62:23: note: each undeclared identifier is reported only once for each function it appears in
      62 |         unsigned logn __ret;                                            \
         |                       ^~~~~
   include/asm-generic/memory_model.h:81:21: note: in expansion of macro '__page_to_pfn'
      81 | #define page_to_pfn __page_to_pfn
         |                     ^~~~~~~~~~~~~
   include/linux/mm.h:1789:16: note: in expansion of macro 'page_to_pfn'
    1789 |         return page_to_pfn(&folio->page);
         |                ^~~~~~~~~~~
>> include/asm-generic/memory_model.h:66:1: error: expected ';' before '}' token
      66 | })
         | ^
   include/asm-generic/memory_model.h:81:21: note: in expansion of macro '__page_to_pfn'
      81 | #define page_to_pfn __page_to_pfn
         |                     ^~~~~~~~~~~~~
   include/linux/mm.h:1789:16: note: in expansion of macro 'page_to_pfn'
    1789 |         return page_to_pfn(&folio->page);
         |                ^~~~~~~~~~~
   include/linux/mm.h: In function 'is_zero_page':
>> include/asm-generic/memory_model.h:62:23: error: expected '=', ',', ';', 'asm' or '__attribute__' before '__ret'
      62 |         unsigned logn __ret;                                            \
         |                       ^~~~~
   include/asm-generic/memory_model.h:81:21: note: in expansion of macro '__page_to_pfn'
      81 | #define page_to_pfn __page_to_pfn
         |                     ^~~~~~~~~~~~~
   include/linux/mm.h:1948:28: note: in expansion of macro 'page_to_pfn'
    1948 |         return is_zero_pfn(page_to_pfn(page));
         |                            ^~~~~~~~~~~
>> include/asm-generic/memory_model.h:62:23: error: '__ret' undeclared (first use in this function)
      62 |         unsigned logn __ret;                                            \
         |                       ^~~~~
   include/asm-generic/memory_model.h:81:21: note: in expansion of macro '__page_to_pfn'
      81 | #define page_to_pfn __page_to_pfn
         |                     ^~~~~~~~~~~~~
   include/linux/mm.h:1948:28: note: in expansion of macro 'page_to_pfn'
    1948 |         return is_zero_pfn(page_to_pfn(page));
         |                            ^~~~~~~~~~~
>> include/asm-generic/memory_model.h:66:1: error: expected ';' before '}' token
      66 | })
         | ^
   include/asm-generic/memory_model.h:81:21: note: in expansion of macro '__page_to_pfn'
      81 | #define page_to_pfn __page_to_pfn
         |                     ^~~~~~~~~~~~~
   include/linux/mm.h:1948:28: note: in expansion of macro 'page_to_pfn'
    1948 |         return is_zero_pfn(page_to_pfn(page));
         |                            ^~~~~~~~~~~
   include/linux/mm.h: In function 'folio_next':
>> include/asm-generic/memory_model.h:62:23: error: expected '=', ',', ';', 'asm' or '__attribute__' before '__ret'
      62 |         unsigned logn __ret;                                            \
         |                       ^~~~~
   include/asm-generic/memory_model.h:69:32: note: in definition of macro '__pfn_to_page'
      69 | ({      unsigned long __pfn = (pfn);                                    \
         |                                ^~~
   include/asm-generic/memory_model.h:81:21: note: in expansion of macro '__page_to_pfn'
      81 | #define page_to_pfn __page_to_pfn
         |                     ^~~~~~~~~~~~~
   include/linux/mm.h:201:38: note: in expansion of macro 'page_to_pfn'
     201 | #define nth_page(page,n) pfn_to_page(page_to_pfn((page)) + (n))
         |                                      ^~~~~~~~~~~
   include/linux/page-flags.h:319:33: note: in expansion of macro 'nth_page'
     319 | #define folio_page(folio, n)    nth_page(&(folio)->page, n)
         |                                 ^~~~~~~~
   include/linux/mm.h:2070:32: note: in expansion of macro 'folio_page'
    2070 |         return (struct folio *)folio_page(folio, folio_nr_pages(folio));
         |                                ^~~~~~~~~~
>> include/asm-generic/memory_model.h:62:23: error: '__ret' undeclared (first use in this function)
      62 |         unsigned logn __ret;                                            \
         |                       ^~~~~
   include/asm-generic/memory_model.h:69:32: note: in definition of macro '__pfn_to_page'
      69 | ({      unsigned long __pfn = (pfn);                                    \
         |                                ^~~
   include/asm-generic/memory_model.h:81:21: note: in expansion of macro '__page_to_pfn'
      81 | #define page_to_pfn __page_to_pfn
         |                     ^~~~~~~~~~~~~
   include/linux/mm.h:201:38: note: in expansion of macro 'page_to_pfn'
     201 | #define nth_page(page,n) pfn_to_page(page_to_pfn((page)) + (n))
         |                                      ^~~~~~~~~~~
   include/linux/page-flags.h:319:33: note: in expansion of macro 'nth_page'
     319 | #define folio_page(folio, n)    nth_page(&(folio)->page, n)
         |                                 ^~~~~~~~
   include/linux/mm.h:2070:32: note: in expansion of macro 'folio_page'
    2070 |         return (struct folio *)folio_page(folio, folio_nr_pages(folio));
         |                                ^~~~~~~~~~
>> include/asm-generic/memory_model.h:66:1: error: expected ';' before '}' token
      66 | })
         | ^
   include/asm-generic/memory_model.h:69:32: note: in definition of macro '__pfn_to_page'
      69 | ({      unsigned long __pfn = (pfn);                                    \
         |                                ^~~
   include/asm-generic/memory_model.h:81:21: note: in expansion of macro '__page_to_pfn'
      81 | #define page_to_pfn __page_to_pfn
         |                     ^~~~~~~~~~~~~
   include/linux/mm.h:201:38: note: in expansion of macro 'page_to_pfn'
     201 | #define nth_page(page,n) pfn_to_page(page_to_pfn((page)) + (n))
         |                                      ^~~~~~~~~~~
   include/linux/page-flags.h:319:33: note: in expansion of macro 'nth_page'
     319 | #define folio_page(folio, n)    nth_page(&(folio)->page, n)
         |                                 ^~~~~~~~
   include/linux/mm.h:2070:32: note: in expansion of macro 'folio_page'
    2070 |         return (struct folio *)folio_page(folio, folio_nr_pages(folio));
         |                                ^~~~~~~~~~
   include/linux/mm.h: In function 'lowmem_page_address':
>> include/asm-generic/memory_model.h:62:23: error: expected '=', ',', ';', 'asm' or '__attribute__' before '__ret'
      62 |         unsigned logn __ret;                                            \
         |                       ^~~~~
   arch/sh/include/asm/page.h:126:27: note: in definition of macro '___va'
     126 | #define ___va(x)        ((x)+PAGE_OFFSET)
         |                           ^
   include/linux/mm.h:105:25: note: in expansion of macro '__va'
     105 | #define page_to_virt(x) __va(PFN_PHYS(page_to_pfn(x)))
         |                         ^~~~
   include/linux/mm.h:105:30: note: in expansion of macro 'PFN_PHYS'
     105 | #define page_to_virt(x) __va(PFN_PHYS(page_to_pfn(x)))
         |                              ^~~~~~~~
   include/asm-generic/memory_model.h:81:21: note: in expansion of macro '__page_to_pfn'
      81 | #define page_to_pfn __page_to_pfn
         |                     ^~~~~~~~~~~~~
   include/linux/mm.h:105:39: note: in expansion of macro 'page_to_pfn'
     105 | #define page_to_virt(x) __va(PFN_PHYS(page_to_pfn(x)))
         |                                       ^~~~~~~~~~~
   include/linux/mm.h:2258:16: note: in expansion of macro 'page_to_virt'
    2258 |         return page_to_virt(page);
         |                ^~~~~~~~~~~~
>> include/asm-generic/memory_model.h:62:23: error: '__ret' undeclared (first use in this function)
      62 |         unsigned logn __ret;                                            \
         |                       ^~~~~
   arch/sh/include/asm/page.h:126:27: note: in definition of macro '___va'
     126 | #define ___va(x)        ((x)+PAGE_OFFSET)
         |                           ^
   include/linux/mm.h:105:25: note: in expansion of macro '__va'
     105 | #define page_to_virt(x) __va(PFN_PHYS(page_to_pfn(x)))
         |                         ^~~~
   include/linux/mm.h:105:30: note: in expansion of macro 'PFN_PHYS'
     105 | #define page_to_virt(x) __va(PFN_PHYS(page_to_pfn(x)))
         |                              ^~~~~~~~
   include/asm-generic/memory_model.h:81:21: note: in expansion of macro '__page_to_pfn'
      81 | #define page_to_pfn __page_to_pfn
         |                     ^~~~~~~~~~~~~
   include/linux/mm.h:105:39: note: in expansion of macro 'page_to_pfn'
     105 | #define page_to_virt(x) __va(PFN_PHYS(page_to_pfn(x)))
         |                                       ^~~~~~~~~~~
   include/linux/mm.h:2258:16: note: in expansion of macro 'page_to_virt'
    2258 |         return page_to_virt(page);
         |                ^~~~~~~~~~~~
>> include/asm-generic/memory_model.h:66:1: error: expected ';' before '}' token
      66 | })
         | ^
   arch/sh/include/asm/page.h:126:27: note: in definition of macro '___va'
     126 | #define ___va(x)        ((x)+PAGE_OFFSET)
         |                           ^
   include/linux/mm.h:105:25: note: in expansion of macro '__va'
     105 | #define page_to_virt(x) __va(PFN_PHYS(page_to_pfn(x)))
         |                         ^~~~
   include/linux/mm.h:105:30: note: in expansion of macro 'PFN_PHYS'
     105 | #define page_to_virt(x) __va(PFN_PHYS(page_to_pfn(x)))
         |                              ^~~~~~~~
   include/asm-generic/memory_model.h:81:21: note: in expansion of macro '__page_to_pfn'
      81 | #define page_to_pfn __page_to_pfn
         |                     ^~~~~~~~~~~~~
   include/linux/mm.h:105:39: note: in expansion of macro 'page_to_pfn'
     105 | #define page_to_virt(x) __va(PFN_PHYS(page_to_pfn(x)))
         |                                       ^~~~~~~~~~~
   include/linux/mm.h:2258:16: note: in expansion of macro 'page_to_virt'
    2258 |         return page_to_virt(page);
         |                ^~~~~~~~~~~~
   include/linux/mm.h: In function 'ptdesc_to_virt':
>> include/asm-generic/memory_model.h:62:23: error: expected '=', ',', ';', 'asm' or '__attribute__' before '__ret'
      62 |         unsigned logn __ret;                                            \
         |                       ^~~~~
   arch/sh/include/asm/page.h:126:27: note: in definition of macro '___va'
     126 | #define ___va(x)        ((x)+PAGE_OFFSET)
         |                           ^
   include/linux/mm.h:105:25: note: in expansion of macro '__va'
     105 | #define page_to_virt(x) __va(PFN_PHYS(page_to_pfn(x)))
         |                         ^~~~
   include/linux/mm.h:105:30: note: in expansion of macro 'PFN_PHYS'
     105 | #define page_to_virt(x) __va(PFN_PHYS(page_to_pfn(x)))
         |                              ^~~~~~~~
   include/asm-generic/memory_model.h:81:21: note: in expansion of macro '__page_to_pfn'
      81 | #define page_to_pfn __page_to_pfn
         |                     ^~~~~~~~~~~~~
   include/linux/mm.h:105:39: note: in expansion of macro 'page_to_pfn'
     105 | #define page_to_virt(x) __va(PFN_PHYS(page_to_pfn(x)))
         |                                       ^~~~~~~~~~~
   include/linux/mm.h:2884:16: note: in expansion of macro 'page_to_virt'
    2884 |         return page_to_virt(ptdesc_page(pt));
         |                ^~~~~~~~~~~~
>> include/asm-generic/memory_model.h:62:23: error: '__ret' undeclared (first use in this function)
      62 |         unsigned logn __ret;                                            \
         |                       ^~~~~
   arch/sh/include/asm/page.h:126:27: note: in definition of macro '___va'
     126 | #define ___va(x)        ((x)+PAGE_OFFSET)
         |                           ^
   include/linux/mm.h:105:25: note: in expansion of macro '__va'
     105 | #define page_to_virt(x) __va(PFN_PHYS(page_to_pfn(x)))
         |                         ^~~~
   include/linux/mm.h:105:30: note: in expansion of macro 'PFN_PHYS'
     105 | #define page_to_virt(x) __va(PFN_PHYS(page_to_pfn(x)))
         |                              ^~~~~~~~
   include/asm-generic/memory_model.h:81:21: note: in expansion of macro '__page_to_pfn'
      81 | #define page_to_pfn __page_to_pfn
         |                     ^~~~~~~~~~~~~
   include/linux/mm.h:105:39: note: in expansion of macro 'page_to_pfn'
     105 | #define page_to_virt(x) __va(PFN_PHYS(page_to_pfn(x)))
         |                                       ^~~~~~~~~~~
   include/linux/mm.h:2884:16: note: in expansion of macro 'page_to_virt'
    2884 |         return page_to_virt(ptdesc_page(pt));
         |                ^~~~~~~~~~~~
>> include/asm-generic/memory_model.h:66:1: error: expected ';' before '}' token
      66 | })
         | ^
   arch/sh/include/asm/page.h:126:27: note: in definition of macro '___va'
     126 | #define ___va(x)        ((x)+PAGE_OFFSET)
         |                           ^
   include/linux/mm.h:105:25: note: in expansion of macro '__va'
     105 | #define page_to_virt(x) __va(PFN_PHYS(page_to_pfn(x)))
         |                         ^~~~
   include/linux/mm.h:105:30: note: in expansion of macro 'PFN_PHYS'
     105 | #define page_to_virt(x) __va(PFN_PHYS(page_to_pfn(x)))
         |                              ^~~~~~~~
   include/asm-generic/memory_model.h:81:21: note: in expansion of macro '__page_to_pfn'
      81 | #define page_to_pfn __page_to_pfn
         |                     ^~~~~~~~~~~~~
   include/linux/mm.h:105:39: note: in expansion of macro 'page_to_pfn'
     105 | #define page_to_virt(x) __va(PFN_PHYS(page_to_pfn(x)))
         |                                       ^~~~~~~~~~~
   include/linux/mm.h:2884:16: note: in expansion of macro 'page_to_virt'
    2884 |         return page_to_virt(ptdesc_page(pt));
         |                ^~~~~~~~~~~~
   include/linux/bvec.h: In function 'bvec_set_folio':
>> include/asm-generic/memory_model.h:62:23: error: expected '=', ',', ';', 'asm' or '__attribute__' before '__ret'
      62 |         unsigned logn __ret;                                            \
         |                       ^~~~~
   include/asm-generic/memory_model.h:69:32: note: in definition of macro '__pfn_to_page'
      69 | ({      unsigned long __pfn = (pfn);                                    \
         |                                ^~~
   include/asm-generic/memory_model.h:81:21: note: in expansion of macro '__page_to_pfn'
      81 | #define page_to_pfn __page_to_pfn
         |                     ^~~~~~~~~~~~~
   include/linux/mm.h:201:38: note: in expansion of macro 'page_to_pfn'
     201 | #define nth_page(page,n) pfn_to_page(page_to_pfn((page)) + (n))
         |                                      ^~~~~~~~~~~
   include/linux/page-flags.h:319:33: note: in expansion of macro 'nth_page'
     319 | #define folio_page(folio, n)    nth_page(&(folio)->page, n)
         |                                 ^~~~~~~~
   include/linux/bvec.h:65:27: note: in expansion of macro 'folio_page'
      65 |         bvec_set_page(bv, folio_page(folio, nr), len, offset % PG_SIZE);
         |                           ^~~~~~~~~~
>> include/asm-generic/memory_model.h:62:23: error: '__ret' undeclared (first use in this function)
      62 |         unsigned logn __ret;                                            \
         |                       ^~~~~
   include/asm-generic/memory_model.h:69:32: note: in definition of macro '__pfn_to_page'
      69 | ({      unsigned long __pfn = (pfn);                                    \
         |                                ^~~
   include/asm-generic/memory_model.h:81:21: note: in expansion of macro '__page_to_pfn'
      81 | #define page_to_pfn __page_to_pfn
         |                     ^~~~~~~~~~~~~
   include/linux/mm.h:201:38: note: in expansion of macro 'page_to_pfn'
     201 | #define nth_page(page,n) pfn_to_page(page_to_pfn((page)) + (n))
         |                                      ^~~~~~~~~~~
   include/linux/page-flags.h:319:33: note: in expansion of macro 'nth_page'
     319 | #define folio_page(folio, n)    nth_page(&(folio)->page, n)
         |                                 ^~~~~~~~
   include/linux/bvec.h:65:27: note: in expansion of macro 'folio_page'
      65 |         bvec_set_page(bv, folio_page(folio, nr), len, offset % PG_SIZE);
         |                           ^~~~~~~~~~
>> include/asm-generic/memory_model.h:66:1: error: expected ';' before '}' token
      66 | })
         | ^
   include/asm-generic/memory_model.h:69:32: note: in definition of macro '__pfn_to_page'
      69 | ({      unsigned long __pfn = (pfn);                                    \
         |                                ^~~
   include/asm-generic/memory_model.h:81:21: note: in expansion of macro '__page_to_pfn'
      81 | #define page_to_pfn __page_to_pfn
         |                     ^~~~~~~~~~~~~
   include/linux/mm.h:201:38: note: in expansion of macro 'page_to_pfn'
     201 | #define nth_page(page,n) pfn_to_page(page_to_pfn((page)) + (n))
         |                                      ^~~~~~~~~~~
   include/linux/page-flags.h:319:33: note: in expansion of macro 'nth_page'
     319 | #define folio_page(folio, n)    nth_page(&(folio)->page, n)
         |                                 ^~~~~~~~
   include/linux/bvec.h:65:27: note: in expansion of macro 'folio_page'
      65 |         bvec_set_page(bv, folio_page(folio, nr), len, offset % PG_SIZE);
         |                           ^~~~~~~~~~
   In file included from include/asm-generic/memory_model.h:5:
   include/linux/bvec.h: In function 'bvec_phys':
>> include/asm-generic/memory_model.h:62:23: error: expected '=', ',', ';', 'asm' or '__attribute__' before '__ret'
      62 |         unsigned logn __ret;                                            \
         |                       ^~~~~
   include/linux/pfn.h:12:40: note: in definition of macro 'PFN_PHYS'
      12 | #define PFN_PHYS(x)     ((phys_addr_t)(x) << PTE_SHIFT)
         |                                        ^
   include/asm-generic/memory_model.h:81:21: note: in expansion of macro '__page_to_pfn'
      81 | #define page_to_pfn __page_to_pfn
         |                     ^~~~~~~~~~~~~
   include/asm-generic/memory_model.h:93:42: note: in expansion of macro 'page_to_pfn'
      93 | #define page_to_phys(page)      PFN_PHYS(page_to_pfn(page))
         |                                          ^~~~~~~~~~~
   include/linux/bvec.h:298:16: note: in expansion of macro 'page_to_phys'
     298 |         return page_to_phys(bvec->bv_page) + bvec->bv_offset;
         |                ^~~~~~~~~~~~
>> include/asm-generic/memory_model.h:62:23: error: '__ret' undeclared (first use in this function)
      62 |         unsigned logn __ret;                                            \
         |                       ^~~~~
   include/linux/pfn.h:12:40: note: in definition of macro 'PFN_PHYS'
      12 | #define PFN_PHYS(x)     ((phys_addr_t)(x) << PTE_SHIFT)
         |                                        ^
   include/asm-generic/memory_model.h:81:21: note: in expansion of macro '__page_to_pfn'
      81 | #define page_to_pfn __page_to_pfn
         |                     ^~~~~~~~~~~~~
   include/asm-generic/memory_model.h:93:42: note: in expansion of macro 'page_to_pfn'
      93 | #define page_to_phys(page)      PFN_PHYS(page_to_pfn(page))
         |                                          ^~~~~~~~~~~
   include/linux/bvec.h:298:16: note: in expansion of macro 'page_to_phys'
     298 |         return page_to_phys(bvec->bv_page) + bvec->bv_offset;
         |                ^~~~~~~~~~~~
   include/asm-generic/memory_model.h:66:1: error: expected ';' before '}' token
      66 | })
         | ^
   include/linux/pfn.h:12:40: note: in definition of macro 'PFN_PHYS'
      12 | #define PFN_PHYS(x)     ((phys_addr_t)(x) << PTE_SHIFT)
         |                                        ^
   include/asm-generic/memory_model.h:81:21: note: in expansion of macro '__page_to_pfn'
      81 | #define page_to_pfn __page_to_pfn
         |                     ^~~~~~~~~~~~~
   include/asm-generic/memory_model.h:93:42: note: in expansion of macro 'page_to_pfn'
      93 | #define page_to_phys(page)      PFN_PHYS(page_to_pfn(page))
         |                                          ^~~~~~~~~~~
   include/linux/bvec.h:298:16: note: in expansion of macro 'page_to_phys'
     298 |         return page_to_phys(bvec->bv_page) + bvec->bv_offset;
         |                ^~~~~~~~~~~~
   include/linux/pagemap.h: In function 'folio_file_page':
   include/asm-generic/memory_model.h:62:23: error: expected '=', ',', ';', 'asm' or '__attribute__' before '__ret'
      62 |         unsigned logn __ret;                                            \
         |                       ^~~~~
   include/asm-generic/memory_model.h:69:32: note: in definition of macro '__pfn_to_page'
      69 | ({      unsigned long __pfn = (pfn);                                    \
         |                                ^~~
   include/asm-generic/memory_model.h:81:21: note: in expansion of macro '__page_to_pfn'
      81 | #define page_to_pfn __page_to_pfn
         |                     ^~~~~~~~~~~~~
   include/linux/mm.h:201:38: note: in expansion of macro 'page_to_pfn'
     201 | #define nth_page(page,n) pfn_to_page(page_to_pfn((page)) + (n))
         |                                      ^~~~~~~~~~~
   include/linux/page-flags.h:319:33: note: in expansion of macro 'nth_page'
     319 | #define folio_page(folio, n)    nth_page(&(folio)->page, n)
         |                                 ^~~~~~~~
   include/linux/pagemap.h:948:16: note: in expansion of macro 'folio_page'
     948 |         return folio_page(folio, index & (folio_nr_pages(folio) - 1));
         |                ^~~~~~~~~~
   include/asm-generic/memory_model.h:62:23: error: '__ret' undeclared (first use in this function)
      62 |         unsigned logn __ret;                                            \
         |                       ^~~~~
   include/asm-generic/memory_model.h:69:32: note: in definition of macro '__pfn_to_page'
      69 | ({      unsigned long __pfn = (pfn);                                    \
         |                                ^~~
   include/asm-generic/memory_model.h:81:21: note: in expansion of macro '__page_to_pfn'
      81 | #define page_to_pfn __page_to_pfn
         |                     ^~~~~~~~~~~~~
   include/linux/mm.h:201:38: note: in expansion of macro 'page_to_pfn'
     201 | #define nth_page(page,n) pfn_to_page(page_to_pfn((page)) + (n))
         |                                      ^~~~~~~~~~~
   include/linux/page-flags.h:319:33: note: in expansion of macro 'nth_page'
     319 | #define folio_page(folio, n)    nth_page(&(folio)->page, n)
         |                                 ^~~~~~~~
   include/linux/pagemap.h:948:16: note: in expansion of macro 'folio_page'
     948 |         return folio_page(folio, index & (folio_nr_pages(folio) - 1));
         |                ^~~~~~~~~~
   include/asm-generic/memory_model.h:66:1: error: expected ';' before '}' token
      66 | })
         | ^
   include/asm-generic/memory_model.h:69:32: note: in definition of macro '__pfn_to_page'
      69 | ({      unsigned long __pfn = (pfn);                                    \
         |                                ^~~
   include/asm-generic/memory_model.h:81:21: note: in expansion of macro '__page_to_pfn'
      81 | #define page_to_pfn __page_to_pfn
         |                     ^~~~~~~~~~~~~
   include/linux/mm.h:201:38: note: in expansion of macro 'page_to_pfn'
     201 | #define nth_page(page,n) pfn_to_page(page_to_pfn((page)) + (n))
         |                                      ^~~~~~~~~~~
   include/linux/page-flags.h:319:33: note: in expansion of macro 'nth_page'
     319 | #define folio_page(folio, n)    nth_page(&(folio)->page, n)
         |                                 ^~~~~~~~
   include/linux/pagemap.h:948:16: note: in expansion of macro 'folio_page'
     948 |         return folio_page(folio, index & (folio_nr_pages(folio) - 1));
         |                ^~~~~~~~~~
   include/linux/pagemap.h: In function 'page_pgoff':
   include/asm-generic/memory_model.h:62:23: error: expected '=', ',', ';', 'asm' or '__attribute__' before '__ret'
      62 |         unsigned logn __ret;                                            \
         |                       ^~~~~
   include/asm-generic/memory_model.h:81:21: note: in expansion of macro '__page_to_pfn'
      81 | #define page_to_pfn __page_to_pfn
         |                     ^~~~~~~~~~~~~
   include/linux/mm.h:202:42: note: in expansion of macro 'page_to_pfn'
     202 | #define folio_page_idx(folio, p)        (page_to_pfn(p) - folio_pfn(folio))
         |                                          ^~~~~~~~~~~
   include/linux/pagemap.h:1012:31: note: in expansion of macro 'folio_page_idx'
    1012 |         return folio->index + folio_page_idx(folio, page);
         |                               ^~~~~~~~~~~~~~
   include/asm-generic/memory_model.h:62:23: error: '__ret' undeclared (first use in this function)
      62 |         unsigned logn __ret;                                            \
         |                       ^~~~~


vim +62 include/asm-generic/memory_model.h

    53	
    54	#elif defined(CONFIG_SPARSEMEM)
    55	/*
    56	 * Note: section's mem_map is encoded to reflect its start_pfn.
    57	 * section[i].section_mem_map == mem_map's address - start_pfn;
    58	 */
    59	#define __page_to_pfn(pg)						\
    60	({	const struct page *__pg = (pg);					\
    61		int __sec = page_to_section(__pg);				\
  > 62		unsigned logn __ret;						\
    63		__ret = (unsigned long)(__pg -					\
    64			__section_mem_map_addr(__nr_to_section(__sec)));	\
    65		PAGES_TO_PTES(__ret)						\
  > 66	})
    67	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
