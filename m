Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E25713D521
	for <oe-kbuild-all@lists.linux.dev>; Thu, 24 Jul 2025 02:50:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753325423; cv=none; b=c1vD0oQXP0NK0Adj0LKb/Fv7g20oe3ealzBQWbae+3jYAIrcFDxo2811kGAm2+O0wybGo3gDnJXZPf1n9K1N5GqjosluWqyWuZHp0vl+2ePBEbH6d0RytxFwCTQF+mGtMHIuFobswyOJ/wDpHOC+QtAJa+jfs2q67DJg7RW2Ax0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753325423; c=relaxed/simple;
	bh=8Oz/CvEqGOMHqBMBpA/so9roVuRSVxu+S/hQvEnUTwE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=hecwu+PsLOuKGiRMKZ0VM6iqgy+H138RxvvtA6d4yiKyMXOGuvLaFwA5U9L9q26fUBPKCx4DCrT+QgslsdbzTCv6aPGtAOFxi7XXRGHT2VGv5MwlYvK0mYFqLDnJG2ER6fFJoM5toelaB4PtKf0iI2XTBXpTi87MDPCJuxIzVJI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=l1CN/W4m; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="l1CN/W4m"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753325422; x=1784861422;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=8Oz/CvEqGOMHqBMBpA/so9roVuRSVxu+S/hQvEnUTwE=;
  b=l1CN/W4marvZ0NDAE7fRyA8sVJ3Wi33c8SfzpVT9tzLVIqzOufup98rH
   9mTRtIh0oBWkTxeBs/sQOPXpULp/icEiE8YNCci8zQ5J8H9E8NjlvKprs
   dUtummz7BF+acKhfpG9zACbXk2E+SzKOXwbselVilWOOQ5zybBNoXZBYI
   70AbM9v8frdptDCc4ye2reBUVhNlOs7hp7Lv9EZ/yZNhAt6uO0HqV/YvT
   GFNtnm1ZF61stOWbOrEs0QvA3JiUaINwsUlN5XhA8SbKg5sgWlXB3/mpp
   Kx9PDYxo0PqogXQR5tSDC5VvDPpaGenrAFVD/GaOqJsU4K+u2Qn40OhrW
   Q==;
X-CSE-ConnectionGUID: eUHPRaMBSZ+e+O4aDxORmQ==
X-CSE-MsgGUID: zhrRjElIQuSFSG9Rn6wFAQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11501"; a="55500073"
X-IronPort-AV: E=Sophos;i="6.16,336,1744095600"; 
   d="scan'208";a="55500073"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jul 2025 19:50:21 -0700
X-CSE-ConnectionGUID: 4JlQxpkuTMOhHIAH4mFaGA==
X-CSE-MsgGUID: kxtA0iVISZyOqr+Ok4Kk0g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,336,1744095600"; 
   d="scan'208";a="164170857"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 23 Jul 2025 19:50:20 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uem2D-000K1T-1v;
	Thu, 24 Jul 2025 02:50:17 +0000
Date: Thu, 24 Jul 2025 10:49:57 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6-2025-03 1/1]
 include/trace/hooks/perf.h:18:1: sparse: sparse: incorrect type in
 assignment (different address spaces)
Message-ID: <202507241027.8v9fHaST-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android15-6.6-2025-03
head:   68699ccd4e7fed426009d5f8b6cc762627ad2ea1
commit: eec127b5484d09fef414b9914710cd1faa7be1bc [1/1] ANDROID: vendor_hooks:vendor hook for perf
config: i386-randconfig-r133-20250724 (https://download.01.org/0day-ci/archive/20250724/202507241027.8v9fHaST-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14+deb12u1) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250724/202507241027.8v9fHaST-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507241027.8v9fHaST-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   kernel/events/core.c:1386:15: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:1386:15: sparse:    struct perf_event_context [noderef] __rcu *
   kernel/events/core.c:1386:15: sparse:    struct perf_event_context *
   kernel/events/core.c:1399:28: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:1399:28: sparse:    struct perf_event_context [noderef] __rcu *
   kernel/events/core.c:1399:28: sparse:    struct perf_event_context *
   kernel/events/core.c:3504:20: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:3504:20: sparse:    struct perf_event_context [noderef] __rcu *
   kernel/events/core.c:3504:20: sparse:    struct perf_event_context *
   kernel/events/core.c:3508:18: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:3508:18: sparse:    struct perf_event_context [noderef] __rcu *
   kernel/events/core.c:3508:18: sparse:    struct perf_event_context *
   kernel/events/core.c:3509:23: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:3509:23: sparse:    struct perf_event_context [noderef] __rcu *
   kernel/events/core.c:3509:23: sparse:    struct perf_event_context *
   kernel/events/core.c:3558:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:3558:25: sparse:    struct perf_event_context [noderef] __rcu *
   kernel/events/core.c:3558:25: sparse:    struct perf_event_context *
   kernel/events/core.c:3559:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:3559:25: sparse:    struct perf_event_context [noderef] __rcu *
   kernel/events/core.c:3559:25: sparse:    struct perf_event_context *
   kernel/events/core.c:3946:15: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:3946:15: sparse:    struct perf_event_context [noderef] __rcu *
   kernel/events/core.c:3946:15: sparse:    struct perf_event_context *
   kernel/events/core.c:4340:15: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:4340:15: sparse:    struct perf_event_context [noderef] __rcu *
   kernel/events/core.c:4340:15: sparse:    struct perf_event_context *
   kernel/events/core.c:4820:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:4820:25: sparse:    struct perf_event_context [noderef] __rcu *
   kernel/events/core.c:4820:25: sparse:    struct perf_event_context *
   kernel/events/core.c:6229:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:6229:9: sparse:    struct perf_buffer [noderef] __rcu *
   kernel/events/core.c:6229:9: sparse:    struct perf_buffer *
   kernel/events/core.c:5701:24: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __poll_t [usertype] events @@     got int @@
   kernel/events/core.c:5945:22: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:5945:22: sparse:    struct perf_buffer [noderef] __rcu *
   kernel/events/core.c:5945:22: sparse:    struct perf_buffer *
   kernel/events/core.c:6069:14: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:6069:14: sparse:    struct perf_buffer [noderef] __rcu *
   kernel/events/core.c:6069:14: sparse:    struct perf_buffer *
   kernel/events/core.c:6102:14: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:6102:14: sparse:    struct perf_buffer [noderef] __rcu *
   kernel/events/core.c:6102:14: sparse:    struct perf_buffer *
   kernel/events/core.c:6159:14: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:6159:14: sparse:    struct perf_buffer [noderef] __rcu *
   kernel/events/core.c:6159:14: sparse:    struct perf_buffer *
   kernel/events/core.c:6250:14: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:6250:14: sparse:    struct perf_buffer [noderef] __rcu *
   kernel/events/core.c:6250:14: sparse:    struct perf_buffer *
   kernel/events/core.c:6266:14: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:6266:14: sparse:    struct perf_buffer [noderef] __rcu *
   kernel/events/core.c:6266:14: sparse:    struct perf_buffer *
   kernel/events/core.c:7991:15: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:7991:15: sparse:    struct perf_event_context [noderef] __rcu *
   kernel/events/core.c:7991:15: sparse:    struct perf_event_context *
   kernel/events/core.c:8078:13: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:8078:13: sparse:    struct perf_buffer [noderef] __rcu *
   kernel/events/core.c:8078:13: sparse:    struct perf_buffer *
   kernel/events/core.c:8182:61: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *real_parent @@
   kernel/events/core.c:8182:61: sparse:     expected struct task_struct *p
   kernel/events/core.c:8182:61: sparse:     got struct task_struct [noderef] __rcu *real_parent
   kernel/events/core.c:8184:61: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *real_parent @@
   kernel/events/core.c:8184:61: sparse:     expected struct task_struct *p
   kernel/events/core.c:8184:61: sparse:     got struct task_struct [noderef] __rcu *real_parent
   kernel/events/core.c:8872:15: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:8872:15: sparse:    struct perf_event_context [noderef] __rcu *
   kernel/events/core.c:8872:15: sparse:    struct perf_event_context *
   kernel/events/core.c:9912:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:9912:9: sparse:    struct swevent_hlist [noderef] __rcu *
   kernel/events/core.c:9912:9: sparse:    struct swevent_hlist *
   kernel/events/core.c:9951:17: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:9951:17: sparse:    struct swevent_hlist [noderef] __rcu *
   kernel/events/core.c:9951:17: sparse:    struct swevent_hlist *
   kernel/events/core.c:10226:23: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:10226:23: sparse:    struct perf_event_context [noderef] __rcu *
   kernel/events/core.c:10226:23: sparse:    struct perf_event_context *
   kernel/events/core.c:11339:1: sparse: sparse: symbol 'dev_attr_nr_addr_filters' was not declared. Should it be static?
   kernel/events/core.c:13106:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:13106:9: sparse:    struct perf_event_context [noderef] __rcu *
   kernel/events/core.c:13106:9: sparse:    struct perf_event_context *
   kernel/events/core.c:13200:15: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:13200:15: sparse:    struct perf_event_context [noderef] __rcu *
   kernel/events/core.c:13200:15: sparse:    struct perf_event_context *
   kernel/events/core.c:13212:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:13212:9: sparse:    struct perf_event_context [noderef] __rcu *
   kernel/events/core.c:13212:9: sparse:    struct perf_event_context *
   kernel/events/core.c:13635:17: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:13635:17: sparse:    struct swevent_hlist [noderef] __rcu *
   kernel/events/core.c:13635:17: sparse:    struct swevent_hlist *
   kernel/events/core.c:162:9: sparse: sparse: context imbalance in 'perf_ctx_lock' - wrong count at exit
   kernel/events/core.c:170:17: sparse: sparse: context imbalance in 'perf_ctx_unlock' - unexpected unlock
   kernel/events/core.c: note: in included file (through include/linux/rculist.h, include/linux/dcache.h, include/linux/fs.h):
   include/linux/rcupdate.h:815:9: sparse: sparse: context imbalance in 'perf_lock_task_context' - different lock contexts for basic block
   kernel/events/core.c:1433:17: sparse: sparse: context imbalance in 'perf_pin_task_context' - unexpected unlock
   kernel/events/core.c:2813:9: sparse: sparse: context imbalance in '__perf_install_in_context' - wrong count at exit
   kernel/events/core.c: note: in included file:
>> include/trace/hooks/perf.h:18:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   kernel/events/core.c:4794:17: sparse: sparse: context imbalance in 'find_get_context' - unexpected unlock
   kernel/events/core.c: note: in included file:
   kernel/events/internal.h:209:1: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const [noderef] __user *from @@     got void const *buf @@
   kernel/events/core.c: note: in included file (through include/linux/rculist.h, include/linux/dcache.h, include/linux/fs.h):
   include/linux/rcupdate.h:817:9: sparse: sparse: context imbalance in 'perf_get_pgtable_size' - unexpected unlock
   kernel/events/core.c:9761:17: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:9761:17: sparse:    struct swevent_hlist [noderef] __rcu *
   kernel/events/core.c:9761:17: sparse:    struct swevent_hlist *
   kernel/events/core.c:9781:17: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:9781:17: sparse:    struct swevent_hlist [noderef] __rcu *
   kernel/events/core.c:9781:17: sparse:    struct swevent_hlist *
   kernel/events/core.c:9901:16: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:9901:16: sparse:    struct swevent_hlist [noderef] __rcu *
   kernel/events/core.c:9901:16: sparse:    struct swevent_hlist *
   kernel/events/core.c:9901:16: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:9901:16: sparse:    struct swevent_hlist [noderef] __rcu *
   kernel/events/core.c:9901:16: sparse:    struct swevent_hlist *
   kernel/events/core.c:9901:16: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:9901:16: sparse:    struct swevent_hlist [noderef] __rcu *
   kernel/events/core.c:9901:16: sparse:    struct swevent_hlist *

vim +18 include/trace/hooks/perf.h

    11	
    12	struct perf_event;
    13	DECLARE_RESTRICTED_HOOK(android_rvh_armv8pmu_counter_overflowed,
    14		TP_PROTO(struct perf_event *event),
    15		TP_ARGS(event), 1);
    16	
    17	struct perf_cpu_pmu_context;
  > 18	DECLARE_RESTRICTED_HOOK(android_rvh_perf_rotate_context,
    19		TP_PROTO(struct perf_cpu_pmu_context *cpc),
    20		TP_ARGS(cpc), 1);
    21	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
