Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A6FB33CA
	for <oe-kbuild-all@lists.linux.dev>; Sat, 29 Mar 2025 02:16:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743214580; cv=none; b=TqIEjHQ1zAu9k8ASuKLKSuk9XOfXuCeAgPB/ZubujyOcArSDUff0rHgfYMmv/ZOX2OoK0abot9hqjboq8+1w3UpPpRUXqAnv0q/5u7YkVv0gLtmBTRC453Xus4gQkIEIj/4OT0L76s2lZXgtKXW9nFUaBgxL2Y5tG1s2zkr55PY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743214580; c=relaxed/simple;
	bh=VI4Lu1mEGlHsYTJyknocFuWJ2nsS8vRMCg53+HrU+6Y=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=HWXLnN4PCr1EaktXxFuysZmyDyVx/0QmyOayI+o/kO7MzAHR3GsX4aYpMNxop+5EHZGQ6RuYZ/q5RG0C5ZxaPdtRAVWlvVJ2I4w/l47epYoUXA/4CPGgDfSZULFpb+uiFHVp7ZLYJs1081YvFv+KMdqyOhfxpWERBjU99r1nYHw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TQDQb3nQ; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TQDQb3nQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743214578; x=1774750578;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=VI4Lu1mEGlHsYTJyknocFuWJ2nsS8vRMCg53+HrU+6Y=;
  b=TQDQb3nQCr0OsMMibfhUQW4BdLUtoI3RC4Em6rEvk/iF8cvjMll3+QNV
   TbKaJmkChLKks410JsA+TNNEWkS2iBr1l5UvVVG7sNpXPhuIwM4ekpxF+
   Gs8i/LuiwhunzpeIU8ET738XkRxdlJFexAoH2np53NH2XanBuSp/oQRp8
   bKMpbXCjkZxLYze51QCN+btkSpSNhUpVY9X8hH0h85YmkQujEEVgWI20f
   pVOtme6mRzJZ1nKZmCwr2ZZebgcA5gMrUQw0Lk/WVNtN3WMLX/U9jLKaa
   zy+G1AOJR7XwLPEinSv7wlLyI16I4VsS2Pp4ScxGDQtwki4oS8el6NTi5
   A==;
X-CSE-ConnectionGUID: xQEM9jcMR1OD814pOd8jTw==
X-CSE-MsgGUID: DYyL9akbSV+XjmbYXctsyw==
X-IronPort-AV: E=McAfee;i="6700,10204,11387"; a="55956319"
X-IronPort-AV: E=Sophos;i="6.14,284,1736841600"; 
   d="scan'208";a="55956319"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Mar 2025 19:16:17 -0700
X-CSE-ConnectionGUID: dPO641L3QZySd03/zXk3ug==
X-CSE-MsgGUID: WbVr5SMiSmWlKN7UfYzzgg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,284,1736841600"; 
   d="scan'208";a="125606085"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by orviesa006.jf.intel.com with ESMTP; 28 Mar 2025 19:16:16 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tyLjs-0007qY-1X;
	Sat, 29 Mar 2025 02:16:12 +0000
Date: Sat, 29 Mar 2025 10:14:51 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android13-5.15-lts 0/1]
 include/trace/hooks/audio_usboffload.h:31:1: sparse: sparse: incorrect type
 in assignment (different address spaces)
Message-ID: <202503290903.wKdUHOdm-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android13-5.15-lts
head:   5e1b899f19c3d900664c1ca05c4714c24647d82b
commit: 982c7ee3e3abc4a9705762cb3d042081dbde9b93 [0/1] ANDROID: sound: usb: Add vendor hooks for connect & disconnect
config: x86_64-randconfig-123-20250329 (https://download.01.org/0day-ci/archive/20250329/202503290903.wKdUHOdm-lkp@intel.com/config)
compiler: clang version 20.1.1 (https://github.com/llvm/llvm-project 424c2d9b7e4de40d0804dd374721e6411c27d1d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250329/202503290903.wKdUHOdm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503290903.wKdUHOdm-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/android/vendor_hooks.c: note: in included file (through include/trace/define_trace.h, include/trace/hooks/mm.h):
   include/trace/hooks/mm.h:16:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/mm.h:16:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/mm.h:16:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
   include/trace/hooks/mm.h:19:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/mm.h:19:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/mm.h:19:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
   include/trace/hooks/mm.h:22:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/mm.h:22:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/mm.h:22:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
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
   drivers/android/vendor_hooks.c: note: in included file (through include/trace/define_trace.h, include/trace/hooks/iommu.h):
   include/trace/hooks/iommu.h:14:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/iommu.h:14:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/iommu.h:14:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
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
   drivers/android/vendor_hooks.c: note: in included file (through include/trace/define_trace.h, include/trace/hooks/selinux.h):
   include/trace/hooks/selinux.h:14:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/selinux.h:14:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/selinux.h:14:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
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
   include/trace/hooks/fault.h:23:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/fault.h:23:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/fault.h:23:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
   drivers/android/vendor_hooks.c: note: in included file (through include/trace/define_trace.h, include/trace/hooks/traps.h):
   include/trace/hooks/traps.h:11:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/traps.h:11:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/traps.h:11:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
   include/trace/hooks/traps.h:16:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/traps.h:16:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/traps.h:16:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
   include/trace/hooks/traps.h:21:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/traps.h:21:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/traps.h:21:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
   include/trace/hooks/traps.h:25:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/traps.h:25:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/traps.h:25:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
   drivers/android/vendor_hooks.c: note: in included file (through include/trace/define_trace.h, include/trace/hooks/timekeeping.h):
   include/trace/hooks/timekeeping.h:13:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/timekeeping.h:13:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/timekeeping.h:13:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
   drivers/android/vendor_hooks.c: note: in included file (through include/trace/define_trace.h, include/trace/hooks/audio_usboffload.h):
>> include/trace/hooks/audio_usboffload.h:31:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/audio_usboffload.h:31:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/audio_usboffload.h:31:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs

vim +31 include/trace/hooks/audio_usboffload.h

    14	
    15	DECLARE_HOOK(android_vh_audio_usb_offload_vendor_set,
    16		TP_PROTO(void *arg),
    17		TP_ARGS(arg));
    18	
    19	DECLARE_HOOK(android_vh_audio_usb_offload_ep_action,
    20		TP_PROTO(void *arg, bool action),
    21		TP_ARGS(arg, action));
    22	
    23	DECLARE_HOOK(android_vh_audio_usb_offload_synctype,
    24		TP_PROTO(void *arg, int attr, bool *need_ignore),
    25		TP_ARGS(arg, attr, need_ignore));
    26	
    27	DECLARE_HOOK(android_vh_audio_usb_offload_connect,
    28		TP_PROTO(struct usb_interface *intf, struct snd_usb_audio *chip),
    29		TP_ARGS(intf, chip));
    30	
  > 31	DECLARE_RESTRICTED_HOOK(android_rvh_audio_usb_offload_disconnect,
    32		TP_PROTO(struct usb_interface *intf),
    33		TP_ARGS(intf), 1);
    34	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
