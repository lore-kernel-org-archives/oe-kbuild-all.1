Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F00A35CBAB
	for <oe-kbuild-all@lists.linux.dev>; Tue, 11 Nov 2025 21:06:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762895185; cv=none; b=L8XB2efwqk9GxDRpcYrZv6raLoZtyj7fxbMajkQI9RqjDbl32cQjeqNa9AatcXtBzGkPH/X7c5xZiQ9HI9LB4q3A2I9C/BXyhl5Kuo4OKN+mxASdkKXzYv+aeIfxTbDATo4D1LTfnMyb1rQwGTAJNecjWHGsUuU7eGm70ksSlF8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762895185; c=relaxed/simple;
	bh=3zepPj4z7pCmjChZFVnu0Hs79I19FZz3RBwLBygjZcw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=brr6ERIqyCgJre6P+5hseUqcFejzX+h5uJ+2te4hzJW1QKNNmbx+5GwGZkixLdLw+lj8PKAwewy39g5fkHZ5tT+YXy2c9LoxTmxStiHpNk7z4RNiinFpuHyjVwkjkp5e/6NYZ4qJd6yNe7A1ycJhpRZcSq89RNzhUJiGgOZRZj8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lD9U1nTz; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lD9U1nTz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762895184; x=1794431184;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3zepPj4z7pCmjChZFVnu0Hs79I19FZz3RBwLBygjZcw=;
  b=lD9U1nTzvtTeqRCz5pk1MgvEBEWiSr28YG1wi0xf+6uErU0N75fsn7nt
   NLoAMU9aLoi4s9v/7YQs/x5itP50Hv/4ZivFmXe47HhNBdOIJrs7lo2gb
   GMvJZlCrtqXARysA1z56pzNbGiHG44A0c/wcwXVo/wylqBc97pXx8f2N8
   xMI8JRs7qoU4RjxGX0J4TYrLLdNl1OPCVtKym1Ks7FyvDldq9ueRnGuYz
   /UltBZgQoOszqv68kL/UD2+nCHisgLoH69jw+IpbuVWZ61pdSNyYeC39N
   ap9J5dhkZH70QLOxhHPE2KSMNjinRRaqeNfblWYifA+wxJdIo61MKQeVn
   w==;
X-CSE-ConnectionGUID: Amc71IFcSBK3IKyDVxb70w==
X-CSE-MsgGUID: /1Hl+sVwSxaciELGAuEZ3Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11610"; a="64843306"
X-IronPort-AV: E=Sophos;i="6.19,297,1754982000"; 
   d="scan'208";a="64843306"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2025 13:06:23 -0800
X-CSE-ConnectionGUID: 9y1wPcK0T3Gj9MvQo0abVQ==
X-CSE-MsgGUID: xdnz016IRDG2aHu4M5NOJg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,297,1754982000"; 
   d="scan'208";a="189772213"
Received: from lkp-server01.sh.intel.com (HELO 7b01c990427b) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 11 Nov 2025 13:06:22 -0800
Received: from kbuild by 7b01c990427b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vIvZD-0003ZX-1l;
	Tue, 11 Nov 2025 21:06:19 +0000
Date: Wed, 12 Nov 2025 05:06:04 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android12-5.10 2/2]
 include/trace/hooks/v4l2core.h:47:1: sparse: sparse: incorrect type in
 assignment (different address spaces)
Message-ID: <202511120455.tZCzN7rq-lkp@intel.com>
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
commit: e6a59da61ee8027a97faa3e93945e3f397570a1e [2/2] ANDROID: media: v4l2-core: Fix deadlock in vendor hook
config: i386-randconfig-r111-20251112 (https://download.01.org/0day-ci/archive/20251112/202511120455.tZCzN7rq-lkp@intel.com/config)
compiler: gcc-13 (Debian 13.3.0-16) 13.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251112/202511120455.tZCzN7rq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511120455.tZCzN7rq-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   include/trace/hooks/sched.h:337:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/sched.h:337:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
   include/trace/hooks/sched.h:341:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/sched.h:341:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/sched.h:341:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
   include/trace/hooks/sched.h:345:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/sched.h:345:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/sched.h:345:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
   include/trace/hooks/sched.h:349:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/sched.h:349:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/sched.h:349:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
   include/trace/hooks/sched.h:369:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/sched.h:369:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/sched.h:369:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
   include/trace/hooks/sched.h:373:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/sched.h:373:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/sched.h:373:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
   include/trace/hooks/sched.h:377:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/sched.h:377:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/sched.h:377:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
   drivers/android/vendor_hooks.c: note: in included file (through include/trace/define_trace.h, include/trace/hooks/gic_v3.h):
   include/trace/hooks/gic_v3.h:18:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/gic_v3.h:18:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/gic_v3.h:18:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
   drivers/android/vendor_hooks.c: note: in included file (through include/trace/define_trace.h, include/trace/hooks/cpufreq.h):
   include/trace/hooks/cpufreq.h:27:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/cpufreq.h:27:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/cpufreq.h:27:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
   drivers/android/vendor_hooks.c: note: in included file (through include/trace/define_trace.h, include/trace/hooks/mm.h):
   include/trace/hooks/mm.h:19:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/mm.h:19:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/mm.h:19:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
   include/trace/hooks/mm.h:22:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/mm.h:22:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/mm.h:22:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
   include/trace/hooks/mm.h:25:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/mm.h:25:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/mm.h:25:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
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
   include/trace/hooks/fault.h:15:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/fault.h:15:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/fault.h:15:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
   include/trace/hooks/fault.h:19:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/fault.h:19:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/fault.h:19:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
   include/trace/hooks/fault.h:23:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/fault.h:23:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/fault.h:23:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
   include/trace/hooks/fault.h:27:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/fault.h:27:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/fault.h:27:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
   drivers/android/vendor_hooks.c: note: in included file (through include/trace/define_trace.h, include/trace/hooks/cgroup.h):
   include/trace/hooks/cgroup.h:15:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/cgroup.h:15:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/cgroup.h:15:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
   include/trace/hooks/cgroup.h:18:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/cgroup.h:18:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/cgroup.h:18:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
   include/trace/hooks/cgroup.h:21:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/cgroup.h:21:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/cgroup.h:21:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
   drivers/android/vendor_hooks.c: note: in included file (through include/trace/define_trace.h, include/trace/hooks/traps.h):
   include/trace/hooks/traps.h:15:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/traps.h:15:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/traps.h:15:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
   include/trace/hooks/traps.h:20:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/traps.h:20:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/traps.h:20:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
   include/trace/hooks/traps.h:24:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/traps.h:24:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/traps.h:24:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
   drivers/android/vendor_hooks.c: note: in included file (through include/trace/define_trace.h, include/trace/hooks/typec.h):
   include/trace/hooks/typec.h:32:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/typec.h:32:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/typec.h:32:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
   include/trace/hooks/typec.h:43:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/typec.h:43:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/typec.h:43:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
   drivers/android/vendor_hooks.c: note: in included file (through include/trace/define_trace.h, include/trace/hooks/vmscan.h):
   include/trace/hooks/vmscan.h:28:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/vmscan.h:28:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/vmscan.h:28:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
   drivers/android/vendor_hooks.c: note: in included file (through include/trace/define_trace.h, include/trace/hooks/v4l2core.h):
>> include/trace/hooks/v4l2core.h:47:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/v4l2core.h:47:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/v4l2core.h:47:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
   include/trace/hooks/v4l2core.h:52:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/v4l2core.h:52:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/v4l2core.h:52:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
   include/trace/hooks/v4l2core.h:57:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/v4l2core.h:57:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/v4l2core.h:57:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
   drivers/android/vendor_hooks.c: note: in included file (through include/trace/define_trace.h, include/trace/hooks/v4l2mc.h):
>> include/trace/hooks/v4l2mc.h:19:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/v4l2mc.h:19:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/v4l2mc.h:19:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
   drivers/android/vendor_hooks.c: note: in included file (through include/trace/define_trace.h, include/trace/hooks/net.h):
   include/trace/hooks/net.h:23:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/net.h:23:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/net.h:23:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
   include/trace/hooks/net.h:25:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/net.h:25:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/net.h:25:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
   include/trace/hooks/net.h:27:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/net.h:27:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/net.h:27:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
   include/trace/hooks/net.h:29:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/net.h:29:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/net.h:29:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
--
   drivers/media/v4l2-core/v4l2-subdev.c: note: in included file:
   include/trace/hooks/v4l2core.h:52:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/v4l2core.h:52:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/v4l2core.h:52:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
   include/trace/hooks/v4l2core.h:57:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/v4l2core.h:57:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/v4l2core.h:57:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
>> include/trace/hooks/v4l2core.h:47:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/v4l2core.h:47:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/v4l2core.h:47:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs

vim +47 include/trace/hooks/v4l2core.h

    12	
    13	struct v4l2_format;
    14	DECLARE_HOOK(android_vh_clear_reserved_fmt_fields,
    15		TP_PROTO(struct v4l2_format *fmt, int *ret),
    16		TP_ARGS(fmt, ret));
    17	
    18	struct v4l2_fmtdesc;
    19	DECLARE_HOOK(android_vh_fill_ext_fmtdesc,
    20		TP_PROTO(struct v4l2_fmtdesc *fmtd, const char **descr),
    21		TP_ARGS(fmtd, descr));
    22	
    23	DECLARE_HOOK(android_vh_clear_mask_adjust,
    24		TP_PROTO(unsigned int ctrl, int *n),
    25		TP_ARGS(ctrl, n));
    26	
    27	struct v4l2_subdev;
    28	struct v4l2_subdev_pad_config;
    29	struct v4l2_subdev_selection;
    30	DECLARE_HOOK(android_vh_v4l2subdev_set_selection,
    31		TP_PROTO(struct v4l2_subdev *sd, struct v4l2_subdev_pad_config *pad,
    32		struct v4l2_subdev_selection *sel, int *ret),
    33		TP_ARGS(sd, pad, sel, ret));
    34	
    35	struct v4l2_subdev_format;
    36	DECLARE_HOOK(android_vh_v4l2subdev_set_fmt,
    37		TP_PROTO(struct v4l2_subdev *sd, struct v4l2_subdev_pad_config *pad,
    38		struct v4l2_subdev_format *format, int *ret),
    39		TP_ARGS(sd, pad, format, ret));
    40	
    41	struct v4l2_subdev_frame_interval;
    42	DECLARE_HOOK(android_vh_v4l2subdev_set_frame_interval,
    43		TP_PROTO(struct v4l2_subdev *sd, struct v4l2_subdev_frame_interval *fi,
    44		int *ret),
    45		TP_ARGS(sd, fi, ret));
    46	
  > 47	DECLARE_RESTRICTED_HOOK(android_rvh_v4l2subdev_set_selection,
    48		TP_PROTO(struct v4l2_subdev *sd, struct v4l2_subdev_pad_config *pad,
    49		struct v4l2_subdev_selection *sel, int *ret),
    50		TP_ARGS(sd, pad, sel, ret), 1);
    51	
  > 52	DECLARE_RESTRICTED_HOOK(android_rvh_v4l2subdev_set_fmt,
    53		TP_PROTO(struct v4l2_subdev *sd, struct v4l2_subdev_pad_config *pad,
    54		struct v4l2_subdev_format *format, int *ret),
    55		TP_ARGS(sd, pad, format, ret), 1);
    56	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
