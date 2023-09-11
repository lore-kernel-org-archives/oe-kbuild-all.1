Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FDEC156DB
	for <oe-kbuild-all@lists.linux.dev>; Mon, 11 Sep 2023 19:15:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694459708; x=1725995708;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=07/p9oDn31rTGw7P//H58/j97irnDVEbpN9U4gK1A4E=;
  b=F2Zbln2L59Oa3pCwhakIpt+44S42TiDI/qJYBlW1IunyYMfRIpgl4kMH
   Z2XB1MszymCyBevLZJTX2jdjNfDDhEMEdZmtHWKlxp4uQ5q1APx2sq0CN
   btPJ500Up4vaIN/ixDlumlX4cE2IPgdWTVJWEldrDzvYRrQ752KzG9fsp
   RK3UOJkdTiF2ciPQJ9QIxw7MG9f1/8C0J36HRudD1Wfl+qzayzSv6KQJs
   VODT2QmtUOGl2QEXLehJgj0x1Hj0ZW/VhIRbD+q1z9UirxHesbAQRJpD8
   Q47Pwp9gQGeNElKPfWt0r/laZr7WmxT5pRWov+Cqq1ARgoXmEp4y5cCaj
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10830"; a="375519361"
X-IronPort-AV: E=Sophos;i="6.02,244,1688454000"; 
   d="scan'208";a="375519361"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Sep 2023 12:13:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10830"; a="736875361"
X-IronPort-AV: E=Sophos;i="6.02,244,1688454000"; 
   d="scan'208";a="736875361"
Received: from lkp-server01.sh.intel.com (HELO 59b3c6e06877) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 11 Sep 2023 12:13:34 -0700
Received: from kbuild by 59b3c6e06877 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qfmLk-0006dm-0I;
	Mon, 11 Sep 2023 19:13:32 +0000
Date: Tue, 12 Sep 2023 03:12:35 +0800
From: kernel test robot <lkp@intel.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Oleg Nesterov <oleg@redhat.com>
Subject: kernel/task_work.c:73: warning: Function parameter or member 'data'
 not described in 'task_work_cancel_match'
Message-ID: <202309120307.zis3yQGe-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   0bb80ecc33a8fb5a682236443c1e740d5c917d1d
commit: c7aab1a7c52b82d9afd7e03c398eb03dc2aa0507 task_work: add helper for more targeted task_work canceling
date:   2 years, 5 months ago
config: openrisc-allnoconfig (https://download.01.org/0day-ci/archive/20230912/202309120307.zis3yQGe-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 12.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230912/202309120307.zis3yQGe-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309120307.zis3yQGe-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/task_work.c:73: warning: Function parameter or member 'data' not described in 'task_work_cancel_match'


vim +73 kernel/task_work.c

e73f8959af0439 Oleg Nesterov 2012-05-11  60  
892f6668f3a708 Oleg Nesterov 2013-09-11  61  /**
c7aab1a7c52b82 Jens Axboe    2021-04-01  62   * task_work_cancel_match - cancel a pending work added by task_work_add()
892f6668f3a708 Oleg Nesterov 2013-09-11  63   * @task: the task which should execute the work
c7aab1a7c52b82 Jens Axboe    2021-04-01  64   * @match: match function to call
892f6668f3a708 Oleg Nesterov 2013-09-11  65   *
892f6668f3a708 Oleg Nesterov 2013-09-11  66   * RETURNS:
892f6668f3a708 Oleg Nesterov 2013-09-11  67   * The found work or NULL if not found.
892f6668f3a708 Oleg Nesterov 2013-09-11  68   */
67d1214551e800 Al Viro       2012-06-27  69  struct callback_head *
c7aab1a7c52b82 Jens Axboe    2021-04-01  70  task_work_cancel_match(struct task_struct *task,
c7aab1a7c52b82 Jens Axboe    2021-04-01  71  		       bool (*match)(struct callback_head *, void *data),
c7aab1a7c52b82 Jens Axboe    2021-04-01  72  		       void *data)
e73f8959af0439 Oleg Nesterov 2012-05-11 @73  {
ac3d0da8f3290b Oleg Nesterov 2012-08-26  74  	struct callback_head **pprev = &task->task_works;
205e550a0fb469 Oleg Nesterov 2013-09-11  75  	struct callback_head *work;
e73f8959af0439 Oleg Nesterov 2012-05-11  76  	unsigned long flags;
61e96496d3c949 Oleg Nesterov 2016-08-02  77  
61e96496d3c949 Oleg Nesterov 2016-08-02  78  	if (likely(!task->task_works))
61e96496d3c949 Oleg Nesterov 2016-08-02  79  		return NULL;
ac3d0da8f3290b Oleg Nesterov 2012-08-26  80  	/*
ac3d0da8f3290b Oleg Nesterov 2012-08-26  81  	 * If cmpxchg() fails we continue without updating pprev.
ac3d0da8f3290b Oleg Nesterov 2012-08-26  82  	 * Either we raced with task_work_add() which added the
ac3d0da8f3290b Oleg Nesterov 2012-08-26  83  	 * new entry before this work, we will find it again. Or
9da33de62431c7 Oleg Nesterov 2012-08-26  84  	 * we raced with task_work_run(), *pprev == NULL/exited.
ac3d0da8f3290b Oleg Nesterov 2012-08-26  85  	 */
e73f8959af0439 Oleg Nesterov 2012-05-11  86  	raw_spin_lock_irqsave(&task->pi_lock, flags);
506458efaf153c Will Deacon   2017-10-24  87  	while ((work = READ_ONCE(*pprev))) {
c7aab1a7c52b82 Jens Axboe    2021-04-01  88  		if (!match(work, data))
ac3d0da8f3290b Oleg Nesterov 2012-08-26  89  			pprev = &work->next;
ac3d0da8f3290b Oleg Nesterov 2012-08-26  90  		else if (cmpxchg(pprev, work, work->next) == work)
158e1645e07f3e Al Viro       2012-06-27  91  			break;
158e1645e07f3e Al Viro       2012-06-27  92  	}
e73f8959af0439 Oleg Nesterov 2012-05-11  93  	raw_spin_unlock_irqrestore(&task->pi_lock, flags);
ac3d0da8f3290b Oleg Nesterov 2012-08-26  94  
ac3d0da8f3290b Oleg Nesterov 2012-08-26  95  	return work;
e73f8959af0439 Oleg Nesterov 2012-05-11  96  }
e73f8959af0439 Oleg Nesterov 2012-05-11  97  

:::::: The code at line 73 was first introduced by commit
:::::: e73f8959af0439d114847eab5a8a5ce48f1217c4 task_work_add: generic process-context callbacks

:::::: TO: Oleg Nesterov <oleg@redhat.com>
:::::: CC: Al Viro <viro@zeniv.linux.org.uk>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
