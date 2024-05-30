Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4FDD17E442
	for <oe-kbuild-all@lists.linux.dev>; Thu, 30 May 2024 20:52:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717102359; cv=none; b=vFpgWD130folWHGXcb5Jxqdz10r5gFVuE9e5P888MRimy3bt3fe9rsf2wfPF+fr61D+q4nlvMlEONlPV5TxOUaMxkaKnU80baYprH/a06UTvNuaVXZ/7d0NICPeWGVEDwsjosg0/jTt9KYxFlwb7X2NiKEZ6XaZUTa0MOCt1BM8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717102359; c=relaxed/simple;
	bh=FbqGChMa2S/pJFt0KeiKyvLOucHj84nVSKPyV3ty3dY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=BZITdP0pcSsL5b75VwhXaKOOY/re+oSQjDdArdxFHv2GhOfGcnkNvqiY77WUnHu5G4gnld+Lq0y4/1Nbw5X6USRjYidBj81bve+omVsZnUP8a4QIYjEsNNBp37/IY0yp2Hc0RD2B9y+rrlz++A4j0FrPaM3cEyEB3iSzb70bn5I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HeAcDHWA; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HeAcDHWA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717102358; x=1748638358;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=FbqGChMa2S/pJFt0KeiKyvLOucHj84nVSKPyV3ty3dY=;
  b=HeAcDHWAe40auGkLUQdtcQkm5PoE9HC8OWZmYiEB5cHi9UxP3XH7Bqsp
   eSZvVA+lUAP9muQ+UQkU2EbzQGRky0e/CObxMvF32mDmEEa0DHR5/jeDf
   E4hM/4m8TAd6CeBFiRD9j3MStP44ZqQUmfS9d8diCRDreBiLO/Avlgohq
   0wEeUBiWC8H5QaGc6vZo9H3znxynpwrrtP6nFt2pIWidGI8zcOCBh19a/
   2DXo1SLuX4UW7hJH8889Q+wy+4TJlqhAYXSH3U/xlhM99T//wOuWR5OYU
   uuyY7Y2w2jZ//7TQv6pKG3Db4tYWigehparrghmzJ1oc2Rw52l18B03Zw
   A==;
X-CSE-ConnectionGUID: DjbrFd0sQRKrIg2UCD0Ugg==
X-CSE-MsgGUID: ba+ccFpISUuzji3QOsPkqg==
X-IronPort-AV: E=McAfee;i="6600,9927,11088"; a="13442682"
X-IronPort-AV: E=Sophos;i="6.08,202,1712646000"; 
   d="scan'208";a="13442682"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 May 2024 13:52:37 -0700
X-CSE-ConnectionGUID: M+AcTtzmQfGCFkLfQqHBJQ==
X-CSE-MsgGUID: pJfBGhgqSgCvSReqQCCPAg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,202,1712646000"; 
   d="scan'208";a="36520517"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by orviesa008.jf.intel.com with ESMTP; 30 May 2024 13:52:36 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sCmlF-000Fxl-05;
	Thu, 30 May 2024 20:52:33 +0000
Date: Fri, 31 May 2024 04:51:41 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6 2/44] include/trace/hooks/gic.h:18:1:
 sparse: sparse: incorrect type in assignment (different address spaces)
Message-ID: <202405310457.pl0OYdLf-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android15-6.6
head:   f4b48bed25d619eb7e75128b73c90d058e6bcf57
commit: f052f87d33f9f26ae0d420503a5043fd3f42dbf8 [2/44] ANDROID: vendor_hooks:vendor hook for fiq
config: x86_64-randconfig-r111-20240530 (https://download.01.org/0day-ci/archive/20240531/202405310457.pl0OYdLf-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240531/202405310457.pl0OYdLf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405310457.pl0OYdLf-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
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
   include/trace/hooks/iommu.h:19:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/iommu.h:19:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/iommu.h:19:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
   include/trace/hooks/iommu.h:26:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/iommu.h:26:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/iommu.h:26:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
   include/trace/hooks/iommu.h:38:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/iommu.h:38:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/iommu.h:38:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
   include/trace/hooks/iommu.h:42:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/iommu.h:42:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/iommu.h:42:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
   drivers/android/vendor_hooks.c: note: in included file (through include/trace/define_trace.h, include/trace/hooks/net.h):
   include/trace/hooks/net.h:21:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/net.h:21:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/net.h:21:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
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
   include/trace/hooks/net.h:32:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/net.h:32:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/net.h:32:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
   include/trace/hooks/net.h:35:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/net.h:35:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/net.h:35:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
   include/trace/hooks/net.h:38:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/net.h:38:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/net.h:38:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
   include/trace/hooks/net.h:41:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/net.h:41:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/net.h:41:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
   include/trace/hooks/net.h:44:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/net.h:44:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/net.h:44:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
   include/trace/hooks/net.h:47:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/net.h:47:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/net.h:47:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
   include/trace/hooks/net.h:49:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/net.h:49:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/net.h:49:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
   include/trace/hooks/net.h:51:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/net.h:51:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/net.h:51:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
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
   drivers/android/vendor_hooks.c: note: in included file (through include/trace/define_trace.h, include/trace/hooks/gic.h):
>> include/trace/hooks/gic.h:18:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/gic.h:18:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/gic.h:18:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
   drivers/android/vendor_hooks.c: note: in included file (through include/trace/define_trace.h, include/trace/hooks/gic_v3.h):
   include/trace/hooks/gic_v3.h:21:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/gic_v3.h:21:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/gic_v3.h:21:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
   drivers/android/vendor_hooks.c: note: in included file (through include/trace/define_trace.h, include/trace/hooks/reboot.h):
   include/trace/hooks/reboot.h:12:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/reboot.h:12:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/reboot.h:12:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
   drivers/android/vendor_hooks.c: note: in included file (through include/trace/define_trace.h, include/trace/hooks/psci.h):
   include/trace/hooks/psci.h:13:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/psci.h:13:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/psci.h:13:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
   include/trace/hooks/psci.h:17:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/psci.h:17:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/psci.h:17:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
   drivers/android/vendor_hooks.c: note: in included file (through include/trace/define_trace.h, include/trace/hooks/mm.h):
   include/trace/hooks/mm.h:17:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/mm.h:17:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/mm.h:17:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
   include/trace/hooks/mm.h:21:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/mm.h:21:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/mm.h:21:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
   include/trace/hooks/mm.h:24:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/mm.h:24:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/mm.h:24:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
   include/trace/hooks/mm.h:42:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/mm.h:42:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/mm.h:42:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
   drivers/android/vendor_hooks.c: note: in included file (through include/trace/define_trace.h, include/trace/hooks/dtask.h):
   include/trace/hooks/dtask.h:86:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/dtask.h:86:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/dtask.h:86:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
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
   include/trace/hooks/topology.h:21:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/topology.h:21:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/topology.h:21:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
   drivers/android/vendor_hooks.c: note: in included file (through include/trace/define_trace.h, include/trace/hooks/bug.h):
   include/trace/hooks/bug.h:10:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/bug.h:10:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/bug.h:10:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs

vim +18 include/trace/hooks/gic.h

    11	
    12	struct irq_data;
    13	DECLARE_HOOK(android_vh_gic_set_affinity,
    14		TP_PROTO(struct irq_data *d, const struct cpumask *mask_val,
    15			 bool force, u8 *gic_cpu_map, void __iomem *reg),
    16		TP_ARGS(d, mask_val, force, gic_cpu_map, reg));
    17	
  > 18	DECLARE_RESTRICTED_HOOK(android_rvh_fiq_dump,
    19		TP_PROTO(struct pt_regs *regs),
    20		TP_ARGS(regs), 1);
    21	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
