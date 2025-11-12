Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75AE92C159A
	for <oe-kbuild-all@lists.linux.dev>; Wed, 12 Nov 2025 04:09:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762920545; cv=none; b=bN31N3SSXzAwqcH8qhbtkmsIoUxqsBk7GpczWS3z9sfsNJaI2IO2km+moVwjyxBpnW7kVam9LHTEphkyrQVtVXrj8J9g1PMr8FP4GRUWJy5ymYfUv2cPM7S1zM8f80d5U2+GKMoee2TP8OGjnLtOkZGhOH4jeOFiwU3dBCzcZW4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762920545; c=relaxed/simple;
	bh=F+QlZdCDzjc6JhN1RZcIcIJThgF4ZhM73UaUnvPjWog=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=PyJAVC8uOuwuNx2ZX/t0+Uh67vQveOqrjkNrVWzFnv/q5MnzLZKKMcPZ8Yzihda2B3ef+4feDqiH77yc7MV/OjpfKcBUlDM53J79KKMzhVpy4c8qHixt9dwKv7RdBqevJKr+oE7NCkQpj5Du3DoGBik44ZK2hxFnn0BOJIixFEE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HEfkdFIv; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HEfkdFIv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762920544; x=1794456544;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=F+QlZdCDzjc6JhN1RZcIcIJThgF4ZhM73UaUnvPjWog=;
  b=HEfkdFIvr/Phlezm2qiaEnRAJwkUdZVBAwtbhhYvwxt4zDgwqqqqFRcl
   ByLCavdR4KmMp2eCbv+bBwfMoE+kJJv9NJruhZxEGss5Xr3J5wfO76y9C
   6KJyOHJVwTxQjNr7mSCw+oQc2XotITyz9oJaPS4DFoLx/0oxapdszA3zL
   ePFBYLFSDkIQzTsayMlDse99l8lpUNEvgieFXFifaSxn7ea1nmW5VAqrX
   V4qFLsnPmQyi8kk6iZeWZYnm+Gx4pqwphOKohoMaCDNU+rZK2tYmmsiG1
   FSKwDZI4a0YQTKKGfn0Eyut/xZJDnxTqUfE1owEFaSVFk3tUrPhn3t2wk
   A==;
X-CSE-ConnectionGUID: tseBstUZT1maAMS2ZfyPkw==
X-CSE-MsgGUID: +nDloz0ORRSs6gCMAPlZsg==
X-IronPort-AV: E=McAfee;i="6800,10657,11610"; a="52536672"
X-IronPort-AV: E=Sophos;i="6.19,298,1754982000"; 
   d="scan'208";a="52536672"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2025 20:09:01 -0800
X-CSE-ConnectionGUID: wpTs5Z30TH6W0rV5tgCOyg==
X-CSE-MsgGUID: /HJvkDQjSuOiLFioSILjXA==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO 7b01c990427b) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 11 Nov 2025 20:08:59 -0800
Received: from kbuild by 7b01c990427b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vJ2AD-0003oV-20;
	Wed, 12 Nov 2025 04:08:57 +0000
Date: Wed, 12 Nov 2025 12:08:56 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android12-5.10 2/2]
 include/trace/hooks/block.h:44:1: sparse: sparse: incorrect type in
 assignment (different address spaces)
Message-ID: <202511121231.czjFHiam-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android12-5.10
head:   7a94817e9c9a8a92d1f149fa6333c80b6979c711
commit: ccbc7f88080dc680f0c029bf13a3665e12c80f0a [2/2] ANDROID: add hooks into blk-mq.c for customized I/O scheduler.
config: i386-randconfig-r111-20251112 (https://download.01.org/0day-ci/archive/20251112/202511121231.czjFHiam-lkp@intel.com/config)
compiler: gcc-13 (Debian 13.3.0-16) 13.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251112/202511121231.czjFHiam-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511121231.czjFHiam-lkp@intel.com/

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
