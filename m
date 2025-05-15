Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B45D0224B04
	for <oe-kbuild-all@lists.linux.dev>; Thu, 15 May 2025 10:54:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747306475; cv=none; b=WNYncN/Ml6xRXuzkKgYlZJQuIPEzmfEFhqk78S60dYJOJuQmgDQh3hViEQQKs66IWp9aWQyElS2CKQz/Qd1783gq7AQR8CJhT+fISQovFq7dXoGkEZzrmMzcAmSRBzkjZDj+i2XYjnCZPOmsxg2/ATWr9fobMwZtfvlekSfXnhE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747306475; c=relaxed/simple;
	bh=L0Jztyf6t4VIKo8jnv5F6MrmTIe5SJ4YfZC9hEbylRw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=nJJW76PaJb7g3Hf2EBxlje0ek9bckarVJ90Zdkgp4roq2Ax7F5BYMbsnmfCzaz1enMOwvcxiQPiWKAjfve3jNJtQE/FeYgnypXPNBOwaLB0XNR+g8ynrDZdIKrDjThBMbdH77bvuEsctJ+Yr02cAYRwqBnwWQ2/j8WMfUDelOBs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DT41rTOt; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DT41rTOt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747306474; x=1778842474;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=L0Jztyf6t4VIKo8jnv5F6MrmTIe5SJ4YfZC9hEbylRw=;
  b=DT41rTOtifGpTCk1gJEeE1F1vuSJ15BmVR7wS8mLWqTkseA8SedZZXZd
   nQO3JlRLeVmzPv2vy56CbKf7LJzTDhkrBMN3WMUQNM6myJ/k2JsJr738f
   bIJeTtSMc8sXuZT7O/ZMeYQrpUDSMsmQsTgC6QMQf7cs85/9NaSUv4tRJ
   qz2UH2CXZaSIoylXzXe/Q0uH8rkqOWxf32Htm7jNgdK2TV0vPP6zzWDI/
   e2BEVtRyvFM2oZg2T/JPDt25K/5feztLfiQbeLbt+u647EWBJmAwD6+rc
   h5jmNtAzyQLpypZjgLJvIX2SF6iOH1WmS9Y5j0LTVEXeY6bj771xgjj7U
   g==;
X-CSE-ConnectionGUID: JhQ5t+hjSWOkSkdRF5Fu3w==
X-CSE-MsgGUID: fqFSZGmLTJ6o61AaIPzWsQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11433"; a="60572143"
X-IronPort-AV: E=Sophos;i="6.15,291,1739865600"; 
   d="scan'208";a="60572143"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 May 2025 03:54:30 -0700
X-CSE-ConnectionGUID: iMz3DCFFTwyKtKNKRJ0FyA==
X-CSE-MsgGUID: hFSZsuLuTLGY3hwiaGH3fQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,291,1739865600"; 
   d="scan'208";a="143219025"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 15 May 2025 03:54:29 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uFWEN-000II5-0E;
	Thu, 15 May 2025 10:54:27 +0000
Date: Thu, 15 May 2025 18:53:50 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12 3/3]
 include/trace/hooks/ogki_honor.h:17:1: sparse: sparse: incorrect type in
 assignment (different address spaces)
Message-ID: <202505151814.Rw6kY5M7-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android16-6.12
head:   e1cdedc5dbd14af8ca28472c8d459635f6523cb6
commit: 394cfbc6f83e3fa29ebacdf76b7f203512c2b9e5 [3/3] ANDROID: GKI: Add vendor hook define for Honor ogki
config: arm64-randconfig-r113-20250515 (https://download.01.org/0day-ci/archive/20250515/202505151814.Rw6kY5M7-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project f819f46284f2a79790038e1f6649172789734ae8)
reproduce: (https://download.01.org/0day-ci/archive/20250515/202505151814.Rw6kY5M7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505151814.Rw6kY5M7-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   include/trace/hooks/mm.h:41:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
   include/trace/hooks/mm.h:129:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/mm.h:129:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/mm.h:129:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
   include/trace/hooks/mm.h:142:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/mm.h:142:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/mm.h:142:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
   include/trace/hooks/mm.h:145:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/mm.h:145:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/mm.h:145:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
   include/trace/hooks/mm.h:148:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/mm.h:148:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/mm.h:148:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
   include/trace/hooks/mm.h:151:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/mm.h:151:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/mm.h:151:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
   include/trace/hooks/mm.h:179:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/mm.h:179:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/mm.h:179:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
   include/trace/hooks/mm.h:240:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/mm.h:240:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/mm.h:240:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
   include/trace/hooks/mm.h:263:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/mm.h:263:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/mm.h:263:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
   include/trace/hooks/mm.h:266:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/mm.h:266:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/mm.h:266:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
   include/trace/hooks/mm.h:320:1: sparse: sparse: incorrect type in argument 4 (different base types) @@     expected restricted int flags @@     got restricted int flags @@
   include/trace/hooks/mm.h:320:1: sparse:     expected restricted int flags
   include/trace/hooks/mm.h:320:1: sparse:     got restricted int flags
   include/trace/hooks/mm.h:320:1: sparse: sparse: symbol '__traceiter_android_vh_free_pages_prepare_bypass' redeclared with different type (incompatible argument 4 (different base types)):
   include/trace/hooks/mm.h:320:1: sparse:    int extern [addressable] [signed] [toplevel] __traceiter_android_vh_free_pages_prepare_bypass( ... )
   include/trace/hooks/mm.h:320:1: sparse: note: previously declared as:
   include/trace/hooks/mm.h:320:1: sparse:    int extern [addressable] [signed] [toplevel] __traceiter_android_vh_free_pages_prepare_bypass( ... )
   include/trace/hooks/mm.h:320:1: sparse: sparse: symbol '__probestub_android_vh_free_pages_prepare_bypass' redeclared with different type (incompatible argument 4 (different base types)):
   include/trace/hooks/mm.h:320:1: sparse:    void extern [addressable] [toplevel] __probestub_android_vh_free_pages_prepare_bypass( ... )
   include/trace/hooks/mm.h:320:1: sparse: note: previously declared as:
   include/trace/hooks/mm.h:320:1: sparse:    void extern [addressable] [toplevel] __probestub_android_vh_free_pages_prepare_bypass( ... )
   include/trace/hooks/mm.h:324:1: sparse: sparse: incorrect type in argument 4 (different base types) @@     expected restricted int flags @@     got restricted int flags @@
   include/trace/hooks/mm.h:324:1: sparse:     expected restricted int flags
   include/trace/hooks/mm.h:324:1: sparse:     got restricted int flags
   include/trace/hooks/mm.h:324:1: sparse: sparse: symbol '__traceiter_android_vh_free_pages_ok_bypass' redeclared with different type (incompatible argument 4 (different base types)):
   include/trace/hooks/mm.h:324:1: sparse:    int extern [addressable] [signed] [toplevel] __traceiter_android_vh_free_pages_ok_bypass( ... )
   include/trace/hooks/mm.h:324:1: sparse: note: previously declared as:
   include/trace/hooks/mm.h:324:1: sparse:    int extern [addressable] [signed] [toplevel] __traceiter_android_vh_free_pages_ok_bypass( ... )
   include/trace/hooks/mm.h:324:1: sparse: sparse: symbol '__probestub_android_vh_free_pages_ok_bypass' redeclared with different type (incompatible argument 4 (different base types)):
   include/trace/hooks/mm.h:324:1: sparse:    void extern [addressable] [toplevel] __probestub_android_vh_free_pages_ok_bypass( ... )
   include/trace/hooks/mm.h:324:1: sparse: note: previously declared as:
   include/trace/hooks/mm.h:324:1: sparse:    void extern [addressable] [toplevel] __probestub_android_vh_free_pages_ok_bypass( ... )
   drivers/android/vendor_hooks.c: note: in included file (through include/trace/define_trace.h, include/trace/hooks/traps.h):
   include/trace/hooks/traps.h:13:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/traps.h:13:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/traps.h:13:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
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
   include/trace/hooks/traps.h:33:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/traps.h:33:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/traps.h:33:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
   drivers/android/vendor_hooks.c: note: in included file (through include/trace/define_trace.h, include/trace/hooks/fault.h):
   include/trace/hooks/fault.h:12:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/fault.h:12:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/fault.h:12:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
   include/trace/hooks/fault.h:16:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/fault.h:16:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/fault.h:16:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
   include/trace/hooks/fault.h:20:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/fault.h:20:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/fault.h:20:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
   drivers/android/vendor_hooks.c: note: in included file (through include/trace/define_trace.h, include/trace/hooks/topology.h):
   include/trace/hooks/topology.h:19:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/topology.h:19:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/topology.h:19:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
   drivers/android/vendor_hooks.c: note: in included file (through include/trace/define_trace.h, include/trace/hooks/bug.h):
   include/trace/hooks/bug.h:10:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/bug.h:10:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/bug.h:10:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
   drivers/android/vendor_hooks.c: note: in included file (through include/trace/define_trace.h, include/trace/hooks/cpuinfo.h):
   include/trace/hooks/cpuinfo.h:12:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/cpuinfo.h:12:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/cpuinfo.h:12:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
   drivers/android/vendor_hooks.c: note: in included file (through include/trace/define_trace.h, include/trace/hooks/dmabuf.h):
   include/trace/hooks/dmabuf.h:15:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/dmabuf.h:15:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/dmabuf.h:15:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
   drivers/android/vendor_hooks.c: note: in included file (through include/trace/define_trace.h, include/trace/hooks/madvise.h):
   include/trace/hooks/madvise.h:10:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/madvise.h:10:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/madvise.h:10:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
   drivers/android/vendor_hooks.c: note: in included file (through include/trace/define_trace.h, include/trace/hooks/ogki_honor.h):
>> include/trace/hooks/ogki_honor.h:17:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/ogki_honor.h:17:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/ogki_honor.h:17:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
   include/trace/hooks/ogki_honor.h:20:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/ogki_honor.h:20:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/ogki_honor.h:20:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
   include/trace/hooks/ogki_honor.h:23:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/ogki_honor.h:23:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/ogki_honor.h:23:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
   include/trace/hooks/ogki_honor.h:26:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/ogki_honor.h:26:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/ogki_honor.h:26:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs

vim +17 include/trace/hooks/ogki_honor.h

    12	
    13	struct task_struct;
    14	DECLARE_HOOK(android_vh_ogki_check_vip_status,
    15		TP_PROTO(int cur_pid, int cur_tgid, struct task_struct *task, int *ret),
    16		TP_ARGS(cur_pid, cur_tgid, task, ret));
  > 17	DECLARE_RESTRICTED_HOOK(android_rvh_ogki_task_util,

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
