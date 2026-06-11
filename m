Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F9B2367F3D
	for <oe-kbuild-all@lists.linux.dev>; Thu, 11 Jun 2026 23:09:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781219401; cv=none; b=RdaMpoNxxoIbmAIwxJ0ziD/P2BYPOqq74cpwNwXpWztg/7Nwmyv+OXqxsrh13Ms6jeqOX4Oxxnw0/eesUsXFzr+hBkoz5GuUAH+EyznVKOwbajKzL82K3K1JhC9P/f2/18UGa0cvtb89A22Xb1GgNys7VozBSR1HLRPkAtcuOA8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781219401; c=relaxed/simple;
	bh=AwboRArJQ/4PxScGGgIWXU+EvgrU9mo1y7PRNQI+7/w=;
	h=Date:From:To:Cc:Subject:Message-ID; b=F7KqqTloBYQ6h8+EQOT/nOCr97s71Rg+eyO1b0gYBwH2DfQfpxveGi9n34JeMsUr9vcibMLsp5SWi5AmcOWtYRQ4ZNm8oUimihYCTJP5K8cokvNbE35Nert+F3ebZJQiOKcBwiSzViGMXZxe25azL6W47CG7V5SKVoNEWjfDBQg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Og7dBwWH; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Og7dBwWH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781219399; x=1812755399;
  h=date:from:to:cc:subject:message-id;
  bh=AwboRArJQ/4PxScGGgIWXU+EvgrU9mo1y7PRNQI+7/w=;
  b=Og7dBwWHMgphGRDCE4URgtMM3dBo2I4bAyB+wSQjsYtTBfNJX/kNlR6X
   dFVMQrbo+prBmddd0jpxkkBpqop3aDWtycdHzS6hIlWlGqnkKmKlG+lA6
   ibcf/uhAmlAVmNwatWGxhJ8Ctb2VHKaDjpjz5IXyv4y2z1y50fSM27M0L
   iME/2POmJDCOryNY/68M0awu6dx6ncexzHA4Fv5YBXTfMEgDU1DCpBhBw
   tNS4clk9PddccweBoLXlNhC6oOJW4Fl0gpj65A648ZkwgcDjXFtx5vHfH
   WACVmd20G+qG/5NfTcVMmMGJdg0srXegDfI1UUewENWSvSl3GbtiK52r3
   g==;
X-CSE-ConnectionGUID: 8bNlHhwzQCepN1TUu/7DRw==
X-CSE-MsgGUID: XsAav/9yQgunH9e7yyfr5A==
X-IronPort-AV: E=McAfee;i="6800,10657,11813"; a="92727523"
X-IronPort-AV: E=Sophos;i="6.24,199,1774335600"; 
   d="scan'208";a="92727523"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2026 16:09:58 -0700
X-CSE-ConnectionGUID: G7zkL776QZmSYzbji8iX/Q==
X-CSE-MsgGUID: 6q5fP8ywSUGhJAnZq/Em4A==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 11 Jun 2026 16:09:57 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wXoX4-00000000NzD-3yAH;
	Thu, 11 Jun 2026 23:09:54 +0000
Date: Fri, 12 Jun 2026 07:09:18 +0800
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:devel-6.6 105/105]
 kernel/sched/fair.c:9774:69: warning: 'struct lb_env' declared inside
 parameter list will not be visible outside of this definition or declaration
Message-ID: <202606120713.rhbd7XQP-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://gitee.com/anolis/intel-cloud-kernel.git devel-6.6
head:   17033c891775049d8437bf5fb55f35081b40440c
commit: 64194706630f8c78feb5fb01b6d046aa4aab66df [105/105] anolis: sched: add tunables for expeller and expellee load balance
config: x86_64-allnoconfig (https://download.01.org/0day-ci/archive/20260612/202606120713.rhbd7XQP-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.4.0-5) 12.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260612/202606120713.rhbd7XQP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606120713.rhbd7XQP-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from kernel/sched/fair.c:56:
   kernel/sched/sched.h:1859:54: warning: 'struct cgroup_taskset' declared inside parameter list will not be visible outside of this definition or declaration
    1859 | static inline void sched_core_identity_attach(struct cgroup_taskset *tset) { }
         |                                                      ^~~~~~~~~~~~~~
>> kernel/sched/fair.c:9774:69: warning: 'struct lb_env' declared inside parameter list will not be visible outside of this definition or declaration
    9774 | static inline int id_can_migrate_task(struct task_struct *p, struct lb_env *env)
         |                                                                     ^~~~~~


vim +9774 kernel/sched/fair.c

  9740	
  9741	#else
  9742	static inline void push_expellee(struct rq *rq) { }
  9743	#endif
  9744	static int id_can_migrate_task(struct task_struct *p, struct lb_env *env)
  9745	{
  9746		struct rq *src_rq = env->src_rq;
  9747		struct rq *dst_rq = env->dst_rq;
  9748	
  9749		if (!id_expeller_share_core() && env->id_need_redo && task_is_expeller(p) &&
  9750		    rq_on_expel_by_smt_expeller(dst_rq))
  9751			goto bad_dst;
  9752		if ((!sched_feat(ID_SMT_EXPEL) || !task_is_expellee(p)) &&
  9753		    (!sched_feat(ID_ABSOLUTE_EXPEL) || !task_is_idle(p)))
  9754			return -1;
  9755		/* Do not migrate expellee task to CPU on expel */
  9756		if (should_expel_se(dst_rq, &p->se))
  9757			goto bad_dst;
  9758		if (sched_feat(ID_EXPELLEE_NEVER_HOT))
  9759			goto good_dst;
  9760		if (!should_expel_se(src_rq, &p->se))
  9761			return -1;
  9762		if (!sched_feat(ID_RESCUE_EXPELLEE))
  9763			return -1;
  9764	good_dst:
  9765		schedstat_inc(p->stats.nr_forced_migrations);
  9766		return 1;
  9767	bad_dst:
  9768		schedstat_inc(p->stats.nr_failed_migrations_id);
  9769		return 0;
  9770	}
  9771	#else
  9772	static inline void update_rq_on_expel(struct rq *rq) { }
  9773	static inline void push_expellee(struct rq *rq) { }
> 9774	static inline int id_can_migrate_task(struct task_struct *p, struct lb_env *env)
  9775	{
  9776		return -1;
  9777	}
  9778	#endif
  9779	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
