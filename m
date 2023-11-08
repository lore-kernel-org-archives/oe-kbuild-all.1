Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6ED34DDA2
	for <oe-kbuild-all@lists.linux.dev>; Wed,  8 Nov 2023 09:03:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="epr306bu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699434212; x=1730970212;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=kIV9qk5e1RuLwPy7iacWCQl30YdGgTuf4/kunjO190Y=;
  b=epr306bucHjUQATuT48Hsnb4NCcgeJ2UqDJ32lt/dA+uv16VEmXz2ZxH
   aek9FMbw5v7yZr5XJppTPfC0zc3S6nhZ5Rd8UqcbUfZzNzNULOqvCATJu
   DIOMqPfreP1+6gL/g9XPHdFh9H6cPcq42BBhrUCW+2dWevcl4DNfHlubP
   ZXO7deAxD0WskoeT3vkKS8ZAzpOzjbQxciqFYkmHQQldCN/V/4/6Csd7L
   IZVIPdblb6FaiqbjcaRst5DZprzgFgn6DeBkKpqyJorpIJBTjeO/yZPIJ
   mfXSKuiTO0HTSEJsZCEMIszL/bSXqNX2F4xBhtnLgRpSY4SCarIfO9BUV
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10887"; a="420830578"
X-IronPort-AV: E=Sophos;i="6.03,285,1694761200"; 
   d="scan'208";a="420830578"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Nov 2023 01:03:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10887"; a="739431399"
X-IronPort-AV: E=Sophos;i="6.03,285,1694761200"; 
   d="scan'208";a="739431399"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 08 Nov 2023 01:03:10 -0800
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r0eSq-0007qG-0e;
	Wed, 08 Nov 2023 09:03:08 +0000
Date: Wed, 8 Nov 2023 17:02:27 +0800
From: kernel test robot <lkp@intel.com>
To: Abel Wu <wuyun.abel@bytedance.com>
Cc: oe-kbuild-all@lists.linux.dev, Peter Zijlstra <peterz@infradead.org>
Subject: [peterz-queue:sched/core 18/19] kernel/sched/fair.c:3696:25: error:
 implicit declaration of function 'min_deadline_cb_propagate'; did you mean
 'min_vruntime_cb_propagate'?
Message-ID: <202311081629.NTRLxpiC-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git sched/core
head:   4a97a4d025f6984a0ae7bb2c21ab09a52d4c1c6a
commit: c9647eb51bfc7ada985c2798ce87067c557e2a07 [18/19] sched/eevdf: Sort the rbtree by virtual deadline
config: um-defconfig (https://download.01.org/0day-ci/archive/20231108/202311081629.NTRLxpiC-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231108/202311081629.NTRLxpiC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311081629.NTRLxpiC-lkp@intel.com/

All errors (new ones prefixed by >>):

   kernel/sched/fair.c: In function 'reweight_entity':
>> kernel/sched/fair.c:3696:25: error: implicit declaration of function 'min_deadline_cb_propagate'; did you mean 'min_vruntime_cb_propagate'? [-Werror=implicit-function-declaration]
    3696 |                         min_deadline_cb_propagate(&se->run_node, NULL);
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~
         |                         min_vruntime_cb_propagate
   cc1: some warnings being treated as errors


vim +3696 kernel/sched/fair.c

8d5b9025f9b450 Peter Zijlstra  2017-08-24  3663  
9059393e4ec1c8 Vincent Guittot 2017-05-17  3664  static void reweight_entity(struct cfs_rq *cfs_rq, struct sched_entity *se,
0dacee1bfa70e1 Vincent Guittot 2020-02-24  3665  			    unsigned long weight)
9059393e4ec1c8 Vincent Guittot 2017-05-17  3666  {
86bfbb7ce4f67a Peter Zijlstra  2023-05-31  3667  	unsigned long old_weight = se->load.weight;
86bfbb7ce4f67a Peter Zijlstra  2023-05-31  3668  
9059393e4ec1c8 Vincent Guittot 2017-05-17  3669  	if (se->on_rq) {
9059393e4ec1c8 Vincent Guittot 2017-05-17  3670  		/* commit outstanding execution time */
9059393e4ec1c8 Vincent Guittot 2017-05-17  3671  		if (cfs_rq->curr == se)
9059393e4ec1c8 Vincent Guittot 2017-05-17  3672  			update_curr(cfs_rq);
af4cf40470c22e Peter Zijlstra  2023-05-31  3673  		else
af4cf40470c22e Peter Zijlstra  2023-05-31  3674  			avg_vruntime_sub(cfs_rq, se);
1724b95b92979a Jiang Biao      2020-08-11  3675  		update_load_sub(&cfs_rq->load, se->load.weight);
9059393e4ec1c8 Vincent Guittot 2017-05-17  3676  	}
9059393e4ec1c8 Vincent Guittot 2017-05-17  3677  	dequeue_load_avg(cfs_rq, se);
9059393e4ec1c8 Vincent Guittot 2017-05-17  3678  
9059393e4ec1c8 Vincent Guittot 2017-05-17  3679  	update_load_set(&se->load, weight);
9059393e4ec1c8 Vincent Guittot 2017-05-17  3680  
86bfbb7ce4f67a Peter Zijlstra  2023-05-31  3681  	if (!se->on_rq) {
86bfbb7ce4f67a Peter Zijlstra  2023-05-31  3682  		/*
86bfbb7ce4f67a Peter Zijlstra  2023-05-31  3683  		 * Because we keep se->vlag = V - v_i, while: lag_i = w_i*(V - v_i),
86bfbb7ce4f67a Peter Zijlstra  2023-05-31  3684  		 * we need to scale se->vlag when w_i changes.
86bfbb7ce4f67a Peter Zijlstra  2023-05-31  3685  		 */
86bfbb7ce4f67a Peter Zijlstra  2023-05-31  3686  		se->vlag = div_s64(se->vlag * old_weight, weight);
147f3efaa24182 Peter Zijlstra  2023-05-31  3687  	} else {
147f3efaa24182 Peter Zijlstra  2023-05-31  3688  		s64 deadline = se->deadline - se->vruntime;
147f3efaa24182 Peter Zijlstra  2023-05-31  3689  		/*
147f3efaa24182 Peter Zijlstra  2023-05-31  3690  		 * When the weight changes, the virtual time slope changes and
147f3efaa24182 Peter Zijlstra  2023-05-31  3691  		 * we should adjust the relative virtual deadline accordingly.
147f3efaa24182 Peter Zijlstra  2023-05-31  3692  		 */
147f3efaa24182 Peter Zijlstra  2023-05-31  3693  		deadline = div_s64(deadline * old_weight, weight);
147f3efaa24182 Peter Zijlstra  2023-05-31  3694  		se->deadline = se->vruntime + deadline;
d2929762cc3f85 Peter Zijlstra  2023-10-17  3695  		if (se != cfs_rq->curr)
8dafa9d0eb1a15 Peter Zijlstra  2023-10-06 @3696  			min_deadline_cb_propagate(&se->run_node, NULL);
86bfbb7ce4f67a Peter Zijlstra  2023-05-31  3697  	}
86bfbb7ce4f67a Peter Zijlstra  2023-05-31  3698  

:::::: The code at line 3696 was first introduced by commit
:::::: 8dafa9d0eb1a1550a0f4d462db9354161bc51e0c sched/eevdf: Fix min_deadline heap integrity

:::::: TO: Peter Zijlstra <peterz@infradead.org>
:::::: CC: Peter Zijlstra <peterz@infradead.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
