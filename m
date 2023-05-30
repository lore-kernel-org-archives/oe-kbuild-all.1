Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DE3917FE5
	for <oe-kbuild-all@lists.linux.dev>; Tue, 30 May 2023 19:54:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685476482; x=1717012482;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=5HDBQQx6uXcRINAq/1H0hBkwjhKTE3P4JDtjYuNISvo=;
  b=gcJLL3lk9qhkD0XJnhxN0RsdGEQfK2FRrgeTpL69VagwWEC6atfaNMwn
   +t5nZiIbxLGfRI5sl0kc1ucnvv9tcJrWsADKP0+8WFbqsYDWkUXlYOlRh
   D4Ib+f1vAdty4N1dDYVLynF/O0/lPdO3sv7IGOps4ZTGqtGka1Jw5Q8qG
   VKaD5hU3nFCV/bXB0oillS1knjfRiq7Dqh0/TKuamlKGmSCInN9Qlwyhe
   GbHxNMjYnuse2OADbNY5alM54ytdzfiDdF76ETDkz569sXvA0UzjCTrNl
   9JZo6+zmVVX+bnR6hMlyphS3H6E3QQD2UGQWD5TxNnN7+k/ghMVNcG2XF
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10726"; a="418518403"
X-IronPort-AV: E=Sophos;i="6.00,205,1681196400"; 
   d="scan'208";a="418518403"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 May 2023 12:54:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10726"; a="709754630"
X-IronPort-AV: E=Sophos;i="6.00,205,1681196400"; 
   d="scan'208";a="709754630"
Received: from lkp-server01.sh.intel.com (HELO fb1ced2c09fb) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 30 May 2023 12:54:39 -0700
Received: from kbuild by fb1ced2c09fb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q45QV-0000mB-19;
	Tue, 30 May 2023 19:54:39 +0000
Date: Wed, 31 May 2023 03:53:56 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:arcvm12-5.10 1925/27651]
 include/trace/hooks/mm.h:17:1: sparse: sparse: incorrect type in assignment
 (different address spaces)
Message-ID: <202305310349.wcKV8DtM-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common arcvm12-5.10
head:   fb8d4193a852c7d62938aaf3a8c58bbc7888bb23
commit: 62e32cf8f39709054e9dc0308e2c103e433b7f20 [1925/27651] ANDROID: mm: Create vendor hooks to control ZONE_MOVABLE allocations
config: i386-randconfig-s001-20230528 (https://download.01.org/0day-ci/archive/20230531/202305310349.wcKV8DtM-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce:
        # apt-get install sparse
        # sparse version: v0.6.4-39-gce1a6720-dirty
        git remote add android-common https://android.googlesource.com/kernel/common
        git fetch --no-tags android-common arcvm12-5.10
        git checkout 62e32cf8f39709054e9dc0308e2c103e433b7f20
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=i386 olddefconfig
        make W=1 C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=i386 SHELL=/bin/bash drivers/android/ drivers/cpufreq/ drivers/pci/ kernel/ lib/ net/ipv4/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202305310349.wcKV8DtM-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/android/vendor_hooks.c: note: in included file (through include/trace/define_trace.h, include/trace/hooks/sched.h):
   include/trace/hooks/sched.h:15:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/sched.h:15:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/sched.h:15:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
   include/trace/hooks/sched.h:19:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/sched.h:19:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/sched.h:19:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
   include/trace/hooks/sched.h:23:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/sched.h:23:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/sched.h:23:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
   include/trace/hooks/sched.h:32:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/sched.h:32:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/sched.h:32:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
   include/trace/hooks/sched.h:36:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/sched.h:36:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/sched.h:36:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
   include/trace/hooks/sched.h:40:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/sched.h:40:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/sched.h:40:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
   include/trace/hooks/sched.h:44:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/sched.h:44:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/sched.h:44:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
   include/trace/hooks/sched.h:49:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/sched.h:49:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/sched.h:49:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
   include/trace/hooks/sched.h:53:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/sched.h:53:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/sched.h:53:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
   include/trace/hooks/sched.h:57:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/sched.h:57:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/sched.h:57:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
   include/trace/hooks/sched.h:61:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/sched.h:61:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/sched.h:61:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
   include/trace/hooks/sched.h:65:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/sched.h:65:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/sched.h:65:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
   include/trace/hooks/sched.h:70:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/sched.h:70:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/sched.h:70:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
   include/trace/hooks/sched.h:84:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/sched.h:84:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/sched.h:84:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
   include/trace/hooks/sched.h:89:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/sched.h:89:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/sched.h:89:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
   include/trace/hooks/sched.h:93:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/sched.h:93:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/sched.h:93:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
   include/trace/hooks/sched.h:99:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/sched.h:99:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/sched.h:99:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
   include/trace/hooks/sched.h:105:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/sched.h:105:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/sched.h:105:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
   include/trace/hooks/sched.h:112:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/sched.h:112:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/sched.h:112:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
   include/trace/hooks/sched.h:116:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/sched.h:116:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/sched.h:116:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
   include/trace/hooks/sched.h:119:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/sched.h:119:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/sched.h:119:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
   include/trace/hooks/sched.h:123:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/sched.h:123:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/sched.h:123:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
   drivers/android/vendor_hooks.c: note: in included file (through include/trace/define_trace.h, include/trace/hooks/mm.h):
>> include/trace/hooks/mm.h:17:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/mm.h:17:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/mm.h:17:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
   include/trace/hooks/mm.h:20:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/mm.h:20:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/mm.h:20:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
   include/trace/hooks/mm.h:23:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/mm.h:23:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/mm.h:23:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs

vim +17 include/trace/hooks/mm.h

    16	
  > 17	DECLARE_RESTRICTED_HOOK(android_rvh_set_skip_swapcache_flags,
    18				TP_PROTO(gfp_t *flags),
    19				TP_ARGS(flags), 1);
    20	DECLARE_RESTRICTED_HOOK(android_rvh_set_gfp_zone_flags,
    21				TP_PROTO(gfp_t *flags),
    22				TP_ARGS(flags), 1);
    23	DECLARE_RESTRICTED_HOOK(android_rvh_set_readahead_gfp_mask,
    24				TP_PROTO(gfp_t *flags),
    25				TP_ARGS(flags), 1);
    26	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
