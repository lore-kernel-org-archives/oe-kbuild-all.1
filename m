Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E0133DA7E6
	for <oe-kbuild-all@lists.linux.dev>; Tue, 20 Jan 2026 10:49:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768906201; cv=none; b=TiYrL1MBtMbjLK9eFgopHvZaBSTDHQL1JUncMTBnY/t+2/WihRl2HpO+Cy7o1O36SVKldYchcacb82eDzr8yKBdSj7TrrBt30j9C1AbxTThd57LxMlJB0VDFlsLW3CnmxEy7j7qEJ4KXsk69zkyJf9vHEILQ9gNIDYcdObPc7qc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768906201; c=relaxed/simple;
	bh=O2HboW/ci6htRoh1AhL0dwIKYa3i9wriyXERpjbktug=;
	h=Date:From:To:Cc:Subject:Message-ID; b=FtD+dEDCAIWWkiNfpemA1rplABZuZ4q+HR6K3oD17D7qU0unZ9VFU6WQ8kHLsREJ4Rxu1q71K92dqErIE7gJjd/CgvxkTFejaBkSb8wgBdKJ6527+G605bPuqSx1XeK3rJjYy0fitce5U1qZMqgGci+WHS1dJDdIrknG1WXckBs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eAWovKP1; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eAWovKP1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768906199; x=1800442199;
  h=date:from:to:cc:subject:message-id;
  bh=O2HboW/ci6htRoh1AhL0dwIKYa3i9wriyXERpjbktug=;
  b=eAWovKP1KYaMRLfxXTaF4jaByqnvMTdUk95YS7Bi5tauUBM2CaOwP8RC
   UBS9PZ3RuMagZirkJFINgNg0/fq7OKHMXQOx2TiORFIBWRMqs+WCB9GPr
   hziMXwIJcQIo1DTrfwswzPyJ/bMKPQYff8/pXBwd7wvyaARU5oQOF74Xk
   if4NLbIUfFsH55MoA6IPWoUZKPllWGP3q25RMWeQNNrCzQ4rLKr/N1vdD
   T4WX2EVhktJSj/yqaadW4GSYLcM9PcdcoLeOsWyIAOabAyHpa+W5zMnlH
   ovhZ0VQi+qim6v29yyKSwfhBc8yX+OOJTXRVKph2u16p0+427bfaJj9vQ
   A==;
X-CSE-ConnectionGUID: jzaw0ksOQaSiOyhvvJ1YDA==
X-CSE-MsgGUID: 3vROExMVT5+IybeyKWT4aw==
X-IronPort-AV: E=McAfee;i="6800,10657,11676"; a="95585344"
X-IronPort-AV: E=Sophos;i="6.21,240,1763452800"; 
   d="scan'208";a="95585344"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jan 2026 02:49:58 -0800
X-CSE-ConnectionGUID: 80M0sgUMQ62kBOjDcTTZJg==
X-CSE-MsgGUID: nkjecIJqRiG+NWYnvTQ/OA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,240,1763452800"; 
   d="scan'208";a="236774852"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 20 Jan 2026 02:49:56 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vi9J3-00000000Oql-1di2;
	Tue, 20 Jan 2026 10:49:53 +0000
Date: Tue, 20 Jan 2026 18:49:26 +0800
From: kernel test robot <lkp@intel.com>
To: Andrey Albershteyn <aalbersh@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Christian Brauner <brauner@kernel.org>
Subject: arch/riscv/include/asm/syscall_wrapper.h:35:14: warning:
 '__se_sys_file_getattr' alias between functions of incompatible types 'long
 int(ulong,  ulong,  ulong,  ulong,  ulong,  ulong,  ulong)' {aka 'long
 int(long unsigned int,  long unsigned int,  long un...
Message-ID: <202601201810.nUSKJLDE-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   24d479d26b25bce5faea3ddd9fa8f3a6c3129ea7
commit: be7efb2d20d67f334a7de2aef77ae6c69367e646 fs: introduce file_getattr and file_setattr syscalls
date:   7 months ago
config: riscv-randconfig-r063-20260120 (https://download.01.org/0day-ci/archive/20260120/202601201810.nUSKJLDE-lkp@intel.com/config)
compiler: riscv32-linux-gcc (GCC) 9.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260120/202601201810.nUSKJLDE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601201810.nUSKJLDE-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/compat.h:34,
                    from arch/riscv/include/asm/elf.h:12,
                    from include/linux/elf.h:6,
                    from include/linux/module.h:19,
                    from include/linux/bpf.h:20,
                    from include/linux/security.h:35,
                    from fs/file_attr.c:3:
>> arch/riscv/include/asm/syscall_wrapper.h:35:14: warning: '__se_sys_file_getattr' alias between functions of incompatible types 'long int(ulong,  ulong,  ulong,  ulong,  ulong,  ulong,  ulong)' {aka 'long int(long unsigned int,  long unsigned int,  long unsigned int,  long unsigned int,  long unsigned int,  long unsigned int,  long unsigned int)'} and 'long int(long int,  long int,  long int,  long int,  long int)' [-Wattribute-alias=]
      35 |  static long __se_##prefix##name(ulong, ulong, ulong, ulong, ulong, ulong,  \
         |              ^~~~~
   arch/riscv/include/asm/syscall_wrapper.h:82:2: note: in expansion of macro '__SYSCALL_SE_DEFINEx'
      82 |  __SYSCALL_SE_DEFINEx(x, sys, name, __VA_ARGS__)    \
         |  ^~~~~~~~~~~~~~~~~~~~
   include/linux/syscalls.h:236:2: note: in expansion of macro '__SYSCALL_DEFINEx'
     236 |  __SYSCALL_DEFINEx(x, sname, __VA_ARGS__)
         |  ^~~~~~~~~~~~~~~~~
   include/linux/syscalls.h:229:36: note: in expansion of macro 'SYSCALL_DEFINEx'
     229 | #define SYSCALL_DEFINE5(name, ...) SYSCALL_DEFINEx(5, _##name, __VA_ARGS__)
         |                                    ^~~~~~~~~~~~~~~
   fs/file_attr.c:382:1: note: in expansion of macro 'SYSCALL_DEFINE5'
     382 | SYSCALL_DEFINE5(file_getattr, int, dfd, const char __user *, filename,
         | ^~~~~~~~~~~~~~~
   arch/riscv/include/asm/syscall_wrapper.h:41:14: note: aliased declaration here
      41 |  static long ___se_##prefix##name(__MAP(x,__SC_LONG,__VA_ARGS__))
         |              ^~~~~~
   arch/riscv/include/asm/syscall_wrapper.h:82:2: note: in expansion of macro '__SYSCALL_SE_DEFINEx'
      82 |  __SYSCALL_SE_DEFINEx(x, sys, name, __VA_ARGS__)    \
         |  ^~~~~~~~~~~~~~~~~~~~
   include/linux/syscalls.h:236:2: note: in expansion of macro '__SYSCALL_DEFINEx'
     236 |  __SYSCALL_DEFINEx(x, sname, __VA_ARGS__)
         |  ^~~~~~~~~~~~~~~~~
   include/linux/syscalls.h:229:36: note: in expansion of macro 'SYSCALL_DEFINEx'
     229 | #define SYSCALL_DEFINE5(name, ...) SYSCALL_DEFINEx(5, _##name, __VA_ARGS__)
         |                                    ^~~~~~~~~~~~~~~
   fs/file_attr.c:382:1: note: in expansion of macro 'SYSCALL_DEFINE5'
     382 | SYSCALL_DEFINE5(file_getattr, int, dfd, const char __user *, filename,
         | ^~~~~~~~~~~~~~~
>> arch/riscv/include/asm/syscall_wrapper.h:35:14: warning: '__se_sys_file_setattr' alias between functions of incompatible types 'long int(ulong,  ulong,  ulong,  ulong,  ulong,  ulong,  ulong)' {aka 'long int(long unsigned int,  long unsigned int,  long unsigned int,  long unsigned int,  long unsigned int,  long unsigned int,  long unsigned int)'} and 'long int(long int,  long int,  long int,  long int,  long int)' [-Wattribute-alias=]
      35 |  static long __se_##prefix##name(ulong, ulong, ulong, ulong, ulong, ulong,  \
         |              ^~~~~
   arch/riscv/include/asm/syscall_wrapper.h:82:2: note: in expansion of macro '__SYSCALL_SE_DEFINEx'
      82 |  __SYSCALL_SE_DEFINEx(x, sys, name, __VA_ARGS__)    \
         |  ^~~~~~~~~~~~~~~~~~~~
   include/linux/syscalls.h:236:2: note: in expansion of macro '__SYSCALL_DEFINEx'
     236 |  __SYSCALL_DEFINEx(x, sname, __VA_ARGS__)
         |  ^~~~~~~~~~~~~~~~~
   include/linux/syscalls.h:229:36: note: in expansion of macro 'SYSCALL_DEFINEx'
     229 | #define SYSCALL_DEFINE5(name, ...) SYSCALL_DEFINEx(5, _##name, __VA_ARGS__)
         |                                    ^~~~~~~~~~~~~~~
   fs/file_attr.c:437:1: note: in expansion of macro 'SYSCALL_DEFINE5'
     437 | SYSCALL_DEFINE5(file_setattr, int, dfd, const char __user *, filename,
         | ^~~~~~~~~~~~~~~
   arch/riscv/include/asm/syscall_wrapper.h:41:14: note: aliased declaration here
      41 |  static long ___se_##prefix##name(__MAP(x,__SC_LONG,__VA_ARGS__))
         |              ^~~~~~
   arch/riscv/include/asm/syscall_wrapper.h:82:2: note: in expansion of macro '__SYSCALL_SE_DEFINEx'
      82 |  __SYSCALL_SE_DEFINEx(x, sys, name, __VA_ARGS__)    \
         |  ^~~~~~~~~~~~~~~~~~~~
   include/linux/syscalls.h:236:2: note: in expansion of macro '__SYSCALL_DEFINEx'
     236 |  __SYSCALL_DEFINEx(x, sname, __VA_ARGS__)
         |  ^~~~~~~~~~~~~~~~~
   include/linux/syscalls.h:229:36: note: in expansion of macro 'SYSCALL_DEFINEx'
     229 | #define SYSCALL_DEFINE5(name, ...) SYSCALL_DEFINEx(5, _##name, __VA_ARGS__)
         |                                    ^~~~~~~~~~~~~~~
   fs/file_attr.c:437:1: note: in expansion of macro 'SYSCALL_DEFINE5'
     437 | SYSCALL_DEFINE5(file_setattr, int, dfd, const char __user *, filename,
         | ^~~~~~~~~~~~~~~


vim +35 arch/riscv/include/asm/syscall_wrapper.h

a9ad73295cc1e3 Sami Tolvanen 2024-03-11  16  
a9ad73295cc1e3 Sami Tolvanen 2024-03-11  17  #define __SYSCALL_SE_DEFINEx(x, prefix, name, ...)					\
a9ad73295cc1e3 Sami Tolvanen 2024-03-11  18  	static long __se_##prefix##name(__MAP(x,__SC_LONG,__VA_ARGS__));		\
a9ad73295cc1e3 Sami Tolvanen 2024-03-11  19  	static long __se_##prefix##name(__MAP(x,__SC_LONG,__VA_ARGS__))
a9ad73295cc1e3 Sami Tolvanen 2024-03-11  20  
08d0ce30e0e4fc Sami Tolvanen 2023-07-10  21  #define SC_RISCV_REGS_TO_ARGS(x, ...)							\
08d0ce30e0e4fc Sami Tolvanen 2023-07-10  22  	__MAP(x,__SC_ARGS								\
08d0ce30e0e4fc Sami Tolvanen 2023-07-10  23  	      ,,regs->orig_a0,,regs->a1,,regs->a2					\
08d0ce30e0e4fc Sami Tolvanen 2023-07-10  24  	      ,,regs->a3,,regs->a4,,regs->a5,,regs->a6)
08d0ce30e0e4fc Sami Tolvanen 2023-07-10  25  
a9ad73295cc1e3 Sami Tolvanen 2024-03-11  26  #else
a9ad73295cc1e3 Sami Tolvanen 2024-03-11  27  /*
a9ad73295cc1e3 Sami Tolvanen 2024-03-11  28   * Use type aliasing to ensure registers a0-a6 are correctly passed to the syscall
a9ad73295cc1e3 Sami Tolvanen 2024-03-11  29   * implementation when >word-size arguments are used.
a9ad73295cc1e3 Sami Tolvanen 2024-03-11  30   */
a9ad73295cc1e3 Sami Tolvanen 2024-03-11  31  #define __SYSCALL_SE_DEFINEx(x, prefix, name, ...)					\
a9ad73295cc1e3 Sami Tolvanen 2024-03-11  32  	__diag_push();									\
a9ad73295cc1e3 Sami Tolvanen 2024-03-11  33  	__diag_ignore(GCC, 8, "-Wattribute-alias",					\
a9ad73295cc1e3 Sami Tolvanen 2024-03-11  34  			"Type aliasing is used to sanitize syscall arguments");		\
a9ad73295cc1e3 Sami Tolvanen 2024-03-11 @35  	static long __se_##prefix##name(ulong, ulong, ulong, ulong, ulong, ulong, 	\
a9ad73295cc1e3 Sami Tolvanen 2024-03-11  36  					ulong)						\
a9ad73295cc1e3 Sami Tolvanen 2024-03-11  37  			__attribute__((alias(__stringify(___se_##prefix##name))));	\
a9ad73295cc1e3 Sami Tolvanen 2024-03-11  38  	__diag_pop();									\
653650c468be21 Sami Tolvanen 2024-03-26  39  	static long noinline ___se_##prefix##name(__MAP(x,__SC_LONG,__VA_ARGS__))	\
653650c468be21 Sami Tolvanen 2024-03-26  40  			__used;								\
a9ad73295cc1e3 Sami Tolvanen 2024-03-11  41  	static long ___se_##prefix##name(__MAP(x,__SC_LONG,__VA_ARGS__))
a9ad73295cc1e3 Sami Tolvanen 2024-03-11  42  

:::::: The code at line 35 was first introduced by commit
:::::: a9ad73295cc1e3af0253eee7d08943b2419444c4 riscv: Fix syscall wrapper for >word-size arguments

:::::: TO: Sami Tolvanen <samitolvanen@google.com>
:::::: CC: Palmer Dabbelt <palmer@rivosinc.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
