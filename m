Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.10
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793108111;
	b=zYl+z1isQiqOTnto0mHoZCDAUHsEbnXRmQ0cQ3326WPKYnLcpaI7EmTF4k/4zniWA1Bh
	 0DL2KWofKu99SnpHrhgc7SzUDqCXNRM/C018vunLy3tg81f115f1gwr4UTpK0PQqoBmOS
	 X18RljzIxblMwWhSAbe5nDjueV3w547ri9zueRrSeP5MM+dVqXN0CHJ2sknUpEjrcA1Qq
	 wrOvp/RSEK2WSvINr0mjX6tCOkgDl9kiNwECf0KyXqZy/fEXkThhfnEEMc9DqTmTwB+5V
	 AB82xGddvs51eOcwequcBMzLIOx0mgdOBG7R30aYIido5zAxsOh2gmYGgFpaIcO+dEw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793108111;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=pKfmwljvEsLsSD5f2xvE8n8Am7gxJcbUuJdC46ms0gU=;
	b=3YYRdb42/ggXUwXSAq9LGc2cR688ibZmrC3cj4+R5DKLcIsN8EcJRjZmbutjWxkvVvnr
	 3CxppYBqTZW+d1Zvsk+MgzOfuJbWWvZHjZC136bMhEzpbk+g7yREQJq1FrsAj8WKcg7l6
	 pB5gVfXC4vLO0EBOr5QTWJLdp/HxovBpACb/p7OeP+X6Hsrr3jU7VNpHJKPHRdwExyPoi
	 EkVaAcA1T+LSlOtqKIU0KVP2D+GKQ5bYUhUXj+rcXycZw9pGeTyqFUXk4g/dEPFDBIDjb
	 XB/EB1sN9/GyvuS1gPDLgibC8Og+8DOCMfxNxHG2OgVL3TYdd4g1/ANa3c/uSfgCmIg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Yb7VdmpX;
	arc=none smtp.remote-ip=198.175.65.10
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 095E4606A31A
	for <oe-kbuild-all@lists.linux.dev>; Tue, 27 Oct 2026 13:35:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 095E4606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Yb7VdmpX
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793108110; x=1824644110;
  h=date:from:to:cc:subject:message-id;
  bh=IhN0rXz8aV0JkQRNnemQljBzIpKGIyKHi7itIqO3cMY=;
  b=Yb7VdmpXm4tFl5caebIAYdbSTbBOvZ4qwz0PLlCL8fCibELDFtgBWbLG
   aGdcm7gxlL6noazKr0zH1w35s6tLXiJurysG1W3PgcbF6QEHG5Rx++udD
   Ta7XHmZ20btFR3M0ye/bif0GemDwiGO49RxbbIwE5p7E3UEA+UtqYWjPU
   RKdj00kuGYuc98MT7t0ZD11WhlrnaU+s0xQ6kXrxloECrlKa1eR0sA38h
   AutX6BQAxU2n4jBiWBS8XCW89KJxy7t7jXQxVxImF2LhCSpSzGPA9dnn7
   vyPTaG04DZQYau7aGad3Ped4yQfs0ZajSmx/fKMNmVavkv9KxiaGrflDb
   w==;
X-CSE-ConnectionGUID: IAlo/h7nQmqVlKZQkP8yqQ==
X-CSE-MsgGUID: gLb/lV6hTeShNHicjqTgBg==
X-IronPort-AV: E=McAfee;i="6800,10657,11948"; a="1696617"
X-IronPort-AV: E=Sophos;i="6.27,181,1787036400"; 
   d="scan'208";a="1696617"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2026 06:35:09 -0700
X-CSE-ConnectionGUID: IR1+HSWcQ8OZRbPpUUpmwg==
X-CSE-MsgGUID: 4K8DVWw6Rt+lNzcVmQowxQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,181,1787036400"; 
   d="scan'208";a="5070946"
Received: from igk-lkp-server01.igk.intel.com (HELO 58ca8a381a5c) ([10.211.93.152])
  by fmviesa010.fm.intel.com with ESMTP; 27 Oct 2026 06:35:08 -0700
Received: from kbuild by 58ca8a381a5c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xLhKT-000000004Wt-3Q6x;
	Tue, 27 Oct 2026 13:35:05 +0000
Date: Tue, 27 Oct 2026 14:34:07 +0100
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-6.1 2/2]
 include/trace/hooks/dtask.h:99:1: sparse: sparse: incorrect type in
 assignment (different address spaces)
Message-ID: <202610271438.F1IYAwB2-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

tree:   https://android.googlesource.com/kernel/common android14-6.1
head:   13308c06721960d523011bc7650b77c8410d1251
commit: 2870c7853029fda4a34cb2172604d713e6502c04 [2/2] ANDROID: GKI: add percpu_rwsem vendor hooks
config: arm-randconfig-r2308-20261027 (https://download.01.org/0day-ci/archive/20261027/202610271438.F1IYAwB2-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 42d4451d86c175b745d6ea1c4081787994c7259b)
sparse: v0.6.5-rc1-1-gc4640450
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261027/202610271438.F1IYAwB2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610271438.F1IYAwB2-lkp@intel.com/

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
