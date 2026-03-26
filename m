Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 035BD2F362B
	for <oe-kbuild-all@lists.linux.dev>; Thu, 26 Mar 2026 03:18:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774495141; cv=none; b=svJq8ZmW6sXd7qCfZ0yHHF1bPiivtGhFFQdwqmc/kMKuekg8jENmsqeESA/rHbyOSPUts0xJe2ZAwo1wDoRhWOAHeyhZTvTJr+IVVnK2fGFHzII+URUG2PwDcFDcN5NJRf+0dVUJU040w+wql8rwxxgzhYiEkCuZ1kU4UvWHi90=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774495141; c=relaxed/simple;
	bh=T+TOn6MEIaK/plAqSBy2iSbt0pEf9EKGdeHePz/2gw0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=mbqJvz84VLaaPhJpdhWwpLjgDmdh7APqqi2eWqUfzwwO2D4a7bWoV7x32NedYSfLX+HbH+DR4ZCH0iMAr8UvtkqQvEPDt8+0jW5IulWK3IT2guCMa1hWXVRBmcQH56jyGO6P36Em8beiUEt0phshhSxTT8YLFwGelgFG+XUYoDg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=alB9WxdU; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="alB9WxdU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774495139; x=1806031139;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=T+TOn6MEIaK/plAqSBy2iSbt0pEf9EKGdeHePz/2gw0=;
  b=alB9WxdU1P5d0WtzviVetjRE2bPsCXR/e9/YvUnCjt6aMNLyuC4uelHD
   M5DBtXh79bMAWDpWSG/FRBGdslLd8CCsnOOP9x5QKM93BgCifySHj+DZa
   3dnzWVnxWvOLpsUzWo4vayXMClx94w/n23CstGQ5Gq1Xy8ndf1fa7mKlF
   MYnBaKfvdI/ohllfXzmSauUrvZ475sD0DdKylf7uHmcuqg65w1zxUxbYU
   OWqqGehe4yQvT1g39erlJenhXbZYZdert+4jRpjHO3fHdy6E1RIpOmrtP
   qSIgdaCk27++vGn3ZyLNycpa4z1FxQ7j2C73TWuOmcqQczkAMGwqhPjSt
   g==;
X-CSE-ConnectionGUID: SpwwyBJASvWFcdjRf5pIfw==
X-CSE-MsgGUID: zHU4pclQTya4k0TgxJuEaA==
X-IronPort-AV: E=McAfee;i="6800,10657,11740"; a="75430638"
X-IronPort-AV: E=Sophos;i="6.23,141,1770624000"; 
   d="scan'208";a="75430638"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Mar 2026 20:18:56 -0700
X-CSE-ConnectionGUID: rSezxi/kR9GWGND3BDslog==
X-CSE-MsgGUID: imI1MQM0QHW50eVxqk8OqA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,141,1770624000"; 
   d="scan'208";a="220029342"
Received: from lkp-server01.sh.intel.com (HELO 3905d212be1b) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 25 Mar 2026 20:18:54 -0700
Received: from kbuild by 3905d212be1b with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w5bFD-0000000083H-3rJM;
	Thu, 26 Mar 2026 03:18:51 +0000
Date: Thu, 26 Mar 2026 11:18:18 +0800
From: kernel test robot <lkp@intel.com>
To: "Thomas =?utf-8?Q?Wei=C3=9Fschuh"?= <thomas.weissschuh@linutronix.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [thomas-weissschuh:b4/kunit-kselftests 3/18]
 arch/nios2/lib/memcpy.c:160:7: error: no previous prototype for 'memcpy'
Message-ID: <202603261106.T5hhkWas-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/thomas.weissschuh/linux.git b4/kunit-kselftests
head:   6816331cc815bfc31edb2ff1aaad0d882f0bf92b
commit: fb3ab97786e927b684927c71a78479a10f6d2995 [3/18] run-tests
config: nios2-allnoconfig (https://download.01.org/0day-ci/archive/20260326/202603261106.T5hhkWas-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260326/202603261106.T5hhkWas-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603261106.T5hhkWas-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/nios2/lib/memcpy.c:160:7: error: no previous prototype for 'memcpy' [-Werror=missing-prototypes]
     160 | void *memcpy(void *dstpp, const void *srcpp, size_t len)
         |       ^~~~~~
>> arch/nios2/lib/memcpy.c:194:7: error: no previous prototype for 'memcpyb' [-Werror=missing-prototypes]
     194 | void *memcpyb(void *dstpp, const void *srcpp, unsigned len)
         |       ^~~~~~~
   cc1: all warnings being treated as errors
--
>> arch/nios2/kernel/irq.c:19:17: error: no previous prototype for 'do_IRQ' [-Werror=missing-prototypes]
      19 | asmlinkage void do_IRQ(int hwirq, struct pt_regs *regs)
         |                 ^~~~~~
   cc1: all warnings being treated as errors
--
>> arch/nios2/kernel/process.c:34:6: error: no previous prototype for 'arch_cpu_idle' [-Werror=missing-prototypes]
      34 | void arch_cpu_idle(void)
         |      ^~~~~~~~~~~~~
>> arch/nios2/kernel/process.c:43:6: error: no previous prototype for 'machine_restart' [-Werror=missing-prototypes]
      43 | void machine_restart(char *__unused)
         |      ^~~~~~~~~~~~~~~
>> arch/nios2/kernel/process.c:54:6: error: no previous prototype for 'machine_halt' [-Werror=missing-prototypes]
      54 | void machine_halt(void)
         |      ^~~~~~~~~~~~
>> arch/nios2/kernel/process.c:66:6: error: no previous prototype for 'machine_power_off' [-Werror=missing-prototypes]
      66 | void machine_power_off(void)
         |      ^~~~~~~~~~~~~~~~~
>> arch/nios2/kernel/process.c:152:6: error: no previous prototype for 'dump' [-Werror=missing-prototypes]
     152 | void dump(struct pt_regs *fp)
         |      ^~~~
>> arch/nios2/kernel/process.c:253:16: error: no previous prototype for 'nios2_clone' [-Werror=missing-prototypes]
     253 | asmlinkage int nios2_clone(unsigned long clone_flags, unsigned long newsp,
         |                ^~~~~~~~~~~
   cc1: all warnings being treated as errors
--
>> arch/nios2/kernel/setup.c:102:24: error: no previous prototype for 'nios2_boot_init' [-Werror=missing-prototypes]
     102 | asmlinkage void __init nios2_boot_init(unsigned r4, unsigned r5, unsigned r6,
         |                        ^~~~~~~~~~~~~~~
   cc1: all warnings being treated as errors
--
>> arch/nios2/kernel/signal.c:101:16: error: no previous prototype for 'do_rt_sigreturn' [-Werror=missing-prototypes]
     101 | asmlinkage int do_rt_sigreturn(struct switch_stack *sw)
         |                ^~~~~~~~~~~~~~~
>> arch/nios2/kernel/signal.c:302:16: error: no previous prototype for 'do_notify_resume' [-Werror=missing-prototypes]
     302 | asmlinkage int do_notify_resume(struct pt_regs *regs)
         |                ^~~~~~~~~~~~~~~~
   cc1: all warnings being treated as errors
--
>> arch/nios2/kernel/sys_nios2.c:21:16: error: no previous prototype for 'sys_cacheflush' [-Werror=missing-prototypes]
      21 | asmlinkage int sys_cacheflush(unsigned long addr, unsigned long len,
         |                ^~~~~~~~~~~~~~
>> arch/nios2/kernel/sys_nios2.c:57:16: error: no previous prototype for 'sys_getpagesize' [-Werror=missing-prototypes]
      57 | asmlinkage int sys_getpagesize(void)
         |                ^~~~~~~~~~~~~~~
   cc1: all warnings being treated as errors
--
>> arch/nios2/kernel/syscall_table.c:12:36: error: initialized field overwritten [-Werror=override-init]
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
>> arch/nios2/kernel/syscall_table.c:12:36: error: initialized field overwritten [-Werror=override-init]
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
>> arch/nios2/kernel/syscall_table.c:12:36: error: initialized field overwritten [-Werror=override-init]
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
>> arch/nios2/kernel/syscall_table.c:12:36: error: initialized field overwritten [-Werror=override-init]
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
>> arch/nios2/kernel/syscall_table.c:12:36: error: initialized field overwritten [-Werror=override-init]
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
>> arch/nios2/kernel/syscall_table.c:12:36: error: initialized field overwritten [-Werror=override-init]
      12 | #define __SYSCALL(nr, call) [nr] = (call),
         |                                    ^
   ./arch/nios2/include/generated/asm/syscall_table_32.h:6:1: note: in expansion of macro '__SYSCALL'
       6 | __SYSCALL(5, sys_setxattr)
         | ^~~~~~~~~
   arch/nios2/kernel/syscall_table.c:12:36: note: (near initialization for 'sys_call_table[5]')
      12 | #define __SYSCALL(nr, call) [nr] = (call),
         |                                    ^
   ./arch/nios2/include/generated/asm/syscall_table_32.h:6:1: note: in expansion of macro '__SYSCALL'
       6 | __SYSCALL(5, sys_setxattr)
         | ^~~~~~~~~
>> arch/nios2/kernel/syscall_table.c:12:36: error: initialized field overwritten [-Werror=override-init]
      12 | #define __SYSCALL(nr, call) [nr] = (call),
         |                                    ^
   ./arch/nios2/include/generated/asm/syscall_table_32.h:7:1: note: in expansion of macro '__SYSCALL'
       7 | __SYSCALL(6, sys_lsetxattr)
         | ^~~~~~~~~
   arch/nios2/kernel/syscall_table.c:12:36: note: (near initialization for 'sys_call_table[6]')
      12 | #define __SYSCALL(nr, call) [nr] = (call),
         |                                    ^
   ./arch/nios2/include/generated/asm/syscall_table_32.h:7:1: note: in expansion of macro '__SYSCALL'
       7 | __SYSCALL(6, sys_lsetxattr)
         | ^~~~~~~~~
>> arch/nios2/kernel/syscall_table.c:12:36: error: initialized field overwritten [-Werror=override-init]
      12 | #define __SYSCALL(nr, call) [nr] = (call),
         |                                    ^
   ./arch/nios2/include/generated/asm/syscall_table_32.h:8:1: note: in expansion of macro '__SYSCALL'
       8 | __SYSCALL(7, sys_fsetxattr)
         | ^~~~~~~~~
   arch/nios2/kernel/syscall_table.c:12:36: note: (near initialization for 'sys_call_table[7]')
      12 | #define __SYSCALL(nr, call) [nr] = (call),
         |                                    ^
   ./arch/nios2/include/generated/asm/syscall_table_32.h:8:1: note: in expansion of macro '__SYSCALL'
       8 | __SYSCALL(7, sys_fsetxattr)
         | ^~~~~~~~~
>> arch/nios2/kernel/syscall_table.c:12:36: error: initialized field overwritten [-Werror=override-init]
      12 | #define __SYSCALL(nr, call) [nr] = (call),
         |                                    ^
   ./arch/nios2/include/generated/asm/syscall_table_32.h:9:1: note: in expansion of macro '__SYSCALL'
       9 | __SYSCALL(8, sys_getxattr)
         | ^~~~~~~~~
   arch/nios2/kernel/syscall_table.c:12:36: note: (near initialization for 'sys_call_table[8]')
      12 | #define __SYSCALL(nr, call) [nr] = (call),
         |                                    ^
   ./arch/nios2/include/generated/asm/syscall_table_32.h:9:1: note: in expansion of macro '__SYSCALL'
       9 | __SYSCALL(8, sys_getxattr)
         | ^~~~~~~~~
>> arch/nios2/kernel/syscall_table.c:12:36: error: initialized field overwritten [-Werror=override-init]
      12 | #define __SYSCALL(nr, call) [nr] = (call),
         |                                    ^
   ./arch/nios2/include/generated/asm/syscall_table_32.h:10:1: note: in expansion of macro '__SYSCALL'
      10 | __SYSCALL(9, sys_lgetxattr)
         | ^~~~~~~~~
   arch/nios2/kernel/syscall_table.c:12:36: note: (near initialization for 'sys_call_table[9]')
      12 | #define __SYSCALL(nr, call) [nr] = (call),
         |                                    ^
   ./arch/nios2/include/generated/asm/syscall_table_32.h:10:1: note: in expansion of macro '__SYSCALL'
      10 | __SYSCALL(9, sys_lgetxattr)
         | ^~~~~~~~~
>> arch/nios2/kernel/syscall_table.c:12:36: error: initialized field overwritten [-Werror=override-init]
      12 | #define __SYSCALL(nr, call) [nr] = (call),
         |                                    ^
   ./arch/nios2/include/generated/asm/syscall_table_32.h:11:1: note: in expansion of macro '__SYSCALL'
      11 | __SYSCALL(10, sys_fgetxattr)
         | ^~~~~~~~~
   arch/nios2/kernel/syscall_table.c:12:36: note: (near initialization for 'sys_call_table[10]')
      12 | #define __SYSCALL(nr, call) [nr] = (call),
         |                                    ^
   ./arch/nios2/include/generated/asm/syscall_table_32.h:11:1: note: in expansion of macro '__SYSCALL'
      11 | __SYSCALL(10, sys_fgetxattr)
         | ^~~~~~~~~
>> arch/nios2/kernel/syscall_table.c:12:36: error: initialized field overwritten [-Werror=override-init]
      12 | #define __SYSCALL(nr, call) [nr] = (call),
         |                                    ^
   ./arch/nios2/include/generated/asm/syscall_table_32.h:12:1: note: in expansion of macro '__SYSCALL'
      12 | __SYSCALL(11, sys_listxattr)
         | ^~~~~~~~~
   arch/nios2/kernel/syscall_table.c:12:36: note: (near initialization for 'sys_call_table[11]')
      12 | #define __SYSCALL(nr, call) [nr] = (call),
         |                                    ^
   ./arch/nios2/include/generated/asm/syscall_table_32.h:12:1: note: in expansion of macro '__SYSCALL'
      12 | __SYSCALL(11, sys_listxattr)
         | ^~~~~~~~~
>> arch/nios2/kernel/syscall_table.c:12:36: error: initialized field overwritten [-Werror=override-init]
      12 | #define __SYSCALL(nr, call) [nr] = (call),
         |                                    ^
   ./arch/nios2/include/generated/asm/syscall_table_32.h:13:1: note: in expansion of macro '__SYSCALL'
      13 | __SYSCALL(12, sys_llistxattr)
         | ^~~~~~~~~
   arch/nios2/kernel/syscall_table.c:12:36: note: (near initialization for 'sys_call_table[12]')
      12 | #define __SYSCALL(nr, call) [nr] = (call),
         |                                    ^
   ./arch/nios2/include/generated/asm/syscall_table_32.h:13:1: note: in expansion of macro '__SYSCALL'
      13 | __SYSCALL(12, sys_llistxattr)
         | ^~~~~~~~~
>> arch/nios2/kernel/syscall_table.c:12:36: error: initialized field overwritten [-Werror=override-init]
      12 | #define __SYSCALL(nr, call) [nr] = (call),
         |                                    ^
   ./arch/nios2/include/generated/asm/syscall_table_32.h:14:1: note: in expansion of macro '__SYSCALL'
      14 | __SYSCALL(13, sys_flistxattr)
         | ^~~~~~~~~
   arch/nios2/kernel/syscall_table.c:12:36: note: (near initialization for 'sys_call_table[13]')
      12 | #define __SYSCALL(nr, call) [nr] = (call),
         |                                    ^
   ./arch/nios2/include/generated/asm/syscall_table_32.h:14:1: note: in expansion of macro '__SYSCALL'
      14 | __SYSCALL(13, sys_flistxattr)
         | ^~~~~~~~~
>> arch/nios2/kernel/syscall_table.c:12:36: error: initialized field overwritten [-Werror=override-init]
      12 | #define __SYSCALL(nr, call) [nr] = (call),
         |                                    ^
   ./arch/nios2/include/generated/asm/syscall_table_32.h:15:1: note: in expansion of macro '__SYSCALL'
      15 | __SYSCALL(14, sys_removexattr)
         | ^~~~~~~~~
   arch/nios2/kernel/syscall_table.c:12:36: note: (near initialization for 'sys_call_table[14]')
      12 | #define __SYSCALL(nr, call) [nr] = (call),
         |                                    ^
   ./arch/nios2/include/generated/asm/syscall_table_32.h:15:1: note: in expansion of macro '__SYSCALL'
      15 | __SYSCALL(14, sys_removexattr)
         | ^~~~~~~~~
>> arch/nios2/kernel/syscall_table.c:12:36: error: initialized field overwritten [-Werror=override-init]
      12 | #define __SYSCALL(nr, call) [nr] = (call),
         |                                    ^
   ./arch/nios2/include/generated/asm/syscall_table_32.h:16:1: note: in expansion of macro '__SYSCALL'
      16 | __SYSCALL(15, sys_lremovexattr)
         | ^~~~~~~~~
   arch/nios2/kernel/syscall_table.c:12:36: note: (near initialization for 'sys_call_table[15]')
      12 | #define __SYSCALL(nr, call) [nr] = (call),
         |                                    ^
   ./arch/nios2/include/generated/asm/syscall_table_32.h:16:1: note: in expansion of macro '__SYSCALL'
      16 | __SYSCALL(15, sys_lremovexattr)
         | ^~~~~~~~~
>> arch/nios2/kernel/syscall_table.c:12:36: error: initialized field overwritten [-Werror=override-init]
      12 | #define __SYSCALL(nr, call) [nr] = (call),
         |                                    ^
   ./arch/nios2/include/generated/asm/syscall_table_32.h:17:1: note: in expansion of macro '__SYSCALL'
      17 | __SYSCALL(16, sys_fremovexattr)
         | ^~~~~~~~~
   arch/nios2/kernel/syscall_table.c:12:36: note: (near initialization for 'sys_call_table[16]')
      12 | #define __SYSCALL(nr, call) [nr] = (call),
         |                                    ^
   ./arch/nios2/include/generated/asm/syscall_table_32.h:17:1: note: in expansion of macro '__SYSCALL'
      17 | __SYSCALL(16, sys_fremovexattr)
         | ^~~~~~~~~
>> arch/nios2/kernel/syscall_table.c:12:36: error: initialized field overwritten [-Werror=override-init]
      12 | #define __SYSCALL(nr, call) [nr] = (call),
         |                                    ^
   ./arch/nios2/include/generated/asm/syscall_table_32.h:18:1: note: in expansion of macro '__SYSCALL'
      18 | __SYSCALL(17, sys_getcwd)
         | ^~~~~~~~~
   arch/nios2/kernel/syscall_table.c:12:36: note: (near initialization for 'sys_call_table[17]')
      12 | #define __SYSCALL(nr, call) [nr] = (call),
         |                                    ^
   ./arch/nios2/include/generated/asm/syscall_table_32.h:18:1: note: in expansion of macro '__SYSCALL'
      18 | __SYSCALL(17, sys_getcwd)
         | ^~~~~~~~~
>> arch/nios2/kernel/syscall_table.c:12:36: error: initialized field overwritten [-Werror=override-init]
      12 | #define __SYSCALL(nr, call) [nr] = (call),
         |                                    ^
   ./arch/nios2/include/generated/asm/syscall_table_32.h:19:1: note: in expansion of macro '__SYSCALL'
      19 | __SYSCALL(18, sys_ni_syscall)
         | ^~~~~~~~~
   arch/nios2/kernel/syscall_table.c:12:36: note: (near initialization for 'sys_call_table[18]')
      12 | #define __SYSCALL(nr, call) [nr] = (call),
         |                                    ^
   ./arch/nios2/include/generated/asm/syscall_table_32.h:19:1: note: in expansion of macro '__SYSCALL'
      19 | __SYSCALL(18, sys_ni_syscall)
         | ^~~~~~~~~
>> arch/nios2/kernel/syscall_table.c:12:36: error: initialized field overwritten [-Werror=override-init]
      12 | #define __SYSCALL(nr, call) [nr] = (call),
         |                                    ^
   ./arch/nios2/include/generated/asm/syscall_table_32.h:20:1: note: in expansion of macro '__SYSCALL'
      20 | __SYSCALL(19, sys_eventfd2)
         | ^~~~~~~~~
   arch/nios2/kernel/syscall_table.c:12:36: note: (near initialization for 'sys_call_table[19]')
      12 | #define __SYSCALL(nr, call) [nr] = (call),
         |                                    ^
   ./arch/nios2/include/generated/asm/syscall_table_32.h:20:1: note: in expansion of macro '__SYSCALL'
      20 | __SYSCALL(19, sys_eventfd2)
         | ^~~~~~~~~
   arch/nios2/kernel/syscall_table.c:12:36: error: initialized field overwritten [-Werror=override-init]
      12 | #define __SYSCALL(nr, call) [nr] = (call),
         |                                    ^
   ./arch/nios2/include/generated/asm/syscall_table_32.h:21:1: note: in expansion of macro '__SYSCALL'
      21 | __SYSCALL(20, sys_epoll_create1)
         | ^~~~~~~~~
   arch/nios2/kernel/syscall_table.c:12:36: note: (near initialization for 'sys_call_table[20]')
      12 | #define __SYSCALL(nr, call) [nr] = (call),
         |                                    ^
   ./arch/nios2/include/generated/asm/syscall_table_32.h:21:1: note: in expansion of macro '__SYSCALL'
      21 | __SYSCALL(20, sys_epoll_create1)
         | ^~~~~~~~~
   arch/nios2/kernel/syscall_table.c:12:36: error: initialized field overwritten [-Werror=override-init]
      12 | #define __SYSCALL(nr, call) [nr] = (call),
         |                                    ^
   ./arch/nios2/include/generated/asm/syscall_table_32.h:22:1: note: in expansion of macro '__SYSCALL'
      22 | __SYSCALL(21, sys_epoll_ctl)
         | ^~~~~~~~~
   arch/nios2/kernel/syscall_table.c:12:36: note: (near initialization for 'sys_call_table[21]')
      12 | #define __SYSCALL(nr, call) [nr] = (call),
         |                                    ^
   ./arch/nios2/include/generated/asm/syscall_table_32.h:22:1: note: in expansion of macro '__SYSCALL'
      22 | __SYSCALL(21, sys_epoll_ctl)
         | ^~~~~~~~~
   arch/nios2/kernel/syscall_table.c:12:36: error: initialized field overwritten [-Werror=override-init]
      12 | #define __SYSCALL(nr, call) [nr] = (call),
         |                                    ^
   arch/nios2/kernel/syscall_table.c:13:58: note: in expansion of macro '__SYSCALL'
      13 | #define __SYSCALL_WITH_COMPAT(nr, native, compat)        __SYSCALL(nr, native)
         |                                                          ^~~~~~~~~
   ./arch/nios2/include/generated/asm/syscall_table_32.h:23:1: note: in expansion of macro '__SYSCALL_WITH_COMPAT'
      23 | __SYSCALL_WITH_COMPAT(22, sys_epoll_pwait, compat_sys_epoll_pwait)
         | ^~~~~~~~~~~~~~~~~~~~~
   arch/nios2/kernel/syscall_table.c:12:36: note: (near initialization for 'sys_call_table[22]')
      12 | #define __SYSCALL(nr, call) [nr] = (call),
         |                                    ^
   arch/nios2/kernel/syscall_table.c:13:58: note: in expansion of macro '__SYSCALL'
      13 | #define __SYSCALL_WITH_COMPAT(nr, native, compat)        __SYSCALL(nr, native)
         |                                                          ^~~~~~~~~
   ./arch/nios2/include/generated/asm/syscall_table_32.h:23:1: note: in expansion of macro '__SYSCALL_WITH_COMPAT'
      23 | __SYSCALL_WITH_COMPAT(22, sys_epoll_pwait, compat_sys_epoll_pwait)
         | ^~~~~~~~~~~~~~~~~~~~~
   arch/nios2/kernel/syscall_table.c:12:36: error: initialized field overwritten [-Werror=override-init]
      12 | #define __SYSCALL(nr, call) [nr] = (call),
         |                                    ^
   ./arch/nios2/include/generated/asm/syscall_table_32.h:24:1: note: in expansion of macro '__SYSCALL'
      24 | __SYSCALL(23, sys_dup)
         | ^~~~~~~~~
   arch/nios2/kernel/syscall_table.c:12:36: note: (near initialization for 'sys_call_table[23]')
      12 | #define __SYSCALL(nr, call) [nr] = (call),
         |                                    ^
   ./arch/nios2/include/generated/asm/syscall_table_32.h:24:1: note: in expansion of macro '__SYSCALL'
      24 | __SYSCALL(23, sys_dup)
         | ^~~~~~~~~
   arch/nios2/kernel/syscall_table.c:12:36: error: initialized field overwritten [-Werror=override-init]
      12 | #define __SYSCALL(nr, call) [nr] = (call),
         |                                    ^
   ./arch/nios2/include/generated/asm/syscall_table_32.h:25:1: note: in expansion of macro '__SYSCALL'
      25 | __SYSCALL(24, sys_dup3)
         | ^~~~~~~~~
   arch/nios2/kernel/syscall_table.c:12:36: note: (near initialization for 'sys_call_table[24]')
      12 | #define __SYSCALL(nr, call) [nr] = (call),
         |                                    ^
   ./arch/nios2/include/generated/asm/syscall_table_32.h:25:1: note: in expansion of macro '__SYSCALL'
      25 | __SYSCALL(24, sys_dup3)
         | ^~~~~~~~~
   arch/nios2/kernel/syscall_table.c:12:36: error: initialized field overwritten [-Werror=override-init]
      12 | #define __SYSCALL(nr, call) [nr] = (call),
         |                                    ^
   arch/nios2/kernel/syscall_table.c:13:58: note: in expansion of macro '__SYSCALL'
      13 | #define __SYSCALL_WITH_COMPAT(nr, native, compat)        __SYSCALL(nr, native)
         |                                                          ^~~~~~~~~
   ./arch/nios2/include/generated/asm/syscall_table_32.h:26:1: note: in expansion of macro '__SYSCALL_WITH_COMPAT'
      26 | __SYSCALL_WITH_COMPAT(25, sys_fcntl64, compat_sys_fcntl64)
         | ^~~~~~~~~~~~~~~~~~~~~
   arch/nios2/kernel/syscall_table.c:12:36: note: (near initialization for 'sys_call_table[25]')
      12 | #define __SYSCALL(nr, call) [nr] = (call),
         |                                    ^
   arch/nios2/kernel/syscall_table.c:13:58: note: in expansion of macro '__SYSCALL'
      13 | #define __SYSCALL_WITH_COMPAT(nr, native, compat)        __SYSCALL(nr, native)
         |                                                          ^~~~~~~~~
   ./arch/nios2/include/generated/asm/syscall_table_32.h:26:1: note: in expansion of macro '__SYSCALL_WITH_COMPAT'
      26 | __SYSCALL_WITH_COMPAT(25, sys_fcntl64, compat_sys_fcntl64)
         | ^~~~~~~~~~~~~~~~~~~~~
   arch/nios2/kernel/syscall_table.c:12:36: error: initialized field overwritten [-Werror=override-init]
      12 | #define __SYSCALL(nr, call) [nr] = (call),
         |                                    ^
   ./arch/nios2/include/generated/asm/syscall_table_32.h:27:1: note: in expansion of macro '__SYSCALL'
      27 | __SYSCALL(26, sys_inotify_init1)
..


vim +/memcpy +160 arch/nios2/lib/memcpy.c

eea9507a69d637 Ley Foon Tan 2014-11-06  159  
eea9507a69d637 Ley Foon Tan 2014-11-06 @160  void *memcpy(void *dstpp, const void *srcpp, size_t len)
eea9507a69d637 Ley Foon Tan 2014-11-06  161  {
eea9507a69d637 Ley Foon Tan 2014-11-06  162  	unsigned long int dstp = (long int) dstpp;
eea9507a69d637 Ley Foon Tan 2014-11-06  163  	unsigned long int srcp = (long int) srcpp;
eea9507a69d637 Ley Foon Tan 2014-11-06  164  
eea9507a69d637 Ley Foon Tan 2014-11-06  165  	/* Copy from the beginning to the end.  */
eea9507a69d637 Ley Foon Tan 2014-11-06  166  
eea9507a69d637 Ley Foon Tan 2014-11-06  167  	/* If there not too few bytes to copy, use word copy.  */
eea9507a69d637 Ley Foon Tan 2014-11-06  168  	if (len >= OP_T_THRES) {
eea9507a69d637 Ley Foon Tan 2014-11-06  169  		/* Copy just a few bytes to make DSTP aligned.  */
eea9507a69d637 Ley Foon Tan 2014-11-06  170  		len -= (-dstp) % OPSIZ;
eea9507a69d637 Ley Foon Tan 2014-11-06  171  		BYTE_COPY_FWD(dstp, srcp, (-dstp) % OPSIZ);
eea9507a69d637 Ley Foon Tan 2014-11-06  172  
eea9507a69d637 Ley Foon Tan 2014-11-06  173  		/* Copy whole pages from SRCP to DSTP by virtual address
eea9507a69d637 Ley Foon Tan 2014-11-06  174  		   manipulation, as much as possible.  */
eea9507a69d637 Ley Foon Tan 2014-11-06  175  
eea9507a69d637 Ley Foon Tan 2014-11-06  176  		/* PAGE_COPY_FWD_MAYBE (dstp, srcp, len, len); */
eea9507a69d637 Ley Foon Tan 2014-11-06  177  
eea9507a69d637 Ley Foon Tan 2014-11-06  178  		/* Copy from SRCP to DSTP taking advantage of the known
eea9507a69d637 Ley Foon Tan 2014-11-06  179  		   alignment of DSTP. Number of bytes remaining is put in the
eea9507a69d637 Ley Foon Tan 2014-11-06  180  		   third argument, i.e. in LEN.  This number may vary from
eea9507a69d637 Ley Foon Tan 2014-11-06  181  		   machine to machine. */
eea9507a69d637 Ley Foon Tan 2014-11-06  182  
eea9507a69d637 Ley Foon Tan 2014-11-06  183  		WORD_COPY_FWD(dstp, srcp, len, len);
eea9507a69d637 Ley Foon Tan 2014-11-06  184  
eea9507a69d637 Ley Foon Tan 2014-11-06  185  		/* Fall out and copy the tail. */
eea9507a69d637 Ley Foon Tan 2014-11-06  186  	}
eea9507a69d637 Ley Foon Tan 2014-11-06  187  
eea9507a69d637 Ley Foon Tan 2014-11-06  188  	/* There are just a few bytes to copy.  Use byte memory operations. */
eea9507a69d637 Ley Foon Tan 2014-11-06  189  	BYTE_COPY_FWD(dstp, srcp, len);
eea9507a69d637 Ley Foon Tan 2014-11-06  190  
eea9507a69d637 Ley Foon Tan 2014-11-06  191  	return dstpp;
eea9507a69d637 Ley Foon Tan 2014-11-06  192  }
eea9507a69d637 Ley Foon Tan 2014-11-06  193  
eea9507a69d637 Ley Foon Tan 2014-11-06 @194  void *memcpyb(void *dstpp, const void *srcpp, unsigned len)

:::::: The code at line 160 was first introduced by commit
:::::: eea9507a69d637d52705de8703b168bf6bfe5643 nios2: Library functions

:::::: TO: Ley Foon Tan <lftan@altera.com>
:::::: CC: Ley Foon Tan <lftan@altera.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
