Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F34D20FE
	for <oe-kbuild-all@lists.linux.dev>; Fri, 20 Jan 2023 13:39:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674221944; x=1705757944;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=JGNhNUyEp726UvbUK90WVdi+VcU+LeH6WMBwLpxjKWM=;
  b=WNly2MDCLPYewJvTdrd0JgTSJq2dAvYKuXzWaNnTeHqskockDtpcxIte
   JpRy5h1xiKwFUcv9xUfXipyrVhOoAztgzD0w6AD34RaDfpkNqLZ4LcKcR
   JsBHipSz67dHsh9+MdsduTNbBFstY7B0HlfwQm9Qgjor6mkIioodZXUmB
   MmUNnKUM9xUhpBbqG1AJskWWvjlt/Rh7H2z70frHSJD0M+6ssvTOApzL/
   +D4bfvB8WGvgYypHJp/2kpPTwA00CbWJGcBC/RdeGlRYGVdSv/4RLzv1J
   qNpDX4grKagGqf46rbSZvHrFeRiPACYvCQYmGCopOPGdNPIubKjp95zeU
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10595"; a="305251749"
X-IronPort-AV: E=Sophos;i="5.97,232,1669104000"; 
   d="scan'208";a="305251749"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jan 2023 05:39:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10595"; a="610487566"
X-IronPort-AV: E=Sophos;i="5.97,232,1669104000"; 
   d="scan'208";a="610487566"
Received: from lkp-server01.sh.intel.com (HELO 5646d64e7320) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 20 Jan 2023 05:39:02 -0800
Received: from kbuild by 5646d64e7320 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pIrbh-0002ac-1d;
	Fri, 20 Jan 2023 13:39:01 +0000
Date: Fri, 20 Jan 2023 21:38:56 +0800
From: kernel test robot <lkp@intel.com>
To: "zhaoyang.huang" <zhaoyang.huang@unisoc.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH] kernel/locking: introduce stack_handle for tracing
 the callstack
Message-ID: <202301202138.V7owm4uw-lkp@intel.com>
References: <1674204502-32123-1-git-send-email-zhaoyang.huang@unisoc.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1674204502-32123-1-git-send-email-zhaoyang.huang@unisoc.com>

Hi zhaoyang.huang",

[FYI, it's a private test report for your RFC patch.]
[auto build test ERROR on tip/locking/core]
[also build test ERROR on tip/master tip/auto-latest arm-perf/for-next/perf linus/master v6.2-rc4 next-20230120]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/zhaoyang-huang/kernel-locking-introduce-stack_handle-for-tracing-the-callstack/20230120-165013
patch link:    https://lore.kernel.org/r/1674204502-32123-1-git-send-email-zhaoyang.huang%40unisoc.com
patch subject: [RFC PATCH] kernel/locking: introduce stack_handle for tracing the callstack
config: loongarch-randconfig-r023-20230119 (https://download.01.org/0day-ci/archive/20230120/202301202138.V7owm4uw-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/4c9baeb14c923660caa4fc53f7b0c97c2473880b
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review zhaoyang-huang/kernel-locking-introduce-stack_handle-for-tracing-the-callstack/20230120-165013
        git checkout 4c9baeb14c923660caa4fc53f7b0c97c2473880b
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=loongarch olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=loongarch SHELL=/bin/bash kernel/locking/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   kernel/locking/rwsem.c: In function '__rwsem_set_reader_owned':
   kernel/locking/rwsem.c:180:37: error: implicit declaration of function 'set_track_prepare'; did you mean 'setattr_prepare'? [-Werror=implicit-function-declaration]
     180 |         sem->trace_handle = owner ? set_track_prepare() : NULL;
         |                                     ^~~~~~~~~~~~~~~~~
         |                                     setattr_prepare
   kernel/locking/rwsem.c:180:57: warning: pointer/integer type mismatch in conditional expression
     180 |         sem->trace_handle = owner ? set_track_prepare() : NULL;
         |                                                         ^
   kernel/locking/rwsem.c:180:27: warning: assignment to 'depot_stack_handle_t' {aka 'unsigned int'} from 'void *' makes integer from pointer without a cast [-Wint-conversion]
     180 |         sem->trace_handle = owner ? set_track_prepare() : NULL;
         |                           ^
   kernel/locking/rwsem.c: At top level:
   kernel/locking/rwsem.c:406:36: error: conflicting types for 'set_track_prepare'; have 'depot_stack_handle_t(void)' {aka 'unsigned int(void)'}
     406 | static inline depot_stack_handle_t set_track_prepare(void)
         |                                    ^~~~~~~~~~~~~~~~~
   kernel/locking/rwsem.c:180:37: note: previous implicit declaration of 'set_track_prepare' with type 'int()'
     180 |         sem->trace_handle = owner ? set_track_prepare() : NULL;
         |                                     ^~~~~~~~~~~~~~~~~
   kernel/locking/rwsem.c: In function 'set_track_prepare':
   kernel/locking/rwsem.c:409:31: error: 'MAX_TRACE' undeclared (first use in this function); did you mean 'ABI_TRACE'?
     409 |         unsigned long entries[MAX_TRACE];
         |                               ^~~~~~~~~
         |                               ABI_TRACE
   kernel/locking/rwsem.c:409:31: note: each undeclared identifier is reported only once for each function it appears in
   In file included from include/linux/container_of.h:5,
                    from include/linux/kernel.h:21,
                    from kernel/locking/rwsem.c:19:
>> include/linux/build_bug.h:16:51: error: bit-field '<anonymous>' width not an integer constant
      16 | #define BUILD_BUG_ON_ZERO(e) ((int)(sizeof(struct { int:(-!!(e)); })))
         |                                                   ^
   include/linux/compiler.h:232:33: note: in expansion of macro 'BUILD_BUG_ON_ZERO'
     232 | #define __must_be_array(a)      BUILD_BUG_ON_ZERO(__same_type((a), &(a)[0]))
         |                                 ^~~~~~~~~~~~~~~~~
   include/linux/kernel.h:55:59: note: in expansion of macro '__must_be_array'
      55 | #define ARRAY_SIZE(arr) (sizeof(arr) / sizeof((arr)[0]) + __must_be_array(arr))
         |                                                           ^~~~~~~~~~~~~~~
   kernel/locking/rwsem.c:412:48: note: in expansion of macro 'ARRAY_SIZE'
     412 |         nr_entries = stack_trace_save(entries, ARRAY_SIZE(entries), 3);
         |                                                ^~~~~~~~~~
   kernel/locking/rwsem.c:409:23: warning: unused variable 'entries' [-Wunused-variable]
     409 |         unsigned long entries[MAX_TRACE];
         |                       ^~~~~~~
   cc1: some warnings being treated as errors


vim +16 include/linux/build_bug.h

bc6245e5efd70c Ian Abbott       2017-07-10   6  
bc6245e5efd70c Ian Abbott       2017-07-10   7  #ifdef __CHECKER__
bc6245e5efd70c Ian Abbott       2017-07-10   8  #define BUILD_BUG_ON_ZERO(e) (0)
bc6245e5efd70c Ian Abbott       2017-07-10   9  #else /* __CHECKER__ */
bc6245e5efd70c Ian Abbott       2017-07-10  10  /*
bc6245e5efd70c Ian Abbott       2017-07-10  11   * Force a compilation error if condition is true, but also produce a
8788994376d84d Rikard Falkeborn 2019-12-04  12   * result (of value 0 and type int), so the expression can be used
bc6245e5efd70c Ian Abbott       2017-07-10  13   * e.g. in a structure initializer (or where-ever else comma expressions
bc6245e5efd70c Ian Abbott       2017-07-10  14   * aren't permitted).
bc6245e5efd70c Ian Abbott       2017-07-10  15   */
8788994376d84d Rikard Falkeborn 2019-12-04 @16  #define BUILD_BUG_ON_ZERO(e) ((int)(sizeof(struct { int:(-!!(e)); })))
527edbc18a70e7 Masahiro Yamada  2019-01-03  17  #endif /* __CHECKER__ */
527edbc18a70e7 Masahiro Yamada  2019-01-03  18  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
