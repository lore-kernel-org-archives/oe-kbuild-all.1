Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C816515A5
	for <oe-kbuild-all@lists.linux.dev>; Sun, 31 Mar 2024 01:22:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711848135; cv=none; b=mo31KiduM0666ydKmZDZuLoE6BRsNM/kz+9riSM62Z/B1iAsbo8Js/yNADlnWmx0tdjmABFONi5Muk+ClV6XWqVHFQg6jVhhwPfkLlabeFkEl49R0uJXX3VpUMRUxVXmJiW/oiZwXoA+Geeg2nn15lEWZ0Y2OAi24/zEDVgyR7Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711848135; c=relaxed/simple;
	bh=SpcahgzwFyMoAJSvXx9T4C/gN918rDMZ9I32+xk57vY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Djg002yS2C0QFpxq/VcMTLaSFYjgNfRnx/YskxcCjXomXoQNjXj/bsnaVQVyVp3KvIC8XDTfCfKXJEPoEKIA0mGXtu9Kf40sI9U8FNLVZOYhhHDclljH5aePtRhYwKX7Pz67lyyQ5ydEp8il1uPkiLrs+3qZs5gShYu63JAqMh8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QdSxk1V9; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QdSxk1V9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711848131; x=1743384131;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=SpcahgzwFyMoAJSvXx9T4C/gN918rDMZ9I32+xk57vY=;
  b=QdSxk1V9Wuf17eJDy6B+VjGXtNoHC8wtXP5vOiokWiOqLHSn276xRtPm
   tt3ACsS/rr+Hw4+v5iOPBscQqE2SJa6k6Ecg32PONf3jIhkIpltsDrgNq
   kYT1A7Knkc/LNvMKPdwzHtFIOV4klYjM1sKRHx630rDTFD7iLwqVIT8a0
   ogGhAt2VsXi93f7ocTYpK40iFeizMYZEThOOD05wRkn7O9EkTQRBdLgHn
   PlXXv8DieRMEbio58j1qVz0wwSgGcTgF0D+olFvxHrgbn9AfrV3Kt5D4C
   ADCvyeEPzbj1sOerTcAKLPldb0SmxhLM2xvFGGpXIUhW8TkXliBiGmEPG
   A==;
X-CSE-ConnectionGUID: v7+GdJlBTxy1Lw3DEN/klw==
X-CSE-MsgGUID: uNYo3GDkRNe6wx0SqWAn8Q==
X-IronPort-AV: E=McAfee;i="6600,9927,11029"; a="6855254"
X-IronPort-AV: E=Sophos;i="6.07,169,1708416000"; 
   d="scan'208";a="6855254"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Mar 2024 18:22:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,169,1708416000"; 
   d="scan'208";a="48523521"
Received: from lkp-server01.sh.intel.com (HELO 3d808bfd2502) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 30 Mar 2024 18:22:09 -0700
Received: from kbuild by 3d808bfd2502 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rqjtf-0000eo-0m;
	Sun, 31 Mar 2024 01:22:07 +0000
Date: Sun, 31 Mar 2024 09:21:12 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android12-5.10 2/7]
 include/trace/hooks/block.h:44:1: sparse: sparse: incorrect type in
 assignment (different address spaces)
Message-ID: <202403310943.uY9RzfkX-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android12-5.10
head:   750e8cd3ebe9d0ed40433434a447a680e68a2c9a
commit: ccbc7f88080dc680f0c029bf13a3665e12c80f0a [2/7] ANDROID: add hooks into blk-mq.c for customized I/O scheduler.
config: arm64-randconfig-r133-20240330 (https://download.01.org/0day-ci/archive/20240331/202403310943.uY9RzfkX-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20240331/202403310943.uY9RzfkX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403310943.uY9RzfkX-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   include/trace/hooks/sched.h:354:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/sched.h:354:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/sched.h:354:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
   include/trace/hooks/sched.h:358:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/sched.h:358:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/sched.h:358:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
   include/trace/hooks/sched.h:378:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/sched.h:378:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/sched.h:378:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
   include/trace/hooks/sched.h:382:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/sched.h:382:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/sched.h:382:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
   include/trace/hooks/sched.h:386:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/sched.h:386:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/sched.h:386:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
   drivers/android/vendor_hooks.c: note: in included file (through include/trace/define_trace.h, include/trace/hooks/binder.h):
   include/trace/hooks/binder.h:73:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/binder.h:73:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/binder.h:73:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
   drivers/android/vendor_hooks.c: note: in included file (through include/trace/define_trace.h, include/trace/hooks/gic_v3.h):
   include/trace/hooks/gic_v3.h:22:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/gic_v3.h:22:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/gic_v3.h:22:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
   drivers/android/vendor_hooks.c: note: in included file (through include/trace/define_trace.h, include/trace/hooks/cpufreq.h):
   include/trace/hooks/cpufreq.h:14:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/cpufreq.h:14:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/cpufreq.h:14:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
   include/trace/hooks/cpufreq.h:31:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/cpufreq.h:31:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/cpufreq.h:31:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
   drivers/android/vendor_hooks.c: note: in included file (through include/trace/define_trace.h, include/trace/hooks/mm.h):
   include/trace/hooks/mm.h:49:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/mm.h:49:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/mm.h:49:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
   include/trace/hooks/mm.h:52:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/mm.h:52:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/mm.h:52:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
   include/trace/hooks/mm.h:55:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/mm.h:55:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/mm.h:55:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
   include/trace/hooks/mm.h:229:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/mm.h:229:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/mm.h:229:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
   include/trace/hooks/mm.h:262:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/mm.h:262:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/mm.h:262:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
   include/trace/hooks/mm.h:270:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/mm.h:270:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/mm.h:270:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
   include/trace/hooks/mm.h:276:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/mm.h:276:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/mm.h:276:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
   include/trace/hooks/mm.h:282:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/mm.h:282:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/mm.h:282:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
   include/trace/hooks/mm.h:323:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/mm.h:323:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/mm.h:323:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
   drivers/android/vendor_hooks.c: note: in included file (through include/trace/define_trace.h, include/trace/hooks/preemptirq.h):
   include/trace/hooks/preemptirq.h:14:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/preemptirq.h:14:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/preemptirq.h:14:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
   include/trace/hooks/preemptirq.h:18:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/preemptirq.h:18:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/preemptirq.h:18:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
   include/trace/hooks/preemptirq.h:22:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/preemptirq.h:22:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/preemptirq.h:22:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
   include/trace/hooks/preemptirq.h:26:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/preemptirq.h:26:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/preemptirq.h:26:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
   drivers/android/vendor_hooks.c: note: in included file (through include/trace/define_trace.h, include/trace/hooks/bug.h):
   include/trace/hooks/bug.h:14:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/bug.h:14:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/bug.h:14:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
   drivers/android/vendor_hooks.c: note: in included file (through include/trace/define_trace.h, include/trace/hooks/fault.h):
   include/trace/hooks/fault.h:20:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/fault.h:20:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/fault.h:20:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
   include/trace/hooks/fault.h:24:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/fault.h:24:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/fault.h:24:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
   include/trace/hooks/fault.h:28:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/fault.h:28:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/fault.h:28:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
   include/trace/hooks/fault.h:32:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/fault.h:32:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/fault.h:32:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
   drivers/android/vendor_hooks.c: note: in included file (through include/trace/define_trace.h, include/trace/hooks/iommu.h):
   include/trace/hooks/iommu.h:21:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/iommu.h:21:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/iommu.h:21:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
   drivers/android/vendor_hooks.c: note: in included file (through include/trace/define_trace.h, include/trace/hooks/ufshcd.h):
   include/trace/hooks/ufshcd.h:33:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/ufshcd.h:33:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/ufshcd.h:33:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
   include/trace/hooks/ufshcd.h:37:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/ufshcd.h:37:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/ufshcd.h:37:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
   drivers/android/vendor_hooks.c: note: in included file (through include/trace/define_trace.h, include/trace/hooks/block.h):
>> include/trace/hooks/block.h:44:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/block.h:44:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/block.h:44:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
   include/trace/hooks/block.h:64:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/block.h:64:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/block.h:64:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
   include/trace/hooks/block.h:76:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/block.h:76:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/block.h:76:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
   include/trace/hooks/block.h:85:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/block.h:85:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/block.h:85:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
   drivers/android/vendor_hooks.c: note: in included file (through include/trace/define_trace.h, include/trace/hooks/cgroup.h):
   include/trace/hooks/cgroup.h:28:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/cgroup.h:28:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/cgroup.h:28:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
   include/trace/hooks/cgroup.h:31:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/cgroup.h:31:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/cgroup.h:31:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
   include/trace/hooks/cgroup.h:34:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/cgroup.h:34:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/cgroup.h:34:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
   drivers/android/vendor_hooks.c: note: in included file (through include/trace/define_trace.h, include/trace/hooks/traps.h):
   include/trace/hooks/traps.h:20:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/traps.h:20:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/traps.h:20:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
   include/trace/hooks/traps.h:25:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/traps.h:25:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/traps.h:25:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
   include/trace/hooks/traps.h:30:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/traps.h:30:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/traps.h:30:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
   include/trace/hooks/traps.h:34:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/traps.h:34:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/traps.h:34:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
   drivers/android/vendor_hooks.c: note: in included file (through include/trace/define_trace.h, include/trace/hooks/typec.h):
   include/trace/hooks/typec.h:38:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/typec.h:38:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/typec.h:38:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
   include/trace/hooks/typec.h:49:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/typec.h:49:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/typec.h:49:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
   drivers/android/vendor_hooks.c: note: in included file (through include/trace/define_trace.h, include/trace/hooks/vmscan.h):
   include/trace/hooks/vmscan.h:25:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/vmscan.h:25:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/vmscan.h:25:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
   drivers/android/vendor_hooks.c: note: in included file (through include/trace/define_trace.h, include/trace/hooks/v4l2core.h):
   include/trace/hooks/v4l2core.h:56:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/v4l2core.h:56:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/v4l2core.h:56:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
   include/trace/hooks/v4l2core.h:61:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/v4l2core.h:61:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/v4l2core.h:61:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
   include/trace/hooks/v4l2core.h:66:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/v4l2core.h:66:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/v4l2core.h:66:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
   drivers/android/vendor_hooks.c: note: in included file (through include/trace/define_trace.h, include/trace/hooks/v4l2mc.h):
   include/trace/hooks/v4l2mc.h:26:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/v4l2mc.h:26:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/v4l2mc.h:26:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
   drivers/android/vendor_hooks.c: note: in included file (through include/trace/define_trace.h, include/trace/hooks/ipv4.h):
   include/trace/hooks/ipv4.h:12:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/ipv4.h:12:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/ipv4.h:12:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
   include/trace/hooks/ipv4.h:16:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/ipv4.h:16:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/ipv4.h:16:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
   include/trace/hooks/ipv4.h:20:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/ipv4.h:20:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/ipv4.h:20:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
   include/trace/hooks/ipv4.h:24:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/ipv4.h:24:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/ipv4.h:24:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
   include/trace/hooks/ipv4.h:28:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/ipv4.h:28:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/ipv4.h:28:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
   drivers/android/vendor_hooks.c: note: in included file (through include/trace/define_trace.h, include/trace/hooks/pci.h):
   include/trace/hooks/pci.h:15:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/pci.h:15:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/pci.h:15:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
   drivers/android/vendor_hooks.c: note: in included file (through include/trace/define_trace.h, include/trace/hooks/dmabuf.h):
   include/trace/hooks/dmabuf.h:15:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/dmabuf.h:15:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/dmabuf.h:15:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
--
   block/blk-mq.c: note: in included file:
>> include/trace/hooks/block.h:44:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/block.h:44:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/block.h:44:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
   include/trace/hooks/block.h:64:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/block.h:64:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/block.h:64:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
   include/trace/hooks/block.h:76:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/block.h:76:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/block.h:76:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
   include/trace/hooks/block.h:85:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/block.h:85:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/block.h:85:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs

vim +44 include/trace/hooks/block.h

    29	
    30	DECLARE_HOOK(android_vh_blk_alloc_rqs,
    31		TP_PROTO(size_t *rq_size, struct blk_mq_tag_set *set,
    32			struct blk_mq_tags *tags),
    33		TP_ARGS(rq_size, set, tags));
    34	
    35	DECLARE_HOOK(android_vh_blk_rq_ctx_init,
    36		TP_PROTO(struct request *rq, struct blk_mq_tags *tags,
    37			struct blk_mq_alloc_data *data, u64 alloc_time_ns),
    38		TP_ARGS(rq, tags, data, alloc_time_ns));
    39	
    40	DECLARE_HOOK(android_vh_bio_free,
    41		TP_PROTO(struct bio *bio),
    42		TP_ARGS(bio));
    43	
  > 44	DECLARE_RESTRICTED_HOOK(android_rvh_internal_blk_mq_alloc_request,
    45		TP_PROTO(bool *skip, int *tag, struct blk_mq_alloc_data *data),
    46		TP_ARGS(skip, tag, data), 1);
    47	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
