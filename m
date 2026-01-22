Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 047173806AF
	for <oe-kbuild-all@lists.linux.dev>; Thu, 22 Jan 2026 12:44:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769085844; cv=none; b=jBxaAQsfiy/ijsSCwCwCU4k9ZtZ9BGT64Hi3AKzPXs6HB/f3bRvGRw1F0qciKl8VWv3Tq0vOyvB2U4ZabQVv6OcU8YDu6iJIHvEQcXtukeUyi3+g8FvrpjrmqxLl9QIy/6ZDBHgjL1GnGVHgSnpSDyHxMd/vi8bLG9A3nU0BYsE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769085844; c=relaxed/simple;
	bh=Qgu0sOA6pOGyn3/gH8SK9K5B/NQB7XysPcFRBTRzba0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Ye1i2Z833Cap0vHGoSvoTRkgb8IK1KipnHvYDBFm5dfxQrpmwl5FAJlQ6pVcv6Hs9Xdz7FTsB5OvYGo0w+reZ/uEG3DdJCWmTmpK+DWQzKywoGtC1oaYzoHtZPYb07xqH/s5m5ksYUyLEdmiAlmZooJcpqh/w2RsIdrICjxKz0k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Oq2wLh9O; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Oq2wLh9O"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769085842; x=1800621842;
  h=date:from:to:cc:subject:message-id;
  bh=Qgu0sOA6pOGyn3/gH8SK9K5B/NQB7XysPcFRBTRzba0=;
  b=Oq2wLh9OskxecqTe5/mnuau3c1I14CCBhc0a3A3AENRrMuXdEW+H5aiv
   5BCdemSPoKPVt34YFLYroT2sJCWOBLpu9sjxWLiY23nCKNi0sLYUtq8MH
   tp4XwocIDsvB/BJ7mgK3Ms8qkiE1ukVQi1nslV8E40ibgRbhfOZ9OVq2w
   iaWm1qm5UIAJwbNUVzFryWzwlxmbTqrUxh2lY1CtV6cRgEof/MUgcRKts
   iS5JXHD/sv+ySnKmgW/QkM0gAtpHvS3+RKC0mLz3Jd7P2Mp13r0KeYPc8
   +G9FVVW2pOtRp9jP358qJ0P9i2AwsgIMdKaL8SF4w0Gkse6tdVYsatr4B
   Q==;
X-CSE-ConnectionGUID: cqeIBnzwTLycrg0ZnNiq6A==
X-CSE-MsgGUID: GERA1RHVRkO9jj1FuqCSuA==
X-IronPort-AV: E=McAfee;i="6800,10657,11678"; a="70046510"
X-IronPort-AV: E=Sophos;i="6.21,246,1763452800"; 
   d="scan'208";a="70046510"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jan 2026 04:44:02 -0800
X-CSE-ConnectionGUID: gCRIStJeTKS0BRHDiPu9YQ==
X-CSE-MsgGUID: qOuA8ku5R/iKvm0i+fkAcA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,246,1763452800"; 
   d="scan'208";a="205975517"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 22 Jan 2026 04:44:00 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1viu2X-00000000SpV-3Zqm;
	Thu, 22 Jan 2026 12:43:57 +0000
Date: Thu, 22 Jan 2026 20:43:19 +0800
From: kernel test robot <lkp@intel.com>
To: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [rppt:zero-page/v0.1 1/1]
 include/asm-generic/memory_model.h:65:37: error: implicit declaration of
 function '__pfn_to_section'
Message-ID: <202601222058.Tc3CJKLp-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/rppt/linux.git zero-page/v0.1
head:   874cd89abfe244f25de9694abe17c68fd93c0f91
commit: 874cd89abfe244f25de9694abe17c68fd93c0f91 [1/1] dev: arch, mm: consolidate empty_zero_page
config: sh-allnoconfig (https://download.01.org/0day-ci/archive/20260122/202601222058.Tc3CJKLp-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260122/202601222058.Tc3CJKLp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601222058.Tc3CJKLp-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/sh/include/asm/page.h:160,
                    from arch/sh/include/asm/io.h:20,
                    from arch/sh/kernel/machvec.c:16:
   include/linux/pgtable.h: In function '__zero_page':
>> include/asm-generic/memory_model.h:65:37: error: implicit declaration of function '__pfn_to_section' [-Wimplicit-function-declaration]
      65 |         struct mem_section *__sec = __pfn_to_section(__pfn);    \
         |                                     ^~~~~~~~~~~~~~~~
   include/asm-generic/memory_model.h:77:21: note: in expansion of macro '__pfn_to_page'
      77 | #define pfn_to_page __pfn_to_page
         |                     ^~~~~~~~~~~~~
   arch/sh/include/asm/page.h:157:33: note: in expansion of macro 'pfn_to_page'
     157 | #define virt_to_page(kaddr)     pfn_to_page(__pa(kaddr) >> PAGE_SHIFT)
         |                                 ^~~~~~~~~~~
   include/linux/pgtable.h:2198:16: note: in expansion of macro 'virt_to_page'
    2198 |         return virt_to_page(empty_zero_page);
         |                ^~~~~~~~~~~~
>> include/asm-generic/memory_model.h:65:37: error: initialization of 'struct mem_section *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
      65 |         struct mem_section *__sec = __pfn_to_section(__pfn);    \
         |                                     ^~~~~~~~~~~~~~~~
   include/asm-generic/memory_model.h:77:21: note: in expansion of macro '__pfn_to_page'
      77 | #define pfn_to_page __pfn_to_page
         |                     ^~~~~~~~~~~~~
   arch/sh/include/asm/page.h:157:33: note: in expansion of macro 'pfn_to_page'
     157 | #define virt_to_page(kaddr)     pfn_to_page(__pa(kaddr) >> PAGE_SHIFT)
         |                                 ^~~~~~~~~~~
   include/linux/pgtable.h:2198:16: note: in expansion of macro 'virt_to_page'
    2198 |         return virt_to_page(empty_zero_page);
         |                ^~~~~~~~~~~~
>> include/asm-generic/memory_model.h:66:9: error: implicit declaration of function '__section_mem_map_addr' [-Wimplicit-function-declaration]
      66 |         __section_mem_map_addr(__sec) + __pfn;          \
         |         ^~~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/memory_model.h:77:21: note: in expansion of macro '__pfn_to_page'
      77 | #define pfn_to_page __pfn_to_page
         |                     ^~~~~~~~~~~~~
   arch/sh/include/asm/page.h:157:33: note: in expansion of macro 'pfn_to_page'
     157 | #define virt_to_page(kaddr)     pfn_to_page(__pa(kaddr) >> PAGE_SHIFT)
         |                                 ^~~~~~~~~~~
   include/linux/pgtable.h:2198:16: note: in expansion of macro 'virt_to_page'
    2198 |         return virt_to_page(empty_zero_page);
         |                ^~~~~~~~~~~~
>> include/asm-generic/memory_model.h:64:2: error: returning 'long unsigned int' from a function with return type 'struct page *' makes pointer from integer without a cast [-Wint-conversion]
      64 | ({      unsigned long __pfn = (pfn);                    \
         | ~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      65 |         struct mem_section *__sec = __pfn_to_section(__pfn);    \
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      66 |         __section_mem_map_addr(__sec) + __pfn;          \
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      67 | })
         | ~~
   include/asm-generic/memory_model.h:77:21: note: in expansion of macro '__pfn_to_page'
      77 | #define pfn_to_page __pfn_to_page
         |                     ^~~~~~~~~~~~~
   arch/sh/include/asm/page.h:157:33: note: in expansion of macro 'pfn_to_page'
     157 | #define virt_to_page(kaddr)     pfn_to_page(__pa(kaddr) >> PAGE_SHIFT)
         |                                 ^~~~~~~~~~~
   include/linux/pgtable.h:2198:16: note: in expansion of macro 'virt_to_page'
    2198 |         return virt_to_page(empty_zero_page);
         |                ^~~~~~~~~~~~
   arch/sh/kernel/machvec.c: In function 'early_parse_mv':
   arch/sh/kernel/machvec.c:44:15: warning: variable 'mv_comma' set but not used [-Wunused-but-set-variable]
      44 |         char *mv_comma;
         |               ^~~~~~~~
--
   In file included from arch/sh/include/asm/page.h:160,
                    from arch/sh/include/asm/io.h:20,
                    from include/linux/io.h:12,
                    from arch/sh/kernel/traps.c:3:
   include/linux/pgtable.h: In function '__zero_page':
>> include/asm-generic/memory_model.h:65:37: error: implicit declaration of function '__pfn_to_section' [-Wimplicit-function-declaration]
      65 |         struct mem_section *__sec = __pfn_to_section(__pfn);    \
         |                                     ^~~~~~~~~~~~~~~~
   include/asm-generic/memory_model.h:77:21: note: in expansion of macro '__pfn_to_page'
      77 | #define pfn_to_page __pfn_to_page
         |                     ^~~~~~~~~~~~~
   arch/sh/include/asm/page.h:157:33: note: in expansion of macro 'pfn_to_page'
     157 | #define virt_to_page(kaddr)     pfn_to_page(__pa(kaddr) >> PAGE_SHIFT)
         |                                 ^~~~~~~~~~~
   include/linux/pgtable.h:2198:16: note: in expansion of macro 'virt_to_page'
    2198 |         return virt_to_page(empty_zero_page);
         |                ^~~~~~~~~~~~
>> include/asm-generic/memory_model.h:65:37: error: initialization of 'struct mem_section *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
      65 |         struct mem_section *__sec = __pfn_to_section(__pfn);    \
         |                                     ^~~~~~~~~~~~~~~~
   include/asm-generic/memory_model.h:77:21: note: in expansion of macro '__pfn_to_page'
      77 | #define pfn_to_page __pfn_to_page
         |                     ^~~~~~~~~~~~~
   arch/sh/include/asm/page.h:157:33: note: in expansion of macro 'pfn_to_page'
     157 | #define virt_to_page(kaddr)     pfn_to_page(__pa(kaddr) >> PAGE_SHIFT)
         |                                 ^~~~~~~~~~~
   include/linux/pgtable.h:2198:16: note: in expansion of macro 'virt_to_page'
    2198 |         return virt_to_page(empty_zero_page);
         |                ^~~~~~~~~~~~
>> include/asm-generic/memory_model.h:66:9: error: implicit declaration of function '__section_mem_map_addr' [-Wimplicit-function-declaration]
      66 |         __section_mem_map_addr(__sec) + __pfn;          \
         |         ^~~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/memory_model.h:77:21: note: in expansion of macro '__pfn_to_page'
      77 | #define pfn_to_page __pfn_to_page
         |                     ^~~~~~~~~~~~~
   arch/sh/include/asm/page.h:157:33: note: in expansion of macro 'pfn_to_page'
     157 | #define virt_to_page(kaddr)     pfn_to_page(__pa(kaddr) >> PAGE_SHIFT)
         |                                 ^~~~~~~~~~~
   include/linux/pgtable.h:2198:16: note: in expansion of macro 'virt_to_page'
    2198 |         return virt_to_page(empty_zero_page);
         |                ^~~~~~~~~~~~
>> include/asm-generic/memory_model.h:64:2: error: returning 'long unsigned int' from a function with return type 'struct page *' makes pointer from integer without a cast [-Wint-conversion]
      64 | ({      unsigned long __pfn = (pfn);                    \
         | ~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      65 |         struct mem_section *__sec = __pfn_to_section(__pfn);    \
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      66 |         __section_mem_map_addr(__sec) + __pfn;          \
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      67 | })
         | ~~
   include/asm-generic/memory_model.h:77:21: note: in expansion of macro '__pfn_to_page'
      77 | #define pfn_to_page __pfn_to_page
         |                     ^~~~~~~~~~~~~
   arch/sh/include/asm/page.h:157:33: note: in expansion of macro 'pfn_to_page'
     157 | #define virt_to_page(kaddr)     pfn_to_page(__pa(kaddr) >> PAGE_SHIFT)
         |                                 ^~~~~~~~~~~
   include/linux/pgtable.h:2198:16: note: in expansion of macro 'virt_to_page'
    2198 |         return virt_to_page(empty_zero_page);
         |                ^~~~~~~~~~~~
   In file included from include/linux/topology.h:34,
                    from include/linux/irq.h:19,
                    from include/asm-generic/hardirq.h:17,
                    from arch/sh/include/asm/hardirq.h:9,
                    from include/linux/hardirq.h:11,
                    from arch/sh/kernel/traps.c:11:
   include/linux/mmzone.h: At top level:
>> include/linux/mmzone.h:2019:28: error: conflicting types for '__section_mem_map_addr'; have 'struct page *(struct mem_section *)'
    2019 | static inline struct page *__section_mem_map_addr(struct mem_section *section)
         |                            ^~~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/memory_model.h:66:9: note: previous implicit declaration of '__section_mem_map_addr' with type 'int()'
      66 |         __section_mem_map_addr(__sec) + __pfn;          \
         |         ^~~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/memory_model.h:77:21: note: in expansion of macro '__pfn_to_page'
      77 | #define pfn_to_page __pfn_to_page
         |                     ^~~~~~~~~~~~~
   arch/sh/include/asm/page.h:157:33: note: in expansion of macro 'pfn_to_page'
     157 | #define virt_to_page(kaddr)     pfn_to_page(__pa(kaddr) >> PAGE_SHIFT)
         |                                 ^~~~~~~~~~~
   include/linux/pgtable.h:2198:16: note: in expansion of macro 'virt_to_page'
    2198 |         return virt_to_page(empty_zero_page);
         |                ^~~~~~~~~~~~
>> include/linux/mmzone.h:2104:35: error: conflicting types for '__pfn_to_section'; have 'struct mem_section *(long unsigned int)'
    2104 | static inline struct mem_section *__pfn_to_section(unsigned long pfn)
         |                                   ^~~~~~~~~~~~~~~~
   include/asm-generic/memory_model.h:65:37: note: previous implicit declaration of '__pfn_to_section' with type 'int()'
      65 |         struct mem_section *__sec = __pfn_to_section(__pfn);    \
         |                                     ^~~~~~~~~~~~~~~~
   include/asm-generic/memory_model.h:77:21: note: in expansion of macro '__pfn_to_page'
      77 | #define pfn_to_page __pfn_to_page
         |                     ^~~~~~~~~~~~~
   arch/sh/include/asm/page.h:157:33: note: in expansion of macro 'pfn_to_page'
     157 | #define virt_to_page(kaddr)     pfn_to_page(__pa(kaddr) >> PAGE_SHIFT)
         |                                 ^~~~~~~~~~~
   include/linux/pgtable.h:2198:16: note: in expansion of macro 'virt_to_page'
    2198 |         return virt_to_page(empty_zero_page);
         |                ^~~~~~~~~~~~
--
   In file included from arch/sh/include/asm/page.h:160,
                    from arch/sh/include/asm/io.h:20,
                    from include/linux/io.h:12,
                    from arch/sh/kernel/cpu/sh2/probe.c:12:
   include/linux/pgtable.h: In function '__zero_page':
>> include/asm-generic/memory_model.h:65:37: error: implicit declaration of function '__pfn_to_section' [-Wimplicit-function-declaration]
      65 |         struct mem_section *__sec = __pfn_to_section(__pfn);    \
         |                                     ^~~~~~~~~~~~~~~~
   include/asm-generic/memory_model.h:77:21: note: in expansion of macro '__pfn_to_page'
      77 | #define pfn_to_page __pfn_to_page
         |                     ^~~~~~~~~~~~~
   arch/sh/include/asm/page.h:157:33: note: in expansion of macro 'pfn_to_page'
     157 | #define virt_to_page(kaddr)     pfn_to_page(__pa(kaddr) >> PAGE_SHIFT)
         |                                 ^~~~~~~~~~~
   include/linux/pgtable.h:2198:16: note: in expansion of macro 'virt_to_page'
    2198 |         return virt_to_page(empty_zero_page);
         |                ^~~~~~~~~~~~
>> include/asm-generic/memory_model.h:65:37: error: initialization of 'struct mem_section *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
      65 |         struct mem_section *__sec = __pfn_to_section(__pfn);    \
         |                                     ^~~~~~~~~~~~~~~~
   include/asm-generic/memory_model.h:77:21: note: in expansion of macro '__pfn_to_page'
      77 | #define pfn_to_page __pfn_to_page
         |                     ^~~~~~~~~~~~~
   arch/sh/include/asm/page.h:157:33: note: in expansion of macro 'pfn_to_page'
     157 | #define virt_to_page(kaddr)     pfn_to_page(__pa(kaddr) >> PAGE_SHIFT)
         |                                 ^~~~~~~~~~~
   include/linux/pgtable.h:2198:16: note: in expansion of macro 'virt_to_page'
    2198 |         return virt_to_page(empty_zero_page);
         |                ^~~~~~~~~~~~
>> include/asm-generic/memory_model.h:66:9: error: implicit declaration of function '__section_mem_map_addr' [-Wimplicit-function-declaration]
      66 |         __section_mem_map_addr(__sec) + __pfn;          \
         |         ^~~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/memory_model.h:77:21: note: in expansion of macro '__pfn_to_page'
      77 | #define pfn_to_page __pfn_to_page
         |                     ^~~~~~~~~~~~~
   arch/sh/include/asm/page.h:157:33: note: in expansion of macro 'pfn_to_page'
     157 | #define virt_to_page(kaddr)     pfn_to_page(__pa(kaddr) >> PAGE_SHIFT)
         |                                 ^~~~~~~~~~~
   include/linux/pgtable.h:2198:16: note: in expansion of macro 'virt_to_page'
    2198 |         return virt_to_page(empty_zero_page);
         |                ^~~~~~~~~~~~
>> include/asm-generic/memory_model.h:64:2: error: returning 'long unsigned int' from a function with return type 'struct page *' makes pointer from integer without a cast [-Wint-conversion]
      64 | ({      unsigned long __pfn = (pfn);                    \
         | ~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      65 |         struct mem_section *__sec = __pfn_to_section(__pfn);    \
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      66 |         __section_mem_map_addr(__sec) + __pfn;          \
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      67 | })
         | ~~
   include/asm-generic/memory_model.h:77:21: note: in expansion of macro '__pfn_to_page'
      77 | #define pfn_to_page __pfn_to_page
         |                     ^~~~~~~~~~~~~
   arch/sh/include/asm/page.h:157:33: note: in expansion of macro 'pfn_to_page'
     157 | #define virt_to_page(kaddr)     pfn_to_page(__pa(kaddr) >> PAGE_SHIFT)
         |                                 ^~~~~~~~~~~
   include/linux/pgtable.h:2198:16: note: in expansion of macro 'virt_to_page'
    2198 |         return virt_to_page(empty_zero_page);
         |                ^~~~~~~~~~~~


vim +/__pfn_to_section +65 include/asm-generic/memory_model.h

a117e66ed45ac0 KAMEZAWA Hiroyuki 2006-03-27  62  
67de648211fa04 Andy Whitcroft    2006-06-23  63  #define __pfn_to_page(pfn)				\
a117e66ed45ac0 KAMEZAWA Hiroyuki 2006-03-27 @64  ({	unsigned long __pfn = (pfn);			\
a117e66ed45ac0 KAMEZAWA Hiroyuki 2006-03-27 @65  	struct mem_section *__sec = __pfn_to_section(__pfn);	\
a117e66ed45ac0 KAMEZAWA Hiroyuki 2006-03-27 @66  	__section_mem_map_addr(__sec) + __pfn;		\
a117e66ed45ac0 KAMEZAWA Hiroyuki 2006-03-27  67  })
bb1c50d3967f69 Mike Rapoport     2021-06-28  68  #endif /* CONFIG_FLATMEM/SPARSEMEM */
67de648211fa04 Andy Whitcroft    2006-06-23  69  

:::::: The code at line 65 was first introduced by commit
:::::: a117e66ed45ac0569c039ea60bd7a9a61e031858 [PATCH] unify pfn_to_page: generic functions

:::::: TO: KAMEZAWA Hiroyuki <kamezawa.hiroyu@jp.fujitsu.com>
:::::: CC: Linus Torvalds <torvalds@g5.osdl.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
