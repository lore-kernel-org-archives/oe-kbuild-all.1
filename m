Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25D09408F8
	for <oe-kbuild-all@lists.linux.dev>; Sat, 10 Jun 2023 05:21:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686374478; x=1717910478;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=qRvMV/pATCejZvtDHqNVF5VH0qTRGiDH2pdo6MFhkjY=;
  b=WVWO4Er2nesp8LJKljisLqBkmj4FBEKQGuJaOJsBWkhdzqyPC/xpW2Ft
   0GeOAaLbQbcbkIRayKd9xkNgnQmDWEFDzRmRmDJPOOslZbKy3wfmMN9bV
   y8ncJkPP6OSLNSYiviO1QfOZ46qPxFWtPfq0DTVmEfc2yAFR8P8WoQtmf
   KF7m2+eaii/1TSuB+rEtsllJ99alQ8ZP639RkooDOdBA31Cdqmn8LJJ8k
   1E95bYqd/6ES2IOkm34T1hiOkXlrGNo+580+5pqL4s25nToMjxhbAewBC
   0ftrA4VGc98ncMe9hE7p/r+Oz3Q2MSjMcVXZmUs/HLZVdDgQLk2ndtLDB
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10736"; a="338094271"
X-IronPort-AV: E=Sophos;i="6.00,231,1681196400"; 
   d="scan'208";a="338094271"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jun 2023 22:21:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10736"; a="854960641"
X-IronPort-AV: E=Sophos;i="6.00,231,1681196400"; 
   d="scan'208";a="854960641"
Received: from lkp-server01.sh.intel.com (HELO 15ab08e44a81) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 09 Jun 2023 22:21:16 -0700
Received: from kbuild by 15ab08e44a81 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q7r2J-0009m2-2j;
	Sat, 10 Jun 2023 05:21:15 +0000
Date: Sat, 10 Jun 2023 13:20:46 +0800
From: kernel test robot <lkp@intel.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [peterz-queue:core/guards 12/58] kernel/sched/core.c:5668:25: error:
 break statement not within loop or switch
Message-ID: <202306101341.DxycoDTq-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git core/guards
head:   dd132e83d180b932488bcf612576529e6163a1ea
commit: 4e681a4953fa0bf949922b8b39987c3d9f037f43 [12/58] sched: Simplify sched_tick_remote()
config: x86_64-rhel-8.3 (https://download.01.org/0day-ci/archive/20230610/202306101341.DxycoDTq-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build):
        # https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git/commit/?id=4e681a4953fa0bf949922b8b39987c3d9f037f43
        git remote add peterz-queue https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git
        git fetch --no-tags peterz-queue core/guards
        git checkout 4e681a4953fa0bf949922b8b39987c3d9f037f43
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=x86_64 olddefconfig
        make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash kernel/

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306101341.DxycoDTq-lkp@intel.com/

All errors (new ones prefixed by >>):

   kernel/sched/core.c: In function 'sched_tick_remote':
>> kernel/sched/core.c:5668:25: error: break statement not within loop or switch
    5668 |                         break;
         |                         ^~~~~


vim +5668 kernel/sched/core.c

  5647	
  5648	static void sched_tick_remote(struct work_struct *work)
  5649	{
  5650		struct delayed_work *dwork = to_delayed_work(work);
  5651		struct tick_work *twork = container_of(dwork, struct tick_work, work);
  5652		int cpu = twork->cpu;
  5653		struct rq *rq = cpu_rq(cpu);
  5654		int os;
  5655	
  5656		/*
  5657		 * Handle the tick only if it appears the remote CPU is running in full
  5658		 * dynticks mode. The check is racy by nature, but missing a tick or
  5659		 * having one too much is no big deal because the scheduler tick updates
  5660		 * statistics and checks timeslices in a time-independent way, regardless
  5661		 * of when exactly it is running.
  5662		 */
  5663		if (tick_nohz_tick_stopped_cpu(cpu)) {
  5664			guard(rq_lock_irq)(rq);
  5665			struct task_struct *curr = rq->curr;
  5666	
  5667			if (cpu_is_offline(cpu))
> 5668				break;
  5669	
  5670			update_rq_clock(rq);
  5671	
  5672			if (!is_idle_task(curr)) {
  5673				/*
  5674				 * Make sure the next tick runs within a
  5675				 * reasonable amount of time.
  5676				 */
  5677				u64 delta = rq_clock_task(rq) - curr->se.exec_start;
  5678				WARN_ON_ONCE(delta > (u64)NSEC_PER_SEC * 3);
  5679			}
  5680			curr->sched_class->task_tick(rq, curr, 0);
  5681	
  5682			calc_load_nohz_remote(rq);
  5683		}
  5684	
  5685		/*
  5686		 * Run the remote tick once per second (1Hz). This arbitrary
  5687		 * frequency is large enough to avoid overload but short enough
  5688		 * to keep scheduler internal stats reasonably up to date.  But
  5689		 * first update state to reflect hotplug activity if required.
  5690		 */
  5691		os = atomic_fetch_add_unless(&twork->state, -1, TICK_SCHED_REMOTE_RUNNING);
  5692		WARN_ON_ONCE(os == TICK_SCHED_REMOTE_OFFLINE);
  5693		if (os == TICK_SCHED_REMOTE_RUNNING)
  5694			queue_delayed_work(system_unbound_wq, dwork, HZ);
  5695	}
  5696	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
