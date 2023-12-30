Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5453E9461
	for <oe-kbuild-all@lists.linux.dev>; Sat, 30 Dec 2023 16:12:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="e8UbViIK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1703952760; x=1735488760;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=EfixlbZ4B2N38QxjyrEOm9AFJL4D3Fwk7t8JIKcZHvk=;
  b=e8UbViIKvd0zauntN4s0iIxWo/c4CP/bK6OCjBjI1n+urZeULI0UPsLm
   UMFtddZSKxVx4MMT/iwmpeY5MbiWLnTOut/FmVBa0hN26kQLrIEb3oHd1
   PQtw2Twlj8ewvuWDGvRLABulWBVxGNPXhlbcXg9ENcRnxXdF33o+/Jp2t
   +L7997knEGZwoVU5KFEszMUH4TgPP0Y97S2+2j9yl0R4cIbSDABUrO4bF
   EuDacFu76ihTkGzxVkbctZn6ls/RD03IhJo+KVkgoIxIA5baFbjE3ucAt
   fE4uCcIt27WQ3gZ1ifTlepivThi/DTBpRsABcs72BTIo8jBcFbMVCfLvd
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10939"; a="463121912"
X-IronPort-AV: E=Sophos;i="6.04,318,1695711600"; 
   d="scan'208";a="463121912"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Dec 2023 08:12:30 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10939"; a="922586395"
X-IronPort-AV: E=Sophos;i="6.04,318,1695711600"; 
   d="scan'208";a="922586395"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga001.fm.intel.com with ESMTP; 30 Dec 2023 08:12:29 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rJbwo-000IYz-1r;
	Sat, 30 Dec 2023 16:12:26 +0000
Date: Sun, 31 Dec 2023 00:12:00 +0800
From: kernel test robot <lkp@intel.com>
To: Kaixu Xia <kaixuxia@tencent.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: kernel/sysctl.c:2616:5: warning: no previous prototype for
 'setup_pagecache_limit'
Message-ID: <202312310000.fjeABnVU-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/OpenCloudOS/OpenCloudOS-Kernel.git lts/5.4.119-20.0009
head:   3bf5c3f6e32e9cfe13f09bac3ae93b8e39d472c1
commit: 590eaf1fec755215547690e787cc7d83f58ea948 Init Repo base on linux 5.4.32 long term, and add base tlinux kernel interfaces.
date:   2 years, 10 months ago
config: x86_64-oc_base_config (https://download.01.org/0day-ci/archive/20231231/202312310000.fjeABnVU-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231231/202312310000.fjeABnVU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312310000.fjeABnVU-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/sysctl.c:2616:5: warning: no previous prototype for 'setup_pagecache_limit' [-Wmissing-prototypes]
    2616 | int setup_pagecache_limit(void)
         |     ^~~~~~~~~~~~~~~~~~~~~
   kernel/sysctl.c: In function 'proc_dointvec_max_map_count':
>> kernel/sysctl.c:2981:9: warning: ISO C90 forbids mixed declarations and code [-Wdeclaration-after-statement]
    2981 |         struct do_proc_dointvec_minmax_conv_param param = {
         |         ^~~~~~
--
   mm/page_alloc.c:7553:9: note: in expansion of macro 'adj_init_size'
    7553 |         adj_init_size(__init_begin, __init_end, init_data_size,
         |         ^~~~~~~~~~~~~
   mm/page_alloc.c:7549:27: warning: comparison between two arrays [-Warray-compare]
    7549 |                 if (start <= pos && pos < end && size > adj) \
         |                           ^~
   mm/page_alloc.c:7555:9: note: in expansion of macro 'adj_init_size'
    7555 |         adj_init_size(_stext, _etext, codesize, _sinittext, init_code_size);
         |         ^~~~~~~~~~~~~
   mm/page_alloc.c:7549:27: note: use '&_stext[0] <= &_sinittext[0]' to compare the addresses
    7549 |                 if (start <= pos && pos < end && size > adj) \
         |                           ^~
   mm/page_alloc.c:7555:9: note: in expansion of macro 'adj_init_size'
    7555 |         adj_init_size(_stext, _etext, codesize, _sinittext, init_code_size);
         |         ^~~~~~~~~~~~~
   mm/page_alloc.c:7549:41: warning: comparison between two arrays [-Warray-compare]
    7549 |                 if (start <= pos && pos < end && size > adj) \
         |                                         ^
   mm/page_alloc.c:7555:9: note: in expansion of macro 'adj_init_size'
    7555 |         adj_init_size(_stext, _etext, codesize, _sinittext, init_code_size);
         |         ^~~~~~~~~~~~~
   mm/page_alloc.c:7549:41: note: use '&_sinittext[0] < &_etext[0]' to compare the addresses
    7549 |                 if (start <= pos && pos < end && size > adj) \
         |                                         ^
   mm/page_alloc.c:7555:9: note: in expansion of macro 'adj_init_size'
    7555 |         adj_init_size(_stext, _etext, codesize, _sinittext, init_code_size);
         |         ^~~~~~~~~~~~~
   mm/page_alloc.c:7549:27: warning: comparison between two arrays [-Warray-compare]
    7549 |                 if (start <= pos && pos < end && size > adj) \
         |                           ^~
   mm/page_alloc.c:7556:9: note: in expansion of macro 'adj_init_size'
    7556 |         adj_init_size(_sdata, _edata, datasize, __init_begin, init_data_size);
         |         ^~~~~~~~~~~~~
   mm/page_alloc.c:7549:27: note: use '&_sdata[0] <= &__init_begin[0]' to compare the addresses
    7549 |                 if (start <= pos && pos < end && size > adj) \
         |                           ^~
   mm/page_alloc.c:7556:9: note: in expansion of macro 'adj_init_size'
    7556 |         adj_init_size(_sdata, _edata, datasize, __init_begin, init_data_size);
         |         ^~~~~~~~~~~~~
   mm/page_alloc.c:7549:41: warning: comparison between two arrays [-Warray-compare]
    7549 |                 if (start <= pos && pos < end && size > adj) \
         |                                         ^
   mm/page_alloc.c:7556:9: note: in expansion of macro 'adj_init_size'
    7556 |         adj_init_size(_sdata, _edata, datasize, __init_begin, init_data_size);
         |         ^~~~~~~~~~~~~
   mm/page_alloc.c:7549:41: note: use '&__init_begin[0] < &_edata[0]' to compare the addresses
    7549 |                 if (start <= pos && pos < end && size > adj) \
         |                                         ^
   mm/page_alloc.c:7556:9: note: in expansion of macro 'adj_init_size'
    7556 |         adj_init_size(_sdata, _edata, datasize, __init_begin, init_data_size);
         |         ^~~~~~~~~~~~~
   mm/page_alloc.c:7549:27: warning: comparison between two arrays [-Warray-compare]
    7549 |                 if (start <= pos && pos < end && size > adj) \
         |                           ^~
   mm/page_alloc.c:7557:9: note: in expansion of macro 'adj_init_size'
    7557 |         adj_init_size(_stext, _etext, codesize, __start_rodata, rosize);
         |         ^~~~~~~~~~~~~
   mm/page_alloc.c:7549:27: note: use '&_stext[0] <= &__start_rodata[0]' to compare the addresses
    7549 |                 if (start <= pos && pos < end && size > adj) \
         |                           ^~
   mm/page_alloc.c:7557:9: note: in expansion of macro 'adj_init_size'
    7557 |         adj_init_size(_stext, _etext, codesize, __start_rodata, rosize);
         |         ^~~~~~~~~~~~~
   mm/page_alloc.c:7549:41: warning: comparison between two arrays [-Warray-compare]
    7549 |                 if (start <= pos && pos < end && size > adj) \
         |                                         ^
   mm/page_alloc.c:7557:9: note: in expansion of macro 'adj_init_size'
    7557 |         adj_init_size(_stext, _etext, codesize, __start_rodata, rosize);
         |         ^~~~~~~~~~~~~
   mm/page_alloc.c:7549:41: note: use '&__start_rodata[0] < &_etext[0]' to compare the addresses
    7549 |                 if (start <= pos && pos < end && size > adj) \
         |                                         ^
   mm/page_alloc.c:7557:9: note: in expansion of macro 'adj_init_size'
    7557 |         adj_init_size(_stext, _etext, codesize, __start_rodata, rosize);
         |         ^~~~~~~~~~~~~
   mm/page_alloc.c:7549:27: warning: comparison between two arrays [-Warray-compare]
    7549 |                 if (start <= pos && pos < end && size > adj) \
         |                           ^~
   mm/page_alloc.c:7558:9: note: in expansion of macro 'adj_init_size'
    7558 |         adj_init_size(_sdata, _edata, datasize, __start_rodata, rosize);
         |         ^~~~~~~~~~~~~
   mm/page_alloc.c:7549:27: note: use '&_sdata[0] <= &__start_rodata[0]' to compare the addresses
    7549 |                 if (start <= pos && pos < end && size > adj) \
         |                           ^~
   mm/page_alloc.c:7558:9: note: in expansion of macro 'adj_init_size'
    7558 |         adj_init_size(_sdata, _edata, datasize, __start_rodata, rosize);
         |         ^~~~~~~~~~~~~
   mm/page_alloc.c:7549:41: warning: comparison between two arrays [-Warray-compare]
    7549 |                 if (start <= pos && pos < end && size > adj) \
         |                                         ^
   mm/page_alloc.c:7558:9: note: in expansion of macro 'adj_init_size'
    7558 |         adj_init_size(_sdata, _edata, datasize, __start_rodata, rosize);
         |         ^~~~~~~~~~~~~
   mm/page_alloc.c:7549:41: note: use '&__start_rodata[0] < &_edata[0]' to compare the addresses
    7549 |                 if (start <= pos && pos < end && size > adj) \
         |                                         ^
   mm/page_alloc.c:7558:9: note: in expansion of macro 'adj_init_size'
    7558 |         adj_init_size(_sdata, _edata, datasize, __start_rodata, rosize);
         |         ^~~~~~~~~~~~~
   mm/page_alloc.c: In function 'pagecache_over_limit':
>> mm/page_alloc.c:8554:15: warning: old-style function definition [-Wold-style-definition]
    8554 | unsigned long pagecache_over_limit()
         |               ^~~~~~~~~~~~~~~~~~~~
--
>> fs/exec.c:86:6: warning: no previous prototype for 'nr_execve_count' [-Wmissing-prototypes]
      86 | long nr_execve_count(void)
         |      ^~~~~~~~~~~~~~~
>> fs/exec.c:516:5: warning: no previous prototype for 'set_get_execve_info_func' [-Wmissing-prototypes]
     516 | int set_get_execve_info_func(GET_EXECVE_INFO func_addr)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~
--
>> arch/x86/pci/common.c:207:19: warning: 'find_sort_method' defined but not used [-Wunused-function]
     207 | static int __init find_sort_method(const struct dmi_system_id *d)
         |                   ^~~~~~~~~~~~~~~~
--
>> net/socket.c:179:6: warning: no previous prototype for 'nr_hook_count' [-Wmissing-prototypes]
     179 | long nr_hook_count(int flag)
         |      ^~~~~~~~~~~~~
>> net/socket.c:200:5: warning: no previous prototype for 'set_get_info_func' [-Wmissing-prototypes]
     200 | int set_get_info_func(GET_INFO_HOOK_FUNC func_addr[], int num)
         |     ^~~~~~~~~~~~~~~~~
   net/socket.c: In function '__sys_getsockopt':
   net/socket.c:2195:13: warning: variable 'max_optlen' set but not used [-Wunused-but-set-variable]
    2195 |         int max_optlen;
         |             ^~~~~~~~~~
--
   kernel/cgroup/cpuset.c: In function 'cpuset_cgroup_cpuinfo_show':
   kernel/cgroup/cpuset.c:2745:39: warning: comparison of unsigned expression in '>= 0' is always true [-Wtype-limits]
    2745 |                 if (c->x86_cache_size >= 0)
         |                                       ^~
   kernel/cgroup/cpuset.c: At top level:
>> kernel/cgroup/cpuset.c:3967:6: warning: no previous prototype for 'cgroup_cpuset_calc_load' [-Wmissing-prototypes]
    3967 | void cgroup_cpuset_calc_load(void)
         |      ^~~~~~~~~~~~~~~~~~~~~~~
--
>> kernel/tkernel/shield_mounts.c:225:5: warning: no previous prototype for 'shield_mounts_release' [-Wmissing-prototypes]
     225 | int shield_mounts_release(struct inode *inode, struct file *file)
         |     ^~~~~~~~~~~~~~~~~~~~~
--
   In file included from include/linux/list.h:9,
                    from include/linux/module.h:9,
                    from kernel/tkernel/trackgpu.c:1:
   kernel/tkernel/trackgpu.c: In function 'nl_recv_msg':
   include/linux/kernel.h:842:43: warning: comparison of distinct pointer types lacks a cast
     842 |                 (!!(sizeof((typeof(x) *)1 == (typeof(y) *)1)))
         |                                           ^~
   include/linux/kernel.h:856:18: note: in expansion of macro '__typecheck'
     856 |                 (__typecheck(x, y) && __no_side_effects(x, y))
         |                  ^~~~~~~~~~~
   include/linux/kernel.h:866:31: note: in expansion of macro '__safe_cmp'
     866 |         __builtin_choose_expr(__safe_cmp(x, y), \
         |                               ^~~~~~~~~~
   include/linux/kernel.h:875:25: note: in expansion of macro '__careful_cmp'
     875 | #define min(x, y)       __careful_cmp(x, y, <)
         |                         ^~~~~~~~~~~~~
   kernel/tkernel/trackgpu.c:120:15: note: in expansion of macro 'min'
     120 |         len = min(sizeof(comp_msg), msg_size);
         |               ^~~
   kernel/tkernel/trackgpu.c: In function 'trackgpu_init':
>> kernel/tkernel/trackgpu.c:204:13: warning: unused variable 'err' [-Wunused-variable]
     204 |         int err;
         |             ^~~
   In file included from include/linux/bitmap.h:9,
                    from include/linux/cpumask.h:12,
                    from arch/x86/include/asm/cpumask.h:5,
                    from arch/x86/include/asm/msr.h:11,
                    from arch/x86/include/asm/processor.h:21,
                    from arch/x86/include/asm/cpufeature.h:5,
                    from arch/x86/include/asm/thread_info.h:53,
                    from include/linux/thread_info.h:38,
                    from arch/x86/include/asm/preempt.h:7,
                    from include/linux/preempt.h:78,
                    from include/linux/spinlock.h:51,
                    from include/linux/seqlock.h:36,
                    from include/linux/time.h:6,
                    from include/linux/stat.h:19,
                    from include/linux/module.h:10:
   In function 'strncpy',
       inlined from 'nl_send_msg' at kernel/tkernel/trackgpu.c:177:2:
   include/linux/string.h:279:16: warning: '__builtin_strncpy' output may be truncated copying between 0 and 63 bytes from a string of length 63 [-Wstringop-truncation]
     279 |         return __builtin_strncpy(p, q, size);
         |                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
--
   kernel/tkernel/netatop/netatop.c: In function 'gctaskexit':
>> kernel/tkernel/netatop/netatop.c:1015:1: warning: old-style function definition [-Wold-style-definition]
    1015 | gctaskexit()
         | ^~~~~~~~~~
   kernel/tkernel/netatop/netatop.c: In function 'gcsockinfo':
   kernel/tkernel/netatop/netatop.c:1049:1: warning: old-style function definition [-Wold-style-definition]
    1049 | gcsockinfo()
         | ^~~~~~~~~~
   kernel/tkernel/netatop/netatop.c: In function 'gctaskinfo':
   kernel/tkernel/netatop/netatop.c:1259:1: warning: old-style function definition [-Wold-style-definition]
    1259 | gctaskinfo()
         | ^~~~~~~~~~
   kernel/tkernel/netatop/netatop.c: In function 'wipesockinfo':
   kernel/tkernel/netatop/netatop.c:1332:1: warning: old-style function definition [-Wold-style-definition]
    1332 | wipesockinfo()
         | ^~~~~~~~~~~~
   kernel/tkernel/netatop/netatop.c: In function 'wipetaskinfo':
   kernel/tkernel/netatop/netatop.c:1360:1: warning: old-style function definition [-Wold-style-definition]
    1360 | wipetaskinfo()
         | ^~~~~~~~~~~~
   kernel/tkernel/netatop/netatop.c: In function 'wipetaskexit':
   kernel/tkernel/netatop/netatop.c:1388:1: warning: old-style function definition [-Wold-style-definition]
    1388 | wipetaskexit()
         | ^~~~~~~~~~~~
   kernel/tkernel/netatop/netatop.c: In function 'init_module':
   kernel/tkernel/netatop/netatop.c:1673:1: warning: old-style function definition [-Wold-style-definition]
    1673 | init_module()
         | ^~~~~~~~~~~
   kernel/tkernel/netatop/netatop.c: In function 'cleanup_module':
   kernel/tkernel/netatop/netatop.c:1764:1: warning: old-style function definition [-Wold-style-definition]
    1764 | cleanup_module()
         | ^~~~~~~~~~~~~~
   kernel/tkernel/netatop/netatop.c: In function 'getsockopt':
>> kernel/tkernel/netatop/netatop.c:1593:26: warning: this statement may fall through [-Wimplicit-fallthrough=]
    1593 |                 tasktype = 'g';
         |                 ~~~~~~~~~^~~~~
   kernel/tkernel/netatop/netatop.c:1595:17: note: here
    1595 |                 case NETATOP_GETCNT_PID:
         |                 ^~~~
--
   drivers/tty/sysrq.c: In function 'sysrq_handle_keypress':
>> drivers/tty/sysrq.c:823:20: warning: this statement may fall through [-Wimplicit-fallthrough=]
     823 |                 if (sysrq_use_leftctrl && !sysrq->active) {
         |                    ^
   drivers/tty/sysrq.c:839:9: note: here
     839 |         default:
         |         ^~~~~~~


vim +/setup_pagecache_limit +2616 kernel/sysctl.c

  2615	
> 2616	int setup_pagecache_limit(void)
  2617	{
  2618		/* reclaim $ADDITIONAL_RECLAIM_PAGES more than limit. */
  2619		vm_pagecache_limit_reclaim_ratio = vm_pagecache_limit_ratio + ADDITIONAL_RECLAIM_RATIO;
  2620	
  2621		if (vm_pagecache_limit_reclaim_ratio > 100)
  2622			vm_pagecache_limit_reclaim_ratio = 100;
  2623		if (vm_pagecache_limit_ratio == 0)
  2624			vm_pagecache_limit_reclaim_ratio = 0;
  2625	
  2626		vm_pagecache_limit_pages = vm_pagecache_limit_ratio * totalram_pages() / 100;
  2627		vm_pagecache_limit_reclaim_pages = vm_pagecache_limit_reclaim_ratio * totalram_pages() / 100;
  2628		return 0;
  2629	}
  2630	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
