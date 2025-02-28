Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B5CC23CB
	for <oe-kbuild-all@lists.linux.dev>; Fri, 28 Feb 2025 00:22:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740702167; cv=none; b=R5c1q7jKB7FmJsYbzn5R47OaPsGE5YwQwWwwVGdv5LzV5Xgq4V1rcZMcgl2qRlQehUovS2jd3XhpEWGd+HZcQNgIUdJsqIC2v3zBprDSN/gHp4R6MF3UFJx8hUwK93aZ1mj5uPUSy3RPAHHv9wRD4ejO0L472atS4miw2ZMh6qs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740702167; c=relaxed/simple;
	bh=0oO3UyBXwaW1jcJrfpawKEqOeJCjjcvfXifo9e8dZY8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=k57fqn0NmK4muNcBLfiwr3ynvpEavR0OuRzSnvs6151FACjUYRv+W88xf2Ej8yeXNbak8DnlgOMZdNuOpwVL/+P7LJgUllQwARzPR4gtuzsUxOtdzIsuogkTgcPm7+q1hP9hIK5+JHrpmh3DDKL0y5W0IgTwyGEcRQnhBiHNZN4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=D8bvqfKa; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="D8bvqfKa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740702165; x=1772238165;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=0oO3UyBXwaW1jcJrfpawKEqOeJCjjcvfXifo9e8dZY8=;
  b=D8bvqfKaiAdwh3FW24fBofV46+5ayTD4OnXBKe5xfEuZVLArrdGvFl1u
   lq8O4V2CiDE+in+d91zvF1aR2FnfDp436u7PEE/dxPQPFkoT9KzzYjKE1
   nAolCKlGYeME7Zifny0HIhxUmku9goVvyI3DZyTaDCUuHmDSq2qFpvcXh
   E3Hxk3FO5nsmVIdgfUmh/H1MHzEO1CDS0zyj+Nwj8134Qz0Z4LEpmN+3x
   TASYrjoK7uX8xA2acYTNWE9OlFlXSVQO8PY5PwnQw4Tt8tVH0uWwC5Ysb
   OVxjMrTD4me2O/dwfoiI3/zprNYD47BUULP0LJLqLZ66GNOCkgSWcdvHK
   A==;
X-CSE-ConnectionGUID: Fe0bDcDsSg6OMqNGoOKf1A==
X-CSE-MsgGUID: OYVOlwu2SKSt5ThNYsqbog==
X-IronPort-AV: E=McAfee;i="6700,10204,11358"; a="66989153"
X-IronPort-AV: E=Sophos;i="6.13,320,1732608000"; 
   d="scan'208";a="66989153"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Feb 2025 16:22:44 -0800
X-CSE-ConnectionGUID: U0ZmBEnaQVaH/arCSLYJnw==
X-CSE-MsgGUID: h29Ib10RQkqIRhhn18dNdA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,320,1732608000"; 
   d="scan'208";a="117680388"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by fmviesa010.fm.intel.com with ESMTP; 27 Feb 2025 16:22:43 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tno9J-000EEE-0F;
	Fri, 28 Feb 2025 00:22:41 +0000
Date: Fri, 28 Feb 2025 08:21:42 +0800
From: kernel test robot <lkp@intel.com>
To: Kumar Kartikeya Dwivedi <memxor@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [kkdwivedi:microq 1/1] kernel/sched/microq.c:589:38: sparse: sparse:
 incorrect type in argument 1 (different address spaces)
Message-ID: <202502280838.q1lBaUTv-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/kkdwivedi/linux microq
head:   00a569cb6069576a53081ef9112cf361497c009b
commit: 00a569cb6069576a53081ef9112cf361497c009b [1/1] sched: Add micro quanta scheduling class
config: loongarch-randconfig-r113-20250227 (https://download.01.org/0day-ci/archive/20250228/202502280838.q1lBaUTv-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 14.2.0
reproduce: (https://download.01.org/0day-ci/archive/20250228/202502280838.q1lBaUTv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502280838.q1lBaUTv-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   kernel/sched/rt.c:1849:9: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] sd @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/rt.c:1849:9: sparse:     expected struct sched_domain *[assigned] sd
   kernel/sched/rt.c:1849:9: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/rt.c:1549:14: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct task_struct *curr @@     got struct task_struct [noderef] __rcu * @@
   kernel/sched/rt.c:1549:14: sparse:     expected struct task_struct *curr
   kernel/sched/rt.c:1549:14: sparse:     got struct task_struct [noderef] __rcu *
   kernel/sched/rt.c:1550:15: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct task_struct *donor @@     got struct task_struct [noderef] __rcu * @@
   kernel/sched/rt.c:1550:15: sparse:     expected struct task_struct *donor
   kernel/sched/rt.c:1550:15: sparse:     got struct task_struct [noderef] __rcu *
   kernel/sched/rt.c:1611:45: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *donor @@
   kernel/sched/rt.c:1611:45: sparse:     expected struct task_struct *p
   kernel/sched/rt.c:1611:45: sparse:     got struct task_struct [noderef] __rcu *donor
   kernel/sched/rt.c:1654:39: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *donor @@     got struct task_struct [noderef] __rcu *donor @@
   kernel/sched/rt.c:1654:39: sparse:     expected struct task_struct *donor
   kernel/sched/rt.c:1654:39: sparse:     got struct task_struct [noderef] __rcu *donor
   kernel/sched/rt.c:1674:64: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *tsk @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/rt.c:1674:64: sparse:     expected struct task_struct *tsk
   kernel/sched/rt.c:1674:64: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/rt.c:2018:40: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *task @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/rt.c:2018:40: sparse:     expected struct task_struct *task
   kernel/sched/rt.c:2018:40: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/rt.c:2041:13: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/rt.c:2041:13: sparse:    struct task_struct *
   kernel/sched/rt.c:2041:13: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/rt.c:2387:54: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *tsk @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/rt.c:2387:54: sparse:     expected struct task_struct *tsk
   kernel/sched/rt.c:2387:54: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/rt.c:2389:40: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *donor @@
   kernel/sched/rt.c:2389:40: sparse:     expected struct task_struct *p
   kernel/sched/rt.c:2389:40: sparse:     got struct task_struct [noderef] __rcu *donor
   kernel/sched/rt.c:2389:62: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *donor @@
   kernel/sched/rt.c:2389:62: sparse:     expected struct task_struct *p
   kernel/sched/rt.c:2389:62: sparse:     got struct task_struct [noderef] __rcu *donor
   kernel/sched/build_policy.c: note: in included file:
   kernel/sched/deadline.c:2719:23: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *donor @@
   kernel/sched/deadline.c:2719:23: sparse:     expected struct task_struct *p
   kernel/sched/deadline.c:2719:23: sparse:     got struct task_struct [noderef] __rcu *donor
   kernel/sched/deadline.c:2729:13: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/deadline.c:2729:13: sparse:    struct task_struct *
   kernel/sched/deadline.c:2729:13: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/deadline.c:2835:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/deadline.c:2835:25: sparse:    struct task_struct *
   kernel/sched/deadline.c:2835:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/deadline.c:2359:42: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct sched_dl_entity const *b @@     got struct sched_dl_entity [noderef] __rcu * @@
   kernel/sched/deadline.c:2359:42: sparse:     expected struct sched_dl_entity const *b
   kernel/sched/deadline.c:2359:42: sparse:     got struct sched_dl_entity [noderef] __rcu *
   kernel/sched/deadline.c:2370:38: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *tsk @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/deadline.c:2370:38: sparse:     expected struct task_struct *tsk
   kernel/sched/deadline.c:2370:38: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/deadline.c:1262:39: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/deadline.c:1262:39: sparse:     expected struct task_struct *p
   kernel/sched/deadline.c:1262:39: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/deadline.c:1262:85: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct sched_dl_entity const *b @@     got struct sched_dl_entity [noderef] __rcu * @@
   kernel/sched/deadline.c:1262:85: sparse:     expected struct sched_dl_entity const *b
   kernel/sched/deadline.c:1262:85: sparse:     got struct sched_dl_entity [noderef] __rcu *
   kernel/sched/deadline.c:1362:23: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *donor @@
   kernel/sched/deadline.c:1362:23: sparse:     expected struct task_struct *p
   kernel/sched/deadline.c:1362:23: sparse:     got struct task_struct [noderef] __rcu *donor
   kernel/sched/deadline.c:1672:31: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/deadline.c:1672:31: sparse:     expected struct task_struct *p
   kernel/sched/deadline.c:1672:31: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/deadline.c:1672:70: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct sched_dl_entity const *b @@     got struct sched_dl_entity [noderef] __rcu * @@
   kernel/sched/deadline.c:1672:70: sparse:     expected struct sched_dl_entity const *b
   kernel/sched/deadline.c:1672:70: sparse:     got struct sched_dl_entity [noderef] __rcu *
   kernel/sched/deadline.c:1761:39: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *donor @@     got struct task_struct [noderef] __rcu *donor @@
   kernel/sched/deadline.c:1761:39: sparse:     expected struct task_struct *donor
   kernel/sched/deadline.c:1761:39: sparse:     got struct task_struct [noderef] __rcu *donor
   kernel/sched/deadline.c:2580:9: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] sd @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/deadline.c:2580:9: sparse:     expected struct sched_domain *[assigned] sd
   kernel/sched/deadline.c:2580:9: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/deadline.c:2244:14: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct task_struct *curr @@     got struct task_struct [noderef] __rcu * @@
   kernel/sched/deadline.c:2244:14: sparse:     expected struct task_struct *curr
   kernel/sched/deadline.c:2244:14: sparse:     got struct task_struct [noderef] __rcu *
   kernel/sched/deadline.c:2245:15: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct task_struct *donor @@     got struct task_struct [noderef] __rcu * @@
   kernel/sched/deadline.c:2245:15: sparse:     expected struct task_struct *donor
   kernel/sched/deadline.c:2245:15: sparse:     got struct task_struct [noderef] __rcu *
   kernel/sched/deadline.c:2320:43: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *donor @@
   kernel/sched/deadline.c:2320:43: sparse:     expected struct task_struct *p
   kernel/sched/deadline.c:2320:43: sparse:     got struct task_struct [noderef] __rcu *donor
   kernel/sched/deadline.c:2880:38: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *tsk @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/deadline.c:2880:38: sparse:     expected struct task_struct *tsk
   kernel/sched/deadline.c:2880:38: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/deadline.c:2882:23: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *donor @@
   kernel/sched/deadline.c:2882:23: sparse:     expected struct task_struct *p
   kernel/sched/deadline.c:2882:23: sparse:     got struct task_struct [noderef] __rcu *donor
   kernel/sched/deadline.c:2884:44: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct sched_dl_entity const *b @@     got struct sched_dl_entity [noderef] __rcu * @@
   kernel/sched/deadline.c:2884:44: sparse:     expected struct sched_dl_entity const *b
   kernel/sched/deadline.c:2884:44: sparse:     got struct sched_dl_entity [noderef] __rcu *
   kernel/sched/deadline.c:3069:23: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/deadline.c:3069:23: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/deadline.c:3069:23: sparse:    struct task_struct *
   kernel/sched/deadline.c:3118:32: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/build_policy.c: note: in included file:
   kernel/sched/microq.c:23:5: sparse: sparse: symbol 'sysctl_sched_microq_period' was not declared. Should it be static?
   kernel/sched/microq.c:24:5: sparse: sparse: symbol 'sysctl_sched_microq_runtime' was not declared. Should it be static?
   kernel/sched/microq.c:26:5: sparse: sparse: symbol 'sched_microq_timeslice' was not declared. Should it be static?
   kernel/sched/microq.c:294:58: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/microq.c:133:27: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/microq.c:221:38: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *curr @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/microq.c:388:35: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *curr @@
>> kernel/sched/microq.c:589:38: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *tsk @@     got struct task_struct [noderef] __rcu *curr @@
>> kernel/sched/microq.c:625:14: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct task_struct *curr @@     got struct task_struct [noderef] __rcu * @@
>> kernel/sched/microq.c:645:34: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/microq.c:645:34: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/microq.c:645:34: sparse:    struct task_struct *
   kernel/sched/microq.c:729:43: sparse: sparse: incorrect type in argument 3 (different address spaces) @@     expected void * @@     got void [noderef] __user *buffer @@
   kernel/sched/microq.c:729:43: sparse:     expected void *
   kernel/sched/microq.c:729:43: sparse:     got void [noderef] __user *buffer
>> kernel/sched/microq.c:765:35: sparse: sparse: incorrect type in initializer (incompatible argument 3 (different address spaces)) @@     expected int ( [usertype] *proc_handler )( ... ) @@     got int ( * )( ... ) @@
   kernel/sched/microq.c:765:35: sparse:     expected int ( [usertype] *proc_handler )( ... )
   kernel/sched/microq.c:765:35: sparse:     got int ( * )( ... )
   kernel/sched/microq.c:772:35: sparse: sparse: incorrect type in initializer (incompatible argument 3 (different address spaces)) @@     expected int ( [usertype] *proc_handler )( ... ) @@     got int ( * )( ... ) @@
   kernel/sched/microq.c:772:35: sparse:     expected int ( [usertype] *proc_handler )( ... )
   kernel/sched/microq.c:772:35: sparse:     got int ( * )( ... )
   kernel/sched/build_policy.c: note: in included file:
   kernel/sched/syscalls.c:206:22: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/syscalls.c:206:22: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/syscalls.c:206:22: sparse:    struct task_struct *
   kernel/sched/build_policy.c: note: in included file (through include/linux/smp.h, include/linux/sched/clock.h):
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   kernel/sched/build_policy.c: note: in included file:
   kernel/sched/sched.h:2343:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2343:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2343:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2343:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2343:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2343:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2354:26: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2354:26: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2354:26: sparse:    struct task_struct *
   kernel/sched/sched.h:2343:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2343:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2343:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2354:26: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2354:26: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2354:26: sparse:    struct task_struct *
   kernel/sched/sched.h:2343:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2343:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2343:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2343:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2343:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2343:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2354:26: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2354:26: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2354:26: sparse:    struct task_struct *
   kernel/sched/sched.h:2543:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2543:9: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2543:9: sparse:    struct task_struct *
   kernel/sched/sched.h:2354:26: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2354:26: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2354:26: sparse:    struct task_struct *
   kernel/sched/sched.h:2543:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2543:9: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2543:9: sparse:    struct task_struct *
   kernel/sched/sched.h:2354:26: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2354:26: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2354:26: sparse:    struct task_struct *
   kernel/sched/sched.h:2543:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2543:9: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2543:9: sparse:    struct task_struct *
   kernel/sched/build_policy.c: note: in included file:
   kernel/sched/syscalls.c:1388:6: sparse: sparse: context imbalance in 'sched_getaffinity' - wrong count at exit
   kernel/sched/build_policy.c: note: in included file:
   kernel/sched/rt.c:1699:15: sparse: sparse: dereference of noderef expression
   kernel/sched/rt.c:1699:60: sparse: sparse: dereference of noderef expression

vim +589 kernel/sched/microq.c

   582	
   583	/*
   584	 * If we are not running and we are not going to reschedule soon, we should
   585	 * try to push tasks away now
   586	 */
   587	static void task_woken_microq(struct rq *rq, struct task_struct *p)
   588	{
 > 589		if (!test_tsk_need_resched(rq->curr) &&
   590		    p->nr_cpus_allowed > 1 &&
   591		    rq->microq.microq_nr_running)
   592			push_microq_tasks(rq);
   593	}
   594	
   595	/* Assumes rq->lock is held */
   596	static void rq_online_microq(struct rq *rq)
   597	{
   598		struct microq_rq *microq_rq = &rq->microq;
   599	
   600		microq_rq->microq_period = MICROQ_BANDWIDTH_UNDEFINED;
   601		microq_rq->microq_runtime = MICROQ_BANDWIDTH_UNDEFINED;
   602		microq_rq->microq_time = 0;
   603		microq_rq->microq_target_time = 0;
   604		microq_rq->microq_throttled = 0;
   605		microq_rq->quanta_start = 0;
   606		microq_rq->delta_exec_uncharged = 0;
   607		microq_rq->delta_exec_total = 0;
   608	}
   609	
   610	static int select_task_rq_microq(struct task_struct *p, int cpu, int flags)
   611	{
   612		struct task_struct *curr;
   613		struct rq *rq;
   614	
   615		if (p->nr_cpus_allowed == 1)
   616			goto out;
   617	
   618		/* For anything but wake ups, just return the task_cpu */
   619		if (!(flags & (WF_TTWU | WF_FORK)))
   620			goto out;
   621	
   622		rq = cpu_rq(cpu);
   623	
   624		rcu_read_lock();
 > 625		curr = READ_ONCE(rq->curr); /* unlocked access */
   626	
   627		/* Try to push the incoming microq task if the current rq is busy */
   628		if (unlikely(rq->microq.microq_nr_running) && (p->nr_cpus_allowed > 1)) {
   629			int target = microq_find_rq(p);
   630	
   631			if (target != -1)
   632				cpu = target;
   633		}
   634		rcu_read_unlock();
   635	
   636	out:
   637		return cpu;
   638	}
   639	
   640	#endif /* CONFIG_SMP */
   641	
   642	static void switched_to_microq(struct rq *rq, struct task_struct *p)
   643	{
   644	#ifdef CONFIG_SMP
 > 645		if (p->on_rq && rq->curr != p) {
   646			rq->microq.last_push_failed = 0;
   647			if (rq->microq.microq_nr_running > 1)
   648				queue_balance_callback(rq, &per_cpu(microq_push_head, rq->cpu),
   649				    push_one_microq_task);
   650		}
   651	#endif
   652	}
   653	
   654	static void prio_changed_microq(struct rq *rq, struct task_struct *p, int oldprio)
   655	{
   656	}
   657	
   658	static void __task_tick_microq(struct rq *rq, struct task_struct *p, int queued)
   659	{
   660		struct sched_microq_entity *microq_se = &p->microq;
   661	
   662		if (microq_timer_needed(&rq->microq))
   663			check_microq_timer(rq);
   664	
   665		update_curr_microq(rq);
   666	
   667		if (p->microq.time_slice--)
   668			return;
   669		p->microq.time_slice = sched_microq_timeslice;
   670		if (microq_se->run_list.prev != microq_se->run_list.next) {
   671			requeue_task_microq(rq, p);
   672			resched_curr(rq);
   673			return;
   674		}
   675	}
   676	
   677	static void task_tick_microq(struct rq *rq, struct task_struct *p, int queued)
   678	{
   679	
   680		if (hrtimer_active(&rq->microq.microq_period_timer))
   681			return;
   682	
   683		__task_tick_microq(rq, p, queued);
   684	}
   685	
   686	static void set_next_task_microq(struct rq *rq, struct task_struct *p, bool first)
   687	{
   688		p->se.exec_start = rq_clock_task(rq);
   689	}
   690	
   691	static unsigned int get_rr_interval_microq(struct rq *rq, struct task_struct *task)
   692	{
   693		return sched_microq_timeslice;
   694	}
   695	
   696	DEFINE_SCHED_CLASS(microq) = {
   697	
   698		.enqueue_task		= enqueue_task_microq,
   699		.dequeue_task		= dequeue_task_microq,
   700		.yield_task		= yield_task_microq,
   701		.wakeup_preempt		= wakeup_preempt_microq,
   702		.pick_next_task		= pick_next_task_microq,
   703		.put_prev_task		= put_prev_task_microq,
   704	#ifdef CONFIG_SMP
   705		.select_task_rq		= select_task_rq_microq,
   706		.set_cpus_allowed	= set_cpus_allowed_common,
   707		.rq_online              = rq_online_microq,
   708		.task_woken		= task_woken_microq,
   709	#endif
   710		.set_next_task          = set_next_task_microq,
   711		.task_tick		= task_tick_microq,
   712		.get_rr_interval	= get_rr_interval_microq,
   713		.prio_changed		= prio_changed_microq,
   714		.switched_to		= switched_to_microq,
   715		.update_curr		= update_curr_microq,
   716	};
   717	
   718	static int sched_microq_proc_handler(const struct ctl_table *table, int write,
   719					     void __user *buffer, size_t *lenp, loff_t *ppos)
   720	{
   721		int ret;
   722		int old_period, old_runtime;
   723		static DEFINE_MUTEX(mutex);
   724	
   725		mutex_lock(&mutex);
   726		old_period = sysctl_sched_microq_period;
   727		old_runtime = sysctl_sched_microq_runtime;
   728	
   729		ret = proc_dointvec(table, write, buffer, lenp, ppos);
   730	
   731		if (!ret && write) {
   732			if (sysctl_sched_microq_period < MICROQ_MIN_PERIOD) {
   733				sysctl_sched_microq_period = old_period;
   734				ret = -EINVAL;
   735			}
   736			if (sysctl_sched_microq_runtime < MICROQ_MIN_RUNTIME &&
   737			    sysctl_sched_microq_runtime != MICROQ_BANDWIDTH_UNDEFINED) {
   738				sysctl_sched_microq_runtime = old_runtime;
   739				ret = -EINVAL;
   740			}
   741		}
   742	
   743		mutex_unlock(&mutex);
   744		return ret;
   745	}
   746	
   747	#ifdef CONFIG_SCHED_DEBUG
   748	extern void print_microq_rq(struct seq_file *m, int cpu, struct microq_rq *microq_rq);
   749	
   750	void print_microq_stats(struct seq_file *m, int cpu)
   751	{
   752		rcu_read_lock();
   753		print_microq_rq(m, cpu, &cpu_rq(cpu)->microq);
   754		rcu_read_unlock();
   755	}
   756	#endif /* CONFIG_SCHED_DEBUG */
   757	
   758	#ifdef CONFIG_SYSCTL
   759	static const struct ctl_table sched_microq_sysctls[] = {
   760		{
   761			.procname	= "sched_microq_period_ns",
   762			.data		= &sysctl_sched_microq_period,
   763			.maxlen		= sizeof(int),
   764			.mode		= 0644,
 > 765			.proc_handler	= sched_microq_proc_handler,

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
