Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D360630FC1B
	for <oe-kbuild-all@lists.linux.dev>; Tue,  2 Jun 2026 20:50:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780433434; cv=none; b=flyx1P6lR4IrD/fs2KTs34FoLW5C+vmRmPnp4z9plvcvyFy3LcUXW/HLtVkVQO5tRK+5iXY4r+VNRZJk2Ke6DDaX7TH1O2LNvXCG1nwtyXn2gsxG/7MtXVmphhYOu0JuIFL3pHqpyxFTJhN9ejHJFx+d+AOtLDj2hFCSXsJV3q4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780433434; c=relaxed/simple;
	bh=nG6MGnnODQGny2oLTkD1/IusrR6cDKqZaIfS1SvFhZo=;
	h=Date:From:To:Cc:Subject:Message-ID; b=XSbYtF4glmEeUUFKr0RDlsFrysjYQJyf92Q2DBUFcH/H/6OTtOhDQobewcbnXqreOukRrIj8uU6hcrCoK3R+xLS+oTyaEtyHgPTZNzJRn0EkR9N4arEA9SBsJ2gaKyqetwuHq1HtCyXcRfG6RN+DYZONs4DtT37PiWTZhHDoZRE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JCCbXviC; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JCCbXviC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780433433; x=1811969433;
  h=date:from:to:cc:subject:message-id;
  bh=nG6MGnnODQGny2oLTkD1/IusrR6cDKqZaIfS1SvFhZo=;
  b=JCCbXviCFGUzd3rtcCNyF/1TvdayApWh2eekLdq/KyomHcP+xCdoJtg6
   AiH+MB1LOzGpptknM/eRKWkkoYJhgo6H9ARbHafZGPWePIxVz8HB975xm
   2+gJqUl6H1PHfcbHGVH0j1BiBtEwLT+jf0+eB0M0tIMPcLZg7mtoGco3S
   AMIareto9Ge3H9IrklYGSYyaLL04W9xipqt7hhtEBV/IZbuw3Idd8kWGf
   VIW36GfG5vyg9G10O7DzPmZkXQ8HXIRS87Z/uukWxOMCmQ/czhcgB5+mI
   z/uVZkSI9NVZAC3rxBkvOmJI+Do/JR/VDWgBsn5Sr4NTgmG37n6Y1v+Gk
   w==;
X-CSE-ConnectionGUID: GYnbDvs6SuCggPtm2TO4oQ==
X-CSE-MsgGUID: bzQyxejpRTaBYt2UoekPDQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11805"; a="81205845"
X-IronPort-AV: E=Sophos;i="6.24,183,1774335600"; 
   d="scan'208";a="81205845"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jun 2026 13:50:33 -0700
X-CSE-ConnectionGUID: zN1GnmJBSrumcxS/DtaPuQ==
X-CSE-MsgGUID: O3uXrLVQQHSsiXXuDE8MjQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,183,1774335600"; 
   d="scan'208";a="242970305"
Received: from igk-lkp-server01.igk.intel.com (HELO 892db79562d4) ([10.211.93.152])
  by orviesa006.jf.intel.com with ESMTP; 02 Jun 2026 13:50:31 -0700
Received: from kbuild by 892db79562d4 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wUW4C-000000001rD-2OMJ;
	Tue, 02 Jun 2026 20:50:28 +0000
Date: Tue, 02 Jun 2026 22:49:39 +0200
From: kernel test robot <lkp@intel.com>
To: "Peter Zijlstra (Intel)" <peterz@infradead.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [peterz-queue:sched/flat 61/61] kernel/sched/fair.c:9922:20:
 warning: 'cfs_rq' is used uninitialized
Message-ID: <202606022233.nMLuVHVG-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git sched/flat
head:   a5d37500c54a90dc76e3e3e1cd3b0194b06d5461
commit: a5d37500c54a90dc76e3e3e1cd3b0194b06d5461 [61/61] sched/eevdf: Move to a single runqueue
config: x86_64-rhel-9.4 (https://download.01.org/0day-ci/archive/20260602/202606022233.nMLuVHVG-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260602/202606022233.nMLuVHVG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606022233.nMLuVHVG-lkp@intel.com/

All warnings (new ones prefixed by >>):

   kernel/sched/fair.c: In function 'pick_task_fair':
>> kernel/sched/fair.c:9922:20: warning: 'cfs_rq' is used uninitialized [-Wuninitialized]
    9922 |         if (!cfs_rq->h_nr_queued)
         |              ~~~~~~^~~~~~~~~~~~~
   kernel/sched/fair.c:9917:24: note: 'cfs_rq' was declared here
    9917 |         struct cfs_rq *cfs_rq;
         |                        ^~~~~~


vim +/cfs_rq +9922 kernel/sched/fair.c

  9912	
  9913	struct task_struct *pick_task_fair(struct rq *rq, struct rq_flags *rf)
  9914		__must_hold(__rq_lockp(rq))
  9915	{
  9916		struct sched_entity *se;
  9917		struct cfs_rq *cfs_rq;
  9918		struct task_struct *p;
  9919		int new_tasks;
  9920	
  9921	again:
> 9922		if (!cfs_rq->h_nr_queued)
  9923			goto idle;
  9924	
  9925		/* Might not have done put_prev_entity() */
  9926		if (cfs_rq->curr && cfs_rq->curr->on_rq)
  9927			update_curr(cfs_rq);
  9928	
  9929		se = pick_next_entity(rq, true);
  9930		if (!se)
  9931			goto again;
  9932	
  9933		p = task_of(se);
  9934		return p;
  9935	
  9936	idle:
  9937		new_tasks = sched_balance_newidle(rq, rf);
  9938		if (new_tasks < 0)
  9939			return RETRY_TASK;
  9940		if (new_tasks > 0)
  9941			goto again;
  9942		return NULL;
  9943	}
  9944	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
