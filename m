Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B35A51079D
	for <oe-kbuild-all@lists.linux.dev>; Wed,  6 Sep 2023 15:07:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694012844; x=1725548844;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=kTy3eHZxn+6IUSm+IIHvXvL8+RTT9V10AqJ76nD2UME=;
  b=JDRdAkZf2nKb3o+CgsatHe4CqZ7Ofg32rj79+eRdwmLR7wEARahbdvC3
   T4YsTR5rMOyLn8rMhlsyY20AwJLjdi7X0Bwn2sYZjGBl0YFH/KWKQ59AI
   rqRpOHotj4mvm5swa9Nl+GPp7U1Oh+6QbHqEnf/H1n4oAqQN/acmkrVUI
   AemXr5/1pNZNrPbPnLMs3x+kNzv3TSkr5roc58YAmBk9eIDZXVYRI9ywT
   BGPn8E+Ro0TXskNFWljshzZ0SB+1qE5uE0R53hR/smZwPrThhInkIxJQl
   HZ1LtjhPmIyCkh1dLn9NkBTYAGs79smWguAI8IOrkEfq1Rm9iU1Hn7B92
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10825"; a="380887700"
X-IronPort-AV: E=Sophos;i="6.02,232,1688454000"; 
   d="scan'208";a="380887700"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Sep 2023 08:07:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10825"; a="988266299"
X-IronPort-AV: E=Sophos;i="6.02,232,1688454000"; 
   d="scan'208";a="988266299"
Received: from lkp-server01.sh.intel.com (HELO 59b3c6e06877) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 06 Sep 2023 08:07:15 -0700
Received: from kbuild by 59b3c6e06877 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qdu7d-0000Jj-1b;
	Wed, 06 Sep 2023 15:07:13 +0000
Date: Wed, 6 Sep 2023 23:06:19 +0800
From: kernel test robot <lkp@intel.com>
To: Nick Alcock <nick.alcock@oracle.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Victor Erminpour <victor.erminpour@oracle.com>
Subject: [oracle-dtrace:v2/6.5 11/13]
 arch/powerpc/include/asm/syscall_wrapper.h:19:14: error: conflicting types
 for 'sys_waitfd'; have 'long int(const struct pt_regs *)'
Message-ID: <202309062301.qRNo5bMg-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Nick,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://github.com/oracle/dtrace-linux-kernel v2/6.5
head:   1120d1c598d4ae2d08278969b9001a866aa8273a
commit: e325d4f34d8d98420b15d3eea57fdfe2dadc07c5 [11/13] waitfd: enable by default
config: powerpc-allnoconfig (https://download.01.org/0day-ci/archive/20230906/202309062301.qRNo5bMg-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230906/202309062301.qRNo5bMg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309062301.qRNo5bMg-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/syscalls.h:100,
                    from fs/waitfd.c:20:
>> arch/powerpc/include/asm/syscall_wrapper.h:19:14: error: conflicting types for 'sys_waitfd'; have 'long int(const struct pt_regs *)'
      19 |         long sys##name(const struct pt_regs *regs);                     \
         |              ^~~
   include/linux/syscalls.h:230:9: note: in expansion of macro '__SYSCALL_DEFINEx'
     230 |         __SYSCALL_DEFINEx(x, sname, __VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~
   include/linux/syscalls.h:222:36: note: in expansion of macro 'SYSCALL_DEFINEx'
     222 | #define SYSCALL_DEFINE4(name, ...) SYSCALL_DEFINEx(4, _##name, __VA_ARGS__)
         |                                    ^~~~~~~~~~~~~~~
   fs/waitfd.c:94:1: note: in expansion of macro 'SYSCALL_DEFINE4'
      94 | SYSCALL_DEFINE4(waitfd, int __maybe_unused, which, pid_t, upid, int, options,
         | ^~~~~~~~~~~~~~~
   include/linux/syscalls.h:1282:17: note: previous declaration of 'sys_waitfd' with type 'long int(int,  pid_t,  int,  int)' {aka 'long int(int,  int,  int,  int)'}
    1282 | asmlinkage long sys_waitfd(int which, pid_t upid, int options, int flags);
         |                 ^~~~~~~~~~
   arch/powerpc/include/asm/syscall_wrapper.h:23:14: error: conflicting types for 'sys_waitfd'; have 'long int(const struct pt_regs *)'
      23 |         long sys##name(const struct pt_regs *regs)                      \
         |              ^~~
   include/linux/syscalls.h:230:9: note: in expansion of macro '__SYSCALL_DEFINEx'
     230 |         __SYSCALL_DEFINEx(x, sname, __VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~
   include/linux/syscalls.h:222:36: note: in expansion of macro 'SYSCALL_DEFINEx'
     222 | #define SYSCALL_DEFINE4(name, ...) SYSCALL_DEFINEx(4, _##name, __VA_ARGS__)
         |                                    ^~~~~~~~~~~~~~~
   fs/waitfd.c:94:1: note: in expansion of macro 'SYSCALL_DEFINE4'
      94 | SYSCALL_DEFINE4(waitfd, int __maybe_unused, which, pid_t, upid, int, options,
         | ^~~~~~~~~~~~~~~
   include/linux/syscalls.h:1282:17: note: previous declaration of 'sys_waitfd' with type 'long int(int,  pid_t,  int,  int)' {aka 'long int(int,  int,  int,  int)'}
    1282 | asmlinkage long sys_waitfd(int which, pid_t upid, int options, int flags);
         |                 ^~~~~~~~~~

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for VMLINUX_MAP
   Depends on [n]: EXPERT [=n]
   Selected by [y]:
   - KALLMODSYMS [=y] && KALLSYMS [=y]


vim +19 arch/powerpc/include/asm/syscall_wrapper.h

7e92e01b724526 Rohan McLure     2022-09-21  12  
7e92e01b724526 Rohan McLure     2022-09-21  13  #define SC_POWERPC_REGS_TO_ARGS(x, ...)				\
7e92e01b724526 Rohan McLure     2022-09-21  14  	__MAP(x,__SC_ARGS					\
7e92e01b724526 Rohan McLure     2022-09-21  15  	      ,,regs->gpr[3],,regs->gpr[4],,regs->gpr[5]	\
7e92e01b724526 Rohan McLure     2022-09-21  16  	      ,,regs->gpr[6],,regs->gpr[7],,regs->gpr[8])
7e92e01b724526 Rohan McLure     2022-09-21  17  
7e92e01b724526 Rohan McLure     2022-09-21  18  #define __SYSCALL_DEFINEx(x, name, ...)						\
94746890202cf1 Michael Ellerman 2022-10-06 @19  	long sys##name(const struct pt_regs *regs);			\
94746890202cf1 Michael Ellerman 2022-10-06  20  	ALLOW_ERROR_INJECTION(sys##name, ERRNO);			\
7e92e01b724526 Rohan McLure     2022-09-21  21  	static long __se_sys##name(__MAP(x,__SC_LONG,__VA_ARGS__));		\
7e92e01b724526 Rohan McLure     2022-09-21  22  	static inline long __do_sys##name(__MAP(x,__SC_DECL,__VA_ARGS__));	\
94746890202cf1 Michael Ellerman 2022-10-06  23  	long sys##name(const struct pt_regs *regs)			\
7e92e01b724526 Rohan McLure     2022-09-21  24  	{									\
7e92e01b724526 Rohan McLure     2022-09-21  25  		return __se_sys##name(SC_POWERPC_REGS_TO_ARGS(x,__VA_ARGS__));	\
7e92e01b724526 Rohan McLure     2022-09-21  26  	}									\
7e92e01b724526 Rohan McLure     2022-09-21  27  	static long __se_sys##name(__MAP(x,__SC_LONG,__VA_ARGS__))		\
7e92e01b724526 Rohan McLure     2022-09-21  28  	{									\
7e92e01b724526 Rohan McLure     2022-09-21  29  		long ret = __do_sys##name(__MAP(x,__SC_CAST,__VA_ARGS__));	\
7e92e01b724526 Rohan McLure     2022-09-21  30  		__MAP(x,__SC_TEST,__VA_ARGS__);					\
7e92e01b724526 Rohan McLure     2022-09-21  31  		__PROTECT(x, ret,__MAP(x,__SC_ARGS,__VA_ARGS__));		\
7e92e01b724526 Rohan McLure     2022-09-21  32  		return ret;							\
7e92e01b724526 Rohan McLure     2022-09-21  33  	}									\
7e92e01b724526 Rohan McLure     2022-09-21  34  	static inline long __do_sys##name(__MAP(x,__SC_DECL,__VA_ARGS__))
7e92e01b724526 Rohan McLure     2022-09-21  35  

:::::: The code at line 19 was first introduced by commit
:::::: 94746890202cf18e5266b4de77895243e55b0a79 powerpc: Don't add __powerpc_ prefix to syscall entry points

:::::: TO: Michael Ellerman <mpe@ellerman.id.au>
:::::: CC: Michael Ellerman <mpe@ellerman.id.au>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
