Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0F29370
	for <oe-kbuild-all@lists.linux.dev>; Sat,  9 Sep 2023 07:19:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694243996; x=1725779996;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=vh9HCORkh+LipUgMYGJHsnzqSsevc7lgUiQvGc6E7hU=;
  b=JTbxIuQMBNj8w7hI1JO8sgAyOtQsbgzUPBc0YzHaW+Ia2OTZHa9mMqeJ
   pWZUqBZD2HuKpSSBnOebZhFNZc9qvFN35XYyOf8Mk/Dk78fLZ/PP7BDXQ
   y+rbGTjDMu5KryNIqlHzNdHkSK2ahFtqhuYjW5SWITnpHshjFHz+zDIc7
   /6EmJ0hLUQiZw0bRbB4P5Iu/J22IH/bHjf7sPCXFTlBILoZcQWXAjbrIe
   APYEIhsATDpkr54NUp2n3T2b5YJZpcpQaPVX7Zl2gtgSlrxIavg2e8h1Q
   ZUtdHNzBjwvEWszGYxl+3g70WMiKUh+tiiQDdUZyK+LMaCsFxo9FFo2Au
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10827"; a="357263606"
X-IronPort-AV: E=Sophos;i="6.02,239,1688454000"; 
   d="scan'208";a="357263606"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2023 00:19:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10827"; a="885910889"
X-IronPort-AV: E=Sophos;i="6.02,239,1688454000"; 
   d="scan'208";a="885910889"
Received: from lkp-server01.sh.intel.com (HELO 59b3c6e06877) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 09 Sep 2023 00:19:31 -0700
Received: from kbuild by 59b3c6e06877 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qesFv-00034E-2t;
	Sat, 09 Sep 2023 07:19:47 +0000
Date: Sat, 9 Sep 2023 15:18:34 +0800
From: kernel test robot <lkp@intel.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [peterz-queue:sched/wip 2/2] kernel/sched/fair.c:3584
 dequeue_load_avg() warn: unsigned 'val' is never less than zero.
Message-ID: <202309091529.JUVkM18y-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git sched/wip
head:   5ccdb005fefaae161bc57d69c95378d0677cf5c8
commit: 5ccdb005fefaae161bc57d69c95378d0677cf5c8 [2/2] sched/fair: Fold the sched_avg update
config: i386-randconfig-141-20230909 (https://download.01.org/0day-ci/archive/20230909/202309091529.JUVkM18y-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230909/202309091529.JUVkM18y-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309091529.JUVkM18y-lkp@intel.com/

smatch warnings:
kernel/sched/fair.c:3584 dequeue_load_avg() warn: unsigned 'val' is never less than zero.
kernel/sched/fair.c:3584 dequeue_load_avg() warn: unsigned 'val' is never less than zero.
kernel/sched/fair.c:3578 enqueue_load_avg() warn: unsigned 'val' is never less than zero.
kernel/sched/fair.c:3578 enqueue_load_avg() warn: unsigned 'val' is never less than zero.
kernel/sched/fair.c:4421 detach_entity_load_avg() warn: unsigned 'val' is never less than zero.
kernel/sched/fair.c:4421 detach_entity_load_avg() warn: unsigned 'val' is never less than zero.
kernel/sched/fair.c:4330 update_cfs_rq_load_avg() warn: unsigned 'val' is never less than zero.
kernel/sched/fair.c:4330 update_cfs_rq_load_avg() warn: unsigned 'val' is never less than zero.

vim +/val +3584 kernel/sched/fair.c

  3577	
> 3578		__update_sa(&cfs_rq->avg, load, se->avg.load_avg, se->avg.load_sum);
  3579	}
  3580	
  3581	static inline void
  3582	dequeue_load_avg(struct cfs_rq *cfs_rq, struct sched_entity *se)
  3583	{
> 3584		__update_sa(&cfs_rq->avg, load, -se->avg.load_avg, -se->avg.load_sum);
  3585	}
  3586	#else
  3587	static inline void
  3588	enqueue_load_avg(struct cfs_rq *cfs_rq, struct sched_entity *se) { }
  3589	static inline void
  3590	dequeue_load_avg(struct cfs_rq *cfs_rq, struct sched_entity *se) { }
  3591	#endif
  3592	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
