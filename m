Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DF8F1640D
	for <oe-kbuild-all@lists.linux.dev>; Tue, 12 Sep 2023 07:51:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694505098; x=1726041098;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=99uRhNgRIUjH2ruFCS2w2ljau79T+hkkQAevM1VqFqY=;
  b=jRc42cOJVzST+3cPu9cMMn67Xu6xvjJmWiMC6NZs01wYorQ5Au956NWp
   o0JdEy6e+vcAHN+In/mi7F8Zy2/O6ujXVVeFR/1TZR1OB8VonRZhkSctY
   ynkNZK0o4uhG5qciFApG6pwTKyotCFR25Y0yV0wHw82x6+oCVnOZQetiY
   wfjDSLNbpuswSwV4gdMXaCBg0ZwmJH2ureMyKqsiDRUzDENotumXCJlXF
   L/0bvCw2yc9Y3l25eKDCkVgFV/+Nav9wVL/JLFykh2P6m/z0YIHNB/Ftl
   +zgrzLZPYb2Jo/ZlqFUiZYd/QnyPQMC5U1T56rCA0SWOUay2iOiyP9nw8
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10830"; a="375635242"
X-IronPort-AV: E=Sophos;i="6.02,245,1688454000"; 
   d="scan'208";a="375635242"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Sep 2023 00:51:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10830"; a="858698688"
X-IronPort-AV: E=Sophos;i="6.02,245,1688454000"; 
   d="scan'208";a="858698688"
Received: from lkp-server02.sh.intel.com (HELO 1e56c5165d33) ([10.239.97.151])
  by fmsmga002.fm.intel.com with ESMTP; 12 Sep 2023 00:51:36 -0700
Received: from kbuild by 1e56c5165d33 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qfyBH-00006Z-0Q;
	Tue, 12 Sep 2023 07:51:32 +0000
Date: Tue, 12 Sep 2023 15:51:00 +0800
From: kernel test robot <lkp@intel.com>
To: Mark Brown <broonie@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [broonie-ci:arm64-gcs 24/39] arch/loongarch/kernel/syscall.c:21:40:
 warning: excess elements in array initializer
Message-ID: <202309121532.DRqWdsmS-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/ci.git arm64-gcs
head:   5886243daf585a7ed8f45646340af1ee602e1edd
commit: 21d72b8bd77f499b2d293febab37b9dbae5e46d4 [24/39] arm64/mm: Implement map_shadow_stack()
config: loongarch-allnoconfig (https://download.01.org/0day-ci/archive/20230912/202309121532.DRqWdsmS-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230912/202309121532.DRqWdsmS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309121532.DRqWdsmS-lkp@intel.com/

All warnings (new ones prefixed by >>):

         |                                        ^
   include/uapi/asm-generic/unistd.h:804:1: note: in expansion of macro '__SYSCALL'
     804 | __SYSCALL(__NR_landlock_add_rule, sys_landlock_add_rule)
         | ^~~~~~~~~
   arch/loongarch/kernel/syscall.c:21:40: note: (near initialization for 'sys_call_table[445]')
      21 | #define __SYSCALL(nr, call)     [nr] = (call),
         |                                        ^
   include/uapi/asm-generic/unistd.h:804:1: note: in expansion of macro '__SYSCALL'
     804 | __SYSCALL(__NR_landlock_add_rule, sys_landlock_add_rule)
         | ^~~~~~~~~
   arch/loongarch/kernel/syscall.c:21:40: warning: initialized field overwritten [-Woverride-init]
      21 | #define __SYSCALL(nr, call)     [nr] = (call),
         |                                        ^
   include/uapi/asm-generic/unistd.h:806:1: note: in expansion of macro '__SYSCALL'
     806 | __SYSCALL(__NR_landlock_restrict_self, sys_landlock_restrict_self)
         | ^~~~~~~~~
   arch/loongarch/kernel/syscall.c:21:40: note: (near initialization for 'sys_call_table[446]')
      21 | #define __SYSCALL(nr, call)     [nr] = (call),
         |                                        ^
   include/uapi/asm-generic/unistd.h:806:1: note: in expansion of macro '__SYSCALL'
     806 | __SYSCALL(__NR_landlock_restrict_self, sys_landlock_restrict_self)
         | ^~~~~~~~~
   arch/loongarch/kernel/syscall.c:21:40: warning: initialized field overwritten [-Woverride-init]
      21 | #define __SYSCALL(nr, call)     [nr] = (call),
         |                                        ^
   include/uapi/asm-generic/unistd.h:814:1: note: in expansion of macro '__SYSCALL'
     814 | __SYSCALL(__NR_process_mrelease, sys_process_mrelease)
         | ^~~~~~~~~
   arch/loongarch/kernel/syscall.c:21:40: note: (near initialization for 'sys_call_table[448]')
      21 | #define __SYSCALL(nr, call)     [nr] = (call),
         |                                        ^
   include/uapi/asm-generic/unistd.h:814:1: note: in expansion of macro '__SYSCALL'
     814 | __SYSCALL(__NR_process_mrelease, sys_process_mrelease)
         | ^~~~~~~~~
   arch/loongarch/kernel/syscall.c:21:40: warning: initialized field overwritten [-Woverride-init]
      21 | #define __SYSCALL(nr, call)     [nr] = (call),
         |                                        ^
   include/uapi/asm-generic/unistd.h:816:1: note: in expansion of macro '__SYSCALL'
     816 | __SYSCALL(__NR_futex_waitv, sys_futex_waitv)
         | ^~~~~~~~~
   arch/loongarch/kernel/syscall.c:21:40: note: (near initialization for 'sys_call_table[449]')
      21 | #define __SYSCALL(nr, call)     [nr] = (call),
         |                                        ^
   include/uapi/asm-generic/unistd.h:816:1: note: in expansion of macro '__SYSCALL'
     816 | __SYSCALL(__NR_futex_waitv, sys_futex_waitv)
         | ^~~~~~~~~
   arch/loongarch/kernel/syscall.c:21:40: warning: initialized field overwritten [-Woverride-init]
      21 | #define __SYSCALL(nr, call)     [nr] = (call),
         |                                        ^
   include/uapi/asm-generic/unistd.h:818:1: note: in expansion of macro '__SYSCALL'
     818 | __SYSCALL(__NR_set_mempolicy_home_node, sys_set_mempolicy_home_node)
         | ^~~~~~~~~
   arch/loongarch/kernel/syscall.c:21:40: note: (near initialization for 'sys_call_table[450]')
      21 | #define __SYSCALL(nr, call)     [nr] = (call),
         |                                        ^
   include/uapi/asm-generic/unistd.h:818:1: note: in expansion of macro '__SYSCALL'
     818 | __SYSCALL(__NR_set_mempolicy_home_node, sys_set_mempolicy_home_node)
         | ^~~~~~~~~
   arch/loongarch/kernel/syscall.c:21:40: warning: initialized field overwritten [-Woverride-init]
      21 | #define __SYSCALL(nr, call)     [nr] = (call),
         |                                        ^
   include/uapi/asm-generic/unistd.h:821:1: note: in expansion of macro '__SYSCALL'
     821 | __SYSCALL(__NR_cachestat, sys_cachestat)
         | ^~~~~~~~~
   arch/loongarch/kernel/syscall.c:21:40: note: (near initialization for 'sys_call_table[451]')
      21 | #define __SYSCALL(nr, call)     [nr] = (call),
         |                                        ^
   include/uapi/asm-generic/unistd.h:821:1: note: in expansion of macro '__SYSCALL'
     821 | __SYSCALL(__NR_cachestat, sys_cachestat)
         | ^~~~~~~~~
   arch/loongarch/kernel/syscall.c:21:40: warning: initialized field overwritten [-Woverride-init]
      21 | #define __SYSCALL(nr, call)     [nr] = (call),
         |                                        ^
   include/uapi/asm-generic/unistd.h:824:1: note: in expansion of macro '__SYSCALL'
     824 | __SYSCALL(__NR_fchmodat2, sys_fchmodat2)
         | ^~~~~~~~~
   arch/loongarch/kernel/syscall.c:21:40: note: (near initialization for 'sys_call_table[452]')
      21 | #define __SYSCALL(nr, call)     [nr] = (call),
         |                                        ^
   include/uapi/asm-generic/unistd.h:824:1: note: in expansion of macro '__SYSCALL'
     824 | __SYSCALL(__NR_fchmodat2, sys_fchmodat2)
         | ^~~~~~~~~
   include/uapi/asm-generic/unistd.h:826:31: error: array index in initializer exceeds array bounds
     826 | #define __NR_map_shadow_stack 453
         |                               ^~~
   arch/loongarch/kernel/syscall.c:21:34: note: in definition of macro '__SYSCALL'
      21 | #define __SYSCALL(nr, call)     [nr] = (call),
         |                                  ^~
   include/uapi/asm-generic/unistd.h:827:11: note: in expansion of macro '__NR_map_shadow_stack'
     827 | __SYSCALL(__NR_map_shadow_stack, sys_map_shadow_stack)
         |           ^~~~~~~~~~~~~~~~~~~~~
   include/uapi/asm-generic/unistd.h:826:31: note: (near initialization for 'sys_call_table')
     826 | #define __NR_map_shadow_stack 453
         |                               ^~~
   arch/loongarch/kernel/syscall.c:21:34: note: in definition of macro '__SYSCALL'
      21 | #define __SYSCALL(nr, call)     [nr] = (call),
         |                                  ^~
   include/uapi/asm-generic/unistd.h:827:11: note: in expansion of macro '__NR_map_shadow_stack'
     827 | __SYSCALL(__NR_map_shadow_stack, sys_map_shadow_stack)
         |           ^~~~~~~~~~~~~~~~~~~~~
>> arch/loongarch/kernel/syscall.c:21:40: warning: excess elements in array initializer
      21 | #define __SYSCALL(nr, call)     [nr] = (call),
         |                                        ^
   include/uapi/asm-generic/unistd.h:827:1: note: in expansion of macro '__SYSCALL'
     827 | __SYSCALL(__NR_map_shadow_stack, sys_map_shadow_stack)
         | ^~~~~~~~~
   arch/loongarch/kernel/syscall.c:21:40: note: (near initialization for 'sys_call_table')
      21 | #define __SYSCALL(nr, call)     [nr] = (call),
         |                                        ^
   include/uapi/asm-generic/unistd.h:827:1: note: in expansion of macro '__SYSCALL'
     827 | __SYSCALL(__NR_map_shadow_stack, sys_map_shadow_stack)
         | ^~~~~~~~~
   arch/loongarch/kernel/syscall.c:40:14: warning: no previous prototype for 'do_syscall' [-Wmissing-prototypes]
      40 | void noinstr do_syscall(struct pt_regs *regs)
         |              ^~~~~~~~~~


vim +21 arch/loongarch/kernel/syscall.c

be769645a2aef57 Huacai Chen 2022-05-31  19  
be769645a2aef57 Huacai Chen 2022-05-31  20  #undef __SYSCALL
be769645a2aef57 Huacai Chen 2022-05-31 @21  #define __SYSCALL(nr, call)	[nr] = (call),
be769645a2aef57 Huacai Chen 2022-05-31  22  

:::::: The code at line 21 was first introduced by commit
:::::: be769645a2aef577f07afdcb4de8fad20b6d57c0 LoongArch: Add system call support

:::::: TO: Huacai Chen <chenhuacai@loongson.cn>
:::::: CC: Huacai Chen <chenhuacai@loongson.cn>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
