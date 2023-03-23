Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 153BF33D4
	for <oe-kbuild-all@lists.linux.dev>; Thu, 23 Mar 2023 10:51:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679568684; x=1711104684;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=vaSD4aV8j8uLXhTHUEs1e0gQsHXn6vuABDWbS8z7tXM=;
  b=izSSoL8fK+H+Lsg8G9910Z/347hYgVbJBFOEoGcls9ur4SRJmTf8vCIb
   7Gz9O9lEb4xY4VF2b/BBCfKiQG+Xa0tNRpPHQh7o8jpoxzcXAs30RQYUw
   BQxAGUJcbECiYge/RXDwJCV3Lh9AZW0JIjydM3104So+vukNC6e4DHUaH
   Q6SnrNUu23PGfZqD9Go0nVXMN83jNsj2tUsBcCZguH2GDkSEy+yuRRZLG
   Hsbpobkr56wvnNxz69fano0rqagGwmqH2qgCZEi57mbmjmCCDkVXr1AoE
   J+6AixOgd2SuMrVY4kJfH8B1dk1nIZCJFyuccaCtSHj8zDwRp6YZPfCe6
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10657"; a="341817892"
X-IronPort-AV: E=Sophos;i="5.98,283,1673942400"; 
   d="scan'208";a="341817892"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Mar 2023 03:51:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10657"; a="714742956"
X-IronPort-AV: E=Sophos;i="5.98,283,1673942400"; 
   d="scan'208";a="714742956"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 23 Mar 2023 03:51:22 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pfIXR-000EG4-2X;
	Thu, 23 Mar 2023 10:51:21 +0000
Date: Thu, 23 Mar 2023 18:51:05 +0800
From: kernel test robot <lkp@intel.com>
To: Isaku Yamahata <isaku.yamahata@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, Chenyi Qiang <chenyi.qiang@intel.com>
Subject: [intel-tdx:kvm-upstream-workaround 189/325]
 arch/x86/include/asm/cpu.h:74:20: error: conflicting types for
 'tsx_ctrl_clear'; have 'void(u64)' {aka 'void(long long unsigned int)'}
Message-ID: <202303231803.JWgprAQP-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel/tdx.git kvm-upstream-workaround
head:   2a4df90769b13103056558d83a28e6ebca4ba2ee
commit: d68520c1ce54f89d3f33e9df684f5f306f817641 [189/325] [REVERTME] x86/cpu/tsx: Add helper functions to save/restore IA32_TSX_CTRL MSR
config: i386-randconfig-m021 (https://download.01.org/0day-ci/archive/20230323/202303231803.JWgprAQP-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        # https://github.com/intel/tdx/commit/d68520c1ce54f89d3f33e9df684f5f306f817641
        git remote add intel-tdx https://github.com/intel/tdx.git
        git fetch --no-tags intel-tdx kvm-upstream-workaround
        git checkout d68520c1ce54f89d3f33e9df684f5f306f817641
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=i386 olddefconfig
        make W=1 O=build_dir ARCH=i386 SHELL=/bin/bash arch/x86/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303231803.JWgprAQP-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/x86/events/perf_event.h:19,
                    from arch/x86/events/core.c:45:
>> arch/x86/include/asm/cpu.h:74:20: error: conflicting types for 'tsx_ctrl_clear'; have 'void(u64)' {aka 'void(long long unsigned int)'}
      74 | static inline void tsx_ctrl_clear(u64 tsx_ctrl) {}
         |                    ^~~~~~~~~~~~~~
   arch/x86/include/asm/cpu.h:73:19: note: previous definition of 'tsx_ctrl_clear' with type 'u64(void)' {aka 'long long unsigned int(void)'}
      73 | static inline u64 tsx_ctrl_clear(void) { return 0; }
         |                   ^~~~~~~~~~~~~~
--
   In file included from arch/x86/kernel/traps.c:54:
>> arch/x86/include/asm/cpu.h:74:20: error: conflicting types for 'tsx_ctrl_clear'; have 'void(u64)' {aka 'void(long long unsigned int)'}
      74 | static inline void tsx_ctrl_clear(u64 tsx_ctrl) {}
         |                    ^~~~~~~~~~~~~~
   arch/x86/include/asm/cpu.h:73:19: note: previous definition of 'tsx_ctrl_clear' with type 'u64(void)' {aka 'long long unsigned int(void)'}
      73 | static inline u64 tsx_ctrl_clear(void) { return 0; }
         |                   ^~~~~~~~~~~~~~
   In file included from include/vdso/const.h:5,
                    from include/linux/const.h:4,
                    from include/uapi/linux/kernel.h:6,
                    from include/linux/cache.h:5,
                    from arch/x86/include/asm/current.h:9,
                    from include/linux/sched.h:12,
                    from include/linux/context_tracking.h:5,
                    from arch/x86/kernel/traps.c:15:
   arch/x86/include/asm/tdx.h: In function '__seamcall':
   include/uapi/linux/const.h:28:33: warning: left shift count >= width of type [-Wshift-count-overflow]
      28 | #define _BITUL(x)       (_UL(1) << (x))
         |                                 ^~
   arch/x86/include/asm/tdx.h:20:41: note: in expansion of macro '_BITUL'
      20 | #define TDX_ERROR                       _BITUL(TDX_ERROR_BIT)
         |                                         ^~~~~~
   arch/x86/include/asm/tdx.h:21:42: note: in expansion of macro 'TDX_ERROR'
      21 | #define TDX_SW_ERROR                    (TDX_ERROR | GENMASK_ULL(47, 40))
         |                                          ^~~~~~~~~
   arch/x86/include/asm/tdx.h:25:42: note: in expansion of macro 'TDX_SW_ERROR'
      25 | #define TDX_SEAMCALL_UD                 (TDX_SW_ERROR | X86_TRAP_UD)
         |                                          ^~~~~~~~~~~~
   arch/x86/include/asm/tdx.h:182:70: note: in expansion of macro 'TDX_SEAMCALL_UD'
     182 |                              struct tdx_module_output *out) { return TDX_SEAMCALL_UD; };
         |                                                                      ^~~~~~~~~~~~~~~
--
   In file included from include/vdso/const.h:5,
                    from include/linux/const.h:4,
                    from include/uapi/linux/kernel.h:6,
                    from include/linux/cache.h:5,
                    from arch/x86/include/asm/current.h:9,
                    from include/linux/sched.h:12,
                    from include/linux/context_tracking.h:5,
                    from arch/x86/kernel/kvm.c:12:
   arch/x86/include/asm/tdx.h: In function '__seamcall':
   include/uapi/linux/const.h:28:33: warning: left shift count >= width of type [-Wshift-count-overflow]
      28 | #define _BITUL(x)       (_UL(1) << (x))
         |                                 ^~
   arch/x86/include/asm/tdx.h:20:41: note: in expansion of macro '_BITUL'
      20 | #define TDX_ERROR                       _BITUL(TDX_ERROR_BIT)
         |                                         ^~~~~~
   arch/x86/include/asm/tdx.h:21:42: note: in expansion of macro 'TDX_ERROR'
      21 | #define TDX_SW_ERROR                    (TDX_ERROR | GENMASK_ULL(47, 40))
         |                                          ^~~~~~~~~
   arch/x86/include/asm/tdx.h:25:42: note: in expansion of macro 'TDX_SW_ERROR'
      25 | #define TDX_SEAMCALL_UD                 (TDX_SW_ERROR | X86_TRAP_UD)
         |                                          ^~~~~~~~~~~~
   arch/x86/include/asm/tdx.h:182:70: note: in expansion of macro 'TDX_SEAMCALL_UD'
     182 |                              struct tdx_module_output *out) { return TDX_SEAMCALL_UD; };
         |                                                                      ^~~~~~~~~~~~~~~
   In file included from arch/x86/kernel/kvm.c:33:
   arch/x86/include/asm/cpu.h: At top level:
>> arch/x86/include/asm/cpu.h:74:20: error: conflicting types for 'tsx_ctrl_clear'; have 'void(u64)' {aka 'void(long long unsigned int)'}
      74 | static inline void tsx_ctrl_clear(u64 tsx_ctrl) {}
         |                    ^~~~~~~~~~~~~~
   arch/x86/include/asm/cpu.h:73:19: note: previous definition of 'tsx_ctrl_clear' with type 'u64(void)' {aka 'long long unsigned int(void)'}
      73 | static inline u64 tsx_ctrl_clear(void) { return 0; }
         |                   ^~~~~~~~~~~~~~


vim +74 arch/x86/include/asm/cpu.h

    72	
    73	static inline u64 tsx_ctrl_clear(void) { return 0; }
  > 74	static inline void tsx_ctrl_clear(u64 tsx_ctrl) {}
    75	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
