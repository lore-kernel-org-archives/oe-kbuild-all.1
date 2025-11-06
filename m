Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39B691DF27D
	for <oe-kbuild-all@lists.linux.dev>; Thu,  6 Nov 2025 11:01:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762426891; cv=none; b=c500QTAe5Nd2fw9CGlcNeVo6dFHbHQiW6EZU5Y3lEZP3kogl/ijxRXnVy38sZe0boNlRIGQ//ui+xx9wApr55tqFaI+C+qgnVFu8YZqhV5mqNNJ8GIBwF3/cnGaQD+D5GYqeFuwDdg1D1kI0swDCvaYnn/Fs+JhjR2GDwU70/B8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762426891; c=relaxed/simple;
	bh=ubI5z4bjkmXvfUEdkLWLR1sqHwkJcdSSaUK6pIpVgIc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=J9oCB42xft1olCozJACFzy4D8gvcHr+sI49u8fH1KsHGUMeHR8gmvuaJbCuuFQInPsV+ipy5oFlbQ32sBzxGcjNw58+ZIPSBG2J/I0t5XT83ZoSDtrN7fqJLjWtKQRHJEe3zhZtn1wQ1ZEkKDSdce/dZt4pJpIgSpixpi6uy6Zc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fhixOsRm; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fhixOsRm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762426889; x=1793962889;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ubI5z4bjkmXvfUEdkLWLR1sqHwkJcdSSaUK6pIpVgIc=;
  b=fhixOsRm9YV1t+jrKTw6M58I4Ikr3r7/Fjvm+ah/viBjQEW1953OBOIZ
   jld6Gdlw47gT50nFLIcyIvRaaZqSPTEAE0wrwp7OukvsPpx9KZJ9QOXss
   aOYdmM4PH1G9oummJitIXgeTiDXsyScHPivKrkVcgTq6oPeYwc1v7rAc2
   OcT50L5UoO8YHpPhgH/X56LnjXRqR6kDFZHS/HKCZxCt90OPEW3hxnPL+
   3KMRjSkI072yvLzc+ftrofTadyRV8t7lTaQS1FUN9gWejF8ADmyq4zPlD
   paeErTlAMVOpe/Y/lDDG22louAA1o19oSmLLisKUyivwDZpMVJoXZ21da
   g==;
X-CSE-ConnectionGUID: oq+85hXwQBusLkF+YwNpZg==
X-CSE-MsgGUID: YYXy2VESSUShQ+rdaQcueg==
X-IronPort-AV: E=McAfee;i="6800,10657,11604"; a="68419530"
X-IronPort-AV: E=Sophos;i="6.19,284,1754982000"; 
   d="scan'208";a="68419530"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2025 03:01:29 -0800
X-CSE-ConnectionGUID: rK6mK+2oRcS8U+ofEKIFDA==
X-CSE-MsgGUID: dNivPqTGTx6Q8xufMzR61w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,284,1754982000"; 
   d="scan'208";a="188174926"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa009.fm.intel.com with ESMTP; 06 Nov 2025 03:01:27 -0800
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vGxk5-000ToH-1B;
	Thu, 06 Nov 2025 11:01:25 +0000
Date: Thu, 6 Nov 2025 19:01:04 +0800
From: kernel test robot <lkp@intel.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [peterz-queue:sched/core 1/3] kernel/sched/syscalls.c:1322:11:
 sparse: sparse: dereference of noderef expression
Message-ID: <202511061820.GcAmoi8g-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git sched/core
head:   6eae66848391974a55888837a51c73a83aaee12a
commit: b09f12cdbe720a72e8e7963115a2a616de8bf7cf [1/3] sched/proxy: Fix yield() vs proxy-exec
config: alpha-randconfig-r134-20251106 (https://download.01.org/0day-ci/archive/20251106/202511061820.GcAmoi8g-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251106/202511061820.GcAmoi8g-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511061820.GcAmoi8g-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   kernel/sched/rt.c:1999:13: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/rt.c:2345:54: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *tsk @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/rt.c:2345:54: sparse:     expected struct task_struct *tsk
   kernel/sched/rt.c:2345:54: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/rt.c:2347:40: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *donor @@
   kernel/sched/rt.c:2347:40: sparse:     expected struct task_struct *p
   kernel/sched/rt.c:2347:40: sparse:     got struct task_struct [noderef] __rcu *donor
   kernel/sched/rt.c:2347:62: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *donor @@
   kernel/sched/rt.c:2347:62: sparse:     expected struct task_struct *p
   kernel/sched/rt.c:2347:62: sparse:     got struct task_struct [noderef] __rcu *donor
   kernel/sched/build_policy.c: note: in included file:
   kernel/sched/deadline.c:2677:23: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *donor @@
   kernel/sched/deadline.c:2677:23: sparse:     expected struct task_struct *p
   kernel/sched/deadline.c:2677:23: sparse:     got struct task_struct [noderef] __rcu *donor
   kernel/sched/deadline.c:2687:13: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/deadline.c:2687:13: sparse:    struct task_struct *
   kernel/sched/deadline.c:2687:13: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/deadline.c:2793:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/deadline.c:2793:25: sparse:    struct task_struct *
   kernel/sched/deadline.c:2793:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/deadline.c:2295:42: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct sched_dl_entity const *b @@     got struct sched_dl_entity [noderef] __rcu * @@
   kernel/sched/deadline.c:2295:42: sparse:     expected struct sched_dl_entity const *b
   kernel/sched/deadline.c:2295:42: sparse:     got struct sched_dl_entity [noderef] __rcu *
   kernel/sched/deadline.c:2305:38: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *tsk @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/deadline.c:2305:38: sparse:     expected struct task_struct *tsk
   kernel/sched/deadline.c:2305:38: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/deadline.c:1194:39: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/deadline.c:1194:39: sparse:     expected struct task_struct *p
   kernel/sched/deadline.c:1194:39: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/deadline.c:1194:85: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct sched_dl_entity const *b @@     got struct sched_dl_entity [noderef] __rcu * @@
   kernel/sched/deadline.c:1194:85: sparse:     expected struct sched_dl_entity const *b
   kernel/sched/deadline.c:1194:85: sparse:     got struct sched_dl_entity [noderef] __rcu *
   kernel/sched/deadline.c:1292:23: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *donor @@
   kernel/sched/deadline.c:1292:23: sparse:     expected struct task_struct *p
   kernel/sched/deadline.c:1292:23: sparse:     got struct task_struct [noderef] __rcu *donor
   kernel/sched/deadline.c:1590:31: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/deadline.c:1590:31: sparse:     expected struct task_struct *p
   kernel/sched/deadline.c:1590:31: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/deadline.c:1590:70: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct sched_dl_entity const *b @@     got struct sched_dl_entity [noderef] __rcu * @@
   kernel/sched/deadline.c:1590:70: sparse:     expected struct sched_dl_entity const *b
   kernel/sched/deadline.c:1590:70: sparse:     got struct sched_dl_entity [noderef] __rcu *
   kernel/sched/deadline.c:1703:39: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *donor @@     got struct task_struct [noderef] __rcu *donor @@
   kernel/sched/deadline.c:1703:39: sparse:     expected struct task_struct *donor
   kernel/sched/deadline.c:1703:39: sparse:     got struct task_struct [noderef] __rcu *donor
   kernel/sched/deadline.c:2513:9: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] sd @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/deadline.c:2513:9: sparse:     expected struct sched_domain *[assigned] sd
   kernel/sched/deadline.c:2513:9: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/deadline.c:2181:14: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct task_struct *curr @@     got struct task_struct [noderef] __rcu * @@
   kernel/sched/deadline.c:2181:14: sparse:     expected struct task_struct *curr
   kernel/sched/deadline.c:2181:14: sparse:     got struct task_struct [noderef] __rcu *
   kernel/sched/deadline.c:2182:15: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct task_struct *donor @@     got struct task_struct [noderef] __rcu * @@
   kernel/sched/deadline.c:2182:15: sparse:     expected struct task_struct *donor
   kernel/sched/deadline.c:2182:15: sparse:     got struct task_struct [noderef] __rcu *
   kernel/sched/deadline.c:2257:43: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *donor @@
   kernel/sched/deadline.c:2257:43: sparse:     expected struct task_struct *p
   kernel/sched/deadline.c:2257:43: sparse:     got struct task_struct [noderef] __rcu *donor
   kernel/sched/deadline.c:2838:38: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *tsk @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/deadline.c:2838:38: sparse:     expected struct task_struct *tsk
   kernel/sched/deadline.c:2838:38: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/deadline.c:2840:23: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *donor @@
   kernel/sched/deadline.c:2840:23: sparse:     expected struct task_struct *p
   kernel/sched/deadline.c:2840:23: sparse:     got struct task_struct [noderef] __rcu *donor
   kernel/sched/deadline.c:2842:44: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct sched_dl_entity const *b @@     got struct sched_dl_entity [noderef] __rcu * @@
   kernel/sched/deadline.c:2842:44: sparse:     expected struct sched_dl_entity const *b
   kernel/sched/deadline.c:2842:44: sparse:     got struct sched_dl_entity [noderef] __rcu *
   kernel/sched/deadline.c:3036:23: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/deadline.c:3036:23: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/deadline.c:3036:23: sparse:    struct task_struct *
   kernel/sched/deadline.c:3083:32: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/build_policy.c: note: in included file:
   kernel/sched/syscalls.c:185:22: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/syscalls.c:185:22: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/syscalls.c:185:22: sparse:    struct task_struct *
   kernel/sched/build_policy.c: note: in included file:
   kernel/sched/sched.h:2281:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2281:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2281:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2281:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2281:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2281:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2292:26: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2292:26: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2292:26: sparse:    struct task_struct *
   kernel/sched/sched.h:2281:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2281:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2281:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2292:26: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2292:26: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2292:26: sparse:    struct task_struct *
   kernel/sched/sched.h:2281:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2281:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2281:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2281:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2281:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2281:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2292:26: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2292:26: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2292:26: sparse:    struct task_struct *
   kernel/sched/build_policy.c: note: in included file:
   kernel/sched/syscalls.c:1257:6: sparse: sparse: context imbalance in 'sched_getaffinity' - wrong count at exit
>> kernel/sched/syscalls.c:1322:11: sparse: sparse: dereference of noderef expression
   kernel/sched/build_policy.c: note: in included file:
   kernel/sched/rt.c:1659:15: sparse: sparse: dereference of noderef expression

vim +1322 kernel/sched/syscalls.c

  1313	
  1314	static void do_sched_yield(void)
  1315	{
  1316		struct rq_flags rf;
  1317		struct rq *rq;
  1318	
  1319		rq = this_rq_lock_irq(&rf);
  1320	
  1321		schedstat_inc(rq->yld_count);
> 1322		rq->donor->sched_class->yield_task(rq);
  1323	
  1324		preempt_disable();
  1325		rq_unlock_irq(rq, &rf);
  1326		sched_preempt_enable_no_resched();
  1327	
  1328		schedule();
  1329	}
  1330	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
