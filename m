Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9A392E6CAB
	for <oe-kbuild-all@lists.linux.dev>; Sun, 28 Jun 2026 11:19:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782645563; cv=none; b=bfwVouncKsCOlFdtgzOz67K5ycAS1gNGRtdDKKZDgJ7GCfNKdVUyurYLkuG7NyA0bDmqgN4ICHqzaC26PHyh3/cZy5JRj4u6YzoBlNlyILav8vE8gwF8gXkCCMos1KCSnd9Z7ZzI5YjrEUuR4NU4O9MuRkQy4gLJw/xajCCHmBI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782645563; c=relaxed/simple;
	bh=/SkxsMtrISlbP36yd5H4FWUEapLin0AK2u8NKY9Pj1k=;
	h=Date:From:To:Cc:Subject:Message-ID; b=WIdG1sO/aHC0RHlrTP+0Kahr/dSD/yhir6hNOw7ZvrMn/7ahmdceZi94Ba+ZaubNmIzcBu/Bj8IwDToNgejk87i7ZTMUmHnZgjF9Ao8jp+sa4a2BISApg0h5iDbDj5DMHTncH5qKEUA+CB7YwpDpFMLdPPetvPvKa8uCHD9vcwg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VsuQTKWg; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VsuQTKWg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782645562; x=1814181562;
  h=date:from:to:cc:subject:message-id;
  bh=/SkxsMtrISlbP36yd5H4FWUEapLin0AK2u8NKY9Pj1k=;
  b=VsuQTKWg4nOCkHWRGmJAnLu1GH+sqP7j8HwnIrXDuYYqczDCBiXOK5QN
   49r0iG5c2yXHYP9mQfCuy4SHl2nqDnMGmvyiLcxgh6vzqR03HxZgp2paE
   8PENjkg8ogb9Zg2AUWXAfh9cnY5kUYWH2zGBUwcu58k3CXNVPFdn/74p2
   yLS4m6ykPFkpJ7MFzCDyCyWh2FtrOb68hNrv3/EBqHX9KNis5G2qXq8ln
   1P64X+zB5aY833kW7z7WF6QUDcthmLsSGmVCVJKO01r1yUvUVFMg3VG5O
   NNTNZimUoEA935XjFjUwgdM/MmpzsW8ghT+y5ZPEw5QbZvB1SWhQ8exhC
   g==;
X-CSE-ConnectionGUID: ZZXAtXUrSrOL2W+kq7nCpA==
X-CSE-MsgGUID: SbY414BqRX+tUFs2GNh9ZA==
X-IronPort-AV: E=McAfee;i="6800,10657,11830"; a="83392562"
X-IronPort-AV: E=Sophos;i="6.24,230,1774335600"; 
   d="scan'208";a="83392562"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jun 2026 04:19:06 -0700
X-CSE-ConnectionGUID: 0ZGoFfwkStq3SuuH1qWjsQ==
X-CSE-MsgGUID: lKhTIkyOTCqhyBiEUn9Dqg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,230,1774335600"; 
   d="scan'208";a="255676682"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 28 Jun 2026 04:19:05 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wdnXS-000000006IF-1bMD;
	Sun, 28 Jun 2026 11:19:02 +0000
Date: Sun, 28 Jun 2026 19:18:39 +0800
From: kernel test robot <lkp@intel.com>
To: steven@liquorix.net
Cc: oe-kbuild-all@lists.linux.dev
Subject: [zen:7.1/prjc 623/670] kernel/sched/alt_sched.h:331:25:
 sparse: sparse: incompatible types in comparison expression (different
 address spaces):
Message-ID: <202606281945.s2tz4C14-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/zen-kernel/zen-kernel 7.1/prjc
head:   bb2b8160912c2185b974596c31e727ae49edf0d4
commit: 6693d2de0c4e914f04ef3ec1868c3b6ababa2acf [623/670] sched/alt: [Sync] d658686a1331 sched/deadline: Fix missing ENQUEUE_REPLENISH during PI de-boosting
config: openrisc-randconfig-r131-20260628 (https://download.01.org/0day-ci/archive/20260628/202606281945.s2tz4C14-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 11.5.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260628/202606281945.s2tz4C14-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606281945.s2tz4C14-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   kernel/sched/build_policy.c: note: in included file (through kernel/sched/sched.h):
>> kernel/sched/alt_sched.h:331:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/alt_sched.h:331:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/alt_sched.h:331:25: sparse:    struct task_struct *

vim +331 kernel/sched/alt_sched.h

628c9dd0f141e0 Alfred Chen 2019-08-19  328  
82871d0e9da64f Alfred Chen 2026-01-19  329  static inline bool idle_rq(struct rq *rq)
82871d0e9da64f Alfred Chen 2026-01-19  330  {
82871d0e9da64f Alfred Chen 2026-01-19 @331  	return rq->curr == rq->idle && !rq->nr_running && !rq->ttwu_pending;
82871d0e9da64f Alfred Chen 2026-01-19  332  }
82871d0e9da64f Alfred Chen 2026-01-19  333  

:::::: The code at line 331 was first introduced by commit
:::::: 82871d0e9da64f57a56f97559d92c456b1861428 sched/alt: [Sync] 1e0a2ba7afb1 sched: Provide idle_rq() helper

:::::: TO: Alfred Chen <cchalpha@gmail.com>
:::::: CC: Alfred Chen <cchalpha@gmail.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
