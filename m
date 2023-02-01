Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BD9F7E5
	for <oe-kbuild-all@lists.linux.dev>; Wed,  1 Feb 2023 03:20:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675221643; x=1706757643;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=NUjEbu4t670BS1/uBQ7t8bl9herTyXHQ/P7QU5IUNgw=;
  b=k7cYTzroDz+L4YIfeIvi0rkCpnoa6a/NovOmPnz5B0eipcHMHfen8GYg
   M6i1hftd7bgidpcBIBNWsBYvI5M2ZQXe4jVDq/T6ipUW0it7sOpEZADCH
   3zzBOpC4zlc1xfEmZoBHGa40688GL1l5mMe3iqmdmpsrqXgH3QuonCBz/
   jicLu+TOgSS0FZGncixlQbR23MsodU+Os8OJIj2+4pYGT0ppBe1ZmfAUT
   CT1A/tBD+0OdNadKxHLA7VDh0zQlhAdnSxTWAvUXxCXnanmWcIdJojMiH
   Dirt1tooG/5ZgGvwqrGo/ugy2pSm6rX9ECYyfoaaTRA8u+AByzOqydFg3
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10607"; a="390394160"
X-IronPort-AV: E=Sophos;i="5.97,263,1669104000"; 
   d="scan'208";a="390394160"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jan 2023 19:20:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10607"; a="910153103"
X-IronPort-AV: E=Sophos;i="5.97,263,1669104000"; 
   d="scan'208";a="910153103"
Received: from lkp-server01.sh.intel.com (HELO ffa7f14d1d0f) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 31 Jan 2023 19:20:41 -0800
Received: from kbuild by ffa7f14d1d0f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pN3ft-0004zz-05;
	Wed, 01 Feb 2023 03:20:41 +0000
Date: Wed, 1 Feb 2023 11:19:54 +0800
From: kernel test robot <lkp@intel.com>
To: Josh Poimboeuf <jpoimboe@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jpoimboe:arch-cpu-idle-dead-noreturn 1/1]
 arch/ia64/kernel/process.c:231:1: warning: 'noreturn' function does return
Message-ID: <202302011113.OLlUCmky-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jpoimboe/linux.git arch-cpu-idle-dead-noreturn
head:   4705aa679062b6b63e36f46a6f02854a67bb586f
commit: 4705aa679062b6b63e36f46a6f02854a67bb586f [1/1] cpu: Make arch_cpu_idle_dead() __noreturn
config: ia64-allmodconfig (https://download.01.org/0day-ci/archive/20230201/202302011113.OLlUCmky-lkp@intel.com/config)
compiler: ia64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/jpoimboe/linux.git/commit/?id=4705aa679062b6b63e36f46a6f02854a67bb586f
        git remote add jpoimboe https://git.kernel.org/pub/scm/linux/kernel/git/jpoimboe/linux.git
        git fetch --no-tags jpoimboe arch-cpu-idle-dead-noreturn
        git checkout 4705aa679062b6b63e36f46a6f02854a67bb586f
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=ia64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=ia64 SHELL=/bin/bash arch/ia64/kernel/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   arch/ia64/kernel/process.c:156:1: warning: no previous prototype for 'console_print' [-Wmissing-prototypes]
     156 | console_print(const char *s)
         | ^~~~~~~~~~~~~
   arch/ia64/kernel/process.c:162:1: warning: no previous prototype for 'do_notify_resume_user' [-Wmissing-prototypes]
     162 | do_notify_resume_user(sigset_t *unused, struct sigscratch *scr, long in_syscall)
         | ^~~~~~~~~~~~~~~~~~~~~
   arch/ia64/kernel/process.c:404:17: warning: no previous prototype for 'ia64_clone' [-Wmissing-prototypes]
     404 | asmlinkage long ia64_clone(unsigned long clone_flags, unsigned long stack_start,
         |                 ^~~~~~~~~~
   arch/ia64/kernel/process.c:558:1: warning: no previous prototype for 'cpu_halt' [-Wmissing-prototypes]
     558 | cpu_halt (void)
         | ^~~~~~~~
   arch/ia64/kernel/process.c: In function 'arch_cpu_idle_dead':
>> arch/ia64/kernel/process.c:231:1: warning: 'noreturn' function does return
     231 | }
         | ^


vim +/noreturn +231 arch/ia64/kernel/process.c

^1da177e4c3f41 Linus Torvalds  2005-04-16  227  
91d591c387af34 Thomas Gleixner 2013-03-21  228  void arch_cpu_idle_dead(void)
^1da177e4c3f41 Linus Torvalds  2005-04-16  229  {
91d591c387af34 Thomas Gleixner 2013-03-21  230  	play_dead();
0888f06ac99f99 Ingo Molnar     2006-12-22 @231  }
1e185b97b43640 Kenneth W Chen  2005-11-15  232  

:::::: The code at line 231 was first introduced by commit
:::::: 0888f06ac99f993df2bb4c479f5b9306dafe154f [PATCH] sched: fix bad missed wakeups in the i386, x86_64, ia64, ACPI and APM idle code

:::::: TO: Ingo Molnar <mingo@elte.hu>
:::::: CC: Linus Torvalds <torvalds@woody.osdl.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
