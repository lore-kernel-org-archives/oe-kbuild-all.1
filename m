Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99F773043C5
	for <oe-kbuild-all@lists.linux.dev>; Thu, 30 Oct 2025 19:00:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761850816; cv=none; b=izE/3ArVEY6aV3Uu7FY6oYqsX5mh6nZffQ+CXr1VDHb1ZXbwR/JjrICsWA7ljzPGktOd10iRa+mZRr2aLo88Qy+xu6uZ9e/zpVI5eJpNqW0CHAwQCURoxxxog44Tvpki7qB/Ibl0mHq5kAQmphufEQsKiTtb/0ECBGUxN8nyY7w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761850816; c=relaxed/simple;
	bh=K144nL0QwH1o/7xE4oalbJoc6JVBNADEFXDDiyaCDRE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=m09vAUM0pw8HCY7EP3nFoccoVoCg/r5pz8VXMhAZZMNA5eHLLqtxerMfCoL14KqRXy4yRlYCPrVfybgBdCuhJ34ZUxPChF8X3Zl3aLWCGq8Bq4SxdtBm7WNpszSKH/0qP8CuT1sOkQEwqR8TtIsWoa/XVHWvmp5taKRClvTY3j4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eL6cV1bF; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eL6cV1bF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761850814; x=1793386814;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=K144nL0QwH1o/7xE4oalbJoc6JVBNADEFXDDiyaCDRE=;
  b=eL6cV1bFfeKO08EZmuzwpeQIANPYqUvrNpnwT6QIzB2gf67D90hHSEG3
   4xmSPuGq7EWeFNqWCgZaQFyXj0I9aDW1I/NH6FibMa4qqOnDU0zKulZV8
   /JCBjq6aJnydQLOHc439ptqwuda9w2XzduZSxn7jQxhl+xhyUMWm5cCBh
   QOS3vtg6BAMwRiZ0QmVI2gBOwYr1jXdZKDil1lkLSxZMG/Tomy9xiI9Lq
   w7S08ill9mqXLNcBHei00twl4+r6kQk+HlDW3smPFkJ8SfkVN3ZUTHnFA
   vnKs2/i4ZHRm4JDy57l7/iooptv6Rpob315nd9Rn8yFTpZikkThALtRI2
   w==;
X-CSE-ConnectionGUID: sHi7/NHsSSGXk8CukgIcQg==
X-CSE-MsgGUID: 6tCZhK2FQA6eBvkm6XZ7+g==
X-IronPort-AV: E=McAfee;i="6800,10657,11598"; a="64036982"
X-IronPort-AV: E=Sophos;i="6.19,267,1754982000"; 
   d="scan'208";a="64036982"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Oct 2025 12:00:12 -0700
X-CSE-ConnectionGUID: P7O6RVJ6RaGBUK7an1pgQw==
X-CSE-MsgGUID: mvC1v+7SS0qJ59REbaAusA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,267,1754982000"; 
   d="scan'208";a="191173863"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa005.jf.intel.com with ESMTP; 30 Oct 2025 12:00:10 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vEXsV-000MQO-2l;
	Thu, 30 Oct 2025 19:00:07 +0000
Date: Fri, 31 Oct 2025 02:59:11 +0800
From: kernel test robot <lkp@intel.com>
To: Christian Brauner <brauner@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Christian Brauner <christianvanbrauner@gmail.com>
Subject: [brauner-github:namespace-6.19 22/76]
 arch/riscv/include/asm/syscall_wrapper.h:35:14: warning: '__se_sys_listns'
 alias between functions of incompatible types 'long int(ulong,  ulong,
  ulong,  ulong,  ulong,  ulong,  ulong)' {aka 'long int(long unsigned int,
  long unsigned int,  long unsigned...
Message-ID: <202510310243.zft7cH2F-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/brauner/linux.git namespace-6.19
head:   e98144c7a642eeb52dfbba3f8c7b394a9dc54dbd
commit: a3e03deb81d0002a55fee3cefd1a39dac1453640 [22/76] nstree: add listns()
config: riscv-randconfig-001-20251031 (https://download.01.org/0day-ci/archive/20251031/202510310243.zft7cH2F-lkp@intel.com/config)
compiler: riscv32-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251031/202510310243.zft7cH2F-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510310243.zft7cH2F-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/compat.h:34,
                    from arch/riscv/include/asm/elf.h:12,
                    from include/linux/elf.h:6,
                    from include/linux/module.h:20,
                    from include/linux/device/driver.h:21,
                    from include/linux/device.h:32,
                    from include/linux/node.h:18,
                    from include/linux/cpu.h:17,
                    from include/linux/static_call.h:135,
                    from include/linux/tracepoint.h:22,
                    from include/trace/syscall.h:5,
                    from include/linux/syscalls.h:96,
                    from kernel/nstree.c:7:
>> arch/riscv/include/asm/syscall_wrapper.h:35:14: warning: '__se_sys_listns' alias between functions of incompatible types 'long int(ulong,  ulong,  ulong,  ulong,  ulong,  ulong,  ulong)' {aka 'long int(long unsigned int,  long unsigned int,  long unsigned int,  long unsigned int,  long unsigned int,  long unsigned int,  long unsigned int)'} and 'long int(long int,  long int,  long int,  long int)' [-Wattribute-alias]
     static long __se_##prefix##name(ulong, ulong, ulong, ulong, ulong, ulong,  \
                 ^~~~~
   arch/riscv/include/asm/syscall_wrapper.h:82:2: note: in expansion of macro '__SYSCALL_SE_DEFINEx'
     __SYSCALL_SE_DEFINEx(x, sys, name, __VA_ARGS__)    \
     ^~~~~~~~~~~~~~~~~~~~
   include/linux/syscalls.h:237:2: note: in expansion of macro '__SYSCALL_DEFINEx'
     __SYSCALL_DEFINEx(x, sname, __VA_ARGS__)
     ^~~~~~~~~~~~~~~~~
   include/linux/syscalls.h:229:36: note: in expansion of macro 'SYSCALL_DEFINEx'
    #define SYSCALL_DEFINE4(name, ...) SYSCALL_DEFINEx(4, _##name, __VA_ARGS__)
                                       ^~~~~~~~~~~~~~~
   kernel/nstree.c:746:1: note: in expansion of macro 'SYSCALL_DEFINE4'
    SYSCALL_DEFINE4(listns, const struct ns_id_req __user *, req,
    ^~~~~~~~~~~~~~~
   arch/riscv/include/asm/syscall_wrapper.h:41:14: note: aliased declaration here
     static long ___se_##prefix##name(__MAP(x,__SC_LONG,__VA_ARGS__))
                 ^~~~~~
   arch/riscv/include/asm/syscall_wrapper.h:82:2: note: in expansion of macro '__SYSCALL_SE_DEFINEx'
     __SYSCALL_SE_DEFINEx(x, sys, name, __VA_ARGS__)    \
     ^~~~~~~~~~~~~~~~~~~~
   include/linux/syscalls.h:237:2: note: in expansion of macro '__SYSCALL_DEFINEx'
     __SYSCALL_DEFINEx(x, sname, __VA_ARGS__)
     ^~~~~~~~~~~~~~~~~
   include/linux/syscalls.h:229:36: note: in expansion of macro 'SYSCALL_DEFINEx'
    #define SYSCALL_DEFINE4(name, ...) SYSCALL_DEFINEx(4, _##name, __VA_ARGS__)
                                       ^~~~~~~~~~~~~~~
   kernel/nstree.c:746:1: note: in expansion of macro 'SYSCALL_DEFINE4'
    SYSCALL_DEFINE4(listns, const struct ns_id_req __user *, req,
    ^~~~~~~~~~~~~~~

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for ARCH_HAS_ELF_CORE_EFLAGS
   Depends on [n]: BINFMT_ELF [=n] && ELF_CORE [=n]
   Selected by [y]:
   - RISCV [=y]


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
