Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26061623
	for <oe-kbuild-all@lists.linux.dev>; Sun,  3 Sep 2023 00:54:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693702479; x=1725238479;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=mNUmShgf5Zg4yZj1JDYHI9ILNQMngWATJUQMtTE7F6o=;
  b=L38bKu32XOy0o/IpP3FJ1mWaCC8r4XpmnppO3zmrKlNe9S89DNvcxU/4
   uYMM6nCWNug2p26O8acjNYUV/23mEE1fPeIrhCyfGGI/eFCZtWhm21yGF
   tLeaSsQmXLodq48b11b32LkVkP3XnO0TpOD72JL68TW/G52BSu4Yj7iNT
   rdNN94/k+X2DvO2wO6QmRSxWeeWP/MixAuFS3j+x5tgJoxD7Yh3uTjrg3
   GSBFpHX//OfsKRkRPH+Ce1J29UfCl4bDq3tg1sp7UvD1mE04gvF2ia4S0
   JMTZPeK6d/6lT2i+lwOA8Ce6xKV0A8Zd/a02tiKU9jOOwszohj5QOGSdX
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10821"; a="379131529"
X-IronPort-AV: E=Sophos;i="6.02,223,1688454000"; 
   d="scan'208";a="379131529"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2023 17:54:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10821"; a="987102186"
X-IronPort-AV: E=Sophos;i="6.02,223,1688454000"; 
   d="scan'208";a="987102186"
Received: from lkp-server01.sh.intel.com (HELO 5d8055a4f6aa) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 02 Sep 2023 17:54:37 -0700
Received: from kbuild by 5d8055a4f6aa with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qcbNr-0002lJ-10;
	Sun, 03 Sep 2023 00:54:35 +0000
Date: Sun, 3 Sep 2023 08:54:03 +0800
From: kernel test robot <lkp@intel.com>
To: Qais Yousef <qyousef@layalina.io>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [qais-yousef:generalized-misfit-lb 6/13]
 kernel/sched/fair.c:4919:19: error: 'struct rq' has no member named
 'misfit_reason'
Message-ID: <202309030849.5DRFYhRY-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/qais-yousef/linux generalized-misfit-lb
head:   4a3c3c52f83a7b4cfd5248f4e6b3330e178ec3a7
commit: dda165708a2fe535b362a02123143eae6c0a20e8 [6/13] sched/fair: Add a misfit reason
config: x86_64-defconfig (https://download.01.org/0day-ci/archive/20230903/202309030849.5DRFYhRY-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230903/202309030849.5DRFYhRY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309030849.5DRFYhRY-lkp@intel.com/

All errors (new ones prefixed by >>):

   kernel/sched/fair.c:702:6: warning: no previous prototype for 'update_entity_lag' [-Wmissing-prototypes]
     702 | void update_entity_lag(struct cfs_rq *cfs_rq, struct sched_entity *se)
         |      ^~~~~~~~~~~~~~~~~
   kernel/sched/fair.c: In function 'update_misfit_status':
>> kernel/sched/fair.c:4919:19: error: 'struct rq' has no member named 'misfit_reason'
    4919 |                 rq->misfit_reason = -1;
         |                   ^~
   kernel/sched/fair.c:4928:11: error: 'struct rq' has no member named 'misfit_reason'
    4928 |         rq->misfit_reason = reason;
         |           ^~
   kernel/sched/fair.c:4911:14: warning: unused variable 'need_update' [-Wunused-variable]
    4911 |         bool need_update = true;
         |              ^~~~~~~~~~~
   kernel/sched/fair.c: In function 'update_sg_lb_stats':
   kernel/sched/fair.c:9712:62: error: 'struct rq' has no member named 'misfit_reason'
    9712 |                                 sgs->group_misfit_reason = rq->misfit_reason;
         |                                                              ^~


vim +4919 kernel/sched/fair.c

  4908	
  4909	static inline void update_misfit_status(struct task_struct *p, struct rq *rq)
  4910	{
  4911		bool need_update = true;
  4912		misfit_reason_t reason;
  4913	
  4914		if (!sched_asym_cpucap_active())
  4915			return;
  4916	
  4917		if (!is_misfit_task(p, rq, &reason)) {
  4918			rq->misfit_task_load = 0;
> 4919			rq->misfit_reason = -1;
  4920			return;
  4921		}
  4922	
  4923		/*
  4924		 * Make sure that misfit_task_load will not be null even if
  4925		 * task_h_load() returns 0.
  4926		 */
  4927		rq->misfit_task_load = max_t(unsigned long, task_h_load(p), 1);
  4928		rq->misfit_reason = reason;
  4929	}
  4930	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
