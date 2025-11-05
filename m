Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E48E325499
	for <oe-kbuild-all@lists.linux.dev>; Wed,  5 Nov 2025 17:26:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762363588; cv=none; b=txXjbUJbDqhUqgzwUTgDXlb5iciNyCOef1QvqQ4kDcAhRhp6wYlAVYWWnYZe9SVMb5VA+P0pjrtP1i3vyH9hzoXb1XcqCaAnu21g+C3p/XgQv8KV9D7tJ1i3tNt/h2QpWbfUdW4CequcHf1XmYNx3yEt1113XA0RZmkAEPW27z8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762363588; c=relaxed/simple;
	bh=UufpBR1zbyEHoRITxaeYpYjQ6AwxsHjkpGvKPgCnaDM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=lz0Zypwub1Sr0q5uSt64xJpJVbaIGPF7r02nvXLyjnbNSPNTWg6rDCriS8oAwjvGLVEYddhEkH9mpc2fouZzW9NuPhlygYNucBphfuwKCfDuIjDVGGUb/NZiuer4WzHT1TJQSU5ndXMcUkZs8YLUmYNOdXZ40747V/k0lZaJyes=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gujPdQIH; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gujPdQIH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762363586; x=1793899586;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=UufpBR1zbyEHoRITxaeYpYjQ6AwxsHjkpGvKPgCnaDM=;
  b=gujPdQIH2CzYfzQUTIAMJSn5woZ9Co7b3le4IQq/OBO/bcrUdQIclLi4
   JGm5QmVwPNi+9TqTHo6tRDV4BzvhOijRxS9mmmh0lgZUl2S6xF76kqkyD
   edA9stXhujBXK1KxLrz8P70Hgqe6X8ybaa13T7+cfpKEDBGOYuXgNfFkL
   vOAAfzGnKl1WUHodulsm83jdT400N7j2fNbV1M6+WUcqPBnFDssn943u+
   LqUYlASfFe/euitIPgnDk98o5pQGbUeiyyDrEWM/q/zgAcjARYkTczs/Q
   CAfjtAk07dVtiJ0m9ff+QBfIq5b/Vxti7NYe6QKMEy6k0grqb8v8Q1yYd
   g==;
X-CSE-ConnectionGUID: kGPnUXLhSla5S+5idsYpPQ==
X-CSE-MsgGUID: MV/zALF/Suecw86f/wNzag==
X-IronPort-AV: E=McAfee;i="6800,10657,11604"; a="52055036"
X-IronPort-AV: E=Sophos;i="6.19,282,1754982000"; 
   d="scan'208";a="52055036"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2025 09:26:26 -0800
X-CSE-ConnectionGUID: gbz4/Df1TdueIGqP0fL4OQ==
X-CSE-MsgGUID: IMz6TYFtS5iCvfRTmsoyLg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,282,1754982000"; 
   d="scan'208";a="187180007"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa007.fm.intel.com with ESMTP; 05 Nov 2025 09:26:24 -0800
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vGhGt-000Svl-1O;
	Wed, 05 Nov 2025 17:26:15 +0000
Date: Thu, 6 Nov 2025 01:16:25 +0800
From: kernel test robot <lkp@intel.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [peterz-queue:sched/core 1/2] kernel/sched/fair.c:8973:17: error:
 implicit declaration of function 'update_min_vruntime'; did you mean
 'update_zero_vruntime'?
Message-ID: <202511060100.vGk1kVV5-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git sched/core
head:   6bcca639d45811ed51ccc5db1a47a7b42dee077c
commit: 4df5bbe4a3ab35dc2ca8fca5569d49cfda688417 [1/2] sched/eevdf: Fix min_vruntime vs avg_vruntime
config: openrisc-allnoconfig (https://download.01.org/0day-ci/archive/20251106/202511060100.vGk1kVV5-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251106/202511060100.vGk1kVV5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511060100.vGk1kVV5-lkp@intel.com/

All errors (new ones prefixed by >>):

   kernel/sched/fair.c: In function 'yield_task_fair':
>> kernel/sched/fair.c:8973:17: error: implicit declaration of function 'update_min_vruntime'; did you mean 'update_zero_vruntime'? [-Wimplicit-function-declaration]
    8973 |                 update_min_vruntime(cfs_rq);
         |                 ^~~~~~~~~~~~~~~~~~~
         |                 update_zero_vruntime


vim +8973 kernel/sched/fair.c

bf0f6f24a1ece8 kernel/sched_fair.c Ingo Molnar     2007-07-09  8932  
ac53db596cc08e kernel/sched_fair.c Rik van Riel    2011-02-01  8933  /*
ac53db596cc08e kernel/sched_fair.c Rik van Riel    2011-02-01  8934   * sched_yield() is very simple
ac53db596cc08e kernel/sched_fair.c Rik van Riel    2011-02-01  8935   */
ac53db596cc08e kernel/sched_fair.c Rik van Riel    2011-02-01  8936  static void yield_task_fair(struct rq *rq)
ac53db596cc08e kernel/sched_fair.c Rik van Riel    2011-02-01  8937  {
ac53db596cc08e kernel/sched_fair.c Rik van Riel    2011-02-01  8938  	struct task_struct *curr = rq->curr;
ac53db596cc08e kernel/sched_fair.c Rik van Riel    2011-02-01  8939  	struct cfs_rq *cfs_rq = task_cfs_rq(curr);
ac53db596cc08e kernel/sched_fair.c Rik van Riel    2011-02-01  8940  	struct sched_entity *se = &curr->se;
ac53db596cc08e kernel/sched_fair.c Rik van Riel    2011-02-01  8941  
ac53db596cc08e kernel/sched_fair.c Rik van Riel    2011-02-01  8942  	/*
ac53db596cc08e kernel/sched_fair.c Rik van Riel    2011-02-01  8943  	 * Are we the only task in the tree?
ac53db596cc08e kernel/sched_fair.c Rik van Riel    2011-02-01  8944  	 */
ac53db596cc08e kernel/sched_fair.c Rik van Riel    2011-02-01  8945  	if (unlikely(rq->nr_running == 1))
ac53db596cc08e kernel/sched_fair.c Rik van Riel    2011-02-01  8946  		return;
ac53db596cc08e kernel/sched_fair.c Rik van Riel    2011-02-01  8947  
ac53db596cc08e kernel/sched_fair.c Rik van Riel    2011-02-01  8948  	clear_buddies(cfs_rq, se);
ac53db596cc08e kernel/sched_fair.c Rik van Riel    2011-02-01  8949  
ac53db596cc08e kernel/sched_fair.c Rik van Riel    2011-02-01  8950  	update_rq_clock(rq);
ac53db596cc08e kernel/sched_fair.c Rik van Riel    2011-02-01  8951  	/*
ac53db596cc08e kernel/sched_fair.c Rik van Riel    2011-02-01  8952  	 * Update run-time statistics of the 'current'.
ac53db596cc08e kernel/sched_fair.c Rik van Riel    2011-02-01  8953  	 */
ac53db596cc08e kernel/sched_fair.c Rik van Riel    2011-02-01  8954  	update_curr(cfs_rq);
916671c08b7808 kernel/sched/fair.c Mike Galbraith  2011-11-22  8955  	/*
916671c08b7808 kernel/sched/fair.c Mike Galbraith  2011-11-22  8956  	 * Tell update_rq_clock() that we've just updated,
916671c08b7808 kernel/sched/fair.c Mike Galbraith  2011-11-22  8957  	 * so we don't do microscopic update in schedule()
916671c08b7808 kernel/sched/fair.c Mike Galbraith  2011-11-22  8958  	 * and double the fastpath cost.
916671c08b7808 kernel/sched/fair.c Mike Galbraith  2011-11-22  8959  	 */
adcc8da8859bee kernel/sched/fair.c Davidlohr Bueso 2018-04-04  8960  	rq_clock_skip_update(rq);
ac53db596cc08e kernel/sched_fair.c Rik van Riel    2011-02-01  8961  
79104becf42bae kernel/sched/fair.c Fernand Sieber  2025-09-18  8962  	/*
79104becf42bae kernel/sched/fair.c Fernand Sieber  2025-09-18  8963  	 * Forfeit the remaining vruntime, only if the entity is eligible. This
79104becf42bae kernel/sched/fair.c Fernand Sieber  2025-09-18  8964  	 * condition is necessary because in core scheduling we prefer to run
79104becf42bae kernel/sched/fair.c Fernand Sieber  2025-09-18  8965  	 * ineligible tasks rather than force idling. If this happens we may
79104becf42bae kernel/sched/fair.c Fernand Sieber  2025-09-18  8966  	 * end up in a loop where the core scheduler picks the yielding task,
79104becf42bae kernel/sched/fair.c Fernand Sieber  2025-09-18  8967  	 * which yields immediately again; without the condition the vruntime
79104becf42bae kernel/sched/fair.c Fernand Sieber  2025-09-18  8968  	 * ends up quickly running away.
79104becf42bae kernel/sched/fair.c Fernand Sieber  2025-09-18  8969  	 */
79104becf42bae kernel/sched/fair.c Fernand Sieber  2025-09-18  8970  	if (entity_eligible(cfs_rq, se)) {
79104becf42bae kernel/sched/fair.c Fernand Sieber  2025-09-18  8971  		se->vruntime = se->deadline;
5e963f2bd4654a kernel/sched/fair.c Peter Zijlstra  2023-05-31  8972  		se->deadline += calc_delta_fair(se->slice, se);
79104becf42bae kernel/sched/fair.c Fernand Sieber  2025-09-18 @8973  		update_min_vruntime(cfs_rq);
79104becf42bae kernel/sched/fair.c Fernand Sieber  2025-09-18  8974  	}
ac53db596cc08e kernel/sched_fair.c Rik van Riel    2011-02-01  8975  }
ac53db596cc08e kernel/sched_fair.c Rik van Riel    2011-02-01  8976  

:::::: The code at line 8973 was first introduced by commit
:::::: 79104becf42baeeb4a3f2b106f954b9fc7c10a3c sched/fair: Forfeit vruntime on yield

:::::: TO: Fernand Sieber <sieberf@amazon.com>
:::::: CC: Peter Zijlstra <peterz@infradead.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
