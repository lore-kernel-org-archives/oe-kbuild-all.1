Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F8FA4CF46F
	for <oe-kbuild-all@lists.linux.dev>; Sat, 17 Oct 2026 08:18:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792225114; cv=none; b=J4jqwVnTCZc1/ooCwv4ik2V+L2DuguN4Z9J6k1AyrpR6BUq7odQpeFg+9/nhH/D0KJZZKODMEoYpSGQ0iGxCvAKXwidH12/JTCAgEiLu9iduhzqHonDb6JIdhcaCrugEESkeE1akYMhBj+svGnrdOwnZ/f+GLgW8MGaOo9dbAZ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792225114; c=relaxed/simple;
	bh=OI+RqqlmBSf0XhEdtcoUxYtu5OkrWKWW7riRrjaFn/A=;
	h=Date:From:To:Cc:Subject:Message-ID; b=rl50Cb3jFw8sUS8ygjoY3Cg9qPOVaz/iUX5DEMT8pR9erLnSOs0rTNTMX8xSIivvoYDM2SwEkNTjEtzIIiPfJASIyW2pFaQB0Wvop1yPJbbwkjhMs97DG49zU8r/TmTfubfqYag8/O8GJAfMBab+QZqHBeVK98ob8m6LUrkH1bA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lYXM7UUb; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lYXM7UUb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792225113; x=1823761113;
  h=date:from:to:cc:subject:message-id;
  bh=OI+RqqlmBSf0XhEdtcoUxYtu5OkrWKWW7riRrjaFn/A=;
  b=lYXM7UUbHhU0pBd2kkrWjyKCxcweJsF+w5L8uxJKY66u5ErgSh2e945y
   i+pe+Ycgjon/iGB5jCWmT4Vh8e6OwwU6OhR4F6PiZeq593HKgyWnc0RVw
   UZD6GCPc30+Ax1FUVY1crFPuDEoJdjNbJ5/Lgypl+FnxPdS5OXf8d+jxK
   Xhwr/GYwAWWvjQSx3II2YcDpcbIUSTRGHw9CbRDG0aqUznhOgx9ujIVA9
   DE1c9b4V7kNxZYSueVv3OUVtkTp4oSFtzuAkYBMXBlrQYaqTvqJCGtHWO
   prK83WlsPjiuSKtJXWmYoD9LjtSg4iv1Dma8q9wxZSDT0nyjleFXqjVW6
   g==;
X-CSE-ConnectionGUID: sVcMxbciSJWsOCDgaRoKHw==
X-CSE-MsgGUID: qiK6+8+5S92xH/g7XjMt2w==
X-IronPort-AV: E=McAfee;i="6800,10657,11937"; a="1098438"
X-IronPort-AV: E=Sophos;i="6.27,163,1787036400"; 
   d="scan'208";a="1098438"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Oct 2026 01:18:32 -0700
X-CSE-ConnectionGUID: oYkPbcxrQyeTnn7NbtDsXw==
X-CSE-MsgGUID: WARG9qngRvWsBLFz+/5oCg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,163,1787036400"; 
   d="scan'208";a="2115313"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 17 Oct 2026 01:18:31 -0700
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xHzca-00000000JDq-2wxk;
	Sat, 17 Oct 2026 08:18:28 +0000
Date: Sat, 17 Oct 2026 16:17:58 +0800
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:intel-6.6-add-OMR-event-ANBZ51468 11/11]
 kernel/sched/fair.c:9774:69: warning: 'struct lb_env' declared inside
 parameter list will not be visible outside of this definition or declaration
Message-ID: <202610171554.VDU1gQUJ-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Cruz,

FYI, the error/warning still remains.

tree:   https://gitee.com/anolis/intel-cloud-kernel.git intel-6.6-add-OMR-event-ANBZ51468
head:   2ee4460ef69eb7f1a40741d26df51a3565558ea4
commit: 64194706630f8c78feb5fb01b6d046aa4aab66df [11/11] anolis: sched: add tunables for expeller and expellee load balance
config: x86_64-allnoconfig (https://download.01.org/0day-ci/archive/20261017/202610171554.VDU1gQUJ-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.4.0-5) 12.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261017/202610171554.VDU1gQUJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610171554.VDU1gQUJ-lkp@intel.com/

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
