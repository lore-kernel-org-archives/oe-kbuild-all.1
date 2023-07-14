Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6B7263C
	for <oe-kbuild-all@lists.linux.dev>; Fri, 14 Jul 2023 01:04:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689296678; x=1720832678;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/DDHZs0fNQFBfXJsw4hoVHTwhnQvpHcoNAZM6PNHgHQ=;
  b=IZ1srWHEjjZvFlvH+SVmb7CHfzbb5J8jyTV3gDXh9j+3fMBwTyEqm40g
   ctV0D0iJYJ929BQj8AJ62Qyia/3/SsqdKE3XCLxaI6Ee7oZ/+s/uwWGtA
   8pjkUqUTzqa57uF3272QSf/P0PU6/JdsVvvYJRDH74C1wkcyUE6XdsTCk
   SHfkSHmmLTwBdcduogsyWFhfMJwtM0My4hkVrDHkiixeaUtSbC2QEYuvl
   maAccFdPerrSt6ILpywadlEEt4+Nh+MT9AVYkcAHeirJbiMNPffMmBpHc
   YPbz56MP9US4ind7DxcJxqkPjgAjRmTgyshLnKATVomk8D1UU9yXbDU7g
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10770"; a="355297959"
X-IronPort-AV: E=Sophos;i="6.01,204,1684825200"; 
   d="scan'208";a="355297959"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jul 2023 18:03:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10770"; a="699482518"
X-IronPort-AV: E=Sophos;i="6.01,204,1684825200"; 
   d="scan'208";a="699482518"
Received: from lkp-server01.sh.intel.com (HELO c544d7fc5005) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 13 Jul 2023 18:03:15 -0700
Received: from kbuild by c544d7fc5005 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qK7DG-00071N-2B;
	Fri, 14 Jul 2023 01:03:14 +0000
Date: Fri, 14 Jul 2023 09:02:19 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com,
	Guenter Roeck <groeck@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-6.1 25/98]
 arch/x86/include/asm/thread_info.h:92:27: error: 'NR_syscalls' undeclared
 here (not in a function); did you mean 'si_syscall'?
Message-ID: <202307140929.NmyZw6vQ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-6.1
head:   3406326f20f2dab921145b51a056de30dbf8fa8e
commit: 8e63d0f2d658f3c2dd3e44183dce75b28b638c8e [25/98] FIXUP: CHROMIUM: create alt-syscall infrastructure
config: x86_64-randconfig-r036-20230714 (https://download.01.org/0day-ci/archive/20230714/202307140929.NmyZw6vQ-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230714/202307140929.NmyZw6vQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307140929.NmyZw6vQ-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/thread_info.h:60,
                    from arch/x86/include/asm/preempt.h:7,
                    from include/linux/preempt.h:78,
                    from include/linux/rcupdate.h:27,
                    from include/linux/init_task.h:5,
                    from init/init_task.c:2:
>> arch/x86/include/asm/thread_info.h:92:27: error: 'NR_syscalls' undeclared here (not in a function); did you mean 'si_syscall'?
      92 |         .nr_syscalls    = NR_syscalls,          \
         |                           ^~~~~~~~~~~
   arch/x86/include/asm/thread_info.h:102:9: note: in expansion of macro 'INIT_THREAD_INFO_SYSCALL'
     102 |         INIT_THREAD_INFO_SYSCALL                \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
   init/init_task.c:71:27: note: in expansion of macro 'INIT_THREAD_INFO'
      71 |         .thread_info    = INIT_THREAD_INFO(init_task),
         |                           ^~~~~~~~~~~~~~~~
>> arch/x86/include/asm/thread_info.h:93:27: error: 'sys_call_table' undeclared here (not in a function); did you mean 'sys_desc_table'?
      93 |         .sys_call_table = sys_call_table,       \
         |                           ^~~~~~~~~~~~~~
   arch/x86/include/asm/thread_info.h:102:9: note: in expansion of macro 'INIT_THREAD_INFO_SYSCALL'
     102 |         INIT_THREAD_INFO_SYSCALL                \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
   init/init_task.c:71:27: note: in expansion of macro 'INIT_THREAD_INFO'
      71 |         .thread_info    = INIT_THREAD_INFO(init_task),
         |                           ^~~~~~~~~~~~~~~~
>> arch/x86/include/asm/thread_info.h:86:35: error: 'IA32_NR_syscalls' undeclared here (not in a function)
      86 |         .ia32_nr_syscalls       = IA32_NR_syscalls,             \
         |                                   ^~~~~~~~~~~~~~~~
   arch/x86/include/asm/thread_info.h:94:9: note: in expansion of macro 'INIT_THREAD_INFO_SYSCALL_COMPAT'
      94 |         INIT_THREAD_INFO_SYSCALL_COMPAT
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/include/asm/thread_info.h:102:9: note: in expansion of macro 'INIT_THREAD_INFO_SYSCALL'
     102 |         INIT_THREAD_INFO_SYSCALL                \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
   init/init_task.c:71:27: note: in expansion of macro 'INIT_THREAD_INFO'
      71 |         .thread_info    = INIT_THREAD_INFO(init_task),
         |                           ^~~~~~~~~~~~~~~~
>> arch/x86/include/asm/thread_info.h:87:35: error: 'ia32_sys_call_table' undeclared here (not in a function)
      87 |         .ia32_sys_call_table    = ia32_sys_call_table,
         |                                   ^~~~~~~~~~~~~~~~~~~
   arch/x86/include/asm/thread_info.h:94:9: note: in expansion of macro 'INIT_THREAD_INFO_SYSCALL_COMPAT'
      94 |         INIT_THREAD_INFO_SYSCALL_COMPAT
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/include/asm/thread_info.h:102:9: note: in expansion of macro 'INIT_THREAD_INFO_SYSCALL'
     102 |         INIT_THREAD_INFO_SYSCALL                \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
   init/init_task.c:71:27: note: in expansion of macro 'INIT_THREAD_INFO'
      71 |         .thread_info    = INIT_THREAD_INFO(init_task),
         |                           ^~~~~~~~~~~~~~~~


vim +92 arch/x86/include/asm/thread_info.h

c8061485a0d756 Heiko Carstens 2016-10-19  82  
3e8e28fff0faf2 Guenter Roeck  2018-09-21  83  #ifdef CONFIG_ALT_SYSCALL
3e8e28fff0faf2 Guenter Roeck  2018-09-21  84  # ifdef CONFIG_IA32_EMULATION
3e8e28fff0faf2 Guenter Roeck  2018-09-21  85  #  define INIT_THREAD_INFO_SYSCALL_COMPAT			\
3e8e28fff0faf2 Guenter Roeck  2018-09-21 @86  	.ia32_nr_syscalls	= IA32_NR_syscalls,		\
3e8e28fff0faf2 Guenter Roeck  2018-09-21 @87  	.ia32_sys_call_table	= ia32_sys_call_table,
3e8e28fff0faf2 Guenter Roeck  2018-09-21  88  # else
3e8e28fff0faf2 Guenter Roeck  2018-09-21  89  #  define INIT_THREAD_INFO_SYSCALL_COMPAT /* */
3e8e28fff0faf2 Guenter Roeck  2018-09-21  90  # endif
3e8e28fff0faf2 Guenter Roeck  2018-09-21  91  # define INIT_THREAD_INFO_SYSCALL \
3e8e28fff0faf2 Guenter Roeck  2018-09-21 @92  	.nr_syscalls	= NR_syscalls,		\
3e8e28fff0faf2 Guenter Roeck  2018-09-21 @93  	.sys_call_table	= sys_call_table,	\
3e8e28fff0faf2 Guenter Roeck  2018-09-21  94  	INIT_THREAD_INFO_SYSCALL_COMPAT
3e8e28fff0faf2 Guenter Roeck  2018-09-21  95  #else
3e8e28fff0faf2 Guenter Roeck  2018-09-21  96  # define INIT_THREAD_INFO_SYSCALL /* */
3e8e28fff0faf2 Guenter Roeck  2018-09-21  97  #endif
3e8e28fff0faf2 Guenter Roeck  2018-09-21  98  

:::::: The code at line 92 was first introduced by commit
:::::: 3e8e28fff0faf2d56ccb4c0cb96189194a5402fb CHROMIUM: x86: Add alt-syscall support

:::::: TO: Guenter Roeck <groeck@chromium.org>
:::::: CC: Tzung-Bi Shih <tzungbi@chromium.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
