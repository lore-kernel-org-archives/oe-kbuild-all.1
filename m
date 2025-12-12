Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EB0629993A
	for <oe-kbuild-all@lists.linux.dev>; Fri, 12 Dec 2025 05:54:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765518873; cv=none; b=s38wj3Do8PgslEivjk8It8Lwux3VxRrztdVJLYmDIqK60e7HsnOnfP3ZON3nS9pGLbF0YereUdHw5tss5S/KUTrwAxts1gVd1PsLdPHS7Qa0bZN6hkTOpvW2BmkPbbBnIHkE122ksxlhi04DCeediYBEm4Ln5TKPCykzeY6wYec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765518873; c=relaxed/simple;
	bh=sKUiUURIf76+CJ8RafbkRYLEmt8Lq+568vCm3uak3lE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=PfXYzecG3yNCJ/bEqyLb7bAPGAmPHgBT1USrlFpfcGOeQPgn6wmnYIG0eBd1rH2hUHaHmo1irm8w37sgyer+Eq8uukyY0qZd9O16jgLj3l1wrlG9uakpfPe0OZUQFSjgPAhWtyelU56VOzV796Yskm5xzTal+dSPLb5a/05DtDk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TOHERCW5; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TOHERCW5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765518871; x=1797054871;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=sKUiUURIf76+CJ8RafbkRYLEmt8Lq+568vCm3uak3lE=;
  b=TOHERCW51isMOXNhCxky9xb+wu5FHG3uCh+MViciUYNz6sifumnkgMjm
   IwmNCO+LYZ1b7kA97KxcFodFZT4FEMQU6xPG8m9cYIxpwbkG9Dk8RBY66
   +VXHXOtITKxPM0TPW/Zk5r0nIcSQUFvlyqm54YRz7VdonqfspUudTT9Uc
   yUQvSFjCa3xJg3cki9WqiW316cT11ACd5pyawcBhyFqa8B9YUv0/SmZYD
   ByLw6/IlYGY3vf0cqy+t8qqsqZFwQAASxeWDUNmoe7w7lxwgARopeUhMU
   Hqg70svFp0tdsRnwiJEfr6cRjS/y+Lnu0WPxtdGbFfCQA5hEHr/mIAofr
   g==;
X-CSE-ConnectionGUID: frUJVUx4QjGeJvj5XqDBqA==
X-CSE-MsgGUID: MLlrUqj2QKqrA/NTJ6hU/A==
X-IronPort-AV: E=McAfee;i="6800,10657,11639"; a="92984523"
X-IronPort-AV: E=Sophos;i="6.21,141,1763452800"; 
   d="scan'208";a="92984523"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Dec 2025 21:54:30 -0800
X-CSE-ConnectionGUID: MGy9H9w2SwK58kmfrhWlyw==
X-CSE-MsgGUID: E4NmeMLhQ6u4ZPAnFDUgKA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,141,1763452800"; 
   d="scan'208";a="227640940"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 11 Dec 2025 21:54:29 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vTw6k-000000005d3-3vc8;
	Fri, 12 Dec 2025 05:54:26 +0000
Date: Fri, 12 Dec 2025 13:54:04 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Jialin Zhang <zhangjialin11@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 3406/3406] kernel/task_work.c:84: warning:
 Function parameter or member 'data' not described in
 'task_work_cancel_match'
Message-ID: <202512121309.G9fDOety-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   58f07869576fac9de85244333864fb34fb7df411
commit: 8802b2dc61376ea4727dba6630f81697da540e85 [3406/3406] task_work: add helper for more targeted task_work canceling
config: arm64-randconfig-003-20251211 (https://download.01.org/0day-ci/archive/20251212/202512121309.G9fDOety-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251212/202512121309.G9fDOety-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512121309.G9fDOety-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/task_work.c:84: warning: Function parameter or member 'data' not described in 'task_work_cancel_match'


vim +84 kernel/task_work.c

e73f8959af0439d Oleg Nesterov 2012-05-11   71  
892f6668f3a7088 Oleg Nesterov 2013-09-11   72  /**
8802b2dc61376ea Jens Axboe    2023-02-28   73   * task_work_cancel_match - cancel a pending work added by task_work_add()
892f6668f3a7088 Oleg Nesterov 2013-09-11   74   * @task: the task which should execute the work
8802b2dc61376ea Jens Axboe    2023-02-28   75   * @match: match function to call
892f6668f3a7088 Oleg Nesterov 2013-09-11   76   *
892f6668f3a7088 Oleg Nesterov 2013-09-11   77   * RETURNS:
892f6668f3a7088 Oleg Nesterov 2013-09-11   78   * The found work or NULL if not found.
892f6668f3a7088 Oleg Nesterov 2013-09-11   79   */
67d1214551e800f Al Viro       2012-06-27   80  struct callback_head *
8802b2dc61376ea Jens Axboe    2023-02-28   81  task_work_cancel_match(struct task_struct *task,
8802b2dc61376ea Jens Axboe    2023-02-28   82  		       bool (*match)(struct callback_head *, void *data),
8802b2dc61376ea Jens Axboe    2023-02-28   83  		       void *data)
e73f8959af0439d Oleg Nesterov 2012-05-11  @84  {
ac3d0da8f3290b3 Oleg Nesterov 2012-08-26   85  	struct callback_head **pprev = &task->task_works;
205e550a0fb469a Oleg Nesterov 2013-09-11   86  	struct callback_head *work;
e73f8959af0439d Oleg Nesterov 2012-05-11   87  	unsigned long flags;
61e96496d3c9497 Oleg Nesterov 2016-08-02   88  
61e96496d3c9497 Oleg Nesterov 2016-08-02   89  	if (likely(!task->task_works))
61e96496d3c9497 Oleg Nesterov 2016-08-02   90  		return NULL;
ac3d0da8f3290b3 Oleg Nesterov 2012-08-26   91  	/*
ac3d0da8f3290b3 Oleg Nesterov 2012-08-26   92  	 * If cmpxchg() fails we continue without updating pprev.
ac3d0da8f3290b3 Oleg Nesterov 2012-08-26   93  	 * Either we raced with task_work_add() which added the
ac3d0da8f3290b3 Oleg Nesterov 2012-08-26   94  	 * new entry before this work, we will find it again. Or
9da33de62431c78 Oleg Nesterov 2012-08-26   95  	 * we raced with task_work_run(), *pprev == NULL/exited.
ac3d0da8f3290b3 Oleg Nesterov 2012-08-26   96  	 */
e73f8959af0439d Oleg Nesterov 2012-05-11   97  	raw_spin_lock_irqsave(&task->pi_lock, flags);
506458efaf153c1 Will Deacon   2017-10-24   98  	while ((work = READ_ONCE(*pprev))) {
8802b2dc61376ea Jens Axboe    2023-02-28   99  		if (!match(work, data))
ac3d0da8f3290b3 Oleg Nesterov 2012-08-26  100  			pprev = &work->next;
ac3d0da8f3290b3 Oleg Nesterov 2012-08-26  101  		else if (cmpxchg(pprev, work, work->next) == work)
158e1645e07f3e9 Al Viro       2012-06-27  102  			break;
158e1645e07f3e9 Al Viro       2012-06-27  103  	}
e73f8959af0439d Oleg Nesterov 2012-05-11  104  	raw_spin_unlock_irqrestore(&task->pi_lock, flags);
ac3d0da8f3290b3 Oleg Nesterov 2012-08-26  105  
ac3d0da8f3290b3 Oleg Nesterov 2012-08-26  106  	return work;
e73f8959af0439d Oleg Nesterov 2012-05-11  107  }
e73f8959af0439d Oleg Nesterov 2012-05-11  108  

:::::: The code at line 84 was first introduced by commit
:::::: e73f8959af0439d114847eab5a8a5ce48f1217c4 task_work_add: generic process-context callbacks

:::::: TO: Oleg Nesterov <oleg@redhat.com>
:::::: CC: Al Viro <viro@zeniv.linux.org.uk>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
