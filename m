Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9170A376BEF
	for <oe-kbuild-all@lists.linux.dev>; Fri, 12 Jun 2026 09:00:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781254850; cv=none; b=uNwV1vHRPOOUc/JE2+eiuE441s5l3aD4dnAnId2FGQOv4fvTo0fiAb7zK37bnjvOTzXSmr9bEEUKEYBQK4cC5aGTBswNg2rLi0t1HD5Q9z6B6zURgKza/bgGZe8dvaMh0QCK30MJ1lZuHvGqm7ZGpX3kZs41GXb1jJ78YU7VS8k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781254850; c=relaxed/simple;
	bh=NjIzyUaOG12+QrfTXd2bdJt/6Mg6NTbloZ3ZjrbAP40=;
	h=Date:From:To:Cc:Subject:Message-ID; b=R+CEbusTMlS5m/JiqTGq+f2Yo60hiJpw/xWBtq6lKkhFMACKS6s39XYv1NT/gTm9Ogjoeh6r3L7ZsAqc41SarvMsd5mPd4tl7FJYll03tynQRJZ5hZ0z61IEhHPgxWzyINum8r+5SBSHnGzg5lzt86LoRfuYtFd2qpYmRb8ZyNk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Itd3o0wE; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Itd3o0wE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781254849; x=1812790849;
  h=date:from:to:cc:subject:message-id;
  bh=NjIzyUaOG12+QrfTXd2bdJt/6Mg6NTbloZ3ZjrbAP40=;
  b=Itd3o0wE73s9U0x1QUnOVVRB0ejcnllpn9buhP8ziObw13CUNOEZ5MYw
   J3r3jRETesd3jnIheQT0BxpV4ThUj5LLfHEwVt43Yc+FED+ptdCJn7H+o
   0m8Xdq6+w7ukr2gdl7RfEtwWL8A8UK2llNAFSxUNPsqMShbb6EdeRTkiU
   q5xBAQlCP6V3GZ09Ms3nrPeL/SQPKFopFWM+fx1aE6cfCurzZZY2YeWqS
   iGTP7oovg/OzkEfZFkB7cuIOqlaDIorfxP0eh3crxpPcJIbM53RJSamzC
   UX62Je7/PA2Hy7sI2moiQ0M5aMssyQeJgOmpjt4nzhriAnhHGQcifTH8W
   Q==;
X-CSE-ConnectionGUID: J818hmBpQwWqZpt7x673Wg==
X-CSE-MsgGUID: U38oe9rwQru4+uWcZAsf8g==
X-IronPort-AV: E=McAfee;i="6800,10657,11813"; a="82146380"
X-IronPort-AV: E=Sophos;i="6.24,200,1774335600"; 
   d="scan'208";a="82146380"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jun 2026 02:00:49 -0700
X-CSE-ConnectionGUID: GoJdWCYDR0+CRueHCn8l2w==
X-CSE-MsgGUID: HqFKw6SzT32bwuTADUy5AQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,200,1774335600"; 
   d="scan'208";a="242637543"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 12 Jun 2026 02:00:46 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wXxkq-00000000OWB-2Cot;
	Fri, 12 Jun 2026 09:00:44 +0000
Date: Fri, 12 Jun 2026 16:59:48 +0800
From: kernel test robot <lkp@intel.com>
To: "Peter Zijlstra (Intel)" <peterz@infradead.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [peterz-queue:sched/flat 63/63] kernel/sched/fair.c:2004:38:
 sparse: sparse: incorrect type in initializer (different address spaces)
Message-ID: <202606121600.vzzNta0W-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git sched/flat
head:   7eb85c33dd206641f641e4d229bf3089cf3b6f72
commit: 7eb85c33dd206641f641e4d229bf3089cf3b6f72 [63/63] sched/eevdf: Move to a single runqueue
config: arm-randconfig-r123-20260612 (https://download.01.org/0day-ci/archive/20260612/202606121600.vzzNta0W-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 10.5.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260612/202606121600.vzzNta0W-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606121600.vzzNta0W-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   kernel/sched/fair.c:1335:49: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *running @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/fair.c:1335:49: sparse:     expected struct task_struct *running
   kernel/sched/fair.c:1335:49: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/fair.c:1945:33: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct sched_entity *se @@     got struct sched_entity [noderef] __rcu * @@
   kernel/sched/fair.c:1945:33: sparse:     expected struct sched_entity *se
   kernel/sched/fair.c:1945:33: sparse:     got struct sched_entity [noderef] __rcu *
>> kernel/sched/fair.c:2004:38: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct sched_entity *se @@     got struct sched_entity [noderef] __rcu * @@
   kernel/sched/fair.c:2004:38: sparse:     expected struct sched_entity *se
   kernel/sched/fair.c:2004:38: sparse:     got struct sched_entity [noderef] __rcu *
   kernel/sched/fair.c:14421:9: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] sd @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/fair.c:14421:9: sparse:     expected struct sched_domain *[assigned] sd
   kernel/sched/fair.c:14421:9: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/fair.c:7743:39: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *donor @@     got struct task_struct [noderef] __rcu *donor @@
   kernel/sched/fair.c:7743:39: sparse:     expected struct task_struct *donor
   kernel/sched/fair.c:7743:39: sparse:     got struct task_struct [noderef] __rcu *donor
   kernel/sched/fair.c:9432:20: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] sd @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/fair.c:9432:20: sparse:     expected struct sched_domain *[assigned] sd
   kernel/sched/fair.c:9432:20: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/fair.c:9627:9: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] tmp @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/fair.c:9627:9: sparse:     expected struct sched_domain *[assigned] tmp
   kernel/sched/fair.c:9627:9: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/fair.c:9801:39: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *donor @@     got struct task_struct [noderef] __rcu *donor @@
   kernel/sched/fair.c:9801:39: sparse:     expected struct task_struct *donor
   kernel/sched/fair.c:9801:39: sparse:     got struct task_struct [noderef] __rcu *donor
   kernel/sched/fair.c:9834:37: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *tsk @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/fair.c:9834:37: sparse:     expected struct task_struct *tsk
   kernel/sched/fair.c:9834:37: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/fair.c:10033:38: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *curr @@     got struct task_struct [noderef] __rcu *donor @@
   kernel/sched/fair.c:10033:38: sparse:     expected struct task_struct *curr
   kernel/sched/fair.c:10033:38: sparse:     got struct task_struct [noderef] __rcu *donor
   kernel/sched/fair.c:11373:40: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct sched_domain *child @@     got struct sched_domain [noderef] __rcu *child @@
   kernel/sched/fair.c:11373:40: sparse:     expected struct sched_domain *child
   kernel/sched/fair.c:11373:40: sparse:     got struct sched_domain [noderef] __rcu *child
   kernel/sched/fair.c:12139:22: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/fair.c:12139:22: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/fair.c:12139:22: sparse:    struct task_struct *
   kernel/sched/fair.c:13657:9: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] sd @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/fair.c:13657:9: sparse:     expected struct sched_domain *[assigned] sd
   kernel/sched/fair.c:13657:9: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/fair.c:13288:44: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct sched_domain *sd_parent @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/fair.c:13288:44: sparse:     expected struct sched_domain *sd_parent
   kernel/sched/fair.c:13288:44: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/fair.c:13793:9: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] sd @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/fair.c:13793:9: sparse:     expected struct sched_domain *[assigned] sd
   kernel/sched/fair.c:13793:9: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/fair.c:7643:35: sparse: sparse: marked inline, but without a definition
   kernel/sched/fair.c: note: in included file:
   kernel/sched/sched.h:2465:26: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2465:26: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2465:26: sparse:    struct task_struct *
   kernel/sched/sched.h:1426:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:1426:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:1426:25: sparse:    struct task_struct *
   kernel/sched/sched.h:1426:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:1426:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:1426:25: sparse:    struct task_struct *
   kernel/sched/sched.h:1426:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:1426:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:1426:25: sparse:    struct task_struct *
   kernel/sched/sched.h:1426:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:1426:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:1426:25: sparse:    struct task_struct *
   kernel/sched/sched.h:1426:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:1426:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:1426:25: sparse:    struct task_struct *
   kernel/sched/sched.h:1426:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:1426:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:1426:25: sparse:    struct task_struct *
   kernel/sched/sched.h:1426:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:1426:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:1426:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2465:26: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2465:26: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2465:26: sparse:    struct task_struct *
   kernel/sched/sched.h:2454:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2454:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2454:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2465:26: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2465:26: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2465:26: sparse:    struct task_struct *
   kernel/sched/sched.h:2465:26: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2465:26: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2465:26: sparse:    struct task_struct *
   kernel/sched/sched.h:2465:26: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2465:26: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2465:26: sparse:    struct task_struct *

vim +2004 kernel/sched/fair.c

  2001	
  2002	static void update_curr_fair(struct rq *rq)
  2003	{
> 2004		struct sched_entity *se = &rq->donor->se;
  2005	
  2006		for_each_sched_entity(se)
  2007			update_curr(cfs_rq_of(se));
  2008	}
  2009	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
