Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 030044302F8
	for <oe-kbuild-all@lists.linux.dev>; Wed,  7 Oct 2026 22:28:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791412125; cv=none; b=CRe3fNUcZDZ2LKFvfi8eErOdj2PggY2X17ogJ5maIlQWfyL/13rZ/1VIF5qvqCbbKRBnYWYUh42ftQj0lzysDhzIXCEK3jVFRgw+sGrOuA53lanwwJ61RAhpSzsd2lZlXP3+GZU/kAD+mGsYWhPyFe6pdXz3IKWQMx0whZCIuJM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791412125; c=relaxed/simple;
	bh=R9vEqErknoGLT7/oYCxTG2qLqQ+IL0uZPFv10zIuDv4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=kfuBSbnCKpgiObYvMsrOvEcV1Fugo+nKA2eLRMw8HEtfv6EtamjLWnigFeletUy8M9X9VOeYOy5qKCKRJt5Jj30PfvNcCUXrGge6OAdrDC3yVfs0G6YIjG7Ku6mvOzt2iRkQv4vZDj+sc9LzKL5OXntq/HLvVSKtQ8ARtqwGaKA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VoZQwvKE; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VoZQwvKE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791412124; x=1822948124;
  h=date:from:to:cc:subject:message-id;
  bh=R9vEqErknoGLT7/oYCxTG2qLqQ+IL0uZPFv10zIuDv4=;
  b=VoZQwvKErf9gDo/eQePFwLQcpf+hMHXgkzxkq+3H9w0Tfwp+FPMk61I3
   OfkiarJxuCk5XQAZUBiO/ym7NWtzWj6ONTqZF67XIAkot6kxODodfKVxp
   RvMzVNshW/lr5N8/DODoDlZoqwMgxXOcVz/PIYf8nTjQaULiojqpCUgYx
   BP8obDCRM5/UyMLSQrOQwh0i+gUpDMhgF+DaEsYjRIJGf318rpD8uzB+m
   B/D5KuEhsy54UB30/9mM1dZodxBm0twhJd5xUdOUHdHspOGbRmo8ySWIC
   bVnDuOZfL//AGxzk3xVppVCvkhkosSULZ/fRa4068RTRrdlnOMaPFhNW0
   w==;
X-CSE-ConnectionGUID: 9JvtcdKOTBmO0gR3/rjvPQ==
X-CSE-MsgGUID: /ZypxwePQjmA6ZPc6W/42g==
X-IronPort-AV: E=McAfee;i="6800,10657,11928"; a="196556"
X-IronPort-AV: E=Sophos;i="6.27,145,1787036400"; 
   d="scan'208";a="196556"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Oct 2026 15:28:41 -0700
X-CSE-ConnectionGUID: TdhG/9OnQ1qwPcggSphhCg==
X-CSE-MsgGUID: KpRwphcHSTyqes3tdXnhcg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,145,1787036400"; 
   d="scan'208";a="307030206"
Received: from igk-lkp-server01.igk.intel.com (HELO d0de6c2a75a7) ([10.211.93.152])
  by orviesa002.jf.intel.com with ESMTP; 07 Oct 2026 15:28:40 -0700
Received: from kbuild by d0de6c2a75a7 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xEa7o-000000004BL-3Kok;
	Wed, 07 Oct 2026 22:28:36 +0000
Date: Thu, 08 Oct 2026 00:28:16 +0200
From: kernel test robot <lkp@intel.com>
To: steven@liquorix.net
Cc: oe-kbuild-all@lists.linux.dev
Subject: [zen:7.2/prjc 118/124] kernel/sched/alt_core.c:5356:6:
 sparse: sparse: symbol 'rt_mutex_futex_pre_schedule' was not declared. Should
 it be static?
Message-ID: <202610080022.npKGoi7g-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/zen-kernel/zen-kernel 7.2/prjc
head:   dca70816eacb7e122d8192bc4f042c74c312eb5d
commit: ecdb5900a34a8291a8457c0e29cca911c55dbf67 [118/124] sched/alt: [Sync] b715872ef0cc futex: Provide rt_mutex_.*_schedule() equivalents for futex scheduling
config: powerpc-randconfig-r2303-20261007 (https://download.01.org/0day-ci/archive/20261008/202610080022.npKGoi7g-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 9.5.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261008/202610080022.npKGoi7g-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610080022.npKGoi7g-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   kernel/sched/alt_core.c:453:33: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *task @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/alt_core.c:453:33: sparse:     expected struct task_struct *task
   kernel/sched/alt_core.c:453:33: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/alt_core.c:2656:36: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct const *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/alt_core.c:2656:36: sparse:     expected struct task_struct const *p
   kernel/sched/alt_core.c:2656:36: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/alt_core.c:3269:27: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/alt_core.c:3269:27: sparse:     expected struct task_struct *p
   kernel/sched/alt_core.c:3269:27: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/alt_core.c:4098:15: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/alt_core.c:4098:15: sparse:    struct task_struct *
   kernel/sched/alt_core.c:4098:15: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/alt_core.c:4249:14: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct task_struct *curr @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/alt_core.c:4249:14: sparse:     expected struct task_struct *curr
   kernel/sched/alt_core.c:4249:14: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/alt_core.c:4328:46: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *curr @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/alt_core.c:4328:46: sparse:     expected struct task_struct *curr
   kernel/sched/alt_core.c:4328:46: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/alt_core.c:4891:14: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct task_struct *prev @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/alt_core.c:4891:14: sparse:     expected struct task_struct *prev
   kernel/sched/alt_core.c:4891:14: sparse:     got struct task_struct [noderef] __rcu *curr
>> kernel/sched/alt_core.c:5356:6: sparse: sparse: symbol 'rt_mutex_futex_pre_schedule' was not declared. Should it be static?
>> kernel/sched/alt_core.c:5375:6: sparse: sparse: symbol 'rt_mutex_futex_post_schedule' was not declared. Should it be static?
   kernel/sched/alt_core.c:5439:17: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/alt_core.c:5439:17: sparse:    struct task_struct *
   kernel/sched/alt_core.c:5439:17: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/alt_core.c:5984:25: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/alt_core.c:5984:25: sparse:     expected struct task_struct *p
   kernel/sched/alt_core.c:5984:25: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/alt_core.c:911:38: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *curr @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/alt_core.c:911:38: sparse:     expected struct task_struct *curr
   kernel/sched/alt_core.c:911:38: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/alt_core.c:911:38: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *curr @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/alt_core.c:911:38: sparse:     expected struct task_struct *curr
   kernel/sched/alt_core.c:911:38: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/alt_core.c:1138:37: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/alt_core.c:1138:37: sparse:    struct task_struct *
   kernel/sched/alt_core.c:1138:37: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/alt_core.c:1818:38: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/alt_core.c:1818:38: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/alt_core.c:1818:38: sparse:    struct task_struct const *
   kernel/sched/alt_core.c: note: in included file (through kernel/sched/sched.h):
   kernel/sched/alt_sched.h:312:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/alt_sched.h:312:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/alt_sched.h:312:25: sparse:    struct task_struct *
   kernel/sched/alt_sched.h:312:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/alt_sched.h:312:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/alt_sched.h:312:25: sparse:    struct task_struct *
   kernel/sched/alt_sched.h:312:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/alt_sched.h:312:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/alt_sched.h:312:25: sparse:    struct task_struct *
   kernel/sched/alt_sched.h:312:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/alt_sched.h:312:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/alt_sched.h:312:25: sparse:    struct task_struct *
   kernel/sched/alt_core.c:1138:37: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/alt_core.c:1138:37: sparse:    struct task_struct *
   kernel/sched/alt_core.c:1138:37: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/alt_core.c:1138:37: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/alt_core.c:1138:37: sparse:    struct task_struct *
   kernel/sched/alt_core.c:1138:37: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/alt_sched.h:312:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/alt_sched.h:312:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/alt_sched.h:312:25: sparse:    struct task_struct *
   kernel/sched/alt_core.c:1138:37: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/alt_core.c:1138:37: sparse:    struct task_struct *
   kernel/sched/alt_core.c:1138:37: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/alt_sched.h:312:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/alt_sched.h:312:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/alt_sched.h:312:25: sparse:    struct task_struct *
   kernel/sched/alt_core.c:1138:37: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/alt_core.c:1138:37: sparse:    struct task_struct *
   kernel/sched/alt_core.c:1138:37: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/alt_core.c:1138:37: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/alt_core.c:1138:37: sparse:    struct task_struct *
   kernel/sched/alt_core.c:1138:37: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/alt_core.c:1138:37: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/alt_core.c:1138:37: sparse:    struct task_struct *
   kernel/sched/alt_core.c:1138:37: sparse:    struct task_struct [noderef] __rcu *

vim +/rt_mutex_futex_pre_schedule +5356 kernel/sched/alt_core.c

  5351	
  5352	/*
  5353	 * Used within the futex syscall context, skips sched_submit_work() because none
  5354	 * its work will be done. Asserts ensure that it is indeed the case.
  5355	 */
> 5356	void rt_mutex_futex_pre_schedule(void)
  5357	{
  5358		lockdep_assert(!(current->flags & (PF_WQ_WORKER | PF_IO_WORKER)));
  5359		lockdep_assert(!current->plug);
  5360		lockdep_assert(!fetch_and_set(current->sched_rt_mutex, 1));
  5361	}
  5362	
  5363	void rt_mutex_schedule(void)
  5364	{
  5365		lockdep_assert(current->sched_rt_mutex);
  5366		__schedule_loop(SM_NONE);
  5367	}
  5368	
  5369	void rt_mutex_post_schedule(void)
  5370	{
  5371		sched_update_worker(current);
  5372		lockdep_assert(fetch_and_set(current->sched_rt_mutex, 0));
  5373	}
  5374	
> 5375	void rt_mutex_futex_post_schedule(void)
  5376	{
  5377		lockdep_assert(fetch_and_set(current->sched_rt_mutex, 0));
  5378	}
  5379	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
