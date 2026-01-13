Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3858D392836
	for <oe-kbuild-all@lists.linux.dev>; Tue, 13 Jan 2026 14:04:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768313056; cv=none; b=hURvRQYNeEKQqCXwU2mN0SRumgx9eYw5bnJGkyODbo8y1535WpeqUvlT/8bsZpwHfNIyrXWCODsPUF/Y6ipGNwMEroeRP1fUVWbSYRbdYPtVy+2E+W/TI0s6Zrm6REsoZW5XAr14wBU8SR+E3SL3PEX7apwypYNHe0MCx+p43KM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768313056; c=relaxed/simple;
	bh=dv/pb9P3ckuGXpBZEjCYM9r9djnljeXPpooPrFmSMx8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=D1tyMijJl/j7gYWGaX3vh/FT4FdCGVYC3UrZmvErPyuTe1VvII2oi4Dv45M94djGSRgJpdGAiCYP8FWJcx7z/tSCCn3TwuSRb/NGkU31VDasrKK+fJfdaOtM6/P7mgMAkyd1BUhQitR+os8vZIhyZ7/aP62dIvxFLdUAtgExoHA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=h/Bz5YQH; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="h/Bz5YQH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768313054; x=1799849054;
  h=date:from:to:cc:subject:message-id;
  bh=dv/pb9P3ckuGXpBZEjCYM9r9djnljeXPpooPrFmSMx8=;
  b=h/Bz5YQH+z0H5346eCLDPSu2JJTyN7/7St7HkUcaAaAu1EbP7ymDq/cJ
   8uYmpETEfKQbQ1uW2S3DBOXoFteD5WLgeQ/7kHVo8yn8/JM8YbgyDcJSD
   kIZHtsDh1Sy0rPGt5uBfywl9Ufq2qOwRuVbAJVEbBrI3oQG0DsjilgwXS
   4HXsoRedmdk2BrhKUkTkiiV5YGJLW10ABDtjS7efXlyxi2AUy6WgnRjai
   RUpqDqpFt2iwUNvvhiDLfvEv/EOCEGEhONEYhccJ9ZtmHopAPNu+YUJEC
   v6g10luVMkRm2fm7Pc1CG9ALJNv2yfvEe+Ye0J48Zi5W27q83q7ROKkM7
   Q==;
X-CSE-ConnectionGUID: iMReWg1wTpKQS05cTWQchg==
X-CSE-MsgGUID: mvqW/r6ISWWsPIFTawHjOQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11670"; a="69519963"
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; 
   d="scan'208";a="69519963"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jan 2026 06:04:14 -0800
X-CSE-ConnectionGUID: cSJ9/9SnQv+jnw+28UMpGQ==
X-CSE-MsgGUID: WJv0Pp0NSzWOikCWDgOTXg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; 
   d="scan'208";a="208553699"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 13 Jan 2026 06:04:11 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vff0C-00000000Ese-2NF8;
	Tue, 13 Jan 2026 14:04:08 +0000
Date: Tue, 13 Jan 2026 22:03:54 +0800
From: kernel test robot <lkp@intel.com>
To: John Stultz <jstultz@google.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Peter Zijlstra <peterz@infradead.org>
Subject: kernel/sched/fair.c:1201:33: sparse: sparse: incorrect type
 in argument 2 (different address spaces)
Message-ID: <202601132230.08tbCY9b-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   b71e635feefc852405b14620a7fc58c4c80c0f73
commit: aa4f74dfd42ba4399f785fb9c460a11bd1756f0a sched: Fix runtime accounting w/ split exec & sched contexts
date:   6 months ago
config: sparc64-randconfig-r112-20260113 (https://download.01.org/0day-ci/archive/20260113/202601132230.08tbCY9b-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260113/202601132230.08tbCY9b-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601132230.08tbCY9b-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   kernel/sched/fair.c:1167:49: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *running @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/fair.c:1167:49: sparse:     expected struct task_struct *running
   kernel/sched/fair.c:1167:49: sparse:     got struct task_struct [noderef] __rcu *curr
>> kernel/sched/fair.c:1201:33: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct sched_entity *se @@     got struct sched_entity [noderef] __rcu * @@
   kernel/sched/fair.c:1201:33: sparse:     expected struct sched_entity *se
   kernel/sched/fair.c:1201:33: sparse:     got struct sched_entity [noderef] __rcu *
   kernel/sched/fair.c:1259:34: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct sched_entity const *se @@     got struct sched_entity [noderef] __rcu * @@
   kernel/sched/fair.c:1259:34: sparse:     expected struct sched_entity const *se
   kernel/sched/fair.c:1259:34: sparse:     got struct sched_entity [noderef] __rcu *
   kernel/sched/fair.c:12744:9: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] sd @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/fair.c:12744:9: sparse:     expected struct sched_domain *[assigned] sd
   kernel/sched/fair.c:12744:9: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/fair.c:5995:22: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/fair.c:5995:22: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/fair.c:5995:22: sparse:    struct task_struct *
   kernel/sched/fair.c:6920:58: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/fair.c:6920:58: sparse:     expected struct task_struct *p
   kernel/sched/fair.c:6920:58: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/fair.c:8302:20: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] sd @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/fair.c:8302:20: sparse:     expected struct sched_domain *[assigned] sd
   kernel/sched/fair.c:8302:20: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/fair.c:8506:9: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] tmp @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/fair.c:8506:9: sparse:     expected struct sched_domain *[assigned] tmp
   kernel/sched/fair.c:8506:9: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/fair.c:8648:39: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *donor @@     got struct task_struct [noderef] __rcu *donor @@
   kernel/sched/fair.c:8648:39: sparse:     expected struct task_struct *donor
   kernel/sched/fair.c:8648:39: sparse:     got struct task_struct [noderef] __rcu *donor
   kernel/sched/fair.c:8680:37: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *tsk @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/fair.c:8680:37: sparse:     expected struct task_struct *tsk
   kernel/sched/fair.c:8680:37: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/fair.c:8900:38: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *curr @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/fair.c:8900:38: sparse:     expected struct task_struct *curr
   kernel/sched/fair.c:8900:38: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/fair.c:9917:40: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct sched_domain *child @@     got struct sched_domain [noderef] __rcu *child @@
   kernel/sched/fair.c:9917:40: sparse:     expected struct sched_domain *child
   kernel/sched/fair.c:9917:40: sparse:     got struct sched_domain [noderef] __rcu *child
   kernel/sched/fair.c:10545:22: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/fair.c:10545:22: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/fair.c:10545:22: sparse:    struct task_struct *
   kernel/sched/fair.c:11990:9: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] sd @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/fair.c:11990:9: sparse:     expected struct sched_domain *[assigned] sd
   kernel/sched/fair.c:11990:9: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/fair.c:11640:44: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct sched_domain *sd_parent @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/fair.c:11640:44: sparse:     expected struct sched_domain *sd_parent
   kernel/sched/fair.c:11640:44: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/fair.c:12105:9: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] sd @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/fair.c:12105:9: sparse:     expected struct sched_domain *[assigned] sd
   kernel/sched/fair.c:12105:9: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/fair.c:7415:28: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *sd @@     got struct sched_domain [noderef] __rcu *child @@
   kernel/sched/fair.c:7415:28: sparse:     expected struct sched_domain *sd
   kernel/sched/fair.c:7415:28: sparse:     got struct sched_domain [noderef] __rcu *child
   kernel/sched/fair.c:7421:28: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *sd @@     got struct sched_domain [noderef] __rcu *child @@
   kernel/sched/fair.c:7421:28: sparse:     expected struct sched_domain *sd
   kernel/sched/fair.c:7421:28: sparse:     got struct sched_domain [noderef] __rcu *child
   kernel/sched/fair.c:7428:28: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *sd @@     got struct sched_domain [noderef] __rcu *child @@
   kernel/sched/fair.c:7428:28: sparse:     expected struct sched_domain *sd
   kernel/sched/fair.c:7428:28: sparse:     got struct sched_domain [noderef] __rcu *child
   kernel/sched/fair.c:7436:17: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] tmp @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/fair.c:7436:17: sparse:     expected struct sched_domain *[assigned] tmp
   kernel/sched/fair.c:7436:17: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/fair.c:8590:9: sparse: sparse: context imbalance in 'task_dead_fair' - wrong count at exit
   kernel/sched/fair.c: note: in included file:
   kernel/sched/sched.h:2462:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2462:9: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2462:9: sparse:    struct task_struct *
   kernel/sched/sched.h:2262:26: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2262:26: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2262:26: sparse:    struct task_struct *
   kernel/sched/sched.h:2262:26: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2262:26: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2262:26: sparse:    struct task_struct *

vim +1201 kernel/sched/fair.c

  1195	
  1196	/*
  1197	 * Used by other classes to account runtime.
  1198	 */
  1199	s64 update_curr_common(struct rq *rq)
  1200	{
> 1201		return update_se(rq, &rq->donor->se);
  1202	}
  1203	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
