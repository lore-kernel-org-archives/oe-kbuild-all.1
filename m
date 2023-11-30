Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7FBD3C696
	for <oe-kbuild-all@lists.linux.dev>; Thu, 30 Nov 2023 11:53:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Kz1w6gqs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701345182; x=1732881182;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=0Gt2UZAjEwYmWwiumaNgxcRIzmBls0in7o8ASJS1fEA=;
  b=Kz1w6gqs50a1kD5RoxPyUwFLqJt38wW91UV5eriMMfiKHUD8rCGk+JWN
   nXL9bbhhYlCRUJt/aQfNPKLM7aQMAoiDGfsRQl7fuBn31YqFu5QQHFl5t
   e9016P42UZmM5Vr3SWHCP3iraV9biW1wAK++Vt2VXO3jkw4KrN5umVvlL
   NAUL2Qt80zvWxGZfR8JSCYiyi/dh1H9YGQjM5lUDxF3i26r8hzCQIdAZN
   FEn0zG8VyciJFvgfemHeoLXH+b/9xQeOvvWI3lRdEexdVchkU86SDOm13
   7Yjb/rLSlGSRo5fJg2i1WJ8IT7PMZpS6AgD4oijMDfMp1gMBiVhemiOqW
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10909"; a="372691977"
X-IronPort-AV: E=Sophos;i="6.04,237,1695711600"; 
   d="scan'208";a="372691977"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Nov 2023 03:52:59 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10909"; a="1100918757"
X-IronPort-AV: E=Sophos;i="6.04,237,1695711600"; 
   d="scan'208";a="1100918757"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga005.fm.intel.com with ESMTP; 30 Nov 2023 03:52:58 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r8fbD-0001o5-0r;
	Thu, 30 Nov 2023 11:52:55 +0000
Date: Thu, 30 Nov 2023 19:51:59 +0800
From: kernel test robot <lkp@intel.com>
To: Frederic Weisbecker <frederic@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frederic-dynticks:rcu/dev 2/5] kernel/rcu/tree.c:2715: undefined
 reference to `call_rcu_nocb'
Message-ID: <202311301912.uoJ3yQUe-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/frederic/linux-dynticks.git rcu/dev
head:   747bcee76f689e850284b297c4174b9303445d1a
commit: cae6d648e4b784e345810ceb21dfdb9f9b5e7841 [2/5] rcu/nocb: Re-arrange call_rcu() NOCB specific code
config: x86_64-buildonly-randconfig-002-20231130 (https://download.01.org/0day-ci/archive/20231130/202311301912.uoJ3yQUe-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231130/202311301912.uoJ3yQUe-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311301912.uoJ3yQUe-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: kernel/rcu/tree.o: in function `__call_rcu_common':
>> kernel/rcu/tree.c:2715: undefined reference to `call_rcu_nocb'


vim +2715 kernel/rcu/tree.c

  2669	
  2670	static void
  2671	__call_rcu_common(struct rcu_head *head, rcu_callback_t func, bool lazy_in)
  2672	{
  2673		static atomic_t doublefrees;
  2674		unsigned long flags;
  2675		bool lazy;
  2676		struct rcu_data *rdp;
  2677	
  2678		/* Misaligned rcu_head! */
  2679		WARN_ON_ONCE((unsigned long)head & (sizeof(void *) - 1));
  2680	
  2681		if (debug_rcu_head_queue(head)) {
  2682			/*
  2683			 * Probable double call_rcu(), so leak the callback.
  2684			 * Use rcu:rcu_callback trace event to find the previous
  2685			 * time callback was passed to call_rcu().
  2686			 */
  2687			if (atomic_inc_return(&doublefrees) < 4) {
  2688				pr_err("%s(): Double-freed CB %p->%pS()!!!  ", __func__, head, head->func);
  2689				mem_dump_obj(head);
  2690			}
  2691			WRITE_ONCE(head->func, rcu_leak_callback);
  2692			return;
  2693		}
  2694		head->func = func;
  2695		head->next = NULL;
  2696		kasan_record_aux_stack_noalloc(head);
  2697		local_irq_save(flags);
  2698		rdp = this_cpu_ptr(&rcu_data);
  2699		lazy = lazy_in && !rcu_async_should_hurry();
  2700	
  2701		/* Add the callback to our list. */
  2702		if (unlikely(!rcu_segcblist_is_enabled(&rdp->cblist))) {
  2703			// This can trigger due to call_rcu() from offline CPU:
  2704			WARN_ON_ONCE(rcu_scheduler_active != RCU_SCHEDULER_INACTIVE);
  2705			WARN_ON_ONCE(!rcu_is_watching());
  2706			// Very early boot, before rcu_init().  Initialize if needed
  2707			// and then drop through to queue the callback.
  2708			if (rcu_segcblist_empty(&rdp->cblist))
  2709				rcu_segcblist_init(&rdp->cblist);
  2710		}
  2711	
  2712		check_cb_ovld(rdp);
  2713	
  2714		if (unlikely(rcu_rdp_is_offloaded(rdp)))
> 2715			call_rcu_nocb(rdp, head, func, flags, lazy);
  2716		else
  2717			call_rcu_core(rdp, head, func, flags);
  2718		local_irq_restore(flags);
  2719	}
  2720	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
