Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 830F618BC3D
	for <oe-kbuild-all@lists.linux.dev>; Thu,  3 Sep 2026 00:19:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788394754; cv=none; b=fsGdRSfkKzVkVEvOlMgBBRyzTxGekzg6XF57cPbQsdPQHktAzAHMtBrpJsRMxhmNqstX2WBfqLnUW4YhOjieWDCQvI+u3hbkrzpuNCh4a55TyxyeqkYMm3bMIbiWnCSmjqbjOf/h2szB+4BuwJ5UXN7O/gQqlFk4r0S1VhQCw1I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788394754; c=relaxed/simple;
	bh=0xqRkWr9kSdFGSyfnB+qDN9AYqot3BhCfNiIpY2oYuI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=nRyyfcSwKnmjDSOjeqLIg9WcfgQbyaOSqHcGuDCbt5+KjqqDycIi38En184wKL+t7qW5vjWWqErhei0waYfvwa3dp52rJeGTEK33eP9BzQd4J5NS283U2NzgBDj8IIX4wNPr6SV1IydfhSbIHvnCA/RT+7nrVCJbdJ3vLuUqtIs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XY1+aQDf; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XY1+aQDf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788394751; x=1819930751;
  h=date:from:to:cc:subject:message-id;
  bh=0xqRkWr9kSdFGSyfnB+qDN9AYqot3BhCfNiIpY2oYuI=;
  b=XY1+aQDfCUPmO549uq5TWIKnbmbIr+krMH0oFDgmnXEizf2lZRzI1jMW
   EfdCRtdzOyjcO/TR/IaYsPt4VVa1DuKFYpyQ+C99qtViYv7BNsL2chgLB
   VgHD6jjnv7HtlIx9dIxiURtKfJQ8rKbjRk/uCuAoe2YrDXM73N6N0RneG
   WMDhfCG2yS40waepHZ4HeMvTedonJYlicrS4JmN17nJG68hDM6lHvpkjx
   1/L6XfxCNZpbPeLsAlEAPQd5VAjEd4/ruaZ6wo8YkZYDDDq0UPZtSn/jl
   RTMbhz5dScnWY6kY0tE3uPDrMsFfPPB8UHLqMu0F9fr81XXGZvWCfQR09
   Q==;
X-CSE-ConnectionGUID: l0aFOMqUSKWChJEtN5LXNQ==
X-CSE-MsgGUID: ayLAWHVKRAuyYXHTjRB6lw==
X-IronPort-AV: E=McAfee;i="6800,10657,11894"; a="100026622"
X-IronPort-AV: E=Sophos;i="6.25,258,1779174000"; 
   d="scan'208";a="100026622"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2026 17:19:10 -0700
X-CSE-ConnectionGUID: uFm1DYg0QzC7VoHEWtEI9Q==
X-CSE-MsgGUID: MBsbBGZvQFeDNYletudqnw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,258,1779174000"; 
   d="scan'208";a="269571255"
Received: from lkp-server01.sh.intel.com (HELO bfac249b2189) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 02 Sep 2026 17:19:10 -0700
Received: from kbuild by bfac249b2189 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x1vAZ-000000003WY-1IXc;
	Thu, 03 Sep 2026 00:19:07 +0000
Date: Thu, 03 Sep 2026 08:18:15 +0800
From: kernel test robot <lkp@intel.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [peterz-queue:sched/task_h_load 25/27]
 kernel/sched/fair.c:456:36: error: implicit declaration of function
 'cfs_of_of'; did you mean 'cfs_rq_of'?
Message-ID: <202609030829.NL68taR1-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git sched/task_h_load
head:   4cbbcdc1a5585407e918e633887e57d978ddf0c6
commit: 65fc965b77f4f7f70aff38ad18e2a4e09880dad4 [25/27] sched/fair: Fold cfs_rq_of(se) into for_each_sched_entity()
config: arc-allnoconfig (https://download.01.org/0day-ci/archive/20260903/202609030829.NL68taR1-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260903/202609030829.NL68taR1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609030829.NL68taR1-lkp@intel.com/

All errors (new ones prefixed by >>):

   kernel/sched/fair.c: In function 'update_curr_fair':
>> kernel/sched/fair.c:456:36: error: implicit declaration of function 'cfs_of_of'; did you mean 'cfs_rq_of'? [-Wimplicit-function-declaration]
     456 |         for (; (se) && ((cfs_rq) = cfs_of_of(se)); (se) = NULL)
         |                                    ^~~~~~~~~
   kernel/sched/fair.c:2080:9: note: in expansion of macro 'for_each_sched_entity'
    2080 |         for_each_sched_entity(se, cfs_rq)
         |         ^~~~~~~~~~~~~~~~~~~~~
>> kernel/sched/fair.c:456:34: error: assignment to 'struct cfs_rq *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     456 |         for (; (se) && ((cfs_rq) = cfs_of_of(se)); (se) = NULL)
         |                                  ^
   kernel/sched/fair.c:2080:9: note: in expansion of macro 'for_each_sched_entity'
    2080 |         for_each_sched_entity(se, cfs_rq)
         |         ^~~~~~~~~~~~~~~~~~~~~
   kernel/sched/fair.c: In function 'reweight_task_fair':
>> kernel/sched/fair.c:456:34: error: assignment to 'struct cfs_rq *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     456 |         for (; (se) && ((cfs_rq) = cfs_of_of(se)); (se) = NULL)
         |                                  ^
   kernel/sched/fair.c:4815:9: note: in expansion of macro 'for_each_sched_entity'
    4815 |         for_each_sched_entity(se, cfs_rq)
         |         ^~~~~~~~~~~~~~~~~~~~~
   kernel/sched/fair.c: In function 'set_delayed':
>> kernel/sched/fair.c:456:34: error: assignment to 'struct cfs_rq *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     456 |         for (; (se) && ((cfs_rq) = cfs_of_of(se)); (se) = NULL)
         |                                  ^
   kernel/sched/fair.c:6399:9: note: in expansion of macro 'for_each_sched_entity'
    6399 |         for_each_sched_entity(se, cfs_rq)
         |         ^~~~~~~~~~~~~~~~~~~~~
   kernel/sched/fair.c: In function 'clear_delayed':
>> kernel/sched/fair.c:456:34: error: assignment to 'struct cfs_rq *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     456 |         for (; (se) && ((cfs_rq) = cfs_of_of(se)); (se) = NULL)
         |                                  ^
   kernel/sched/fair.c:6418:9: note: in expansion of macro 'for_each_sched_entity'
    6418 |         for_each_sched_entity(se, cfs_rq)
         |         ^~~~~~~~~~~~~~~~~~~~~
   kernel/sched/fair.c: In function 'enqueue_hierarchy':
>> kernel/sched/fair.c:456:34: error: assignment to 'struct cfs_rq *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     456 |         for (; (se) && ((cfs_rq) = cfs_of_of(se)); (se) = NULL)
         |                                  ^
   kernel/sched/fair.c:7941:9: note: in expansion of macro 'for_each_sched_entity'
    7941 |         for_each_sched_entity(se, cfs_rq) {
         |         ^~~~~~~~~~~~~~~~~~~~~
   kernel/sched/fair.c: In function 'dequeue_hierarchy':
>> kernel/sched/fair.c:456:34: error: assignment to 'struct cfs_rq *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     456 |         for (; (se) && ((cfs_rq) = cfs_of_of(se)); (se) = NULL)
         |                                  ^
   kernel/sched/fair.c:8078:9: note: in expansion of macro 'for_each_sched_entity'
    8078 |         for_each_sched_entity(se, cfs_rq) {
         |         ^~~~~~~~~~~~~~~~~~~~~
   kernel/sched/fair.c: In function 'task_tick_fair':
>> kernel/sched/fair.c:456:34: error: assignment to 'struct cfs_rq *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     456 |         for (; (se) && ((cfs_rq) = cfs_of_of(se)); (se) = NULL)
         |                                  ^
   kernel/sched/fair.c:15056:17: note: in expansion of macro 'for_each_sched_entity'
   15056 |                 for_each_sched_entity(se, cfs_rq) {
         |                 ^~~~~~~~~~~~~~~~~~~~~
   kernel/sched/fair.c: In function 'set_next_task_fair':
>> kernel/sched/fair.c:456:34: error: assignment to 'struct cfs_rq *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     456 |         for (; (se) && ((cfs_rq) = cfs_of_of(se)); (se) = NULL)
         |                                  ^
   kernel/sched/fair.c:15242:9: note: in expansion of macro 'for_each_sched_entity'
   15242 |         for_each_sched_entity(se, cfs_rq) {
         |         ^~~~~~~~~~~~~~~~~~~~~


vim +456 kernel/sched/fair.c

   454	
   455	#define for_each_sched_entity(se, cfs_rq) \
 > 456		for (; (se) && ((cfs_rq) = cfs_of_of(se)); (se) = NULL)
   457	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
