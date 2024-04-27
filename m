Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E69CF3A1D3
	for <oe-kbuild-all@lists.linux.dev>; Sat, 27 Apr 2024 21:20:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714252856; cv=none; b=mALuVP0JCAihM1d28iK5ey7dKuTlxGwfrhS0FhF6d8vHz+YdPJEjf+h+kOr/S2Z1vDMst20cZRau2kEADJqF7EFRkVSseiqwvCuM/Y7K87x30vG5Ur6RyMQ/asbdLjvbcd72nI0EN2j3xjID1zaC9cXTskTYCxYiKgB/FJ7h3GE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714252856; c=relaxed/simple;
	bh=K3PW9ltJi4dyn0NR2UP1aIEu5ftk4lMqJQtcbZ3FvPY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=fFy2Ukpxf4S+G5ClRq1wKK0K0Ppp4QqLYhYv2J+XbNYQVTUpO7/PqaYbccmP9Hzi4r5tz+bGligkFT2xFvtpF03heY7bMVN7pJSv89KYqTN/Nk/JLRlw0ZKwiL3q5DKLhOCFl80AB9PftpdLjIzowYR6HdszRlqtO4TNzMpOpyI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ax5oe1GF; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ax5oe1GF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714252854; x=1745788854;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=K3PW9ltJi4dyn0NR2UP1aIEu5ftk4lMqJQtcbZ3FvPY=;
  b=Ax5oe1GF2EP0zVER7IIS3K9iGLKRGEuw7IIKSH7qVGsYdfjoczretLe9
   kHqMAKM3kf7Hvl8WlRgunNj3i12tT/BKgLem/DN+6/4vBybYX354voFju
   0tb0USdLJ9TgpFkx9iotCPBjwlD0XY7H9RAR4hsK1yaUv2k+BWJ7d4NAn
   yFtXMoTw2s0KmCyp2oX38IvsGnn6wfTAndEoNWYuXtLuFMdewccWKzQnW
   aEUqyVQs9GGM0InunUV5Dn9SB4HNY6NsPVg9I3U1XcUHW7UUYc/VuEE72
   sO3o/20OpUwtNpmiOLmgpdWojOlompbJuzo4RMzlpTFPoQ5Sh4/lh7WSk
   Q==;
X-CSE-ConnectionGUID: nvVMaJEaScyrxyaz4XH2mw==
X-CSE-MsgGUID: WAIP86PGSTeHIBEzGBPoVg==
X-IronPort-AV: E=McAfee;i="6600,9927,11057"; a="32462505"
X-IronPort-AV: E=Sophos;i="6.07,236,1708416000"; 
   d="scan'208";a="32462505"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Apr 2024 14:20:54 -0700
X-CSE-ConnectionGUID: V9JFkga5Q7WXF/rgvbCL6g==
X-CSE-MsgGUID: Yd90w5avSlaMd69+zJ+o/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,236,1708416000"; 
   d="scan'208";a="48969546"
Received: from lkp-server01.sh.intel.com (HELO e434dd42e5a1) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 27 Apr 2024 14:20:54 -0700
Received: from kbuild by e434dd42e5a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s0pTW-0005VS-0d;
	Sat, 27 Apr 2024 21:20:50 +0000
Date: Sun, 28 Apr 2024 05:20:33 +0800
From: kernel test robot <lkp@intel.com>
To: Yunsheng Lin <linyunsheng@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [linyunsheng:page_frag_cache_v3 12/14]
 include/asm-generic/memory_model.h:37:34: error: 'vmemmap' undeclared; did
 you mean 'mem_map'?
Message-ID: <202404280542.KzacEpL7-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

tree:   https://github.com/gestionlin/linux.git page_frag_cache_v3
head:   d4839424731dee0af1ba520ac3b177893e765399
commit: 72fcea0d811a05d5e8983f14fd6154f792054e7e [12/14] mm: page_frag: introduce prepare/probe/commit API
config: sparc-allmodconfig (https://download.01.org/0day-ci/archive/20240428/202404280542.KzacEpL7-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240428/202404280542.KzacEpL7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404280542.KzacEpL7-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/sparc/include/asm/page_64.h:129,
                    from arch/sparc/include/asm/page.h:8,
                    from arch/sparc/include/asm/thread_info_64.h:27,
                    from arch/sparc/include/asm/thread_info.h:5,
                    from include/linux/thread_info.h:60,
                    from include/asm-generic/preempt.h:5,
                    from ./arch/sparc/include/generated/asm/preempt.h:1,
                    from include/linux/preempt.h:79,
                    from include/linux/spinlock.h:56,
                    from include/linux/mmzone.h:8,
                    from include/linux/gfp.h:7,
                    from include/linux/umh.h:4,
                    from include/linux/kmod.h:9,
                    from include/linux/module.h:17,
                    from mm/page_frag_test.c:9:
   include/linux/page_frag_cache.h: In function 'page_frag_alloc_pg_prepare':
>> include/asm-generic/memory_model.h:37:34: error: 'vmemmap' undeclared (first use in this function); did you mean 'mem_map'?
      37 | #define __pfn_to_page(pfn)      (vmemmap + (pfn))
         |                                  ^~~~~~~
   include/asm-generic/memory_model.h:65:21: note: in expansion of macro '__pfn_to_page'
      65 | #define pfn_to_page __pfn_to_page
         |                     ^~~~~~~~~~~~~
   arch/sparc/include/asm/page_64.h:151:33: note: in expansion of macro 'pfn_to_page'
     151 | #define virt_to_page(kaddr)     pfn_to_page(__pa(kaddr)>>PAGE_SHIFT)
         |                                 ^~~~~~~~~~~
   include/linux/page_frag_cache.h:158:24: note: in expansion of macro 'virt_to_page'
     158 |                 page = virt_to_page(va);
         |                        ^~~~~~~~~~~~
   include/asm-generic/memory_model.h:37:34: note: each undeclared identifier is reported only once for each function it appears in
      37 | #define __pfn_to_page(pfn)      (vmemmap + (pfn))
         |                                  ^~~~~~~
   include/asm-generic/memory_model.h:65:21: note: in expansion of macro '__pfn_to_page'
      65 | #define pfn_to_page __pfn_to_page
         |                     ^~~~~~~~~~~~~
   arch/sparc/include/asm/page_64.h:151:33: note: in expansion of macro 'pfn_to_page'
     151 | #define virt_to_page(kaddr)     pfn_to_page(__pa(kaddr)>>PAGE_SHIFT)
         |                                 ^~~~~~~~~~~
   include/linux/page_frag_cache.h:158:24: note: in expansion of macro 'virt_to_page'
     158 |                 page = virt_to_page(va);
         |                        ^~~~~~~~~~~~
   include/linux/page_frag_cache.h: In function 'page_frag_alloc_prepare':
>> include/asm-generic/memory_model.h:37:34: error: 'vmemmap' undeclared (first use in this function); did you mean 'mem_map'?
      37 | #define __pfn_to_page(pfn)      (vmemmap + (pfn))
         |                                  ^~~~~~~
   include/asm-generic/memory_model.h:65:21: note: in expansion of macro '__pfn_to_page'
      65 | #define pfn_to_page __pfn_to_page
         |                     ^~~~~~~~~~~~~
   arch/sparc/include/asm/page_64.h:151:33: note: in expansion of macro 'pfn_to_page'
     151 | #define virt_to_page(kaddr)     pfn_to_page(__pa(kaddr)>>PAGE_SHIFT)
         |                                 ^~~~~~~~~~~
   include/linux/page_frag_cache.h:187:24: note: in expansion of macro 'virt_to_page'
     187 |                 page = virt_to_page(*va);
         |                        ^~~~~~~~~~~~
   include/linux/page_frag_cache.h: In function 'page_frag_alloc_probe':
>> include/asm-generic/memory_model.h:37:34: error: 'vmemmap' undeclared (first use in this function); did you mean 'mem_map'?
      37 | #define __pfn_to_page(pfn)      (vmemmap + (pfn))
         |                                  ^~~~~~~
   include/asm-generic/memory_model.h:65:21: note: in expansion of macro '__pfn_to_page'
      65 | #define pfn_to_page __pfn_to_page
         |                     ^~~~~~~~~~~~~
   arch/sparc/include/asm/page_64.h:151:33: note: in expansion of macro 'pfn_to_page'
     151 | #define virt_to_page(kaddr)     pfn_to_page(__pa(kaddr)>>PAGE_SHIFT)
         |                                 ^~~~~~~~~~~
   include/linux/page_frag_cache.h:210:16: note: in expansion of macro 'virt_to_page'
     210 |         page = virt_to_page(*va);
         |                ^~~~~~~~~~~~


vim +37 include/asm-generic/memory_model.h

8f6aac419bd590f Christoph Lameter  2007-10-16  35  
af901ca181d92aa André Goddard Rosa 2009-11-14  36  /* memmap is virtually contiguous.  */
8f6aac419bd590f Christoph Lameter  2007-10-16 @37  #define __pfn_to_page(pfn)	(vmemmap + (pfn))
32272a26974d202 Martin Schwidefsky 2008-12-25  38  #define __page_to_pfn(page)	(unsigned long)((page) - vmemmap)
8f6aac419bd590f Christoph Lameter  2007-10-16  39  

:::::: The code at line 37 was first introduced by commit
:::::: 8f6aac419bd590f535fb110875a51f7db2b62b5b Generic Virtual Memmap support for SPARSEMEM

:::::: TO: Christoph Lameter <clameter@sgi.com>
:::::: CC: Linus Torvalds <torvalds@woody.linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
