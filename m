Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD35F14ABA
	for <oe-kbuild-all@lists.linux.dev>; Tue, 12 Sep 2023 02:56:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694487375; x=1726023375;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=b1L2TBx9xWKpQvnn+dLvg92Dv2GeRq/39mh0vbUCF9I=;
  b=f/A5mnk7EVPKDqtCK1g3nslvurSDjgMLQK7ne2eCf5d9BXQ+hU3qiwF9
   drwSRVIqf5W9zX523xp3fCAf3pWoEV8ypDRsyifOIsWbuyacX7geCvyY/
   J2c1ChnCiR2Y/LVTu/tZOAOMxrzcJgAHbkqQvgaquWjftwSbsojZBym4h
   b8XI9FC1soXEAs/LLKhdmmCDNd/WxYH45561AJiizO2AVa5fRaY1EwZjs
   aLUrJjC0jg0euKz5DjAaNrVdMHflZ6GHo0ttiFIMLj9eoKYMwES1GnRxk
   j91oqCobKBDTwnzpSpDUnjvtZvuEq1VISxVlExcS9g36Ed5V3NDyOzFfS
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10830"; a="464629276"
X-IronPort-AV: E=Sophos;i="6.02,244,1688454000"; 
   d="scan'208";a="464629276"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Sep 2023 19:56:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10830"; a="833735255"
X-IronPort-AV: E=Sophos;i="6.02,244,1688454000"; 
   d="scan'208";a="833735255"
Received: from lkp-server01.sh.intel.com (HELO 59b3c6e06877) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 11 Sep 2023 19:56:11 -0700
Received: from kbuild by 59b3c6e06877 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qftZR-0007Aw-0T;
	Tue, 12 Sep 2023 02:56:09 +0000
Date: Tue, 12 Sep 2023 10:55:49 +0800
From: kernel test robot <lkp@intel.com>
To: Mark Brown <broonie@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [broonie-ci:arm64-gcs 24/39]
 include/uapi/asm-generic/unistd.h:826:31: error: array index in initializer
 exceeds array bounds
Message-ID: <202309121000.pE2B8nUF-lkp@intel.com>
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
config: arm64-allnoconfig (https://download.01.org/0day-ci/archive/20230912/202309121000.pE2B8nUF-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230912/202309121000.pE2B8nUF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309121000.pE2B8nUF-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

         |                                        ^~~~~~~~
   include/uapi/asm-generic/unistd.h:802:1: note: in expansion of macro '__SYSCALL'
     802 | __SYSCALL(__NR_landlock_create_ruleset, sys_landlock_create_ruleset)
         | ^~~~~~~~~
   arch/arm64/kernel/sys.c:56:40: warning: initialized field overwritten [-Woverride-init]
      56 | #define __SYSCALL(nr, sym)      [nr] = __arm64_##sym,
         |                                        ^~~~~~~~
   include/uapi/asm-generic/unistd.h:804:1: note: in expansion of macro '__SYSCALL'
     804 | __SYSCALL(__NR_landlock_add_rule, sys_landlock_add_rule)
         | ^~~~~~~~~
   arch/arm64/kernel/sys.c:56:40: note: (near initialization for 'sys_call_table[445]')
      56 | #define __SYSCALL(nr, sym)      [nr] = __arm64_##sym,
         |                                        ^~~~~~~~
   include/uapi/asm-generic/unistd.h:804:1: note: in expansion of macro '__SYSCALL'
     804 | __SYSCALL(__NR_landlock_add_rule, sys_landlock_add_rule)
         | ^~~~~~~~~
   arch/arm64/kernel/sys.c:56:40: warning: initialized field overwritten [-Woverride-init]
      56 | #define __SYSCALL(nr, sym)      [nr] = __arm64_##sym,
         |                                        ^~~~~~~~
   include/uapi/asm-generic/unistd.h:806:1: note: in expansion of macro '__SYSCALL'
     806 | __SYSCALL(__NR_landlock_restrict_self, sys_landlock_restrict_self)
         | ^~~~~~~~~
   arch/arm64/kernel/sys.c:56:40: note: (near initialization for 'sys_call_table[446]')
      56 | #define __SYSCALL(nr, sym)      [nr] = __arm64_##sym,
         |                                        ^~~~~~~~
   include/uapi/asm-generic/unistd.h:806:1: note: in expansion of macro '__SYSCALL'
     806 | __SYSCALL(__NR_landlock_restrict_self, sys_landlock_restrict_self)
         | ^~~~~~~~~
   arch/arm64/kernel/sys.c:56:40: warning: initialized field overwritten [-Woverride-init]
      56 | #define __SYSCALL(nr, sym)      [nr] = __arm64_##sym,
         |                                        ^~~~~~~~
   include/uapi/asm-generic/unistd.h:810:1: note: in expansion of macro '__SYSCALL'
     810 | __SYSCALL(__NR_memfd_secret, sys_memfd_secret)
         | ^~~~~~~~~
   arch/arm64/kernel/sys.c:56:40: note: (near initialization for 'sys_call_table[447]')
      56 | #define __SYSCALL(nr, sym)      [nr] = __arm64_##sym,
         |                                        ^~~~~~~~
   include/uapi/asm-generic/unistd.h:810:1: note: in expansion of macro '__SYSCALL'
     810 | __SYSCALL(__NR_memfd_secret, sys_memfd_secret)
         | ^~~~~~~~~
   arch/arm64/kernel/sys.c:56:40: warning: initialized field overwritten [-Woverride-init]
      56 | #define __SYSCALL(nr, sym)      [nr] = __arm64_##sym,
         |                                        ^~~~~~~~
   include/uapi/asm-generic/unistd.h:814:1: note: in expansion of macro '__SYSCALL'
     814 | __SYSCALL(__NR_process_mrelease, sys_process_mrelease)
         | ^~~~~~~~~
   arch/arm64/kernel/sys.c:56:40: note: (near initialization for 'sys_call_table[448]')
      56 | #define __SYSCALL(nr, sym)      [nr] = __arm64_##sym,
         |                                        ^~~~~~~~
   include/uapi/asm-generic/unistd.h:814:1: note: in expansion of macro '__SYSCALL'
     814 | __SYSCALL(__NR_process_mrelease, sys_process_mrelease)
         | ^~~~~~~~~
   arch/arm64/kernel/sys.c:56:40: warning: initialized field overwritten [-Woverride-init]
      56 | #define __SYSCALL(nr, sym)      [nr] = __arm64_##sym,
         |                                        ^~~~~~~~
   include/uapi/asm-generic/unistd.h:816:1: note: in expansion of macro '__SYSCALL'
     816 | __SYSCALL(__NR_futex_waitv, sys_futex_waitv)
         | ^~~~~~~~~
   arch/arm64/kernel/sys.c:56:40: note: (near initialization for 'sys_call_table[449]')
      56 | #define __SYSCALL(nr, sym)      [nr] = __arm64_##sym,
         |                                        ^~~~~~~~
   include/uapi/asm-generic/unistd.h:816:1: note: in expansion of macro '__SYSCALL'
     816 | __SYSCALL(__NR_futex_waitv, sys_futex_waitv)
         | ^~~~~~~~~
   arch/arm64/kernel/sys.c:56:40: warning: initialized field overwritten [-Woverride-init]
      56 | #define __SYSCALL(nr, sym)      [nr] = __arm64_##sym,
         |                                        ^~~~~~~~
   include/uapi/asm-generic/unistd.h:818:1: note: in expansion of macro '__SYSCALL'
     818 | __SYSCALL(__NR_set_mempolicy_home_node, sys_set_mempolicy_home_node)
         | ^~~~~~~~~
   arch/arm64/kernel/sys.c:56:40: note: (near initialization for 'sys_call_table[450]')
      56 | #define __SYSCALL(nr, sym)      [nr] = __arm64_##sym,
         |                                        ^~~~~~~~
   include/uapi/asm-generic/unistd.h:818:1: note: in expansion of macro '__SYSCALL'
     818 | __SYSCALL(__NR_set_mempolicy_home_node, sys_set_mempolicy_home_node)
         | ^~~~~~~~~
   arch/arm64/kernel/sys.c:56:40: warning: initialized field overwritten [-Woverride-init]
      56 | #define __SYSCALL(nr, sym)      [nr] = __arm64_##sym,
         |                                        ^~~~~~~~
   include/uapi/asm-generic/unistd.h:821:1: note: in expansion of macro '__SYSCALL'
     821 | __SYSCALL(__NR_cachestat, sys_cachestat)
         | ^~~~~~~~~
   arch/arm64/kernel/sys.c:56:40: note: (near initialization for 'sys_call_table[451]')
      56 | #define __SYSCALL(nr, sym)      [nr] = __arm64_##sym,
         |                                        ^~~~~~~~
   include/uapi/asm-generic/unistd.h:821:1: note: in expansion of macro '__SYSCALL'
     821 | __SYSCALL(__NR_cachestat, sys_cachestat)
         | ^~~~~~~~~
   arch/arm64/kernel/sys.c:56:40: warning: initialized field overwritten [-Woverride-init]
      56 | #define __SYSCALL(nr, sym)      [nr] = __arm64_##sym,
         |                                        ^~~~~~~~
   include/uapi/asm-generic/unistd.h:824:1: note: in expansion of macro '__SYSCALL'
     824 | __SYSCALL(__NR_fchmodat2, sys_fchmodat2)
         | ^~~~~~~~~
   arch/arm64/kernel/sys.c:56:40: note: (near initialization for 'sys_call_table[452]')
      56 | #define __SYSCALL(nr, sym)      [nr] = __arm64_##sym,
         |                                        ^~~~~~~~
   include/uapi/asm-generic/unistd.h:824:1: note: in expansion of macro '__SYSCALL'
     824 | __SYSCALL(__NR_fchmodat2, sys_fchmodat2)
         | ^~~~~~~~~
>> include/uapi/asm-generic/unistd.h:826:31: error: array index in initializer exceeds array bounds
     826 | #define __NR_map_shadow_stack 453
         |                               ^~~
   arch/arm64/kernel/sys.c:56:34: note: in definition of macro '__SYSCALL'
      56 | #define __SYSCALL(nr, sym)      [nr] = __arm64_##sym,
         |                                  ^~
   include/uapi/asm-generic/unistd.h:827:11: note: in expansion of macro '__NR_map_shadow_stack'
     827 | __SYSCALL(__NR_map_shadow_stack, sys_map_shadow_stack)
         |           ^~~~~~~~~~~~~~~~~~~~~
   include/uapi/asm-generic/unistd.h:826:31: note: (near initialization for 'sys_call_table')
     826 | #define __NR_map_shadow_stack 453
         |                               ^~~
   arch/arm64/kernel/sys.c:56:34: note: in definition of macro '__SYSCALL'
      56 | #define __SYSCALL(nr, sym)      [nr] = __arm64_##sym,
         |                                  ^~
   include/uapi/asm-generic/unistd.h:827:11: note: in expansion of macro '__NR_map_shadow_stack'
     827 | __SYSCALL(__NR_map_shadow_stack, sys_map_shadow_stack)
         |           ^~~~~~~~~~~~~~~~~~~~~
>> arch/arm64/kernel/sys.c:56:40: warning: excess elements in array initializer
      56 | #define __SYSCALL(nr, sym)      [nr] = __arm64_##sym,
         |                                        ^~~~~~~~
   include/uapi/asm-generic/unistd.h:827:1: note: in expansion of macro '__SYSCALL'
     827 | __SYSCALL(__NR_map_shadow_stack, sys_map_shadow_stack)
         | ^~~~~~~~~
   arch/arm64/kernel/sys.c:56:40: note: (near initialization for 'sys_call_table')
      56 | #define __SYSCALL(nr, sym)      [nr] = __arm64_##sym,
         |                                        ^~~~~~~~
   include/uapi/asm-generic/unistd.h:827:1: note: in expansion of macro '__SYSCALL'
     827 | __SYSCALL(__NR_map_shadow_stack, sys_map_shadow_stack)
         | ^~~~~~~~~


vim +826 include/uapi/asm-generic/unistd.h

   825	
 > 826	#define __NR_map_shadow_stack 453
   827	__SYSCALL(__NR_map_shadow_stack, sys_map_shadow_stack)
   828	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
