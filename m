Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAB3A34751E
	for <oe-kbuild-all@lists.linux.dev>; Fri, 10 Apr 2026 11:25:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775820335; cv=none; b=rCAeRt68tAPGoRx2QGWU31UlakvTCP+9xto/26g6Ct5uyNn4JdYRcthFIorf3BKUvsb831Cji78WwoAFFQywokXl7m2eopi9AR+EP1qm8luGCuhW6hM5V+Q5FoERDUeMnBxkE+mJEO+KT5zM+5pVeupolSOpUlOuI5IGONDnuOY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775820335; c=relaxed/simple;
	bh=eF0e1b+vaoUgUqMVHuO1/wp7cHImgG/+bkdaQ/EeNiY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ODB+DjmsklWOxq+oJJ3ywTVOOvn/wBoj6h9tgxNvhDlctG4FUv6DkxqB96uJWLwdFmJDIooW5x25SA4DkRv4bxO4F07zY/mlNEDQ7dD9/pCAgcVAY2E/+kuyQSTIOpEhwaoL2Qr+oMBVjMPCB/jx90lgUoP7wjhpe44gavQuPG0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SPDlPFbE; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SPDlPFbE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775820335; x=1807356335;
  h=date:from:to:cc:subject:message-id;
  bh=eF0e1b+vaoUgUqMVHuO1/wp7cHImgG/+bkdaQ/EeNiY=;
  b=SPDlPFbESNZY0uqudJsVMuml1bVAPG9W4VKwBr4bHLnwYVZmk5PIimwF
   ryx9cQJ8n+t5OQJAtgC4T/KPvDNqcPn/N0A6lbN3fNMir5rt4L5V1ccBB
   nbgywd+UyUDnOs3kLZfHABwhMnFRs02PaAEmQskVrD9/mbcU2e2Cnrbrw
   zybtq2n7vvn2JcPX+/veu6rxpkomhjO2MuqpWRmlYhXZln+JmkzI1tQz3
   zgPjE5uaSVPH/SmD5ipCg+4fn/y1JCuwmvdjThYxAfK5N4GrAFmAhkdgC
   UySioIGSGcaB2uwyhIzexIppIhaGzo+RNu7o4KqFBZF2s/nYha2d1M064
   g==;
X-CSE-ConnectionGUID: iq+e38QOT3WjxpEzPnL8PQ==
X-CSE-MsgGUID: U0G3zwbQRnuwfsYIueZ2Hw==
X-IronPort-AV: E=McAfee;i="6800,10657,11754"; a="76855772"
X-IronPort-AV: E=Sophos;i="6.23,171,1770624000"; 
   d="scan'208";a="76855772"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Apr 2026 04:25:34 -0700
X-CSE-ConnectionGUID: dXs0XaO0Rai19J6kGejxmg==
X-CSE-MsgGUID: PxXvgJ55QqKxsA47JhwhQQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,171,1770624000"; 
   d="scan'208";a="252221585"
Received: from lkp-server01.sh.intel.com (HELO 6449335cace3) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 10 Apr 2026 04:25:31 -0700
Received: from kbuild by 6449335cace3 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wB9zN-000000003eL-2ZgP;
	Fri, 10 Apr 2026 11:25:29 +0000
Date: Fri, 10 Apr 2026 19:24:54 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12 0/9]
 kernel/sched/deadline.c:2689:25: error: no member named 'pushable_dl_tasks'
 in 'struct task_struct'
Message-ID: <202604101944.7DfbTtk4-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android16-6.12
head:   91e49117396d06326d151f97f382c6d93a267bea
commit: 02153dcaf1c62548c34d347291c37a9070f163aa [0/9] ANDROID: sched/deadline: Avoid double enqueue_pushable_dl_task() warning
config: x86_64-buildonly-randconfig-002-20260410 (https://download.01.org/0day-ci/archive/20260410/202604101944.7DfbTtk4-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260410/202604101944.7DfbTtk4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604101944.7DfbTtk4-lkp@intel.com/

Note: the android-common/android16-6.12 HEAD 91e49117396d06326d151f97f382c6d93a267bea builds fine.
      It only hurts bisectability.

All errors (new ones prefixed by >>):

   In file included from kernel/sched/build_policy.c:60:
>> kernel/sched/deadline.c:2689:25: error: no member named 'pushable_dl_tasks' in 'struct task_struct'
    2689 |         if (!RB_EMPTY_NODE(&p->pushable_dl_tasks))
         |                             ~  ^
   include/linux/rbtree.h:34:4: note: expanded from macro 'RB_EMPTY_NODE'
      34 |         ((node)->__rb_parent_color == (unsigned long)(node))
         |           ^~~~
   In file included from kernel/sched/build_policy.c:60:
>> kernel/sched/deadline.c:2689:25: error: no member named 'pushable_dl_tasks' in 'struct task_struct'
    2689 |         if (!RB_EMPTY_NODE(&p->pushable_dl_tasks))
         |                             ~  ^
   include/linux/rbtree.h:34:48: note: expanded from macro 'RB_EMPTY_NODE'
      34 |         ((node)->__rb_parent_color == (unsigned long)(node))
         |                                                       ^~~~
   2 errors generated.


vim +2689 kernel/sched/deadline.c

  2661	
  2662	static void put_prev_task_dl(struct rq *rq, struct task_struct *p, struct task_struct *next)
  2663	{
  2664		struct sched_dl_entity *dl_se = &p->dl;
  2665		struct dl_rq *dl_rq = &rq->dl;
  2666	
  2667		if (on_dl_rq(&p->dl))
  2668			update_stats_wait_start_dl(dl_rq, dl_se);
  2669	
  2670		update_curr_dl(rq);
  2671	
  2672		update_dl_rq_load_avg(rq_clock_pelt(rq), rq, 1);
  2673	
  2674		if (task_is_blocked(p))
  2675			return;
  2676	
  2677		/*
  2678		 * With proxy-exec its possible the following call
  2679		 * chain from update_curr_dl() called above has already
  2680		 * added us to the pushable list:
  2681		 * update_curr_dl()
  2682		 * -> update_curr_dl_se()
  2683		 *    -> enqueue_task_dl()
  2684		 *       -> enqueue_pushable_dl_task()
  2685		 *
  2686		 * So check if we're already added to make sure we don't
  2687		 * get added twice
  2688		 */
> 2689		if (!RB_EMPTY_NODE(&p->pushable_dl_tasks))
  2690			return;
  2691	
  2692		if (on_dl_rq(&p->dl) && p->nr_cpus_allowed > 1)
  2693			enqueue_pushable_dl_task(rq, p);
  2694	}
  2695	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
