Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1940015665E
	for <oe-kbuild-all@lists.linux.dev>; Sat, 12 Oct 2024 12:49:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728737349; cv=none; b=BMRA0kpRBlEjFd8B30LTErDk15RSElyI80nRXMVaKpCSDZYDlI5gKFcRkfMgNhVXoVbZhR+x/WQx2zm9MxqRoN3KMNlhv2rS4Fkt3BBnYN57O4vPqSN/96Pnl6Q0XC24X71JzSPaWrJzbyW+tN4f4t4uoQUDJTK/PNOEM3k/I7o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728737349; c=relaxed/simple;
	bh=BGR2kmrxqiIyA86wJvjrvnKpAZu0TeKU1q/HRM8Eo5Q=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=GsupT10YNT7ZwaMyey2/b2/IvAzYdDKJfI5tcA17dtBx3xIvDXuIDyTSeSGf1P8d/+z4zcdQ8KVgQSDveO9QfsWm4eXvH4UhhWtpgbNM38XQS3w6RMT5mYS9HwEAj8cf36hslStzevXTq5dewbdf7CaiOrfPLlF75IeuQ8mQVZI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nBdJbF+G; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nBdJbF+G"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728737346; x=1760273346;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=BGR2kmrxqiIyA86wJvjrvnKpAZu0TeKU1q/HRM8Eo5Q=;
  b=nBdJbF+G3QFZvcXfl7fVPOcGuFG2SeE9SRJfmZXgMPGOtLj7XrVfZtIy
   GppK2DS5Kz7cgZZnwxTO+I2LUpKvrcU5vsylmQqNjfyA6jv1X4AvpvfXE
   UL59DuvZL71JEEl+YYr51+Gg3etdL7EF2O8h5qOE++M8z9OpPmVPCLPU1
   OSj8BHilmXYajUdy4DLDpVRcGaE8nBwC5qymY0h56f1Uw3ap3JES2vmV8
   CEU7H6QeB2sZPEQETYI+NO/9BUcc3HPG3V55uKILufXeeA8XA6udVdqjY
   CD7e5CaH99/waCXKf/TZVPMoxZFhGNAzqymMxxk28PtG8Ul1o2CjbYXod
   w==;
X-CSE-ConnectionGUID: qjkJCTNVQAW/pUqzdqyh2w==
X-CSE-MsgGUID: WZOnweQHSU6mjvAKka1Rvg==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="28229179"
X-IronPort-AV: E=Sophos;i="6.11,198,1725346800"; 
   d="scan'208";a="28229179"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Oct 2024 05:49:05 -0700
X-CSE-ConnectionGUID: hWKv15/qTGOgfyrd+LVHPw==
X-CSE-MsgGUID: 49sujHUXR3uscv9hXXRxLw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,198,1725346800"; 
   d="scan'208";a="100471157"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 12 Oct 2024 05:49:03 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1szbYL-000DMd-0S;
	Sat, 12 Oct 2024 12:49:01 +0000
Date: Sat, 12 Oct 2024 20:48:25 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6 1/1] include/trace/hooks/perf.h:18:1:
 sparse: sparse: incorrect type in assignment (different address spaces)
Message-ID: <202410122058.gAX6rhNB-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android15-6.6
head:   5f5ee6d2aa03c08776343157079820a6c07748bc
commit: eec127b5484d09fef414b9914710cd1faa7be1bc [1/1] ANDROID: vendor_hooks:vendor hook for perf
config: i386-randconfig-061-20241012 (https://download.01.org/0day-ci/archive/20241012/202410122058.gAX6rhNB-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241012/202410122058.gAX6rhNB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410122058.gAX6rhNB-lkp@intel.com/

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
   kernel/events/core.c:4468:34: sparse: sparse: self-comparison always evaluates to true
   kernel/events/core.c:4794:17: sparse: sparse: context imbalance in 'find_get_context' - unexpected unlock
   kernel/events/core.c: note: in included file:
   kernel/events/internal.h:209:1: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const [noderef] __user *from @@     got void const *buf @@
   kernel/events/internal.h:183:1: sparse: sparse: self-comparison always evaluates to true
   kernel/events/internal.h:183:1: sparse: sparse: self-comparison always evaluates to true
   kernel/events/internal.h:183:1: sparse: sparse: self-comparison always evaluates to true
   kernel/events/internal.h:183:1: sparse: sparse: self-comparison always evaluates to true
   kernel/events/internal.h:183:1: sparse: sparse: self-comparison always evaluates to true
   kernel/events/internal.h:191:1: sparse: sparse: self-comparison always evaluates to true
   kernel/events/core.c: note: in included file (through include/linux/rculist.h, include/linux/dcache.h, include/linux/fs.h):
   include/linux/rcupdate.h:817:9: sparse: sparse: context imbalance in 'perf_get_pgtable_size' - unexpected unlock
   kernel/events/core.c: note: in included file:
   kernel/events/internal.h:183:1: sparse: sparse: self-comparison always evaluates to true
   kernel/events/internal.h:183:1: sparse: sparse: self-comparison always evaluates to true
   kernel/events/internal.h:183:1: sparse: sparse: self-comparison always evaluates to true
   kernel/events/internal.h:183:1: sparse: sparse: self-comparison always evaluates to true
   kernel/events/internal.h:183:1: sparse: sparse: self-comparison always evaluates to true
   kernel/events/internal.h:183:1: sparse: sparse: self-comparison always evaluates to true
   kernel/events/internal.h:183:1: sparse: sparse: self-comparison always evaluates to true
   kernel/events/internal.h:183:1: sparse: sparse: self-comparison always evaluates to true
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
