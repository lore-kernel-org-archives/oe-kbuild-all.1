Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2B3014275
	for <oe-kbuild-all@lists.linux.dev>; Sun,  4 Feb 2024 08:58:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707037106; cv=none; b=Dqly+waW92GJPaMUuHZlO1BJmS6fWp+UprzhTwwqzGaF0ldgmQlZdPbbHV3LOPl5S/2lgJpoTs1KJ9TcbtTCgzO4Zr7dtJioTYGkN6yu5GjSckkm7IWsDg8bwlmH8ZAM83uvDdMBrMYq5qYhN3AXwJ4nR0Gx7myw29L1VYQTZ/U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707037106; c=relaxed/simple;
	bh=8jpNOSzFasM+HSeXw6TzgytStlhA65bfmYu2O9kpDHE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=r72uq4fsK6zqApzUNbU+WMDYODCzxp2HMgt/SqbqFJru26L+5DOcdKMEjuzJqCT8EN43pxLGHvgAfZnfLIX+aq3k7EgBw+fb6/xFtPqX2QBuzy1QZp2nVhKDx7Qecposvcmt3TZVrItyYGeN1Rh2o6+MjRBCh6Ni8cswqD9FtWE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Lv3LgYyK; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Lv3LgYyK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707037104; x=1738573104;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=8jpNOSzFasM+HSeXw6TzgytStlhA65bfmYu2O9kpDHE=;
  b=Lv3LgYyKgo3eEcOI5PnABePL/XHFgk+oMzx09RCV76CT/zHpGI41k0iI
   /EDOI0PalpA5mhPnIbII1H3F3U6pxUxGPGUfwPSRy1I1PZcHOUNRv8Hqu
   /iKRyEvPhO8qI78UM+0b6zmxIv44rEOZKhvjXHm6a61zP4FEfrJu8/zQu
   6ZK5UwA1N/BFe4jdO+sQH2SnqXFN8gVpBveXQgIyxQujN4QTYS8mOJN5e
   LKBtzyjI22ZFliPsXSZVHTzObjduHeO6jzKRFaa8RlhZpJYkVLZsK47Y8
   oSgwwVyj6nBiPcROaQBNIPbt3ijcIi1x7V3HA7Lx3uVBmciU3xNYNFL+U
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10973"; a="25824867"
X-IronPort-AV: E=Sophos;i="6.05,242,1701158400"; 
   d="scan'208";a="25824867"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Feb 2024 00:58:23 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,242,1701158400"; 
   d="scan'208";a="5053803"
Received: from lkp-server02.sh.intel.com (HELO 59f4f4cd5935) ([10.239.97.151])
  by orviesa005.jf.intel.com with ESMTP; 04 Feb 2024 00:58:22 -0800
Received: from kbuild by 59f4f4cd5935 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rWYKR-0006BH-1W;
	Sun, 04 Feb 2024 08:58:19 +0000
Date: Sun, 4 Feb 2024 16:57:13 +0800
From: kernel test robot <lkp@intel.com>
To: Qais Yousef <qais.yousef@arm.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [qais-yousef:overutilized-affinity 2/2] kernel/sched/fair.c:12694:9:
 error: implicit declaration of function 'set_task_max_allowed_capacity'
Message-ID: <202402041657.yeJn6c06-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/qais-yousef/linux overutilized-affinity
head:   22d6e6b5c20133897944454d2ca4924389d2da90
commit: 3c515086c41e884b65c919541cc1bb563be80ed6 [2/2] sched/fair: Check a task has a fitting cpu when updating misfit
config: i386-buildonly-randconfig-002-20240204 (https://download.01.org/0day-ci/archive/20240204/202402041657.yeJn6c06-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240204/202402041657.yeJn6c06-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402041657.yeJn6c06-lkp@intel.com/

All errors (new ones prefixed by >>):

   kernel/sched/fair.c: In function 'task_fork_fair':
>> kernel/sched/fair.c:12694:9: error: implicit declaration of function 'set_task_max_allowed_capacity' [-Werror=implicit-function-declaration]
   12694 |         set_task_max_allowed_capacity(p);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/sched/fair.c: At top level:
   kernel/sched/fair.c:13150:6: warning: no previous prototype for 'free_fair_sched_group' [-Wmissing-prototypes]
   13150 | void free_fair_sched_group(struct task_group *tg) { }
         |      ^~~~~~~~~~~~~~~~~~~~~
   kernel/sched/fair.c:13152:5: warning: no previous prototype for 'alloc_fair_sched_group' [-Wmissing-prototypes]
   13152 | int alloc_fair_sched_group(struct task_group *tg, struct task_group *parent)
         |     ^~~~~~~~~~~~~~~~~~~~~~
   kernel/sched/fair.c:13157:6: warning: no previous prototype for 'online_fair_sched_group' [-Wmissing-prototypes]
   13157 | void online_fair_sched_group(struct task_group *tg) { }
         |      ^~~~~~~~~~~~~~~~~~~~~~~
   kernel/sched/fair.c:13159:6: warning: no previous prototype for 'unregister_fair_sched_group' [-Wmissing-prototypes]
   13159 | void unregister_fair_sched_group(struct task_group *tg) { }
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +/set_task_max_allowed_capacity +12694 kernel/sched/fair.c

 12678	
 12679	/*
 12680	 * called on fork with the child task as argument from the parent's context
 12681	 *  - child not yet on the tasklist
 12682	 *  - preemption disabled
 12683	 */
 12684	static void task_fork_fair(struct task_struct *p)
 12685	{
 12686		struct sched_entity *se = &p->se, *curr;
 12687		struct cfs_rq *cfs_rq;
 12688		struct rq *rq = this_rq();
 12689		struct rq_flags rf;
 12690	
 12691		rq_lock(rq, &rf);
 12692		update_rq_clock(rq);
 12693	
 12694		set_task_max_allowed_capacity(p);
 12695	
 12696		cfs_rq = task_cfs_rq(current);
 12697		curr = cfs_rq->curr;
 12698		if (curr)
 12699			update_curr(cfs_rq);
 12700		place_entity(cfs_rq, se, ENQUEUE_INITIAL);
 12701		rq_unlock(rq, &rf);
 12702	}
 12703	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
