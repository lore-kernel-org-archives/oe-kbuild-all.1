Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44558189520
	for <oe-kbuild-all@lists.linux.dev>; Mon, 24 Mar 2025 22:48:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742856518; cv=none; b=MKym9DmQ90YygAKT7cDQymw9DaxmgfCzIHAQvaCXWGyXxDZyvaF+gCqnZrIMQmBGIh4hrkE8Re6Ti+7jc3VGbu6jUFhK9Ts+nuRF1hSTQhjqM7Cfs4CGl1Qe1q5Rie89FVsxAg5ortYV0n42nTcykUrtYhbvU9sbwZWoJV4jh9A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742856518; c=relaxed/simple;
	bh=kE/AE1GX2QN3DUo15ZMjk651fsSy4PnLYQGGoQnM4A0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=VH5yeKIQgXhbyurZvB7ai0P7FCfvQ4R18qkNgbWJT9RFNK2JAV4vpf4RF8jByh7KWduIIPuaTOj1MNrPDVEe8BhNIlymX1ZvbaXSYgJRL/emZKurfDzLBPcgQadu+zBiJ06WBmzzFVWKewsw9mbdV86s6yeBw+QD27GjB9gKmhA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=D3kNwB5V; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="D3kNwB5V"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742856516; x=1774392516;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=kE/AE1GX2QN3DUo15ZMjk651fsSy4PnLYQGGoQnM4A0=;
  b=D3kNwB5V2pnvRMdrT9Y0SkO2l/cpaLwpHuIiBpB9ElFlGODtG3GByvM5
   6TqFuDtIKcStcNkCzBt4z6UQoeifhxOg06qqD5OScdITK3lIHHcl7EwPL
   LM2ijdr3AFxdv6lOOCtzeD7hhdWYWYD5xKsV7CMYgdKIQofnAyYf3Bn2n
   18efhnx7P/3W3s9JLTSxSWe0VbJnDw+Q7ipymfDbNk7NZewQ/jWhpZK3a
   Crq4Zc08RY/zMvJ5luKzBm/sU3N5kdeQGOkDgffUvIfqf+6KYQbRN/pq6
   O/dCU1X+TgtjFED7O+1dngwoSvKPJqrs0XH61bkdeaQemW3g6gjayv52Q
   w==;
X-CSE-ConnectionGUID: IROjxTHTTUS9AxQ2gSD60Q==
X-CSE-MsgGUID: /HJpVIx0RjGqdKvibIhOFg==
X-IronPort-AV: E=McAfee;i="6700,10204,11383"; a="43957534"
X-IronPort-AV: E=Sophos;i="6.14,273,1736841600"; 
   d="scan'208";a="43957534"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Mar 2025 15:48:36 -0700
X-CSE-ConnectionGUID: 3vhyFTm+QtS6BOT96lM3CQ==
X-CSE-MsgGUID: 8DjzuiTdQqC2ZVmMgOffvg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,273,1736841600"; 
   d="scan'208";a="124964923"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by fmviesa009.fm.intel.com with ESMTP; 24 Mar 2025 15:48:34 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1twqa8-0003zD-25;
	Mon, 24 Mar 2025 22:48:17 +0000
Date: Tue, 25 Mar 2025 06:46:40 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6 1/1] include/trace/hooks/perf.h:18:1:
 sparse: sparse: incorrect type in assignment (different address spaces)
Message-ID: <202503250652.TeNyXsYl-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android15-6.6
head:   8a625f475caa4e029dfbbe7fa253e895f71c08a3
commit: eec127b5484d09fef414b9914710cd1faa7be1bc [1/1] ANDROID: vendor_hooks:vendor hook for perf
config: i386-randconfig-r113-20250325 (https://download.01.org/0day-ci/archive/20250325/202503250652.TeNyXsYl-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250325/202503250652.TeNyXsYl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503250652.TeNyXsYl-lkp@intel.com/

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
