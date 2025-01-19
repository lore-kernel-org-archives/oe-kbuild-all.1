Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE1911F95C
	for <oe-kbuild-all@lists.linux.dev>; Sun, 19 Jan 2025 02:29:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737253781; cv=none; b=Mu0VEeIWZbeBo0iOB15K70bDl23f45GyrNDyNh03PvBS3C7aMq+QAHKfLnkob0MXPUfHgWL6bAm7DwA80jcDxrPE7JBOgGzRV0HVTVYzfIWpSd/N6oOCwHWsn6cVd/VTlnF2uqAp4yfUtbr18E1BJtY05eQGTbH8fXZ0oEMTOgo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737253781; c=relaxed/simple;
	bh=PGqcOoIRJ4LyWQ64qIewVTT4wQtYkLjMUfUzuzz54j0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qZ04CVmKx4HxnKdp/U0PxsqnHGKsv2PT+2/3VlR9bwlKzBnUWE40e4zCYpXJqH7yows9bC+LAZc8VPthby/BryL4MXTxo4hT0E+6lwCG8/BjRGyaWUC4bzgD5j5Lt2D1JAJmBxvE0en1DD6bpEwfNmXaJ0PR4upKbWN0Z7uqj3w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kKcYwfyn; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kKcYwfyn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737253779; x=1768789779;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=PGqcOoIRJ4LyWQ64qIewVTT4wQtYkLjMUfUzuzz54j0=;
  b=kKcYwfynE1ZBWkytmPAeypGbW1Iut1u0WYPCJ+9sBOx4UAIaH8h8dOy6
   DSbCd+Qjbb9aMsjEX/sDFTIeCtEAREhR7aJ3EheszDSUb+2RKf0JgRbrh
   cc9Fnkrz5jIwPUPdYaoYVeKqrszoeWVcsolSL4JdvjlRlh4CR/hhGPwLs
   oTYN5A6FR5R3ILPblzKEViooVtUY6xOEC8fI7Ljti9dtMvwglZPy7YT7J
   5xsCjbrx5FRD5hnPNu5yq1yYYrxw54lShtxIDogkLyCkHroc8f16WF9YS
   tCcJ4MKWOMns+G15Y2T0LlWi5pyXOGMTguMyDFjpkkkOzb1qLzv4zlR8f
   Q==;
X-CSE-ConnectionGUID: CqS6bzsSRUOGIIiUbAsCHA==
X-CSE-MsgGUID: Bqils48VTMGbFZci5n4/TA==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="37762583"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; 
   d="scan'208";a="37762583"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jan 2025 18:29:38 -0800
X-CSE-ConnectionGUID: hKwg1bA9S7ex7trhw0IG9w==
X-CSE-MsgGUID: ldKfnMg6QOeBcX8qFHjjKg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,216,1732608000"; 
   d="scan'208";a="136988866"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 18 Jan 2025 18:29:37 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tZL4A-000V1f-28;
	Sun, 19 Jan 2025 02:29:34 +0000
Date: Sun, 19 Jan 2025 10:29:10 +0800
From: kernel test robot <lkp@intel.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [peterz-queue:perf/pmu-unregister 19/27]
 kernel/events/core.c:4973:24: sparse: sparse: incorrect type in initializer
 (different address spaces)
Message-ID: <202501191038.IUFKGID1-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git perf/pmu-unregister
head:   64e8e446009073e3093681fa07791114a0d5f6fe
commit: 7be27e49faaa4bcca4ca4193d6dad6f3d7b88e7e [19/27] perf: Detach perf_cpu_pmu_context and pmu lifetimes
config: arm64-randconfig-r122-20250119 (https://download.01.org/0day-ci/archive/20250119/202501191038.IUFKGID1-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
reproduce: (https://download.01.org/0day-ci/archive/20250119/202501191038.IUFKGID1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501191038.IUFKGID1-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   kernel/events/core.c:1431:15: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:1431:15: sparse:    struct perf_event_context [noderef] __rcu *
   kernel/events/core.c:1431:15: sparse:    struct perf_event_context *
   kernel/events/core.c:1444:28: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:1444:28: sparse:    struct perf_event_context [noderef] __rcu *
   kernel/events/core.c:1444:28: sparse:    struct perf_event_context *
   kernel/events/core.c:3596:20: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:3596:20: sparse:    struct perf_event_context [noderef] __rcu *
   kernel/events/core.c:3596:20: sparse:    struct perf_event_context *
   kernel/events/core.c:3600:18: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:3600:18: sparse:    struct perf_event_context [noderef] __rcu *
   kernel/events/core.c:3600:18: sparse:    struct perf_event_context *
   kernel/events/core.c:3601:23: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:3601:23: sparse:    struct perf_event_context [noderef] __rcu *
   kernel/events/core.c:3601:23: sparse:    struct perf_event_context *
   kernel/events/core.c:3655:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:3655:25: sparse:    struct perf_event_context [noderef] __rcu *
   kernel/events/core.c:3655:25: sparse:    struct perf_event_context *
   kernel/events/core.c:3656:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:3656:25: sparse:    struct perf_event_context [noderef] __rcu *
   kernel/events/core.c:3656:25: sparse:    struct perf_event_context *
   kernel/events/core.c:4033:15: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:4033:15: sparse:    struct perf_event_context [noderef] __rcu *
   kernel/events/core.c:4033:15: sparse:    struct perf_event_context *
   kernel/events/core.c:4445:15: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:4445:15: sparse:    struct perf_event_context [noderef] __rcu *
   kernel/events/core.c:4445:15: sparse:    struct perf_event_context *
   kernel/events/core.c:4939:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:4939:25: sparse:    struct perf_event_context [noderef] __rcu *
   kernel/events/core.c:4939:25: sparse:    struct perf_event_context *
>> kernel/events/core.c:4973:24: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct perf_cpu_pmu_context [noderef] __percpu ** @@
   kernel/events/core.c:4973:24: sparse:     expected void const [noderef] __percpu *__vpp_verify
   kernel/events/core.c:4973:24: sparse:     got struct perf_cpu_pmu_context [noderef] __percpu **
>> kernel/events/core.c:4973:21: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct perf_cpu_pmu_context *cpc @@     got struct perf_cpu_pmu_context [noderef] __percpu * @@
   kernel/events/core.c:4973:21: sparse:     expected struct perf_cpu_pmu_context *cpc
   kernel/events/core.c:4973:21: sparse:     got struct perf_cpu_pmu_context [noderef] __percpu *
   kernel/events/core.c:6349:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:6349:9: sparse:    struct perf_buffer [noderef] __rcu *
   kernel/events/core.c:6349:9: sparse:    struct perf_buffer *
   kernel/events/core.c:5868:24: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __poll_t [usertype] events @@     got int @@
   kernel/events/core.c:5868:24: sparse:     expected restricted __poll_t [usertype] events
   kernel/events/core.c:5868:24: sparse:     got int
   kernel/events/core.c:6100:22: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:6100:22: sparse:    struct perf_buffer [noderef] __rcu *
   kernel/events/core.c:6100:22: sparse:    struct perf_buffer *
   kernel/events/core.c:6224:14: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:6224:14: sparse:    struct perf_buffer [noderef] __rcu *
   kernel/events/core.c:6224:14: sparse:    struct perf_buffer *
   kernel/events/core.c:6257:14: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:6257:14: sparse:    struct perf_buffer [noderef] __rcu *
   kernel/events/core.c:6257:14: sparse:    struct perf_buffer *
   kernel/events/core.c:6370:14: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:6370:14: sparse:    struct perf_buffer [noderef] __rcu *
   kernel/events/core.c:6370:14: sparse:    struct perf_buffer *
   kernel/events/core.c:6386:14: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:6386:14: sparse:    struct perf_buffer [noderef] __rcu *
   kernel/events/core.c:6386:14: sparse:    struct perf_buffer *
   kernel/events/core.c:8294:15: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:8294:15: sparse:    struct perf_event_context [noderef] __rcu *
   kernel/events/core.c:8294:15: sparse:    struct perf_event_context *
   kernel/events/core.c:8381:13: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:8381:13: sparse:    struct perf_buffer [noderef] __rcu *
   kernel/events/core.c:8381:13: sparse:    struct perf_buffer *
   kernel/events/core.c:8485:61: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *real_parent @@
   kernel/events/core.c:8485:61: sparse:     expected struct task_struct *p
   kernel/events/core.c:8485:61: sparse:     got struct task_struct [noderef] __rcu *real_parent
   kernel/events/core.c:8487:61: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *real_parent @@
   kernel/events/core.c:8487:61: sparse:     expected struct task_struct *p
   kernel/events/core.c:8487:61: sparse:     got struct task_struct [noderef] __rcu *real_parent
   kernel/events/core.c:9175:15: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:9175:15: sparse:    struct perf_event_context [noderef] __rcu *
   kernel/events/core.c:9175:15: sparse:    struct perf_event_context *
   kernel/events/core.c:10309:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:10309:9: sparse:    struct swevent_hlist [noderef] __rcu *
   kernel/events/core.c:10309:9: sparse:    struct swevent_hlist *
   kernel/events/core.c:10348:17: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:10348:17: sparse:    struct swevent_hlist [noderef] __rcu *
   kernel/events/core.c:10348:17: sparse:    struct swevent_hlist *
   kernel/events/core.c:10623:23: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:10623:23: sparse:    struct perf_event_context [noderef] __rcu *
   kernel/events/core.c:10623:23: sparse:    struct perf_event_context *
   kernel/events/core.c:11663:1: sparse: sparse: symbol 'dev_attr_nr_addr_filters' was not declared. Should it be static?
   kernel/events/core.c:11714:24: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct perf_cpu_pmu_context [noderef] __percpu ** @@
   kernel/events/core.c:11714:24: sparse:     expected void const [noderef] __percpu *__vpp_verify
   kernel/events/core.c:11714:24: sparse:     got struct perf_cpu_pmu_context [noderef] __percpu **
   kernel/events/core.c:11714:21: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct perf_cpu_pmu_context *cpc @@     got struct perf_cpu_pmu_context [noderef] __percpu * @@
   kernel/events/core.c:11714:21: sparse:     expected struct perf_cpu_pmu_context *cpc
   kernel/events/core.c:11714:21: sparse:     got struct perf_cpu_pmu_context [noderef] __percpu *
   kernel/events/core.c:11894:32: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct perf_cpu_pmu_context [noderef] __percpu ** @@
   kernel/events/core.c:11894:32: sparse:     expected void const [noderef] __percpu *__vpp_verify
   kernel/events/core.c:11894:32: sparse:     got struct perf_cpu_pmu_context [noderef] __percpu **
   kernel/events/core.c:11894:29: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct perf_cpu_pmu_context *cpc @@     got struct perf_cpu_pmu_context [noderef] __percpu * @@
   kernel/events/core.c:11894:29: sparse:     expected struct perf_cpu_pmu_context *cpc
   kernel/events/core.c:11894:29: sparse:     got struct perf_cpu_pmu_context [noderef] __percpu *
>> kernel/events/core.c:11904:32: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void [noderef] __percpu *__pdata @@     got struct perf_cpu_pmu_context [noderef] __percpu **cpu_pmu_context @@
   kernel/events/core.c:11904:32: sparse:     expected void [noderef] __percpu *__pdata
   kernel/events/core.c:11904:32: sparse:     got struct perf_cpu_pmu_context [noderef] __percpu **cpu_pmu_context
>> kernel/events/core.c:11944:30: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct perf_cpu_pmu_context [noderef] __percpu **cpu_pmu_context @@     got struct perf_cpu_pmu_context *[noderef] __percpu * @@
   kernel/events/core.c:11944:30: sparse:     expected struct perf_cpu_pmu_context [noderef] __percpu **cpu_pmu_context
   kernel/events/core.c:11944:30: sparse:     got struct perf_cpu_pmu_context *[noderef] __percpu *
   kernel/events/core.c:11957:18: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct perf_cpu_pmu_context [noderef] __percpu ** @@
   kernel/events/core.c:11957:18: sparse:     expected void const [noderef] __percpu *__vpp_verify
   kernel/events/core.c:11957:18: sparse:     got struct perf_cpu_pmu_context [noderef] __percpu **
>> kernel/events/core.c:11957:57: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct perf_cpu_pmu_context [noderef] __percpu * @@     got struct perf_cpu_pmu_context *cpc @@
   kernel/events/core.c:11957:57: sparse:     expected struct perf_cpu_pmu_context [noderef] __percpu *
   kernel/events/core.c:11957:57: sparse:     got struct perf_cpu_pmu_context *cpc
   kernel/events/core.c:13506:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:13506:9: sparse:    struct perf_event_context [noderef] __rcu *
   kernel/events/core.c:13506:9: sparse:    struct perf_event_context *
   kernel/events/core.c:13600:15: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:13600:15: sparse:    struct perf_event_context [noderef] __rcu *
   kernel/events/core.c:13600:15: sparse:    struct perf_event_context *
   kernel/events/core.c:13612:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:13612:9: sparse:    struct perf_event_context [noderef] __rcu *
   kernel/events/core.c:13612:9: sparse:    struct perf_event_context *
   kernel/events/core.c:14051:17: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:14051:17: sparse:    struct swevent_hlist [noderef] __rcu *
   kernel/events/core.c:14051:17: sparse:    struct swevent_hlist *
   kernel/events/core.c:182:9: sparse: sparse: context imbalance in 'perf_ctx_lock' - wrong count at exit
   kernel/events/core.c:198:9: sparse: sparse: context imbalance in 'perf_ctx_unlock' - unexpected unlock
   kernel/events/core.c:1177:17: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct perf_cpu_pmu_context [noderef] __percpu ** @@
   kernel/events/core.c:1177:17: sparse:     expected void const [noderef] __percpu *__vpp_verify
   kernel/events/core.c:1177:17: sparse:     got struct perf_cpu_pmu_context [noderef] __percpu **
>> kernel/events/core.c:1177:16: sparse: sparse: incorrect type in return expression (different address spaces) @@     expected struct perf_cpu_pmu_context * @@     got struct perf_cpu_pmu_context [noderef] __percpu * @@
   kernel/events/core.c:1177:16: sparse:     expected struct perf_cpu_pmu_context *
   kernel/events/core.c:1177:16: sparse:     got struct perf_cpu_pmu_context [noderef] __percpu *
   kernel/events/core.c:1177:17: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct perf_cpu_pmu_context [noderef] __percpu ** @@
   kernel/events/core.c:1177:17: sparse:     expected void const [noderef] __percpu *__vpp_verify
   kernel/events/core.c:1177:17: sparse:     got struct perf_cpu_pmu_context [noderef] __percpu **
>> kernel/events/core.c:1177:16: sparse: sparse: incorrect type in return expression (different address spaces) @@     expected struct perf_cpu_pmu_context * @@     got struct perf_cpu_pmu_context [noderef] __percpu * @@
   kernel/events/core.c:1177:16: sparse:     expected struct perf_cpu_pmu_context *
   kernel/events/core.c:1177:16: sparse:     got struct perf_cpu_pmu_context [noderef] __percpu *
   kernel/events/core.c:1177:17: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct perf_cpu_pmu_context [noderef] __percpu ** @@
   kernel/events/core.c:1177:17: sparse:     expected void const [noderef] __percpu *__vpp_verify
   kernel/events/core.c:1177:17: sparse:     got struct perf_cpu_pmu_context [noderef] __percpu **
>> kernel/events/core.c:1177:16: sparse: sparse: incorrect type in return expression (different address spaces) @@     expected struct perf_cpu_pmu_context * @@     got struct perf_cpu_pmu_context [noderef] __percpu * @@
   kernel/events/core.c:1177:16: sparse:     expected struct perf_cpu_pmu_context *
   kernel/events/core.c:1177:16: sparse:     got struct perf_cpu_pmu_context [noderef] __percpu *
   kernel/events/core.c: note: in included file (through include/linux/rculist.h, include/linux/dcache.h, include/linux/fs.h):
   include/linux/rcupdate.h:878:9: sparse: sparse: context imbalance in 'perf_lock_task_context' - different lock contexts for basic block
   kernel/events/core.c:1478:17: sparse: sparse: context imbalance in 'perf_pin_task_context' - unexpected unlock
   kernel/events/core.c:1177:17: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct perf_cpu_pmu_context [noderef] __percpu ** @@
   kernel/events/core.c:1177:17: sparse:     expected void const [noderef] __percpu *__vpp_verify
   kernel/events/core.c:1177:17: sparse:     got struct perf_cpu_pmu_context [noderef] __percpu **
>> kernel/events/core.c:1177:16: sparse: sparse: incorrect type in return expression (different address spaces) @@     expected struct perf_cpu_pmu_context * @@     got struct perf_cpu_pmu_context [noderef] __percpu * @@
   kernel/events/core.c:1177:16: sparse:     expected struct perf_cpu_pmu_context *
   kernel/events/core.c:1177:16: sparse:     got struct perf_cpu_pmu_context [noderef] __percpu *
   kernel/events/core.c:1177:17: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct perf_cpu_pmu_context [noderef] __percpu ** @@
   kernel/events/core.c:1177:17: sparse:     expected void const [noderef] __percpu *__vpp_verify
   kernel/events/core.c:1177:17: sparse:     got struct perf_cpu_pmu_context [noderef] __percpu **
>> kernel/events/core.c:1177:16: sparse: sparse: incorrect type in return expression (different address spaces) @@     expected struct perf_cpu_pmu_context * @@     got struct perf_cpu_pmu_context [noderef] __percpu * @@
   kernel/events/core.c:1177:16: sparse:     expected struct perf_cpu_pmu_context *
   kernel/events/core.c:1177:16: sparse:     got struct perf_cpu_pmu_context [noderef] __percpu *
   kernel/events/core.c:1177:17: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct perf_cpu_pmu_context [noderef] __percpu ** @@
   kernel/events/core.c:1177:17: sparse:     expected void const [noderef] __percpu *__vpp_verify
   kernel/events/core.c:1177:17: sparse:     got struct perf_cpu_pmu_context [noderef] __percpu **
>> kernel/events/core.c:1177:16: sparse: sparse: incorrect type in return expression (different address spaces) @@     expected struct perf_cpu_pmu_context * @@     got struct perf_cpu_pmu_context [noderef] __percpu * @@
   kernel/events/core.c:1177:16: sparse:     expected struct perf_cpu_pmu_context *
   kernel/events/core.c:1177:16: sparse:     got struct perf_cpu_pmu_context [noderef] __percpu *
   kernel/events/core.c:1177:17: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct perf_cpu_pmu_context [noderef] __percpu ** @@
   kernel/events/core.c:1177:17: sparse:     expected void const [noderef] __percpu *__vpp_verify
   kernel/events/core.c:1177:17: sparse:     got struct perf_cpu_pmu_context [noderef] __percpu **
>> kernel/events/core.c:1177:16: sparse: sparse: incorrect type in return expression (different address spaces) @@     expected struct perf_cpu_pmu_context * @@     got struct perf_cpu_pmu_context [noderef] __percpu * @@
   kernel/events/core.c:1177:16: sparse:     expected struct perf_cpu_pmu_context *
   kernel/events/core.c:1177:16: sparse:     got struct perf_cpu_pmu_context [noderef] __percpu *
   kernel/events/core.c:2900:9: sparse: sparse: context imbalance in '__perf_install_in_context' - wrong count at exit
   kernel/events/core.c:1177:17: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct perf_cpu_pmu_context [noderef] __percpu ** @@
   kernel/events/core.c:1177:17: sparse:     expected void const [noderef] __percpu *__vpp_verify
   kernel/events/core.c:1177:17: sparse:     got struct perf_cpu_pmu_context [noderef] __percpu **
>> kernel/events/core.c:1177:16: sparse: sparse: incorrect type in return expression (different address spaces) @@     expected struct perf_cpu_pmu_context * @@     got struct perf_cpu_pmu_context [noderef] __percpu * @@
   kernel/events/core.c:1177:16: sparse:     expected struct perf_cpu_pmu_context *
   kernel/events/core.c:1177:16: sparse:     got struct perf_cpu_pmu_context [noderef] __percpu *
   kernel/events/core.c:1177:17: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct perf_cpu_pmu_context [noderef] __percpu ** @@
   kernel/events/core.c:1177:17: sparse:     expected void const [noderef] __percpu *__vpp_verify
   kernel/events/core.c:1177:17: sparse:     got struct perf_cpu_pmu_context [noderef] __percpu **
>> kernel/events/core.c:1177:16: sparse: sparse: incorrect type in return expression (different address spaces) @@     expected struct perf_cpu_pmu_context * @@     got struct perf_cpu_pmu_context [noderef] __percpu * @@
   kernel/events/core.c:1177:16: sparse:     expected struct perf_cpu_pmu_context *
   kernel/events/core.c:1177:16: sparse:     got struct perf_cpu_pmu_context [noderef] __percpu *
   kernel/events/core.c:1177:17: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct perf_cpu_pmu_context [noderef] __percpu ** @@
   kernel/events/core.c:1177:17: sparse:     expected void const [noderef] __percpu *__vpp_verify
   kernel/events/core.c:1177:17: sparse:     got struct perf_cpu_pmu_context [noderef] __percpu **
>> kernel/events/core.c:1177:16: sparse: sparse: incorrect type in return expression (different address spaces) @@     expected struct perf_cpu_pmu_context * @@     got struct perf_cpu_pmu_context [noderef] __percpu * @@
   kernel/events/core.c:1177:16: sparse:     expected struct perf_cpu_pmu_context *
   kernel/events/core.c:1177:16: sparse:     got struct perf_cpu_pmu_context [noderef] __percpu *
   kernel/events/core.c:1177:17: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct perf_cpu_pmu_context [noderef] __percpu ** @@
   kernel/events/core.c:1177:17: sparse:     expected void const [noderef] __percpu *__vpp_verify
   kernel/events/core.c:1177:17: sparse:     got struct perf_cpu_pmu_context [noderef] __percpu **
>> kernel/events/core.c:1177:16: sparse: sparse: incorrect type in return expression (different address spaces) @@     expected struct perf_cpu_pmu_context * @@     got struct perf_cpu_pmu_context [noderef] __percpu * @@
   kernel/events/core.c:1177:16: sparse:     expected struct perf_cpu_pmu_context *
   kernel/events/core.c:1177:16: sparse:     got struct perf_cpu_pmu_context [noderef] __percpu *
   kernel/events/core.c:1177:17: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct perf_cpu_pmu_context [noderef] __percpu ** @@
   kernel/events/core.c:1177:17: sparse:     expected void const [noderef] __percpu *__vpp_verify
   kernel/events/core.c:1177:17: sparse:     got struct perf_cpu_pmu_context [noderef] __percpu **
>> kernel/events/core.c:1177:16: sparse: sparse: incorrect type in return expression (different address spaces) @@     expected struct perf_cpu_pmu_context * @@     got struct perf_cpu_pmu_context [noderef] __percpu * @@
   kernel/events/core.c:1177:16: sparse:     expected struct perf_cpu_pmu_context *
   kernel/events/core.c:1177:16: sparse:     got struct perf_cpu_pmu_context [noderef] __percpu *
   kernel/events/core.c:1177:17: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct perf_cpu_pmu_context [noderef] __percpu ** @@
   kernel/events/core.c:1177:17: sparse:     expected void const [noderef] __percpu *__vpp_verify
   kernel/events/core.c:1177:17: sparse:     got struct perf_cpu_pmu_context [noderef] __percpu **
>> kernel/events/core.c:1177:16: sparse: sparse: incorrect type in return expression (different address spaces) @@     expected struct perf_cpu_pmu_context * @@     got struct perf_cpu_pmu_context [noderef] __percpu * @@
   kernel/events/core.c:1177:16: sparse:     expected struct perf_cpu_pmu_context *
   kernel/events/core.c:1177:16: sparse:     got struct perf_cpu_pmu_context [noderef] __percpu *
   kernel/events/core.c:4913:17: sparse: sparse: context imbalance in 'find_get_context' - unexpected unlock
   kernel/events/core.c: note: in included file:
   kernel/events/internal.h:204:46: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const [noderef] __user *from @@     got void const *src @@
   kernel/events/internal.h:204:46: sparse:     expected void const [noderef] __user *from
   kernel/events/internal.h:204:46: sparse:     got void const *src
   kernel/events/internal.h:185:1: sparse: sparse: self-comparison always evaluates to true
   kernel/events/internal.h:185:1: sparse: sparse: self-comparison always evaluates to true
   kernel/events/internal.h:185:1: sparse: sparse: self-comparison always evaluates to true
   kernel/events/internal.h:185:1: sparse: sparse: self-comparison always evaluates to true
   kernel/events/internal.h:185:1: sparse: sparse: self-comparison always evaluates to true
   kernel/events/internal.h:193:1: sparse: sparse: self-comparison always evaluates to true
   kernel/events/core.c: note: in included file (through include/linux/rculist.h, include/linux/dcache.h, include/linux/fs.h):
   include/linux/rcupdate.h:880:25: sparse: sparse: context imbalance in 'perf_get_pgtable_size' - unexpected unlock
   kernel/events/core.c: note: in included file:
   kernel/events/internal.h:185:1: sparse: sparse: self-comparison always evaluates to true
   kernel/events/internal.h:185:1: sparse: sparse: self-comparison always evaluates to true
   kernel/events/internal.h:185:1: sparse: sparse: self-comparison always evaluates to true
   kernel/events/internal.h:185:1: sparse: sparse: self-comparison always evaluates to true
   kernel/events/internal.h:185:1: sparse: sparse: self-comparison always evaluates to true
   kernel/events/internal.h:185:1: sparse: sparse: self-comparison always evaluates to true
   kernel/events/internal.h:185:1: sparse: sparse: self-comparison always evaluates to true
   kernel/events/internal.h:185:1: sparse: sparse: self-comparison always evaluates to true
   kernel/events/internal.h:185:1: sparse: sparse: self-comparison always evaluates to true
   kernel/events/core.c:10162:17: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:10162:17: sparse:    struct swevent_hlist [noderef] __rcu *
   kernel/events/core.c:10162:17: sparse:    struct swevent_hlist *
   kernel/events/core.c:10182:17: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:10182:17: sparse:    struct swevent_hlist [noderef] __rcu *
   kernel/events/core.c:10182:17: sparse:    struct swevent_hlist *
   kernel/events/core.c:10298:16: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:10298:16: sparse:    struct swevent_hlist [noderef] __rcu *
   kernel/events/core.c:10298:16: sparse:    struct swevent_hlist *
   kernel/events/core.c:10298:16: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:10298:16: sparse:    struct swevent_hlist [noderef] __rcu *
   kernel/events/core.c:10298:16: sparse:    struct swevent_hlist *
   kernel/events/core.c:10298:16: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:10298:16: sparse:    struct swevent_hlist [noderef] __rcu *
   kernel/events/core.c:10298:16: sparse:    struct swevent_hlist *

vim +4973 kernel/events/core.c

  4957	
  4958	static struct perf_event_pmu_context *
  4959	find_get_pmu_context(struct pmu *pmu, struct perf_event_context *ctx,
  4960			     struct perf_event *event)
  4961	{
  4962		struct perf_event_pmu_context *new = NULL, *epc;
  4963		void *task_ctx_data = NULL;
  4964	
  4965		if (!ctx->task) {
  4966			/*
  4967			 * perf_pmu_migrate_context() / __perf_pmu_install_event()
  4968			 * relies on the fact that find_get_pmu_context() cannot fail
  4969			 * for CPU contexts.
  4970			 */
  4971			struct perf_cpu_pmu_context *cpc;
  4972	
> 4973			cpc = *per_cpu_ptr(pmu->cpu_pmu_context, event->cpu);
  4974			epc = &cpc->epc;
  4975			raw_spin_lock_irq(&ctx->lock);
  4976			if (!epc->ctx) {
  4977				/*
  4978				 * One extra reference for the pmu; see perf_pmu_free().
  4979				 */
  4980				atomic_set(&epc->refcount, 2);
  4981				epc->embedded = 1;
  4982				list_add(&epc->pmu_ctx_entry, &ctx->pmu_ctx_list);
  4983				epc->ctx = ctx;
  4984			} else {
  4985				WARN_ON_ONCE(epc->ctx != ctx);
  4986				atomic_inc(&epc->refcount);
  4987			}
  4988			raw_spin_unlock_irq(&ctx->lock);
  4989			return epc;
  4990		}
  4991	
  4992		new = kzalloc(sizeof(*epc), GFP_KERNEL);
  4993		if (!new)
  4994			return ERR_PTR(-ENOMEM);
  4995	
  4996		if (event->attach_state & PERF_ATTACH_TASK_DATA) {
  4997			task_ctx_data = alloc_task_ctx_data(pmu);
  4998			if (!task_ctx_data) {
  4999				kfree(new);
  5000				return ERR_PTR(-ENOMEM);
  5001			}
  5002		}
  5003	
  5004		__perf_init_event_pmu_context(new, pmu);
  5005	
  5006		/*
  5007		 * XXX
  5008		 *
  5009		 * lockdep_assert_held(&ctx->mutex);
  5010		 *
  5011		 * can't because perf_event_init_task() doesn't actually hold the
  5012		 * child_ctx->mutex.
  5013		 */
  5014	
  5015		raw_spin_lock_irq(&ctx->lock);
  5016		list_for_each_entry(epc, &ctx->pmu_ctx_list, pmu_ctx_entry) {
  5017			if (epc->pmu == pmu) {
  5018				WARN_ON_ONCE(epc->ctx != ctx);
  5019				atomic_inc(&epc->refcount);
  5020				goto found_epc;
  5021			}
  5022		}
  5023	
  5024		epc = new;
  5025		new = NULL;
  5026	
  5027		list_add(&epc->pmu_ctx_entry, &ctx->pmu_ctx_list);
  5028		epc->ctx = ctx;
  5029	
  5030	found_epc:
  5031		if (task_ctx_data && !epc->task_ctx_data) {
  5032			epc->task_ctx_data = task_ctx_data;
  5033			task_ctx_data = NULL;
  5034			ctx->nr_task_data++;
  5035		}
  5036		raw_spin_unlock_irq(&ctx->lock);
  5037	
  5038		free_task_ctx_data(pmu, task_ctx_data);
  5039		kfree(new);
  5040	
  5041		return epc;
  5042	}
  5043	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
