Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B02F1AB51E
	for <oe-kbuild-all@lists.linux.dev>; Wed, 23 Oct 2024 12:40:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729687258; cv=none; b=jOYemZnelbqRA926h+zm9v5RGqAe1TorGck6zDw0yE8T4BEjzeLClW3G2jrOov8b07X4Hxu6jXnWj//wWS4ablcdbD22wkp3077P47wkqVgsCQMSXkdZL2Jn6pjkP0wnbMHsNgsS4iBmbPDGfbUMfi6rM6ajiMnlV0mU6TyVQQk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729687258; c=relaxed/simple;
	bh=yKI7p3hRHWBunAUK8WDLWTEiWsVMbyHVq4mpFP9i9yA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=YdDzdcN8I9yn5HWQHxJqV7CKt98LWkw3OnkNv0wWEGtIT04LKaU79Cdfi23vue9vD/A3uezagrUctzlQ7vOl7o1B7GRi+pK1YR4KXTwYbL0Bm8vEjyQUQ3Wh/+r6Z0ozIsU5iEehfgDYIbxiGyHKSQy14oCCmhsiPzmTjtc5IKw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QLx8KQIs; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QLx8KQIs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729687256; x=1761223256;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=yKI7p3hRHWBunAUK8WDLWTEiWsVMbyHVq4mpFP9i9yA=;
  b=QLx8KQIsGCZo8fvuOnJ+5AOK9EbRdBL7va/dIPO90YA8imEh360qpwcO
   WTTSiq2t/XnLqS8ludUZSB6CSsmEXiCTPfWs03WMGgI3oRtJGghZyRm+2
   nU9cdoe1vTw0K37E/qrcRIMrdC5q7UKvTdTfkF1fj4g3IljwUtp8tb3Aj
   2kPbv2VmQamPfOSLh6PYHLVoqnZsds13YyIPrGCw4+aeuJmiIHHQ+mkuI
   EXtrvaLSEphieA+t1vPjuYYSn3Oj9YhN4loQ/q/yVwzIu/jZch1R07h+y
   ebqhjmh/OnllyAzs72fSdAhpLxVbqibuOwfKwZt10muwuN2xV0kG4H5fa
   g==;
X-CSE-ConnectionGUID: egmBBsu1TK2V3YyqZPfp8w==
X-CSE-MsgGUID: SZ9sJBB8TZut8u/vykm1eA==
X-IronPort-AV: E=McAfee;i="6700,10204,11234"; a="40645459"
X-IronPort-AV: E=Sophos;i="6.11,226,1725346800"; 
   d="scan'208";a="40645459"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2024 05:40:55 -0700
X-CSE-ConnectionGUID: XhjkarODTUafllfYRmSJGQ==
X-CSE-MsgGUID: 1dN7IdTMSvKu8idEVuO0Og==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,226,1725346800"; 
   d="scan'208";a="80599141"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 23 Oct 2024 05:40:53 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t3afT-000Uv8-1D;
	Wed, 23 Oct 2024 12:40:51 +0000
Date: Wed, 23 Oct 2024 20:40:13 +0800
From: kernel test robot <lkp@intel.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [peterz-queue:perf/pmu-unregister 25/28]
 kernel/events/core.c:1181:25: sparse: sparse: incorrect type in initializer
 (different address spaces)
Message-ID: <202410232035.E5cNzdNU-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git perf/pmu-unregister
head:   4cbf3df69c5697061018989b08423d4c04bbe101
commit: 9b98f162cf0788f36f3bba230c4baf56af057450 [25/28] perf: Detach perf_cpu_pmu_context and pmu lifetimes
config: i386-randconfig-061-20241023 (https://download.01.org/0day-ci/archive/20241023/202410232035.E5cNzdNU-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241023/202410232035.E5cNzdNU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410232035.E5cNzdNU-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> kernel/events/core.c:1181:25: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct perf_cpu_pmu_context [noderef] __percpu ** @@
   kernel/events/core.c:1181:25: sparse:     expected void const [noderef] __percpu *__vpp_verify
   kernel/events/core.c:1181:25: sparse:     got struct perf_cpu_pmu_context [noderef] __percpu **
>> kernel/events/core.c:1181:24: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected int *count @@     got int [noderef] __percpu * @@
   kernel/events/core.c:1181:24: sparse:     expected int *count
   kernel/events/core.c:1181:24: sparse:     got int [noderef] __percpu *
   kernel/events/core.c:1188:25: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct perf_cpu_pmu_context [noderef] __percpu ** @@
   kernel/events/core.c:1188:25: sparse:     expected void const [noderef] __percpu *__vpp_verify
   kernel/events/core.c:1188:25: sparse:     got struct perf_cpu_pmu_context [noderef] __percpu **
   kernel/events/core.c:1188:24: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected int *count @@     got int [noderef] __percpu * @@
   kernel/events/core.c:1188:24: sparse:     expected int *count
   kernel/events/core.c:1188:24: sparse:     got int [noderef] __percpu *
   kernel/events/core.c:1195:25: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct perf_cpu_pmu_context [noderef] __percpu ** @@
   kernel/events/core.c:1195:25: sparse:     expected void const [noderef] __percpu *__vpp_verify
   kernel/events/core.c:1195:25: sparse:     got struct perf_cpu_pmu_context [noderef] __percpu **
   kernel/events/core.c:1195:24: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected int *count @@     got int [noderef] __percpu * @@
   kernel/events/core.c:1195:24: sparse:     expected int *count
   kernel/events/core.c:1195:24: sparse:     got int [noderef] __percpu *
   kernel/events/core.c:1424:15: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:1424:15: sparse:    struct perf_event_context [noderef] __rcu *
   kernel/events/core.c:1424:15: sparse:    struct perf_event_context *
   kernel/events/core.c:1437:28: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:1437:28: sparse:    struct perf_event_context [noderef] __rcu *
   kernel/events/core.c:1437:28: sparse:    struct perf_event_context *
   kernel/events/core.c:2307:45: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct perf_cpu_pmu_context [noderef] __percpu ** @@
   kernel/events/core.c:2307:45: sparse:     expected void const [noderef] __percpu *__vpp_verify
   kernel/events/core.c:2307:45: sparse:     got struct perf_cpu_pmu_context [noderef] __percpu **
>> kernel/events/core.c:2307:44: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct perf_cpu_pmu_context *cpc @@     got struct perf_cpu_pmu_context [noderef] __percpu * @@
   kernel/events/core.c:2307:44: sparse:     expected struct perf_cpu_pmu_context *cpc
   kernel/events/core.c:2307:44: sparse:     got struct perf_cpu_pmu_context [noderef] __percpu *
   kernel/events/core.c:2450:32: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct perf_cpu_pmu_context [noderef] __percpu ** @@
   kernel/events/core.c:2450:32: sparse:     expected void const [noderef] __percpu *__vpp_verify
   kernel/events/core.c:2450:32: sparse:     got struct perf_cpu_pmu_context [noderef] __percpu **
>> kernel/events/core.c:2450:29: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct perf_cpu_pmu_context *cpc @@     got struct perf_cpu_pmu_context [noderef] __percpu * @@
   kernel/events/core.c:2450:29: sparse:     expected struct perf_cpu_pmu_context *cpc
   kernel/events/core.c:2450:29: sparse:     got struct perf_cpu_pmu_context [noderef] __percpu *
   kernel/events/core.c:2588:45: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct perf_cpu_pmu_context [noderef] __percpu ** @@
   kernel/events/core.c:2588:45: sparse:     expected void const [noderef] __percpu *__vpp_verify
   kernel/events/core.c:2588:45: sparse:     got struct perf_cpu_pmu_context [noderef] __percpu **
   kernel/events/core.c:2588:44: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct perf_cpu_pmu_context *cpc @@     got struct perf_cpu_pmu_context [noderef] __percpu * @@
   kernel/events/core.c:2588:44: sparse:     expected struct perf_cpu_pmu_context *cpc
   kernel/events/core.c:2588:44: sparse:     got struct perf_cpu_pmu_context [noderef] __percpu *
   kernel/events/core.c:2695:45: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct perf_cpu_pmu_context [noderef] __percpu ** @@
   kernel/events/core.c:2695:45: sparse:     expected void const [noderef] __percpu *__vpp_verify
   kernel/events/core.c:2695:45: sparse:     got struct perf_cpu_pmu_context [noderef] __percpu **
   kernel/events/core.c:2695:44: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct perf_cpu_pmu_context *cpc @@     got struct perf_cpu_pmu_context [noderef] __percpu * @@
   kernel/events/core.c:2695:44: sparse:     expected struct perf_cpu_pmu_context *cpc
   kernel/events/core.c:2695:44: sparse:     got struct perf_cpu_pmu_context [noderef] __percpu *
   kernel/events/core.c:3320:24: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct perf_cpu_pmu_context [noderef] __percpu ** @@
   kernel/events/core.c:3320:24: sparse:     expected void const [noderef] __percpu *__vpp_verify
   kernel/events/core.c:3320:24: sparse:     got struct perf_cpu_pmu_context [noderef] __percpu **
   kernel/events/core.c:3320:21: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct perf_cpu_pmu_context *cpc @@     got struct perf_cpu_pmu_context [noderef] __percpu * @@
   kernel/events/core.c:3320:21: sparse:     expected struct perf_cpu_pmu_context *cpc
   kernel/events/core.c:3320:21: sparse:     got struct perf_cpu_pmu_context [noderef] __percpu *
   kernel/events/core.c:3568:24: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct perf_cpu_pmu_context [noderef] __percpu ** @@
   kernel/events/core.c:3568:24: sparse:     expected void const [noderef] __percpu *__vpp_verify
   kernel/events/core.c:3568:24: sparse:     got struct perf_cpu_pmu_context [noderef] __percpu **
   kernel/events/core.c:3568:21: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct perf_cpu_pmu_context *cpc @@     got struct perf_cpu_pmu_context [noderef] __percpu * @@
   kernel/events/core.c:3568:21: sparse:     expected struct perf_cpu_pmu_context *cpc
   kernel/events/core.c:3568:21: sparse:     got struct perf_cpu_pmu_context [noderef] __percpu *
   kernel/events/core.c:3587:20: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:3587:20: sparse:    struct perf_event_context [noderef] __rcu *
   kernel/events/core.c:3587:20: sparse:    struct perf_event_context *
   kernel/events/core.c:3591:18: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:3591:18: sparse:    struct perf_event_context [noderef] __rcu *
   kernel/events/core.c:3591:18: sparse:    struct perf_event_context *
   kernel/events/core.c:3592:23: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:3592:23: sparse:    struct perf_event_context [noderef] __rcu *
   kernel/events/core.c:3592:23: sparse:    struct perf_event_context *
   kernel/events/core.c:3646:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:3646:25: sparse:    struct perf_event_context [noderef] __rcu *
   kernel/events/core.c:3646:25: sparse:    struct perf_event_context *
   kernel/events/core.c:3647:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:3647:25: sparse:    struct perf_event_context [noderef] __rcu *
   kernel/events/core.c:3647:25: sparse:    struct perf_event_context *
   kernel/events/core.c:3677:45: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct perf_cpu_pmu_context [noderef] __percpu ** @@
   kernel/events/core.c:3677:44: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct perf_cpu_pmu_context *cpc @@     got struct perf_cpu_pmu_context [noderef] __percpu * @@
   kernel/events/core.c:3689:45: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct perf_cpu_pmu_context [noderef] __percpu ** @@
   kernel/events/core.c:3689:44: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct perf_cpu_pmu_context *cpc @@     got struct perf_cpu_pmu_context [noderef] __percpu * @@
   kernel/events/core.c:3813:16: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct perf_cpu_pmu_context [noderef] __percpu ** @@
   kernel/events/core.c:3813:13: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct perf_cpu_pmu_context *cpc @@     got struct perf_cpu_pmu_context [noderef] __percpu * @@
   kernel/events/core.c:3945:32: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct perf_cpu_pmu_context [noderef] __percpu ** @@
   kernel/events/core.c:3945:29: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct perf_cpu_pmu_context *cpc @@     got struct perf_cpu_pmu_context [noderef] __percpu * @@
   kernel/events/core.c:4032:15: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:4032:15: sparse:    struct perf_event_context [noderef] __rcu *
   kernel/events/core.c:4032:15: sparse:    struct perf_event_context *
   kernel/events/core.c:4444:15: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:4444:15: sparse:    struct perf_event_context [noderef] __rcu *
   kernel/events/core.c:4444:15: sparse:    struct perf_event_context *
   kernel/events/core.c:4938:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:4938:25: sparse:    struct perf_event_context [noderef] __rcu *
   kernel/events/core.c:4938:25: sparse:    struct perf_event_context *
   kernel/events/core.c:4972:24: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct perf_cpu_pmu_context [noderef] __percpu ** @@
   kernel/events/core.c:4972:21: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct perf_cpu_pmu_context *cpc @@     got struct perf_cpu_pmu_context [noderef] __percpu * @@
   kernel/events/core.c:6419:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:6419:9: sparse:    struct perf_buffer [noderef] __rcu *
   kernel/events/core.c:6419:9: sparse:    struct perf_buffer *
   kernel/events/core.c:5891:24: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __poll_t [usertype] events @@     got int @@
   kernel/events/core.c:6135:22: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:6135:22: sparse:    struct perf_buffer [noderef] __rcu *
   kernel/events/core.c:6135:22: sparse:    struct perf_buffer *
   kernel/events/core.c:6259:14: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:6259:14: sparse:    struct perf_buffer [noderef] __rcu *
   kernel/events/core.c:6259:14: sparse:    struct perf_buffer *
   kernel/events/core.c:6292:14: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:6292:14: sparse:    struct perf_buffer [noderef] __rcu *
   kernel/events/core.c:6292:14: sparse:    struct perf_buffer *
   kernel/events/core.c:6349:14: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:6349:14: sparse:    struct perf_buffer [noderef] __rcu *
   kernel/events/core.c:6349:14: sparse:    struct perf_buffer *
   kernel/events/core.c:6440:14: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:6440:14: sparse:    struct perf_buffer [noderef] __rcu *
   kernel/events/core.c:6440:14: sparse:    struct perf_buffer *
   kernel/events/core.c:6456:14: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:6456:14: sparse:    struct perf_buffer [noderef] __rcu *
   kernel/events/core.c:6456:14: sparse:    struct perf_buffer *
   kernel/events/core.c:8231:15: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:8231:15: sparse:    struct perf_event_context [noderef] __rcu *
   kernel/events/core.c:8231:15: sparse:    struct perf_event_context *
   kernel/events/core.c:8318:13: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:8318:13: sparse:    struct perf_buffer [noderef] __rcu *
   kernel/events/core.c:8318:13: sparse:    struct perf_buffer *
   kernel/events/core.c:8422:61: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *real_parent @@
   kernel/events/core.c:8422:61: sparse:     expected struct task_struct *p
   kernel/events/core.c:8422:61: sparse:     got struct task_struct [noderef] __rcu *real_parent
   kernel/events/core.c:8424:61: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *real_parent @@
   kernel/events/core.c:8424:61: sparse:     expected struct task_struct *p
   kernel/events/core.c:8424:61: sparse:     got struct task_struct [noderef] __rcu *real_parent
   kernel/events/core.c:9112:15: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:9112:15: sparse:    struct perf_event_context [noderef] __rcu *
   kernel/events/core.c:9112:15: sparse:    struct perf_event_context *
   kernel/events/core.c:10241:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:10241:9: sparse:    struct swevent_hlist [noderef] __rcu *
   kernel/events/core.c:10241:9: sparse:    struct swevent_hlist *
   kernel/events/core.c:10280:17: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:10280:17: sparse:    struct swevent_hlist [noderef] __rcu *
   kernel/events/core.c:10280:17: sparse:    struct swevent_hlist *
   kernel/events/core.c:10554:23: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:10554:23: sparse:    struct perf_event_context [noderef] __rcu *
   kernel/events/core.c:10554:23: sparse:    struct perf_event_context *
   kernel/events/core.c:11571:1: sparse: sparse: symbol 'dev_attr_nr_addr_filters' was not declared. Should it be static?
   kernel/events/core.c:11622:24: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct perf_cpu_pmu_context [noderef] __percpu ** @@
   kernel/events/core.c:11622:24: sparse:     expected void const [noderef] __percpu *__vpp_verify
   kernel/events/core.c:11622:24: sparse:     got struct perf_cpu_pmu_context [noderef] __percpu **
   kernel/events/core.c:11622:21: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct perf_cpu_pmu_context *cpc @@     got struct perf_cpu_pmu_context [noderef] __percpu * @@
   kernel/events/core.c:11622:21: sparse:     expected struct perf_cpu_pmu_context *cpc
   kernel/events/core.c:11622:21: sparse:     got struct perf_cpu_pmu_context [noderef] __percpu *
   kernel/events/core.c:11801:32: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct perf_cpu_pmu_context [noderef] __percpu ** @@
   kernel/events/core.c:11801:32: sparse:     expected void const [noderef] __percpu *__vpp_verify
   kernel/events/core.c:11801:32: sparse:     got struct perf_cpu_pmu_context [noderef] __percpu **
   kernel/events/core.c:11801:29: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct perf_cpu_pmu_context *cpc @@     got struct perf_cpu_pmu_context [noderef] __percpu * @@
   kernel/events/core.c:11801:29: sparse:     expected struct perf_cpu_pmu_context *cpc
   kernel/events/core.c:11801:29: sparse:     got struct perf_cpu_pmu_context [noderef] __percpu *
>> kernel/events/core.c:11811:32: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void [noderef] __percpu *__pdata @@     got struct perf_cpu_pmu_context [noderef] __percpu **cpu_pmu_context @@
   kernel/events/core.c:11811:32: sparse:     expected void [noderef] __percpu *__pdata
   kernel/events/core.c:11811:32: sparse:     got struct perf_cpu_pmu_context [noderef] __percpu **cpu_pmu_context
>> kernel/events/core.c:11851:30: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct perf_cpu_pmu_context [noderef] __percpu **cpu_pmu_context @@     got struct perf_cpu_pmu_context *[noderef] __percpu * @@
   kernel/events/core.c:11851:30: sparse:     expected struct perf_cpu_pmu_context [noderef] __percpu **cpu_pmu_context
   kernel/events/core.c:11851:30: sparse:     got struct perf_cpu_pmu_context *[noderef] __percpu *
   kernel/events/core.c:11864:18: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct perf_cpu_pmu_context [noderef] __percpu ** @@
   kernel/events/core.c:11864:18: sparse:     expected void const [noderef] __percpu *__vpp_verify
   kernel/events/core.c:11864:18: sparse:     got struct perf_cpu_pmu_context [noderef] __percpu **
>> kernel/events/core.c:11864:57: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct perf_cpu_pmu_context [noderef] __percpu * @@     got struct perf_cpu_pmu_context *cpc @@
   kernel/events/core.c:11864:57: sparse:     expected struct perf_cpu_pmu_context [noderef] __percpu *
   kernel/events/core.c:11864:57: sparse:     got struct perf_cpu_pmu_context *cpc
   kernel/events/core.c:13405:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:13405:9: sparse:    struct perf_event_context [noderef] __rcu *
   kernel/events/core.c:13405:9: sparse:    struct perf_event_context *
   kernel/events/core.c:13499:15: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:13499:15: sparse:    struct perf_event_context [noderef] __rcu *
   kernel/events/core.c:13499:15: sparse:    struct perf_event_context *
   kernel/events/core.c:13511:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:13511:9: sparse:    struct perf_event_context [noderef] __rcu *
   kernel/events/core.c:13511:9: sparse:    struct perf_event_context *
   kernel/events/core.c:13950:17: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:13950:17: sparse:    struct swevent_hlist [noderef] __rcu *
   kernel/events/core.c:13950:17: sparse:    struct swevent_hlist *
   kernel/events/core.c:182:9: sparse: sparse: context imbalance in 'perf_ctx_lock' - wrong count at exit
   kernel/events/core.c:198:9: sparse: sparse: context imbalance in 'perf_ctx_unlock' - unexpected unlock
   kernel/events/core.c: note: in included file (through include/linux/rculist.h, include/linux/dcache.h, include/linux/fs.h):
   include/linux/rcupdate.h:878:9: sparse: sparse: context imbalance in 'perf_lock_task_context' - different lock contexts for basic block
   kernel/events/core.c:1471:17: sparse: sparse: context imbalance in 'perf_pin_task_context' - unexpected unlock
   kernel/events/core.c:2890:9: sparse: sparse: context imbalance in '__perf_install_in_context' - wrong count at exit
   kernel/events/core.c:4912:17: sparse: sparse: context imbalance in 'find_get_context' - unexpected unlock
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
   kernel/events/core.c:10094:17: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:10094:17: sparse:    struct swevent_hlist [noderef] __rcu *
   kernel/events/core.c:10094:17: sparse:    struct swevent_hlist *
   kernel/events/core.c:10114:17: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:10114:17: sparse:    struct swevent_hlist [noderef] __rcu *
   kernel/events/core.c:10114:17: sparse:    struct swevent_hlist *
   kernel/events/core.c:10230:16: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:10230:16: sparse:    struct swevent_hlist [noderef] __rcu *
   kernel/events/core.c:10230:16: sparse:    struct swevent_hlist *
   kernel/events/core.c:10230:16: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:10230:16: sparse:    struct swevent_hlist [noderef] __rcu *
   kernel/events/core.c:10230:16: sparse:    struct swevent_hlist *
   kernel/events/core.c:10230:16: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/events/core.c:10230:16: sparse:    struct swevent_hlist [noderef] __rcu *
   kernel/events/core.c:10230:16: sparse:    struct swevent_hlist *

vim +1181 kernel/events/core.c

  1178	
  1179	void perf_pmu_disable(struct pmu *pmu)
  1180	{
> 1181		int *count = &(*this_cpu_ptr(pmu->cpu_pmu_context))->pmu_disable_count;
  1182		if (!(*count)++)
  1183			pmu->pmu_disable(pmu);
  1184	}
  1185	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
