Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E76251DF258
	for <oe-kbuild-all@lists.linux.dev>; Wed, 19 Mar 2025 19:25:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742412320; cv=none; b=TRuX7qmsp8+cmyjbUOnF8jV6W9/cXAC8mLQGSa7g8t1+/x7roGFHx7xklhxWQB1/M4nRjoYqXvx9/up2pojbtJN1/fQiCmSG9ixjZqI//RjttqFR336fCWaHLbsD3vvMundesWJOm5uR/nZGna8SQUmaUauCSDNobff7lMUQvdY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742412320; c=relaxed/simple;
	bh=pcqWs/QJGjBp/4VsMf0bWLms4qPR8E4Ps9J+apcG+88=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NGUxnuXdgy2TManur9qSGqgzc9B2YJNAe0vE9E9jnVNnVaDoDcr32SF5mGIzGITd8HrbZikAXWdV6z3GwBlqnYhbN86jPdtjtu3hfhZQnpB1L/sWrjNK7gE1EEaOrlXGAYqDTsIb6LihakmY+4pEO2YKBmBqddnzIa1FsrKVd64=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=h9YBBGb3; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="h9YBBGb3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742412318; x=1773948318;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=pcqWs/QJGjBp/4VsMf0bWLms4qPR8E4Ps9J+apcG+88=;
  b=h9YBBGb3Qi/8JXpra+11XrjUXnyiv4eWxZoffKZCP5tvIn/IB0CsoZMd
   v1Qirg5IUYnUJKme8KSWuLdsVITAKP4WajCsyM3zcyqW8LeWY99uTck/E
   IFDhdrXawYuJXwf6TGKhsUoT1HXgE9D+6C184NAX1l6yZVqKHLtlXtlEC
   0TsGp9zzrvoxAnHAu7HR6YlHXQrcg4XvUXyzEW4096VOuLRIYUNbgUCKs
   Kq5M0i0snufbZMTGEtdzkx9t4RUtOJv2quh8gMlg+BQlRGcBjyGK/04rf
   MRazE+pkYnega0mKg4CC0RIpzAvKXEgxH+0JF7qONS7y2aOlAXDg2Z9HT
   g==;
X-CSE-ConnectionGUID: OFRG31vzQIur8TB7uMOmaw==
X-CSE-MsgGUID: rMwuvP6NR0i5bmcEEsPb8A==
X-IronPort-AV: E=McAfee;i="6700,10204,11378"; a="47503430"
X-IronPort-AV: E=Sophos;i="6.14,259,1736841600"; 
   d="scan'208";a="47503430"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Mar 2025 12:25:13 -0700
X-CSE-ConnectionGUID: Avg5CLrrQdauogG9Jd2LWw==
X-CSE-MsgGUID: DelGLglpTwa99Rk9rOfu7A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,259,1736841600"; 
   d="scan'208";a="127968457"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by orviesa005.jf.intel.com with ESMTP; 19 Mar 2025 12:25:12 -0700
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tuz1t-000Fd0-2w;
	Wed, 19 Mar 2025 19:25:09 +0000
Date: Thu, 20 Mar 2025 03:24:06 +0800
From: kernel test robot <lkp@intel.com>
To: Joe Damato <jdamato@fastly.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC -next 07/10] fs: Add sendfile2 which accepts a flags
 argument
Message-ID: <202503200334.usJnINks-lkp@intel.com>
References: <20250319001521.53249-8-jdamato@fastly.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250319001521.53249-8-jdamato@fastly.com>

Hi Joe,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on 2e72b1e0aac24a12f3bf3eec620efaca7ab7d4de]

url:    https://github.com/intel-lab-lkp/linux/commits/Joe-Damato/splice-Add-ubuf_info-to-prepare-for-ZC/20250319-082153
base:   2e72b1e0aac24a12f3bf3eec620efaca7ab7d4de
patch link:    https://lore.kernel.org/r/20250319001521.53249-8-jdamato%40fastly.com
patch subject: [RFC -next 07/10] fs: Add sendfile2 which accepts a flags argument
config: riscv-randconfig-002-20250320 (https://download.01.org/0day-ci/archive/20250320/202503200334.usJnINks-lkp@intel.com/config)
compiler: riscv32-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250320/202503200334.usJnINks-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503200334.usJnINks-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/compat.h:34,
                    from arch/riscv/include/asm/elf.h:12,
                    from include/linux/elf.h:6,
                    from include/linux/module.h:19,
                    from include/linux/bpf.h:20,
                    from include/linux/security.h:35,
                    from fs/read_write.c:15:
   arch/riscv/include/asm/syscall_wrapper.h:35:14: warning: '__se_sys_lseek' alias between functions of incompatible types 'long int(ulong,  ulong,  ulong,  ulong,  ulong,  ulong,  ulong)' {aka 'long int(long unsigned int,  long unsigned int,  long unsigned int,  long unsigned int,  long unsigned int,  long unsigned int,  long unsigned int)'} and 'long int(long int,  long int,  long int)' [-Wattribute-alias]
     static long __se_##prefix##name(ulong, ulong, ulong, ulong, ulong, ulong,  \
                 ^~~~~
   arch/riscv/include/asm/syscall_wrapper.h:82:2: note: in expansion of macro '__SYSCALL_SE_DEFINEx'
     __SYSCALL_SE_DEFINEx(x, sys, name, __VA_ARGS__)    \
     ^~~~~~~~~~~~~~~~~~~~
   include/linux/syscalls.h:235:2: note: in expansion of macro '__SYSCALL_DEFINEx'
     __SYSCALL_DEFINEx(x, sname, __VA_ARGS__)
     ^~~~~~~~~~~~~~~~~
   include/linux/syscalls.h:226:36: note: in expansion of macro 'SYSCALL_DEFINEx'
    #define SYSCALL_DEFINE3(name, ...) SYSCALL_DEFINEx(3, _##name, __VA_ARGS__)
                                       ^~~~~~~~~~~~~~~
   fs/read_write.c:403:1: note: in expansion of macro 'SYSCALL_DEFINE3'
    SYSCALL_DEFINE3(lseek, unsigned int, fd, off_t, offset, unsigned int, whence)
    ^~~~~~~~~~~~~~~
   arch/riscv/include/asm/syscall_wrapper.h:41:14: note: aliased declaration here
     static long ___se_##prefix##name(__MAP(x,__SC_LONG,__VA_ARGS__))
                 ^~~~~~
   arch/riscv/include/asm/syscall_wrapper.h:82:2: note: in expansion of macro '__SYSCALL_SE_DEFINEx'
     __SYSCALL_SE_DEFINEx(x, sys, name, __VA_ARGS__)    \
     ^~~~~~~~~~~~~~~~~~~~
   include/linux/syscalls.h:235:2: note: in expansion of macro '__SYSCALL_DEFINEx'
     __SYSCALL_DEFINEx(x, sname, __VA_ARGS__)
     ^~~~~~~~~~~~~~~~~
   include/linux/syscalls.h:226:36: note: in expansion of macro 'SYSCALL_DEFINEx'
    #define SYSCALL_DEFINE3(name, ...) SYSCALL_DEFINEx(3, _##name, __VA_ARGS__)
                                       ^~~~~~~~~~~~~~~
   fs/read_write.c:403:1: note: in expansion of macro 'SYSCALL_DEFINE3'
    SYSCALL_DEFINE3(lseek, unsigned int, fd, off_t, offset, unsigned int, whence)
    ^~~~~~~~~~~~~~~
   arch/riscv/include/asm/syscall_wrapper.h:35:14: warning: '__se_sys_copy_file_range' alias between functions of incompatible types 'long int(ulong,  ulong,  ulong,  ulong,  ulong,  ulong,  ulong)' {aka 'long int(long unsigned int,  long unsigned int,  long unsigned int,  long unsigned int,  long unsigned int,  long unsigned int,  long unsigned int)'} and 'long int(long int,  long int,  long int,  long int,  long int,  long int)' [-Wattribute-alias]
     static long __se_##prefix##name(ulong, ulong, ulong, ulong, ulong, ulong,  \
                 ^~~~~
   arch/riscv/include/asm/syscall_wrapper.h:82:2: note: in expansion of macro '__SYSCALL_SE_DEFINEx'
     __SYSCALL_SE_DEFINEx(x, sys, name, __VA_ARGS__)    \
     ^~~~~~~~~~~~~~~~~~~~
   include/linux/syscalls.h:235:2: note: in expansion of macro '__SYSCALL_DEFINEx'
     __SYSCALL_DEFINEx(x, sname, __VA_ARGS__)
     ^~~~~~~~~~~~~~~~~
   include/linux/syscalls.h:229:36: note: in expansion of macro 'SYSCALL_DEFINEx'
    #define SYSCALL_DEFINE6(name, ...) SYSCALL_DEFINEx(6, _##name, __VA_ARGS__)
                                       ^~~~~~~~~~~~~~~
   fs/read_write.c:1654:1: note: in expansion of macro 'SYSCALL_DEFINE6'
    SYSCALL_DEFINE6(copy_file_range, int, fd_in, loff_t __user *, off_in,
    ^~~~~~~~~~~~~~~
   arch/riscv/include/asm/syscall_wrapper.h:41:14: note: aliased declaration here
     static long ___se_##prefix##name(__MAP(x,__SC_LONG,__VA_ARGS__))
                 ^~~~~~
   arch/riscv/include/asm/syscall_wrapper.h:82:2: note: in expansion of macro '__SYSCALL_SE_DEFINEx'
     __SYSCALL_SE_DEFINEx(x, sys, name, __VA_ARGS__)    \
     ^~~~~~~~~~~~~~~~~~~~
   include/linux/syscalls.h:235:2: note: in expansion of macro '__SYSCALL_DEFINEx'
     __SYSCALL_DEFINEx(x, sname, __VA_ARGS__)
     ^~~~~~~~~~~~~~~~~
   include/linux/syscalls.h:229:36: note: in expansion of macro 'SYSCALL_DEFINEx'
    #define SYSCALL_DEFINE6(name, ...) SYSCALL_DEFINEx(6, _##name, __VA_ARGS__)
                                       ^~~~~~~~~~~~~~~
   fs/read_write.c:1654:1: note: in expansion of macro 'SYSCALL_DEFINE6'
    SYSCALL_DEFINE6(copy_file_range, int, fd_in, loff_t __user *, off_in,
    ^~~~~~~~~~~~~~~
>> arch/riscv/include/asm/syscall_wrapper.h:35:14: warning: '__se_sys_sendfile2' alias between functions of incompatible types 'long int(ulong,  ulong,  ulong,  ulong,  ulong,  ulong,  ulong)' {aka 'long int(long unsigned int,  long unsigned int,  long unsigned int,  long unsigned int,  long unsigned int,  long unsigned int,  long unsigned int)'} and 'long int(long int,  long int,  long int,  long int,  long int)' [-Wattribute-alias]
     static long __se_##prefix##name(ulong, ulong, ulong, ulong, ulong, ulong,  \
                 ^~~~~
   arch/riscv/include/asm/syscall_wrapper.h:82:2: note: in expansion of macro '__SYSCALL_SE_DEFINEx'
     __SYSCALL_SE_DEFINEx(x, sys, name, __VA_ARGS__)    \
     ^~~~~~~~~~~~~~~~~~~~
   include/linux/syscalls.h:235:2: note: in expansion of macro '__SYSCALL_DEFINEx'
     __SYSCALL_DEFINEx(x, sname, __VA_ARGS__)
     ^~~~~~~~~~~~~~~~~
   include/linux/syscalls.h:228:36: note: in expansion of macro 'SYSCALL_DEFINEx'
    #define SYSCALL_DEFINE5(name, ...) SYSCALL_DEFINEx(5, _##name, __VA_ARGS__)
                                       ^~~~~~~~~~~~~~~
   fs/read_write.c:1427:1: note: in expansion of macro 'SYSCALL_DEFINE5'
    SYSCALL_DEFINE5(sendfile2, int, out_fd, int, in_fd, loff_t __user *, offset, size_t, count, int, flags)
    ^~~~~~~~~~~~~~~
   arch/riscv/include/asm/syscall_wrapper.h:41:14: note: aliased declaration here
     static long ___se_##prefix##name(__MAP(x,__SC_LONG,__VA_ARGS__))
                 ^~~~~~
   arch/riscv/include/asm/syscall_wrapper.h:82:2: note: in expansion of macro '__SYSCALL_SE_DEFINEx'
     __SYSCALL_SE_DEFINEx(x, sys, name, __VA_ARGS__)    \
     ^~~~~~~~~~~~~~~~~~~~
   include/linux/syscalls.h:235:2: note: in expansion of macro '__SYSCALL_DEFINEx'
     __SYSCALL_DEFINEx(x, sname, __VA_ARGS__)
     ^~~~~~~~~~~~~~~~~
   include/linux/syscalls.h:228:36: note: in expansion of macro 'SYSCALL_DEFINEx'
    #define SYSCALL_DEFINE5(name, ...) SYSCALL_DEFINEx(5, _##name, __VA_ARGS__)
                                       ^~~~~~~~~~~~~~~
   fs/read_write.c:1427:1: note: in expansion of macro 'SYSCALL_DEFINE5'
    SYSCALL_DEFINE5(sendfile2, int, out_fd, int, in_fd, loff_t __user *, offset, size_t, count, int, flags)
    ^~~~~~~~~~~~~~~
   arch/riscv/include/asm/syscall_wrapper.h:35:14: warning: '__se_sys_sendfile64' alias between functions of incompatible types 'long int(ulong,  ulong,  ulong,  ulong,  ulong,  ulong,  ulong)' {aka 'long int(long unsigned int,  long unsigned int,  long unsigned int,  long unsigned int,  long unsigned int,  long unsigned int,  long unsigned int)'} and 'long int(long int,  long int,  long int,  long int)' [-Wattribute-alias]
     static long __se_##prefix##name(ulong, ulong, ulong, ulong, ulong, ulong,  \
                 ^~~~~
   arch/riscv/include/asm/syscall_wrapper.h:82:2: note: in expansion of macro '__SYSCALL_SE_DEFINEx'
     __SYSCALL_SE_DEFINEx(x, sys, name, __VA_ARGS__)    \
     ^~~~~~~~~~~~~~~~~~~~
   include/linux/syscalls.h:235:2: note: in expansion of macro '__SYSCALL_DEFINEx'
     __SYSCALL_DEFINEx(x, sname, __VA_ARGS__)
     ^~~~~~~~~~~~~~~~~
   include/linux/syscalls.h:227:36: note: in expansion of macro 'SYSCALL_DEFINEx'
    #define SYSCALL_DEFINE4(name, ...) SYSCALL_DEFINEx(4, _##name, __VA_ARGS__)
                                       ^~~~~~~~~~~~~~~
   fs/read_write.c:1410:1: note: in expansion of macro 'SYSCALL_DEFINE4'
    SYSCALL_DEFINE4(sendfile64, int, out_fd, int, in_fd, loff_t __user *, offset, size_t, count)
    ^~~~~~~~~~~~~~~
   arch/riscv/include/asm/syscall_wrapper.h:41:14: note: aliased declaration here
     static long ___se_##prefix##name(__MAP(x,__SC_LONG,__VA_ARGS__))
                 ^~~~~~
   arch/riscv/include/asm/syscall_wrapper.h:82:2: note: in expansion of macro '__SYSCALL_SE_DEFINEx'
     __SYSCALL_SE_DEFINEx(x, sys, name, __VA_ARGS__)    \
     ^~~~~~~~~~~~~~~~~~~~
   include/linux/syscalls.h:235:2: note: in expansion of macro '__SYSCALL_DEFINEx'
     __SYSCALL_DEFINEx(x, sname, __VA_ARGS__)
     ^~~~~~~~~~~~~~~~~
   include/linux/syscalls.h:227:36: note: in expansion of macro 'SYSCALL_DEFINEx'
    #define SYSCALL_DEFINE4(name, ...) SYSCALL_DEFINEx(4, _##name, __VA_ARGS__)
                                       ^~~~~~~~~~~~~~~
   fs/read_write.c:1410:1: note: in expansion of macro 'SYSCALL_DEFINE4'
    SYSCALL_DEFINE4(sendfile64, int, out_fd, int, in_fd, loff_t __user *, offset, size_t, count)
    ^~~~~~~~~~~~~~~
   arch/riscv/include/asm/syscall_wrapper.h:35:14: warning: '__se_sys_sendfile' alias between functions of incompatible types 'long int(ulong,  ulong,  ulong,  ulong,  ulong,  ulong,  ulong)' {aka 'long int(long unsigned int,  long unsigned int,  long unsigned int,  long unsigned int,  long unsigned int,  long unsigned int,  long unsigned int)'} and 'long int(long int,  long int,  long int,  long int)' [-Wattribute-alias]
     static long __se_##prefix##name(ulong, ulong, ulong, ulong, ulong, ulong,  \
                 ^~~~~
   arch/riscv/include/asm/syscall_wrapper.h:82:2: note: in expansion of macro '__SYSCALL_SE_DEFINEx'
     __SYSCALL_SE_DEFINEx(x, sys, name, __VA_ARGS__)    \
     ^~~~~~~~~~~~~~~~~~~~
   include/linux/syscalls.h:235:2: note: in expansion of macro '__SYSCALL_DEFINEx'
     __SYSCALL_DEFINEx(x, sname, __VA_ARGS__)
     ^~~~~~~~~~~~~~~~~
   include/linux/syscalls.h:227:36: note: in expansion of macro 'SYSCALL_DEFINEx'
    #define SYSCALL_DEFINE4(name, ...) SYSCALL_DEFINEx(4, _##name, __VA_ARGS__)
                                       ^~~~~~~~~~~~~~~
   fs/read_write.c:1391:1: note: in expansion of macro 'SYSCALL_DEFINE4'
    SYSCALL_DEFINE4(sendfile, int, out_fd, int, in_fd, off_t __user *, offset, size_t, count)
    ^~~~~~~~~~~~~~~
   arch/riscv/include/asm/syscall_wrapper.h:41:14: note: aliased declaration here
     static long ___se_##prefix##name(__MAP(x,__SC_LONG,__VA_ARGS__))
                 ^~~~~~
   arch/riscv/include/asm/syscall_wrapper.h:82:2: note: in expansion of macro '__SYSCALL_SE_DEFINEx'
     __SYSCALL_SE_DEFINEx(x, sys, name, __VA_ARGS__)    \
     ^~~~~~~~~~~~~~~~~~~~
   include/linux/syscalls.h:235:2: note: in expansion of macro '__SYSCALL_DEFINEx'
     __SYSCALL_DEFINEx(x, sname, __VA_ARGS__)
     ^~~~~~~~~~~~~~~~~
   include/linux/syscalls.h:227:36: note: in expansion of macro 'SYSCALL_DEFINEx'
    #define SYSCALL_DEFINE4(name, ...) SYSCALL_DEFINEx(4, _##name, __VA_ARGS__)
                                       ^~~~~~~~~~~~~~~
   fs/read_write.c:1391:1: note: in expansion of macro 'SYSCALL_DEFINE4'
    SYSCALL_DEFINE4(sendfile, int, out_fd, int, in_fd, off_t __user *, offset, size_t, count)
    ^~~~~~~~~~~~~~~
   arch/riscv/include/asm/syscall_wrapper.h:35:14: warning: '__se_sys_pwritev2' alias between functions of incompatible types 'long int(ulong,  ulong,  ulong,  ulong,  ulong,  ulong,  ulong)' {aka 'long int(long unsigned int,  long unsigned int,  long unsigned int,  long unsigned int,  long unsigned int,  long unsigned int,  long unsigned int)'} and 'long int(long int,  long int,  long int,  long int,  long int,  long int)' [-Wattribute-alias]
     static long __se_##prefix##name(ulong, ulong, ulong, ulong, ulong, ulong,  \
                 ^~~~~
   arch/riscv/include/asm/syscall_wrapper.h:82:2: note: in expansion of macro '__SYSCALL_SE_DEFINEx'
     __SYSCALL_SE_DEFINEx(x, sys, name, __VA_ARGS__)    \
     ^~~~~~~~~~~~~~~~~~~~
   include/linux/syscalls.h:235:2: note: in expansion of macro '__SYSCALL_DEFINEx'
     __SYSCALL_DEFINEx(x, sname, __VA_ARGS__)
     ^~~~~~~~~~~~~~~~~
   include/linux/syscalls.h:229:36: note: in expansion of macro 'SYSCALL_DEFINEx'
    #define SYSCALL_DEFINE6(name, ...) SYSCALL_DEFINEx(6, _##name, __VA_ARGS__)


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

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
