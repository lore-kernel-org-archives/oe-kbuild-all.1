Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793435813;
	b=5VFQrCfbc8olZ4pRt8weCLvQh7iKD9hu0JVRWfgZzYVSgH0cvVJyCDk96TuaDjZPMc7l
	 ftIuqy1jbtbdVKkmtoutog/c4hWaZzF4tQGaa+qZpMEOnx8LbiKewdqp6YXHicbGaqg7C
	 TP9PwYe0FPJ5FLDoW2HBE5Ia+B8MoZ8Z5wpjZbmBRHrmrWE1R7iHnPeOkUsA15DSVWhyN
	 tuqEucWkpjdqu6hOkoGc3YjvFlLiHXD6wVU+idOlNmKrs3s778uSAVdrUh4d+bL0zcVez
	 fxmDr7XsGU3IVrdhM9MIKGvB1fzF9UxUUyUJ+t5vsrfv5YVtom5lqEjdTAkKv0t98Eg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793435813;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=bJgvSlNrNKH1NoDZY0nuEfgdStiOApNnubWTBDknRnI=;
	b=r4lsn937PrjR2Tp6aX6cnJ7CBNuaASyPCFhN926h5CPrPKsrjhmXlCsxEG+MiLVCakkx
	 fkD4baQXdSXx5eqGb0GBd9OD0kGm+R7yB3/aHWNSMdrOZJxqpFQOt468hSUCatyRZAppa
	 9dcuZffujKwycFYMu9fY3UOvIqixqOOufWDQv6DufBr56As8Gsl6i1GfYpNzbZGXsTTqg
	 TU6rxKrKicQ7rYBu+kXs2X6wJW/CuB2nlgtKY+ltMj5IXXc02tWuVkxHfM/tIwEoQUALt
	 MOZC0H4PsdAkSIS90pVbOF4YsBovFLoh0cGDMePbxC34cGghtu4E0x/8lBMC5Btiu3Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Gtk9xW2O;
	arc=none smtp.remote-ip=198.175.65.11
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70B7B606A31D
	for <oe-kbuild-all@lists.linux.dev>; Sat, 31 Oct 2026 08:36:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 70B7B606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Gtk9xW2O
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793435811; x=1824971811;
  h=date:from:to:cc:subject:message-id;
  bh=dtvVYbFvIDyClFn9yLxM4QhxjXgihlmypuRixwz0OHQ=;
  b=Gtk9xW2OXfs8azdG4QDuMA5qPxtEJgryiwbksijmrFoT6pgYoOusAcKN
   XApR/g9RRNT0idyfJYq6xZxbN1Bn2D5ZnkaBlXNDuS6xhNDayZyCeVzet
   Bo3eJQ3pvv2Px14l2tjl/W5E02Y/DtixWs2JVi8jM4ZQDd5vTzDtSn5CB
   qJRgtM3Xf1/BYwgLwQNGYLaBXGBKcYiLe1RCu1fULeKzhR/pMAMco9uR+
   EzcgzxPPnxmdCRSZZDPpNGzP4JopsDSn2Fnky+aATFXEsO9NJ8aBbjMpH
   qpSgtRAqKvwhRY8ETQhLVSX2SOCtbZE5LjXHtDpdL2ScTN3i43wHJQs0n
   g==;
X-CSE-ConnectionGUID: MGv26MIERFWoHawDnAFBaQ==
X-CSE-MsgGUID: L1DjmQXVRyaY0M1UGSh2oQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11951"; a="2073553"
X-IronPort-AV: E=Sophos;i="6.27,186,1787036400"; 
   d="scan'208";a="2073553"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Oct 2026 01:36:51 -0700
X-CSE-ConnectionGUID: mphRazFYQZepekTuwCYghA==
X-CSE-MsgGUID: q+ktFgiNTK2IKryNULnS7Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,186,1787036400"; 
   d="scan'208";a="7454246"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa013.fm.intel.com with ESMTP; 31 Oct 2026 01:36:49 -0700
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xN4Zy-00000000cfc-19P3;
	Sat, 31 Oct 2026 08:36:46 +0000
Date: Sat, 31 Oct 2026 16:36:43 +0800
From: kernel test robot <lkp@intel.com>
To: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>,
 Linux Memory Management List <linux-mm@kvack.org>,
 "Christian Brauner (Amutable)" <brauner@kernel.org>
Subject: arch/riscv/include/asm/syscall_wrapper.h:35:14: warning:
 '__se_sys_userfaultfd' alias between functions of incompatible types 'long
 int(ulong,  ulong,  ulong,  ulong,  ulong,  ulong,  ulong)' {aka 'long
 int(long unsigned int,  long unsigned int,  long uns...
Message-ID: <202610311814.sISpHHXr-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

Hi Mike,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   2a500a04d6f969318c05f46aedb6e73fc1963a00
commit: 7bc5e747bba29d5b77b2278e8c696eea0c796706 userfaultfd: merge fs/userfaultfd.c into mm/userfaultfd.c
date:   5 months ago
config: riscv-randconfig-1000-20261031 (https://download.01.org/0day-ci/archive/20261031/202610311814.sISpHHXr-lkp@intel.com/config)
compiler: riscv32-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261031/202610311814.sISpHHXr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 7bc5e747bba2 ("userfaultfd: merge fs/userfaultfd.c into mm/userfaultfd.c")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610311814.sISpHHXr-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/compat.h:34,
                    from arch/riscv/include/asm/elf.h:12,
                    from include/linux/elf.h:6,
                    from include/linux/module.h:20,
                    from include/linux/device/driver.h:21,
                    from include/linux/device.h:32,
                    from include/linux/blk_types.h:11,
                    from include/linux/writeback.h:13,
                    from include/linux/memcontrol.h:23,
                    from include/linux/rmap.h:12,
                    from mm/userfaultfd.c:16:
>> arch/riscv/include/asm/syscall_wrapper.h:35:14: warning: '__se_sys_userfaultfd' alias between functions of incompatible types 'long int(ulong,  ulong,  ulong,  ulong,  ulong,  ulong,  ulong)' {aka 'long int(long unsigned int,  long unsigned int,  long unsigned int,  long unsigned int,  long unsigned int,  long unsigned int,  long unsigned int)'} and 'long int(long int)' [-Wattribute-alias]
     static long __se_##prefix##name(ulong, ulong, ulong, ulong, ulong, ulong,  \
                 ^~~~~
   arch/riscv/include/asm/syscall_wrapper.h:82:2: note: in expansion of macro '__SYSCALL_SE_DEFINEx'
     __SYSCALL_SE_DEFINEx(x, sys, name, __VA_ARGS__)    \
     ^~~~~~~~~~~~~~~~~~~~
   include/linux/syscalls.h:236:2: note: in expansion of macro '__SYSCALL_DEFINEx'
     __SYSCALL_DEFINEx(x, sname, __VA_ARGS__)
     ^~~~~~~~~~~~~~~~~
   include/linux/syscalls.h:225:36: note: in expansion of macro 'SYSCALL_DEFINEx'
    #define SYSCALL_DEFINE1(name, ...) SYSCALL_DEFINEx(1, _##name, __VA_ARGS__)
                                       ^~~~~~~~~~~~~~~
   mm/userfaultfd.c:4475:1: note: in expansion of macro 'SYSCALL_DEFINE1'
    SYSCALL_DEFINE1(userfaultfd, int, flags)
    ^~~~~~~~~~~~~~~
   arch/riscv/include/asm/syscall_wrapper.h:41:14: note: aliased declaration here
     static long ___se_##prefix##name(__MAP(x,__SC_LONG,__VA_ARGS__))
                 ^~~~~~
   arch/riscv/include/asm/syscall_wrapper.h:82:2: note: in expansion of macro '__SYSCALL_SE_DEFINEx'
     __SYSCALL_SE_DEFINEx(x, sys, name, __VA_ARGS__)    \
     ^~~~~~~~~~~~~~~~~~~~
   include/linux/syscalls.h:236:2: note: in expansion of macro '__SYSCALL_DEFINEx'
     __SYSCALL_DEFINEx(x, sname, __VA_ARGS__)
     ^~~~~~~~~~~~~~~~~
   include/linux/syscalls.h:225:36: note: in expansion of macro 'SYSCALL_DEFINEx'
    #define SYSCALL_DEFINE1(name, ...) SYSCALL_DEFINEx(1, _##name, __VA_ARGS__)
                                       ^~~~~~~~~~~~~~~
   mm/userfaultfd.c:4475:1: note: in expansion of macro 'SYSCALL_DEFINE1'
    SYSCALL_DEFINE1(userfaultfd, int, flags)
    ^~~~~~~~~~~~~~~


vim +35 arch/riscv/include/asm/syscall_wrapper.h

a9ad73295cc1e3a Sami Tolvanen 2024-03-11  16  
a9ad73295cc1e3a Sami Tolvanen 2024-03-11  17  #define __SYSCALL_SE_DEFINEx(x, prefix, name, ...)					\
a9ad73295cc1e3a Sami Tolvanen 2024-03-11  18  	static long __se_##prefix##name(__MAP(x,__SC_LONG,__VA_ARGS__));		\
a9ad73295cc1e3a Sami Tolvanen 2024-03-11  19  	static long __se_##prefix##name(__MAP(x,__SC_LONG,__VA_ARGS__))
a9ad73295cc1e3a Sami Tolvanen 2024-03-11  20  
08d0ce30e0e4fcb Sami Tolvanen 2023-07-10  21  #define SC_RISCV_REGS_TO_ARGS(x, ...)							\
08d0ce30e0e4fcb Sami Tolvanen 2023-07-10  22  	__MAP(x,__SC_ARGS								\
08d0ce30e0e4fcb Sami Tolvanen 2023-07-10  23  	      ,,regs->orig_a0,,regs->a1,,regs->a2					\
08d0ce30e0e4fcb Sami Tolvanen 2023-07-10  24  	      ,,regs->a3,,regs->a4,,regs->a5,,regs->a6)
08d0ce30e0e4fcb Sami Tolvanen 2023-07-10  25  
a9ad73295cc1e3a Sami Tolvanen 2024-03-11  26  #else
a9ad73295cc1e3a Sami Tolvanen 2024-03-11  27  /*
a9ad73295cc1e3a Sami Tolvanen 2024-03-11  28   * Use type aliasing to ensure registers a0-a6 are correctly passed to the syscall
a9ad73295cc1e3a Sami Tolvanen 2024-03-11  29   * implementation when >word-size arguments are used.
a9ad73295cc1e3a Sami Tolvanen 2024-03-11  30   */
a9ad73295cc1e3a Sami Tolvanen 2024-03-11  31  #define __SYSCALL_SE_DEFINEx(x, prefix, name, ...)					\
a9ad73295cc1e3a Sami Tolvanen 2024-03-11  32  	__diag_push();									\
a9ad73295cc1e3a Sami Tolvanen 2024-03-11  33  	__diag_ignore(GCC, 8, "-Wattribute-alias",					\
a9ad73295cc1e3a Sami Tolvanen 2024-03-11  34  			"Type aliasing is used to sanitize syscall arguments");		\
a9ad73295cc1e3a Sami Tolvanen 2024-03-11 @35  	static long __se_##prefix##name(ulong, ulong, ulong, ulong, ulong, ulong, 	\
a9ad73295cc1e3a Sami Tolvanen 2024-03-11  36  					ulong)						\
a9ad73295cc1e3a Sami Tolvanen 2024-03-11  37  			__attribute__((alias(__stringify(___se_##prefix##name))));	\
a9ad73295cc1e3a Sami Tolvanen 2024-03-11  38  	__diag_pop();									\
653650c468be211 Sami Tolvanen 2024-03-26  39  	static long noinline ___se_##prefix##name(__MAP(x,__SC_LONG,__VA_ARGS__))	\
653650c468be211 Sami Tolvanen 2024-03-26  40  			__used;								\
a9ad73295cc1e3a Sami Tolvanen 2024-03-11  41  	static long ___se_##prefix##name(__MAP(x,__SC_LONG,__VA_ARGS__))
a9ad73295cc1e3a Sami Tolvanen 2024-03-11  42  

:::::: The code at line 35 was first introduced by commit
:::::: a9ad73295cc1e3af0253eee7d08943b2419444c4 riscv: Fix syscall wrapper for >word-size arguments

:::::: TO: Sami Tolvanen <samitolvanen@google.com>
:::::: CC: Palmer Dabbelt <palmer@rivosinc.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
