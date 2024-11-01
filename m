Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C42326AD3
	for <oe-kbuild-all@lists.linux.dev>; Fri,  1 Nov 2024 14:02:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730469766; cv=none; b=YT1x6KhWDj1Xg2yNNTNcU6psnXIQ1y1j5vaviiS07F211xLx0gVmvBzGJkmM1M9IhyrkOqBKvE60Jgv8jds/3DhwvmFs0X4EbdJYiUCdcBsEDVzwLPZeCOxmBWkzBNKI+KpnJxh+hNLr6UgFa2OZiv5ucTJeSBYK2PZCKsXbk+0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730469766; c=relaxed/simple;
	bh=4rAZPw7S8vBzdizfOHf9R2l6obdpD1ZyDVnBm+IzooU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=W74SOZlliAphG8s09NBNCkVng8NKcPTLJ74AxrFnq03Vq+8mBl4SWQDMi+/YYFeHMQ3u/e2q+6Dmgeor0qKbxOM6d5Pi0/ZDLWu9m/FchvZewvcmcR5ds7X9DqpYxLcRvaULxKeXIidDU6dZmVYqnX2+HWHxVsmtIgZfZN8BruY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=P7gyJTZL; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="P7gyJTZL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730469762; x=1762005762;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=4rAZPw7S8vBzdizfOHf9R2l6obdpD1ZyDVnBm+IzooU=;
  b=P7gyJTZLoMq7JxFJrHQOvcafw537Cdtvu7zeJfin0NJiVV+LA2nixmr+
   hfp/sELgyKQFt7CqA38iOMfcN4FyL++hyjlFsTCEDY+92MbrzzoOOptNz
   q/9nNba4zo+Ftmd/eaSMdxV5Z0EKRsmqWJGdev68XQyDQGrUVq5BL08EP
   ofD3Mgu+GZJrJV8wHe3IaT5pprjNwHUKX5/K1SxdE/spnA+qPhDyaRkgS
   S2YU5xfiWj0tV+3nMPAxIC8nVfKeGlUMjEvbSDE6L3JsyTtg0BEYmfAjH
   kYNFb7pekya/nZdtmxRax8ci19IwdJbPrPGtIbTfXJYZG3h2TnRt24/EN
   Q==;
X-CSE-ConnectionGUID: Z/BaGCnNRBelsDRTjGbkLA==
X-CSE-MsgGUID: VnU6aVP6Qziu8QTv1bJgOw==
X-IronPort-AV: E=McAfee;i="6700,10204,11243"; a="29654117"
X-IronPort-AV: E=Sophos;i="6.11,250,1725346800"; 
   d="scan'208";a="29654117"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Nov 2024 07:02:41 -0700
X-CSE-ConnectionGUID: gBuo5Z5vTzSbf17E5QWoCw==
X-CSE-MsgGUID: xqpC8W5XQeawld/+LM6kfg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="87767852"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 01 Nov 2024 07:02:40 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t6sEX-000hcD-2b;
	Fri, 01 Nov 2024 14:02:37 +0000
Date: Fri, 1 Nov 2024 22:02:01 +0800
From: kernel test robot <lkp@intel.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [peterz-queue:perf/pmu-unregister 32/40]
 kernel/events/core.c:1181:16: sparse: sparse: incorrect type in return
 expression (different address spaces)
Message-ID: <202411012117.nqoLXCdB-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git perf/pmu-unregister
head:   c20686535a437720d2e0335f3fb92c43c90314cd
commit: ba36128d2c2338297d30e987fc87ceb33428edca [32/40] perf: Detach perf_cpu_pmu_context and pmu lifetimes
config: x86_64-randconfig-123-20241101 (https://download.01.org/0day-ci/archive/20241101/202411012117.nqoLXCdB-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241101/202411012117.nqoLXCdB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411012117.nqoLXCdB-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   kernel/events/core.c:3650:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:3650:25: sparse:    struct perf_event_context [noderef] __rcu *
   kernel/events/core.c:3650:25: sparse:    struct perf_event_context *
   kernel/events/core.c:4034:15: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:4034:15: sparse:    struct perf_event_context [noderef] __rcu *
   kernel/events/core.c:4034:15: sparse:    struct perf_event_context *
   kernel/events/core.c:4446:15: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:4446:15: sparse:    struct perf_event_context [noderef] __rcu *
   kernel/events/core.c:4446:15: sparse:    struct perf_event_context *
   kernel/events/core.c:4940:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:4940:25: sparse:    struct perf_event_context [noderef] __rcu *
   kernel/events/core.c:4940:25: sparse:    struct perf_event_context *
   kernel/events/core.c:4974:24: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct perf_cpu_pmu_context [noderef] __percpu ** @@
   kernel/events/core.c:4974:21: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct perf_cpu_pmu_context *cpc @@     got struct perf_cpu_pmu_context [noderef] __percpu * @@
   kernel/events/core.c:6421:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:6421:9: sparse:    struct perf_buffer [noderef] __rcu *
   kernel/events/core.c:6421:9: sparse:    struct perf_buffer *
   kernel/events/core.c:5893:24: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __poll_t [usertype] events @@     got int @@
   kernel/events/core.c:6137:22: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:6137:22: sparse:    struct perf_buffer [noderef] __rcu *
   kernel/events/core.c:6137:22: sparse:    struct perf_buffer *
   kernel/events/core.c:6261:14: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:6261:14: sparse:    struct perf_buffer [noderef] __rcu *
   kernel/events/core.c:6261:14: sparse:    struct perf_buffer *
   kernel/events/core.c:6294:14: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:6294:14: sparse:    struct perf_buffer [noderef] __rcu *
   kernel/events/core.c:6294:14: sparse:    struct perf_buffer *
   kernel/events/core.c:6351:14: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:6351:14: sparse:    struct perf_buffer [noderef] __rcu *
   kernel/events/core.c:6351:14: sparse:    struct perf_buffer *
   kernel/events/core.c:6442:14: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:6442:14: sparse:    struct perf_buffer [noderef] __rcu *
   kernel/events/core.c:6442:14: sparse:    struct perf_buffer *
   kernel/events/core.c:6458:14: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:6458:14: sparse:    struct perf_buffer [noderef] __rcu *
   kernel/events/core.c:6458:14: sparse:    struct perf_buffer *
   kernel/events/core.c:8221:15: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:8221:15: sparse:    struct perf_event_context [noderef] __rcu *
   kernel/events/core.c:8221:15: sparse:    struct perf_event_context *
   kernel/events/core.c:8308:13: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:8308:13: sparse:    struct perf_buffer [noderef] __rcu *
   kernel/events/core.c:8308:13: sparse:    struct perf_buffer *
   kernel/events/core.c:8412:61: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *real_parent @@
   kernel/events/core.c:8412:61: sparse:     expected struct task_struct *p
   kernel/events/core.c:8412:61: sparse:     got struct task_struct [noderef] __rcu *real_parent
   kernel/events/core.c:8414:61: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *real_parent @@
   kernel/events/core.c:8414:61: sparse:     expected struct task_struct *p
   kernel/events/core.c:8414:61: sparse:     got struct task_struct [noderef] __rcu *real_parent
   kernel/events/core.c:9102:15: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:9102:15: sparse:    struct perf_event_context [noderef] __rcu *
   kernel/events/core.c:9102:15: sparse:    struct perf_event_context *
   kernel/events/core.c:10231:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:10231:9: sparse:    struct swevent_hlist [noderef] __rcu *
   kernel/events/core.c:10231:9: sparse:    struct swevent_hlist *
   kernel/events/core.c:10270:17: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:10270:17: sparse:    struct swevent_hlist [noderef] __rcu *
   kernel/events/core.c:10270:17: sparse:    struct swevent_hlist *
   kernel/events/core.c:10544:23: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:10544:23: sparse:    struct perf_event_context [noderef] __rcu *
   kernel/events/core.c:10544:23: sparse:    struct perf_event_context *
   kernel/events/core.c:11561:1: sparse: sparse: symbol 'dev_attr_nr_addr_filters' was not declared. Should it be static?
   kernel/events/core.c:11612:24: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct perf_cpu_pmu_context [noderef] __percpu ** @@
   kernel/events/core.c:11612:24: sparse:     expected void const [noderef] __percpu *__vpp_verify
   kernel/events/core.c:11612:24: sparse:     got struct perf_cpu_pmu_context [noderef] __percpu **
   kernel/events/core.c:11612:21: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct perf_cpu_pmu_context *cpc @@     got struct perf_cpu_pmu_context [noderef] __percpu * @@
   kernel/events/core.c:11612:21: sparse:     expected struct perf_cpu_pmu_context *cpc
   kernel/events/core.c:11612:21: sparse:     got struct perf_cpu_pmu_context [noderef] __percpu *
   kernel/events/core.c:11791:32: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct perf_cpu_pmu_context [noderef] __percpu ** @@
   kernel/events/core.c:11791:32: sparse:     expected void const [noderef] __percpu *__vpp_verify
   kernel/events/core.c:11791:32: sparse:     got struct perf_cpu_pmu_context [noderef] __percpu **
   kernel/events/core.c:11791:29: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct perf_cpu_pmu_context *cpc @@     got struct perf_cpu_pmu_context [noderef] __percpu * @@
   kernel/events/core.c:11791:29: sparse:     expected struct perf_cpu_pmu_context *cpc
   kernel/events/core.c:11791:29: sparse:     got struct perf_cpu_pmu_context [noderef] __percpu *
   kernel/events/core.c:11801:32: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void [noderef] __percpu *__pdata @@     got struct perf_cpu_pmu_context [noderef] __percpu **cpu_pmu_context @@
   kernel/events/core.c:11801:32: sparse:     expected void [noderef] __percpu *__pdata
   kernel/events/core.c:11801:32: sparse:     got struct perf_cpu_pmu_context [noderef] __percpu **cpu_pmu_context
   kernel/events/core.c:11841:30: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct perf_cpu_pmu_context [noderef] __percpu **cpu_pmu_context @@     got struct perf_cpu_pmu_context *[noderef] __percpu * @@
   kernel/events/core.c:11841:30: sparse:     expected struct perf_cpu_pmu_context [noderef] __percpu **cpu_pmu_context
   kernel/events/core.c:11841:30: sparse:     got struct perf_cpu_pmu_context *[noderef] __percpu *
   kernel/events/core.c:11854:18: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct perf_cpu_pmu_context [noderef] __percpu ** @@
   kernel/events/core.c:11854:18: sparse:     expected void const [noderef] __percpu *__vpp_verify
   kernel/events/core.c:11854:18: sparse:     got struct perf_cpu_pmu_context [noderef] __percpu **
   kernel/events/core.c:11854:57: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct perf_cpu_pmu_context [noderef] __percpu * @@     got struct perf_cpu_pmu_context *cpc @@
   kernel/events/core.c:11854:57: sparse:     expected struct perf_cpu_pmu_context [noderef] __percpu *
   kernel/events/core.c:11854:57: sparse:     got struct perf_cpu_pmu_context *cpc
   kernel/events/core.c:13395:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:13395:9: sparse:    struct perf_event_context [noderef] __rcu *
   kernel/events/core.c:13395:9: sparse:    struct perf_event_context *
   kernel/events/core.c:13489:15: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:13489:15: sparse:    struct perf_event_context [noderef] __rcu *
   kernel/events/core.c:13489:15: sparse:    struct perf_event_context *
   kernel/events/core.c:13501:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:13501:9: sparse:    struct perf_event_context [noderef] __rcu *
   kernel/events/core.c:13501:9: sparse:    struct perf_event_context *
   kernel/events/core.c:13940:17: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:13940:17: sparse:    struct swevent_hlist [noderef] __rcu *
   kernel/events/core.c:13940:17: sparse:    struct swevent_hlist *
   kernel/events/core.c:182:9: sparse: sparse: context imbalance in 'perf_ctx_lock' - wrong count at exit
   kernel/events/core.c:198:9: sparse: sparse: context imbalance in 'perf_ctx_unlock' - unexpected unlock
   kernel/events/core.c:1181:17: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct perf_cpu_pmu_context [noderef] __percpu ** @@
>> kernel/events/core.c:1181:16: sparse: sparse: incorrect type in return expression (different address spaces) @@     expected struct perf_cpu_pmu_context * @@     got struct perf_cpu_pmu_context [noderef] __percpu * @@
   kernel/events/core.c:1181:17: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct perf_cpu_pmu_context [noderef] __percpu ** @@
>> kernel/events/core.c:1181:16: sparse: sparse: incorrect type in return expression (different address spaces) @@     expected struct perf_cpu_pmu_context * @@     got struct perf_cpu_pmu_context [noderef] __percpu * @@
   kernel/events/core.c:1181:17: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct perf_cpu_pmu_context [noderef] __percpu ** @@
>> kernel/events/core.c:1181:16: sparse: sparse: incorrect type in return expression (different address spaces) @@     expected struct perf_cpu_pmu_context * @@     got struct perf_cpu_pmu_context [noderef] __percpu * @@
   kernel/events/core.c: note: in included file (through include/linux/rculist.h, include/linux/dcache.h, include/linux/fs.h):
   include/linux/rcupdate.h:878:9: sparse: sparse: context imbalance in 'perf_lock_task_context' - different lock contexts for basic block
   kernel/events/core.c:1476:17: sparse: sparse: context imbalance in 'perf_pin_task_context' - unexpected unlock
   kernel/events/core.c:1181:17: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct perf_cpu_pmu_context [noderef] __percpu ** @@
>> kernel/events/core.c:1181:16: sparse: sparse: incorrect type in return expression (different address spaces) @@     expected struct perf_cpu_pmu_context * @@     got struct perf_cpu_pmu_context [noderef] __percpu * @@
   kernel/events/core.c:1181:17: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct perf_cpu_pmu_context [noderef] __percpu ** @@
>> kernel/events/core.c:1181:16: sparse: sparse: incorrect type in return expression (different address spaces) @@     expected struct perf_cpu_pmu_context * @@     got struct perf_cpu_pmu_context [noderef] __percpu * @@
   kernel/events/core.c:1181:17: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct perf_cpu_pmu_context [noderef] __percpu ** @@
>> kernel/events/core.c:1181:16: sparse: sparse: incorrect type in return expression (different address spaces) @@     expected struct perf_cpu_pmu_context * @@     got struct perf_cpu_pmu_context [noderef] __percpu * @@
   kernel/events/core.c:1181:17: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct perf_cpu_pmu_context [noderef] __percpu ** @@
>> kernel/events/core.c:1181:16: sparse: sparse: incorrect type in return expression (different address spaces) @@     expected struct perf_cpu_pmu_context * @@     got struct perf_cpu_pmu_context [noderef] __percpu * @@
   kernel/events/core.c:2894:9: sparse: sparse: context imbalance in '__perf_install_in_context' - wrong count at exit
   kernel/events/core.c:1181:17: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct perf_cpu_pmu_context [noderef] __percpu ** @@
>> kernel/events/core.c:1181:16: sparse: sparse: incorrect type in return expression (different address spaces) @@     expected struct perf_cpu_pmu_context * @@     got struct perf_cpu_pmu_context [noderef] __percpu * @@
   kernel/events/core.c:1181:17: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct perf_cpu_pmu_context [noderef] __percpu ** @@
>> kernel/events/core.c:1181:16: sparse: sparse: incorrect type in return expression (different address spaces) @@     expected struct perf_cpu_pmu_context * @@     got struct perf_cpu_pmu_context [noderef] __percpu * @@
   kernel/events/core.c:1181:17: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct perf_cpu_pmu_context [noderef] __percpu ** @@
>> kernel/events/core.c:1181:16: sparse: sparse: incorrect type in return expression (different address spaces) @@     expected struct perf_cpu_pmu_context * @@     got struct perf_cpu_pmu_context [noderef] __percpu * @@
   kernel/events/core.c:1181:17: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct perf_cpu_pmu_context [noderef] __percpu ** @@
>> kernel/events/core.c:1181:16: sparse: sparse: incorrect type in return expression (different address spaces) @@     expected struct perf_cpu_pmu_context * @@     got struct perf_cpu_pmu_context [noderef] __percpu * @@
   kernel/events/core.c:1181:17: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct perf_cpu_pmu_context [noderef] __percpu ** @@
>> kernel/events/core.c:1181:16: sparse: sparse: incorrect type in return expression (different address spaces) @@     expected struct perf_cpu_pmu_context * @@     got struct perf_cpu_pmu_context [noderef] __percpu * @@
   kernel/events/core.c:1181:17: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct perf_cpu_pmu_context [noderef] __percpu ** @@
>> kernel/events/core.c:1181:16: sparse: sparse: incorrect type in return expression (different address spaces) @@     expected struct perf_cpu_pmu_context * @@     got struct perf_cpu_pmu_context [noderef] __percpu * @@
   kernel/events/core.c:4583:34: sparse: sparse: self-comparison always evaluates to true
   kernel/events/core.c:4914:17: sparse: sparse: context imbalance in 'find_get_context' - unexpected unlock
   kernel/events/core.c: note: in included file:
   kernel/events/internal.h:210:1: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void const [noderef] __user *from @@     got void const *buf @@
   kernel/events/internal.h:184:1: sparse: sparse: self-comparison always evaluates to true
   kernel/events/internal.h:184:1: sparse: sparse: self-comparison always evaluates to true
   kernel/events/internal.h:184:1: sparse: sparse: self-comparison always evaluates to true
   kernel/events/internal.h:184:1: sparse: sparse: self-comparison always evaluates to true
   kernel/events/internal.h:184:1: sparse: sparse: self-comparison always evaluates to true
   kernel/events/internal.h:192:1: sparse: sparse: self-comparison always evaluates to true
   kernel/events/core.c: note: in included file (through include/linux/rculist.h, include/linux/dcache.h, include/linux/fs.h):
   include/linux/rcupdate.h:880:25: sparse: sparse: context imbalance in 'perf_get_pgtable_size' - unexpected unlock
   kernel/events/core.c: note: in included file:
   kernel/events/internal.h:184:1: sparse: sparse: self-comparison always evaluates to true
   kernel/events/internal.h:184:1: sparse: sparse: self-comparison always evaluates to true
   kernel/events/internal.h:184:1: sparse: sparse: self-comparison always evaluates to true
   kernel/events/internal.h:184:1: sparse: sparse: self-comparison always evaluates to true
   kernel/events/internal.h:184:1: sparse: sparse: self-comparison always evaluates to true
   kernel/events/internal.h:184:1: sparse: sparse: self-comparison always evaluates to true
   kernel/events/internal.h:184:1: sparse: sparse: self-comparison always evaluates to true
   kernel/events/internal.h:184:1: sparse: sparse: self-comparison always evaluates to true
   kernel/events/internal.h:184:1: sparse: sparse: self-comparison always evaluates to true
   kernel/events/core.c:10084:17: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:10084:17: sparse:    struct swevent_hlist [noderef] __rcu *
   kernel/events/core.c:10084:17: sparse:    struct swevent_hlist *
   kernel/events/core.c:10104:17: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:10104:17: sparse:    struct swevent_hlist [noderef] __rcu *
   kernel/events/core.c:10104:17: sparse:    struct swevent_hlist *
   kernel/events/core.c:10220:16: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:10220:16: sparse:    struct swevent_hlist [noderef] __rcu *
   kernel/events/core.c:10220:16: sparse:    struct swevent_hlist *
   kernel/events/core.c:10220:16: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:10220:16: sparse:    struct swevent_hlist [noderef] __rcu *
   kernel/events/core.c:10220:16: sparse:    struct swevent_hlist *
   kernel/events/core.c:10220:16: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:10220:16: sparse:    struct swevent_hlist [noderef] __rcu *
   kernel/events/core.c:10220:16: sparse:    struct swevent_hlist *

vim +1181 kernel/events/core.c

  1178	
  1179	static __always_inline struct perf_cpu_pmu_context *this_cpc(struct pmu *pmu)
  1180	{
> 1181		return *this_cpu_ptr(pmu->cpu_pmu_context);
  1182	}
  1183	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
