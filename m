Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF4E017C9B
	for <oe-kbuild-all@lists.linux.dev>; Thu,  5 Sep 2024 16:02:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725552139; cv=none; b=iW8uZPzQhUwN6Gd0fbzHS/Uew0ej7jBX+3uh9YAyaTukxP9lA6S0D4HqJ36pP1REx93Zr+F/sM03UMWkrLGf0FTAJa0O/kkPzdFdAk7ps7f7411xu/r46o80sRBpUKCO0GeFpKW9kOo43OiHuzvReQ7PVAVQyOuJAY53bKTW3NA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725552139; c=relaxed/simple;
	bh=4qPW3e9qOs0GBd1EwXRgswWPHZxq5IkpNsVM6uWyuOI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=uxxUBgPthkrRAdYmr1fE4z4FwZof0tFOo6UM6WOdhOFVfksf8ZHBcPlCDEYZZhhx3Eh0enfkySuDyszEQji1nbJMHjgu/JtrfwXwHZFQIa8NBcDL7aHJR1XiYcMr1iX35JLTpr2l4vr99WKb+b/IoPz9MISuG1Ap18lvLdSJrNQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lzFyfsUX; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lzFyfsUX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725552137; x=1757088137;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=4qPW3e9qOs0GBd1EwXRgswWPHZxq5IkpNsVM6uWyuOI=;
  b=lzFyfsUXWKVfuL8AHnXzTLWRhBFQzRXBQO6Qbv/VwRTY4Vrmvlv2NtnG
   QjXpD+UeohjX0O44aexWbnIgGEKjTxmPbNLf6KgleHc+7cmkFSYDyd97m
   BDEcyblzs3eoe11qp9/iQSaP3qUtcqyUkLgXELU+1eWwWrP0I/Xc1K7aU
   f+OufY7zqUYw1AvI+L5jgyCxfQrcGiw9f41G0IW1dceLVClFM7X9h++PR
   Rfgp8Tk5gBgg5IlvTYM6j+/KreSp5HM6GXyXT9SKv+dRNsheUvUstNWi8
   F+WTqx2ylqXabDsIjTx2lY/C67184VTZ1tpkySm5dCwtC4Fu0F4aq5BBa
   g==;
X-CSE-ConnectionGUID: XmOtdWtmQ86rrYKrzUKN8g==
X-CSE-MsgGUID: zF8AGOp+RY+ITJYzBE//Cg==
X-IronPort-AV: E=McAfee;i="6700,10204,11186"; a="24427828"
X-IronPort-AV: E=Sophos;i="6.10,205,1719903600"; 
   d="scan'208";a="24427828"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Sep 2024 09:02:16 -0700
X-CSE-ConnectionGUID: 1+uWulxESsigzvnvnXZJmQ==
X-CSE-MsgGUID: wwFSGm83TZexbwWLQEkRkA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,205,1719903600"; 
   d="scan'208";a="65325324"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 05 Sep 2024 09:02:14 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1smEw0-000A5H-1n;
	Thu, 05 Sep 2024 16:02:12 +0000
Date: Fri, 6 Sep 2024 00:01:29 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android12-5.10 2/7]
 include/trace/hooks/block.h:44:1: sparse: sparse: incorrect type in
 assignment (different address spaces)
Message-ID: <202409052341.FeBQdaer-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android12-5.10
head:   c7d7f8476dfc40cd86018bda22cb422918195cd9
commit: ccbc7f88080dc680f0c029bf13a3665e12c80f0a [2/7] ANDROID: add hooks into blk-mq.c for customized I/O scheduler.
config: arm-randconfig-r121-20240904 (https://download.01.org/0day-ci/archive/20240905/202409052341.FeBQdaer-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.1.0
reproduce: (https://download.01.org/0day-ci/archive/20240905/202409052341.FeBQdaer-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409052341.FeBQdaer-lkp@intel.com/

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
