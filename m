Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13F82399340
	for <oe-kbuild-all@lists.linux.dev>; Thu,  7 May 2026 22:22:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778192568; cv=none; b=OvSZcQAvXNnmCtL1JL1frJSVFX8Eg8a9so2ThflepLhisPSzH3cdazJ+hw1oJYD3ACPrUEaMB8brZeeQMxcCfMjDRoDXKp+jVgmr8Rl45FK2sT20+i6G/+zjWcqQ564NpxjznVQddSyBsN/3BYBWHYl7W3dNtPIjBLVQpqvRzKk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778192568; c=relaxed/simple;
	bh=POX3cPS5lCQ5BLtmWjdQ7QN6Hg0TMSpTBWjZoRBlHwY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=V/QZZ0Xx5XwMME1MT6zvh7H5+qtk/5q5iMIHdswKAObQbV9KoYeokZvr6ORSX63i37JGMz9LI0f6A4qG0dN4K+PTR0YLX4SSRVVeox44jPoSKpM9hVaTueAWP9mIO6BoknBOK/7ECGuZz0cXiIIT4QVrKptKeJeJNpb4zoLuoJ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=deEfEA9w; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="deEfEA9w"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778192566; x=1809728566;
  h=date:from:to:cc:subject:message-id;
  bh=POX3cPS5lCQ5BLtmWjdQ7QN6Hg0TMSpTBWjZoRBlHwY=;
  b=deEfEA9wbTcc+THfbNpkfj26JlbW+UFSN+04i65QWF7Ro6t7LweH2LR0
   dRG4Lrgf++YJNccEZ0usgqPKDoRYdQHJppijmsof5wa1HIiUiiUHg6F6w
   98rJcNSVrgLGBUqz55VgfMEOdyfNP9J6r6YUtJ5X4ZV6aIuPJ9KoiYM6Y
   eR6QgnZFlx3vBoNEXwzmmHN9yVnYWQTktrfcIP2FVHm4S68pXU/+c/6kp
   nGqTiV4GmRAHni4QCNRghXWOlVV7e93DYb+ELA9AZchK6pvjAy+DZZMcH
   t6EIh5cjMjh6kSxK5YJJa+j8ynuwAjzWp1AJ4DGenBdVaKCT5dtJEd/mE
   g==;
X-CSE-ConnectionGUID: dH9UK+wPQ5CoZpqiEca2ZA==
X-CSE-MsgGUID: 2mbSwRM1TRWQGWswAP8dhQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11779"; a="78180460"
X-IronPort-AV: E=Sophos;i="6.23,222,1770624000"; 
   d="scan'208";a="78180460"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2026 15:22:45 -0700
X-CSE-ConnectionGUID: sezbJ4psQYC94sab4BSMrw==
X-CSE-MsgGUID: eOv6pmfQQt2t+5SuMPYdcw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,222,1770624000"; 
   d="scan'208";a="236523458"
Received: from lkp-server01.sh.intel.com (HELO d6e19f2f5857) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 07 May 2026 15:22:43 -0700
Received: from kbuild by d6e19f2f5857 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wL77B-000000000WX-2H86;
	Thu, 07 May 2026 22:22:41 +0000
Date: Fri, 08 May 2026 06:22:11 +0800
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:devel-6.6 20/20]
 kernel/sched/fair.c:9774:69: warning: 'struct lb_env' declared inside
 parameter list will not be visible outside of this definition or declaration
Message-ID: <202605080647.4k6bJTZE-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Cruz,

FYI, the error/warning still remains.

tree:   https://gitee.com/anolis/intel-cloud-kernel.git devel-6.6
head:   7869ad90f786f903dadc68707ecf94fd3e89b98c
commit: 369b313eb3d1541d6e16f69cc4d6c899cc0ee8bb [20/20] anolis: sched: add tunables for expeller and expellee load balance
config: x86_64-allnoconfig (https://download.01.org/0day-ci/archive/20260508/202605080647.4k6bJTZE-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.4.0-5) 12.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260508/202605080647.4k6bJTZE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605080647.4k6bJTZE-lkp@intel.com/

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
