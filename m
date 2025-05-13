Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79DB6152DE7
	for <oe-kbuild-all@lists.linux.dev>; Tue, 13 May 2025 08:24:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747124650; cv=none; b=Ic9lQF30IWCaX59XhavxwHw+NPI1xb6ZyiDMTzKNP9spca8yc6cMfhfyfTxCwtcCrp1957rKvt4sj/E9TE0gSqdfFLk1HkfiIW5ct70wZqpevE2fOTNguGYC4NHNhkkUweOAVcquu6KBIz/jAb4KIl6LqmOMUVV0LEJbUJkmeZo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747124650; c=relaxed/simple;
	bh=+xtjZrUQyMNU3pJEeZKomZElYDUxH1LCLBtj15YZQSo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=IrU+Vhs+PeXdB0QOy5Llc9OHuJRY6vsxcF/7F8MSoW2+5K9ildnzWxpHrlhkntrsz4a7aZ1jSGqYdJQXfgiN7zHzB2WGkrXo8KBSumdqqUalixnVurOl4m/PEys6c4DhxVltO0kRAmE3choscbFffcz2ROkuWeKa7jjlNoUyFVw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MDOQKyid; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MDOQKyid"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747124648; x=1778660648;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+xtjZrUQyMNU3pJEeZKomZElYDUxH1LCLBtj15YZQSo=;
  b=MDOQKyidjsPHfHaBE+xCf0XCSPbEl0fqxDBO99b+1Sai6R5+DUBRpck1
   a6ODSku/dG14y3Oa53wVoNCKJian8VgtIjzlpFCgiadbeWP8G45LLSIqH
   /+zNpsjJjtu+pzxVbG+As6XowI6e/+MCtcKXzxlEOKMS53EWLavJfdCcp
   o0nj7spr5PAb+9svByB42bN8QTnVkJguHMlMVaiexNjCKvuybCv9Xd6/3
   f9CS0jJq+nWSffb5ikDL6rM3eU+gfggiXaiBov0VdnHjGMBTTk11GkRp/
   HQWrhWrRoAG8slJiAZROCdVJS099Pyxnf5yaUap0gwYzFumtCfsityop8
   Q==;
X-CSE-ConnectionGUID: pMfj4cBxQpGT0UxGBNXZmA==
X-CSE-MsgGUID: TTGO8W/3Tx2nfUJDsLFYEQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11431"; a="59595249"
X-IronPort-AV: E=Sophos;i="6.15,284,1739865600"; 
   d="scan'208";a="59595249"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2025 01:24:07 -0700
X-CSE-ConnectionGUID: QmWJIv86QC2ucTBzhVrcEg==
X-CSE-MsgGUID: zaipZhcNQkmJVMjzeMANtg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,284,1739865600"; 
   d="scan'208";a="138593223"
Received: from igk-lkp-server01.igk.intel.com (HELO b9ffd1689040) ([10.211.3.150])
  by fmviesa009.fm.intel.com with ESMTP; 13 May 2025 01:24:06 -0700
Received: from kbuild by b9ffd1689040 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uEkvk-0000v2-2F;
	Tue, 13 May 2025 08:24:04 +0000
Date: Tue, 13 May 2025 16:23:28 +0800
From: kernel test robot <lkp@intel.com>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [ardb:x86-startup-confine-v2 12/22]
 arch/x86/include/asm/sparsemem.h:29:34: warning: "pgtable_l5_enabled" is not
 defined, evaluates to 0
Message-ID: <202505131601.hjVlfjgp-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ardb/linux.git x86-startup-confine-v2
head:   9bdd1226451144e8283e818eb138a7cfef93081a
commit: efdca8a96d506740f39345b534ea6fa4aa4c0ebd [12/22] x86/boot: Drop global variables keeping track of LA57 state
config: x86_64-buildonly-randconfig-2003-20250504 (https://download.01.org/0day-ci/archive/20250513/202505131601.hjVlfjgp-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250513/202505131601.hjVlfjgp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505131601.hjVlfjgp-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from arch/x86/include/asm/pgtable_64_types.h:5,
                    from arch/x86/include/asm/pgtable_types.h:283,
                    from arch/x86/include/asm/paravirt_types.h:11,
                    from arch/x86/include/asm/ptrace.h:175,
                    from arch/x86/include/asm/math_emu.h:5,
                    from arch/x86/include/asm/processor.h:13,
                    from arch/x86/include/asm/cpufeature.h:5,
                    from arch/x86/include/asm/thread_info.h:59,
                    from include/linux/thread_info.h:60,
                    from include/linux/spinlock.h:60,
                    from include/linux/swait.h:7,
                    from include/linux/completion.h:12,
                    from include/linux/crypto.h:15,
                    from arch/x86/kernel/asm-offsets.c:9:
>> arch/x86/include/asm/sparsemem.h:29:34: warning: "pgtable_l5_enabled" is not defined, evaluates to 0 [-Wundef]
      29 | # define MAX_PHYSMEM_BITS       (pgtable_l5_enabled() ? 52 : 46)
         |                                  ^~~~~~~~~~~~~~~~~~
   include/linux/page-flags-layout.h:31:26: note: in expansion of macro 'MAX_PHYSMEM_BITS'
      31 | #define SECTIONS_SHIFT  (MAX_PHYSMEM_BITS - SECTION_SIZE_BITS)
         |                          ^~~~~~~~~~~~~~~~
   include/linux/page-flags-layout.h:53:33: note: in expansion of macro 'SECTIONS_SHIFT'
      53 | #define SECTIONS_WIDTH          SECTIONS_SHIFT
         |                                 ^~~~~~~~~~~~~~
   include/linux/page-flags-layout.h:58:35: note: in expansion of macro 'SECTIONS_WIDTH'
      58 | #if ZONES_WIDTH + LRU_GEN_WIDTH + SECTIONS_WIDTH + NODES_SHIFT \
         |                                   ^~~~~~~~~~~~~~
>> arch/x86/include/asm/sparsemem.h:29:52: error: missing binary operator before token "("
      29 | # define MAX_PHYSMEM_BITS       (pgtable_l5_enabled() ? 52 : 46)
         |                                                    ^
   include/linux/page-flags-layout.h:31:26: note: in expansion of macro 'MAX_PHYSMEM_BITS'
      31 | #define SECTIONS_SHIFT  (MAX_PHYSMEM_BITS - SECTION_SIZE_BITS)
         |                          ^~~~~~~~~~~~~~~~
   include/linux/page-flags-layout.h:53:33: note: in expansion of macro 'SECTIONS_SHIFT'
      53 | #define SECTIONS_WIDTH          SECTIONS_SHIFT
         |                                 ^~~~~~~~~~~~~~
   include/linux/page-flags-layout.h:58:35: note: in expansion of macro 'SECTIONS_WIDTH'
      58 | #if ZONES_WIDTH + LRU_GEN_WIDTH + SECTIONS_WIDTH + NODES_SHIFT \
         |                                   ^~~~~~~~~~~~~~
>> arch/x86/include/asm/sparsemem.h:29:34: warning: "pgtable_l5_enabled" is not defined, evaluates to 0 [-Wundef]
      29 | # define MAX_PHYSMEM_BITS       (pgtable_l5_enabled() ? 52 : 46)
         |                                  ^~~~~~~~~~~~~~~~~~
   include/linux/page-flags-layout.h:31:26: note: in expansion of macro 'MAX_PHYSMEM_BITS'
      31 | #define SECTIONS_SHIFT  (MAX_PHYSMEM_BITS - SECTION_SIZE_BITS)
         |                          ^~~~~~~~~~~~~~~~
   include/linux/page-flags-layout.h:53:33: note: in expansion of macro 'SECTIONS_SHIFT'
      53 | #define SECTIONS_WIDTH          SECTIONS_SHIFT
         |                                 ^~~~~~~~~~~~~~
   include/linux/page-flags-layout.h:93:35: note: in expansion of macro 'SECTIONS_WIDTH'
      93 | #if ZONES_WIDTH + LRU_GEN_WIDTH + SECTIONS_WIDTH + NODES_WIDTH + \
         |                                   ^~~~~~~~~~~~~~
>> arch/x86/include/asm/sparsemem.h:29:52: error: missing binary operator before token "("
      29 | # define MAX_PHYSMEM_BITS       (pgtable_l5_enabled() ? 52 : 46)
         |                                                    ^
   include/linux/page-flags-layout.h:31:26: note: in expansion of macro 'MAX_PHYSMEM_BITS'
      31 | #define SECTIONS_SHIFT  (MAX_PHYSMEM_BITS - SECTION_SIZE_BITS)
         |                          ^~~~~~~~~~~~~~~~
   include/linux/page-flags-layout.h:53:33: note: in expansion of macro 'SECTIONS_SHIFT'
      53 | #define SECTIONS_WIDTH          SECTIONS_SHIFT
         |                                 ^~~~~~~~~~~~~~
   include/linux/page-flags-layout.h:93:35: note: in expansion of macro 'SECTIONS_WIDTH'
      93 | #if ZONES_WIDTH + LRU_GEN_WIDTH + SECTIONS_WIDTH + NODES_WIDTH + \
         |                                   ^~~~~~~~~~~~~~
>> arch/x86/include/asm/sparsemem.h:29:34: warning: "pgtable_l5_enabled" is not defined, evaluates to 0 [-Wundef]
      29 | # define MAX_PHYSMEM_BITS       (pgtable_l5_enabled() ? 52 : 46)
         |                                  ^~~~~~~~~~~~~~~~~~
   include/linux/page-flags-layout.h:31:26: note: in expansion of macro 'MAX_PHYSMEM_BITS'
      31 | #define SECTIONS_SHIFT  (MAX_PHYSMEM_BITS - SECTION_SIZE_BITS)
         |                          ^~~~~~~~~~~~~~~~
   include/linux/page-flags-layout.h:53:33: note: in expansion of macro 'SECTIONS_SHIFT'
      53 | #define SECTIONS_WIDTH          SECTIONS_SHIFT
         |                                 ^~~~~~~~~~~~~~
   include/linux/page-flags-layout.h:104:35: note: in expansion of macro 'SECTIONS_WIDTH'
     104 | #if ZONES_WIDTH + LRU_GEN_WIDTH + SECTIONS_WIDTH + NODES_WIDTH + \
         |                                   ^~~~~~~~~~~~~~
>> arch/x86/include/asm/sparsemem.h:29:52: error: missing binary operator before token "("
      29 | # define MAX_PHYSMEM_BITS       (pgtable_l5_enabled() ? 52 : 46)
         |                                                    ^
   include/linux/page-flags-layout.h:31:26: note: in expansion of macro 'MAX_PHYSMEM_BITS'
      31 | #define SECTIONS_SHIFT  (MAX_PHYSMEM_BITS - SECTION_SIZE_BITS)
         |                          ^~~~~~~~~~~~~~~~
   include/linux/page-flags-layout.h:53:33: note: in expansion of macro 'SECTIONS_SHIFT'
      53 | #define SECTIONS_WIDTH          SECTIONS_SHIFT
         |                                 ^~~~~~~~~~~~~~
   include/linux/page-flags-layout.h:104:35: note: in expansion of macro 'SECTIONS_WIDTH'
     104 | #if ZONES_WIDTH + LRU_GEN_WIDTH + SECTIONS_WIDTH + NODES_WIDTH + \
         |                                   ^~~~~~~~~~~~~~
   make[3]: *** [scripts/Makefile.build:98: arch/x86/kernel/asm-offsets.s] Error 1 shuffle=2385764854
   make[3]: Target 'prepare' not remade because of errors.
   make[2]: *** [Makefile:1280: prepare0] Error 2 shuffle=2385764854
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:248: __sub-make] Error 2 shuffle=2385764854
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:248: __sub-make] Error 2 shuffle=2385764854
   make: Target 'prepare' not remade because of errors.


vim +/pgtable_l5_enabled +29 arch/x86/include/asm/sparsemem.h

e41e614f6a3e3d arch/x86/include/asm/sparsemem.h Dmitry Vyukov       2022-09-15   6  
8a423ff0c4a047 include/asm-x86/sparsemem.h      Thomas Gleixner     2008-01-30   7  #ifdef CONFIG_SPARSEMEM
8a423ff0c4a047 include/asm-x86/sparsemem.h      Thomas Gleixner     2008-01-30   8  /*
8a423ff0c4a047 include/asm-x86/sparsemem.h      Thomas Gleixner     2008-01-30   9   * generic non-linear memory support:
8a423ff0c4a047 include/asm-x86/sparsemem.h      Thomas Gleixner     2008-01-30  10   *
8a423ff0c4a047 include/asm-x86/sparsemem.h      Thomas Gleixner     2008-01-30  11   * 1) we will not split memory into more chunks than will fit into the flags
8a423ff0c4a047 include/asm-x86/sparsemem.h      Thomas Gleixner     2008-01-30  12   *    field of the struct page
8a423ff0c4a047 include/asm-x86/sparsemem.h      Thomas Gleixner     2008-01-30  13   *
8a423ff0c4a047 include/asm-x86/sparsemem.h      Thomas Gleixner     2008-01-30  14   * SECTION_SIZE_BITS		2^n: size of each section
0a787b28b7a375 arch/x86/include/asm/sparsemem.h Arvind Sankar       2020-07-23  15   * MAX_PHYSMEM_BITS		2^n: max size of physical address space
8a423ff0c4a047 include/asm-x86/sparsemem.h      Thomas Gleixner     2008-01-30  16   *
8a423ff0c4a047 include/asm-x86/sparsemem.h      Thomas Gleixner     2008-01-30  17   */
8a423ff0c4a047 include/asm-x86/sparsemem.h      Thomas Gleixner     2008-01-30  18  
96a388de5dc53a include/asm-x86/sparsemem.h      Thomas Gleixner     2007-10-11  19  #ifdef CONFIG_X86_32
8a423ff0c4a047 include/asm-x86/sparsemem.h      Thomas Gleixner     2008-01-30  20  # ifdef CONFIG_X86_PAE
fb8e8375394e11 include/asm-x86/sparsemem.h      Jeremy Fitzhardinge 2008-03-27  21  #  define SECTION_SIZE_BITS	29
8a423ff0c4a047 include/asm-x86/sparsemem.h      Thomas Gleixner     2008-01-30  22  #  define MAX_PHYSMEM_BITS	36
96a388de5dc53a include/asm-x86/sparsemem.h      Thomas Gleixner     2007-10-11  23  # else
8a423ff0c4a047 include/asm-x86/sparsemem.h      Thomas Gleixner     2008-01-30  24  #  define SECTION_SIZE_BITS	26
8a423ff0c4a047 include/asm-x86/sparsemem.h      Thomas Gleixner     2008-01-30  25  #  define MAX_PHYSMEM_BITS	32
8a423ff0c4a047 include/asm-x86/sparsemem.h      Thomas Gleixner     2008-01-30  26  # endif
8a423ff0c4a047 include/asm-x86/sparsemem.h      Thomas Gleixner     2008-01-30  27  #else /* CONFIG_X86_32 */
8a423ff0c4a047 include/asm-x86/sparsemem.h      Thomas Gleixner     2008-01-30  28  # define SECTION_SIZE_BITS	27 /* matt - 128 is convenient right now */
ed7588d5dc6f5e arch/x86/include/asm/sparsemem.h Kirill A. Shutemov  2018-05-18 @29  # define MAX_PHYSMEM_BITS	(pgtable_l5_enabled() ? 52 : 46)
4c7c44837be77e arch/x86/include/asm/sparsemem.h Kirill A. Shutemov  2017-03-30  30  #endif
8a423ff0c4a047 include/asm-x86/sparsemem.h      Thomas Gleixner     2008-01-30  31  

:::::: The code at line 29 was first introduced by commit
:::::: ed7588d5dc6f5e7202fb9bbeb14d94706ba225d7 x86/mm: Stop pretending pgtable_l5_enabled is a variable

:::::: TO: Kirill A. Shutemov <kirill.shutemov@linux.intel.com>
:::::: CC: Ingo Molnar <mingo@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
