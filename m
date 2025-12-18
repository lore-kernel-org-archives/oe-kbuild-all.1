Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83F7431AF37
	for <oe-kbuild-all@lists.linux.dev>; Thu, 18 Dec 2025 11:32:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766057532; cv=none; b=CfA7IFDDQEFVn1HduZWeh7iEqEdhDb4BEE+6pjLG5LRR1rePHzs7BYd+6NOKAuO8maygcV5Vab6ASl9VzGtx/V0PPOfHxyu+R2mK2WJy7kxa9KM8VJNaftSuUqSB9s704UL+CvShnFYhXiQzvrnzxMwig+2cfBsTtsPaZ4tQRQQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766057532; c=relaxed/simple;
	bh=n5ay7WZw7hb1vGw8HynKfsBeOiBJJXh1WSCr6l7fL/M=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Qy4kUy2YZOr1+ZRI435hJs8KUcCe8PvU0YoR3y7PsJIvc6S56kXZ1DqmaNtDpuXcps97wVJgwmZRpoJUv0AMWvdrX/3M1HycbXuKjR3+1g2lN6+X4xc0im/zKRW+Fz3iobtMW+nbgAjZ6VRv2LpHGXsXSf5v/nUl1g8rCPrAmmY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LMgqy/Ik; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LMgqy/Ik"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766057531; x=1797593531;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=n5ay7WZw7hb1vGw8HynKfsBeOiBJJXh1WSCr6l7fL/M=;
  b=LMgqy/IkKxwF4j3VDi2OVobNgp05I1xYhgtI1Ixs5Vb7zPzh8S1T9RvR
   QQC42ToArPrsprKXSZA13WDSr3Zl+jVf7haTI1cbgxKCG7QWyAHNtUpm+
   mmZHlLE4PLKPFxQea/sKYqUsB2WJE+dU5LtA3OiFPV30QVWTwAe2aTKiC
   iQVKlbs6EaZ1XaFt24w5oPKIKFSP3Q04XLLsZw584g7l+dFPJ87yMFofg
   bPcvCmoRtaB7DBL6BatfFl9EbTJCE+2EJagJaN9tag/0waFdYy2LNT9aP
   1Sp+9M6u5RA21h6eR9RByWDa8VMKWxXiNZk4vMgtluX4XbIXt6BjQlfRI
   g==;
X-CSE-ConnectionGUID: jDjtRxrzSUq+yRUVKExRpw==
X-CSE-MsgGUID: O7vycgnBQhW+8CERkcnALg==
X-IronPort-AV: E=McAfee;i="6800,10657,11645"; a="67887635"
X-IronPort-AV: E=Sophos;i="6.21,158,1763452800"; 
   d="scan'208";a="67887635"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Dec 2025 03:32:09 -0800
X-CSE-ConnectionGUID: 8t5JH6q8QO68tGJ6YF00ew==
X-CSE-MsgGUID: /epy3H1iSe6KIY3i4lMsHg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,158,1763452800"; 
   d="scan'208";a="203632183"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by orviesa005.jf.intel.com with ESMTP; 18 Dec 2025 03:32:08 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vWCEn-000000003uO-2sOo;
	Thu, 18 Dec 2025 11:32:05 +0000
Date: Thu, 18 Dec 2025 12:31:32 +0100
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:devel-6.6 50/50] kernel/sched/fair.c:9181:6:
 warning: no previous prototype for 'id_can_stop_tick'
Message-ID: <202512181204.gLkrUhbU-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/anolis/intel-cloud-kernel.git devel-6.6
head:   5d719013902eb006756873427de3fc5cc5566531
commit: 4093033106109a3d632b6fec20885521c94cdeb0 [50/50] anolis: sched: push expellee tasks to a runnable cpu when expel starts
config: x86_64-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20251218/202512181204.gLkrUhbU-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251218/202512181204.gLkrUhbU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512181204.gLkrUhbU-lkp@intel.com/

All warnings (new ones prefixed by >>):

   kernel/sched/fair.c:4264:6: warning: no previous prototype for 'set_group_prefer_node' [-Wmissing-prototypes]
    4264 | void set_group_prefer_node(struct task_group *tg)
         |      ^~~~~~~~~~~~~~~~~~~~~
>> kernel/sched/fair.c:9181:6: warning: no previous prototype for 'id_can_stop_tick' [-Wmissing-prototypes]
    9181 | bool id_can_stop_tick(struct rq *rq)
         |      ^~~~~~~~~~~~~~~~


vim +/id_can_stop_tick +9181 kernel/sched/fair.c

  9172	
  9173	#if defined(CONFIG_NO_HZ_FULL) && defined(CONFIG_SMP)
  9174	bool id_can_stop_tick(struct rq *rq)
  9175	{
  9176		if (!sched_feat(ID_PUSH_EXPELLEE))
  9177			return true;
  9178		return !sched_idle_rq(rq);
  9179	}
  9180	#else
> 9181	bool id_can_stop_tick(struct rq *rq)
  9182	{
  9183		return true;
  9184	}
  9185	#endif
  9186	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
