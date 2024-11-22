Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15A581DF269
	for <oe-kbuild-all@lists.linux.dev>; Fri, 22 Nov 2024 13:15:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732281335; cv=none; b=pP9KWIlRaKYZoEZyQJ2XLZlYi+KeN1uLhgLIeGY1m0NPs6N1uaDSkH7eDrzoxzw9LX7xAxnYAz4UyDP1PYoBTwiWFsJVschLIKtj6YyCznaErg1hQtnst88Fg3fhucaxWXFrbjgSyNWdeUuCwYZo05RNVs23ThHRI7N3xaV7yPA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732281335; c=relaxed/simple;
	bh=3NfgQSQbPSWjqyhvjWd/c9keYcY/Eq1z6LeybA/ZY5o=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=A46RiXiTSji7Ku8u6AYaNym8+8fVqzj7+GOzPayjEfWgEFK85YYJRV1do9aLFeSfb8xX78+Ll5qKEVxcHHq2VvYY3Vlyi4qlKqaP+W2XbmzEbIr9cVj0sO6VnlMjiCVZEmr3IvbUFL60UmUTyKCNQKxbGz2jDsP8fqkDGwAgqAE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XMvz/riv; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XMvz/riv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732281332; x=1763817332;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3NfgQSQbPSWjqyhvjWd/c9keYcY/Eq1z6LeybA/ZY5o=;
  b=XMvz/riv3XuVSrYXJXtoZ77ONZZTgCvodG7gHRZngxvra1t6WGZHn35O
   Axcr6xBErswH8FcmKg3hpV21BAhnKN5xWYgvzAMnsU941ivh2YkJq1m0b
   IBKMSIFxhEsGNInV+nYuTemUTKAy1L2qKJigLWTSsOFGLwYpiUjSLhKRG
   SBOSNmgiaS5kKXINGd+wXK8eAPiM/6QW6cdla8kAUrF3ufQSbs47T1qMv
   oA9TQzrL1/YsRKlJJrT/OqrPac0xytLdDvekSfJvdyoA1zd2B7NfTynx1
   +5gZ4ggQTs8vWNw+54sJm86sZcn47AMoybKnpblY8yfq51cDs9vau7y/t
   g==;
X-CSE-ConnectionGUID: Osm3oaNzT/iuik5mOiPExQ==
X-CSE-MsgGUID: umje+Eu9QvKqnbYrXqoxzA==
X-IronPort-AV: E=McAfee;i="6700,10204,11264"; a="20025236"
X-IronPort-AV: E=Sophos;i="6.12,175,1728975600"; 
   d="scan'208";a="20025236"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Nov 2024 05:15:29 -0800
X-CSE-ConnectionGUID: YTLrDxpbRDm6TSZhi+ZYrA==
X-CSE-MsgGUID: GasDikVTStSHgoXuVj/jPQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,175,1728975600"; 
   d="scan'208";a="113851126"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 22 Nov 2024 05:15:28 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tETVN-0003vV-2w;
	Fri, 22 Nov 2024 13:15:25 +0000
Date: Fri, 22 Nov 2024 21:15:08 +0800
From: kernel test robot <lkp@intel.com>
To: Ingo Molnar <mingo@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: kernel/sched/syscalls.c:1196:1: sparse: sparse: Using plain integer
 as NULL pointer
Message-ID: <202411222158.Csalijl5-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   28eb75e178d389d325f1666e422bc13bbbb9804c
commit: 04746ed80bcf3130951ed4d5c1bc5b0bcabdde22 sched/syscalls: Split out kernel/sched/syscalls.c from kernel/sched/core.c
date:   6 months ago
config: s390-randconfig-r133-20241121 (https://download.01.org/0day-ci/archive/20241122/202411222158.Csalijl5-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 14.2.0
reproduce: (https://download.01.org/0day-ci/archive/20241122/202411222158.Csalijl5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411222158.Csalijl5-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
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
   kernel/sched/build_policy.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/umh.h, include/linux/kmod.h, ...):
   include/linux/page-flags.h:240:46: sparse: sparse: self-comparison always evaluates to false
   include/linux/page-flags.h:240:46: sparse: sparse: self-comparison always evaluates to false
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
   kernel/sched/syscalls.c:1402:6: sparse: sparse: context imbalance in 'sched_getaffinity' - wrong count at exit
   kernel/sched/syscalls.c:1431:1: sparse: sparse: Using plain integer as NULL pointer
   kernel/sched/syscalls.c:1431:1: sparse: sparse: Using plain integer as NULL pointer
   kernel/sched/syscalls.c:1676:1: sparse: sparse: Using plain integer as NULL pointer
   kernel/sched/syscalls.c:1676:1: sparse: sparse: Using plain integer as NULL pointer
   kernel/sched/syscalls.c:1689:1: sparse: sparse: Using plain integer as NULL pointer
   kernel/sched/syscalls.c:1689:1: sparse: sparse: Using plain integer as NULL pointer
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
