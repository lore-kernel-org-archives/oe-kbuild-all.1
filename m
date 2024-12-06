Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B49C13B2A2
	for <oe-kbuild-all@lists.linux.dev>; Fri,  6 Dec 2024 14:22:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733494952; cv=none; b=p2ygW0TvjbtBRawIhhpImXskFfEYN86FurgNy61wxzG5bNfm4uPjP8GIpbfQLiL0lZq2/4uOkSet9T2mRm2/QBj+TkSiD+mtLoykhi6PfPVjpxC1xTBwzARgb6S6WgYaX4wasYVdyrTdJnu3m+N76m6S7rp5MuqRByiP46QLVuY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733494952; c=relaxed/simple;
	bh=BR2MnUEJlSPfoV/huyl+9Y0SJMpFJl88EroesxhFOP8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=u9XL5s4qLg1K74I89fQ3NzdJjKHyf8u9vlH4jLGm0lTRwgLfwWbzOpPiOBzYVhMi8rZuFdAKC6vJK+1+CwZQ/BZ332zolpZUlG1sNkgRfejwutl7zQaOQSJ8chnFeehF4reqQxUjSd3aIhzHGDY3xD00QqYiICzgi96SUs6QQwI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NtTkwULR; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NtTkwULR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733494949; x=1765030949;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=BR2MnUEJlSPfoV/huyl+9Y0SJMpFJl88EroesxhFOP8=;
  b=NtTkwULRTi8A+KMVX9M21+pdVEf69HpXDgfD8wD286sITGS17QecKgKn
   XWjS0EzW5J6YF5SnxVomDTn57vXZ0y247IDj197uAt0NVF+mCBII7iZq7
   O/ptDQzaTDP7IvhTGQl/Pg7PukmtcTgpc1w4VMpQn2XPg+cLdvkq5cV5c
   SnAiGCeohHO4qbxXkjdpCAk9qH0hK3lt/YjvZs9rKnI7kT8/uF/FJThlj
   RHFdeodx0Ydb2ITrkGUDRVeGUZ8UJ9zpyWVGYoxG2PEVCQPX7YsYnh2TY
   bS6utcGY9stLMAWokRDS+mdCXIAO8CsVTP8gTT0ZzI71A38XnNcxXHbAv
   g==;
X-CSE-ConnectionGUID: u/WNEBb4Rxemceq7ajCUAw==
X-CSE-MsgGUID: RVSMPL2gS8awBtYF+ammCQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11278"; a="45246377"
X-IronPort-AV: E=Sophos;i="6.12,213,1728975600"; 
   d="scan'208";a="45246377"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Dec 2024 06:22:16 -0800
X-CSE-ConnectionGUID: ypDkAekNShyVFqD0+0fs7w==
X-CSE-MsgGUID: 7KCPQ9IcRGCMr3en+fsxoQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,213,1728975600"; 
   d="scan'208";a="99234853"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 06 Dec 2024 06:22:15 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tJZDg-00018x-2O;
	Fri, 06 Dec 2024 14:22:12 +0000
Date: Fri, 6 Dec 2024 22:21:44 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6 1/1] include/trace/hooks/perf.h:18:1:
 sparse: sparse: incorrect type in assignment (different address spaces)
Message-ID: <202412062236.dV1koWou-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android15-6.6
head:   8b5c41f725bafc820f9a2a7a0cb9b7043a5d2eeb
commit: eec127b5484d09fef414b9914710cd1faa7be1bc [1/1] ANDROID: vendor_hooks:vendor hook for perf
config: i386-randconfig-062 (https://download.01.org/0day-ci/archive/20241206/202412062236.dV1koWou-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241206/202412062236.dV1koWou-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412062236.dV1koWou-lkp@intel.com/

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
