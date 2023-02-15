Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C96986109
	for <oe-kbuild-all@lists.linux.dev>; Wed, 15 Feb 2023 14:50:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676472659; x=1708008659;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=bh9/fOf0V8BY4meyG2dfrHrJuNPOul9MAY6SVDqKPEc=;
  b=Tys0m5ax39nNFOstixbz9gFAWA5FlnAspPkXuScfEAjnbmiwBS3py5fB
   7gymddEKIYbU3IbYtiPPxMKZRqJp+h5CStSBRDsQpZU9pKnO8oI4qdUyI
   mGWIp4Xd/ceFTvvt6erGmjNwuLI7FJjcO9B6j0VZ67l/4I4DNeKjsOYw2
   t0T6SjEKJdPLjVTDJed79j8ssvKIjQumXykJS00lWrP0qlWua26pm4lAa
   JU8njayhgaYzYiiInWAwh+Xfhj2NMVzZK+sDi3h7JKou4rPQrGjWdGb3l
   +9OxDu5QxJbFEYFLmmeHFkShBER7G+EGUvI/BqlfIHGLuCDUS50MMlPxK
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10621"; a="331442765"
X-IronPort-AV: E=Sophos;i="5.97,299,1669104000"; 
   d="scan'208";a="331442765"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Feb 2023 06:50:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10621"; a="699994161"
X-IronPort-AV: E=Sophos;i="5.97,299,1669104000"; 
   d="scan'208";a="699994161"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 15 Feb 2023 06:50:55 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pSJ7R-0009Sr-2A;
	Wed, 15 Feb 2023 14:50:49 +0000
Date: Wed, 15 Feb 2023 22:50:28 +0800
From: kernel test robot <lkp@intel.com>
To: "Eric W. Biederman" <ebiederm@xmission.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Oleg Nesterov <oleg@redhat.com>
Subject: [stable:linux-4.19.y 2646/5220] kernel/ptrace.c:1136: Error:
 unrecognized opcode `csrs sstatus,s7'
Message-ID: <202302152244.JibZKLpk-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Eric,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git linux-4.19.y
head:   53b696f0584acce2e90db69272a2a11aab138370
commit: 77508cd7695d09da1f7281e23907ad0ed70d8465 [2646/5220] ptrace: Reimplement PTRACE_KILL by always sending SIGKILL
config: riscv-randconfig-r025-20230212 (https://download.01.org/0day-ci/archive/20230215/202302152244.JibZKLpk-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git/commit/?id=77508cd7695d09da1f7281e23907ad0ed70d8465
        git remote add stable https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git
        git fetch --no-tags stable linux-4.19.y
        git checkout 77508cd7695d09da1f7281e23907ad0ed70d8465
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=riscv olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302152244.JibZKLpk-lkp@intel.com/

All errors (new ones prefixed by >>):

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
   kernel/ptrace.c:1133:17: note: in expansion of macro 'if'
    1133 |                 if (!access_ok(VERIFY_WRITE, uiov, sizeof(*uiov)))
         |                 ^~
   include/linux/compiler.h:45:26: note: in expansion of macro '__branch_check__'
      45 | #  define likely(x)     (__branch_check__(x, 1, __builtin_constant_p(x)))
         |                          ^~~~~~~~~~~~~~~~
   arch/riscv/include/asm/uaccess.h:81:9: note: in expansion of macro 'likely'
      81 |         likely(__access_ok((unsigned long __force)(addr), (size)));     \
         |         ^~~~~~
   kernel/ptrace.c:1133:22: note: in expansion of macro 'access_ok'
    1133 |                 if (!access_ok(VERIFY_WRITE, uiov, sizeof(*uiov)))
         |                      ^~~~~~~~~
   include/linux/compiler.h:64:25: note: previous declaration here
      64 |                         ______f = {                                     \
         |                         ^~~~~~~
   include/linux/compiler.h:56:23: note: in expansion of macro '__trace_if'
      56 | #define if(cond, ...) __trace_if( (cond , ## __VA_ARGS__) )
         |                       ^~~~~~~~~~
   kernel/ptrace.c:1133:17: note: in expansion of macro 'if'
    1133 |                 if (!access_ok(VERIFY_WRITE, uiov, sizeof(*uiov)))
         |                 ^~
   kernel/ptrace.c: Assembler messages:
   kernel/ptrace.c:1220: Error: unrecognized opcode `csrs sstatus,a4'
   kernel/ptrace.c:1220: Error: unrecognized opcode `csrc sstatus,a4'
   kernel/ptrace.c:955: Error: unrecognized opcode `csrs sstatus,a4'
   kernel/ptrace.c:955: Error: unrecognized opcode `csrc sstatus,a4'
>> kernel/ptrace.c:1136: Error: unrecognized opcode `csrs sstatus,s7'
>> kernel/ptrace.c:1136: Error: unrecognized opcode `csrc sstatus,s7'
>> kernel/ptrace.c:1136: Error: unrecognized opcode `csrs sstatus,s7'
>> kernel/ptrace.c:1136: Error: unrecognized opcode `csrc sstatus,s7'
   kernel/ptrace.c:1142: Error: unrecognized opcode `csrs sstatus,s7'
   kernel/ptrace.c:1142: Error: unrecognized opcode `csrc sstatus,s7'


vim +1136 kernel/ptrace.c

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
77508cd7695d09 Eric W. Biederman 2022-04-29  1124  		send_sig_info(SIGKILL, SEND_SIG_NOINFO, child);
36df29d7994180 Roland McGrath    2008-01-30  1125  		return 0;
36df29d7994180 Roland McGrath    2008-01-30  1126  
2225a122ae26d5 Suresh Siddha     2010-02-11  1127  #ifdef CONFIG_HAVE_ARCH_TRACEHOOK
2225a122ae26d5 Suresh Siddha     2010-02-11  1128  	case PTRACE_GETREGSET:
29000caecbe87b Andrey Vagin      2013-07-03  1129  	case PTRACE_SETREGSET: {
2225a122ae26d5 Suresh Siddha     2010-02-11  1130  		struct iovec kiov;
9fed81dc40f5a1 Namhyung Kim      2010-10-27  1131  		struct iovec __user *uiov = datavp;
2225a122ae26d5 Suresh Siddha     2010-02-11  1132  
2225a122ae26d5 Suresh Siddha     2010-02-11  1133  		if (!access_ok(VERIFY_WRITE, uiov, sizeof(*uiov)))
2225a122ae26d5 Suresh Siddha     2010-02-11  1134  			return -EFAULT;
2225a122ae26d5 Suresh Siddha     2010-02-11  1135  
2225a122ae26d5 Suresh Siddha     2010-02-11 @1136  		if (__get_user(kiov.iov_base, &uiov->iov_base) ||
2225a122ae26d5 Suresh Siddha     2010-02-11  1137  		    __get_user(kiov.iov_len, &uiov->iov_len))
2225a122ae26d5 Suresh Siddha     2010-02-11  1138  			return -EFAULT;
2225a122ae26d5 Suresh Siddha     2010-02-11  1139  
2225a122ae26d5 Suresh Siddha     2010-02-11  1140  		ret = ptrace_regset(child, request, addr, &kiov);
2225a122ae26d5 Suresh Siddha     2010-02-11  1141  		if (!ret)
2225a122ae26d5 Suresh Siddha     2010-02-11  1142  			ret = __put_user(kiov.iov_len, &uiov->iov_len);
2225a122ae26d5 Suresh Siddha     2010-02-11  1143  		break;
2225a122ae26d5 Suresh Siddha     2010-02-11  1144  	}
2225a122ae26d5 Suresh Siddha     2010-02-11  1145  #endif
f8e529ed941ba2 Tycho Andersen    2015-10-27  1146  
f8e529ed941ba2 Tycho Andersen    2015-10-27  1147  	case PTRACE_SECCOMP_GET_FILTER:
f8e529ed941ba2 Tycho Andersen    2015-10-27  1148  		ret = seccomp_get_filter(child, addr, datavp);
f8e529ed941ba2 Tycho Andersen    2015-10-27  1149  		break;
f8e529ed941ba2 Tycho Andersen    2015-10-27  1150  
26500475ac1b49 Tycho Andersen    2017-10-11  1151  	case PTRACE_SECCOMP_GET_METADATA:
26500475ac1b49 Tycho Andersen    2017-10-11  1152  		ret = seccomp_get_metadata(child, addr, datavp);
26500475ac1b49 Tycho Andersen    2017-10-11  1153  		break;
26500475ac1b49 Tycho Andersen    2017-10-11  1154  
^1da177e4c3f41 Linus Torvalds    2005-04-16  1155  	default:
^1da177e4c3f41 Linus Torvalds    2005-04-16  1156  		break;
^1da177e4c3f41 Linus Torvalds    2005-04-16  1157  	}
^1da177e4c3f41 Linus Torvalds    2005-04-16  1158  
^1da177e4c3f41 Linus Torvalds    2005-04-16  1159  	return ret;
^1da177e4c3f41 Linus Torvalds    2005-04-16  1160  }
481bed45424753 Christoph Hellwig 2005-11-07  1161  

:::::: The code at line 1136 was first introduced by commit
:::::: 2225a122ae26d542bdce523d9d87a4a7ba10e07b ptrace: Add support for generic PTRACE_GETREGSET/PTRACE_SETREGSET

:::::: TO: Suresh Siddha <suresh.b.siddha@intel.com>
:::::: CC: H. Peter Anvin <hpa@zytor.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
