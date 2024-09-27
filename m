Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 171D92D045
	for <oe-kbuild-all@lists.linux.dev>; Fri, 27 Sep 2024 14:24:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727447068; cv=none; b=KMmV4mZZL+DA8VUqYunf2pX7EQRjSsnoKXHGMVQJ3tMsLY0OEF4k0EQJDGfiBKSulw4ob6vd41axWT/88XnPO8rdisGV7aLtF9ghjkOhQqnnFSXlDKjFS/nt72RtCarO1AaQki3CKEiwePGyO49G7n/fYT3lkGURKUolqCVDFEk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727447068; c=relaxed/simple;
	bh=znyl6dsioO/Cdk6GQ9yigBTgNZO4x0dBcThssK8tcZU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=bmpsz1ZRn2cxyZeY3qygr2IM5eCrIxRyML8T0y1e+iN1F9L9tKO0mhcYdfOtl9Wng2emO9oclhsNWatAkbCqIEpFyjQ9fOAdTiTFjK16NyMpRlKL6D/z/b/RqUfkYVx2pCSyqOxa1h80RCjVdkTThL1ah7NUqIcPwJE2mSAoG6I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=R5SiT9lB; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="R5SiT9lB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727447067; x=1758983067;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=znyl6dsioO/Cdk6GQ9yigBTgNZO4x0dBcThssK8tcZU=;
  b=R5SiT9lBsSRO1J3ihEwUYUWUG99zT2BQRTaaE/8A/cGz2KfblA1/PPSj
   TDrZgOfFkTnIg8ephTTy8O4i2l3VuZG9A39EBcW8NJkRNx4xz5azheFda
   N99Trsh5CA0KrB4xhpBHATr9lyHem9UW5+2nYYCBjHbK+d+BvZCH/bLM/
   59XVtbcPVW0rBc2rl1P0/+1CydZtac6Fdj116IdT9DzSAouAIZu+IcwKy
   AVhh+XMhLGZdaLfPJ9RMZGe72QydYGbVAfk6vzHwzW+AWdADp9CzZBdL2
   k5D2dA5/aUoSpKjSUJcYH/I7Whp4djqZKf1yA2bUgxKzPse+ox49EHgMz
   A==;
X-CSE-ConnectionGUID: eTLS+qxaTFuIifB6T4YWKA==
X-CSE-MsgGUID: x/X9a5JITyGFje1ZrGOSQA==
X-IronPort-AV: E=McAfee;i="6700,10204,11208"; a="26464795"
X-IronPort-AV: E=Sophos;i="6.11,158,1725346800"; 
   d="scan'208";a="26464795"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Sep 2024 07:24:27 -0700
X-CSE-ConnectionGUID: pNVS18RuTxqFyxRUlDvXxQ==
X-CSE-MsgGUID: zUNzeLtbRDOVrDiOvb36QQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,158,1725346800"; 
   d="scan'208";a="103357543"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 27 Sep 2024 07:24:25 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1suBtP-000MDz-0X;
	Fri, 27 Sep 2024 14:24:23 +0000
Date: Fri, 27 Sep 2024 22:23:29 +0800
From: kernel test robot <lkp@intel.com>
To: Ingo Molnar <mingo@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: kernel/sched/syscalls.c:1196:1: sparse: sparse: Using plain integer
 as NULL pointer
Message-ID: <202409272225.szemlZKv-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   075dbe9f6e3c21596c5245826a4ee1f1c1676eb8
commit: 04746ed80bcf3130951ed4d5c1bc5b0bcabdde22 sched/syscalls: Split out kernel/sched/syscalls.c from kernel/sched/core.c
date:   4 months ago
config: s390-randconfig-r132-20240927 (https://download.01.org/0day-ci/archive/20240927/202409272225.szemlZKv-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 14.1.0
reproduce: (https://download.01.org/0day-ci/archive/20240927/202409272225.szemlZKv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409272225.szemlZKv-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   kernel/sched/rt.c:2044:40: sparse:     expected struct task_struct *task
   kernel/sched/rt.c:2044:40: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/rt.c:2067:13: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/rt.c:2067:13: sparse:    struct task_struct *
   kernel/sched/rt.c:2067:13: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/rt.c:2417:54: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *tsk @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/rt.c:2417:54: sparse:     expected struct task_struct *tsk
   kernel/sched/rt.c:2417:54: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/rt.c:2419:40: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/rt.c:2419:40: sparse:     expected struct task_struct *p
   kernel/sched/rt.c:2419:40: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/rt.c:2419:61: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/rt.c:2419:61: sparse:     expected struct task_struct *p
   kernel/sched/rt.c:2419:61: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/build_policy.c: note: in included file:
   kernel/sched/deadline.c:2401:23: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/deadline.c:2401:23: sparse:     expected struct task_struct *p
   kernel/sched/deadline.c:2401:23: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/deadline.c:2411:13: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/deadline.c:2411:13: sparse:    struct task_struct *
   kernel/sched/deadline.c:2411:13: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/deadline.c:2519:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/deadline.c:2519:25: sparse:    struct task_struct *
   kernel/sched/deadline.c:2519:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/deadline.c:2026:42: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct sched_dl_entity const *b @@     got struct sched_dl_entity [noderef] __rcu * @@
   kernel/sched/deadline.c:2026:42: sparse:     expected struct sched_dl_entity const *b
   kernel/sched/deadline.c:2026:42: sparse:     got struct sched_dl_entity [noderef] __rcu *
   kernel/sched/deadline.c:2037:38: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *tsk @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/deadline.c:2037:38: sparse:     expected struct task_struct *tsk
   kernel/sched/deadline.c:2037:38: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/deadline.c:1220:23: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/deadline.c:1220:23: sparse:     expected struct task_struct *p
   kernel/sched/deadline.c:1220:23: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/deadline.c:1444:38: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *curr @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/deadline.c:1444:38: sparse:     expected struct task_struct *curr
   kernel/sched/deadline.c:1444:38: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/deadline.c:2262:9: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] sd @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/deadline.c:2262:9: sparse:     expected struct sched_domain *[assigned] sd
   kernel/sched/deadline.c:2262:9: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/deadline.c:1911:14: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct task_struct *curr @@     got struct task_struct [noderef] __rcu * @@
   kernel/sched/deadline.c:1911:14: sparse:     expected struct task_struct *curr
   kernel/sched/deadline.c:1911:14: sparse:     got struct task_struct [noderef] __rcu *
   kernel/sched/deadline.c:1987:43: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/deadline.c:1987:43: sparse:     expected struct task_struct *p
   kernel/sched/deadline.c:1987:43: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/deadline.c:2566:38: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *tsk @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/deadline.c:2566:38: sparse:     expected struct task_struct *tsk
   kernel/sched/deadline.c:2566:38: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/deadline.c:2568:23: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/deadline.c:2568:23: sparse:     expected struct task_struct *p
   kernel/sched/deadline.c:2568:23: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/deadline.c:2570:44: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct sched_dl_entity const *b @@     got struct sched_dl_entity [noderef] __rcu * @@
   kernel/sched/deadline.c:2570:44: sparse:     expected struct sched_dl_entity const *b
   kernel/sched/deadline.c:2570:44: sparse:     got struct sched_dl_entity [noderef] __rcu *
   kernel/sched/deadline.c:2745:22: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/deadline.c:2745:22: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/deadline.c:2745:22: sparse:    struct task_struct *
   kernel/sched/deadline.c:2794:32: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/build_policy.c: note: in included file:
   kernel/sched/syscalls.c:206:22: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/syscalls.c:206:22: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/syscalls.c:206:22: sparse:    struct task_struct *
   kernel/sched/build_policy.c: note: in included file (through include/linux/smp.h, include/linux/sched/clock.h):
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   kernel/sched/build_policy.c: note: in included file:
   kernel/sched/sched.h:2156:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2156:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2156:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2156:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2156:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2156:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2156:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2156:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2156:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2156:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2156:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2156:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2156:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2156:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2156:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2156:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2156:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2156:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2156:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2156:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2156:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2156:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2156:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2156:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2328:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2328:9: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2328:9: sparse:    struct task_struct *
   kernel/sched/sched.h:2156:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2156:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2156:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2328:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2328:9: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2328:9: sparse:    struct task_struct *
   kernel/sched/build_policy.c: note: in included file:
>> kernel/sched/syscalls.c:1196:1: sparse: sparse: Using plain integer as NULL pointer
>> kernel/sched/syscalls.c:1196:1: sparse: sparse: Using plain integer as NULL pointer
   kernel/sched/syscalls.c:1386:1: sparse: sparse: Using plain integer as NULL pointer
   kernel/sched/syscalls.c:1386:1: sparse: sparse: Using plain integer as NULL pointer
   kernel/sched/syscalls.c:1402:6: sparse: sparse: context imbalance in 'sched_getaffinity' - different lock contexts for basic block
   kernel/sched/syscalls.c:1431:1: sparse: sparse: Using plain integer as NULL pointer
   kernel/sched/syscalls.c:1431:1: sparse: sparse: Using plain integer as NULL pointer
   kernel/sched/syscalls.c:1676:1: sparse: sparse: Using plain integer as NULL pointer
   kernel/sched/syscalls.c:1676:1: sparse: sparse: Using plain integer as NULL pointer
   kernel/sched/build_policy.c: note: in included file:
   kernel/sched/rt.c:1707:15: sparse: sparse: dereference of noderef expression

vim +1196 kernel/sched/syscalls.c

  1188	
  1189	/**
  1190	 * sys_sched_getattr - similar to sched_getparam, but with sched_attr
  1191	 * @pid: the pid in question.
  1192	 * @uattr: structure containing the extended parameters.
  1193	 * @usize: sizeof(attr) for fwd/bwd comp.
  1194	 * @flags: for future extension.
  1195	 */
> 1196	SYSCALL_DEFINE4(sched_getattr, pid_t, pid, struct sched_attr __user *, uattr,
  1197			unsigned int, usize, unsigned int, flags)
  1198	{
  1199		struct sched_attr kattr = { };
  1200		struct task_struct *p;
  1201		int retval;
  1202	
  1203		if (!uattr || pid < 0 || usize > PAGE_SIZE ||
  1204		    usize < SCHED_ATTR_SIZE_VER0 || flags)
  1205			return -EINVAL;
  1206	
  1207		scoped_guard (rcu) {
  1208			p = find_process_by_pid(pid);
  1209			if (!p)
  1210				return -ESRCH;
  1211	
  1212			retval = security_task_getscheduler(p);
  1213			if (retval)
  1214				return retval;
  1215	
  1216			kattr.sched_policy = p->policy;
  1217			if (p->sched_reset_on_fork)
  1218				kattr.sched_flags |= SCHED_FLAG_RESET_ON_FORK;
  1219			get_params(p, &kattr);
  1220			kattr.sched_flags &= SCHED_FLAG_ALL;
  1221	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
