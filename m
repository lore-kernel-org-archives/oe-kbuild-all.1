Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38E1618AE7
	for <oe-kbuild-all@lists.linux.dev>; Fri, 15 Sep 2023 19:08:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694804938; x=1726340938;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=QcLD/5NBAFPWT1G9n6vpUOrlpoqza+ero4QHdnoEkZ0=;
  b=RTNklxshkbcNyouuhRebf/ZhXYpwYSRsrJy/vB/1+tgQMVrhTwfH9xgt
   N+pLlHY6UAdfDARTn8Y5cF8XO9sO9qJuFyte0eWMpigwFQObnFHnnK0/3
   VPfxBTN8c6XhG+IZ1hfhvVMLKyUSHco17nQuDKHc+WvFCdG3YDYNULJL2
   N3i0+9LcjVRua2QgPMq+g5wAte89ViTav6aZ9fZqM5TX2r+hqeh+y2afs
   GYB3QoFohMJcS2GVqqTB61UKCyObWpwOuZkOAlY0i53FlZToOlsLK2G3T
   +zNGjJMs5cw24RMkyfV6inkLeLDpwyiMQhXiLHZuZ9LxpyvPMwi88eZXs
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10834"; a="443388133"
X-IronPort-AV: E=Sophos;i="6.02,149,1688454000"; 
   d="scan'208";a="443388133"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2023 12:08:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10834"; a="748296617"
X-IronPort-AV: E=Sophos;i="6.02,149,1688454000"; 
   d="scan'208";a="748296617"
Received: from lkp-server02.sh.intel.com (HELO 9ef86b2655e5) ([10.239.97.151])
  by fmsmga007.fm.intel.com with ESMTP; 15 Sep 2023 12:08:34 -0700
Received: from kbuild by 9ef86b2655e5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qhEAg-0003Jr-2S;
	Fri, 15 Sep 2023 19:08:10 +0000
Date: Sat, 16 Sep 2023 03:07:32 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-6.1 4/5] include/trace/hooks/psci.h:13:1:
 sparse: sparse: incorrect type in assignment (different address spaces)
Message-ID: <202309160354.7YsZPfpU-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android14-6.1
head:   e52e60e3ed8dff3fe0fb9d839c93819c91501560
commit: 9e2fa0a396079d69d6da2fa21426a9ac9e52e8bf [4/5] ANDROID: Fix incorrect hook declaration
config: i386-randconfig-061-20230915 (https://download.01.org/0day-ci/archive/20230916/202309160354.7YsZPfpU-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230916/202309160354.7YsZPfpU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309160354.7YsZPfpU-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   include/trace/hooks/net.h:19:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
   include/trace/hooks/net.h:21:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/net.h:21:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/net.h:21:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
   include/trace/hooks/net.h:23:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/net.h:23:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/net.h:23:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
   include/trace/hooks/net.h:25:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/net.h:25:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/net.h:25:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
   drivers/android/vendor_hooks.c: note: in included file (through include/trace/define_trace.h, include/trace/hooks/vmscan.h):
   include/trace/hooks/vmscan.h:12:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/vmscan.h:12:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/vmscan.h:12:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
   drivers/android/vendor_hooks.c: note: in included file (through include/trace/define_trace.h, include/trace/hooks/avc.h):
   include/trace/hooks/avc.h:14:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/avc.h:14:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/avc.h:14:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
   include/trace/hooks/avc.h:18:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/avc.h:18:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/avc.h:18:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
   include/trace/hooks/avc.h:22:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/avc.h:22:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/avc.h:22:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
   include/trace/hooks/avc.h:26:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/avc.h:26:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/avc.h:26:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
   drivers/android/vendor_hooks.c: note: in included file (through include/trace/define_trace.h, include/trace/hooks/creds.h):
   include/trace/hooks/creds.h:15:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/creds.h:15:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/creds.h:15:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
   include/trace/hooks/creds.h:19:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/creds.h:19:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/creds.h:19:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
   include/trace/hooks/creds.h:23:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/creds.h:23:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/creds.h:23:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
   include/trace/hooks/creds.h:27:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/creds.h:27:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/creds.h:27:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
   drivers/android/vendor_hooks.c: note: in included file (through include/trace/define_trace.h, include/trace/hooks/module.h):
   include/trace/hooks/module.h:14:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/module.h:14:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/module.h:14:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
   include/trace/hooks/module.h:18:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/module.h:18:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/module.h:18:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
   include/trace/hooks/module.h:22:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/module.h:22:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/module.h:22:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
   include/trace/hooks/module.h:26:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/module.h:26:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/module.h:26:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
   drivers/android/vendor_hooks.c: note: in included file (through include/trace/define_trace.h, include/trace/hooks/selinux.h):
   include/trace/hooks/selinux.h:14:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/selinux.h:14:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/selinux.h:14:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
   drivers/android/vendor_hooks.c: note: in included file (through include/trace/define_trace.h, include/trace/hooks/gic_v3.h):
   include/trace/hooks/gic_v3.h:21:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/gic_v3.h:21:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/gic_v3.h:21:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
   drivers/android/vendor_hooks.c: note: in included file (through include/trace/define_trace.h, include/trace/hooks/bug.h):
   include/trace/hooks/bug.h:10:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/bug.h:10:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/bug.h:10:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
   drivers/android/vendor_hooks.c: note: in included file (through include/trace/define_trace.h, include/trace/hooks/fault.h):
   include/trace/hooks/fault.h:11:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/fault.h:11:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/fault.h:11:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
   include/trace/hooks/fault.h:15:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/fault.h:15:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/fault.h:15:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
   include/trace/hooks/fault.h:19:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/fault.h:19:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/fault.h:19:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
   drivers/android/vendor_hooks.c: note: in included file (through include/trace/define_trace.h, include/trace/hooks/traps.h):
   include/trace/hooks/traps.h:12:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/traps.h:12:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/traps.h:12:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
   include/trace/hooks/traps.h:17:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/traps.h:17:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/traps.h:17:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
   include/trace/hooks/traps.h:21:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/traps.h:21:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/traps.h:21:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
   include/trace/hooks/traps.h:25:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/traps.h:25:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/traps.h:25:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
   include/trace/hooks/traps.h:29:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/traps.h:29:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/traps.h:29:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
   drivers/android/vendor_hooks.c: note: in included file (through include/trace/define_trace.h, include/trace/hooks/audio_usboffload.h):
   include/trace/hooks/audio_usboffload.h:19:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/audio_usboffload.h:19:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/audio_usboffload.h:19:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
   drivers/android/vendor_hooks.c: note: in included file (through include/trace/define_trace.h, include/trace/hooks/typec.h):
   include/trace/hooks/typec.h:37:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/typec.h:37:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/typec.h:37:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
   drivers/android/vendor_hooks.c: note: in included file (through include/trace/define_trace.h, include/trace/hooks/psci.h):
>> include/trace/hooks/psci.h:13:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/psci.h:13:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/psci.h:13:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
   include/trace/hooks/psci.h:17:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/psci.h:17:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/psci.h:17:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs

vim +13 include/trace/hooks/psci.h

    12	
  > 13	DECLARE_RESTRICTED_HOOK(android_rvh_psci_tos_resident_on,
    14		TP_PROTO(int cpu, bool *resident),
    15		TP_ARGS(cpu, resident), 1);
    16	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
