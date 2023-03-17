Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73E9579D6
	for <oe-kbuild-all@lists.linux.dev>; Fri, 17 Mar 2023 21:42:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679089344; x=1710625344;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=iO62huQ1jlxADCfTpU7N0ELdUjib+cT/NoOe/JS/uls=;
  b=I0FVXDV5pfEzvTZNHr9loirVgrdSiQu06Iw8EmuwAgBBXQgm9ieAKddx
   Jt4FAW1mfy0ViAuDIY7qt7Yt2f5Yf3qWKfZfnkmlGp8nZrmAfPgc2XnwU
   PGMJXwnLFwPAv+y2cOMovv4oshxm0vu7VI/4wdReOr6YZLrWsgWBzSBoK
   nGm7mQt5JFE9fFHyzqbA4ktJtcfQGKiVY5joXh3hUFQ6cz0Tbd0nd/zAS
   RmUyF4BMEXKQqXOEGQaYohR+75HG/LRez8YW3OQC4I9VOk27pwLhCDeHO
   zpwJqPrA6SzWAZgZs0iABLeyFCNILiupq3UO0Y8+serKdLwMhkBbBQaZP
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10652"; a="340725197"
X-IronPort-AV: E=Sophos;i="5.98,270,1673942400"; 
   d="scan'208";a="340725197"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2023 14:42:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10652"; a="744686525"
X-IronPort-AV: E=Sophos;i="5.98,270,1673942400"; 
   d="scan'208";a="744686525"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 17 Mar 2023 14:42:20 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pdHq7-0009aU-23;
	Fri, 17 Mar 2023 21:42:19 +0000
Date: Sat, 18 Mar 2023 05:41:23 +0800
From: kernel test robot <lkp@intel.com>
To: Josh Poimboeuf <jpoimboe@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jpoimboe:static-call-null-4 4/8]
 arch/x86/include/asm/perf_event.h:591:9: error: implicit declaration of
 function 'static_call_mod'; did you mean 'static_call_cond'?
Message-ID: <202303180529.cUlMSztS-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jpoimboe/linux.git static-call-null-4
head:   74dbc56ffbac4b4912e598d245eaf4b0a6db638f
commit: 5c0a5c2c499b4ba2bb84fff7c63ae9365e36cb2c [4/8] static_call: Remove static_call_mod()
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20230318/202303180529.cUlMSztS-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        # https://git.kernel.org/pub/scm/linux/kernel/git/jpoimboe/linux.git/commit/?id=5c0a5c2c499b4ba2bb84fff7c63ae9365e36cb2c
        git remote add jpoimboe https://git.kernel.org/pub/scm/linux/kernel/git/jpoimboe/linux.git
        git fetch --no-tags jpoimboe static-call-null-4
        git checkout 5c0a5c2c499b4ba2bb84fff7c63ae9365e36cb2c
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=x86_64 olddefconfig
        make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash arch/x86/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303180529.cUlMSztS-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/perf_event.h:25,
                    from include/linux/trace_events.h:10,
                    from include/trace/syscall.h:7,
                    from include/linux/syscalls.h:88,
                    from include/linux/entry-common.h:7,
                    from arch/x86/include/asm/idtentry.h:11,
                    from arch/x86/xen/enlighten_hvm.c:21:
   arch/x86/include/asm/perf_event.h: In function 'perf_lopwr_cb':
>> arch/x86/include/asm/perf_event.h:591:9: error: implicit declaration of function 'static_call_mod'; did you mean 'static_call_cond'? [-Werror=implicit-function-declaration]
     591 |         static_call_mod(perf_lopwr_cb)(lopwr_in);
         |         ^~~~~~~~~~~~~~~
         |         static_call_cond
>> arch/x86/include/asm/perf_event.h:591:9: error: called object is not a function or function pointer
   cc1: some warnings being treated as errors
--
   In file included from include/linux/perf_event.h:25,
                    from include/linux/trace_events.h:10,
                    from include/trace/syscall.h:7,
                    from include/linux/syscalls.h:88,
                    from include/linux/entry-common.h:7,
                    from arch/x86/include/asm/idtentry.h:11,
                    from arch/x86/include/asm/traps.h:9,
                    from arch/x86/xen/enlighten_pv.c:63:
   arch/x86/include/asm/perf_event.h: In function 'perf_lopwr_cb':
>> arch/x86/include/asm/perf_event.h:591:9: error: implicit declaration of function 'static_call_mod'; did you mean 'static_call_cond'? [-Werror=implicit-function-declaration]
     591 |         static_call_mod(perf_lopwr_cb)(lopwr_in);
         |         ^~~~~~~~~~~~~~~
         |         static_call_cond
>> arch/x86/include/asm/perf_event.h:591:9: error: called object is not a function or function pointer
   arch/x86/xen/enlighten_pv.c: At top level:
   arch/x86/xen/enlighten_pv.c:1233:34: warning: no previous prototype for 'xen_start_kernel' [-Wmissing-prototypes]
    1233 | asmlinkage __visible void __init xen_start_kernel(struct start_info *si)
         |                                  ^~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors
--
   In file included from include/linux/perf_event.h:25,
                    from include/linux/trace_events.h:10,
                    from include/trace/syscall.h:7,
                    from include/linux/syscalls.h:88,
                    from include/linux/entry-common.h:7,
                    from arch/x86/include/asm/idtentry.h:11,
                    from arch/x86/xen/smp_pv.c:29:
   arch/x86/include/asm/perf_event.h: In function 'perf_lopwr_cb':
>> arch/x86/include/asm/perf_event.h:591:9: error: implicit declaration of function 'static_call_mod'; did you mean 'static_call_cond'? [-Werror=implicit-function-declaration]
     591 |         static_call_mod(perf_lopwr_cb)(lopwr_in);
         |         ^~~~~~~~~~~~~~~
         |         static_call_cond
>> arch/x86/include/asm/perf_event.h:591:9: error: called object is not a function or function pointer
   arch/x86/xen/smp_pv.c: At top level:
   arch/x86/xen/smp_pv.c:92:27: warning: no previous prototype for 'cpu_bringup_and_idle' [-Wmissing-prototypes]
      92 | asmlinkage __visible void cpu_bringup_and_idle(void)
         |                           ^~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors
--
   In file included from include/linux/perf_event.h:25,
                    from include/linux/trace_events.h:10,
                    from include/trace/syscall.h:7,
                    from include/linux/syscalls.h:88,
                    from include/linux/entry-common.h:7,
                    from arch/x86/entry/common.c:13:
   arch/x86/include/asm/perf_event.h: In function 'perf_lopwr_cb':
>> arch/x86/include/asm/perf_event.h:591:9: error: implicit declaration of function 'static_call_mod'; did you mean 'static_call_cond'? [-Werror=implicit-function-declaration]
     591 |         static_call_mod(perf_lopwr_cb)(lopwr_in);
         |         ^~~~~~~~~~~~~~~
         |         static_call_cond
>> arch/x86/include/asm/perf_event.h:591:9: error: called object is not a function or function pointer
   arch/x86/entry/common.c: At top level:
   arch/x86/entry/common.c:238:24: warning: no previous prototype for 'do_SYSENTER_32' [-Wmissing-prototypes]
     238 | __visible noinstr long do_SYSENTER_32(struct pt_regs *regs)
         |                        ^~~~~~~~~~~~~~
   arch/x86/entry/common.c:302:24: warning: no previous prototype for 'xen_pv_evtchn_do_upcall' [-Wmissing-prototypes]
     302 | __visible noinstr void xen_pv_evtchn_do_upcall(struct pt_regs *regs)
         |                        ^~~~~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors
--
   In file included from include/linux/perf_event.h:25,
                    from include/linux/trace_events.h:10,
                    from include/trace/events/power.h:12,
                    from arch/x86/kernel/process.c:28:
   arch/x86/include/asm/perf_event.h: In function 'perf_lopwr_cb':
>> arch/x86/include/asm/perf_event.h:591:9: error: implicit declaration of function 'static_call_mod'; did you mean 'static_call_cond'? [-Werror=implicit-function-declaration]
     591 |         static_call_mod(perf_lopwr_cb)(lopwr_in);
         |         ^~~~~~~~~~~~~~~
         |         static_call_cond
>> arch/x86/include/asm/perf_event.h:591:9: error: called object is not a function or function pointer
   arch/x86/kernel/process.c: In function 'arch_post_acpi_subsys_init':
   arch/x86/kernel/process.c:911:17: warning: variable 'hi' set but not used [-Wunused-but-set-variable]
     911 |         u32 lo, hi;
         |                 ^~
   cc1: some warnings being treated as errors
--
   In file included from include/linux/perf_event.h:25,
                    from arch/x86/events/intel/p4.c:10:
   arch/x86/include/asm/perf_event.h: In function 'perf_lopwr_cb':
>> arch/x86/include/asm/perf_event.h:591:9: error: implicit declaration of function 'static_call_mod'; did you mean 'static_call_cond'? [-Werror=implicit-function-declaration]
     591 |         static_call_mod(perf_lopwr_cb)(lopwr_in);
         |         ^~~~~~~~~~~~~~~
         |         static_call_cond
>> arch/x86/include/asm/perf_event.h:591:9: error: called object is not a function or function pointer
   arch/x86/events/intel/p4.c: In function 'p4_pmu_init':
   arch/x86/events/intel/p4.c:1369:27: warning: variable 'high' set but not used [-Wunused-but-set-variable]
    1369 |         unsigned int low, high;
         |                           ^~~~
   cc1: some warnings being treated as errors
--
   In file included from include/linux/perf_event.h:25,
                    from include/linux/trace_events.h:10,
                    from include/trace/syscall.h:7,
                    from include/linux/syscalls.h:88,
                    from include/linux/entry-common.h:7,
                    from arch/x86/include/asm/idtentry.h:11,
                    from arch/x86/include/asm/traps.h:9,
                    from arch/x86/kernel/cpu/intel.c:28:
   arch/x86/include/asm/perf_event.h: In function 'perf_lopwr_cb':
>> arch/x86/include/asm/perf_event.h:591:9: error: implicit declaration of function 'static_call_mod'; did you mean 'static_call_cond'? [-Werror=implicit-function-declaration]
     591 |         static_call_mod(perf_lopwr_cb)(lopwr_in);
         |         ^~~~~~~~~~~~~~~
         |         static_call_cond
>> arch/x86/include/asm/perf_event.h:591:9: error: called object is not a function or function pointer
   arch/x86/kernel/cpu/intel.c: In function 'init_intel':
   arch/x86/kernel/cpu/intel.c:824:34: warning: variable 'l2' set but not used [-Wunused-but-set-variable]
     824 |                 unsigned int l1, l2;
         |                                  ^~
   cc1: some warnings being treated as errors


vim +591 arch/x86/include/asm/perf_event.h

d5616bac7adadb Stephane Eranian 2022-03-22  588  
1f7c232ee080f0 Peter Zijlstra   2023-01-12  589  static __always_inline void perf_lopwr_cb(bool lopwr_in)
d5616bac7adadb Stephane Eranian 2022-03-22  590  {
d5616bac7adadb Stephane Eranian 2022-03-22 @591  	static_call_mod(perf_lopwr_cb)(lopwr_in);
d5616bac7adadb Stephane Eranian 2022-03-22  592  }
d5616bac7adadb Stephane Eranian 2022-03-22  593  

:::::: The code at line 591 was first introduced by commit
:::::: d5616bac7adadbf42a3b63b8717e75eb82a2cc2c perf/x86/amd: Add idle hooks for branch sampling

:::::: TO: Stephane Eranian <eranian@google.com>
:::::: CC: Peter Zijlstra <peterz@infradead.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
