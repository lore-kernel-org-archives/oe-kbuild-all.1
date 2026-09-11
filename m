Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F25B4772A5
	for <oe-kbuild-all@lists.linux.dev>; Fri, 11 Sep 2026 12:45:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789130760; cv=none; b=YVTlRzaZIdR5OLt01DEqKkuHMyKcRPEVV2b7bsQjF+EU3zoqynfGq65REZ6uAk/kAvlgAYE7oCTRpl97EmXvYWUz2fQcbtLTLcuhLKpWf0prmx3vq+u1BudITUpJ431z6hlWkwzvG7DQnxdj2TNjmUg1PsivWsMPfXGYSwKGqQY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789130760; c=relaxed/simple;
	bh=7QUbL3qFsHUJR2shdzSNRvRWjedTJomrvRWDOQe5CFA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=abxRxfvNKKMBr7BrCr2pfYodOlc2RmGrDUhn60paFbD2pfT+zogzb19cmmNJpRqzO6iSSpJUfIPHqoUaCzeTVLG97i1elclb2Zm2+f/d4ONGzLYNxQ3IaR3YM1ScmYLx8JX9fG3mvs8U1lAYJt3OvuN/keaMF/XEvbhhTB/+nK4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gojh5iZA; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gojh5iZA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789130758; x=1820666758;
  h=date:from:to:cc:subject:message-id;
  bh=7QUbL3qFsHUJR2shdzSNRvRWjedTJomrvRWDOQe5CFA=;
  b=gojh5iZAMLG+G066+xefIdhmCStptuHVoVel/ZOIgBQIyVkPMGDiiI1J
   ugyXEp7eszBRWioMKW/xpv5YGuK2QKsf8pYpddRtKzK3e1DLCi/dQ/gcI
   ug1gxgfTbW6I/EmX7rAi+nDyRe9ZxZiauU1N93FSBYJIJwm51m0VS21px
   0wGG97QNvhylYAkS5DALl6KdYJCQLmXpiKT8OhKrZAq13fkVvj/VftSwI
   yQo9tA91mmS6uYi1jxWEgvoF6SXcrtWryFHswrpG237xw8+DVb0mnSxWI
   hOuTnpq0prV8Bd81wj9w22bMmnczySLWrwFzD40s2LVbWhg1K/Tvytikp
   Q==;
X-CSE-ConnectionGUID: dxmtd8EuRe6ITmoRJoVHzw==
X-CSE-MsgGUID: 2ErcY39vT3SOK4xGzUh6gw==
X-IronPort-AV: E=McAfee;i="6800,10657,11901"; a="101113290"
X-IronPort-AV: E=Sophos;i="6.27,97,1787036400"; 
   d="scan'208";a="101113290"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Sep 2026 05:45:57 -0700
X-CSE-ConnectionGUID: tg8OFrs2R4KSuNHU1Y5ejA==
X-CSE-MsgGUID: wnUV1/G2QNKpGVVUJCMLAw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,97,1787036400"; 
   d="scan'208";a="301806713"
Received: from lkp-server02.sh.intel.com (HELO 0a3643a6ed9d) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 11 Sep 2026 05:45:56 -0700
Received: from kbuild by 0a3643a6ed9d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x50ci-000000001Xj-0uKY;
	Fri, 11 Sep 2026 12:45:15 +0000
Date: Fri, 11 Sep 2026 20:41:51 +0800
From: kernel test robot <lkp@intel.com>
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [paulmckrcu:dev.2026.09.09a 42/56]
 kernel/rcu/tree_stall.h:332:29: error: implicit declaration of function
 'rt_mutex_owner'; did you mean 'rt_mutex_init'?
Message-ID: <202609112046.0850pdpM-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/paulmckrcu/linux dev.2026.09.09a
head:   d61d9b5dd56c6cf72b70bb5fb52b213ead9f7765
commit: e33488c41be623f7c7ef5b8763e20c45f1364d1c [42/56] rcu: Add running and boosted indications to RCU task stall dump
config: s390-randconfig-r133-20260911 (https://download.01.org/0day-ci/archive/20260911/202609112046.0850pdpM-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 11.5.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260911/202609112046.0850pdpM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609112046.0850pdpM-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from kernel/rcu/tree.c:5112:
   kernel/rcu/tree_stall.h: In function 'check_slow_task':
>> kernel/rcu/tree_stall.h:332:29: error: implicit declaration of function 'rt_mutex_owner'; did you mean 'rt_mutex_init'? [-Werror=implicit-function-declaration]
     332 |                         if (rt_mutex_owner(&rnp->boost_mtx.rtmutex) == t)
         |                             ^~~~~~~~~~~~~~
         |                             rt_mutex_init
>> kernel/rcu/tree_stall.h:332:69: warning: comparison between pointer and integer
     332 |                         if (rt_mutex_owner(&rnp->boost_mtx.rtmutex) == t)
         |                                                                     ^~
   In file included from kernel/rcu/tree_plugin.h:14,
                    from kernel/rcu/tree.c:5115:
   kernel/rcu/../locking/rtmutex_common.h: At top level:
>> kernel/rcu/../locking/rtmutex_common.h:231:35: error: conflicting types for 'rt_mutex_owner'; have 'struct task_struct *(struct rt_mutex_base *)'
     231 | static inline struct task_struct *rt_mutex_owner(struct rt_mutex_base *lock)
         |                                   ^~~~~~~~~~~~~~
   In file included from kernel/rcu/tree.c:5112:
   kernel/rcu/tree_stall.h:332:29: note: previous implicit declaration of 'rt_mutex_owner' with type 'int()'
     332 |                         if (rt_mutex_owner(&rnp->boost_mtx.rtmutex) == t)
         |                             ^~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +332 kernel/rcu/tree_stall.h

   311	
   312	/*
   313	 * Report out the state of a not-running task that is stalling the
   314	 * current RCU grace period.
   315	 */
   316	static int check_slow_task(struct task_struct *t, void *arg)
   317	{
   318		struct rcu_node *rnp;
   319		struct rcu_stall_chk_rdr *rscrp = arg;
   320	
   321		if (task_curr(t))
   322			return -EBUSY; // It is running, so decline to inspect it.
   323		rscrp->nesting = t->rcu_read_lock_nesting;
   324		rscrp->rs = t->rcu_read_unlock_special;
   325		rscrp->on_blkd_list = !list_empty(&t->rcu_node_entry);
   326		rscrp->rcu_rdr_running = task_curr(t);
   327		rscrp->rcu_rdr_boosted = 0;
   328		if (rscrp->on_blkd_list) {
   329			rnp = READ_ONCE(t->rcu_blocked_node);
   330			raw_spin_lock_rcu_node(rnp); /* irqs already disabled. */
   331			if (rnp == READ_ONCE(t->rcu_blocked_node)) {
 > 332				if (rt_mutex_owner(&rnp->boost_mtx.rtmutex) == t)
   333					rscrp->rcu_rdr_boosted = 1;
   334			} else {
   335				rscrp->rcu_rdr_boosted = 2;
   336			}
   337			raw_spin_unlock_rcu_node(rnp); /* irqs remain disabled. */
   338		}
   339		return 0;
   340	}
   341	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
