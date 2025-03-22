Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09AB51DBB2E
	for <oe-kbuild-all@lists.linux.dev>; Sat, 22 Mar 2025 11:30:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742643050; cv=none; b=oL+0MjqfO5wDUODLw2VufXqUkNqf83uXAtw1DC4PAN225WijQiM8CW1IV8UWDnitDBjriDaZGTHVNeBbd/u+DtD5ohBazU/COF38WVjdt7kGqFkdSYxz/5YLrq/1pAwyInpwnDvak8uHFrOwoXdBKCXBboZRdhT7SozEIEGRwXI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742643050; c=relaxed/simple;
	bh=XYfbadfZ9mGN1wXUhujSGRtEDeF91TZkwog9Hfl7FJA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=b9chSNKT0Gp/9jNa9fd9UTI0tboTwbI+gEruO2KWW+OUva0bchS89SpPMPSRbaUhA17at07A/loBtoqPGTvsWe6ndOFx7f/U83uO2DY4RhXvQQtPAFiSAo9w8zIpcowXnaGDf3Lb19MKPkdHwxbMUE3ySW3dx1XuvoYhfFDkCo0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZPVQ7O9r; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZPVQ7O9r"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742643048; x=1774179048;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=XYfbadfZ9mGN1wXUhujSGRtEDeF91TZkwog9Hfl7FJA=;
  b=ZPVQ7O9rAHsnkFIY2l7YjH30YY/D9ir9GLrmhIDe+gfTGkhdA/A/sDxZ
   xWyTvjm4/6NLtXiJOR5WxLzl5NleNvYBvTXC5jZtMjUbGHJ8a2n0hvTQ/
   OB/mjJLJGUg62jQ+tlmD14tUYbFO9KHNqtzfjQJhOFP3R9CB422cYBrUB
   cu4kKQFQ/3MZ/NDppMM+hHGl9nkAy6zvapyXs/zczzPLlSGD3jMxhLqO1
   WlEp8X4w+vjgcNQ3hcy2fMLG/Q5p8z/s2fdaz8CQloq888elc7moVArz7
   o6SppCgUJ5fojp7+YHnZ3gINQaicuylwNJ40lt5BQIulLzEZLIbJC9L+q
   g==;
X-CSE-ConnectionGUID: lqyBaoI8Re6FCJa4SCF8uw==
X-CSE-MsgGUID: hdtkaGADROSvo2WjZlfzZQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11380"; a="55283877"
X-IronPort-AV: E=Sophos;i="6.14,267,1736841600"; 
   d="scan'208";a="55283877"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Mar 2025 04:30:47 -0700
X-CSE-ConnectionGUID: uaGy2g0yQPycCzN62AQKHA==
X-CSE-MsgGUID: ZXQfIITTQXSL1oq9iJ6eMw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,267,1736841600"; 
   d="scan'208";a="123640440"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by orviesa006.jf.intel.com with ESMTP; 22 Mar 2025 04:30:46 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tvx3r-00027T-2J;
	Sat, 22 Mar 2025 11:30:43 +0000
Date: Sat, 22 Mar 2025 19:30:34 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-kiwi-6.1 0/305]
 include/trace/hooks/dtask.h:99:1: sparse: sparse: incorrect type in
 assignment (different address spaces)
Message-ID: <202503221945.uXaEjEJj-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android14-kiwi-6.1
head:   8c3f4b0ed8deb9100c8e4f5b3564cbeae2c86fc1
commit: 2870c7853029fda4a34cb2172604d713e6502c04 [0/305] ANDROID: GKI: add percpu_rwsem vendor hooks
config: x86_64-randconfig-121-20250322 (https://download.01.org/0day-ci/archive/20250322/202503221945.uXaEjEJj-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250322/202503221945.uXaEjEJj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503221945.uXaEjEJj-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/android/vendor_hooks.c: note: in included file:
   include/trace/hooks/fs.h:23:31: sparse: sparse: no newline at end of file
   drivers/android/vendor_hooks.c: note: in included file (through include/trace/define_trace.h, include/trace/hooks/fs.h):
   include/trace/hooks/fs.h:23:31: sparse: sparse: no newline at end of file
   drivers/android/vendor_hooks.c: note: in included file (through include/trace/trace_events.h, include/trace/define_trace.h, include/trace/hooks/fs.h):
   include/trace/hooks/fs.h:23:31: sparse: sparse: no newline at end of file
   drivers/android/vendor_hooks.c: note: in included file (through include/trace/trace_events.h, include/trace/define_trace.h, include/trace/hooks/fs.h):
   include/trace/hooks/fs.h:23:31: sparse: sparse: no newline at end of file
   drivers/android/vendor_hooks.c: note: in included file (through include/trace/trace_events.h, include/trace/define_trace.h, include/trace/hooks/fs.h):
   include/trace/hooks/fs.h:23:31: sparse: sparse: no newline at end of file
   drivers/android/vendor_hooks.c: note: in included file (through include/trace/trace_events.h, include/trace/define_trace.h, include/trace/hooks/fs.h):
   include/trace/hooks/fs.h:23:31: sparse: sparse: no newline at end of file
   drivers/android/vendor_hooks.c: note: in included file (through include/trace/trace_events.h, include/trace/define_trace.h, include/trace/hooks/fs.h):
   include/trace/hooks/fs.h:23:31: sparse: sparse: no newline at end of file
   drivers/android/vendor_hooks.c: note: in included file (through include/trace/trace_events.h, include/trace/define_trace.h, include/trace/hooks/fs.h):
   include/trace/hooks/fs.h:23:31: sparse: sparse: no newline at end of file
   drivers/android/vendor_hooks.c: note: in included file (through include/trace/trace_events.h, include/trace/define_trace.h, include/trace/hooks/fs.h):
   include/trace/hooks/fs.h:23:31: sparse: sparse: no newline at end of file
   drivers/android/vendor_hooks.c: note: in included file (through include/trace/perf.h, include/trace/define_trace.h, include/trace/hooks/fs.h):
   include/trace/hooks/fs.h:23:31: sparse: sparse: no newline at end of file
   drivers/android/vendor_hooks.c: note: in included file (through include/trace/bpf_probe.h, include/trace/define_trace.h, include/trace/hooks/fs.h):
   include/trace/hooks/fs.h:23:31: sparse: sparse: no newline at end of file
   drivers/android/vendor_hooks.c: note: in included file (through include/trace/define_trace.h, include/trace/hooks/dtask.h):
>> include/trace/hooks/dtask.h:99:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/dtask.h:99:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/dtask.h:99:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
   drivers/android/vendor_hooks.c: note: in included file (through include/trace/define_trace.h, include/trace/hooks/cpufreq.h):
   include/trace/hooks/cpufreq.h:14:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/cpufreq.h:14:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/cpufreq.h:14:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
   include/trace/hooks/cpufreq.h:27:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/cpufreq.h:27:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/cpufreq.h:27:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
   drivers/android/vendor_hooks.c: note: in included file (through include/trace/define_trace.h, include/trace/hooks/preemptirq.h):
   include/trace/hooks/preemptirq.h:13:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/preemptirq.h:13:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/preemptirq.h:13:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
   include/trace/hooks/preemptirq.h:17:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/preemptirq.h:17:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/preemptirq.h:17:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
   include/trace/hooks/preemptirq.h:21:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/preemptirq.h:21:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/preemptirq.h:21:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
   include/trace/hooks/preemptirq.h:25:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/preemptirq.h:25:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/preemptirq.h:25:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
   drivers/android/vendor_hooks.c: note: in included file (through include/trace/define_trace.h, include/trace/hooks/ufshcd.h):
   include/trace/hooks/ufshcd.h:22:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/ufshcd.h:22:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/ufshcd.h:22:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
   include/trace/hooks/ufshcd.h:26:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/ufshcd.h:26:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/ufshcd.h:26:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
   drivers/android/vendor_hooks.c: note: in included file (through include/trace/define_trace.h, include/trace/hooks/mmc.h):
   include/trace/hooks/mmc.h:25:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/mmc.h:25:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/mmc.h:25:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
   include/trace/hooks/mmc.h:29:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/mmc.h:29:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/mmc.h:29:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
   drivers/android/vendor_hooks.c: note: in included file (through include/trace/define_trace.h, include/trace/hooks/cgroup.h):
   include/trace/hooks/cgroup.h:18:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/cgroup.h:18:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/cgroup.h:18:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
   include/trace/hooks/cgroup.h:26:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/cgroup.h:26:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/cgroup.h:26:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
   include/trace/hooks/cgroup.h:30:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/cgroup.h:30:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/cgroup.h:30:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
   include/trace/hooks/cgroup.h:34:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/cgroup.h:34:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/cgroup.h:34:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
   include/trace/hooks/cgroup.h:38:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/cgroup.h:38:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/cgroup.h:38:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
   drivers/android/vendor_hooks.c: note: in included file (through include/trace/define_trace.h, include/trace/hooks/iommu.h):
   include/trace/hooks/iommu.h:12:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/iommu.h:12:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/iommu.h:12:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
   include/trace/hooks/iommu.h:20:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/iommu.h:20:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/iommu.h:20:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
   include/trace/hooks/iommu.h:35:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/iommu.h:35:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/iommu.h:35:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
   include/trace/hooks/iommu.h:39:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/iommu.h:39:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/iommu.h:39:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
   drivers/android/vendor_hooks.c: note: in included file (through include/trace/define_trace.h, include/trace/hooks/mm.h):
   include/trace/hooks/mm.h:17:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/mm.h:17:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/mm.h:17:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
   include/trace/hooks/mm.h:21:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/mm.h:21:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/mm.h:21:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
   include/trace/hooks/mm.h:25:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/mm.h:25:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/mm.h:25:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
   include/trace/hooks/mm.h:28:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/mm.h:28:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/mm.h:28:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
   include/trace/hooks/mm.h:67:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/mm.h:67:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/mm.h:67:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
   include/trace/hooks/mm.h:106:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/mm.h:106:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/mm.h:106:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
   include/trace/hooks/mm.h:109:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/mm.h:109:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/mm.h:109:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
   include/trace/hooks/mm.h:112:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/mm.h:112:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/mm.h:112:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
   include/trace/hooks/mm.h:132:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/mm.h:132:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/mm.h:132:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
   drivers/android/vendor_hooks.c: note: in included file (through include/trace/define_trace.h, include/trace/hooks/net.h):
   include/trace/hooks/net.h:19:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/net.h:19:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/net.h:19:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
   include/trace/hooks/net.h:21:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/net.h:21:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/net.h:21:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs

vim +99 include/trace/hooks/dtask.h

    19	
    20	DECLARE_HOOK(android_vh_mutex_wait_start,
    21		TP_PROTO(struct mutex *lock),
    22		TP_ARGS(lock));
    23	DECLARE_HOOK(android_vh_mutex_wait_finish,
    24		TP_PROTO(struct mutex *lock),
    25		TP_ARGS(lock));
    26	DECLARE_HOOK(android_vh_mutex_opt_spin_start,
    27		TP_PROTO(struct mutex *lock, bool *time_out, int *cnt),
    28		TP_ARGS(lock, time_out, cnt));
    29	DECLARE_HOOK(android_vh_mutex_opt_spin_finish,
    30		TP_PROTO(struct mutex *lock, bool taken),
    31		TP_ARGS(lock, taken));
    32	DECLARE_HOOK(android_vh_mutex_can_spin_on_owner,
    33		TP_PROTO(struct mutex *lock, int *retval),
    34		TP_ARGS(lock, retval));
    35	DECLARE_HOOK(android_vh_mutex_init,
    36		TP_PROTO(struct mutex *lock),
    37		TP_ARGS(lock));
    38	
    39	DECLARE_HOOK(android_vh_rtmutex_wait_start,
    40		TP_PROTO(struct rt_mutex_base *lock),
    41		TP_ARGS(lock));
    42	DECLARE_HOOK(android_vh_rtmutex_wait_finish,
    43		TP_PROTO(struct rt_mutex_base *lock),
    44		TP_ARGS(lock));
    45	DECLARE_HOOK(android_vh_rt_mutex_steal,
    46		TP_PROTO(int waiter_prio, int top_waiter_prio, bool *ret),
    47		TP_ARGS(waiter_prio, top_waiter_prio, ret));
    48	
    49	DECLARE_HOOK(android_vh_rwsem_read_wait_start,
    50		TP_PROTO(struct rw_semaphore *sem),
    51		TP_ARGS(sem));
    52	DECLARE_HOOK(android_vh_rwsem_read_wait_finish,
    53		TP_PROTO(struct rw_semaphore *sem),
    54		TP_ARGS(sem));
    55	DECLARE_HOOK(android_vh_rwsem_write_wait_start,
    56		TP_PROTO(struct rw_semaphore *sem),
    57		TP_ARGS(sem));
    58	DECLARE_HOOK(android_vh_rwsem_write_wait_finish,
    59		TP_PROTO(struct rw_semaphore *sem),
    60		TP_ARGS(sem));
    61	DECLARE_HOOK(android_vh_rwsem_opt_spin_start,
    62		TP_PROTO(struct rw_semaphore *sem, bool *time_out, int *cnt, bool chk_only),
    63		TP_ARGS(sem, time_out, cnt, chk_only));
    64	DECLARE_HOOK(android_vh_rwsem_opt_spin_finish,
    65		TP_PROTO(struct rw_semaphore *sem, bool taken),
    66		TP_ARGS(sem, taken));
    67	DECLARE_HOOK(android_vh_rwsem_can_spin_on_owner,
    68		TP_PROTO(struct rw_semaphore *sem, bool *ret),
    69		TP_ARGS(sem, ret));
    70	
    71	DECLARE_HOOK(android_vh_sched_show_task,
    72		TP_PROTO(struct task_struct *task),
    73		TP_ARGS(task));
    74	
    75	DECLARE_HOOK(android_vh_record_mutex_lock_starttime,
    76		TP_PROTO(struct task_struct *tsk, unsigned long settime_jiffies),
    77		TP_ARGS(tsk, settime_jiffies));
    78	DECLARE_HOOK(android_vh_record_rtmutex_lock_starttime,
    79		TP_PROTO(struct task_struct *tsk, unsigned long settime_jiffies),
    80		TP_ARGS(tsk, settime_jiffies));
    81	DECLARE_HOOK(android_vh_record_rwsem_lock_starttime,
    82		TP_PROTO(struct task_struct *tsk, unsigned long settime_jiffies),
    83		TP_ARGS(tsk, settime_jiffies));
    84	DECLARE_HOOK(android_vh_record_pcpu_rwsem_starttime,
    85		TP_PROTO(struct task_struct *tsk, unsigned long settime_jiffies),
    86		TP_ARGS(tsk, settime_jiffies));
    87	DECLARE_HOOK(android_vh_record_pcpu_rwsem_time_early,
    88		TP_PROTO(unsigned long settime_jiffies, struct percpu_rw_semaphore *sem),
    89		TP_ARGS(settime_jiffies, sem));
    90	DECLARE_HOOK(android_vh_percpu_rwsem_wq_add,
    91		TP_PROTO(struct percpu_rw_semaphore *sem, bool reader),
    92		TP_ARGS(sem, reader));
    93	DECLARE_HOOK(android_vh_percpu_rwsem_down_read,
    94		TP_PROTO(struct percpu_rw_semaphore *sem, bool try, bool *ret),
    95		TP_ARGS(sem, try, ret));
    96	DECLARE_HOOK(android_vh_percpu_rwsem_up_write,
    97		TP_PROTO(struct percpu_rw_semaphore *sem),
    98		TP_ARGS(sem));
  > 99	DECLARE_RESTRICTED_HOOK(android_rvh_percpu_rwsem_wait_complete,
   100		TP_PROTO(struct percpu_rw_semaphore *sem, long state, bool *complete),
   101		TP_ARGS(sem, state, complete), 1);
   102	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
