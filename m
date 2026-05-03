Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B613136DA08
	for <oe-kbuild-all@lists.linux.dev>; Sun,  3 May 2026 06:56:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777791381; cv=none; b=Pq6uoC4nXaboRuyTpGQ8hXF2RxvpppufSM29rVPLUpMxamYWEY5c24BrLus1gzNgT/DHYLmG/eRC47vTjBK4TBNCZiyFWdMW4dYybGmzwOzzp06Rb+rQRvr2+GuOTHPOG5CxT6dq+3kgQjRgMQBgr+hBcnCHnWt95CAph+QUXn8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777791381; c=relaxed/simple;
	bh=20jxWk422fcl6Nm3x23EM9aVKzIg4jtCjQAhbxVBbvc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=rCCV23JqtnwDALFIxhe4MbtPECz37nt7uqFCEoUNYixhcI8U+aBNuM6sAHusitRS/AHlsSfSSqEavuUx4CriSZzMolkVLT7kcqO7srXRfJw8zLqHHu+mrQBZn98gErYdrZAHeSZZIcjtz1p/DGoR6eUinBoYofRzizi5hA1P9m0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hBWw4/A2; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hBWw4/A2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777791380; x=1809327380;
  h=date:from:to:cc:subject:message-id;
  bh=20jxWk422fcl6Nm3x23EM9aVKzIg4jtCjQAhbxVBbvc=;
  b=hBWw4/A2lsFcNppJs7WwUH72ou/tiMl072J51YLwA7VLsd8PqJDhUlMH
   4atQG2bPRm3toxyt9T72x4vm5BJi3xmU5jPayDQ/G70xvYeXGKU+XNQjl
   x53Sq+LVYirc28TGZk8MnmKGWQdLP0eNV8yZqSls6swcIf1En1Lhm6LK/
   denmrg47dXvw7WoHGob77u40q+QpRXAgQXPhJhY+knDxqkr14ApLz6maQ
   nRNaxzpFsm1UOO/xvNVeQCJ3onWH6fHbRoKS8jj+esnEDDvd4AzU3Sxel
   n639gIVLhX/K4YcwRR5dpPYaW3LNiWKSvFDmLiFE4cNTiIu4hRZy/Rx/X
   A==;
X-CSE-ConnectionGUID: 496/KrBRRUumVjmtcphxtA==
X-CSE-MsgGUID: YkpuVFLQQTq7ofH6kl+Lwg==
X-IronPort-AV: E=McAfee;i="6800,10657,11774"; a="77851074"
X-IronPort-AV: E=Sophos;i="6.23,213,1770624000"; 
   d="scan'208";a="77851074"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 May 2026 23:56:14 -0700
X-CSE-ConnectionGUID: RwytZPKrS6W0dMvt7Uu8OQ==
X-CSE-MsgGUID: 16BGqcr7RAyH5UIxoRwVtg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,213,1770624000"; 
   d="scan'208";a="235105658"
Received: from lkp-server01.sh.intel.com (HELO 781826d00641) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 02 May 2026 23:56:11 -0700
Received: from kbuild by 781826d00641 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wJQkL-000000002Hj-3Tnw;
	Sun, 03 May 2026 06:56:09 +0000
Date: Sun, 03 May 2026 14:55:12 +0800
From: kernel test robot <lkp@intel.com>
To: "Kiryl Shutsemau (Meta)" <kas@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [kas:pte_size 14/69] include/linux/mm.h:2290:42: warning:
 suggest parentheses around arithmetic in operand of '|'
Message-ID: <202605031411.sNe1W5iN-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/kas/linux.git pte_size
head:   3453a5ad954365409373c2762ba237c7e31a623b
commit: 1b1cc196b1e62540c22ef5fbb67dda5cb6d92595 [14/69] mm: Introduce mkpte() and folio_mkpte()
config: nios2-allnoconfig (https://download.01.org/0day-ci/archive/20260503/202605031411.sNe1W5iN-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260503/202605031411.sNe1W5iN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605031411.sNe1W5iN-lkp@intel.com/

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
                    from arch/nios2/kernel/setup.c:15:
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
   arch/nios2/kernel/setup.c: At top level:
   arch/nios2/kernel/setup.c:102:24: warning: no previous prototype for 'nios2_boot_init' [-Wmissing-prototypes]
     102 | asmlinkage void __init nios2_boot_init(unsigned r4, unsigned r5, unsigned r6,
         |                        ^~~~~~~~~~~~~~~
--
   In file included from arch/nios2/include/asm/processor.h:22,
                    from include/linux/sched.h:13,
                    from include/linux/ptrace.h:6,
                    from arch/nios2/kernel/signal.c:14:
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
   arch/nios2/kernel/signal.c: At top level:
   arch/nios2/kernel/signal.c:101:16: warning: no previous prototype for 'do_rt_sigreturn' [-Wmissing-prototypes]
     101 | asmlinkage int do_rt_sigreturn(struct switch_stack *sw)
         |                ^~~~~~~~~~~~~~~
   arch/nios2/kernel/signal.c:302:16: warning: no previous prototype for 'do_notify_resume' [-Wmissing-prototypes]
     302 | asmlinkage int do_notify_resume(struct pt_regs *regs)
         |                ^~~~~~~~~~~~~~~~
--
   In file included from arch/nios2/include/asm/processor.h:22,
                    from include/linux/spinlock_up.h:8,
                    from include/linux/spinlock.h:97,
                    from include/linux/swait.h:7,
                    from include/linux/completion.h:12,
                    from include/linux/shrinker.h:8,
                    from include/linux/list_lru.h:13,
                    from include/linux/fs/super_types.h:7,
                    from include/linux/fs/super.h:5,
                    from include/linux/fs.h:5,
                    from arch/nios2/kernel/sys_nios2.c:13:
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
   arch/nios2/kernel/sys_nios2.c: At top level:
   arch/nios2/kernel/sys_nios2.c:21:16: warning: no previous prototype for 'sys_cacheflush' [-Wmissing-prototypes]
      21 | asmlinkage int sys_cacheflush(unsigned long addr, unsigned long len,
         |                ^~~~~~~~~~~~~~
   arch/nios2/kernel/sys_nios2.c:57:16: warning: no previous prototype for 'sys_getpagesize' [-Wmissing-prototypes]
      57 | asmlinkage int sys_getpagesize(void)
         |                ^~~~~~~~~~~~~~~
--
   In file included from arch/nios2/include/asm/processor.h:22,
                    from include/linux/spinlock_up.h:8,
                    from include/linux/spinlock.h:97,
                    from include/linux/swait.h:7,
                    from include/linux/completion.h:12,
                    from include/linux/shrinker.h:8,
                    from include/linux/list_lru.h:13,
                    from include/linux/fs/super_types.h:7,
                    from include/linux/fs/super.h:5,
                    from include/linux/fs.h:5,
                    from include/uapi/linux/aio_abi.h:31,
                    from include/linux/syscalls.h:84,
                    from arch/nios2/kernel/syscall_table.c:6:
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
   ./arch/nios2/include/generated/asm/syscall_table_32.h: At top level:
   arch/nios2/kernel/syscall_table.c:12:36: warning: initialized field overwritten [-Woverride-init]
      12 | #define __SYSCALL(nr, call) [nr] = (call),
         |                                    ^
   arch/nios2/kernel/syscall_table.c:13:58: note: in expansion of macro '__SYSCALL'
      13 | #define __SYSCALL_WITH_COMPAT(nr, native, compat)        __SYSCALL(nr, native)
         |                                                          ^~~~~~~~~
   ./arch/nios2/include/generated/asm/syscall_table_32.h:1:1: note: in expansion of macro '__SYSCALL_WITH_COMPAT'
       1 | __SYSCALL_WITH_COMPAT(0, sys_io_setup, compat_sys_io_setup)
         | ^~~~~~~~~~~~~~~~~~~~~
   arch/nios2/kernel/syscall_table.c:12:36: note: (near initialization for 'sys_call_table[0]')
      12 | #define __SYSCALL(nr, call) [nr] = (call),
         |                                    ^
   arch/nios2/kernel/syscall_table.c:13:58: note: in expansion of macro '__SYSCALL'
      13 | #define __SYSCALL_WITH_COMPAT(nr, native, compat)        __SYSCALL(nr, native)
         |                                                          ^~~~~~~~~
   ./arch/nios2/include/generated/asm/syscall_table_32.h:1:1: note: in expansion of macro '__SYSCALL_WITH_COMPAT'
       1 | __SYSCALL_WITH_COMPAT(0, sys_io_setup, compat_sys_io_setup)
         | ^~~~~~~~~~~~~~~~~~~~~
   arch/nios2/kernel/syscall_table.c:12:36: warning: initialized field overwritten [-Woverride-init]
      12 | #define __SYSCALL(nr, call) [nr] = (call),
         |                                    ^
   ./arch/nios2/include/generated/asm/syscall_table_32.h:2:1: note: in expansion of macro '__SYSCALL'
       2 | __SYSCALL(1, sys_io_destroy)
         | ^~~~~~~~~
   arch/nios2/kernel/syscall_table.c:12:36: note: (near initialization for 'sys_call_table[1]')
      12 | #define __SYSCALL(nr, call) [nr] = (call),
         |                                    ^
   ./arch/nios2/include/generated/asm/syscall_table_32.h:2:1: note: in expansion of macro '__SYSCALL'
       2 | __SYSCALL(1, sys_io_destroy)
         | ^~~~~~~~~
   arch/nios2/kernel/syscall_table.c:12:36: warning: initialized field overwritten [-Woverride-init]
      12 | #define __SYSCALL(nr, call) [nr] = (call),
         |                                    ^
   arch/nios2/kernel/syscall_table.c:13:58: note: in expansion of macro '__SYSCALL'
      13 | #define __SYSCALL_WITH_COMPAT(nr, native, compat)        __SYSCALL(nr, native)
         |                                                          ^~~~~~~~~
   ./arch/nios2/include/generated/asm/syscall_table_32.h:3:1: note: in expansion of macro '__SYSCALL_WITH_COMPAT'
       3 | __SYSCALL_WITH_COMPAT(2, sys_io_submit, compat_sys_io_submit)
         | ^~~~~~~~~~~~~~~~~~~~~
   arch/nios2/kernel/syscall_table.c:12:36: note: (near initialization for 'sys_call_table[2]')
      12 | #define __SYSCALL(nr, call) [nr] = (call),
         |                                    ^
   arch/nios2/kernel/syscall_table.c:13:58: note: in expansion of macro '__SYSCALL'
      13 | #define __SYSCALL_WITH_COMPAT(nr, native, compat)        __SYSCALL(nr, native)
         |                                                          ^~~~~~~~~
   ./arch/nios2/include/generated/asm/syscall_table_32.h:3:1: note: in expansion of macro '__SYSCALL_WITH_COMPAT'
       3 | __SYSCALL_WITH_COMPAT(2, sys_io_submit, compat_sys_io_submit)
         | ^~~~~~~~~~~~~~~~~~~~~
   arch/nios2/kernel/syscall_table.c:12:36: warning: initialized field overwritten [-Woverride-init]
      12 | #define __SYSCALL(nr, call) [nr] = (call),
         |                                    ^
   ./arch/nios2/include/generated/asm/syscall_table_32.h:4:1: note: in expansion of macro '__SYSCALL'
       4 | __SYSCALL(3, sys_io_cancel)
         | ^~~~~~~~~
   arch/nios2/kernel/syscall_table.c:12:36: note: (near initialization for 'sys_call_table[3]')
      12 | #define __SYSCALL(nr, call) [nr] = (call),
         |                                    ^
   ./arch/nios2/include/generated/asm/syscall_table_32.h:4:1: note: in expansion of macro '__SYSCALL'
       4 | __SYSCALL(3, sys_io_cancel)
         | ^~~~~~~~~
   arch/nios2/kernel/syscall_table.c:12:36: warning: initialized field overwritten [-Woverride-init]
      12 | #define __SYSCALL(nr, call) [nr] = (call),
         |                                    ^
   ./arch/nios2/include/generated/asm/syscall_table_32.h:5:1: note: in expansion of macro '__SYSCALL'
       5 | __SYSCALL(4, sys_io_getevents_time32)
         | ^~~~~~~~~
   arch/nios2/kernel/syscall_table.c:12:36: note: (near initialization for 'sys_call_table[4]')
      12 | #define __SYSCALL(nr, call) [nr] = (call),
         |                                    ^
   ./arch/nios2/include/generated/asm/syscall_table_32.h:5:1: note: in expansion of macro '__SYSCALL'
       5 | __SYSCALL(4, sys_io_getevents_time32)
         | ^~~~~~~~~
   arch/nios2/kernel/syscall_table.c:12:36: warning: initialized field overwritten [-Woverride-init]
      12 | #define __SYSCALL(nr, call) [nr] = (call),
         |                                    ^
   ./arch/nios2/include/generated/asm/syscall_table_32.h:6:1: note: in expansion of macro '__SYSCALL'
       6 | __SYSCALL(5, sys_setxattr)
         | ^~~~~~~~~
   arch/nios2/kernel/syscall_table.c:12:36: note: (near initialization for 'sys_call_table[5]')
      12 | #define __SYSCALL(nr, call) [nr] = (call),
         |                                    ^
   ./arch/nios2/include/generated/asm/syscall_table_32.h:6:1: note: in expansion of macro '__SYSCALL'
--
   In file included from arch/nios2/include/asm/processor.h:22,
                    from include/linux/sched.h:13,
                    from arch/nios2/kernel/traps.c:13:
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
   arch/nios2/kernel/traps.c: At top level:
   arch/nios2/kernel/traps.c:32:6: warning: no previous prototype for 'die' [-Wmissing-prototypes]
      32 | void die(const char *str, struct pt_regs *regs, long err)
         |      ^~~
   arch/nios2/kernel/traps.c:109:17: warning: no previous prototype for 'breakpoint_c' [-Wmissing-prototypes]
     109 | asmlinkage void breakpoint_c(struct pt_regs *fp)
         |                 ^~~~~~~~~~~~
   arch/nios2/kernel/traps.c:122:17: warning: no previous prototype for 'handle_unaligned_c' [-Wmissing-prototypes]
     122 | asmlinkage void handle_unaligned_c(struct pt_regs *fp, int cause)
         |                 ^~~~~~~~~~~~~~~~~~
   arch/nios2/kernel/traps.c:147:17: warning: no previous prototype for 'handle_illegal_c' [-Wmissing-prototypes]
     147 | asmlinkage void handle_illegal_c(struct pt_regs *fp)
         |                 ^~~~~~~~~~~~~~~~
   arch/nios2/kernel/traps.c:154:17: warning: no previous prototype for 'handle_supervisor_instr' [-Wmissing-prototypes]
     154 | asmlinkage void handle_supervisor_instr(struct pt_regs *fp)
         |                 ^~~~~~~~~~~~~~~~~~~~~~~
   arch/nios2/kernel/traps.c:161:17: warning: no previous prototype for 'handle_diverror_c' [-Wmissing-prototypes]
     161 | asmlinkage void handle_diverror_c(struct pt_regs *fp)
         |                 ^~~~~~~~~~~~~~~~~
   arch/nios2/kernel/traps.c:168:17: warning: no previous prototype for 'unhandled_exception' [-Wmissing-prototypes]
     168 | asmlinkage void unhandled_exception(struct pt_regs *regs, int cause)
         |                 ^~~~~~~~~~~~~~~~~~~
   arch/nios2/kernel/traps.c:183:17: warning: no previous prototype for 'handle_trap_1_c' [-Wmissing-prototypes]
     183 | asmlinkage void handle_trap_1_c(struct pt_regs *fp)
         |                 ^~~~~~~~~~~~~~~
   arch/nios2/kernel/traps.c:188:17: warning: no previous prototype for 'handle_trap_2_c' [-Wmissing-prototypes]
     188 | asmlinkage void handle_trap_2_c(struct pt_regs *fp)
         |                 ^~~~~~~~~~~~~~~
   arch/nios2/kernel/traps.c:193:17: warning: no previous prototype for 'handle_trap_3_c' [-Wmissing-prototypes]
     193 | asmlinkage void handle_trap_3_c(struct pt_regs *fp)
         |                 ^~~~~~~~~~~~~~~
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
