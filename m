Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE89E4D2ECA
	for <oe-kbuild-all@lists.linux.dev>; Mon, 11 May 2026 19:29:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778527800; cv=none; b=KWMhAiVttPnAKf6Luo5GEJO/bsHcgzzfcuh8Gu6KbqC4bZsPJR+qR7jRZCM5Nn7lagi/+TYsvQ+LLXXI2WWf1bL8Eqh7gDTeGGQeXgACTTVsABssAEdPDfQZNKP442SqP541qH9WrwgfV6KfTG89rXnEskwAFCV3cGsuLrHmU9M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778527800; c=relaxed/simple;
	bh=oR9Jy4SoZPYeRAuV5He8vMHWvtd4uIfkodjzWVuMdw4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=uTytcknnZtmYHvFff4IIVp/4jnDh6L+mNKM7A9F89CvHB59cc0/FLuAzGyrLlvCZCyQZ3Hp0YeHUCDyoTaxNJBdOAithYy2n6+dtHBJeknfG59s65Mv0eeO/Ya1TW9kzO7n9Wcqlb5zeqfPupxivVOZmGYorSeWzzsO500XXxw4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aop+k/CQ; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aop+k/CQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778527797; x=1810063797;
  h=date:from:to:cc:subject:message-id;
  bh=oR9Jy4SoZPYeRAuV5He8vMHWvtd4uIfkodjzWVuMdw4=;
  b=aop+k/CQ8YKXryClOCNdKbdS1k8VEszV9G1511xLQ6sokg5XKvQtX5E/
   JN98qgVl+SRLoIM8n/S9yF+kexKUEmZapONYttoVwv8h0FzkI8+/zLAQL
   GiCMdEPZ4RcLmjW6uB5ALGT43Uild5HnspgWAye3gS9hePe36AMC2iIoP
   v9tm+u6lkA/zuwVPNjYAxeQMkDE4SWE4jQYh44p0qMJ2CDQXOaP71rJ45
   b22pTCXcvAvElSW4vN1plEodzJLi93joLjVnG7PIVL6tA7wHgr8UYWWw0
   +ykuxQctjvmhgCTPJxOQMxp9v7fDXdN8Lq21d77ClOCd5myyjB7Ph92Je
   A==;
X-CSE-ConnectionGUID: 0YGFax3OSO6RdeMCH5hgog==
X-CSE-MsgGUID: 6fTvPNvoQre+pi5wcMdngw==
X-IronPort-AV: E=McAfee;i="6800,10657,11783"; a="78458763"
X-IronPort-AV: E=Sophos;i="6.23,229,1770624000"; 
   d="scan'208";a="78458763"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 May 2026 12:29:57 -0700
X-CSE-ConnectionGUID: kAzebYsFSzi8QgkYFOfR5A==
X-CSE-MsgGUID: LdwN1AbVSgaJjezGccImZA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,229,1770624000"; 
   d="scan'208";a="236569457"
Received: from lkp-server01.sh.intel.com (HELO dca79079c3eb) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 11 May 2026 12:29:56 -0700
Received: from kbuild by dca79079c3eb with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wMWK9-0000000014b-1ZAi;
	Mon, 11 May 2026 19:29:53 +0000
Date: Tue, 12 May 2026 03:29:50 +0800
From: kernel test robot <lkp@intel.com>
To: "Peter Zijlstra (Intel)" <peterz@infradead.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [peterz-queue:sched/flat 12/12] kernel/sched/fair.c:1425:38:
 sparse: sparse: incorrect type in initializer (different address spaces)
Message-ID: <202605120333.9YlGwWDp-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git sched/flat
head:   82a8ec6fb3f91d21f8b54ca1cf88f9068286b704
commit: 82a8ec6fb3f91d21f8b54ca1cf88f9068286b704 [12/12] sched/eevdf: Move to a single runqueue
config: sparc64-randconfig-r134-20260511 (https://download.01.org/0day-ci/archive/20260512/202605120333.9YlGwWDp-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 11.5.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260512/202605120333.9YlGwWDp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605120333.9YlGwWDp-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   kernel/sched/fair.c:1332:49: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *running @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/fair.c:1332:49: sparse:     expected struct task_struct *running
   kernel/sched/fair.c:1332:49: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/fair.c:1366:33: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct sched_entity *se @@     got struct sched_entity [noderef] __rcu * @@
   kernel/sched/fair.c:1366:33: sparse:     expected struct sched_entity *se
   kernel/sched/fair.c:1366:33: sparse:     got struct sched_entity [noderef] __rcu *
>> kernel/sched/fair.c:1425:38: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct sched_entity *se @@     got struct sched_entity [noderef] __rcu * @@
   kernel/sched/fair.c:1425:38: sparse:     expected struct sched_entity *se
   kernel/sched/fair.c:1425:38: sparse:     got struct sched_entity [noderef] __rcu *
   kernel/sched/fair.c:13195:9: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] sd @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/fair.c:13195:9: sparse:     expected struct sched_domain *[assigned] sd
   kernel/sched/fair.c:13195:9: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/fair.c:6364:22: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/fair.c:6364:22: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/fair.c:6364:22: sparse:    struct task_struct *
   kernel/sched/fair.c:7119:39: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *donor @@     got struct task_struct [noderef] __rcu *donor @@
   kernel/sched/fair.c:7119:39: sparse:     expected struct task_struct *donor
   kernel/sched/fair.c:7119:39: sparse:     got struct task_struct [noderef] __rcu *donor
   kernel/sched/fair.c:8703:20: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] sd @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/fair.c:8703:20: sparse:     expected struct sched_domain *[assigned] sd
   kernel/sched/fair.c:8703:20: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/fair.c:8898:9: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] tmp @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/fair.c:8898:9: sparse:     expected struct sched_domain *[assigned] tmp
   kernel/sched/fair.c:8898:9: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/fair.c:9072:39: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *donor @@     got struct task_struct [noderef] __rcu *donor @@
   kernel/sched/fair.c:9072:39: sparse:     expected struct task_struct *donor
   kernel/sched/fair.c:9072:39: sparse:     got struct task_struct [noderef] __rcu *donor
   kernel/sched/fair.c:9105:37: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *tsk @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/fair.c:9105:37: sparse:     expected struct task_struct *tsk
   kernel/sched/fair.c:9105:37: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/fair.c:9306:38: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *curr @@     got struct task_struct [noderef] __rcu *donor @@
   kernel/sched/fair.c:9306:38: sparse:     expected struct task_struct *curr
   kernel/sched/fair.c:9306:38: sparse:     got struct task_struct [noderef] __rcu *donor
   kernel/sched/fair.c:10316:40: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct sched_domain *child @@     got struct sched_domain [noderef] __rcu *child @@
   kernel/sched/fair.c:10316:40: sparse:     expected struct sched_domain *child
   kernel/sched/fair.c:10316:40: sparse:     got struct sched_domain [noderef] __rcu *child
   kernel/sched/fair.c:10949:22: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/fair.c:10949:22: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/fair.c:10949:22: sparse:    struct task_struct *
   kernel/sched/fair.c:12420:9: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] sd @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/fair.c:12420:9: sparse:     expected struct sched_domain *[assigned] sd
   kernel/sched/fair.c:12420:9: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/fair.c:12058:44: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct sched_domain *sd_parent @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/fair.c:12058:44: sparse:     expected struct sched_domain *sd_parent
   kernel/sched/fair.c:12058:44: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/fair.c:12556:9: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] sd @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/fair.c:12556:9: sparse:     expected struct sched_domain *[assigned] sd
   kernel/sched/fair.c:12556:9: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/fair.c: note: in included file:
   kernel/sched/sched.h:2399:26: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2399:26: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2399:26: sparse:    struct task_struct *
   kernel/sched/sched.h:2399:26: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2399:26: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2399:26: sparse:    struct task_struct *
   kernel/sched/sched.h:1410:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:1410:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:1410:25: sparse:    struct task_struct *
   kernel/sched/sched.h:1410:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:1410:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:1410:25: sparse:    struct task_struct *
   kernel/sched/sched.h:1410:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:1410:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:1410:25: sparse:    struct task_struct *
   kernel/sched/sched.h:1410:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:1410:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:1410:25: sparse:    struct task_struct *
   kernel/sched/sched.h:1410:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:1410:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:1410:25: sparse:    struct task_struct *
   kernel/sched/sched.h:1410:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:1410:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:1410:25: sparse:    struct task_struct *
   kernel/sched/sched.h:1410:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:1410:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:1410:25: sparse:    struct task_struct *
   kernel/sched/sched.h:1410:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:1410:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:1410:25: sparse:    struct task_struct *
   kernel/sched/sched.h:1410:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:1410:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:1410:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2399:26: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2399:26: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2399:26: sparse:    struct task_struct *
   kernel/sched/sched.h:2388:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2388:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2388:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2399:26: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2399:26: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2399:26: sparse:    struct task_struct *
   kernel/sched/sched.h:1410:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:1410:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:1410:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2399:26: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2399:26: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2399:26: sparse:    struct task_struct *
   kernel/sched/sched.h:2399:26: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2399:26: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2399:26: sparse:    struct task_struct *

vim +1425 kernel/sched/fair.c

  1422	
  1423	static void update_curr_fair(struct rq *rq)
  1424	{
> 1425		struct sched_entity *se = &rq->donor->se;
  1426	
  1427		for_each_sched_entity(se)
  1428			update_curr(cfs_rq_of(se));
  1429	}
  1430	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
