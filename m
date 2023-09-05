Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72B26DDD2
	for <oe-kbuild-all@lists.linux.dev>; Tue,  5 Sep 2023 20:45:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693946735; x=1725482735;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=nXdxZ1qADcpKhvtoxgvVbJKul9ITY55W6c+C2M4PaEM=;
  b=akuYN2V2YzDVYMWNhprH1cb7tO74oLQOOGXs46tpMXkHqgONh2zK2Rsv
   PGL31UvBYDwFzK60f0gVUFGmlDIUY+PXhjw/dSUsNvKMRGh7u3lSvtcQz
   O7fgs5VInGXuDhBeA5uVafAdThYtbE6DpTGU/gyV+2fbH2OsTICY1twAm
   pPS9OZcXvMXUWOTAwlGWHP7jBcEuiyx9hmd+6IKwxPXUch/YN0wIM0qnT
   rVuz+9FCxqwBfqC6KguyrQtJb4ccxRklCYzEqbbAhdtLctFuIW2Pr9Mzk
   r1rNJIbpobPM3h1l74R/0XrN/igS0uoYCMTuTA6sDQEmpETAkftejnvaT
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10824"; a="440872326"
X-IronPort-AV: E=Sophos;i="6.02,230,1688454000"; 
   d="scan'208";a="440872326"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Sep 2023 13:45:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10824"; a="856135833"
X-IronPort-AV: E=Sophos;i="6.02,230,1688454000"; 
   d="scan'208";a="856135833"
Received: from lkp-server02.sh.intel.com (HELO e0b2ea88afd5) ([10.239.97.151])
  by fmsmga002.fm.intel.com with ESMTP; 05 Sep 2023 13:45:33 -0700
Received: from kbuild by e0b2ea88afd5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qdcvT-00023z-1k;
	Tue, 05 Sep 2023 20:45:31 +0000
Date: Wed, 6 Sep 2023 04:44:33 +0800
From: kernel test robot <lkp@intel.com>
To: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH 1/2] sched: Rate limit migrations to 1 per 2ms per
 task
Message-ID: <202309060412.qsK3hmt5-lkp@intel.com>
References: <20230905171105.1005672-2-mathieu.desnoyers@efficios.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230905171105.1005672-2-mathieu.desnoyers@efficios.com>

Hi Mathieu,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on tip/sched/core]
[also build test WARNING on linus/master next-20230905]
[cannot apply to v6.5]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Mathieu-Desnoyers/sched-Rate-limit-migrations-to-1-per-2ms-per-task/20230906-030116
base:   tip/sched/core
patch link:    https://lore.kernel.org/r/20230905171105.1005672-2-mathieu.desnoyers%40efficios.com
patch subject: [RFC PATCH 1/2] sched: Rate limit migrations to 1 per 2ms per task
config: m68k-allyesconfig (https://download.01.org/0day-ci/archive/20230906/202309060412.qsK3hmt5-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230906/202309060412.qsK3hmt5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309060412.qsK3hmt5-lkp@intel.com/

All warnings (new ones prefixed by >>):

   kernel/sched/fair.c:702:6: warning: no previous prototype for 'update_entity_lag' [-Wmissing-prototypes]
     702 | void update_entity_lag(struct cfs_rq *cfs_rq, struct sched_entity *se)
         |      ^~~~~~~~~~~~~~~~~
   kernel/sched/fair.c:947:5: warning: no previous prototype for 'sched_update_scaling' [-Wmissing-prototypes]
     947 | int sched_update_scaling(void)
         |     ^~~~~~~~~~~~~~~~~~~~
>> kernel/sched/fair.c:962:13: warning: 'should_migrate_task' defined but not used [-Wunused-function]
     962 | static bool should_migrate_task(struct task_struct *p, int prev_cpu)
         |             ^~~~~~~~~~~~~~~~~~~


vim +/should_migrate_task +962 kernel/sched/fair.c

   961	
 > 962	static bool should_migrate_task(struct task_struct *p, int prev_cpu)
   963	{
   964		/* Rate limit task migration. */
   965		if (sched_clock_cpu(prev_cpu) < p->se.next_migration_time)
   966		       return false;
   967		return true;
   968	}
   969	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
