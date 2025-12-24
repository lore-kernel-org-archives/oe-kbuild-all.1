Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C50B7328259
	for <oe-kbuild-all@lists.linux.dev>; Wed, 24 Dec 2025 16:14:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766592877; cv=none; b=jQbbPCAR1xG7NSty3rFJhY7t8CPT3aLJuWpdkTVJNIjl9JHR5EOncO+DxohECJTMKQhxuLJqMmTjMRaFvw9g4F6mxedJrhM00GhuuutRfc5Cj6Fezlb4Y9Nbg4XtXAFf6xoQPhVqL7xjTcnp9okviZSkdwdEeRjmLpu31W0fcBQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766592877; c=relaxed/simple;
	bh=c/G3ogCzmljqReHTyzMWHKPpgtnWGgA5w+PJTeR/kkk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=s3wLVoOP37X6gCSI5zzM+j7IM4mrM9gJd9V3IyDlA8sQfPpmgbDV9AA6X5GjZQJCwWY7Sz5ybonmAYuULDPKO+TiF97zstD5UwjvboQWL7BsxZ+Hzh0ycuhvo3FluTaqGeuVEwFsFWb+T+xQOWNxr2SPyu6pwPxzH/kAueDFVpY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IwkPwvCx; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IwkPwvCx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766592875; x=1798128875;
  h=date:from:to:cc:subject:message-id;
  bh=c/G3ogCzmljqReHTyzMWHKPpgtnWGgA5w+PJTeR/kkk=;
  b=IwkPwvCxHTn9rZQSvdUd7P/kpU6TLxIIkAF4e9NiysI9p16MOsR53DCA
   Y/bGR6UYmmjEaJd7Oz1RvQqiGjOxK1/siHH4t3JWYtOHW7TlrnXpndXgn
   9uaxejMjufNZLMqU7hOwrYvjiZMJlVh7VBlpP5d6ZksEvSbv/Lb1e+hZd
   8E63uOOuVoPArusXBFAbGiHKmAmqNUJPZZ2VJD4CRZWeWn5kQyMPbU7Jv
   JfHo/stPoqE4+xbLWCsWPrKEz7jvCuVxwWbM2wSCHPi0V0ez3ZV1RLuMX
   bTuRoSTzsSjS4VWiRipFlJpbnIzf82I6Sdb/DPIwBCs3ShX04Z8AemzbZ
   A==;
X-CSE-ConnectionGUID: 6jkG7FKyRcCZ+JL9KUYugQ==
X-CSE-MsgGUID: VxQPqOV7R5qZ7Z7MLPX1Yg==
X-IronPort-AV: E=McAfee;i="6800,10657,11652"; a="72055542"
X-IronPort-AV: E=Sophos;i="6.21,174,1763452800"; 
   d="scan'208";a="72055542"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Dec 2025 08:14:33 -0800
X-CSE-ConnectionGUID: Cw6vCf1SRhmvB9+g1xy92g==
X-CSE-MsgGUID: gDKaT1gUSmSirmnA7wb0QA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,174,1763452800"; 
   d="scan'208";a="199802537"
Received: from lkp-server02.sh.intel.com (HELO dd3453e2b682) ([10.239.97.151])
  by orviesa009.jf.intel.com with ESMTP; 24 Dec 2025 08:14:32 -0800
Received: from kbuild by dd3453e2b682 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vYRVN-000000003FP-36TG;
	Wed, 24 Dec 2025 16:14:29 +0000
Date: Thu, 25 Dec 2025 00:13:52 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Jialin Zhang <zhangjialin11@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 3406/3406] kernel/task_work.c:84:
 warning: Function parameter or member 'data' not described in
 'task_work_cancel_match'
Message-ID: <202512250050.7RnKXs39-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Jens,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   1588d318a9e388d05b6cf5e2a63134c8beb6a355
commit: 8802b2dc61376ea4727dba6630f81697da540e85 [3406/3406] task_work: add helper for more targeted task_work canceling
config: arm64-randconfig-003-20251211 (https://download.01.org/0day-ci/archive/20251225/202512250050.7RnKXs39-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251225/202512250050.7RnKXs39-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512250050.7RnKXs39-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/task_work.c:84: warning: Function parameter or member 'data' not described in 'task_work_cancel_match'


vim +84 kernel/task_work.c

e73f8959af0439 Oleg Nesterov 2012-05-11   71  
892f6668f3a708 Oleg Nesterov 2013-09-11   72  /**
8802b2dc61376e Jens Axboe    2023-02-28   73   * task_work_cancel_match - cancel a pending work added by task_work_add()
892f6668f3a708 Oleg Nesterov 2013-09-11   74   * @task: the task which should execute the work
8802b2dc61376e Jens Axboe    2023-02-28   75   * @match: match function to call
892f6668f3a708 Oleg Nesterov 2013-09-11   76   *
892f6668f3a708 Oleg Nesterov 2013-09-11   77   * RETURNS:
892f6668f3a708 Oleg Nesterov 2013-09-11   78   * The found work or NULL if not found.
892f6668f3a708 Oleg Nesterov 2013-09-11   79   */
67d1214551e800 Al Viro       2012-06-27   80  struct callback_head *
8802b2dc61376e Jens Axboe    2023-02-28   81  task_work_cancel_match(struct task_struct *task,
8802b2dc61376e Jens Axboe    2023-02-28   82  		       bool (*match)(struct callback_head *, void *data),
8802b2dc61376e Jens Axboe    2023-02-28   83  		       void *data)
e73f8959af0439 Oleg Nesterov 2012-05-11  @84  {
ac3d0da8f3290b Oleg Nesterov 2012-08-26   85  	struct callback_head **pprev = &task->task_works;
205e550a0fb469 Oleg Nesterov 2013-09-11   86  	struct callback_head *work;
e73f8959af0439 Oleg Nesterov 2012-05-11   87  	unsigned long flags;
61e96496d3c949 Oleg Nesterov 2016-08-02   88  
61e96496d3c949 Oleg Nesterov 2016-08-02   89  	if (likely(!task->task_works))
61e96496d3c949 Oleg Nesterov 2016-08-02   90  		return NULL;
ac3d0da8f3290b Oleg Nesterov 2012-08-26   91  	/*
ac3d0da8f3290b Oleg Nesterov 2012-08-26   92  	 * If cmpxchg() fails we continue without updating pprev.
ac3d0da8f3290b Oleg Nesterov 2012-08-26   93  	 * Either we raced with task_work_add() which added the
ac3d0da8f3290b Oleg Nesterov 2012-08-26   94  	 * new entry before this work, we will find it again. Or
9da33de62431c7 Oleg Nesterov 2012-08-26   95  	 * we raced with task_work_run(), *pprev == NULL/exited.
ac3d0da8f3290b Oleg Nesterov 2012-08-26   96  	 */
e73f8959af0439 Oleg Nesterov 2012-05-11   97  	raw_spin_lock_irqsave(&task->pi_lock, flags);
506458efaf153c Will Deacon   2017-10-24   98  	while ((work = READ_ONCE(*pprev))) {
8802b2dc61376e Jens Axboe    2023-02-28   99  		if (!match(work, data))
ac3d0da8f3290b Oleg Nesterov 2012-08-26  100  			pprev = &work->next;
ac3d0da8f3290b Oleg Nesterov 2012-08-26  101  		else if (cmpxchg(pprev, work, work->next) == work)
158e1645e07f3e Al Viro       2012-06-27  102  			break;
158e1645e07f3e Al Viro       2012-06-27  103  	}
e73f8959af0439 Oleg Nesterov 2012-05-11  104  	raw_spin_unlock_irqrestore(&task->pi_lock, flags);
ac3d0da8f3290b Oleg Nesterov 2012-08-26  105  
ac3d0da8f3290b Oleg Nesterov 2012-08-26  106  	return work;
e73f8959af0439 Oleg Nesterov 2012-05-11  107  }
e73f8959af0439 Oleg Nesterov 2012-05-11  108  

:::::: The code at line 84 was first introduced by commit
:::::: e73f8959af0439d114847eab5a8a5ce48f1217c4 task_work_add: generic process-context callbacks

:::::: TO: Oleg Nesterov <oleg@redhat.com>
:::::: CC: Al Viro <viro@zeniv.linux.org.uk>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
