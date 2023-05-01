Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C909362
	for <oe-kbuild-all@lists.linux.dev>; Mon,  1 May 2023 00:59:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682902795; x=1714438795;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6tuj+C32k1QYP+x+Oyr8rqnt4j5LvySen2DL6Zm/b4c=;
  b=YJGCU3JCxeJsdP6IhYnTr1In1c44w/DZHpCOsA86eZprjJ3tFqYCSckc
   18O1gu78lEOqBGIHNjNxFBF1SpmRi35D/G8MFngOOXDt0dddTIqR9fxfB
   cqYd/RfWwH4eHhoBoCBwiN8HyqWoHUIElor+8TI9ypNgC4hz844zC/94p
   xT5AZeOTkbWYbIDChwpR+pvgLDMpS9YCPu8IfUk7INH+QTQVtM6by0AuX
   LIh61stc6Fv9OoiZL2zekmEDmWdw8zE7s1q3lqIY8J0iK2DEGF2t9ylxF
   nlg3G2NiWECb57rAocuYF8bxSANZP6vesYsTJtLMN5BhavkYHI1c6OKJT
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10696"; a="332413952"
X-IronPort-AV: E=Sophos;i="5.99,239,1677571200"; 
   d="scan'208";a="332413952"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Apr 2023 17:59:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10696"; a="698371737"
X-IronPort-AV: E=Sophos;i="5.99,239,1677571200"; 
   d="scan'208";a="698371737"
Received: from lkp-server01.sh.intel.com (HELO e3434d64424d) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 30 Apr 2023 17:59:53 -0700
Received: from kbuild by e3434d64424d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ptHtQ-0000Dt-1I;
	Mon, 01 May 2023 00:59:52 +0000
Date: Mon, 1 May 2023 08:59:33 +0800
From: kernel test robot <lkp@intel.com>
To: Chen Yu <yu.c.chen@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, Peter Zijlstra <peterz@infradead.org>
Subject: [peterz-queue:sched/eevdf 14/31] kernel/sched/fair.c:6625:48: error:
 'sysctl_sched_miration_cost' undeclared; did you mean
 'sysctl_sched_migration_cost'?
Message-ID: <202305010804.9gJ8guJp-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git sched/eevdf
head:   9569132375bb97144e975d018b87570ed12a7c99
commit: 50d21bf6811d6a091174cb13a4e7ad4566da7323 [14/31] sched/fair: Introduce SIS_CURRENT to wake up short task on current CPU
config: i386-defconfig (https://download.01.org/0day-ci/archive/20230501/202305010804.9gJ8guJp-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build):
        # https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git/commit/?id=50d21bf6811d6a091174cb13a4e7ad4566da7323
        git remote add peterz-queue https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git
        git fetch --no-tags peterz-queue sched/eevdf
        git checkout 50d21bf6811d6a091174cb13a4e7ad4566da7323
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=i386 olddefconfig
        make W=1 O=build_dir ARCH=i386 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202305010804.9gJ8guJp-lkp@intel.com/

All errors (new ones prefixed by >>):

   kernel/sched/fair.c: In function 'wake_on_current':
>> kernel/sched/fair.c:6625:48: error: 'sysctl_sched_miration_cost' undeclared (first use in this function); did you mean 'sysctl_sched_migration_cost'?
    6625 |         if (!p->se.avg_dur || p->se.avg_dur >= sysctl_sched_miration_cost)
         |                                                ^~~~~~~~~~~~~~~~~~~~~~~~~~
         |                                                sysctl_sched_migration_cost
   kernel/sched/fair.c:6625:48: note: each undeclared identifier is reported only once for each function it appears in


vim +6625 kernel/sched/fair.c

  6596	
  6597	/*
  6598	 * Wake up the task on current CPU, if the following conditions are met:
  6599	 *
  6600	 * 1. waker A is the only running task on this_cpu
  6601	 * 3. A is a short duration task (waker will fall asleep soon)
  6602	 * 4. wakee B is a short duration task (impact of B on A is minor)
  6603	 * 5. A and B wake up each other alternately
  6604	 */
  6605	static bool
  6606	wake_on_current(int this_cpu, struct task_struct *p)
  6607	{
  6608		if (!sched_feat(SIS_CURRENT))
  6609			return false;
  6610	
  6611		if (cpu_rq(this_cpu)->nr_running > 1)
  6612			return false;
  6613	
  6614		/*
  6615		 * If a task switches in and then voluntarily relinquishes the
  6616		 * CPU quickly, it is regarded as a short duration task. In that
  6617		 * way, the short waker is likely to relinquish the CPU soon, which
  6618		 * provides room for the wakee. Meanwhile, a short wakee would bring
  6619		 * minor impact to the target rq. Put the short waker and wakee together
  6620		 * bring benefit to cache-share task pairs and avoid migration overhead.
  6621		 */
  6622		if (!current->se.avg_dur || current->se.avg_dur >= sysctl_sched_migration_cost)
  6623			return false;
  6624	
> 6625		if (!p->se.avg_dur || p->se.avg_dur >= sysctl_sched_miration_cost)
  6626			return false;
  6627	
  6628		if (current->wakee_flips || p->wakee_flips)
  6629			return false;
  6630	
  6631		if (current->last_wakee != p || p->last_wakee != current)
  6632			return false;
  6633	
  6634		return true;
  6635	}
  6636	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
