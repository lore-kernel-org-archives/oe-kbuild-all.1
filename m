Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3829611E
	for <oe-kbuild-all@lists.linux.dev>; Sat, 11 May 2024 00:57:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715389064; cv=none; b=FN3+GVj0MmfjyPvL+tULquaihF6/LZtVI06RgHTMBao0e0OCNH2S6lzASxvev4yILQzn/+a8jQbgpk2ZGlh21gl+No3aqFn9x07uRynEzaYC0CAUIQ65ofZPpH0z7Wik5sZcWzTY/Z8yM+k78TvTNDLM5nOuISProM4EU2pXeII=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715389064; c=relaxed/simple;
	bh=Mpsy+h3SgYkODfpC2Ol+nL0+sJg0AuOKFVtUhS2TyGU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Ss98BLShsaPzVCb5ECpf+fG2An5M3O3dazlyt150RVSJEO+l0IPrB7xhu7PhV56ZsA+z+QJtLo3I8rpHEdsg1a87zdIBXWKlgboH+apMQm3HVaVyit9xt8ZezJhgmNfDq6khcv2dRv+eb5LkISzcCKUVz9PnBLXKgLO6RglPCTM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZS11Agfl; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZS11Agfl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715389063; x=1746925063;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Mpsy+h3SgYkODfpC2Ol+nL0+sJg0AuOKFVtUhS2TyGU=;
  b=ZS11Agfl9rGR+PUO2bMcLXmowfJuthZ8oMXzKdUpi92SsWRQBdWTmJ9G
   QLJ8OnyEMlEP0Rj7qhtOBwWGeKGKywSqZ/mph7FJ7dW/gsXDi+Ofcpzoj
   Pgacf3sGLbuYRE7NTSVff6WaSFxCaaZ/ZAMzHXZSecybuKKi83CBos5nA
   rLHm6/STUPDP7WNr2b8WcpCoQXebqpDfoA84/o9RZ+RlERpBssmW+cQZZ
   iytUDSonILyjXymfEpMpC7bl6SFlsNSzpGGF+gO0bmFoa7zg4PDyPG2Ho
   ot75s5goElxFM+Ay1DYotwiNEKmCGIn/d64QtnQtsbhUYE0v3bm85l5QY
   A==;
X-CSE-ConnectionGUID: /HcBCr2VRqeTCZ+6v1RvVw==
X-CSE-MsgGUID: nGlOHWJ2TyKP2zWgUs4WPg==
X-IronPort-AV: E=McAfee;i="6600,9927,11069"; a="11331956"
X-IronPort-AV: E=Sophos;i="6.08,152,1712646000"; 
   d="scan'208";a="11331956"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 May 2024 17:57:40 -0700
X-CSE-ConnectionGUID: PFqNtNotT7Oha/+D6rLnCQ==
X-CSE-MsgGUID: WW/XHqZpQXefZPy32Pov2g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,152,1712646000"; 
   d="scan'208";a="30344950"
Received: from lkp-server01.sh.intel.com (HELO f8b243fe6e68) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 10 May 2024 17:57:39 -0700
Received: from kbuild by f8b243fe6e68 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s5b3Q-0006kd-2H;
	Sat, 11 May 2024 00:57:36 +0000
Date: Sat, 11 May 2024 08:57:08 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com,
	Guenter Roeck <groeck@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-5.15 8/9] kernel/sched/deadline.c:1543:6:
 warning: no previous prototype for function 'dl_server_freeze'
Message-ID: <202405110846.qeL1dJQ2-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-5.15
head:   a9b51c2494133c012e34a050191e3954b5109747
commit: 16d0ae5e68d0f8b9e3749021fd3599d88b72fc6c [8/9] CHROMIUM: sched/dlserver: Freeze dlserver on system suspend.
config: arm-allnoconfig (https://download.01.org/0day-ci/archive/20240511/202405110846.qeL1dJQ2-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project b910bebc300dafb30569cecc3017b446ea8eafa0)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240511/202405110846.qeL1dJQ2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405110846.qeL1dJQ2-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from kernel/sched/deadline.c:18:
   In file included from kernel/sched/sched.h:41:
   In file included from include/linux/blkdev.h:8:
   In file included from include/linux/genhd.h:16:
   In file included from include/linux/blk_types.h:10:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:8:
   In file included from include/linux/mm.h:1579:
   include/linux/vmstat.h:450:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     450 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
>> kernel/sched/deadline.c:1543:6: warning: no previous prototype for function 'dl_server_freeze' [-Wmissing-prototypes]
    1543 | void dl_server_freeze(struct sched_dl_entity *dl_se)
         |      ^
   kernel/sched/deadline.c:1543:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    1543 | void dl_server_freeze(struct sched_dl_entity *dl_se)
         | ^
         | static 
>> kernel/sched/deadline.c:1552:6: warning: no previous prototype for function 'dl_server_thaw' [-Wmissing-prototypes]
    1552 | void dl_server_thaw(struct sched_dl_entity *dl_se)
         |      ^
   kernel/sched/deadline.c:1552:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    1552 | void dl_server_thaw(struct sched_dl_entity *dl_se)
         | ^
         | static 
   kernel/sched/deadline.c:683:6: warning: unused function 'inc_dl_migration' [-Wunused-function]
     683 | void inc_dl_migration(struct sched_dl_entity *dl_se, struct dl_rq *dl_rq)
         |      ^~~~~~~~~~~~~~~~
   kernel/sched/deadline.c:688:6: warning: unused function 'dec_dl_migration' [-Wunused-function]
     688 | void dec_dl_migration(struct sched_dl_entity *dl_se, struct dl_rq *dl_rq)
         |      ^~~~~~~~~~~~~~~~
   kernel/sched/deadline.c:692:20: warning: unused function 'need_pull_dl_task' [-Wunused-function]
     692 | static inline bool need_pull_dl_task(struct rq *rq, struct task_struct *prev)
         |                    ^~~~~~~~~~~~~~~~~
   kernel/sched/deadline.c:697:20: warning: unused function 'pull_dl_task' [-Wunused-function]
     697 | static inline void pull_dl_task(struct rq *rq)
         |                    ^~~~~~~~~~~~
   kernel/sched/deadline.c:1372:1: warning: unused function 'update_stats_dequeue_dl' [-Wunused-function]
    1372 | update_stats_dequeue_dl(struct dl_rq *dl_rq, struct sched_dl_entity *dl_se,
         | ^~~~~~~~~~~~~~~~~~~~~~~
   8 warnings generated.


vim +/dl_server_freeze +1543 kernel/sched/deadline.c

  1542	
> 1543	void dl_server_freeze(struct sched_dl_entity *dl_se)
  1544	{
  1545		if (dl_se->dl_server_active) {
  1546			update_rq_clock(dl_se->rq);
  1547			__dl_server_stop(dl_se);
  1548		}
  1549		dl_se->dl_server_frozen = 1;
  1550	}
  1551	
> 1552	void dl_server_thaw(struct sched_dl_entity *dl_se)
  1553	{
  1554		if (dl_se->dl_server_active) {
  1555			update_rq_clock(dl_se->rq);
  1556			__dl_server_start(dl_se);
  1557		}
  1558		dl_se->dl_server_frozen = 0;
  1559	}
  1560	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
