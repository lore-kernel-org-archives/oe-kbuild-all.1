Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D86C91C4A1C
	for <oe-kbuild-all@lists.linux.dev>; Fri, 20 Dec 2024 16:50:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734713452; cv=none; b=GKww9mxu7W6vr+f8ZhkUJOPLIth4nHyg0SdDTmzi+56Cc++quQdD9ROOvOXrPSSrFDBCHOdIYnnBBdlvQKAjARrCdZ43tBQAJF4hWiAMR/8PiNLwkxCejKqiVhR0RPT/7zebmHkpkAHXDoKrGxdPjzRXaKN6oNYp8SJ1ew8xXdk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734713452; c=relaxed/simple;
	bh=lwbQqyqbKMO1ZvAbQG/Fj+OUecPlaMpUkYB8UzkjfA8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=HfxLW3zRHk4s83dIWTtl7fL/teCgOD2dZ5ct8nxv+bgq6js/IcqeKXr3DQVgOJyVjMw2NHWgklDZniaMJGqKTwd9/tBg988+iJR9pxzf57bHW99jvAoLXBGJGC0Bl8O2I5Ey9zL71f9zoXjkvwRoALcY3AXZmUkwBs39cdseBbs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ACI4gztf; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ACI4gztf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734713451; x=1766249451;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=lwbQqyqbKMO1ZvAbQG/Fj+OUecPlaMpUkYB8UzkjfA8=;
  b=ACI4gztfMfHfTOFI3U5Bzq9pNKjldgOVIicQKvxCvNMDi9jHUKrn/dBQ
   Pewbj4QVwbIuY9vvI5O2N+hLwjOeO+2zdR/zR09L73vgm3I7MqCqA1W2Y
   U3/3BKp17u1+wN74+abIiCoa/LBeCshjFF6ooT5Bq06KyB1iZjJBNNpFo
   TYhDtW1e+okmS9cv7t+22uVTDZG5xqNHY+9blV7PoXYBsTULNlP2YuWsV
   z15I2lN/hy4PgKVyePTO0UQHDx3QNLlhz/B+AcltSIaARZlARBo06QJiz
   fJZw6U6H7uCSUXglj7WstMolKWqw2KvUB7C9oqfMKMikDp8/SRvNXJBcU
   A==;
X-CSE-ConnectionGUID: +MyNkV5tTqevyESe33J00w==
X-CSE-MsgGUID: sPAJNuoCQouLyyXO+X9ifQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11292"; a="38951311"
X-IronPort-AV: E=Sophos;i="6.12,251,1728975600"; 
   d="scan'208";a="38951311"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Dec 2024 08:50:51 -0800
X-CSE-ConnectionGUID: /m8/6GnuRm2vgshRyMtMFA==
X-CSE-MsgGUID: hUGjldl6Qh6X8McgzWnegQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="99032158"
Received: from lkp-server01.sh.intel.com (HELO a46f226878e0) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 20 Dec 2024 08:50:49 -0800
Received: from kbuild by a46f226878e0 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tOgD9-0001R9-1I;
	Fri, 20 Dec 2024 16:50:47 +0000
Date: Sat, 21 Dec 2024 00:49:52 +0800
From: kernel test robot <lkp@intel.com>
To: Hao Jia <jiahao1@lixiang.com>
Cc: oe-kbuild-all@lists.linux.dev, Peter Zijlstra <peterz@infradead.org>
Subject: [peterz-queue:sched/core 43/43] kernel/sched/fair.c:9402:5: warning:
 "CONFIG_FAIR_GROUP_SCHED" is not defined, evaluates to 0
Message-ID: <202412210014.ngWDPsWj-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git sched/core
head:   9eca7eecba70c32720d1fab922aa6d7ec5dfb6c1
commit: 9eca7eecba70c32720d1fab922aa6d7ec5dfb6c1 [43/43] sched/core: Prioritize migrating eligible tasks in sched_balance_rq()
config: i386-buildonly-randconfig-003-20241220 (https://download.01.org/0day-ci/archive/20241221/202412210014.ngWDPsWj-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241221/202412210014.ngWDPsWj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412210014.ngWDPsWj-lkp@intel.com/

All warnings (new ones prefixed by >>):

   kernel/sched/fair.c: In function 'task_is_ineligible_on_dst_cpu':
>> kernel/sched/fair.c:9402:5: warning: "CONFIG_FAIR_GROUP_SCHED" is not defined, evaluates to 0 [-Wundef]
    9402 | #if CONFIG_FAIR_GROUP_SCHED
         |     ^~~~~~~~~~~~~~~~~~~~~~~
   kernel/sched/fair.c:9407:48: error: 'struct cfs_rq' has no member named 'nr_running'
    9407 |         if (sched_feat(PLACE_LAG) && dst_cfs_rq->nr_running &&
         |                                                ^~


vim +/CONFIG_FAIR_GROUP_SCHED +9402 kernel/sched/fair.c

  9389	
  9390	/*
  9391	 * Check whether the task is ineligible on the destination cpu
  9392	 *
  9393	 * When the PLACE_LAG scheduling feature is enabled and
  9394	 * dst_cfs_rq->nr_running is greater than 1, if the task
  9395	 * is ineligible, it will also be ineligible when
  9396	 * it is migrated to the destination cpu.
  9397	 */
  9398	static inline int task_is_ineligible_on_dst_cpu(struct task_struct *p, int dest_cpu)
  9399	{
  9400		struct cfs_rq *dst_cfs_rq;
  9401	
> 9402	#if CONFIG_FAIR_GROUP_SCHED
  9403		dst_cfs_rq = task_group(p)->cfs_rq[dest_cpu];
  9404	#else
  9405		dst_cfs_rq = &cpu_rq(dest_cpu)->cfs;
  9406	#endif
  9407		if (sched_feat(PLACE_LAG) && dst_cfs_rq->nr_running &&
  9408		    !entity_eligible(task_cfs_rq(p), &p->se))
  9409			return 1;
  9410	
  9411		return 0;
  9412	}
  9413	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
