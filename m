Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B0EA3346AB
	for <oe-kbuild-all@lists.linux.dev>; Fri, 13 Feb 2026 11:14:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770981271; cv=none; b=ScTc6MC0+m9+Q8RvSsw0F9vf9PZ0Sm4jnX5mxqkLjoz13qy2Rp3p+vE0L/bIK/8aZiil6q1xn7r/Sf32kRU/Fz+fJvMSHuw4pJLqZb3Racymzc6hkD/wJ1NqUMUVBEXg+vVQQRPuAkzhvWOHO4w93amnuirNkQCnezgHJ4tOeqo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770981271; c=relaxed/simple;
	bh=NN6LQVB/ceV32rbS86P1N2e5g3LIe+X9+oSuMi02o/g=;
	h=Date:From:To:Cc:Subject:Message-ID; b=BdabWwEkpi2SFjFB+mJPnPiyoESseQY9+dUBWKUubS//lIopDjcTwDVnO9NpIs64RkbUfgEnWNA4bxnvfxE/K8bLkgGFpwR1R0/WtmYIRBqF3wgOMUpLZtLwMpT7BLRYUzsx1ucas8on945KlLzIuT4Vqv/B0PIVcMMbgBScWPw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PGkZ6VpV; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PGkZ6VpV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770981270; x=1802517270;
  h=date:from:to:cc:subject:message-id;
  bh=NN6LQVB/ceV32rbS86P1N2e5g3LIe+X9+oSuMi02o/g=;
  b=PGkZ6VpVoZP3gVg+nZ4xA0wZkL2D0/qmQ8SY6piCM+UWJ8gnKFAi6H0j
   nATr3To28u8bNZgAAxpOrDC2jN74pgiaoorQMmtDyZhanUmtBUDepu3Ng
   QSBGFhXQF6/o1JaLbE1keAtct/PoOntPsYPOZZKvqbneMlnG25EhgH+dA
   noRzPfvYPMc7q3ebuWTOUtqY2S85o3c+tpuHF2PbQ1myijo3Dr1hiEFm9
   Q7jzPCC5SPxya6XXw7ts1AFEXhywu23JrFS75MdUuWbYPrPY/LCcF3i4X
   ZOL3NihBsJqSR4oZC25D+HH6zQiRiYbcuSfQ0jXkTSBvLeuubdH7WrXQK
   w==;
X-CSE-ConnectionGUID: +ApvXuPbQJuS8gZm01BG9A==
X-CSE-MsgGUID: ONAF4ucvQ4ui4syNmGeDIQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11699"; a="83533796"
X-IronPort-AV: E=Sophos;i="6.21,288,1763452800"; 
   d="scan'208";a="83533796"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Feb 2026 03:14:27 -0800
X-CSE-ConnectionGUID: jOt+GbbDSnquN5LMksgz2w==
X-CSE-MsgGUID: H6Mb3kXKTPmttXa+8P5r9A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,288,1763452800"; 
   d="scan'208";a="212730628"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 13 Feb 2026 03:14:26 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vqr7v-00000000vKE-1Gup;
	Fri, 13 Feb 2026 11:14:23 +0000
Date: Fri, 13 Feb 2026 19:13:37 +0800
From: kernel test robot <lkp@intel.com>
To: Kiryl Shutsemau <kas@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [kas:pte_size 3/16] arch/powerpc/include/asm/page_32.h:19:9:
 warning: 'PTE_SHIFT' redefined
Message-ID: <202602131925.rv5UHHpr-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/kas/linux.git pte_size
head:   f562d70c53ccc0213b4afbf20fc312d85f9972bb
commit: 49c571ae7bb8b188254533ec2375cebc783f840c [3/16] mm: Introduce PTE_SIZE, PTE_SHIFT and PTE_MASK
config: powerpc-allnoconfig (https://download.01.org/0day-ci/archive/20260213/202602131925.rv5UHHpr-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260213/202602131925.rv5UHHpr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602131925.rv5UHHpr-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from arch/powerpc/include/asm/page.h:249,
                    from arch/powerpc/include/asm/thread_info.h:13,
                    from include/linux/thread_info.h:60,
                    from include/asm-generic/preempt.h:5,
                    from arch/powerpc/include/asm/preempt.h:5,
                    from include/linux/preempt.h:79,
                    from include/linux/alloc_tag.h:11,
                    from include/linux/rhashtable-types.h:12,
                    from include/linux/ipc.h:7,
                    from include/uapi/linux/sem.h:5,
                    from include/linux/sem.h:5,
                    from include/linux/compat.h:14,
                    from arch/powerpc/kernel/asm-offsets.c:12:
>> arch/powerpc/include/asm/page_32.h:19:9: warning: 'PTE_SHIFT' redefined
      19 | #define PTE_SHIFT       (PAGE_SHIFT - PTE_T_LOG2)       /* full page */
         |         ^~~~~~~~~
   In file included from arch/powerpc/include/asm/page.h:24:
   include/vdso/page.h:13:9: note: this is the location of the previous definition
      13 | #define PTE_SHIFT      CONFIG_PTE_SHIFT
         |         ^~~~~~~~~
   include/asm-generic/getorder.h: In function 'get_order':
   arch/powerpc/include/asm/page_32.h:19:26: error: 'PAGE_SHIFT' undeclared (first use in this function)
      19 | #define PTE_SHIFT       (PAGE_SHIFT - PTE_T_LOG2)       /* full page */
         |                          ^~~~~~~~~~
   include/vdso/page.h:31:25: note: in expansion of macro 'PTE_SHIFT'
      31 | #define PAGE_SHIFT      PTE_SHIFT
         |                         ^~~~~~~~~
   include/asm-generic/getorder.h:33:48: note: in expansion of macro 'PAGE_SHIFT'
      33 |                         return BITS_PER_LONG - PAGE_SHIFT;
         |                                                ^~~~~~~~~~
   arch/powerpc/include/asm/page_32.h:19:26: note: each undeclared identifier is reported only once for each function it appears in
      19 | #define PTE_SHIFT       (PAGE_SHIFT - PTE_T_LOG2)       /* full page */
         |                          ^~~~~~~~~~
   include/vdso/page.h:31:25: note: in expansion of macro 'PTE_SHIFT'
      31 | #define PAGE_SHIFT      PTE_SHIFT
         |                         ^~~~~~~~~
   include/asm-generic/getorder.h:33:48: note: in expansion of macro 'PAGE_SHIFT'
      33 |                         return BITS_PER_LONG - PAGE_SHIFT;
         |                                                ^~~~~~~~~~
   arch/powerpc/include/asm/page_32.h:19:39: error: 'PTE_T_LOG2' undeclared (first use in this function)
      19 | #define PTE_SHIFT       (PAGE_SHIFT - PTE_T_LOG2)       /* full page */
         |                                       ^~~~~~~~~~
   include/vdso/page.h:31:25: note: in expansion of macro 'PTE_SHIFT'
      31 | #define PAGE_SHIFT      PTE_SHIFT
         |                         ^~~~~~~~~
   include/asm-generic/getorder.h:33:48: note: in expansion of macro 'PAGE_SHIFT'
      33 |                         return BITS_PER_LONG - PAGE_SHIFT;
         |                                                ^~~~~~~~~~
   include/asm-generic/memory_model.h: In function 'pfn_valid':
   arch/powerpc/include/asm/page_32.h:19:26: error: 'PAGE_SHIFT' undeclared (first use in this function)
      19 | #define PTE_SHIFT       (PAGE_SHIFT - PTE_T_LOG2)       /* full page */
         |                          ^~~~~~~~~~
   include/vdso/page.h:31:25: note: in expansion of macro 'PTE_SHIFT'
      31 | #define PAGE_SHIFT      PTE_SHIFT
         |                         ^~~~~~~~~
   arch/powerpc/include/asm/page.h:112:66: note: in expansion of macro 'PAGE_SHIFT'
     112 | #define ARCH_PFN_OFFSET         ((unsigned long)(MEMORY_START >> PAGE_SHIFT))
         |                                                                  ^~~~~~~~~~
   include/asm-generic/memory_model.h:28:36: note: in expansion of macro 'ARCH_PFN_OFFSET'
      28 |         unsigned long pfn_offset = ARCH_PFN_OFFSET;
         |                                    ^~~~~~~~~~~~~~~
   arch/powerpc/include/asm/thread_info.h: At top level:
   arch/powerpc/include/asm/page_32.h:54:39: error: missing binary operator before token '('
      54 | #define PTE_T_LOG2      (__builtin_ffs(sizeof(pte_t)) - 1)
         |                                       ^
   arch/powerpc/include/asm/page_32.h:19:39: note: in expansion of macro 'PTE_T_LOG2'
      19 | #define PTE_SHIFT       (PAGE_SHIFT - PTE_T_LOG2)       /* full page */
         |                                       ^~~~~~~~~~
   include/vdso/page.h:31:25: note: in expansion of macro 'PTE_SHIFT'
      31 | #define PAGE_SHIFT      PTE_SHIFT
         |                         ^~~~~~~~~
   arch/powerpc/include/asm/thread_info.h:23:54: note: in expansion of macro 'PAGE_SHIFT'
      23 | #if defined(CONFIG_VMAP_STACK) && MIN_THREAD_SHIFT < PAGE_SHIFT
         |                                                      ^~~~~~~~~~
   In file included from arch/powerpc/include/asm/page.h:269:
   arch/powerpc/include/asm/book3s/32/pgtable.h: In function 'pfn_pte':
   arch/powerpc/include/asm/page_32.h:19:26: error: 'PAGE_SHIFT' undeclared (first use in this function)
      19 | #define PTE_SHIFT       (PAGE_SHIFT - PTE_T_LOG2)       /* full page */
         |                          ^~~~~~~~~~
   arch/powerpc/include/asm/pgtable-types.h:26:34: note: in definition of macro '__pte'
      26 | #define __pte(x)        ((pte_t)(x))
         |                                  ^
   include/vdso/page.h:31:25: note: in expansion of macro 'PTE_SHIFT'
      31 | #define PAGE_SHIFT      PTE_SHIFT
         |                         ^~~~~~~~~
   arch/powerpc/include/asm/book3s/32/pgtable.h:57:26: note: in expansion of macro 'PAGE_SHIFT'
      57 | #define PTE_RPN_SHIFT   (PAGE_SHIFT)
         |                          ^~~~~~~~~~
   arch/powerpc/include/asm/book3s/32/pgtable.h:448:45: note: in expansion of macro 'PTE_RPN_SHIFT'
     448 |         return __pte(((pte_basic_t)(pfn) << PTE_RPN_SHIFT) |
         |                                             ^~~~~~~~~~~~~
   arch/powerpc/include/asm/book3s/32/pgtable.h: In function 'pte_modify':
   arch/powerpc/include/asm/page_32.h:19:26: error: 'PAGE_SHIFT' undeclared (first use in this function)
      19 | #define PTE_SHIFT       (PAGE_SHIFT - PTE_T_LOG2)       /* full page */
         |                          ^~~~~~~~~~
   arch/powerpc/include/asm/pgtable-types.h:26:34: note: in definition of macro '__pte'
      26 | #define __pte(x)        ((pte_t)(x))
         |                                  ^
   include/vdso/page.h:31:25: note: in expansion of macro 'PTE_SHIFT'
      31 | #define PAGE_SHIFT      PTE_SHIFT
         |                         ^~~~~~~~~
   arch/powerpc/include/asm/book3s/32/pgtable.h:57:26: note: in expansion of macro 'PAGE_SHIFT'
      57 | #define PTE_RPN_SHIFT   (PAGE_SHIFT)
         |                          ^~~~~~~~~~
   arch/powerpc/include/asm/book3s/32/pgtable.h:67:36: note: in expansion of macro 'PTE_RPN_SHIFT'
      67 | #define PTE_RPN_MASK    (~((1UL << PTE_RPN_SHIFT) - 1))
         |                                    ^~~~~~~~~~~~~
   arch/powerpc/include/asm/book3s/32/pgtable.h:75:26: note: in expansion of macro 'PTE_RPN_MASK'
      75 | #define _PAGE_CHG_MASK  (PTE_RPN_MASK | _PAGE_HASHPTE | _PAGE_DIRTY | \
         |                          ^~~~~~~~~~~~
   arch/powerpc/include/asm/book3s/32/pgtable.h:513:38: note: in expansion of macro '_PAGE_CHG_MASK'
     513 |         return __pte((pte_val(pte) & _PAGE_CHG_MASK) | pgprot_val(newprot));
         |                                      ^~~~~~~~~~~~~~
   arch/powerpc/include/asm/pgtable.h: In function 'pte_pfn':


vim +/PTE_SHIFT +19 arch/powerpc/include/asm/page_32.h

5cd16ee934eafc include/asm-powerpc/page_32.h      Michael Ellerman 2005-11-11  14  
55c8fc3f493028 arch/powerpc/include/asm/page_32.h Christophe Leroy 2018-11-29  15  #if defined(CONFIG_PPC_256K_PAGES) || \
55c8fc3f493028 arch/powerpc/include/asm/page_32.h Christophe Leroy 2018-11-29  16      (defined(CONFIG_PPC_8xx) && defined(CONFIG_PPC_16K_PAGES))
e12401222f749c arch/powerpc/include/asm/page_32.h Yuri Tikhonov    2009-01-29  17  #define PTE_SHIFT	(PAGE_SHIFT - PTE_T_LOG2 - 2)	/* 1/4 of a page */
e12401222f749c arch/powerpc/include/asm/page_32.h Yuri Tikhonov    2009-01-29  18  #else
ca9153a3a2a755 arch/powerpc/include/asm/page_32.h Ilya Yanok       2008-12-11 @19  #define PTE_SHIFT	(PAGE_SHIFT - PTE_T_LOG2)	/* full page */
e12401222f749c arch/powerpc/include/asm/page_32.h Yuri Tikhonov    2009-01-29  20  #endif
ca9153a3a2a755 arch/powerpc/include/asm/page_32.h Ilya Yanok       2008-12-11  21  

:::::: The code at line 19 was first introduced by commit
:::::: ca9153a3a2a7556d091dfe080e42b0e67881fff6 powerpc/44x: Support 16K/64K base page sizes on 44x

:::::: TO: Ilya Yanok <yanok@emcraft.com>
:::::: CC: Paul Mackerras <paulus@samba.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
