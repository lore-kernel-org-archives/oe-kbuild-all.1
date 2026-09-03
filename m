Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF16736604B
	for <oe-kbuild-all@lists.linux.dev>; Thu,  3 Sep 2026 03:30:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788406248; cv=none; b=c9IjjlVdZ1Q+qwhbf27xFZhsKB2tRUL7p1jiIYZkzi9eTE/FSQqkDNk8C1+ZRZHx+/Rywb4RSqP5YPza3lcwlIH4+dZBzuqPjPfOYOawj44nttRouDYr6VBhVQvlb90ayy6wOcvtHbpCRo3hVeFBBkW/QmVmkWCyjJu9a0vdr3c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788406248; c=relaxed/simple;
	bh=9utbtwETWmCBTX0FBDsRKHSJ7+/v1/cKFWxNTlQ91ms=;
	h=Date:From:To:Cc:Subject:Message-ID; b=M/VCFBanodIFwNXZln5Ot62jLOFoWfm/cnGF856Y0KAkEJ89GJ/PL8MeeTqmRToiadV9ceTUBYwTpSQ5GxSeGVkoBZvJt/APbvKex4IQ3zF8VLA+wEvKBp2Y/A1JBTN8a4E4xZMsn1ioSWfsIq0qXBD3mTTyGfyv6rVtMoOaX/A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HoeGtbd0; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HoeGtbd0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788406246; x=1819942246;
  h=date:from:to:cc:subject:message-id;
  bh=9utbtwETWmCBTX0FBDsRKHSJ7+/v1/cKFWxNTlQ91ms=;
  b=HoeGtbd0vX34fQmN1ZSzQ2gvw67go5VAEaTozDGVJy1d7hkXKygbjB0s
   RK+U+LLZeoPrgQt9STHBIxZOZr6h6ys9/YNByPCl7bqhBOPrxnRSEcBJp
   3v9p4FSFXJzZORjVAPxfT7kvA2aBxWhoSLHBWGVtM63tPcUDHcQVnmpnb
   7kZz8bIXdFzpr55xkUTPLZyY/2G9rQH7Vd3ty0t1dys5hRWe0/e5+6TXI
   P1u3LDdi9uBdSraLPzhkWPkNWGyE/yGCE6Se9MjwjXVbNQd5UKfsFybcU
   lVRUqux5g28WyPrHDsafHyXG6YxOUxEuiSez63GL/w2S5Qnkb58GVsNWT
   A==;
X-CSE-ConnectionGUID: CCBoNdqXRJyApEzAAof4oA==
X-CSE-MsgGUID: aeosRe6zSYK0QVHaWZiNhQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11894"; a="87812260"
X-IronPort-AV: E=Sophos;i="6.25,258,1779174000"; 
   d="scan'208";a="87812260"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2026 20:30:44 -0700
X-CSE-ConnectionGUID: 9Q1wPmqtSXSfvWvGNjuJIQ==
X-CSE-MsgGUID: UCyl0kkHQyOpDAOsO4Ug7w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,258,1779174000"; 
   d="scan'208";a="269603822"
Received: from lkp-server01.sh.intel.com (HELO bfac249b2189) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 02 Sep 2026 20:30:44 -0700
Received: from kbuild by bfac249b2189 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x1y9x-000000003vM-0LqR;
	Thu, 03 Sep 2026 03:30:41 +0000
Date: Thu, 03 Sep 2026 11:30:36 +0800
From: kernel test robot <lkp@intel.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [peterz-queue:sched/task_h_load 25/27]
 kernel/sched/fair.c:456:34: warning: assignment to 'struct cfs_rq *' from
 'int' makes pointer from integer without a cast
Message-ID: <202609031134.8zb9MJEB-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git sched/task_h_load
head:   4cbbcdc1a5585407e918e633887e57d978ddf0c6
commit: 65fc965b77f4f7f70aff38ad18e2a4e09880dad4 [25/27] sched/fair: Fold cfs_rq_of(se) into for_each_sched_entity()
config: parisc-randconfig-r063-20260903 (https://download.01.org/0day-ci/archive/20260903/202609031134.8zb9MJEB-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 12.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260903/202609031134.8zb9MJEB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609031134.8zb9MJEB-lkp@intel.com/

All warnings (new ones prefixed by >>):

   kernel/sched/fair.c: In function 'update_curr_fair':
   kernel/sched/fair.c:456:36: error: implicit declaration of function 'cfs_of_of'; did you mean 'cfs_rq_of'? [-Werror=implicit-function-declaration]
     456 |         for (; (se) && ((cfs_rq) = cfs_of_of(se)); (se) = NULL)
         |                                    ^~~~~~~~~
   kernel/sched/fair.c:2080:9: note: in expansion of macro 'for_each_sched_entity'
    2080 |         for_each_sched_entity(se, cfs_rq)
         |         ^~~~~~~~~~~~~~~~~~~~~
>> kernel/sched/fair.c:456:34: warning: assignment to 'struct cfs_rq *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     456 |         for (; (se) && ((cfs_rq) = cfs_of_of(se)); (se) = NULL)
         |                                  ^
   kernel/sched/fair.c:2080:9: note: in expansion of macro 'for_each_sched_entity'
    2080 |         for_each_sched_entity(se, cfs_rq)
         |         ^~~~~~~~~~~~~~~~~~~~~
   kernel/sched/fair.c: In function 'reweight_task_fair':
>> kernel/sched/fair.c:456:34: warning: assignment to 'struct cfs_rq *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     456 |         for (; (se) && ((cfs_rq) = cfs_of_of(se)); (se) = NULL)
         |                                  ^
   kernel/sched/fair.c:4815:9: note: in expansion of macro 'for_each_sched_entity'
    4815 |         for_each_sched_entity(se, cfs_rq)
         |         ^~~~~~~~~~~~~~~~~~~~~
   kernel/sched/fair.c: In function 'set_delayed':
>> kernel/sched/fair.c:456:34: warning: assignment to 'struct cfs_rq *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     456 |         for (; (se) && ((cfs_rq) = cfs_of_of(se)); (se) = NULL)
         |                                  ^
   kernel/sched/fair.c:6399:9: note: in expansion of macro 'for_each_sched_entity'
    6399 |         for_each_sched_entity(se, cfs_rq)
         |         ^~~~~~~~~~~~~~~~~~~~~
   kernel/sched/fair.c: In function 'clear_delayed':
>> kernel/sched/fair.c:456:34: warning: assignment to 'struct cfs_rq *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     456 |         for (; (se) && ((cfs_rq) = cfs_of_of(se)); (se) = NULL)
         |                                  ^
   kernel/sched/fair.c:6418:9: note: in expansion of macro 'for_each_sched_entity'
    6418 |         for_each_sched_entity(se, cfs_rq)
         |         ^~~~~~~~~~~~~~~~~~~~~
   kernel/sched/fair.c: In function 'enqueue_hierarchy':
>> kernel/sched/fair.c:456:34: warning: assignment to 'struct cfs_rq *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     456 |         for (; (se) && ((cfs_rq) = cfs_of_of(se)); (se) = NULL)
         |                                  ^
   kernel/sched/fair.c:7941:9: note: in expansion of macro 'for_each_sched_entity'
    7941 |         for_each_sched_entity(se, cfs_rq) {
         |         ^~~~~~~~~~~~~~~~~~~~~
   kernel/sched/fair.c: In function 'dequeue_hierarchy':
>> kernel/sched/fair.c:456:34: warning: assignment to 'struct cfs_rq *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     456 |         for (; (se) && ((cfs_rq) = cfs_of_of(se)); (se) = NULL)
         |                                  ^
   kernel/sched/fair.c:8078:9: note: in expansion of macro 'for_each_sched_entity'
    8078 |         for_each_sched_entity(se, cfs_rq) {
         |         ^~~~~~~~~~~~~~~~~~~~~
   kernel/sched/fair.c: In function 'task_tick_fair':
>> kernel/sched/fair.c:456:34: warning: assignment to 'struct cfs_rq *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     456 |         for (; (se) && ((cfs_rq) = cfs_of_of(se)); (se) = NULL)
         |                                  ^
   kernel/sched/fair.c:15056:17: note: in expansion of macro 'for_each_sched_entity'
   15056 |                 for_each_sched_entity(se, cfs_rq) {
         |                 ^~~~~~~~~~~~~~~~~~~~~
   kernel/sched/fair.c: In function 'set_next_task_fair':
>> kernel/sched/fair.c:456:34: warning: assignment to 'struct cfs_rq *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     456 |         for (; (se) && ((cfs_rq) = cfs_of_of(se)); (se) = NULL)
         |                                  ^
   kernel/sched/fair.c:15242:9: note: in expansion of macro 'for_each_sched_entity'
   15242 |         for_each_sched_entity(se, cfs_rq) {
         |         ^~~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +456 kernel/sched/fair.c

   454	
   455	#define for_each_sched_entity(se, cfs_rq) \
 > 456		for (; (se) && ((cfs_rq) = cfs_of_of(se)); (se) = NULL)
   457	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
