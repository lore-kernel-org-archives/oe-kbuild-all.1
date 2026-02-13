Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1B7232ED54
	for <oe-kbuild-all@lists.linux.dev>; Fri, 13 Feb 2026 11:14:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770981270; cv=none; b=jpsyXM0TYbcwAZi/PjRKgsionSk08Vf4c92dl6t0OY5I27gQJRHAUkAn//gc7Vm7R7ncE9fbHwgv2+Y/Q8vN+jYAnJmjTEGaWtaZtr6deyfcaHVoazVrEyaG0Zjb+hjkqmcMUsOjAADFwRwC6bhNTlz3Xn/d4BQto9lMVk2g8gg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770981270; c=relaxed/simple;
	bh=b4GOOACheaTVhLd5DneySM7+KEKGqDM/WkMwK58xYfc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=H2k6smio8tL7kpsnql1/WrgoLQ+KiYX0fnjKkW7TdC1NNnoFKOafeNASQ/YkFlhDd9OfQ1ZZGmKHXOZVxdF+7UXNunwuoWOcpuCfaX1Epk2n/sIcfARl9utAtjLqkwogOS4HV1ZkPQM06cFQS55VINrHMoWCm8lKUdbPflMV/FE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=C7psO/U6; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="C7psO/U6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770981268; x=1802517268;
  h=date:from:to:cc:subject:message-id;
  bh=b4GOOACheaTVhLd5DneySM7+KEKGqDM/WkMwK58xYfc=;
  b=C7psO/U6IZ5FOCa7v3iLZJsdR9RVgPgoMaq6t1Q/Do/07/AMZp/6kD+p
   KTX6nH+PABogB5s6NkBFsdbL0jjeT3KiBgjo5G1CzLzGJMISEHKO2Eg77
   aCjAtYjGcdZmB4TQBccjR2XPV32R6PUvvBlcN/rJYX79ZpzEBaSZXUp08
   A5WaU3GYQ49lSjItLe/3TLHhxVj4pPXo7O5OKOILxeUVuNf8K9uNssKAJ
   8vlVUMOyMlYPOHcY1Rgp2Vy6Uob7GFojydJq8jy7iMu670ex4ilPsRwrx
   UrRr2Jg+8jkJD/JkxluAbV18VCeF1b9pS4tWbEf3O+PcaEm2ff9ANgEz1
   A==;
X-CSE-ConnectionGUID: I9bwnBEZT2yLU55MQa4qlQ==
X-CSE-MsgGUID: 2qPYsBfcQMOQ9k99sIwVNA==
X-IronPort-AV: E=McAfee;i="6800,10657,11699"; a="83533794"
X-IronPort-AV: E=Sophos;i="6.21,288,1763452800"; 
   d="scan'208";a="83533794"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Feb 2026 03:14:27 -0800
X-CSE-ConnectionGUID: 7X+hOUmFQ2iuTx0bpKk1yw==
X-CSE-MsgGUID: q3cIklgfTn6NqnC3S574IQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,288,1763452800"; 
   d="scan'208";a="212730627"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 13 Feb 2026 03:14:26 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vqr7v-00000000vK8-0z1h;
	Fri, 13 Feb 2026 11:14:23 +0000
Date: Fri, 13 Feb 2026 19:13:35 +0800
From: kernel test robot <lkp@intel.com>
To: Kiryl Shutsemau <kas@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [kas:pte_size 15/16] include/linux/mm.h:1810:42: warning:
 suggest parentheses around arithmetic in operand of '|'
Message-ID: <202602131927.KV1Aork0-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/kas/linux.git pte_size
head:   f562d70c53ccc0213b4afbf20fc312d85f9972bb
commit: abf3930fa6ed33226e0965bedc64f461c3647656 [15/16] tmp
config: nios2-allnoconfig (https://download.01.org/0day-ci/archive/20260213/202602131927.KV1Aork0-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260213/202602131927.KV1Aork0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602131927.KV1Aork0-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from arch/nios2/include/asm/processor.h:22,
                    from include/linux/sched.h:13,
                    from arch/nios2/kernel/asm-offsets.c:7:
   include/linux/mm.h: In function 'mkpte':
>> include/linux/mm.h:1810:42: warning: suggest parentheses around arithmetic in operand of '|' [-Wparentheses]
    1810 |         return pfn_pte(page_to_pfn(page) + off, pgprot);
   arch/nios2/include/asm/page.h:64:37: note: in definition of macro '__pte'
      64 | #define __pte(x)        ((pte_t) { (x) })
         |                                     ^
   include/linux/mm.h:1810:16: note: in expansion of macro 'pfn_pte'
    1810 |         return pfn_pte(page_to_pfn(page) + off, pgprot);
         |                ^~~~~~~
   include/linux/mm.h: In function 'folio_mkpte':
   include/linux/mm.h:1829:41: warning: suggest parentheses around arithmetic in operand of '|' [-Wparentheses]
    1829 |         return pfn_pte(folio_pfn(folio) + off, pgprot);
         |                        ~~~~~~~~~~~~~~~~~^~~~~
   arch/nios2/include/asm/page.h:64:37: note: in definition of macro '__pte'
      64 | #define __pte(x)        ((pte_t) { (x) })
         |                                     ^
   include/linux/mm.h:1829:16: note: in expansion of macro 'pfn_pte'
    1829 |         return pfn_pte(folio_pfn(folio) + off, pgprot);
         |                ^~~~~~~
--
   In file included from arch/nios2/include/asm/processor.h:22,
                    from include/linux/spinlock_up.h:8,
                    from include/linux/spinlock.h:97,
                    from include/linux/mmzone.h:8,
                    from include/linux/gfp.h:7,
                    from include/linux/mm.h:7,
                    from arch/nios2/kernel/setup.c:15:
   include/linux/mm.h: In function 'mkpte':
>> include/linux/mm.h:1810:42: warning: suggest parentheses around arithmetic in operand of '|' [-Wparentheses]
    1810 |         return pfn_pte(page_to_pfn(page) + off, pgprot);
   arch/nios2/include/asm/page.h:64:37: note: in definition of macro '__pte'
      64 | #define __pte(x)        ((pte_t) { (x) })
         |                                     ^
   include/linux/mm.h:1810:16: note: in expansion of macro 'pfn_pte'
    1810 |         return pfn_pte(page_to_pfn(page) + off, pgprot);
         |                ^~~~~~~
   include/linux/mm.h: In function 'folio_mkpte':
   include/linux/mm.h:1829:41: warning: suggest parentheses around arithmetic in operand of '|' [-Wparentheses]
    1829 |         return pfn_pte(folio_pfn(folio) + off, pgprot);
         |                        ~~~~~~~~~~~~~~~~~^~~~~
   arch/nios2/include/asm/page.h:64:37: note: in definition of macro '__pte'
      64 | #define __pte(x)        ((pte_t) { (x) })
         |                                     ^
   include/linux/mm.h:1829:16: note: in expansion of macro 'pfn_pte'
    1829 |         return pfn_pte(folio_pfn(folio) + off, pgprot);
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
>> include/linux/mm.h:1810:42: warning: suggest parentheses around arithmetic in operand of '|' [-Wparentheses]
    1810 |         return pfn_pte(page_to_pfn(page) + off, pgprot);
   arch/nios2/include/asm/page.h:64:37: note: in definition of macro '__pte'
      64 | #define __pte(x)        ((pte_t) { (x) })
         |                                     ^
   include/linux/mm.h:1810:16: note: in expansion of macro 'pfn_pte'
    1810 |         return pfn_pte(page_to_pfn(page) + off, pgprot);
         |                ^~~~~~~
   include/linux/mm.h: In function 'folio_mkpte':
   include/linux/mm.h:1829:41: warning: suggest parentheses around arithmetic in operand of '|' [-Wparentheses]
    1829 |         return pfn_pte(folio_pfn(folio) + off, pgprot);
         |                        ~~~~~~~~~~~~~~~~~^~~~~
   arch/nios2/include/asm/page.h:64:37: note: in definition of macro '__pte'
      64 | #define __pte(x)        ((pte_t) { (x) })
         |                                     ^
   include/linux/mm.h:1829:16: note: in expansion of macro 'pfn_pte'
    1829 |         return pfn_pte(folio_pfn(folio) + off, pgprot);
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
                    from include/linux/wait.h:9,
                    from include/linux/wait_bit.h:8,
                    from include/linux/fs.h:7,
                    from arch/nios2/kernel/sys_nios2.c:13:
   include/linux/mm.h: In function 'mkpte':
>> include/linux/mm.h:1810:42: warning: suggest parentheses around arithmetic in operand of '|' [-Wparentheses]
    1810 |         return pfn_pte(page_to_pfn(page) + off, pgprot);
   arch/nios2/include/asm/page.h:64:37: note: in definition of macro '__pte'
      64 | #define __pte(x)        ((pte_t) { (x) })
         |                                     ^
   include/linux/mm.h:1810:16: note: in expansion of macro 'pfn_pte'
    1810 |         return pfn_pte(page_to_pfn(page) + off, pgprot);
         |                ^~~~~~~
   include/linux/mm.h: In function 'folio_mkpte':
   include/linux/mm.h:1829:41: warning: suggest parentheses around arithmetic in operand of '|' [-Wparentheses]
    1829 |         return pfn_pte(folio_pfn(folio) + off, pgprot);
         |                        ~~~~~~~~~~~~~~~~~^~~~~
   arch/nios2/include/asm/page.h:64:37: note: in definition of macro '__pte'
      64 | #define __pte(x)        ((pte_t) { (x) })
         |                                     ^
   include/linux/mm.h:1829:16: note: in expansion of macro 'pfn_pte'
    1829 |         return pfn_pte(folio_pfn(folio) + off, pgprot);
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
                    from include/linux/wait.h:9,
                    from include/linux/wait_bit.h:8,
                    from include/linux/fs.h:7,
                    from include/uapi/linux/aio_abi.h:31,
                    from include/linux/syscalls.h:84,
                    from arch/nios2/kernel/syscall_table.c:6:
   include/linux/mm.h: In function 'mkpte':
>> include/linux/mm.h:1810:42: warning: suggest parentheses around arithmetic in operand of '|' [-Wparentheses]
    1810 |         return pfn_pte(page_to_pfn(page) + off, pgprot);
   arch/nios2/include/asm/page.h:64:37: note: in definition of macro '__pte'
      64 | #define __pte(x)        ((pte_t) { (x) })
         |                                     ^
   include/linux/mm.h:1810:16: note: in expansion of macro 'pfn_pte'
    1810 |         return pfn_pte(page_to_pfn(page) + off, pgprot);
         |                ^~~~~~~
   include/linux/mm.h: In function 'folio_mkpte':
   include/linux/mm.h:1829:41: warning: suggest parentheses around arithmetic in operand of '|' [-Wparentheses]
    1829 |         return pfn_pte(folio_pfn(folio) + off, pgprot);
         |                        ~~~~~~~~~~~~~~~~~^~~~~
   arch/nios2/include/asm/page.h:64:37: note: in definition of macro '__pte'
      64 | #define __pte(x)        ((pte_t) { (x) })
         |                                     ^
   include/linux/mm.h:1829:16: note: in expansion of macro 'pfn_pte'
    1829 |         return pfn_pte(folio_pfn(folio) + off, pgprot);
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
>> include/linux/mm.h:1810:42: warning: suggest parentheses around arithmetic in operand of '|' [-Wparentheses]
    1810 |         return pfn_pte(page_to_pfn(page) + off, pgprot);
   arch/nios2/include/asm/page.h:64:37: note: in definition of macro '__pte'
      64 | #define __pte(x)        ((pte_t) { (x) })
         |                                     ^
   include/linux/mm.h:1810:16: note: in expansion of macro 'pfn_pte'
    1810 |         return pfn_pte(page_to_pfn(page) + off, pgprot);
         |                ^~~~~~~
   include/linux/mm.h: In function 'folio_mkpte':
   include/linux/mm.h:1829:41: warning: suggest parentheses around arithmetic in operand of '|' [-Wparentheses]
    1829 |         return pfn_pte(folio_pfn(folio) + off, pgprot);
         |                        ~~~~~~~~~~~~~~~~~^~~~~
   arch/nios2/include/asm/page.h:64:37: note: in definition of macro '__pte'
      64 | #define __pte(x)        ((pte_t) { (x) })
         |                                     ^
   include/linux/mm.h:1829:16: note: in expansion of macro 'pfn_pte'
    1829 |         return pfn_pte(folio_pfn(folio) + off, pgprot);
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
                    from arch/nios2/kernel/asm-offsets.c:7:
   include/linux/mm.h: In function 'mkpte':
>> include/linux/mm.h:1810:42: warning: suggest parentheses around arithmetic in operand of '|' [-Wparentheses]
    1810 |         return pfn_pte(page_to_pfn(page) + off, pgprot);
   arch/nios2/include/asm/page.h:64:37: note: in definition of macro '__pte'
      64 | #define __pte(x)        ((pte_t) { (x) })
         |                                     ^
   include/linux/mm.h:1810:16: note: in expansion of macro 'pfn_pte'
    1810 |         return pfn_pte(page_to_pfn(page) + off, pgprot);
         |                ^~~~~~~
   include/linux/mm.h: In function 'folio_mkpte':
   include/linux/mm.h:1829:41: warning: suggest parentheses around arithmetic in operand of '|' [-Wparentheses]
    1829 |         return pfn_pte(folio_pfn(folio) + off, pgprot);
         |                        ~~~~~~~~~~~~~~~~~^~~~~
   arch/nios2/include/asm/page.h:64:37: note: in definition of macro '__pte'
      64 | #define __pte(x)        ((pte_t) { (x) })
         |                                     ^
   include/linux/mm.h:1829:16: note: in expansion of macro 'pfn_pte'
    1829 |         return pfn_pte(folio_pfn(folio) + off, pgprot);
         |                ^~~~~~~


vim +1810 include/linux/mm.h

  1804	
  1805	#ifdef CONFIG_MMU
  1806	static inline pte_t mkpte(struct page *page, unsigned long pteoff, pgprot_t pgprot)
  1807	{
  1808		unsigned long off = pteoff & ((1UL << (PG_SHIFT - PTE_SHIFT)) - 1);
  1809	
> 1810		return pfn_pte(page_to_pfn(page) + off, pgprot);
  1811	}
  1812	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
