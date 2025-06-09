Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C69374C8E
	for <oe-kbuild-all@lists.linux.dev>; Mon,  9 Jun 2025 20:26:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749500802; cv=none; b=Vm1fZlvCjvFL188JZEcW9ExfHiorf74kBOTO3PXHl0OX3YmR0Go8Q40rPuFg8NPFrOxtn6BqjQ4iUb39D8l78Zf3ngrs2zOuJjiT2FrDb2Ab5V3ZmIrHY6NxUtLJy6ocMnGxmP972RkmDx/xD5eycHRu8U5+K32ivejMw2DlO6k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749500802; c=relaxed/simple;
	bh=AZI4mow+P6fmLMsTtkkC1hJB5nqwrWD/RpWf7a6hGOc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=QNcAczH7QLQ9ojY2UqzgR+uh/e7NpTJPplgPpsnrb0+2x2DKd9MgwS6qGTl8Yb4xyth9IYYge78Fwu6NmuOfs1agJNyuyfQ08fHsGg4nc8ZZnSSDHOa5R/oA7a//Bk0+2kLbJUF2XAFQ19mhikWqJRNGBXgs5YETI2Aw9zzdr8s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XvwAyREq; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XvwAyREq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749500800; x=1781036800;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=AZI4mow+P6fmLMsTtkkC1hJB5nqwrWD/RpWf7a6hGOc=;
  b=XvwAyREqdhJIruh6Ff2D4QtxG6ydYfcsVKskClyDg5kaS0mCGl6rikk3
   Tm/31zAnXRLIq0l2hEaRY9i5BgJR9YjA5hsBfL0JA+L2FuYzEEqQrael+
   84HNrQvD7WaFSxvBOGiHkM1IhGYu0uboS1JxV01rHJMJh6D2r5R8zkujz
   BLQVcG4SC4nIedd4fSBY1XD4Iipada5WL0tnse+usRWuvefpHAIKLjwb1
   +VeOWQG4SpY9jXqR16YynbbB9s1ICWyI1zfK2T2xwpVx4w4DLkUs/lb3E
   binb3OMfmgsVyzvNYgQDiog2l6TMDBiBOKZCNsj/t0kZ50JaWh7sJVOeP
   Q==;
X-CSE-ConnectionGUID: LLaAqxNYSpasbwTY5q5PIQ==
X-CSE-MsgGUID: WdNp3gz7T7ap3ExcTmDnkQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11459"; a="74127121"
X-IronPort-AV: E=Sophos;i="6.16,223,1744095600"; 
   d="scan'208";a="74127121"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jun 2025 13:26:39 -0700
X-CSE-ConnectionGUID: r4ObMqx0Tc+oT4wJfO5mww==
X-CSE-MsgGUID: 8K7HYRfWSpuu8yzy/A4bqA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,223,1744095600"; 
   d="scan'208";a="151868798"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 09 Jun 2025 13:26:38 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uOj4l-0007Nt-0K;
	Mon, 09 Jun 2025 20:26:35 +0000
Date: Tue, 10 Jun 2025 04:26:26 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Zhang Qiao <zhangqiao22@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 2380/2380] kernel/sched/soft_domain.c:73:17:
 sparse: sparse: incompatible types in comparison expression (different
 address spaces):
Message-ID: <202506100428.rYVNbEAi-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   a7f4bf73c34996ee6cdda292e8f906a9c30879de
commit: 645a1ba256efa1b6dd765d20b7b407b501ed3ba6 [2380/2380] sched: topology: Build soft domain for LLC
config: x86_64-randconfig-122-20250610 (https://download.01.org/0day-ci/archive/20250610/202506100428.rYVNbEAi-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250610/202506100428.rYVNbEAi-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506100428.rYVNbEAi-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   kernel/sched/build_policy.c: note: in included file:
   kernel/sched/rt.c:965:70: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/rt.c:965:70: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/rt.c:965:70: sparse:    struct task_struct *
   kernel/sched/rt.c:2427:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/rt.c:2427:25: sparse:    struct task_struct *
   kernel/sched/rt.c:2427:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/rt.c:1051:38: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *curr @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/rt.c:1051:38: sparse:     expected struct task_struct *curr
   kernel/sched/rt.c:1051:38: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/rt.c:1596:31: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/rt.c:1596:31: sparse:     expected struct task_struct *p
   kernel/sched/rt.c:1596:31: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/rt.c:1936:9: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] sd @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/rt.c:1936:9: sparse:     expected struct sched_domain *[assigned] sd
   kernel/sched/rt.c:1936:9: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/rt.c:1616:14: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct task_struct *curr @@     got struct task_struct [noderef] __rcu * @@
   kernel/sched/rt.c:1616:14: sparse:     expected struct task_struct *curr
   kernel/sched/rt.c:1616:14: sparse:     got struct task_struct [noderef] __rcu *
   kernel/sched/rt.c:1681:45: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/rt.c:1681:45: sparse:     expected struct task_struct *p
   kernel/sched/rt.c:1681:45: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/rt.c:1742:67: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *tsk @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/rt.c:1742:67: sparse:     expected struct task_struct *tsk
   kernel/sched/rt.c:1742:67: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/rt.c:2104:40: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *task @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/rt.c:2104:40: sparse:     expected struct task_struct *task
   kernel/sched/rt.c:2104:40: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/rt.c:2127:13: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/rt.c:2127:13: sparse:    struct task_struct *
   kernel/sched/rt.c:2127:13: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/rt.c:2480:54: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *tsk @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/rt.c:2480:54: sparse:     expected struct task_struct *tsk
   kernel/sched/rt.c:2480:54: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/rt.c:2482:40: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/rt.c:2482:40: sparse:     expected struct task_struct *p
   kernel/sched/rt.c:2482:40: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/rt.c:2482:61: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/rt.c:2482:61: sparse:     expected struct task_struct *p
   kernel/sched/rt.c:2482:61: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/build_policy.c: note: in included file:
   kernel/sched/deadline.c:2312:23: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/deadline.c:2312:23: sparse:     expected struct task_struct *p
   kernel/sched/deadline.c:2312:23: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/deadline.c:2322:13: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/deadline.c:2322:13: sparse:    struct task_struct *
   kernel/sched/deadline.c:2322:13: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/deadline.c:2430:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/deadline.c:2430:25: sparse:    struct task_struct *
   kernel/sched/deadline.c:2430:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/deadline.c:1950:42: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct sched_dl_entity const *b @@     got struct sched_dl_entity [noderef] __rcu * @@
   kernel/sched/deadline.c:1950:42: sparse:     expected struct sched_dl_entity const *b
   kernel/sched/deadline.c:1950:42: sparse:     got struct sched_dl_entity [noderef] __rcu *
   kernel/sched/deadline.c:1961:38: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *tsk @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/deadline.c:1961:38: sparse:     expected struct task_struct *tsk
   kernel/sched/deadline.c:1961:38: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/deadline.c:1177:23: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/deadline.c:1177:23: sparse:     expected struct task_struct *p
   kernel/sched/deadline.c:1177:23: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/deadline.c:1300:38: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *curr @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/deadline.c:1300:38: sparse:     expected struct task_struct *curr
   kernel/sched/deadline.c:1300:38: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/deadline.c:2170:9: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] sd @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/deadline.c:2170:9: sparse:     expected struct sched_domain *[assigned] sd
   kernel/sched/deadline.c:2170:9: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/deadline.c:1835:14: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct task_struct *curr @@     got struct task_struct [noderef] __rcu * @@
   kernel/sched/deadline.c:1835:14: sparse:     expected struct task_struct *curr
   kernel/sched/deadline.c:1835:14: sparse:     got struct task_struct [noderef] __rcu *
   kernel/sched/deadline.c:1911:43: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/deadline.c:1911:43: sparse:     expected struct task_struct *p
   kernel/sched/deadline.c:1911:43: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/deadline.c:2477:38: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *tsk @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/deadline.c:2477:38: sparse:     expected struct task_struct *tsk
   kernel/sched/deadline.c:2477:38: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/deadline.c:2479:23: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/deadline.c:2479:23: sparse:     expected struct task_struct *p
   kernel/sched/deadline.c:2479:23: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/deadline.c:2481:44: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct sched_dl_entity const *b @@     got struct sched_dl_entity [noderef] __rcu * @@
   kernel/sched/deadline.c:2481:44: sparse:     expected struct sched_dl_entity const *b
   kernel/sched/deadline.c:2481:44: sparse:     got struct sched_dl_entity [noderef] __rcu *
   kernel/sched/deadline.c:2656:22: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/deadline.c:2656:22: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/deadline.c:2656:22: sparse:    struct task_struct *
   kernel/sched/deadline.c:2705:32: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/build_policy.c: note: in included file:
>> kernel/sched/soft_domain.c:73:17: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/soft_domain.c:73:17: sparse:    struct soft_domain [noderef] __rcu *
   kernel/sched/soft_domain.c:73:17: sparse:    struct soft_domain *
   kernel/sched/soft_domain.c:55:17: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/soft_domain.c:55:17: sparse:    struct soft_domain [noderef] __rcu *
   kernel/sched/soft_domain.c:55:17: sparse:    struct soft_domain *
   kernel/sched/soft_domain.c:85:24: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/soft_domain.c:85:24: sparse:    struct soft_domain [noderef] __rcu *
   kernel/sched/soft_domain.c:85:24: sparse:    struct soft_domain *
   kernel/sched/build_policy.c: note: in included file:
   kernel/sched/sched.h:2306:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2306:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2306:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2306:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2306:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2306:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2306:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2306:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2306:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2306:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2306:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2306:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2306:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2306:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2306:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2306:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2306:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2306:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2306:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2306:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2306:25: sparse:    struct task_struct *

vim +73 kernel/sched/soft_domain.c

    60	
    61	static void free_sub_soft_domain(struct soft_domain *sf_d)
    62	{
    63		struct list_head *children = &sf_d->child_domain;
    64		struct soft_subdomain *entry = NULL, *next = NULL;
    65		int i;
    66	
    67		list_for_each_entry_safe(entry, next, children, node) {
    68			list_del(&entry->node);
    69			kfree(entry);
    70		}
    71	
    72		for_each_cpu(i, to_cpumask(sf_d->span)) {
  > 73			rcu_assign_pointer(per_cpu(g_sf_d, i), NULL);
    74		}
    75	
    76		kfree(sf_d);
    77	}
    78	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
