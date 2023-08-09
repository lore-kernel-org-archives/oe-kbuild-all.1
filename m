Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10F7F3224
	for <oe-kbuild-all@lists.linux.dev>; Wed,  9 Aug 2023 23:46:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691624816; x=1723160816;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Nh02a3Wx63DuGkpFCqTWpwqBOtNr5Uot08pmPLWQrDI=;
  b=ekxnzGvFcoTeGObK0IhlI2THWM29S9Aqp+K2R3K6IuWohtT4Ad8E88Fw
   Qrmsda68T+N3YuLFsmgrwSxx4z/gpuohiSqXNSWmDyMQrGZl0xB2O8aGp
   cReXC99qzVWqmhAF6fUwwE6ipeIjlqLbrv62kVA/YuauqGjFWSlKWDbTJ
   i0mw+Ll/m0rHMK1237NLhUsisFT8nOu3yhS1+TzZfhmKiyEQd4/Dwin0D
   e41MjY+pMG+LEoyQrwfDyZFPAqWcdXh9Tv2RsdYwi0/VkSqUlkLYRZepD
   EX4iNMby4IdUfagkdI5x8g1zUGP++wqGRtyVqJ3G1YszjfpFfpJOqQ8KK
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10797"; a="374971298"
X-IronPort-AV: E=Sophos;i="6.01,160,1684825200"; 
   d="scan'208";a="374971298"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Aug 2023 16:46:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10797"; a="1062681523"
X-IronPort-AV: E=Sophos;i="6.01,160,1684825200"; 
   d="scan'208";a="1062681523"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 09 Aug 2023 16:46:50 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qTst6-0006V8-3A;
	Wed, 09 Aug 2023 23:46:48 +0000
Date: Thu, 10 Aug 2023 07:46:37 +0800
From: kernel test robot <lkp@intel.com>
To: David Vernet <void@manifault.com>, linux-kernel@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, peterz@infradead.org, mingo@redhat.com,
	juri.lelli@redhat.com, vincent.guittot@linaro.org,
	dietmar.eggemann@arm.com, rostedt@goodmis.org, bsegall@google.com,
	mgorman@suse.de, bristot@redhat.com, vschneid@redhat.com,
	tj@kernel.org, roman.gushchin@linux.dev, gautham.shenoy@amd.com,
	kprateek.nayak@amd.com, aaron.lu@intel.com,
	wuyun.abel@bytedance.com, kernel-team@meta.com
Subject: Re: [PATCH v3 7/7] sched: Shard per-LLC shared runqueues
Message-ID: <202308100717.LGL1juJR-lkp@intel.com>
References: <20230809221218.163894-8-void@manifault.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230809221218.163894-8-void@manifault.com>

Hi David,

kernel test robot noticed the following build warnings:

[auto build test WARNING on tip/sched/core]
[cannot apply to linus/master v6.5-rc5 next-20230809]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/David-Vernet/sched-Expose-move_queued_task-from-core-c/20230810-061611
base:   tip/sched/core
patch link:    https://lore.kernel.org/r/20230809221218.163894-8-void%40manifault.com
patch subject: [PATCH v3 7/7] sched: Shard per-LLC shared runqueues
config: loongarch-allyesconfig (https://download.01.org/0day-ci/archive/20230810/202308100717.LGL1juJR-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230810/202308100717.LGL1juJR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308100717.LGL1juJR-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/sched/fair.c:198: warning: expecting prototype for struct shared_runq. Prototype was for struct shared_runq_shard instead


vim +198 kernel/sched/fair.c

05289b90c2e40a Thara Gopinath 2020-02-21  141  
7cc7fb0f3200dd David Vernet   2023-08-09  142  /**
7cc7fb0f3200dd David Vernet   2023-08-09  143   * struct shared_runq - Per-LLC queue structure for enqueuing and migrating
7cc7fb0f3200dd David Vernet   2023-08-09  144   * runnable tasks within an LLC.
7cc7fb0f3200dd David Vernet   2023-08-09  145   *
54c971b941e0bd David Vernet   2023-08-09  146   * struct shared_runq_shard - A structure containing a task list and a spinlock
54c971b941e0bd David Vernet   2023-08-09  147   * for a subset of cores in a struct shared_runq.
54c971b941e0bd David Vernet   2023-08-09  148   *
7cc7fb0f3200dd David Vernet   2023-08-09  149   * WHAT
7cc7fb0f3200dd David Vernet   2023-08-09  150   * ====
7cc7fb0f3200dd David Vernet   2023-08-09  151   *
7cc7fb0f3200dd David Vernet   2023-08-09  152   * This structure enables the scheduler to be more aggressively work
54c971b941e0bd David Vernet   2023-08-09  153   * conserving, by placing waking tasks on a per-LLC FIFO queue shard that can
54c971b941e0bd David Vernet   2023-08-09  154   * then be pulled from when another core in the LLC is going to go idle.
54c971b941e0bd David Vernet   2023-08-09  155   *
54c971b941e0bd David Vernet   2023-08-09  156   * struct rq stores two pointers in its struct cfs_rq:
54c971b941e0bd David Vernet   2023-08-09  157   *
54c971b941e0bd David Vernet   2023-08-09  158   * 1. The per-LLC struct shared_runq which contains one or more shards of
54c971b941e0bd David Vernet   2023-08-09  159   *    enqueued tasks.
7cc7fb0f3200dd David Vernet   2023-08-09  160   *
54c971b941e0bd David Vernet   2023-08-09  161   * 2. The shard inside of the per-LLC struct shared_runq which contains the
54c971b941e0bd David Vernet   2023-08-09  162   *    list of runnable tasks for that shard.
54c971b941e0bd David Vernet   2023-08-09  163   *
54c971b941e0bd David Vernet   2023-08-09  164   * Waking tasks are enqueued in the calling CPU's struct shared_runq_shard in
54c971b941e0bd David Vernet   2023-08-09  165   * __enqueue_entity(), and are opportunistically pulled from the shared_runq in
54c971b941e0bd David Vernet   2023-08-09  166   * newidle_balance(). Pulling from shards is an O(# shards) operation.
7cc7fb0f3200dd David Vernet   2023-08-09  167   *
7cc7fb0f3200dd David Vernet   2023-08-09  168   * There is currently no task-stealing between shared_runqs in different LLCs,
7cc7fb0f3200dd David Vernet   2023-08-09  169   * which means that shared_runq is not fully work conserving. This could be
7cc7fb0f3200dd David Vernet   2023-08-09  170   * added at a later time, with tasks likely only being stolen across
7cc7fb0f3200dd David Vernet   2023-08-09  171   * shared_runqs on the same NUMA node to avoid violating NUMA affinities.
7cc7fb0f3200dd David Vernet   2023-08-09  172   *
7cc7fb0f3200dd David Vernet   2023-08-09  173   * HOW
7cc7fb0f3200dd David Vernet   2023-08-09  174   * ===
7cc7fb0f3200dd David Vernet   2023-08-09  175   *
54c971b941e0bd David Vernet   2023-08-09  176   * A struct shared_runq_shard is comprised of a list, and a spinlock for
54c971b941e0bd David Vernet   2023-08-09  177   * synchronization.  Given that the critical section for a shared_runq is
54c971b941e0bd David Vernet   2023-08-09  178   * typically a fast list operation, and that the shared_runq_shard is localized
54c971b941e0bd David Vernet   2023-08-09  179   * to a subset of cores on a single LLC (plus other cores in the LLC that pull
54c971b941e0bd David Vernet   2023-08-09  180   * from the shard in newidle_balance()), the spinlock will typically only be
54c971b941e0bd David Vernet   2023-08-09  181   * contended on workloads that do little else other than hammer the runqueue.
7cc7fb0f3200dd David Vernet   2023-08-09  182   *
7cc7fb0f3200dd David Vernet   2023-08-09  183   * WHY
7cc7fb0f3200dd David Vernet   2023-08-09  184   * ===
7cc7fb0f3200dd David Vernet   2023-08-09  185   *
7cc7fb0f3200dd David Vernet   2023-08-09  186   * As mentioned above, the main benefit of shared_runq is that it enables more
7cc7fb0f3200dd David Vernet   2023-08-09  187   * aggressive work conservation in the scheduler. This can benefit workloads
7cc7fb0f3200dd David Vernet   2023-08-09  188   * that benefit more from CPU utilization than from L1/L2 cache locality.
7cc7fb0f3200dd David Vernet   2023-08-09  189   *
7cc7fb0f3200dd David Vernet   2023-08-09  190   * shared_runqs are segmented across LLCs both to avoid contention on the
7cc7fb0f3200dd David Vernet   2023-08-09  191   * shared_runq spinlock by minimizing the number of CPUs that could contend on
7cc7fb0f3200dd David Vernet   2023-08-09  192   * it, as well as to strike a balance between work conservation, and L3 cache
7cc7fb0f3200dd David Vernet   2023-08-09  193   * locality.
7cc7fb0f3200dd David Vernet   2023-08-09  194   */
54c971b941e0bd David Vernet   2023-08-09  195  struct shared_runq_shard {
7cc7fb0f3200dd David Vernet   2023-08-09  196  	struct list_head list;
7cc7fb0f3200dd David Vernet   2023-08-09  197  	raw_spinlock_t lock;
7cc7fb0f3200dd David Vernet   2023-08-09 @198  } ____cacheline_aligned;
7cc7fb0f3200dd David Vernet   2023-08-09  199  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
