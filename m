Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 190681102
	for <oe-kbuild-all@lists.linux.dev>; Sat, 13 May 2023 09:41:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683970871; x=1715506871;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ubhaXXmOJJyYIf17IjByvgKRXB0tmwmTG1cIH7KQalU=;
  b=TYJ7UMuIfn+NYw3ULkjbY5IgLMtgRvlCzTNErSZlsPQp1GVQp1C2NYys
   PDvHAXCLl8sEUfpLuWmZqukkYShvxt+Zipm/P/QL/yz1QrUUOrcjCJRe1
   2vJMxskon1PHTN0RDYP+vxeLdGjaY1La3at1L/hGeY8F7XcoIOV45H21x
   b3u2owhhjyVfGavUjeoISyoZgo87pw0orF1ow+IrjQFzhXeMt0JBYDRQ/
   iJL3yd+ZrOUYp/NHNPQt2qMA3a2jXlKsuYJhgMdAF3K+iCqEOWPsG3w2l
   fEdo1Ka7abfmdh/A0ukFtyu2RG+NHOMSy81f6HcrHVSnriwp5h5GvO/mx
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10708"; a="335471490"
X-IronPort-AV: E=Sophos;i="5.99,272,1677571200"; 
   d="scan'208";a="335471490"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2023 02:41:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10708"; a="703424032"
X-IronPort-AV: E=Sophos;i="5.99,272,1677571200"; 
   d="scan'208";a="703424032"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 13 May 2023 02:41:08 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pxlkS-0005R4-0K;
	Sat, 13 May 2023 09:41:08 +0000
Date: Sat, 13 May 2023 17:40:12 +0800
From: kernel test robot <lkp@intel.com>
To: Jann Horn <jannh@google.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Eric W. Biederman" <ebiederm@xmission.com>
Subject: [stable:linux-4.19.y 2014/5827] kernel/ptrace.c:1137: Error:
 unrecognized opcode `csrs sstatus,s6'
Message-ID: <202305131739.fjOKViY0-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git linux-4.19.y
head:   cdfda37ab2cfc783a190b563806cda611c35d1e3
commit: b1f438f872dcda10a79e6aeaf06fd52dfb15a6ab [2014/5827] ptrace: Check PTRACE_O_SUSPEND_SECCOMP permission on PTRACE_SEIZE
config: riscv-buildonly-randconfig-r002-20230511 (https://download.01.org/0day-ci/archive/20230513/202305131739.fjOKViY0-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git/commit/?id=b1f438f872dcda10a79e6aeaf06fd52dfb15a6ab
        git remote add stable https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git
        git fetch --no-tags stable linux-4.19.y
        git checkout b1f438f872dcda10a79e6aeaf06fd52dfb15a6ab
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=riscv olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202305131739.fjOKViY0-lkp@intel.com/

All errors (new ones prefixed by >>):

         |                                       ^~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:69:30: note: in definition of macro '__trace_if'
      69 |                 ______r = !!(cond);                                     \
         |                              ^~~~
   kernel/ptrace.c:1046:17: note: in expansion of macro 'if'
    1046 |                 if (likely(task_set_jobctl_pending(child, JOBCTL_TRAP_STOP)))
         |                 ^~
   include/linux/compiler.h:45:26: note: in expansion of macro '__branch_check__'
      45 | #  define likely(x)     (__branch_check__(x, 1, __builtin_constant_p(x)))
         |                          ^~~~~~~~~~~~~~~~
   kernel/ptrace.c:1046:21: note: in expansion of macro 'likely'
    1046 |                 if (likely(task_set_jobctl_pending(child, JOBCTL_TRAP_STOP)))
         |                     ^~~~~~
   include/linux/compiler.h:64:25: note: previous declaration here
      64 |                         ______f = {                                     \
         |                         ^~~~~~~
   include/linux/compiler.h:56:23: note: in expansion of macro '__trace_if'
      56 | #define if(cond, ...) __trace_if( (cond , ## __VA_ARGS__) )
         |                       ^~~~~~~~~~
   kernel/ptrace.c:1046:17: note: in expansion of macro 'if'
    1046 |                 if (likely(task_set_jobctl_pending(child, JOBCTL_TRAP_STOP)))
         |                 ^~
   include/linux/compiler.h:25:39: warning: ignoring attribute 'section ("_ftrace_annotated_branch")' because it conflicts with previous 'section ("_ftrace_branch")' [-Wattributes]
      25 |                         static struct ftrace_likely_data                \
         |                                       ^~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:69:30: note: in definition of macro '__trace_if'
      69 |                 ______r = !!(cond);                                     \
         |                              ^~~~
   kernel/ptrace.c:1062:17: note: in expansion of macro 'if'
    1062 |                 if (unlikely(!seized || !lock_task_sighand(child, &flags)))
         |                 ^~
   include/linux/compiler.h:48:26: note: in expansion of macro '__branch_check__'
      48 | #  define unlikely(x)   (__branch_check__(x, 0, __builtin_constant_p(x)))
         |                          ^~~~~~~~~~~~~~~~
   kernel/ptrace.c:1062:21: note: in expansion of macro 'unlikely'
    1062 |                 if (unlikely(!seized || !lock_task_sighand(child, &flags)))
         |                     ^~~~~~~~
   include/linux/compiler.h:64:25: note: previous declaration here
      64 |                         ______f = {                                     \
         |                         ^~~~~~~
   include/linux/compiler.h:56:23: note: in expansion of macro '__trace_if'
      56 | #define if(cond, ...) __trace_if( (cond , ## __VA_ARGS__) )
         |                       ^~~~~~~~~~
   kernel/ptrace.c:1062:17: note: in expansion of macro 'if'
    1062 |                 if (unlikely(!seized || !lock_task_sighand(child, &flags)))
         |                 ^~
   include/linux/compiler.h:25:39: warning: ignoring attribute 'section ("_ftrace_annotated_branch")' because it conflicts with previous 'section ("_ftrace_branch")' [-Wattributes]
      25 |                         static struct ftrace_likely_data                \
         |                                       ^~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:69:30: note: in definition of macro '__trace_if'
      69 |                 ______r = !!(cond);                                     \
         |                              ^~~~
   kernel/ptrace.c:1066:17: note: in expansion of macro 'if'
    1066 |                 if (likely(si && (si->si_code >> 8) == PTRACE_EVENT_STOP)) {
         |                 ^~
   include/linux/compiler.h:45:26: note: in expansion of macro '__branch_check__'
      45 | #  define likely(x)     (__branch_check__(x, 1, __builtin_constant_p(x)))
         |                          ^~~~~~~~~~~~~~~~
   kernel/ptrace.c:1066:21: note: in expansion of macro 'likely'
    1066 |                 if (likely(si && (si->si_code >> 8) == PTRACE_EVENT_STOP)) {
         |                     ^~~~~~
   include/linux/compiler.h:64:25: note: previous declaration here
      64 |                         ______f = {                                     \
         |                         ^~~~~~~
   include/linux/compiler.h:56:23: note: in expansion of macro '__trace_if'
      56 | #define if(cond, ...) __trace_if( (cond , ## __VA_ARGS__) )
         |                       ^~~~~~~~~~
   kernel/ptrace.c:1066:17: note: in expansion of macro 'if'
    1066 |                 if (likely(si && (si->si_code >> 8) == PTRACE_EVENT_STOP)) {
         |                 ^~
   include/linux/compiler.h:25:39: warning: ignoring attribute 'section ("_ftrace_annotated_branch")' because it conflicts with previous 'section ("_ftrace_branch")' [-Wattributes]
      25 |                         static struct ftrace_likely_data                \
         |                                       ^~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:69:30: note: in definition of macro '__trace_if'
      69 |                 ______r = !!(cond);                                     \
         |                              ^~~~
   kernel/ptrace.c:1134:17: note: in expansion of macro 'if'
    1134 |                 if (!access_ok(VERIFY_WRITE, uiov, sizeof(*uiov)))
         |                 ^~
   include/linux/compiler.h:45:26: note: in expansion of macro '__branch_check__'
      45 | #  define likely(x)     (__branch_check__(x, 1, __builtin_constant_p(x)))
         |                          ^~~~~~~~~~~~~~~~
   arch/riscv/include/asm/uaccess.h:81:9: note: in expansion of macro 'likely'
      81 |         likely(__access_ok((unsigned long __force)(addr), (size)));     \
         |         ^~~~~~
   kernel/ptrace.c:1134:22: note: in expansion of macro 'access_ok'
    1134 |                 if (!access_ok(VERIFY_WRITE, uiov, sizeof(*uiov)))
         |                      ^~~~~~~~~
   include/linux/compiler.h:64:25: note: previous declaration here
      64 |                         ______f = {                                     \
         |                         ^~~~~~~
   include/linux/compiler.h:56:23: note: in expansion of macro '__trace_if'
      56 | #define if(cond, ...) __trace_if( (cond , ## __VA_ARGS__) )
         |                       ^~~~~~~~~~
   kernel/ptrace.c:1134:17: note: in expansion of macro 'if'
    1134 |                 if (!access_ok(VERIFY_WRITE, uiov, sizeof(*uiov)))
         |                 ^~
   kernel/ptrace.c: Assembler messages:
   kernel/ptrace.c:1221: Error: unrecognized opcode `csrs sstatus,a4'
   kernel/ptrace.c:1221: Error: unrecognized opcode `csrc sstatus,a4'
>> kernel/ptrace.c:1137: Error: unrecognized opcode `csrs sstatus,s6'
>> kernel/ptrace.c:1137: Error: unrecognized opcode `csrc sstatus,s6'
>> kernel/ptrace.c:1137: Error: unrecognized opcode `csrs sstatus,s6'
>> kernel/ptrace.c:1137: Error: unrecognized opcode `csrc sstatus,s6'
   kernel/ptrace.c:1143: Error: unrecognized opcode `csrs sstatus,s6'
   kernel/ptrace.c:1143: Error: unrecognized opcode `csrc sstatus,s6'
   kernel/ptrace.c:955: Error: unrecognized opcode `csrs sstatus,a4'
   kernel/ptrace.c:955: Error: unrecognized opcode `csrc sstatus,a4'


vim +1137 kernel/ptrace.c

9c1a125921d146 Mike Frysinger    2010-05-26  1108  
36df29d7994180 Roland McGrath    2008-01-30  1109  #ifdef PTRACE_SINGLESTEP
36df29d7994180 Roland McGrath    2008-01-30  1110  	case PTRACE_SINGLESTEP:
36df29d7994180 Roland McGrath    2008-01-30  1111  #endif
5b88abbf770a0e Roland McGrath    2008-01-30  1112  #ifdef PTRACE_SINGLEBLOCK
5b88abbf770a0e Roland McGrath    2008-01-30  1113  	case PTRACE_SINGLEBLOCK:
5b88abbf770a0e Roland McGrath    2008-01-30  1114  #endif
36df29d7994180 Roland McGrath    2008-01-30  1115  #ifdef PTRACE_SYSEMU
36df29d7994180 Roland McGrath    2008-01-30  1116  	case PTRACE_SYSEMU:
36df29d7994180 Roland McGrath    2008-01-30  1117  	case PTRACE_SYSEMU_SINGLESTEP:
36df29d7994180 Roland McGrath    2008-01-30  1118  #endif
36df29d7994180 Roland McGrath    2008-01-30  1119  	case PTRACE_SYSCALL:
36df29d7994180 Roland McGrath    2008-01-30  1120  	case PTRACE_CONT:
36df29d7994180 Roland McGrath    2008-01-30  1121  		return ptrace_resume(child, request, data);
36df29d7994180 Roland McGrath    2008-01-30  1122  
36df29d7994180 Roland McGrath    2008-01-30  1123  	case PTRACE_KILL:
36df29d7994180 Roland McGrath    2008-01-30  1124  		if (child->exit_state)	/* already dead */
36df29d7994180 Roland McGrath    2008-01-30  1125  			return 0;
36df29d7994180 Roland McGrath    2008-01-30  1126  		return ptrace_resume(child, request, SIGKILL);
36df29d7994180 Roland McGrath    2008-01-30  1127  
2225a122ae26d5 Suresh Siddha     2010-02-11  1128  #ifdef CONFIG_HAVE_ARCH_TRACEHOOK
2225a122ae26d5 Suresh Siddha     2010-02-11  1129  	case PTRACE_GETREGSET:
29000caecbe87b Andrey Vagin      2013-07-03  1130  	case PTRACE_SETREGSET: {
2225a122ae26d5 Suresh Siddha     2010-02-11  1131  		struct iovec kiov;
9fed81dc40f5a1 Namhyung Kim      2010-10-27  1132  		struct iovec __user *uiov = datavp;
2225a122ae26d5 Suresh Siddha     2010-02-11  1133  
2225a122ae26d5 Suresh Siddha     2010-02-11  1134  		if (!access_ok(VERIFY_WRITE, uiov, sizeof(*uiov)))
2225a122ae26d5 Suresh Siddha     2010-02-11  1135  			return -EFAULT;
2225a122ae26d5 Suresh Siddha     2010-02-11  1136  
2225a122ae26d5 Suresh Siddha     2010-02-11 @1137  		if (__get_user(kiov.iov_base, &uiov->iov_base) ||
2225a122ae26d5 Suresh Siddha     2010-02-11  1138  		    __get_user(kiov.iov_len, &uiov->iov_len))
2225a122ae26d5 Suresh Siddha     2010-02-11  1139  			return -EFAULT;
2225a122ae26d5 Suresh Siddha     2010-02-11  1140  
2225a122ae26d5 Suresh Siddha     2010-02-11  1141  		ret = ptrace_regset(child, request, addr, &kiov);
2225a122ae26d5 Suresh Siddha     2010-02-11  1142  		if (!ret)
2225a122ae26d5 Suresh Siddha     2010-02-11  1143  			ret = __put_user(kiov.iov_len, &uiov->iov_len);
2225a122ae26d5 Suresh Siddha     2010-02-11  1144  		break;
2225a122ae26d5 Suresh Siddha     2010-02-11  1145  	}
2225a122ae26d5 Suresh Siddha     2010-02-11  1146  #endif
f8e529ed941ba2 Tycho Andersen    2015-10-27  1147  
f8e529ed941ba2 Tycho Andersen    2015-10-27  1148  	case PTRACE_SECCOMP_GET_FILTER:
f8e529ed941ba2 Tycho Andersen    2015-10-27  1149  		ret = seccomp_get_filter(child, addr, datavp);
f8e529ed941ba2 Tycho Andersen    2015-10-27  1150  		break;
f8e529ed941ba2 Tycho Andersen    2015-10-27  1151  
26500475ac1b49 Tycho Andersen    2017-10-11  1152  	case PTRACE_SECCOMP_GET_METADATA:
26500475ac1b49 Tycho Andersen    2017-10-11  1153  		ret = seccomp_get_metadata(child, addr, datavp);
26500475ac1b49 Tycho Andersen    2017-10-11  1154  		break;
26500475ac1b49 Tycho Andersen    2017-10-11  1155  
^1da177e4c3f41 Linus Torvalds    2005-04-16  1156  	default:
^1da177e4c3f41 Linus Torvalds    2005-04-16  1157  		break;
^1da177e4c3f41 Linus Torvalds    2005-04-16  1158  	}
^1da177e4c3f41 Linus Torvalds    2005-04-16  1159  
^1da177e4c3f41 Linus Torvalds    2005-04-16  1160  	return ret;
^1da177e4c3f41 Linus Torvalds    2005-04-16  1161  }
481bed45424753 Christoph Hellwig 2005-11-07  1162  

:::::: The code at line 1137 was first introduced by commit
:::::: 2225a122ae26d542bdce523d9d87a4a7ba10e07b ptrace: Add support for generic PTRACE_GETREGSET/PTRACE_SETREGSET

:::::: TO: Suresh Siddha <suresh.b.siddha@intel.com>
:::::: CC: H. Peter Anvin <hpa@zytor.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
