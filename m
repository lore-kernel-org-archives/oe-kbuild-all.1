Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 148C55645B
	for <oe-kbuild-all@lists.linux.dev>; Mon, 11 Mar 2024 19:31:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710185521; cv=none; b=pZ2KubBSNMmd1gDPkOK6SEsoo18dgLxleSaPZP7+xI9lgpwAwWdA+CHphW/MJkdV6CJ+eJiDP4XLDJOlpTuULNm6P0Ytf0+BvjzBjc9W5xOewiz4LIsXW/LWCTMMJdG3hI64325KflUuVQfv2br9CYZZn2mCLNDS2j9G05FQ5IU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710185521; c=relaxed/simple;
	bh=YjsCB9IxOyPp5bRK4HaT2R658/k2k6UeQETyhkHB2Xw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=YPTp/IPNPICYV828zhz9WRf+d6Jfx3ieq6yMqHgvJvuy3SqRTLa/Aijs2IezPlCwHpwgfwuy9/pnJ7Swdv05XfZWDkGAbv2svZJTALwueBEjOo/pn6hHr4ghtTq/mq+xTzxhr6HDXJVVYrC/il1WEB0nsQDxDJtHLzEOdxOrDwY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XNxl9E+S; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XNxl9E+S"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710185519; x=1741721519;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=YjsCB9IxOyPp5bRK4HaT2R658/k2k6UeQETyhkHB2Xw=;
  b=XNxl9E+SQOC2gZgCADFSyY7LY05+wmqcth/lqos5AzpY0i78tKNm9ywx
   YzbOrfg+SIMgM1Us81a6LgjTqZp/8339DLAYHX5gespTWZCvdcrWtd1nx
   aQ11x7RJ7dwYRol9jVamB5xuEB+kshqmQ1I7UpwMUNUDxHY1Lkt+oBo1z
   4EPuAFFnmJ6jpb+fR5WpRY9js6DYoR+mbP7Ni3ff+WwY+VgmOPMTYIV0J
   Tq9Z0C2ckGdR9+0XQ2ERAUPnEGmIK36fCj9dasL9OVOcx7LVs1wiFJdkt
   rLCjR02A+SQHcb/ZGeVoJjRJqTHsbI+ap6ncpGMCd1mkzWeQs7KJOLi3e
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11010"; a="4745250"
X-IronPort-AV: E=Sophos;i="6.07,117,1708416000"; 
   d="scan'208";a="4745250"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Mar 2024 12:31:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,117,1708416000"; 
   d="scan'208";a="15887350"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 11 Mar 2024 12:31:55 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rjlNJ-0009P7-1A;
	Mon, 11 Mar 2024 19:31:53 +0000
Date: Tue, 12 Mar 2024 03:31:29 +0800
From: kernel test robot <lkp@intel.com>
To: jasperwang@tencent.com, kaixuxia@tencent.com, frankjpliu@tencent.com,
	kasong@tencent.com, sagazchen@tencent.com, kernelxing@tencent.com,
	aurelianliu@tencent.com, jason.zeng@intel.com, wu.zheng@intel.com,
	yingbao.jia@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [opencloudos:linux-5.4/next 26765/27506] kernel/sched/fair.c:4147:9:
 warning: listing the stack pointer register 'rsp' in a clobber list is
 deprecated
Message-ID: <202403120326.vbFOILVL-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/OpenCloudOS/OpenCloudOS-Kernel.git linux-5.4/next
head:   3ba333344123321f5f312e69966bbc8e5533561f
commit: 67c4700e9b94fcd3b84cfa8ed42e5a130ac619e9 [26765/27506] sched: using rbp to restore rsp when exit dequeue_entity
config: x86_64-buildonly-randconfig-003-20240305 (https://download.01.org/0day-ci/archive/20240312/202403120326.vbFOILVL-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240312/202403120326.vbFOILVL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403120326.vbFOILVL-lkp@intel.com/

All warnings (new ones prefixed by >>):

   kernel/sched/fair.c:4851:5: warning: no previous prototype for 'runtime_refresh_within' [-Wmissing-prototypes]
    4851 | int runtime_refresh_within(struct cfs_bandwidth *cfs_b, u64 min_expire)
         |     ^~~~~~~~~~~~~~~~~~~~~~
   kernel/sched/fair.c:4868:6: warning: no previous prototype for 'start_cfs_slack_bandwidth' [-Wmissing-prototypes]
    4868 | void start_cfs_slack_bandwidth(struct cfs_bandwidth *cfs_b)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/sched/fair.c: In function 'dequeue_entity':
>> kernel/sched/fair.c:4147:9: warning: listing the stack pointer register 'rsp' in a clobber list is deprecated [-Wdeprecated]
    4147 |         asm volatile("" : : : "rsp");
         |         ^~~
   kernel/sched/fair.c:4147:9: note: the value of the stack pointer after an 'asm' statement must be the same as it was before the statement


vim +/rsp +4147 kernel/sched/fair.c

  4093	
  4094	static void
  4095	dequeue_entity(struct cfs_rq *cfs_rq, struct sched_entity *se, int flags)
  4096	{
  4097		/*
  4098		 * Update run-time statistics of the 'current'.
  4099		 */
  4100		update_curr(cfs_rq);
  4101	
  4102		/*
  4103		 * When dequeuing a sched_entity, we must:
  4104		 *   - Update loads to have both entity and cfs_rq synced with now.
  4105		 *   - Subtract its load from the cfs_rq->runnable_avg.
  4106		 *   - Subtract its previous weight from cfs_rq->load.weight.
  4107		 *   - For group entity, update its weight to reflect the new share
  4108		 *     of its group cfs_rq.
  4109		 */
  4110		update_load_avg(cfs_rq, se, UPDATE_TG);
  4111		dequeue_runnable_load_avg(cfs_rq, se);
  4112	
  4113		update_stats_dequeue(cfs_rq, se, flags);
  4114	
  4115		clear_buddies(cfs_rq, se);
  4116	
  4117		if (se != cfs_rq->curr)
  4118			__dequeue_entity(cfs_rq, se);
  4119		se->on_rq = 0;
  4120		account_entity_dequeue(cfs_rq, se);
  4121	
  4122		/*
  4123		 * Normalize after update_curr(); which will also have moved
  4124		 * min_vruntime if @se is the one holding it back. But before doing
  4125		 * update_min_vruntime() again, which will discount @se's position and
  4126		 * can move min_vruntime forward still more.
  4127		 */
  4128		if (!(flags & DEQUEUE_SLEEP))
  4129			se->vruntime -= cfs_rq->min_vruntime;
  4130	
  4131		/* return excess runtime on last dequeue */
  4132		return_cfs_rq_runtime(cfs_rq);
  4133	
  4134		update_cfs_group(se);
  4135	
  4136		/*
  4137		 * Now advance min_vruntime if @se was the entity holding it back,
  4138		 * except when: DEQUEUE_SAVE && !DEQUEUE_MOVE, in this case we'll be
  4139		 * put back on, and if we advance min_vruntime, we'll be placed back
  4140		 * further than we started -- ie. we'll be penalized.
  4141		 */
  4142		if ((flags & (DEQUEUE_SAVE | DEQUEUE_MOVE)) != DEQUEUE_SAVE)
  4143			update_min_vruntime(cfs_rq);
  4144	
  4145	#ifdef	CONFIG_X86_64
  4146		/* Declare rsp register is destroyed, let gcc using rbp to restore rsp. */
> 4147		asm volatile("" : : : "rsp");
  4148	#endif
  4149	}
  4150	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
