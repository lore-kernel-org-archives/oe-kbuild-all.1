Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E896E11707
	for <oe-kbuild-all@lists.linux.dev>; Fri,  8 Mar 2024 23:49:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709941748; cv=none; b=mB2rcjIrP54AfmJUa50Za0xid8P6CWpFiXN5EVxJH/GQ0KUQVUWdgHAJe2upCQm0Op1Kp6kGqrNsm4JXayjUZYEgGag9RrxCuLQBWTEgcRF03KJ8EiFa/qI8vCDoaBLbezhaAZCLD1la7FxM/x0OEYTYO25VlXKtavSp36fTeHA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709941748; c=relaxed/simple;
	bh=mPd9cj9H2+h7nZ8dA077uS1Zh5e+6GIdJIW2cfbRcak=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=XTolkXqZ7NLBzvvB4p08j1RRt9yxK/9Oq39N1rnsFCNeFoUT1G5a4u2AU5LFTugnR+1GCyuBj8ssbE6hD/3A0fKu0gYphxlHL7yFtvx7AjAYvRuDgpCx+y6+VQHQajbdx001cnqw2QbNrpS0mfqlUhOXTjWrx0nbL6e0upunNUk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UMAXeF4f; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UMAXeF4f"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709941747; x=1741477747;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=mPd9cj9H2+h7nZ8dA077uS1Zh5e+6GIdJIW2cfbRcak=;
  b=UMAXeF4fQM100Ol3ZRxGbLUjzIxUgY/a20N1rQ7m+eIBhyaf1I6KUC+9
   Se/ELG2JG5MWmuLED0afiL8W7zg/ooy5auwOvrJXx2C8bAWj/qxt8oyCD
   T2lVNS8pVqSKbdEc++m1VnR8oiNYC2DYuaCwVu92Rm1g7cDoAYyr6hrmH
   rJmmQyO5Ff9hHSrBxqdpE++go/EnGrXd7TsqCvy3sCL1Hy1rtbuJwJtzt
   nNbM5qJ0cmDaw9qm5KLPd6ojkWmWi/vPxuJp/nQ2SZwRcn/P5e/0UzBOa
   SgfRlKChwBNDO75barERSQlRSOpOU38HRVZvsEKDfK4wKZsIPl+z4GkY5
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11007"; a="4851452"
X-IronPort-AV: E=Sophos;i="6.07,111,1708416000"; 
   d="scan'208";a="4851452"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Mar 2024 15:49:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,111,1708416000"; 
   d="scan'208";a="10699300"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 08 Mar 2024 15:49:05 -0800
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rijxW-0006oJ-37;
	Fri, 08 Mar 2024 23:49:02 +0000
Date: Sat, 9 Mar 2024 07:48:50 +0800
From: kernel test robot <lkp@intel.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: oe-kbuild-all@lists.linux.dev, Suleiman Souhlal <suleiman@google.com>,
	Daniel Bristot de Oliveira <bristot@kernel.org>
Subject: [jfern:sched/dlserver.debug.mar3.2024 29986/30000]
 kernel/sched/rt.c:1078:9: warning: ISO C90 forbids mixed declarations and
 code
Message-ID: <202403090722.YMArlnWO-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jfern/linux.git sched/dlserver.debug.mar3.2024
head:   6890cea305eadbebc9f3fcf8d31c6672af797ee5
commit: 7215a33a192d323e37c69338bf9db3a88214d33a [29986/30000] BACKPORT: FROMGIT: sched/rt: Remove default bandwidth control
config: sh-allyesconfig (https://download.01.org/0day-ci/archive/20240309/202403090722.YMArlnWO-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240309/202403090722.YMArlnWO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403090722.YMArlnWO-lkp@intel.com/

All warnings (new ones prefixed by >>):

   kernel/sched/rt.c:154:6: error: redefinition of 'init_rt_rq'
     154 | void init_rt_rq(struct rt_rq *rt_rq)
         |      ^~~~~~~~~~
   kernel/sched/rt.c:56:6: note: previous definition of 'init_rt_rq' with type 'void(struct rt_rq *)'
      56 | void init_rt_rq(struct rt_rq *rt_rq)
         |      ^~~~~~~~~~
   kernel/sched/rt.c:684:6: warning: no previous prototype for 'sched_rt_bandwidth_account' [-Wmissing-prototypes]
     684 | bool sched_rt_bandwidth_account(struct rt_rq *rt_rq)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/sched/rt.c: In function 'update_curr_rt':
>> kernel/sched/rt.c:1078:9: warning: ISO C90 forbids mixed declarations and code [-Wdeclaration-after-statement]
    1078 |         struct sched_rt_entity *rt_se = &curr->rt;
         |         ^~~~~~


vim +1078 kernel/sched/rt.c

  1060	
  1061	/*
  1062	 * Update the current task's runtime statistics. Skip current tasks that
  1063	 * are not in our scheduling class.
  1064	 */
  1065	static void update_curr_rt(struct rq *rq)
  1066	{
  1067		struct task_struct *curr = rq->curr;
  1068		s64 delta_exec;
  1069	
  1070		if (curr->sched_class != &rt_sched_class)
  1071			return;
  1072	
  1073		delta_exec = update_curr_common(rq);
  1074		if (unlikely(delta_exec <= 0))
  1075			return;
  1076	
  1077	#ifdef CONFIG_RT_GROUP_SCHED
> 1078		struct sched_rt_entity *rt_se = &curr->rt;
  1079	
  1080		if (!rt_bandwidth_enabled())
  1081			return;
  1082	
  1083		for_each_sched_rt_entity(rt_se) {
  1084			struct rt_rq *rt_rq = rt_rq_of_se(rt_se);
  1085			int exceeded;
  1086	
  1087			if (sched_rt_runtime(rt_rq) != RUNTIME_INF) {
  1088				raw_spin_lock(&rt_rq->rt_runtime_lock);
  1089				rt_rq->rt_time += delta_exec;
  1090				exceeded = sched_rt_runtime_exceeded(rt_rq);
  1091				if (exceeded)
  1092					resched_curr(rq);
  1093				raw_spin_unlock(&rt_rq->rt_runtime_lock);
  1094				if (exceeded)
  1095					do_start_rt_bandwidth(sched_rt_bandwidth(rt_rq));
  1096			}
  1097		}
  1098	#endif
  1099	}
  1100	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
