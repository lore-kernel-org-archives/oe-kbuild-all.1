Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAF387E
	for <oe-kbuild-all@lists.linux.dev>; Sun, 28 May 2023 11:30:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685273404; x=1716809404;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=LvcLwhlLOz0W3ssQ0OzuNXwyctlIz74GVE4vaKGjQeQ=;
  b=RWQj4Xnru36YNzpSkryg6tNT1dOe+qG0uUA1gOvBR7d2aBoT4uH+n8ir
   FY9eYUK7Q8v5lKXkziiFP4dqYybHrfKEfbGxKD5Ku5jxHxXGjJMUT3XgH
   PX0KCja/OGpnf9KAVkbgos1whd/WNq3nUg85BBCW8dUkJVtE3sJecx29g
   R995/HCGyxERbgMxW7OFv2hDLFJYFNZHmtn9HiqbneIeO4MqDIYRBQK/F
   creZkMpGxARjVEF8YfmcCoT85eXB34jarLIJMEti7/19zPa7UjmBe0E/N
   xZCqb/kH0nMzDIelpS/He357nfAAZEsrCjM0LfcrLKG6cctDHg3n4S9+G
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10723"; a="417988991"
X-IronPort-AV: E=Sophos;i="6.00,198,1681196400"; 
   d="scan'208";a="417988991"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 May 2023 04:30:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10723"; a="795609978"
X-IronPort-AV: E=Sophos;i="6.00,198,1681196400"; 
   d="scan'208";a="795609978"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 28 May 2023 04:30:02 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q3Eb4-000KXW-15;
	Sun, 28 May 2023 11:30:02 +0000
Date: Sun, 28 May 2023 19:29:17 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:arcvm12-5.10 1925/27651]
 include/trace/hooks/mm.h:23:1: sparse: sparse: incorrect type in assignment
 (different address spaces)
Message-ID: <202305281921.hvXWpPPd-lkp@intel.com>
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
config: i386-randconfig-s001-20230528 (https://download.01.org/0day-ci/archive/20230528/202305281921.hvXWpPPd-lkp@intel.com/config)
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
        make W=1 C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=i386 SHELL=/bin/bash drivers/android/ drivers/cpufreq/ drivers/pci/ drivers/scsi/ufs/ kernel/ lib/ mm/ net/ipv4/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202305281921.hvXWpPPd-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   mm/readahead.c: note: in included file:
>> include/trace/hooks/mm.h:23:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/mm.h:23:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/mm.h:23:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
--
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
   include/trace/hooks/mm.h:17:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/mm.h:17:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/mm.h:17:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
   include/trace/hooks/mm.h:20:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/mm.h:20:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/mm.h:20:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
>> include/trace/hooks/mm.h:23:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/mm.h:23:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/mm.h:23:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs

vim +23 include/trace/hooks/mm.h

    16	
    17	DECLARE_RESTRICTED_HOOK(android_rvh_set_skip_swapcache_flags,
    18				TP_PROTO(gfp_t *flags),
    19				TP_ARGS(flags), 1);
    20	DECLARE_RESTRICTED_HOOK(android_rvh_set_gfp_zone_flags,
    21				TP_PROTO(gfp_t *flags),
    22				TP_ARGS(flags), 1);
  > 23	DECLARE_RESTRICTED_HOOK(android_rvh_set_readahead_gfp_mask,
    24				TP_PROTO(gfp_t *flags),
    25				TP_ARGS(flags), 1);
    26	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
