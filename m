Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5446370D61
	for <oe-kbuild-all@lists.linux.dev>; Mon,  1 Jun 2026 19:47:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780343239; cv=none; b=lbAgBBTruuApIBHmGpGPtwOwdlRrugOV6e5h6WjIiMnv/00KzqD9jHFLSy+wrxytEv7wbdkXAQU1u6Pa4l+hd8QCaeSgoUgFjTNGB9Teu4SyKNZEkzINDYqQB494TwDPOanN4x3UFQPqRVzbGM7XluE8O2jexTM3E5pfgUVwbuE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780343239; c=relaxed/simple;
	bh=tOL5etLPw/+C5XdcjzYDPvkhgGWSJ7RiPEFKOG4C+IA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=jJSpgblsSphaI4CnzYSLsT1ff5lBVziaLfdLq8iD+01Slc3H5l4ayKjNuRyZU2f+7lyDHbXbkdvYhc4TUjG98LmxQ4A6jPWqQz3ZymV2A4P9Yi3uLnRkYsyiZ/sJl9BM8NqWi2LvbcHkWUujYOkr1bHWfxJdpiL+cYxdHK9tbSY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=e1zBMBL8; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="e1zBMBL8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780343238; x=1811879238;
  h=date:from:to:cc:subject:message-id;
  bh=tOL5etLPw/+C5XdcjzYDPvkhgGWSJ7RiPEFKOG4C+IA=;
  b=e1zBMBL8zfCKwWg+iYqhF630qByPJqpXJdHLpH25Z6ddfuqDqYvZE5d6
   FluG5nvnv7+w/+NDCRhmU5F3lgIgxM27YHf8K9kdm7BVBcyz/EQpu1+OI
   djpNtsez+TALs4nCvp7char1eTUjQAKQ1RojPINFaVeQXIk8l4kUZuVct
   0SmcPtebLgW2OFxIUZJBsEDTm5194Wjr2kdLxbPyjp4r8rLyqwWRjYYpy
   uKEBUrnkL6QGcwt6eZSE+spQwaT4hLnITyS+CJh2P7qvoOwtsdsVQ0tc1
   LDkd5beYwKl+es9X9Rc5hoUPKOJcO5CTPkqbzpDlR03Cm09vtz1/Sf/0Y
   g==;
X-CSE-ConnectionGUID: JBzDIjTaTQSMkA/egtKFCA==
X-CSE-MsgGUID: lfPXKCySSqKGttiAiNvlrQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11804"; a="81141044"
X-IronPort-AV: E=Sophos;i="6.24,181,1774335600"; 
   d="scan'208";a="81141044"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jun 2026 12:47:16 -0700
X-CSE-ConnectionGUID: 2VHXApiHSqiJlkMT2t8FLg==
X-CSE-MsgGUID: IoNldQBsT8ark7OJZ1M75g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,181,1774335600"; 
   d="scan'208";a="240676858"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 01 Jun 2026 12:47:14 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wU8bP-00000000B1Y-3phO;
	Mon, 01 Jun 2026 19:47:11 +0000
Date: Tue, 02 Jun 2026 03:46:43 +0800
From: kernel test robot <lkp@intel.com>
To: Ingo Molnar <mingo@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: kernel/sched/fair.c:10562:22: sparse: sparse: incompatible
 types in comparison expression (different address spaces):
Message-ID: <202606020334.23LlDhQn-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   e43ffb69e0438cddd72aaa30898b4dc446f664f8
commit: cac5cefbade90ff0bb0b393d301fa3b5234cf056 sched/smp: Make SMP unconditional
date:   12 months ago
config: m68k-randconfig-r132-20260601 (https://download.01.org/0day-ci/archive/20260602/202606020334.23LlDhQn-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 11.5.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260602/202606020334.23LlDhQn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: cac5cefbade9 ("sched/smp: Make SMP unconditional")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606020334.23LlDhQn-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   kernel/sched/fair.c:1196:39: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *donor @@     got struct task_struct [noderef] __rcu *donor @@
   kernel/sched/fair.c:1196:39: sparse:     expected struct task_struct *donor
   kernel/sched/fair.c:1196:39: sparse:     got struct task_struct [noderef] __rcu *donor
   kernel/sched/fair.c:1259:34: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct sched_entity const *se @@     got struct sched_entity [noderef] __rcu * @@
   kernel/sched/fair.c:1259:34: sparse:     expected struct sched_entity const *se
   kernel/sched/fair.c:1259:34: sparse:     got struct sched_entity [noderef] __rcu *
   kernel/sched/fair.c:12755:9: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] sd @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/fair.c:12755:9: sparse:     expected struct sched_domain *[assigned] sd
   kernel/sched/fair.c:12755:9: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/fair.c:6936:58: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/fair.c:6936:58: sparse:     expected struct task_struct *p
   kernel/sched/fair.c:6936:58: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/fair.c:8322:20: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] sd @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/fair.c:8322:20: sparse:     expected struct sched_domain *[assigned] sd
   kernel/sched/fair.c:8322:20: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/fair.c:8526:9: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] tmp @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/fair.c:8526:9: sparse:     expected struct sched_domain *[assigned] tmp
   kernel/sched/fair.c:8526:9: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/fair.c:8668:39: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *donor @@     got struct task_struct [noderef] __rcu *donor @@
   kernel/sched/fair.c:8668:39: sparse:     expected struct task_struct *donor
   kernel/sched/fair.c:8668:39: sparse:     got struct task_struct [noderef] __rcu *donor
   kernel/sched/fair.c:8699:37: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *tsk @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/fair.c:8699:37: sparse:     expected struct task_struct *tsk
   kernel/sched/fair.c:8699:37: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/fair.c:8917:38: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *curr @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/fair.c:8917:38: sparse:     expected struct task_struct *curr
   kernel/sched/fair.c:8917:38: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/fair.c:9934:40: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct sched_domain *child @@     got struct sched_domain [noderef] __rcu *child @@
   kernel/sched/fair.c:9934:40: sparse:     expected struct sched_domain *child
   kernel/sched/fair.c:9934:40: sparse:     got struct sched_domain [noderef] __rcu *child
>> kernel/sched/fair.c:10562:22: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/fair.c:10562:22: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/fair.c:10562:22: sparse:    struct task_struct *
   kernel/sched/fair.c:12007:9: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] sd @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/fair.c:12007:9: sparse:     expected struct sched_domain *[assigned] sd
   kernel/sched/fair.c:12007:9: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/fair.c:11657:44: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct sched_domain *sd_parent @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/fair.c:11657:44: sparse:     expected struct sched_domain *sd_parent
   kernel/sched/fair.c:11657:44: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/fair.c:12116:9: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] sd @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/fair.c:12116:9: sparse:     expected struct sched_domain *[assigned] sd
   kernel/sched/fair.c:12116:9: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/fair.c:6653:35: sparse: sparse: marked inline, but without a definition
   kernel/sched/fair.c: note: in included file:
   kernel/sched/sched.h:2460:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2460:9: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2460:9: sparse:    struct task_struct *
   kernel/sched/sched.h:2239:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2239:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2239:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2250:26: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2250:26: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2250:26: sparse:    struct task_struct *
   kernel/sched/sched.h:2250:26: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2250:26: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2250:26: sparse:    struct task_struct *

vim +10562 kernel/sched/fair.c

3318544b721d30 Vincent Guittot 2019-10-22  10550  
3318544b721d30 Vincent Guittot 2019-10-22  10551  /**
3318544b721d30 Vincent Guittot 2019-10-22  10552   * idle_cpu_without - would a given CPU be idle without p ?
3318544b721d30 Vincent Guittot 2019-10-22  10553   * @cpu: the processor on which idleness is tested.
3318544b721d30 Vincent Guittot 2019-10-22  10554   * @p: task which should be ignored.
3318544b721d30 Vincent Guittot 2019-10-22  10555   *
3318544b721d30 Vincent Guittot 2019-10-22  10556   * Return: 1 if the CPU would be idle. 0 otherwise.
3318544b721d30 Vincent Guittot 2019-10-22  10557   */
3318544b721d30 Vincent Guittot 2019-10-22  10558  static int idle_cpu_without(int cpu, struct task_struct *p)
3318544b721d30 Vincent Guittot 2019-10-22  10559  {
3318544b721d30 Vincent Guittot 2019-10-22  10560  	struct rq *rq = cpu_rq(cpu);
3318544b721d30 Vincent Guittot 2019-10-22  10561  
3318544b721d30 Vincent Guittot 2019-10-22 @10562  	if (rq->curr != rq->idle && rq->curr != p)
3318544b721d30 Vincent Guittot 2019-10-22  10563  		return 0;
3318544b721d30 Vincent Guittot 2019-10-22  10564  
3318544b721d30 Vincent Guittot 2019-10-22  10565  	/*
3318544b721d30 Vincent Guittot 2019-10-22  10566  	 * rq->nr_running can't be used but an updated version without the
3318544b721d30 Vincent Guittot 2019-10-22  10567  	 * impact of p on cpu must be used instead. The updated nr_running
3318544b721d30 Vincent Guittot 2019-10-22  10568  	 * be computed and tested before calling idle_cpu_without().
3318544b721d30 Vincent Guittot 2019-10-22  10569  	 */
3318544b721d30 Vincent Guittot 2019-10-22  10570  
126c2092e5c8b2 Peter Zijlstra  2020-05-26  10571  	if (rq->ttwu_pending)
3318544b721d30 Vincent Guittot 2019-10-22  10572  		return 0;
3318544b721d30 Vincent Guittot 2019-10-22  10573  
3318544b721d30 Vincent Guittot 2019-10-22  10574  	return 1;
3318544b721d30 Vincent Guittot 2019-10-22  10575  }
3318544b721d30 Vincent Guittot 2019-10-22  10576  

:::::: The code at line 10562 was first introduced by commit
:::::: 3318544b721d3072fdd1f85ee0f1f214c0b211ee sched/fair: Fix rework of find_idlest_group()

:::::: TO: Vincent Guittot <vincent.guittot@linaro.org>
:::::: CC: Ingo Molnar <mingo@kernel.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
