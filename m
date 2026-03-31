Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 283302989B0
	for <oe-kbuild-all@lists.linux.dev>; Tue, 31 Mar 2026 10:59:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774954788; cv=none; b=jBjiLjKLvwsQLmCpL8enfmrKh0PAMvL5CArFXBNvT61CDWhDVJB5v1D6E14S2PFXKIEQpc5vKOTnhs7BPLUeL0Dwmy9/wGz2ad/kBOeU/iMghaOtvQ9fuiH1HW6AXpH+1060Hufn8KAb14RJ8r+y3oQgd2UEv1uW5ayzElBaIGc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774954788; c=relaxed/simple;
	bh=n0CO2jFrp237YUUJTP8k9m5kiCz3R0VNNRX0aHI4nGU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ryuostCDoeoOuLofK83j7WiJlWoM44fk0biCrpUhbAaBryl6YeLs/+17zDsj2RtBkG1AkmpLet6/f2f2AfNd9oDt1n2iJDc67S0MxqyCuYr4AZqGPRT0AEp1wG7P0qv6Qltaqz9J2sFCZNlY/1H1jmtMb7FNoWGBYEdZX/6dIfc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BhdBGGWy; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BhdBGGWy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774954786; x=1806490786;
  h=date:from:to:cc:subject:message-id;
  bh=n0CO2jFrp237YUUJTP8k9m5kiCz3R0VNNRX0aHI4nGU=;
  b=BhdBGGWygrOdQp9EysdSdHFwlrcYwhf7J5h9P2LJKSMXbb0IkIo6S0ww
   y+tgu5xvCHQv9JxIK4asXnDleaCdDAFTwcdChdSw1uPGk5A59OpedERaf
   vXlaJgQp9sqNrQfSk2uIgCy6GquLyqJb4BRhie5xzVMIB+WsKOOBrD8mK
   mMbjnLBhUY+Ue/cthsjCXoCZ8w5PYsi5SCNbfr2F4Q+9jxVPorrMX1fdR
   INs3qtp2LcOP9uYbdb+UG9/dhbZe8yuvriV2qdVtnoauZ2DrAWzWcqWl5
   s9dJaJ8qJSDee+3S1rR9WqhmtAk4+wokmIhi0kfqAqdVYWk6RpqUbv61K
   A==;
X-CSE-ConnectionGUID: HE1nwX8hQgq7axreSNefgA==
X-CSE-MsgGUID: e/b3UAHPT4CTjsmcsgDsYw==
X-IronPort-AV: E=McAfee;i="6800,10657,11744"; a="75134685"
X-IronPort-AV: E=Sophos;i="6.23,151,1770624000"; 
   d="scan'208";a="75134685"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Mar 2026 03:59:45 -0700
X-CSE-ConnectionGUID: xyvFSSr7Qc+sSUz82bHAMA==
X-CSE-MsgGUID: TbALe89rRfWGThHPcdtojw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,151,1770624000"; 
   d="scan'208";a="230802329"
Received: from lkp-server01.sh.intel.com (HELO 283bf2e1b94a) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 31 Mar 2026 03:59:42 -0700
Received: from kbuild by 283bf2e1b94a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w7Wou-000000002Xx-1OJS;
	Tue, 31 Mar 2026 10:59:40 +0000
Date: Tue, 31 Mar 2026 18:59:38 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android17-6.18 2/2]
 include/trace/hooks/gunyah.h:10:1: sparse: sparse: incorrect type in
 assignment (different address spaces)
Message-ID: <202603311849.lKpN7tDM-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android17-6.18
head:   702185a02153105e701b2ba6f17ec5384cafb6d6
commit: 14b176ff3a420bdd43627faeaab901671fd982e6 [2/2] ANDROID: gunyah: vcpu_mgr: Add trace_hooks in the gunyah_vcpu driver
config: arm-randconfig-r133-20260331 (https://download.01.org/0day-ci/archive/20260331/202603311849.lKpN7tDM-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.3.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260331/202603311849.lKpN7tDM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603311849.lKpN7tDM-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/android/vendor_hooks.c: note: in included file (through include/trace/define_trace.h, include/trace/hooks/ufshcd.h):
   include/trace/hooks/ufshcd.h:25:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/ufshcd.h:25:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/ufshcd.h:25:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
   include/trace/hooks/ufshcd.h:29:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/ufshcd.h:29:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/ufshcd.h:29:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
   drivers/android/vendor_hooks.c: note: in included file (through include/trace/define_trace.h, include/trace/hooks/cgroup.h):
   include/trace/hooks/cgroup.h:22:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/cgroup.h:22:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/cgroup.h:22:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
   include/trace/hooks/cgroup.h:26:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/cgroup.h:26:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/cgroup.h:26:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
   include/trace/hooks/cgroup.h:30:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/cgroup.h:30:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/cgroup.h:30:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
   drivers/android/vendor_hooks.c: note: in included file (through include/trace/define_trace.h, include/trace/hooks/sys.h):
   include/trace/hooks/sys.h:18:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/sys.h:18:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/sys.h:18:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
   drivers/android/vendor_hooks.c: note: in included file (through include/trace/define_trace.h, include/trace/hooks/iommu.h):
   include/trace/hooks/iommu.h:12:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/iommu.h:12:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/iommu.h:12:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
   include/trace/hooks/iommu.h:19:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/iommu.h:19:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/iommu.h:19:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
   include/trace/hooks/iommu.h:26:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/iommu.h:26:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/iommu.h:26:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
   include/trace/hooks/iommu.h:42:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/iommu.h:42:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/iommu.h:42:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
   include/trace/hooks/iommu.h:46:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/iommu.h:46:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/iommu.h:46:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
   drivers/android/vendor_hooks.c: note: in included file (through include/trace/define_trace.h, include/trace/hooks/net.h):
   include/trace/hooks/net.h:90:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/net.h:90:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/net.h:90:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
   include/trace/hooks/net.h:93:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/net.h:93:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/net.h:93:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
   include/trace/hooks/net.h:96:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/net.h:96:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/net.h:96:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
   include/trace/hooks/net.h:99:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/net.h:99:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/net.h:99:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
   include/trace/hooks/net.h:102:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/net.h:102:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/net.h:102:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
   include/trace/hooks/net.h:105:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/net.h:105:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/net.h:105:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
   include/trace/hooks/net.h:109:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/net.h:109:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/net.h:109:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
   include/trace/hooks/net.h:111:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/net.h:111:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/net.h:111:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
   include/trace/hooks/net.h:113:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/net.h:113:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/net.h:113:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
   include/trace/hooks/net.h:115:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/net.h:115:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/net.h:115:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
   include/trace/hooks/net.h:119:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/net.h:119:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/net.h:119:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
   drivers/android/vendor_hooks.c: note: in included file (through include/trace/define_trace.h, include/trace/hooks/vmscan.h):
   include/trace/hooks/vmscan.h:12:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/vmscan.h:12:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/vmscan.h:12:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
   include/trace/hooks/vmscan.h:15:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/vmscan.h:15:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/vmscan.h:15:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
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
   drivers/android/vendor_hooks.c: note: in included file (through include/trace/define_trace.h, include/trace/hooks/selinux.h):
   include/trace/hooks/selinux.h:14:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/selinux.h:14:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/selinux.h:14:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
   drivers/android/vendor_hooks.c: note: in included file (through include/trace/define_trace.h, include/trace/hooks/gic_v3.h):
   include/trace/hooks/gic_v3.h:18:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/gic_v3.h:18:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/gic_v3.h:18:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
   drivers/android/vendor_hooks.c: note: in included file (through include/trace/define_trace.h, include/trace/hooks/gunyah.h):
>> include/trace/hooks/gunyah.h:10:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/gunyah.h:10:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/gunyah.h:10:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
   include/trace/hooks/gunyah.h:13:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/gunyah.h:13:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/gunyah.h:13:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
   drivers/android/vendor_hooks.c: note: in included file (through include/trace/define_trace.h, include/trace/hooks/reboot.h):
   include/trace/hooks/reboot.h:12:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/reboot.h:12:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/reboot.h:12:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
   drivers/android/vendor_hooks.c: note: in included file (through include/trace/define_trace.h, include/trace/hooks/topology.h):
   include/trace/hooks/topology.h:19:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/topology.h:19:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/topology.h:19:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
   drivers/android/vendor_hooks.c: note: in included file (through include/trace/define_trace.h, include/trace/hooks/mm.h):
   include/trace/hooks/mm.h:20:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/mm.h:20:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/mm.h:20:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
   include/trace/hooks/mm.h:23:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/mm.h:23:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/mm.h:23:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
   include/trace/hooks/mm.h:27:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/mm.h:27:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/mm.h:27:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
   include/trace/hooks/mm.h:31:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/mm.h:31:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/mm.h:31:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
   include/trace/hooks/mm.h:41:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/mm.h:41:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/mm.h:41:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
   include/trace/hooks/mm.h:45:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/mm.h:45:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/mm.h:45:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
   include/trace/hooks/mm.h:48:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/mm.h:48:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/mm.h:48:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
   include/trace/hooks/mm.h:115:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/mm.h:115:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/mm.h:115:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
   include/trace/hooks/mm.h:118:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/mm.h:118:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/mm.h:118:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
   include/trace/hooks/mm.h:136:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/mm.h:136:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/mm.h:136:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
   include/trace/hooks/mm.h:214:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/mm.h:214:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/mm.h:214:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
   include/trace/hooks/mm.h:217:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/mm.h:217:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/mm.h:217:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
   include/trace/hooks/mm.h:359:1: sparse: sparse: incorrect type in argument 4 (different base types) @@     expected restricted int flags @@     got restricted int flags @@
   include/trace/hooks/mm.h:359:1: sparse:     expected restricted int flags
   include/trace/hooks/mm.h:359:1: sparse:     got restricted int flags
   include/trace/hooks/mm.h:359:1: sparse: sparse: symbol '__traceiter_android_vh_free_pages_prepare_bypass' redeclared with different type (incompatible argument 4 (different base types)):
   include/trace/hooks/mm.h:359:1: sparse:    int extern [addressable] [signed] [toplevel] __traceiter_android_vh_free_pages_prepare_bypass( ... )
   include/trace/hooks/mm.h:359:1: sparse: note: previously declared as:
   include/trace/hooks/mm.h:359:1: sparse:    int extern [addressable] [signed] [toplevel] __traceiter_android_vh_free_pages_prepare_bypass( ... )
   include/trace/hooks/mm.h:359:1: sparse: sparse: symbol '__probestub_android_vh_free_pages_prepare_bypass' redeclared with different type (incompatible argument 4 (different base types)):
   include/trace/hooks/mm.h:359:1: sparse:    void extern [addressable] [toplevel] __probestub_android_vh_free_pages_prepare_bypass( ... )
   include/trace/hooks/mm.h:359:1: sparse: note: previously declared as:
   include/trace/hooks/mm.h:359:1: sparse:    void extern [addressable] [toplevel] __probestub_android_vh_free_pages_prepare_bypass( ... )
   include/trace/hooks/mm.h:363:1: sparse: sparse: incorrect type in argument 4 (different base types) @@     expected restricted int flags @@     got restricted int flags @@
   include/trace/hooks/mm.h:363:1: sparse:     expected restricted int flags
   include/trace/hooks/mm.h:363:1: sparse:     got restricted int flags
   include/trace/hooks/mm.h:363:1: sparse: sparse: symbol '__traceiter_android_vh_free_pages_ok_bypass' redeclared with different type (incompatible argument 4 (different base types)):
   include/trace/hooks/mm.h:363:1: sparse:    int extern [addressable] [signed] [toplevel] __traceiter_android_vh_free_pages_ok_bypass( ... )
   include/trace/hooks/mm.h:363:1: sparse: note: previously declared as:
   include/trace/hooks/mm.h:363:1: sparse:    int extern [addressable] [signed] [toplevel] __traceiter_android_vh_free_pages_ok_bypass( ... )
   include/trace/hooks/mm.h:363:1: sparse: sparse: symbol '__probestub_android_vh_free_pages_ok_bypass' redeclared with different type (incompatible argument 4 (different base types)):
   include/trace/hooks/mm.h:363:1: sparse:    void extern [addressable] [toplevel] __probestub_android_vh_free_pages_ok_bypass( ... )
   include/trace/hooks/mm.h:363:1: sparse: note: previously declared as:
   include/trace/hooks/mm.h:363:1: sparse:    void extern [addressable] [toplevel] __probestub_android_vh_free_pages_ok_bypass( ... )
   drivers/android/vendor_hooks.c: note: in included file (through include/trace/define_trace.h, include/trace/hooks/fault.h):
   include/trace/hooks/fault.h:13:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/fault.h:13:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/fault.h:13:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
   include/trace/hooks/fault.h:17:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/fault.h:17:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/fault.h:17:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
   include/trace/hooks/fault.h:26:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/fault.h:26:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/fault.h:26:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
   drivers/android/vendor_hooks.c: note: in included file (through include/trace/define_trace.h, include/trace/hooks/dtask.h):
   include/trace/hooks/dtask.h:32:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/dtask.h:32:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/dtask.h:32:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
   include/trace/hooks/dtask.h:129:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/dtask.h:129:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/dtask.h:129:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
   drivers/android/vendor_hooks.c: note: in included file (through include/trace/define_trace.h, include/trace/hooks/psci.h):
   include/trace/hooks/psci.h:13:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/psci.h:13:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/psci.h:13:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
   include/trace/hooks/psci.h:17:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/psci.h:17:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/psci.h:17:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
   drivers/android/vendor_hooks.c: note: in included file (through include/trace/define_trace.h, include/trace/hooks/traps.h):
   include/trace/hooks/traps.h:13:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/traps.h:13:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/traps.h:13:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs

vim +10 include/trace/hooks/gunyah.h

     9	
  > 10	DECLARE_RESTRICTED_HOOK(android_rvh_gh_before_vcpu_run,
    11		     TP_PROTO(u16 vmid, u32 vcpu_id),
    12		     TP_ARGS(vmid, vcpu_id), 1);
    13	DECLARE_RESTRICTED_HOOK(android_rvh_gh_after_vcpu_run,
    14		     TP_PROTO(u16 vmid, u32 vcpu_id, int hcall_ret,
    15		     const struct gunyah_hypercall_vcpu_run_resp *resp),
    16		     TP_ARGS(vmid, vcpu_id, hcall_ret, resp), 1);
    17	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
