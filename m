Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 252A413C9B3
	for <oe-kbuild-all@lists.linux.dev>; Sat, 29 Mar 2025 20:36:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743280601; cv=none; b=qycL+3SIco1wJ9FDgvY2+4DQm4DSnxQaoiRcI1SrSLTzo2FuGAr53rskhCrYlBPZ9PU0ElCeVUjeIGpI0HG0PUzqMj8BX4YuUPTiwtkyNoLqG5xQhaaAPyDyuc70cIAOCTrVE1lwWMOOD89DpzJhzixqvOxpk4YHka/Xb4AbmAo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743280601; c=relaxed/simple;
	bh=NEnJBfdt2nF0v3VsmYhD8yiXEtc2Gq3XkmubrNvKABo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=GoirQUY//xXrmSVNwUcF7Y4OjDbY0OQJ/KyvhHe+q5ERnbG/SXXBx68cHvzVmCgqoL/zv2yvjMvHsF2OTaTOgLVSAlR6UTqmUwwO6Gi0aYfC6J/6fraZ7WflH9xEh9yiZQkXUBBvFVL1xOtOMqfWh5P/Y6GCb1X0k/fL6p+L1To=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EfMA6vXo; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EfMA6vXo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743280598; x=1774816598;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=NEnJBfdt2nF0v3VsmYhD8yiXEtc2Gq3XkmubrNvKABo=;
  b=EfMA6vXoEsXAa1Zny7fZP0h3yT6QPAEtf5PvqZFyagQHa3zawgTb/Lj1
   ZleuPAoys45nryh8LeZT0B/4bC2We4syY84w0SF58YwomdgdWS2NpMrOL
   JYVNWAjPLMTT9L5PNUg6E2kfmZ1P6TWXzGiJuiNbRlqVa4ITPchSjwa5A
   szvINZ8ChnzHEh6aL5+wkPYtI3C2QyOzeBbCQWSa4azbqc/GNFI5sbpbb
   noG+0g8RfU4UegPH6O2U/M1qLcFr1ZhMev2nu9N8j3hzc0sJP6DV0RNfl
   8rblw7+Ef9PxMUlkSZlyBj6KQAAe3ZiOD6RNCT7GIib4GJjPqjwvpDHMu
   g==;
X-CSE-ConnectionGUID: bU1ag7fOQKWyFEJ/BTwLSw==
X-CSE-MsgGUID: tnGwlWdBS+qR1k7bHH7Cog==
X-IronPort-AV: E=McAfee;i="6700,10204,11388"; a="44529126"
X-IronPort-AV: E=Sophos;i="6.14,286,1736841600"; 
   d="scan'208";a="44529126"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Mar 2025 13:36:37 -0700
X-CSE-ConnectionGUID: CgXyycuPT0+MIj9f76Sg2g==
X-CSE-MsgGUID: VKHmCpQaTkqF1g1PKbHZaw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,286,1736841600"; 
   d="scan'208";a="125500526"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by orviesa009.jf.intel.com with ESMTP; 29 Mar 2025 13:36:36 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tycuw-0008M2-0o;
	Sat, 29 Mar 2025 20:36:34 +0000
Date: Sun, 30 Mar 2025 04:36:01 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-6.1-2025-02 0/1]
 include/trace/hooks/typec.h:26:1: sparse: sparse: incorrect type in
 assignment (different address spaces)
Message-ID: <202503300420.NyHFLtlR-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android14-6.1-2025-02
head:   7d479179eabfdb2a519df1c4b5b68b510ca2776b
commit: eeffe02c9672f931ba20f456c8e4fe5a1df10b94 [0/1] ANDROID: usb: typec: tcpci: Add vendor hook to mask vbus present
config: x86_64-randconfig-123-20250329 (https://download.01.org/0day-ci/archive/20250330/202503300420.NyHFLtlR-lkp@intel.com/config)
compiler: clang version 20.1.1 (https://github.com/llvm/llvm-project 424c2d9b7e4de40d0804dd374721e6411c27d1d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250330/202503300420.NyHFLtlR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503300420.NyHFLtlR-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
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
   drivers/android/vendor_hooks.c: note: in included file (through include/trace/define_trace.h, include/trace/hooks/cgroup.h):
   include/trace/hooks/cgroup.h:20:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/cgroup.h:20:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/cgroup.h:20:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
   include/trace/hooks/cgroup.h:27:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/cgroup.h:27:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/cgroup.h:27:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
   include/trace/hooks/cgroup.h:31:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/cgroup.h:31:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/cgroup.h:31:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
   drivers/android/vendor_hooks.c: note: in included file (through include/trace/define_trace.h, include/trace/hooks/iommu.h):
   include/trace/hooks/iommu.h:12:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/iommu.h:12:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/iommu.h:12:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
   include/trace/hooks/iommu.h:19:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/iommu.h:19:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/iommu.h:19:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
   include/trace/hooks/iommu.h:34:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/iommu.h:34:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/iommu.h:34:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
   include/trace/hooks/iommu.h:38:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/iommu.h:38:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/iommu.h:38:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
   drivers/android/vendor_hooks.c: note: in included file (through include/trace/define_trace.h, include/trace/hooks/mm.h):
   include/trace/hooks/mm.h:15:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/mm.h:15:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/mm.h:15:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
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
   drivers/android/vendor_hooks.c: note: in included file (through include/trace/define_trace.h, include/trace/hooks/selinux.h):
   include/trace/hooks/selinux.h:14:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/selinux.h:14:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/selinux.h:14:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
   drivers/android/vendor_hooks.c: note: in included file (through include/trace/define_trace.h, include/trace/hooks/gic_v3.h):
   include/trace/hooks/gic_v3.h:20:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/gic_v3.h:20:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/gic_v3.h:20:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
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
>> include/trace/hooks/typec.h:26:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/typec.h:26:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/typec.h:26:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs

vim +26 include/trace/hooks/typec.h

    14	
    15	DECLARE_HOOK(android_vh_typec_tcpci_override_toggling,
    16		TP_PROTO(struct tcpci *tcpci, struct tcpci_data *data, int *override_toggling),
    17		TP_ARGS(tcpci, data, override_toggling));
    18	
    19	/*
    20	 * This hook is for addressing hardware anomalies where TCPC_POWER_STATUS_VBUS_PRES bit can return 0
    21	 * even before falling below sSinkDisconnect threshold.
    22	 * Handler has to set bypass to override the value that would otherwise be returned by this
    23	 * function.
    24	 * Handler can set vbus or clear vbus to indicate vbus present or absent
    25	 */
  > 26	DECLARE_RESTRICTED_HOOK(android_rvh_typec_tcpci_get_vbus,
    27		TP_PROTO(struct tcpci *tcpci, struct tcpci_data *data, int *vbus, int *bypass),
    28		TP_ARGS(tcpci, data, vbus, bypass), 1);
    29	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
