Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 371DC24E4A1
	for <oe-kbuild-all@lists.linux.dev>; Wed,  3 Dec 2025 11:46:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764762397; cv=none; b=NFcmTaSVPikfohVfQ+sWShUtSQpXBRbjMArIkH8oJo8wT2GnjPhRpsWvLD2UTF1F0wxMmdbHmEtDFNAGBUkvmantaQapEX+0CKsDNAd9r3IL0dmZI1jirsf4Ce0cdGQyWhxKJoQhCtQWYnLKWvYMtTPSL7cRv38l7Z2lR91k72Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764762397; c=relaxed/simple;
	bh=e5JYU1j6USDbalStsBvERLr9VkSReItuXBHVVnGDxBY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=a0HfrhYS+Y5JrErlluofRui2sypATFV5YwA5daGRqAcHfISX9zC+o0A7GtCQ450wYqSsklETGZUjfDJWKrMxPKmeZ6A2OX054B3S8QVhugtOmnZC8wV67aGaiQhocTd287zj1Tb10IlcQ4qImNZnPPZbPiRBv4GKyc7vA2kbr8w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KFG5mkP5; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KFG5mkP5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764762396; x=1796298396;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=e5JYU1j6USDbalStsBvERLr9VkSReItuXBHVVnGDxBY=;
  b=KFG5mkP5XXlQsDlTmZ9ewJk6HU1p/u8sxBn9dT+JI267X1288Wd5v6Dx
   ZKvHICnv/nEMcBN4VeVg1d7Z8rfYjAdrdG3ooqGw7qpdn465Nipp7cyeQ
   vaKnZQh9ZCPHpa787TDD6f6F0+6MAfw99UoZYSaMsp0e0U4YxtJ6JBAxP
   yl2Hdm701jAGtV7u34RYjWx2647KV1QucBK21ANpUkBKYIhIfLIAN69IN
   hZYKp4I+RqoVHTHOrgqqODDm8YI7pBvfLNbhAXGHL6VNKCk1KxE6aNRXJ
   uGe02KWxgwUm8QNk5aZwHwlCAq8NFvZayxPfVY77Qg5SQHf39BioH2ZA8
   g==;
X-CSE-ConnectionGUID: w6myZLj3S+6BeH1/sF6zNQ==
X-CSE-MsgGUID: 6ei0ER0NST2woQb1KNTkGA==
X-IronPort-AV: E=McAfee;i="6800,10657,11631"; a="77071399"
X-IronPort-AV: E=Sophos;i="6.20,245,1758610800"; 
   d="scan'208";a="77071399"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Dec 2025 03:46:35 -0800
X-CSE-ConnectionGUID: g4JaWAA4Snu3aixpKHKtYA==
X-CSE-MsgGUID: UF9puWq0RCurO5V3K1QKgA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,245,1758610800"; 
   d="scan'208";a="217993868"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 03 Dec 2025 03:46:33 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vQlJW-00000000AvJ-3NNE;
	Wed, 03 Dec 2025 11:46:30 +0000
Date: Wed, 3 Dec 2025 19:45:37 +0800
From: kernel test robot <lkp@intel.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [peterz-queue:sched/flat 22/22] kernel/sched/fair.c:1210:38: sparse:
 sparse: incorrect type in initializer (different address spaces)
Message-ID: <202512031909.3BCBnzfn-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git sched/flat
head:   eaad49852269b521e02cff73adc8b8a432fda88e
commit: eaad49852269b521e02cff73adc8b8a432fda88e [22/22] sched/eevdf: Move to a single runqueue
config: loongarch-randconfig-r133-20251130 (https://download.01.org/0day-ci/archive/20251203/202512031909.3BCBnzfn-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 14.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251203/202512031909.3BCBnzfn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512031909.3BCBnzfn-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   kernel/sched/fair.c:1117:49: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *running @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/fair.c:1117:49: sparse:     expected struct task_struct *running
   kernel/sched/fair.c:1117:49: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/fair.c:1151:33: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct sched_entity *se @@     got struct sched_entity [noderef] __rcu * @@
   kernel/sched/fair.c:1151:33: sparse:     expected struct sched_entity *se
   kernel/sched/fair.c:1151:33: sparse:     got struct sched_entity [noderef] __rcu *
>> kernel/sched/fair.c:1210:38: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct sched_entity *se @@     got struct sched_entity [noderef] __rcu * @@
   kernel/sched/fair.c:1210:38: sparse:     expected struct sched_entity *se
   kernel/sched/fair.c:1210:38: sparse:     got struct sched_entity [noderef] __rcu *
   kernel/sched/fair.c:12722:9: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] sd @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/fair.c:12722:9: sparse:     expected struct sched_domain *[assigned] sd
   kernel/sched/fair.c:12722:9: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/fair.c:8225:20: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] sd @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/fair.c:8225:20: sparse:     expected struct sched_domain *[assigned] sd
   kernel/sched/fair.c:8225:20: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/fair.c:8429:9: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] tmp @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/fair.c:8429:9: sparse:     expected struct sched_domain *[assigned] tmp
   kernel/sched/fair.c:8429:9: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/fair.c:8604:39: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *donor @@     got struct task_struct [noderef] __rcu *donor @@
   kernel/sched/fair.c:8604:39: sparse:     expected struct task_struct *donor
   kernel/sched/fair.c:8604:39: sparse:     got struct task_struct [noderef] __rcu *donor
   kernel/sched/fair.c:8637:37: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *tsk @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/fair.c:8637:37: sparse:     expected struct task_struct *tsk
   kernel/sched/fair.c:8637:37: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/fair.c:8843:38: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *curr @@     got struct task_struct [noderef] __rcu *donor @@
   kernel/sched/fair.c:8843:38: sparse:     expected struct task_struct *curr
   kernel/sched/fair.c:8843:38: sparse:     got struct task_struct [noderef] __rcu *donor
   kernel/sched/fair.c:9878:40: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct sched_domain *child @@     got struct sched_domain [noderef] __rcu *child @@
   kernel/sched/fair.c:9878:40: sparse:     expected struct sched_domain *child
   kernel/sched/fair.c:9878:40: sparse:     got struct sched_domain [noderef] __rcu *child
   kernel/sched/fair.c:10506:22: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/fair.c:10506:22: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/fair.c:10506:22: sparse:    struct task_struct *
   kernel/sched/fair.c:11978:9: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] sd @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/fair.c:11978:9: sparse:     expected struct sched_domain *[assigned] sd
   kernel/sched/fair.c:11978:9: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/fair.c:11616:44: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct sched_domain *sd_parent @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/fair.c:11616:44: sparse:     expected struct sched_domain *sd_parent
   kernel/sched/fair.c:11616:44: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/fair.c:12091:9: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] sd @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/fair.c:12091:9: sparse:     expected struct sched_domain *[assigned] sd
   kernel/sched/fair.c:12091:9: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/fair.c:6536:35: sparse: sparse: marked inline, but without a definition
   kernel/sched/fair.c: note: in included file:
   kernel/sched/sched.h:2303:26: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2303:26: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2303:26: sparse:    struct task_struct *
   kernel/sched/sched.h:2292:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2292:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2292:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2303:26: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2303:26: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2303:26: sparse:    struct task_struct *
   kernel/sched/sched.h:2303:26: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2303:26: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2303:26: sparse:    struct task_struct *
   kernel/sched/sched.h:2303:26: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2303:26: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2303:26: sparse:    struct task_struct *

vim +1210 kernel/sched/fair.c

  1207	
  1208	static void update_curr_fair(struct rq *rq)
  1209	{
> 1210		struct sched_entity *se = &rq->donor->se;
  1211	
  1212		for_each_sched_entity(se)
  1213			update_curr(cfs_rq_of(se));
  1214	}
  1215	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
