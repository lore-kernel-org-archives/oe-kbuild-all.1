Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CE4917FE0
	for <oe-kbuild-all@lists.linux.dev>; Tue, 11 Jul 2023 19:20:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689103246; x=1720639246;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=e+lTz0mBJkQBzQPhJvXCaOlQTuisLDJiWGMOyxclrbA=;
  b=n4J6cWUsx/qXMkZUuWxkVoY4Ll8ptOkmdVMC3yh1dXfDhTWVj1WjA5/q
   pXWAKgbGUrhBogFWX1p2w1MX/NP0VUZbXWYzrPLEQMCY5VUq0+1IS0Xk3
   fMO1jhly0/7GbR8M4VSVnVAQWDnRsnRiGhLzMG0aKO05swcpUs5Bf2lH1
   /1OhpXBN8BoC1GlGSi0/7JA06eIuR8tbuK8SXzZoKwsHeEFOItwajmgUZ
   MR51713twM0GK6cP4aOAeZhrMC9zjbjik3MEiz0jgJcNU7rcjy+AtcjUh
   OX0kbtvQ8U6KpLH2GMiPiTmGCTukhJJ4eRrbCl8tRxJJ/uU5oZbwHPP+G
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10768"; a="368242336"
X-IronPort-AV: E=Sophos;i="6.01,197,1684825200"; 
   d="scan'208";a="368242336"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jul 2023 12:13:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10768"; a="756488545"
X-IronPort-AV: E=Sophos;i="6.01,197,1684825200"; 
   d="scan'208";a="756488545"
Received: from lkp-server01.sh.intel.com (HELO c544d7fc5005) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 11 Jul 2023 12:13:18 -0700
Received: from kbuild by c544d7fc5005 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qJInV-00053H-1K;
	Tue, 11 Jul 2023 19:13:17 +0000
Date: Wed, 12 Jul 2023 03:12:19 +0800
From: kernel test robot <lkp@intel.com>
To: Nick Alcock <nick.alcock@oracle.com>
Cc: oe-kbuild-all@lists.linux.dev, Kris Van Hees <kris.van.hees@oracle.com>,
	Tomas Jedlicka <tomas.jedlicka@oracle.com>,
	Eugene Loh <eugene.loh@oracle.com>,
	David Mc Lean <david.mclean@oracle.com>,
	Vincent Lim <vincent.lim@oracle.com>
Subject: [oracle-dtrace:v2/6.4 10/13]
 arch/powerpc/include/asm/syscall_wrapper.h:19:14: error: conflicting types
 for 'sys_waitfd'; have 'long int(const struct pt_regs *)'
Message-ID: <202307120345.rgsl18cH-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/oracle/dtrace-linux-kernel v2/6.4
head:   9b6d57638acaddc5e1016dbcfea27771df400611
commit: 19ce4a9705869b25a970a68669e8837cf78b1ead [10/13] waitfd: new syscall implementing waitpid() over fds
config: powerpc-allnoconfig (https://download.01.org/0day-ci/archive/20230712/202307120345.rgsl18cH-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230712/202307120345.rgsl18cH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307120345.rgsl18cH-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/syscalls.h:98,
                    from fs/waitfd.c:20:
>> arch/powerpc/include/asm/syscall_wrapper.h:19:14: error: conflicting types for 'sys_waitfd'; have 'long int(const struct pt_regs *)'
      19 |         long sys##name(const struct pt_regs *regs);                     \
         |              ^~~
   include/linux/syscalls.h:228:9: note: in expansion of macro '__SYSCALL_DEFINEx'
     228 |         __SYSCALL_DEFINEx(x, sname, __VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~
   include/linux/syscalls.h:220:36: note: in expansion of macro 'SYSCALL_DEFINEx'
     220 | #define SYSCALL_DEFINE4(name, ...) SYSCALL_DEFINEx(4, _##name, __VA_ARGS__)
         |                                    ^~~~~~~~~~~~~~~
   fs/waitfd.c:94:1: note: in expansion of macro 'SYSCALL_DEFINE4'
      94 | SYSCALL_DEFINE4(waitfd, int __maybe_unused, which, pid_t, upid, int, options,
         | ^~~~~~~~~~~~~~~
   include/linux/syscalls.h:1386:17: note: previous declaration of 'sys_waitfd' with type 'long int(int,  pid_t,  int,  int)' {aka 'long int(int,  int,  int,  int)'}
    1386 | asmlinkage long sys_waitfd(int which, pid_t upid, int options, int flags);
         |                 ^~~~~~~~~~
   arch/powerpc/include/asm/syscall_wrapper.h:23:14: error: conflicting types for 'sys_waitfd'; have 'long int(const struct pt_regs *)'
      23 |         long sys##name(const struct pt_regs *regs)                      \
         |              ^~~
   include/linux/syscalls.h:228:9: note: in expansion of macro '__SYSCALL_DEFINEx'
     228 |         __SYSCALL_DEFINEx(x, sname, __VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~
   include/linux/syscalls.h:220:36: note: in expansion of macro 'SYSCALL_DEFINEx'
     220 | #define SYSCALL_DEFINE4(name, ...) SYSCALL_DEFINEx(4, _##name, __VA_ARGS__)
         |                                    ^~~~~~~~~~~~~~~
   fs/waitfd.c:94:1: note: in expansion of macro 'SYSCALL_DEFINE4'
      94 | SYSCALL_DEFINE4(waitfd, int __maybe_unused, which, pid_t, upid, int, options,
         | ^~~~~~~~~~~~~~~
   include/linux/syscalls.h:1386:17: note: previous declaration of 'sys_waitfd' with type 'long int(int,  pid_t,  int,  int)' {aka 'long int(int,  int,  int,  int)'}
    1386 | asmlinkage long sys_waitfd(int which, pid_t upid, int options, int flags);
         |                 ^~~~~~~~~~


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
