Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BED957C
	for <oe-kbuild-all@lists.linux.dev>; Sat, 29 Jul 2023 01:11:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690593083; x=1722129083;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=oYbotEQ/Ut2Z5fbRAlz6sVf/Wx/z2twe8r0O6irnoXE=;
  b=JexojEvRW9o8aU/POu1va3bWfMaRWCVyVrrHmCQDxw2shwzqVTcwRtbm
   GLwcQ1XkNG+MiyK2z2rLOigY/xZRkH66ZqV13yMiZ5/4331f6lQ4BUktr
   XubSAybxzYvUTscNnDzkD65D3cMYFKWK/vk9luAxgcLkNrxi99fpUNbKd
   z/H6067rjmFjq3XAS/HNdc6NEfqgT+wHMIgEX/UXd9N1YKTGdAeBGuyoK
   FZqotmTki2rOuyFHzx8MqoWIkPQJ9VYyAGHQXRbkHnntPH6kdnSDlAwLA
   +HsU/J8Aw5MVQAxazP79uzTcGTOay7yhZvUxkDxdBNI7VZTdIRej/pGCu
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10785"; a="371414741"
X-IronPort-AV: E=Sophos;i="6.01,238,1684825200"; 
   d="scan'208";a="371414741"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jul 2023 18:11:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10785"; a="730945036"
X-IronPort-AV: E=Sophos;i="6.01,238,1684825200"; 
   d="scan'208";a="730945036"
Received: from lkp-server02.sh.intel.com (HELO 953e8cd98f7d) ([10.239.97.151])
  by fmsmga007.fm.intel.com with ESMTP; 28 Jul 2023 18:11:22 -0700
Received: from kbuild by 953e8cd98f7d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qPYTr-0003j3-29;
	Sat, 29 Jul 2023 01:11:00 +0000
Date: Sat, 29 Jul 2023 09:09:45 +0800
From: kernel test robot <lkp@intel.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [peterz-queue:sched/wip 2/2] kernel/sched/fair.c:3383
 dequeue_load_avg() warn: unsigned 'val' is never less than zero.
Message-ID: <202307290926.N9e1MOh6-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git sched/wip
head:   5505174c5d69fe02785f3071bc1dc02e5ae0a338
commit: 5505174c5d69fe02785f3071bc1dc02e5ae0a338 [2/2] sched/fair: Fold the sched_avg update
config: x86_64-randconfig-m001-20230728 (https://download.01.org/0day-ci/archive/20230729/202307290926.N9e1MOh6-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230729/202307290926.N9e1MOh6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307290926.N9e1MOh6-lkp@intel.com/

New smatch warnings:
kernel/sched/fair.c:3383 dequeue_load_avg() warn: unsigned 'val' is never less than zero.
kernel/sched/fair.c:3383 dequeue_load_avg() warn: unsigned 'val' is never less than zero.
kernel/sched/fair.c:3377 enqueue_load_avg() warn: unsigned 'val' is never less than zero.
kernel/sched/fair.c:3377 enqueue_load_avg() warn: unsigned 'val' is never less than zero.
kernel/sched/fair.c:4198 detach_entity_load_avg() warn: unsigned 'val' is never less than zero.
kernel/sched/fair.c:4198 detach_entity_load_avg() warn: unsigned 'val' is never less than zero.
kernel/sched/fair.c:4107 update_cfs_rq_load_avg() warn: unsigned 'val' is never less than zero.
kernel/sched/fair.c:4107 update_cfs_rq_load_avg() warn: unsigned 'val' is never less than zero.

Old smatch warnings:
include/linux/energy_model.h:204 em_pd_get_efficient_state() error: uninitialized symbol 'ps'.

vim +/val +3383 kernel/sched/fair.c

  3376	
> 3377		__update_sa(&cfs_rq->avg, load, se->avg.load_avg, se->avg.load_sum);
  3378	}
  3379	
  3380	static inline void
  3381	dequeue_load_avg(struct cfs_rq *cfs_rq, struct sched_entity *se)
  3382	{
> 3383		__update_sa(&cfs_rq->avg, load, -se->avg.load_avg, -se->avg.load_sum);
  3384	}
  3385	#else
  3386	static inline void
  3387	enqueue_load_avg(struct cfs_rq *cfs_rq, struct sched_entity *se) { }
  3388	static inline void
  3389	dequeue_load_avg(struct cfs_rq *cfs_rq, struct sched_entity *se) { }
  3390	#endif
  3391	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
