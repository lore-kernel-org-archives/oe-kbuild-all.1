Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08056376E2
	for <oe-kbuild-all@lists.linux.dev>; Sun, 21 Jan 2024 15:25:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.55.52.88
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705850718; cv=none; b=LzqegFQyL+4uSFe8HYb0LQ8GbdLiJ6VKFr0FF6UIfk5hpQjSky+234WTKvRmD4BOxtxh9CC0kgjvv/JTgujikWFxS7MXgSh0Y51rTiK0/9zOfc6qyyNgYwmTaPtsZK1GKszO254FzKpKzqyFvS2eaJQ0PvYC1R6TImc3zjFVtP4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705850718; c=relaxed/simple;
	bh=NSjrwCBF7F2Xow1qzXt4ZyStc+yd4Zk6V1XTUYvoTKo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=gUsMmjKIWNrX1oLlxP0jCF9TQmgbDf0YtsFYsXv3WRaUsarmfo40yuE/rVtxb90wTN3nDIrFQ5zrW3X6tO1izY0lE+/Y2Ais84hAjx5u5ZycDNW47zdA8CSP7StIy2PwD4V2UFaLk3h1CXO4YC+QF7/8xaX64ED6z6HcwmVPlQs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TNmzNbhm; arc=none smtp.client-ip=192.55.52.88
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TNmzNbhm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1705850717; x=1737386717;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=NSjrwCBF7F2Xow1qzXt4ZyStc+yd4Zk6V1XTUYvoTKo=;
  b=TNmzNbhmPzvTQQhTXYn6HUT35eGdVJUWtrcFJvL2jrlK2XWMjYigXhQV
   Dg013KHDPCwXHbL4PRjwExtJi4BUTdK/MZD0fMWoh3dCz/BXQbTJ0PX28
   n5uRr1fwsA6gvY8Hz6wMtRSwpQIL2pb15a8DJCYGe5qmnBgGgK8EwcdSW
   TLfeoJLMlUdLlftjNR9FI4d2vb7tyAMDdpRLsDfMGaO5dwzmmdFdQeGP8
   wyz69UoCJHuWItMUz+xdaVEUC+GvJEysK9SBvYozikEYNuMyswVoSbZH1
   CnUcP7tg7SJGqCzWDdCTyhK3M7PvrQLzNQeFIrWly9TqC+wgmOIgeilKz
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10960"; a="432211723"
X-IronPort-AV: E=Sophos;i="6.05,210,1701158400"; 
   d="scan'208";a="432211723"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jan 2024 07:25:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10960"; a="785459303"
X-IronPort-AV: E=Sophos;i="6.05,210,1701158400"; 
   d="scan'208";a="785459303"
Received: from lkp-server01.sh.intel.com (HELO 961aaaa5b03c) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 21 Jan 2024 07:25:14 -0800
Received: from kbuild by 961aaaa5b03c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rRZhA-00060o-0Z;
	Sun, 21 Jan 2024 15:25:12 +0000
Date: Sun, 21 Jan 2024 23:24:14 +0800
From: kernel test robot <lkp@intel.com>
To: Qais Yousef <qyousef@layalina.io>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [qais-yousef:uclamp-max-aggregation 9/13]
 kernel/sched/core.c:5146:14: error: 'struct cfs_rq' has no member named
 'decayed'
Message-ID: <202401212311.oh0voGkC-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/qais-yousef/linux uclamp-max-aggregation
head:   b3351efb09c57b5535e5c450373b579b17d5d7fa
commit: c4beee22462b6901c44432014931880056821b2d [9/13] sched: Consolidate cpufreq updates
config: i386-buildonly-randconfig-002-20240121 (https://download.01.org/0day-ci/archive/20240121/202401212311.oh0voGkC-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240121/202401212311.oh0voGkC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401212311.oh0voGkC-lkp@intel.com/

All errors (new ones prefixed by >>):

   kernel/sched/core.c: In function 'update_cpufreq_ctx_switch':
>> kernel/sched/core.c:5146:14: error: 'struct cfs_rq' has no member named 'decayed'
      if (rq->cfs.decayed) {
                 ^
   kernel/sched/core.c:5147:11: error: 'struct cfs_rq' has no member named 'decayed'
       rq->cfs.decayed = false;
              ^
>> kernel/sched/core.c:5157:20: error: 'struct cfs_rq' has no member named 'avg'
      rq_util = rq->cfs.avg.util_avg;
                       ^


vim +5146 kernel/sched/core.c

  5127	
  5128	static inline void update_cpufreq_ctx_switch(struct rq *rq)
  5129	{
  5130		if (unlikely(current->sched_class == &stop_sched_class))
  5131			return;
  5132	
  5133		if (unlikely(current->sched_class == &idle_sched_class))
  5134			return;
  5135	
  5136		if (unlikely(task_has_idle_policy(current)))
  5137			return;
  5138	
  5139		if (likely(fair_policy(current->policy))) {
  5140			unsigned long uclamp_min, uclamp_max;
  5141			unsigned long rq_util;
  5142	
  5143			/*
  5144			 * Allow cpufreq updates once for every update_load_avg() decay.
  5145			 */
> 5146			if (rq->cfs.decayed) {
  5147				rq->cfs.decayed = false;
  5148				goto force_update;
  5149			}
  5150	
  5151			if (current->in_iowait)
  5152				goto force_update;
  5153	
  5154			/* Force an update if perf hints are required to be applied */
  5155			uclamp_min = uclamp_eff_value(current, UCLAMP_MIN);
  5156			uclamp_max = uclamp_eff_value(current, UCLAMP_MIN);
> 5157			rq_util = rq->cfs.avg.util_avg;
  5158	
  5159			if (uclamp_min > rq_util || uclamp_max < rq_util)
  5160				goto force_update;
  5161	
  5162			return;
  5163		}
  5164	
  5165		/* RT and DL should always send a freq update */
  5166	
  5167		/* XXX ignore updates for sugov worker thread */
  5168	
  5169	force_update:
  5170	
  5171		/*
  5172		 * Request freq update after __balance_callbacks to take into account
  5173		 * any changes to rq.
  5174		 */
  5175		cpufreq_update_util(rq, current->in_iowait ? SCHED_CPUFREQ_IOWAIT : 0);
  5176	}
  5177	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
