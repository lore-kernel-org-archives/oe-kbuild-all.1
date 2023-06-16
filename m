Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6935C19E69
	for <oe-kbuild-all@lists.linux.dev>; Fri, 16 Jun 2023 17:37:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686937072; x=1718473072;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Lya5+hWPtGQob2fSGSN1O/pwjrNHGtV33qL148Pl1fc=;
  b=jEhKb1URqnAkpACNJ0WFwRFNPN03uzU/MB1bV/641xwv33VGKyuUr5KL
   meJlCV/qme7qeeZri8ZBQEO9GuY/D50ykknDEbSYP6llRFm3jIcQXxUsf
   KWQFvpuQzGWN55L1cua3N7N7HEBwMV8bhFYJSiQI3es7fT0Ouhhfro1vy
   wZgXWUVxA2CRb9u6kYcEmU5P3GUvsDRE4U4p7hFJg6OtozqFhbj/kKQaJ
   93yZ/9jkBjjhJKjNwGepZGOqi8t9wiF3vjnWZi8ITyt7j64yKA5TtRvps
   yXSzJ7R1VUNlwNdpaxvLVBKPIMFtLZaGMnB8KAlBnP0EMu7cKff3FYIYv
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10743"; a="356761398"
X-IronPort-AV: E=Sophos;i="6.00,248,1681196400"; 
   d="scan'208";a="356761398"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jun 2023 10:37:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10743"; a="825824951"
X-IronPort-AV: E=Sophos;i="6.00,248,1681196400"; 
   d="scan'208";a="825824951"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 16 Jun 2023 10:37:46 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qADOL-0001dM-2K;
	Fri, 16 Jun 2023 17:37:45 +0000
Date: Sat, 17 Jun 2023 01:37:08 +0800
From: kernel test robot <lkp@intel.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [peterz-queue:sched/eevdf-runtime 12/13]
 kernel/sched/fair.c:4932:29: error: expected ';' before 'return'
Message-ID: <202306170155.d0zUQNOP-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git sched/eevdf-runtime
head:   b1c0df77697486f6904dd18a149fe896d5a243a2
commit: f28db72712705ef0cc6c976153d28ba6dfce097c [12/13] sched/eevdf: Better handle mixed slice length
config: riscv-randconfig-r042-20230616 (https://download.01.org/0day-ci/archive/20230617/202306170155.d0zUQNOP-lkp@intel.com/config)
compiler: riscv32-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230617/202306170155.d0zUQNOP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306170155.d0zUQNOP-lkp@intel.com/

All errors (new ones prefixed by >>):

   kernel/sched/fair.c:704:6: warning: no previous prototype for 'update_entity_lag' [-Wmissing-prototypes]
     704 | void update_entity_lag(struct cfs_rq *cfs_rq, struct sched_entity *se)
         |      ^~~~~~~~~~~~~~~~~
   kernel/sched/fair.c: In function 'entity_has_slept':
>> kernel/sched/fair.c:4932:29: error: expected ';' before 'return'
    4932 |                 return false
         |                             ^
         |                             ;
    4933 | 
    4934 |         return true;
         |         ~~~~~~               
   kernel/sched/fair.c:4935:1: error: control reaches end of non-void function [-Werror=return-type]
    4935 | }
         | ^
   cc1: some warnings being treated as errors


vim +4932 kernel/sched/fair.c

  4912	
  4913	static inline bool
  4914	entity_has_slept(struct cfs_rq *cfs_rq, struct sched_entity *se, u64 vslice, int flags)
  4915	{
  4916		u64 now, vdelta;
  4917		s64 delta;
  4918	
  4919		if (!(flags & ENQUEUE_WAKEUP))
  4920			return false;
  4921	
  4922		if (flags & ENQUEUE_MIGRATED)
  4923			return true;
  4924	
  4925		now = rq_clock_task(rq_of(cfs_rq));
  4926		delta = now - se->exec_start;
  4927		if (delta < 0)
  4928			return false;
  4929	
  4930		vdelta = __calc_delta(delta, NICE_0_LOAD, &cfs_rq->load);
  4931		if (vdelta < vslice)
> 4932			return false
  4933	
  4934		return true;
  4935	}
  4936	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
