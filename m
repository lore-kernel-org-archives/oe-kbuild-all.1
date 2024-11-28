Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 689372563
	for <oe-kbuild-all@lists.linux.dev>; Thu, 28 Nov 2024 03:56:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732766166; cv=none; b=ATjxEZjN4t9Dt4aP4an/vgHo+/dutAPVUZrrLzzW1S16wetj2ZkT1nU1/KLZm+TULHhhHaj+aj6SUdzDcYMu1akWzGSbi3c/op8u7PDd+NxAJtQDNlsJG5bTvK/5DGr47HMn34SrKJLHYuVFvNBGCeInj55r/Mx8Tu1V5Tk27qM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732766166; c=relaxed/simple;
	bh=uHH1FLFqRQ0deNzttuL+zc9A4fdAcI8pd4Y9wXZsAjY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=uzrcq47qRavFIwD0hXxdZfGnIVC6QbvwGblLjkKR9J91Q4m4wy4+3N8LDxJYcGPWRD+I7wR97w6BfbQAle+jRIrS+OoyBNRFUKd2fXsEunrXSNui2fhaKyC4CdH5Nls2vNuk9Hb6zlssXBbPcuE5eVXhWgjWcEtNYoV0ytODUtU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gqojWxds; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gqojWxds"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732766164; x=1764302164;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=uHH1FLFqRQ0deNzttuL+zc9A4fdAcI8pd4Y9wXZsAjY=;
  b=gqojWxdsi78N0la4R7cyD+6J9CUg9xqGraaSeyL1XxmgxhIjcScMJOM/
   cUhKbsP82kJdUWM6ZWy8XHkBaGljmCOH0HAKtuOF8vmNI1QxbiLZ7oEcz
   Fs07n9b9fi+zJMcQw/nm3g3qftMzC9AMe9dWwbBZG5Sqjei14UD3J2rp+
   0CcSrAvkh343IwlWJZk/QvSW0+SCPZxPOUowWhXi7WBwbNIfc/uJbO8DV
   WxLfzJDdMpJgFM3eNMy+yi6I0YQlf049tHLfhsNptq6XQZvPORln+NBHl
   PCXnL89lIJS7BYQYbm1zin0TYSyzF8MH33kcDcnBoDi+KvIj9doHRPnjP
   w==;
X-CSE-ConnectionGUID: IfUh/NWxQ4GotKkGLpAsSQ==
X-CSE-MsgGUID: 4rsNTOz+Qqqj6jAYK4WR2A==
X-IronPort-AV: E=McAfee;i="6700,10204,11269"; a="33117520"
X-IronPort-AV: E=Sophos;i="6.12,191,1728975600"; 
   d="scan'208";a="33117520"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2024 19:56:04 -0800
X-CSE-ConnectionGUID: BycSpSRkSfmlIV855pHY6Q==
X-CSE-MsgGUID: 7G17zG6RSy+tCp6eIuvqFA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,191,1728975600"; 
   d="scan'208";a="97073677"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 27 Nov 2024 19:56:03 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tGVdI-0008wJ-19;
	Thu, 28 Nov 2024 03:56:00 +0000
Date: Thu, 28 Nov 2024 11:55:46 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6 1/1] include/trace/hooks/mm.h:30:1:
 sparse: sparse: incorrect type in assignment (different address spaces)
Message-ID: <202411281127.Amn9L9BV-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android15-6.6
head:   abdee98c7143ccc4d555f982aa7c75d7187c346e
commit: 97868360eb78e4c699cbf00baed15af55d0266f7 [1/1] ANDROID: vendor_hooks: add rvh for control memory dirty rate
config: x86_64-randconfig-r133-20241114 (https://download.01.org/0day-ci/archive/20241128/202411281127.Amn9L9BV-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241128/202411281127.Amn9L9BV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411281127.Amn9L9BV-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   mm/page-writeback.c: note: in included file:
>> include/trace/hooks/mm.h:30:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/mm.h:30:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/mm.h:30:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
--
   drivers/android/vendor_hooks.c: note: in included file (through include/trace/define_trace.h, include/trace/hooks/cpufreq.h):
   include/trace/hooks/cpufreq.h:14:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/cpufreq.h:14:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/cpufreq.h:14:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
   drivers/android/vendor_hooks.c: note: in included file (through include/trace/define_trace.h, include/trace/hooks/cgroup.h):
   include/trace/hooks/cgroup.h:22:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/cgroup.h:22:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/cgroup.h:22:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
   include/trace/hooks/cgroup.h:26:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/cgroup.h:26:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/cgroup.h:26:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
   drivers/android/vendor_hooks.c: note: in included file (through include/trace/define_trace.h, include/trace/hooks/iommu.h):
   include/trace/hooks/iommu.h:12:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/iommu.h:12:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/iommu.h:12:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
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
   include/trace/hooks/gic_v3.h:21:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/gic_v3.h:21:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/gic_v3.h:21:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
   drivers/android/vendor_hooks.c: note: in included file (through include/trace/define_trace.h, include/trace/hooks/mm.h):
>> include/trace/hooks/mm.h:30:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/mm.h:30:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/mm.h:30:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
   drivers/android/vendor_hooks.c: note: in included file (through include/trace/define_trace.h, include/trace/hooks/traps.h):
   include/trace/hooks/traps.h:12:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/traps.h:12:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/traps.h:12:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs
   drivers/android/vendor_hooks.c: note: in included file (through include/trace/define_trace.h, include/trace/hooks/fault.h):
   include/trace/hooks/fault.h:12:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/fault.h:12:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/fault.h:12:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs

vim +30 include/trace/hooks/mm.h

    12	
    13	DECLARE_RESTRICTED_HOOK(android_rvh_set_skip_swapcache_flags,
    14				TP_PROTO(gfp_t *flags),
    15				TP_ARGS(flags), 1);
    16	DECLARE_RESTRICTED_HOOK(android_rvh_set_gfp_zone_flags,
    17				TP_PROTO(gfp_t *flags),
    18				TP_ARGS(flags), 1);
    19	DECLARE_RESTRICTED_HOOK(android_rvh_set_readahead_gfp_mask,
    20				TP_PROTO(gfp_t *flags),
    21				TP_ARGS(flags), 1);
    22	
    23	*/
    24	DECLARE_HOOK(android_vh_slab_folio_alloced,
    25		TP_PROTO(unsigned int order, gfp_t flags),
    26		TP_ARGS(order, flags));
    27	DECLARE_HOOK(android_vh_kmalloc_large_alloced,
    28		TP_PROTO(struct page *page, unsigned int order, gfp_t flags),
    29		TP_ARGS(page, order, flags));
  > 30	DECLARE_RESTRICTED_HOOK(android_rvh_ctl_dirty_rate,
    31		TP_PROTO(void *unused),
    32		TP_ARGS(unused), 1);
    33	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
