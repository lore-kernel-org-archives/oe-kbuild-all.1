Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 739CA6BB5B
	for <oe-kbuild-all@lists.linux.dev>; Thu, 11 Dec 2025 02:12:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765419149; cv=none; b=Ru26/ubnDvJxfYYGpa/J5R8smMqqJ0IZXU3/ZRf5lvazgjatLTldQoRR5+UwAvsPSnUopLgSc9H43eRYSwJ/wzUUsPuzfhcqq9cnENOjKOHHdXp1SSO5POTfKWVgqluUrjLH3MRLCogjF3WCSp1+xayMum0w4WDf5rM1jdBwTfA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765419149; c=relaxed/simple;
	bh=chR3gkQnebwgWw2X5R6JuPWt7ltbsMppx2sz316PbRo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=haELi23VwY2nKgdyq3zqrCUwoZxZzFtJm+zinz9NvjSytKaghVa2q4ytPbBQ0+s62c0deIRS/kWcj8OeN3U6dlaGXgqhvaJ6U1nN7teMVONDOWh/z3d0yB69rP3n8h1N8Hpmqet3tq82E9jaIVKWux9krRp9qjB9q6DiIRSNgi4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=P+fOwlHU; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="P+fOwlHU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765419147; x=1796955147;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=chR3gkQnebwgWw2X5R6JuPWt7ltbsMppx2sz316PbRo=;
  b=P+fOwlHUVfbAp4tCNDUkartWLA+f0W9EdxsUUVjogd6d2FIp1qjdQK0w
   AwRxrL8n7I3XWTOOQVXzEL1fcm/4EBwuXbLtVBvM+bPaxKPa57m7IzMSH
   HCl1R0Lc/U4YoQDKndrLrc29PJtXAI+RFvE6lAap/40vP7rJHPBMutTcZ
   Pc36HRhyJIZB33fbNTw1tyP3vOKIsNTv7fNoPHCL9GEcriwZ2oSg2ZAtY
   /VWFJEvqdoq0rLIZN//RTTfvBWjZ8KnMnplwkocs8knZwLmgjb4d+kDW+
   uFL9EOyDKWGhuvSQMKhrF/fHC/UVExITCPP/h1M30bE6OiEzEQrdEA9VN
   Q==;
X-CSE-ConnectionGUID: sC6FDs7xQ/qpBL16Hgxg5A==
X-CSE-MsgGUID: wMDMLcEvRvqB9IWg9jjyCA==
X-IronPort-AV: E=McAfee;i="6800,10657,11638"; a="71245203"
X-IronPort-AV: E=Sophos;i="6.20,265,1758610800"; 
   d="scan'208";a="71245203"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Dec 2025 18:12:26 -0800
X-CSE-ConnectionGUID: uIzsS5zhTj2YQrsOW35OxQ==
X-CSE-MsgGUID: W1EfnWksRoOBSQXYET6tGA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,265,1758610800"; 
   d="scan'208";a="196680884"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 10 Dec 2025 18:12:26 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vTWAJ-00000000419-0ZuE;
	Thu, 11 Dec 2025 02:12:23 +0000
Date: Thu, 11 Dec 2025 10:11:45 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12-desktop 1/1]
 kernel/sched/fair.c:5601:6: warning: no previous prototype for
 'set_next_entity'
Message-ID: <202512111003.2ns0KvhQ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android16-6.12-desktop
head:   1594e8fdf0af3790482e1d7e4d4dd3e5166f4f22
commit: 2de397d27cc96f1ad08bcebac14911aa5f0501e7 [1/1] ANDROID: sched: Export set_next_entity
config: x86_64-buildonly-randconfig-005-20251211 (https://download.01.org/0day-ci/archive/20251211/202512111003.2ns0KvhQ-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251211/202512111003.2ns0KvhQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512111003.2ns0KvhQ-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/sched/fair.c:5601:6: warning: no previous prototype for 'set_next_entity' [-Wmissing-prototypes]
    5601 | void set_next_entity(struct cfs_rq *cfs_rq, struct sched_entity *se)
         |      ^~~~~~~~~~~~~~~


vim +/set_next_entity +5601 kernel/sched/fair.c

  5600	
> 5601	void set_next_entity(struct cfs_rq *cfs_rq, struct sched_entity *se)
  5602	{
  5603		clear_buddies(cfs_rq, se);
  5604	
  5605		/* 'current' is not kept within the tree. */
  5606		if (se->on_rq) {
  5607			/*
  5608			 * Any task has to be enqueued before it get to execute on
  5609			 * a CPU. So account for the time it spent waiting on the
  5610			 * runqueue.
  5611			 */
  5612			update_stats_wait_end_fair(cfs_rq, se);
  5613			__dequeue_entity(cfs_rq, se);
  5614			update_load_avg(cfs_rq, se, UPDATE_TG);
  5615			/*
  5616			 * HACK, stash a copy of deadline at the point of pick in vlag,
  5617			 * which isn't used until dequeue.
  5618			 */
  5619			se->vlag = se->deadline;
  5620		}
  5621	
  5622		update_stats_curr_start(cfs_rq, se);
  5623		SCHED_WARN_ON(cfs_rq->curr);
  5624		cfs_rq->curr = se;
  5625	
  5626		/*
  5627		 * Track our maximum slice length, if the CPU's load is at
  5628		 * least twice that of our own weight (i.e. don't track it
  5629		 * when there are only lesser-weight tasks around):
  5630		 */
  5631		if (schedstat_enabled() &&
  5632		    rq_of(cfs_rq)->cfs.load.weight >= 2*se->load.weight) {
  5633			struct sched_statistics *stats;
  5634	
  5635			stats = __schedstats_from_se(se);
  5636			__schedstat_set(stats->slice_max,
  5637					max((u64)stats->slice_max,
  5638					    se->sum_exec_runtime - se->prev_sum_exec_runtime));
  5639		}
  5640	
  5641		se->prev_sum_exec_runtime = se->sum_exec_runtime;
  5642	}
  5643	EXPORT_SYMBOL_GPL(set_next_entity);
  5644	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
