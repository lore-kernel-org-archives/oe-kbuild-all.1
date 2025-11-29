Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9353319F135
	for <oe-kbuild-all@lists.linux.dev>; Sat, 29 Nov 2025 01:53:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764381229; cv=none; b=dpzmvjYHn1G0Ma6R2TqnZkkEMS31zu1/g2HJ0pzn4yuiICGUzde0FDVET0IkZC2dKfbt+ekz9JIYDUEX4wcMpxYNhJX83W4Gu2sqT+VZN0K1T7iNwavnMN8iiW2U4Wobt8Gw8WfPrt/61FCC9CVTPNFfGyjAvWAKGMydQjDyO28=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764381229; c=relaxed/simple;
	bh=0fiLUfYh5jBvuSK1/cbz694nx5PLMKczyjRjHvRstCA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=q4Eo80IKZ/GIUgiPIJqiJuSYrcg27y9ZjARxf1SAPp0iHGdhcxrNbneLZjeXIABH6lcNW3hoLET/9sjMLNyv+BFVhb2k6cV4+VbfZrqgnFYKhcW9yV8DMLJBAy1/eiuCncvW2Iho2P1WV3LcUYskH5qNiU/vuJ4FWY1S005ovhg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CSiHi+5d; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CSiHi+5d"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764381226; x=1795917226;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=0fiLUfYh5jBvuSK1/cbz694nx5PLMKczyjRjHvRstCA=;
  b=CSiHi+5dPFDKPWDEEDmngv243wQnxgme2VBiCE9Vl/O7O+l9lx8dhNeh
   Y9WrBcUkfsQBnDDSia3NIHLt+eyUe9rDrl4rIW8kHpXKTL/Uq01fotpkQ
   NXvDnD4K3b/g+R8FcrwmXwmn3Z4+NowU5uUByzS7UPP5hKvZRa/vxzzpE
   GkXV6QONBJ5TWYgtlr4A9TsiVuOmCeWkkQld5as2Ki1XNADNTLiQlK+ho
   JoVYUvAxPlzxXmKbY4AJVdq7suD5iS5GgUICtybFZgRQT6msKSVPrNeIJ
   oazircjBwDpY/UKiu+1J9WyeWyVYdO0mr+Pk3qcA3M8MSW0PP4bOEuXBR
   g==;
X-CSE-ConnectionGUID: qHfNbrPAQ1GRhu+gkwRB4g==
X-CSE-MsgGUID: 1IcHwx2EQOqo3Bs/ojkVOA==
X-IronPort-AV: E=McAfee;i="6800,10657,11627"; a="76726105"
X-IronPort-AV: E=Sophos;i="6.20,235,1758610800"; 
   d="scan'208";a="76726105"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Nov 2025 17:53:45 -0800
X-CSE-ConnectionGUID: f5ke1iWrTeO1MJjmlWpq0w==
X-CSE-MsgGUID: uWUDsLYHTjmxxkW5ZvsEMw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,235,1758610800"; 
   d="scan'208";a="230850585"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 28 Nov 2025 17:53:42 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vPA9d-000000006sb-134V;
	Sat, 29 Nov 2025 01:53:41 +0000
Date: Sat, 29 Nov 2025 09:53:13 +0800
From: kernel test robot <lkp@intel.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [peterz-queue:sched/flat 21/22] kernel/sched/fair.c:8944:22: error:
 'nse' undeclared; did you mean 'se'?
Message-ID: <202511290919.WvRP2JFC-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git sched/flat
head:   589908814e69e3b1a5f3c00003d3746b1865cc30
commit: c68619a24fa5fc6ad3e7edac3a04b8bb6cca02a3 [21/22] sched: Remove sched_class::pick_next_task()
config: alpha-allnoconfig (https://download.01.org/0day-ci/archive/20251129/202511290919.WvRP2JFC-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251129/202511290919.WvRP2JFC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511290919.WvRP2JFC-lkp@intel.com/

All errors (new ones prefixed by >>):

   kernel/sched/fair.c:8870:28: error: static declaration of 'pick_task_fair' follows non-static declaration
    8870 | static struct task_struct *pick_task_fair(struct rq *rq, struct rq_flags *rf)
         |                            ^~~~~~~~~~~~~~
   In file included from kernel/sched/fair.c:57:
   kernel/sched/sched.h:2687:28: note: previous declaration of 'pick_task_fair' with type 'struct task_struct *(struct rq *, struct rq_flags *)'
    2687 | extern struct task_struct *pick_task_fair(struct rq *rq, struct rq_flags *rf);
         |                            ^~~~~~~~~~~~~~
   kernel/sched/fair.c: In function 'put_prev_task_fair':
>> kernel/sched/fair.c:8944:22: error: 'nse' undeclared (first use in this function); did you mean 'se'?
    8944 |                     !nse || cfs_rq->h_curr)
         |                      ^~~
         |                      se
   kernel/sched/fair.c:8944:22: note: each undeclared identifier is reported only once for each function it appears in
   kernel/sched/fair.c:8944:37: error: 'struct cfs_rq' has no member named 'h_curr'; did you mean 'curr'?
    8944 |                     !nse || cfs_rq->h_curr)
         |                                     ^~~~~~
         |                                     curr
   kernel/sched/fair.c: In function 'set_next_task_fair':
   kernel/sched/fair.c:13484:38: error: 'struct cfs_rq' has no member named 'h_curr'; did you mean 'curr'?
   13484 |                     first && cfs_rq->h_curr)
         |                                      ^~~~~~
         |                                      curr
   kernel/sched/fair.c: At top level:
   kernel/sched/fair.c:13824:10: error: 'const struct sched_class' has no member named 'pick_next_task'; did you mean 'set_next_task'?
   13824 |         .pick_next_task         = pick_next_task_fair,
         |          ^~~~~~~~~~~~~~
         |          set_next_task
   kernel/sched/fair.c:13824:35: error: 'pick_next_task_fair' undeclared here (not in a function); did you mean 'set_next_task_fair'?
   13824 |         .pick_next_task         = pick_next_task_fair,
         |                                   ^~~~~~~~~~~~~~~~~~~
         |                                   set_next_task_fair


vim +8944 kernel/sched/fair.c

  8940	
  8941		while (se) {
  8942			cfs_rq = cfs_rq_of(se);
  8943			if (!IS_ENABLED(CONFIG_FAIR_GROUP_SCHED) ||
> 8944			    !nse || cfs_rq->h_curr)
  8945				put_prev_entity(cfs_rq, se);
  8946	#ifdef CONFIG_FAIR_GROUP_SCHED
  8947			if (nse) {
  8948				if (is_same_group(se, nse))
  8949					break;
  8950				if (nse->depth >= se->depth)
  8951					nse = parent_entity(nse);
  8952				if (nse->depth > se->depth)
  8953					continue;
  8954			}
  8955	#endif
  8956			se = parent_entity(se);
  8957		}
  8958	}
  8959	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
