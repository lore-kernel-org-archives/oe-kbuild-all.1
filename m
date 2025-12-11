Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39AFA21CFF6
	for <oe-kbuild-all@lists.linux.dev>; Thu, 11 Dec 2025 22:57:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765493877; cv=none; b=H+y2CrcTIbg2tmrtbGc5dOZDSilSiCGmfQnn0+EaOc+mlFs+sorFz+/Z3ny+cai9NC9hEv5dQ5OPhqtAlBUqPFw82qoFo4wmS3l3dY6wGbiyH/MmYKqTXG9/9cYNHKxv0VutgQG9wOAGuKi/wshLgmxkJQumhpndzaFeUlecAlY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765493877; c=relaxed/simple;
	bh=NATt7j/IAUkphFwHs2CLHBxkR//w03ExQIKPjfhilCE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=pkXMEJaIp+V4xhLD/k6NdlpoaL+opmPtk/3Gu8dQkYACG10qY+hnNEgdQiqQe16Nf15qcgm55zQ9hVW5kLYv2ghWP0RFLJI2i2eas9l4X61tXMOGMRIvk18L4UVFFbosd0ID0ZN886nGsyCUM0YSsLdIACKNlrAme/3yCOUTE0U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=G5U07kGN; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="G5U07kGN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765493876; x=1797029876;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=NATt7j/IAUkphFwHs2CLHBxkR//w03ExQIKPjfhilCE=;
  b=G5U07kGNhwBfpaK/YYI92YGYevPQluqfWM+TqQXYn8SvxIPq4kOD/POE
   Lztm72YKkQZhdBYq/UCeg8DYpNvgYLKKxyEI2/9VGtUi4xY6ijX4vNogu
   9bJoMKaZhIm34HYVBbMou1nx7v3KhIs0/t2E6gH3VMxxA0tvDfvCXMFYH
   hRBUHOVdLp3knScRI02x+7pgdYQX7JVBf3/gk6dFB5PAPqjHXekBsuKO+
   ek/2pDDiTzCJ4AEvD4Mtqxf7HrEnHa0ntab8+Vg4EuiQJYDyt5SXAQv61
   3p4EoMLR6Gf7xz8SCzFp9XVaSyKv6LTWrVOm+GCTkJ5XgoxZodJptYOIl
   g==;
X-CSE-ConnectionGUID: Ll3cG5yXQD6wYOplgSob0w==
X-CSE-MsgGUID: AHRU+HZESfqLFvZlsj3wng==
X-IronPort-AV: E=McAfee;i="6800,10657,11639"; a="78949412"
X-IronPort-AV: E=Sophos;i="6.21,141,1763452800"; 
   d="scan'208";a="78949412"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Dec 2025 14:57:54 -0800
X-CSE-ConnectionGUID: SVB7bom3TPipr3U5UGKZug==
X-CSE-MsgGUID: 5ZfQJ+4mSYO/vdtEb4jaoA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,141,1763452800"; 
   d="scan'208";a="201086672"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 11 Dec 2025 14:57:52 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vTpbZ-000000005AR-3Z4a;
	Thu, 11 Dec 2025 22:57:49 +0000
Date: Fri, 12 Dec 2025 06:57:19 +0800
From: kernel test robot <lkp@intel.com>
To: John Stultz <jstultz@google.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Peter Zijlstra <peterz@infradead.org>
Subject: kernel/sched/fair.c:1201:33: sparse: sparse: incorrect type in
 argument 2 (different address spaces)
Message-ID: <202512120624.mlbF5q4a-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   d358e5254674b70f34c847715ca509e46eb81e6f
commit: aa4f74dfd42ba4399f785fb9c460a11bd1756f0a sched: Fix runtime accounting w/ split exec & sched contexts
date:   5 months ago
config: sh-randconfig-r131-20251211 (https://download.01.org/0day-ci/archive/20251212/202512120624.mlbF5q4a-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251212/202512120624.mlbF5q4a-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512120624.mlbF5q4a-lkp@intel.com/

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
   kernel/sched/fair.c:6715:39: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *donor @@     got struct task_struct [noderef] __rcu *donor @@
   kernel/sched/fair.c:6715:39: sparse:     expected struct task_struct *donor
   kernel/sched/fair.c:6715:39: sparse:     got struct task_struct [noderef] __rcu *donor
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
   kernel/sched/fair.c:6191:17: sparse: sparse: context imbalance in 'do_sched_cfs_period_timer' - unexpected unlock
   kernel/sched/fair.c: note: in included file:
   kernel/sched/sched.h:2262:26: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2262:26: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2262:26: sparse:    struct task_struct *
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
