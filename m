Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B370A1292E2
	for <oe-kbuild-all@lists.linux.dev>; Thu,  8 Feb 2024 17:10:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707412226; cv=none; b=fuOtm6NuHaQTTAMpA88qGPAKMEM6ykPiR8vcfneDtHRLs1rbE2gXyXpztttfcj3hup9Xf0uJifd9MLnxycDsi+raYBxF8b/VHDszCNijgh96++0pcvwwZlXxwWksBqAl7HSfFHEQchrpIEFmYWtr+q9jI+aCCs1ZgjyTINmUlUk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707412226; c=relaxed/simple;
	bh=XsAFGO0G0WrF+jzpJgmRGNe/vX6U+oKsJ9cTF0OwOpE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qJjNJds0no6Zyc/D/eFn8eaSLPBF5TauGYDRGEcipEEV9OQTvu+Abo1R0m9ZbhY3CPc8vVG02d/WRU109QxKXsKYQBSjxzlWwGTluiinR7UN5mYJ/ek3B7VFTUQzt7ijq97/zEd0Fm4g4m2J/l4wOpm/acqzGM9jjiRHU62j4vk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kKYR21f9; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kKYR21f9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707412225; x=1738948225;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=XsAFGO0G0WrF+jzpJgmRGNe/vX6U+oKsJ9cTF0OwOpE=;
  b=kKYR21f9wU2AGhxZE+k/ndHTdZRt4EtVMi84m3YWvkpafXxv+Ty8MQ87
   ngowA10nfl6FcESzSEc8DQdOCSzYvuTM+IWl3NRS2qbcgwUaGnOm5n4C1
   vnhzgVBkJL7HCjlNTTqzm4I/+ECQpMmEcgAIBkpwL6XFC/nF7itzwRk9g
   9JwCiTJH66IZIHTGvvOninRtvzgICBnCCSuC+Ij9a/ICeGuv8HHblkx2M
   JUaoy4VNUTcrzw5rOMRE5hZQ5dSnrtDEUH4WJmeR2kTzBtXplgwdlTLM5
   oknGZgwy2drH2QPn6bBYCt2lRUPRUiF3+kfHE+Gf+tOfQjwK48solh6ce
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10978"; a="1152162"
X-IronPort-AV: E=Sophos;i="6.05,254,1701158400"; 
   d="scan'208";a="1152162"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Feb 2024 09:09:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,254,1701158400"; 
   d="scan'208";a="2001302"
Received: from lkp-server01.sh.intel.com (HELO 01f0647817ea) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 08 Feb 2024 09:09:49 -0800
Received: from kbuild by 01f0647817ea with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rY7uH-0003xq-07;
	Thu, 08 Feb 2024 17:09:49 +0000
Date: Fri, 9 Feb 2024 01:09:45 +0800
From: kernel test robot <lkp@intel.com>
To: Qais Yousef <qyousef@layalina.io>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [qais-yousef:overutilized-affinity 2/2] kernel/sched/fair.c:12694:2:
 error: implicit declaration of function 'set_task_max_allowed_capacity'
Message-ID: <202402090139.6Udmzrpq-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/qais-yousef/linux overutilized-affinity
head:   e56248505a62ea81cf79261ee519b0fbb7d79b37
commit: e56248505a62ea81cf79261ee519b0fbb7d79b37 [2/2] sched/fair: Check a task has a fitting cpu when updating misfit
config: x86_64-randconfig-104-20240207 (https://download.01.org/0day-ci/archive/20240209/202402090139.6Udmzrpq-lkp@intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240209/202402090139.6Udmzrpq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402090139.6Udmzrpq-lkp@intel.com/

All errors (new ones prefixed by >>):

   kernel/sched/fair.c: In function 'task_fork_fair':
>> kernel/sched/fair.c:12694:2: error: implicit declaration of function 'set_task_max_allowed_capacity' [-Werror=implicit-function-declaration]
   12694 |  set_task_max_allowed_capacity(p);
         |  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
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
