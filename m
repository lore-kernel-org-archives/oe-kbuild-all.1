Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4219B1EEA3C
	for <oe-kbuild-all@lists.linux.dev>; Mon,  4 May 2026 04:29:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777868994; cv=none; b=eFYPSNHeUEB+0xZtUp5MR1u3Ws1mr1d8oHQx3ekADA6xI4RC8L4RV8CUjiuP9pzwJ1f929zNjuV2jnbeG38LmyDNZJ2zhNQfQGhiTg5WNTfhG1c47hVRhdpq/w/ayXRbIKS0GH24LYSIqj46cNGQAA3FJcn0bTkA22trxSgZGaM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777868994; c=relaxed/simple;
	bh=8fUVPDD1cJfHb/IN/6aweWSmJlnwpLQJmbDHV6YfpKQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=htUuVr452njX8yMqtsnAhIrEzxuG86PlcLLpQlCJEXM9K/uppGtubofhDq4F5zwVgnMCgw1rQdurYiJxMIcnk6Q7+zAkWKWFJqVfnadCiCznfvRBknDfyzsNGkVUYPX49wK3WtzZ8NCMJVuKOCcTk6R41HMwOonp+KspAr7bTLA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dZURU126; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dZURU126"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777868991; x=1809404991;
  h=date:from:to:cc:subject:message-id;
  bh=8fUVPDD1cJfHb/IN/6aweWSmJlnwpLQJmbDHV6YfpKQ=;
  b=dZURU126z6Pvz5Zoof3FyLUd/Ig1I1aQVcqqkvck9pZVPwg8ygxntUXL
   NJwm9gQ6Ktjw/EuHGpFwZXi3NjYZKRvDWMk3ylgbFtD/xPjnnN2LoV2zf
   aBepceBvag2HoNzzXAsDnWpngzGKkNz7iPHle0oYnGnLu0xr9HEwzdfSF
   xrITZLKso+E+5F/ASLapVXWqrtWuq9ZDPY1epgGyiQSjIaeCjeFSHYxrm
   79vhFXsgbDRATKqK86E6kH1taZnFzaiRDTu0bcMIjGApnRHT+Nfymz/mh
   H6HKyUpYkCkOR6brS8z2SqblP3ghfx0XpPZh1293LZun5psp8HGbnBtIJ
   w==;
X-CSE-ConnectionGUID: VBLZB0DmRfGdI2GqK4ACyw==
X-CSE-MsgGUID: UlDa7d+1QKmuL5n3GFcMIw==
X-IronPort-AV: E=McAfee;i="6800,10657,11775"; a="90101862"
X-IronPort-AV: E=Sophos;i="6.23,214,1770624000"; 
   d="scan'208";a="90101862"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 May 2026 21:29:51 -0700
X-CSE-ConnectionGUID: lmIITSuVRBS4E8EXpQuCLg==
X-CSE-MsgGUID: 53sHMSFyReuK+WO9PpplPw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,214,1770624000"; 
   d="scan'208";a="228907637"
Received: from lkp-server01.sh.intel.com (HELO 781826d00641) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 03 May 2026 21:29:49 -0700
Received: from kbuild by 781826d00641 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wJkw7-000000003S8-0mQ5;
	Mon, 04 May 2026 04:29:41 +0000
Date: Mon, 04 May 2026 12:28:58 +0800
From: kernel test robot <lkp@intel.com>
To: Tejun Heo <tj@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Andrea Righi <arighi@nvidia.com>
Subject: kernel/sched/ext.c:2391:33: sparse: sparse: incorrect type
 in initializer (different address spaces)
Message-ID: <202605041237.Rron7CNr-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   6d35786de28116ecf78797a62b84e6bf3c45aa5a
commit: 88234b075c3fc23d57406e1867523b6aba783ebf sched_ext: Introduce scx_task_sched[_rcu]()
date:   8 weeks ago
config: arm64-randconfig-r113-20260503 (https://download.01.org/0day-ci/archive/20260504/202605041237.Rron7CNr-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260504/202605041237.Rron7CNr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 88234b075c3f ("sched_ext: Introduce scx_task_sched[_rcu]()")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605041237.Rron7CNr-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   kernel/sched/rt.c:1513:15: sparse:     expected struct task_struct *donor
   kernel/sched/rt.c:1513:15: sparse:     got struct task_struct [noderef] __rcu *
   kernel/sched/rt.c:1574:45: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *donor @@
   kernel/sched/rt.c:1574:45: sparse:     expected struct task_struct *p
   kernel/sched/rt.c:1574:45: sparse:     got struct task_struct [noderef] __rcu *donor
   kernel/sched/rt.c:1616:39: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *donor @@     got struct task_struct [noderef] __rcu *donor @@
   kernel/sched/rt.c:1616:39: sparse:     expected struct task_struct *donor
   kernel/sched/rt.c:1616:39: sparse:     got struct task_struct [noderef] __rcu *donor
   kernel/sched/rt.c:1641:64: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *tsk @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/rt.c:1641:64: sparse:     expected struct task_struct *tsk
   kernel/sched/rt.c:1641:64: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/rt.c:1982:40: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *task @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/rt.c:1982:40: sparse:     expected struct task_struct *task
   kernel/sched/rt.c:1982:40: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/rt.c:2005:13: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/rt.c:2005:13: sparse:    struct task_struct *
   kernel/sched/rt.c:2005:13: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/rt.c:2356:54: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *tsk @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/rt.c:2356:54: sparse:     expected struct task_struct *tsk
   kernel/sched/rt.c:2356:54: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/rt.c:2358:40: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *donor @@
   kernel/sched/rt.c:2358:40: sparse:     expected struct task_struct *p
   kernel/sched/rt.c:2358:40: sparse:     got struct task_struct [noderef] __rcu *donor
   kernel/sched/rt.c:2358:62: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *donor @@
   kernel/sched/rt.c:2358:62: sparse:     expected struct task_struct *p
   kernel/sched/rt.c:2358:62: sparse:     got struct task_struct [noderef] __rcu *donor
   kernel/sched/build_policy.c: note: in included file:
   kernel/sched/deadline.c:2922:23: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *donor @@
   kernel/sched/deadline.c:2922:23: sparse:     expected struct task_struct *p
   kernel/sched/deadline.c:2922:23: sparse:     got struct task_struct [noderef] __rcu *donor
   kernel/sched/deadline.c:2932:13: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/deadline.c:2932:13: sparse:    struct task_struct *
   kernel/sched/deadline.c:2932:13: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/deadline.c:3038:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/deadline.c:3038:25: sparse:    struct task_struct *
   kernel/sched/deadline.c:3038:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/deadline.c:2539:42: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct sched_dl_entity const *b @@     got struct sched_dl_entity [noderef] __rcu * @@
   kernel/sched/deadline.c:2539:42: sparse:     expected struct sched_dl_entity const *b
   kernel/sched/deadline.c:2539:42: sparse:     got struct sched_dl_entity [noderef] __rcu *
   kernel/sched/deadline.c:2549:38: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *tsk @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/deadline.c:2549:38: sparse:     expected struct task_struct *tsk
   kernel/sched/deadline.c:2549:38: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/deadline.c:1198:39: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/deadline.c:1198:39: sparse:     expected struct task_struct *p
   kernel/sched/deadline.c:1198:39: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/deadline.c:1198:85: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct sched_dl_entity const *b @@     got struct sched_dl_entity [noderef] __rcu * @@
   kernel/sched/deadline.c:1198:85: sparse:     expected struct sched_dl_entity const *b
   kernel/sched/deadline.c:1198:85: sparse:     got struct sched_dl_entity [noderef] __rcu *
   kernel/sched/deadline.c:1296:23: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *donor @@
   kernel/sched/deadline.c:1296:23: sparse:     expected struct task_struct *p
   kernel/sched/deadline.c:1296:23: sparse:     got struct task_struct [noderef] __rcu *donor
   kernel/sched/deadline.c:1815:31: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/deadline.c:1815:31: sparse:     expected struct task_struct *p
   kernel/sched/deadline.c:1815:31: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/deadline.c:1815:70: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct sched_dl_entity const *b @@     got struct sched_dl_entity [noderef] __rcu * @@
   kernel/sched/deadline.c:1815:70: sparse:     expected struct sched_dl_entity const *b
   kernel/sched/deadline.c:1815:70: sparse:     got struct sched_dl_entity [noderef] __rcu *
   kernel/sched/deadline.c:1941:39: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *donor @@     got struct task_struct [noderef] __rcu *donor @@
   kernel/sched/deadline.c:1941:39: sparse:     expected struct task_struct *donor
   kernel/sched/deadline.c:1941:39: sparse:     got struct task_struct [noderef] __rcu *donor
   kernel/sched/deadline.c:2758:9: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] sd @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/deadline.c:2758:9: sparse:     expected struct sched_domain *[assigned] sd
   kernel/sched/deadline.c:2758:9: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/deadline.c:2419:14: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct task_struct *curr @@     got struct task_struct [noderef] __rcu * @@
   kernel/sched/deadline.c:2419:14: sparse:     expected struct task_struct *curr
   kernel/sched/deadline.c:2419:14: sparse:     got struct task_struct [noderef] __rcu *
   kernel/sched/deadline.c:2420:15: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct task_struct *donor @@     got struct task_struct [noderef] __rcu * @@
   kernel/sched/deadline.c:2420:15: sparse:     expected struct task_struct *donor
   kernel/sched/deadline.c:2420:15: sparse:     got struct task_struct [noderef] __rcu *
   kernel/sched/deadline.c:2494:43: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *donor @@
   kernel/sched/deadline.c:2494:43: sparse:     expected struct task_struct *p
   kernel/sched/deadline.c:2494:43: sparse:     got struct task_struct [noderef] __rcu *donor
   kernel/sched/deadline.c:3083:38: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *tsk @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/deadline.c:3083:38: sparse:     expected struct task_struct *tsk
   kernel/sched/deadline.c:3083:38: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/deadline.c:3085:23: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *donor @@
   kernel/sched/deadline.c:3085:23: sparse:     expected struct task_struct *p
   kernel/sched/deadline.c:3085:23: sparse:     got struct task_struct [noderef] __rcu *donor
   kernel/sched/deadline.c:3087:44: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct sched_dl_entity const *b @@     got struct sched_dl_entity [noderef] __rcu * @@
   kernel/sched/deadline.c:3087:44: sparse:     expected struct sched_dl_entity const *b
   kernel/sched/deadline.c:3087:44: sparse:     got struct sched_dl_entity [noderef] __rcu *
   kernel/sched/deadline.c:3340:23: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/deadline.c:3340:23: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/deadline.c:3340:23: sparse:    struct task_struct *
   kernel/sched/deadline.c:3393:32: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/build_policy.c: note: in included file:
   kernel/sched/ext.c:1099:38: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *curr @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/ext.c:1179:27: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct scx_sched *sch @@     got struct scx_sched [noderef] __rcu *[addressable] [toplevel] scx_root @@
   kernel/sched/ext.c:1189:48: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/ext.c:1189:48: sparse:    struct task_struct *
   kernel/sched/ext.c:1189:48: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/ext.c:1348:66: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/ext.c:1348:66: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/ext.c:1348:66: sparse:    struct task_struct *
   kernel/sched/ext.c:1847:35: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *donor @@
   kernel/sched/ext.c:1847:35: sparse:     expected struct task_struct *p
   kernel/sched/ext.c:1847:35: sparse:     got struct task_struct [noderef] __rcu *donor
   kernel/sched/ext.c:1858:38: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *from @@     got struct task_struct [noderef] __rcu *donor @@
   kernel/sched/ext.c:1858:38: sparse:     expected struct task_struct *from
   kernel/sched/ext.c:1858:38: sparse:     got struct task_struct [noderef] __rcu *donor
>> kernel/sched/ext.c:2391:33: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct scx_sched *sch @@     got struct scx_sched [noderef] __rcu *[addressable] [toplevel] scx_root @@
   kernel/sched/ext.c:2391:33: sparse:     expected struct scx_sched *sch
   kernel/sched/ext.c:2391:33: sparse:     got struct scx_sched [noderef] __rcu *[addressable] [toplevel] scx_root
   kernel/sched/ext.c:2596:33: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct scx_sched *sch @@     got struct scx_sched [noderef] __rcu *[addressable] [toplevel] scx_root @@
   kernel/sched/ext.c:2596:33: sparse:     expected struct scx_sched *sch
   kernel/sched/ext.c:2596:33: sparse:     got struct scx_sched [noderef] __rcu *[addressable] [toplevel] scx_root
   kernel/sched/ext.c:2691:38: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *prev @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/ext.c:2691:38: sparse:     expected struct task_struct *prev
   kernel/sched/ext.c:2691:38: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/ext.c:2909:33: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct scx_sched *sch @@     got struct scx_sched [noderef] __rcu *[addressable] [toplevel] scx_root @@
   kernel/sched/ext.c:2909:33: sparse:     expected struct scx_sched *sch
   kernel/sched/ext.c:2909:33: sparse:     got struct scx_sched [noderef] __rcu *[addressable] [toplevel] scx_root
   kernel/sched/ext.c:3110:33: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct scx_sched *sch @@     got struct scx_sched [noderef] __rcu *[addressable] [toplevel] scx_root @@
   kernel/sched/ext.c:3110:33: sparse:     expected struct scx_sched *sch
   kernel/sched/ext.c:3110:33: sparse:     got struct scx_sched [noderef] __rcu *[addressable] [toplevel] scx_root
   kernel/sched/ext.c:3166:33: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct scx_sched *sch @@     got struct scx_sched [noderef] __rcu *[addressable] [toplevel] scx_root @@
   kernel/sched/ext.c:3166:33: sparse:     expected struct scx_sched *sch
   kernel/sched/ext.c:3166:33: sparse:     got struct scx_sched [noderef] __rcu *[addressable] [toplevel] scx_root
   kernel/sched/ext.c:3201:33: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct scx_sched *sch @@     got struct scx_sched [noderef] __rcu *[addressable] [toplevel] scx_root @@
   kernel/sched/ext.c:3201:33: sparse:     expected struct scx_sched *sch
   kernel/sched/ext.c:3201:33: sparse:     got struct scx_sched [noderef] __rcu *[addressable] [toplevel] scx_root
   kernel/sched/ext.c:3285:47: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct scx_sched *sch @@     got struct scx_sched [noderef] __rcu *[addressable] [toplevel] scx_root @@
   kernel/sched/ext.c:3285:47: sparse:     expected struct scx_sched *sch
   kernel/sched/ext.c:3285:47: sparse:     got struct scx_sched [noderef] __rcu *[addressable] [toplevel] scx_root
   kernel/sched/ext.c:3456:35: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/ext.c:3456:35: sparse:     expected struct task_struct *p
   kernel/sched/ext.c:3456:35: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/ext.c:3488:33: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct scx_sched *sch @@     got struct scx_sched [noderef] __rcu *[addressable] [toplevel] scx_root @@
   kernel/sched/ext.c:3488:33: sparse:     expected struct scx_sched *sch
   kernel/sched/ext.c:3488:33: sparse:     got struct scx_sched [noderef] __rcu *[addressable] [toplevel] scx_root
   kernel/sched/ext.c:3517:33: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct scx_sched *sch @@     got struct scx_sched [noderef] __rcu *[addressable] [toplevel] scx_root @@
   kernel/sched/ext.c:3517:33: sparse:     expected struct scx_sched *sch
   kernel/sched/ext.c:3517:33: sparse:     got struct scx_sched [noderef] __rcu *[addressable] [toplevel] scx_root
   kernel/sched/ext.c:3530:33: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct scx_sched *sch @@     got struct scx_sched [noderef] __rcu *[addressable] [toplevel] scx_root @@
   kernel/sched/ext.c:3530:33: sparse:     expected struct scx_sched *sch
   kernel/sched/ext.c:3530:33: sparse:     got struct scx_sched [noderef] __rcu *[addressable] [toplevel] scx_root
   kernel/sched/ext.c:3579:33: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct scx_sched *sch @@     got struct scx_sched [noderef] __rcu *[addressable] [toplevel] scx_root @@
   kernel/sched/ext.c:3579:33: sparse:     expected struct scx_sched *sch
   kernel/sched/ext.c:3579:33: sparse:     got struct scx_sched [noderef] __rcu *[addressable] [toplevel] scx_root
   kernel/sched/ext.c:3598:33: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct scx_sched *sch @@     got struct scx_sched [noderef] __rcu *[addressable] [toplevel] scx_root @@
   kernel/sched/ext.c:3598:33: sparse:     expected struct scx_sched *sch
   kernel/sched/ext.c:3598:33: sparse:     got struct scx_sched [noderef] __rcu *[addressable] [toplevel] scx_root
   kernel/sched/ext.c:3616:33: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct scx_sched *sch @@     got struct scx_sched [noderef] __rcu *[addressable] [toplevel] scx_root @@
   kernel/sched/ext.c:3616:33: sparse:     expected struct scx_sched *sch
   kernel/sched/ext.c:3616:33: sparse:     got struct scx_sched [noderef] __rcu *[addressable] [toplevel] scx_root
   kernel/sched/ext.c:3632:33: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct scx_sched *sch @@     got struct scx_sched [noderef] __rcu *[addressable] [toplevel] scx_root @@
   kernel/sched/ext.c:3632:33: sparse:     expected struct scx_sched *sch
   kernel/sched/ext.c:3632:33: sparse:     got struct scx_sched [noderef] __rcu *[addressable] [toplevel] scx_root
   kernel/sched/ext.c:3649:33: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct scx_sched *sch @@     got struct scx_sched [noderef] __rcu *[addressable] [toplevel] scx_root @@
   kernel/sched/ext.c:3649:33: sparse:     expected struct scx_sched *sch
   kernel/sched/ext.c:3649:33: sparse:     got struct scx_sched [noderef] __rcu *[addressable] [toplevel] scx_root
   kernel/sched/ext.c:4568:50: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct scx_kick_syncs **ksyncs @@     got struct scx_kick_syncs [noderef] __rcu ** @@
   kernel/sched/ext.c:4568:50: sparse:     expected struct scx_kick_syncs **ksyncs
   kernel/sched/ext.c:4568:50: sparse:     got struct scx_kick_syncs [noderef] __rcu **
   kernel/sched/ext.c:4571:27: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/ext.c:4571:27: sparse:    struct scx_kick_syncs [noderef] __rcu *
   kernel/sched/ext.c:4571:27: sparse:    struct scx_kick_syncs *
   kernel/sched/ext.c:4571:27: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/ext.c:4571:27: sparse:    struct scx_kick_syncs [noderef] __rcu *
   kernel/sched/ext.c:4571:27: sparse:    struct scx_kick_syncs *
   kernel/sched/ext.c:4977:33: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct scx_sched *sch @@     got struct scx_sched [noderef] __rcu *[addressable] [assigned] [toplevel] scx_root @@
   kernel/sched/ext.c:4977:33: sparse:     expected struct scx_sched *sch
   kernel/sched/ext.c:4977:33: sparse:     got struct scx_sched [noderef] __rcu *[addressable] [assigned] [toplevel] scx_root
   kernel/sched/ext.c:5020:33: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct scx_sched *sch @@     got struct scx_sched [noderef] __rcu *[addressable] [assigned] [toplevel] scx_root @@
   kernel/sched/ext.c:5020:33: sparse:     expected struct scx_sched *sch
   kernel/sched/ext.c:5020:33: sparse:     got struct scx_sched [noderef] __rcu *[addressable] [assigned] [toplevel] scx_root
   kernel/sched/ext.c:5131:52: sparse: sparse: incorrect type in argument 3 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/ext.c:5131:52: sparse:     expected struct task_struct *p
   kernel/sched/ext.c:5131:52: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/ext.c:5210:50: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct scx_kick_syncs **ksyncs @@     got struct scx_kick_syncs [noderef] __rcu ** @@
   kernel/sched/ext.c:5210:50: sparse:     expected struct scx_kick_syncs **ksyncs
   kernel/sched/ext.c:5210:50: sparse:     got struct scx_kick_syncs [noderef] __rcu **
   kernel/sched/ext.c:5213:17: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/ext.c:5213:17: sparse:    struct scx_kick_syncs [noderef] __rcu *
   kernel/sched/ext.c:5213:17: sparse:    struct scx_kick_syncs *
   kernel/sched/ext.c:5222:17: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/ext.c:5222:17: sparse:    struct scx_kick_syncs [noderef] __rcu *
   kernel/sched/ext.c:5222:17: sparse:    struct scx_kick_syncs *
   kernel/sched/ext.c:5693:40: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct scx_sched *parent @@     got struct scx_sched [noderef] __rcu *scx_sched @@
   kernel/sched/ext.c:5693:40: sparse:     expected struct scx_sched *parent
   kernel/sched/ext.c:5693:40: sparse:     got struct scx_sched [noderef] __rcu *scx_sched
   kernel/sched/ext.c:5847:38: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct scx_sched *sch @@     got struct scx_sched [noderef] __rcu *scx_sched @@
   kernel/sched/ext.c:5847:38: sparse:     expected struct scx_sched *sch
   kernel/sched/ext.c:5847:38: sparse:     got struct scx_sched [noderef] __rcu *scx_sched
   kernel/sched/ext.c:6228:32: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct const *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/ext.c:6228:32: sparse:     expected struct task_struct const *p
   kernel/sched/ext.c:6228:32: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/ext.c:6355:33: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct scx_sched *sch @@     got struct scx_sched [noderef] __rcu *[addressable] [assigned] [toplevel] scx_root @@
   kernel/sched/ext.c:6355:33: sparse:     expected struct scx_sched *sch
   kernel/sched/ext.c:6355:33: sparse:     got struct scx_sched [noderef] __rcu *[addressable] [assigned] [toplevel] scx_root
   kernel/sched/ext.c:6685:33: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct scx_sched *sch @@     got struct scx_sched [noderef] __rcu *[addressable] [assigned] [toplevel] scx_root @@
   kernel/sched/ext.c:6685:33: sparse:     expected struct scx_sched *sch
   kernel/sched/ext.c:6685:33: sparse:     got struct scx_sched [noderef] __rcu *[addressable] [assigned] [toplevel] scx_root
   kernel/sched/ext.c:7600:18: sparse: sparse: symbol 'scx_bpf_reenqueue_local___v2' was not declared. Should it be static?
   kernel/sched/ext.c:7774:33: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/ext.c:7774:33: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/ext.c:7774:33: sparse:    struct task_struct const *
   kernel/sched/build_policy.c: note: in included file:
>> kernel/sched/ext_idle.c:735:33: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct scx_sched *sch @@     got struct scx_sched [noderef] __rcu *[addressable] [assigned] [toplevel] scx_root @@
   kernel/sched/ext_idle.c:755:49: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct const *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/build_policy.c: note: in included file:
   kernel/sched/syscalls.c:1382:22: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct task_struct *curr @@     got struct task_struct [noderef] __rcu *donor @@
   kernel/sched/build_policy.c: note: in included file:
   kernel/sched/sched.h:2363:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2363:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2363:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2363:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2363:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2363:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2374:26: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2374:26: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2374:26: sparse:    struct task_struct *
   kernel/sched/sched.h:2363:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2363:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2363:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2374:26: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2374:26: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2374:26: sparse:    struct task_struct *
   kernel/sched/sched.h:1395:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:1395:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:1395:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2363:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2363:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2363:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2363:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2363:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2363:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2374:26: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2374:26: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2374:26: sparse:    struct task_struct *
   kernel/sched/sched.h:2374:26: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2374:26: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2374:26: sparse:    struct task_struct *
   kernel/sched/sched.h:2363:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2363:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2363:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2363:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2363:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2363:25: sparse:    struct task_struct *
   kernel/sched/sched.h:1395:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:1395:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:1395:25: sparse:    struct task_struct *
   kernel/sched/build_policy.c: note: in included file:
   kernel/sched/syscalls.c:1307:11: sparse: sparse: dereference of noderef expression
   kernel/sched/build_policy.c: note: in included file:
   kernel/sched/rt.c:1665:15: sparse: sparse: dereference of noderef expression

vim +2391 kernel/sched/ext.c

a8ad873113d3fe0 Emil Tsalapatis 2025-10-10  2388  
753e2836d139b43 Tejun Heo       2024-09-03  2389  static int balance_one(struct rq *rq, struct task_struct *prev)
f0e1a0643a59bf1 Tejun Heo       2024-06-18  2390  {
cdf5a6faa8cf0ef Tejun Heo       2025-04-29 @2391  	struct scx_sched *sch = scx_root;
f0e1a0643a59bf1 Tejun Heo       2024-06-18  2392  	struct scx_dsp_ctx *dspc = this_cpu_ptr(scx_dsp_ctx);
f0e1a0643a59bf1 Tejun Heo       2024-06-18  2393  	bool prev_on_scx = prev->sched_class == &ext_sched_class;
30dd3b13f9de612 Henry Huang     2025-01-08  2394  	bool prev_on_rq = prev->scx.flags & SCX_TASK_QUEUED;
0922f54fdd15aed Tejun Heo       2024-06-18  2395  	int nr_loops = SCX_DSP_MAX_LOOPS;
f0e1a0643a59bf1 Tejun Heo       2024-06-18  2396  
f0e1a0643a59bf1 Tejun Heo       2024-06-18  2397  	lockdep_assert_rq_held(rq);
f47a818950dd5e5 Tejun Heo       2024-07-12  2398  	rq->scx.flags |= SCX_RQ_IN_BALANCE;
4c95380701f58b8 Peter Zijlstra  2025-10-01  2399  	rq->scx.flags &= ~SCX_RQ_BAL_KEEP;
f0e1a0643a59bf1 Tejun Heo       2024-06-18  2400  
d310fb40096896a Tejun Heo       2025-05-14  2401  	if ((sch->ops.flags & SCX_OPS_HAS_CPU_PREEMPT) &&
245254f7081dbe1 David Vernet    2024-06-18  2402  	    unlikely(rq->scx.cpu_released)) {
245254f7081dbe1 David Vernet    2024-06-18  2403  		/*
245254f7081dbe1 David Vernet    2024-06-18  2404  		 * If the previous sched_class for the current CPU was not SCX,
245254f7081dbe1 David Vernet    2024-06-18  2405  		 * notify the BPF scheduler that it again has control of the
245254f7081dbe1 David Vernet    2024-06-18  2406  		 * core. This callback complements ->cpu_release(), which is
6b8950ef993bcf1 Zhao Mengmeng   2024-11-15  2407  		 * emitted in switch_class().
245254f7081dbe1 David Vernet    2024-06-18  2408  		 */
d310fb40096896a Tejun Heo       2025-05-14  2409  		if (SCX_HAS_OP(sch, cpu_acquire))
ab3f497ac18d486 Tejun Heo       2025-05-14  2410  			SCX_CALL_OP(sch, SCX_KF_REST, cpu_acquire, rq,
ab3f497ac18d486 Tejun Heo       2025-05-14  2411  				    cpu_of(rq), NULL);
245254f7081dbe1 David Vernet    2024-06-18  2412  		rq->scx.cpu_released = false;
245254f7081dbe1 David Vernet    2024-06-18  2413  	}
245254f7081dbe1 David Vernet    2024-06-18  2414  
f0e1a0643a59bf1 Tejun Heo       2024-06-18  2415  	if (prev_on_scx) {
f0e1a0643a59bf1 Tejun Heo       2024-06-18  2416  		update_curr_scx(rq);
f0e1a0643a59bf1 Tejun Heo       2024-06-18  2417  
f0e1a0643a59bf1 Tejun Heo       2024-06-18  2418  		/*
f0e1a0643a59bf1 Tejun Heo       2024-06-18  2419  		 * If @prev is runnable & has slice left, it has priority and
f0e1a0643a59bf1 Tejun Heo       2024-06-18  2420  		 * fetching more just increases latency for the fetched tasks.
753e2836d139b43 Tejun Heo       2024-09-03  2421  		 * Tell pick_task_scx() to keep running @prev. If the BPF
7c65ae81ea86a6e Tejun Heo       2024-09-03  2422  		 * scheduler wants to handle this explicitly, it should
7c65ae81ea86a6e Tejun Heo       2024-09-03  2423  		 * implement ->cpu_release().
f0e1a0643a59bf1 Tejun Heo       2024-06-18  2424  		 *
1a2469403eb26c1 Tejun Heo       2025-04-04  2425  		 * See scx_disable_workfn() for the explanation on the bypassing
1a2469403eb26c1 Tejun Heo       2025-04-04  2426  		 * test.
f0e1a0643a59bf1 Tejun Heo       2024-06-18  2427  		 */
30dd3b13f9de612 Henry Huang     2025-01-08  2428  		if (prev_on_rq && prev->scx.slice && !scx_rq_bypassing(rq)) {
8b1451f2f723f84 Tejun Heo       2024-09-03  2429  			rq->scx.flags |= SCX_RQ_BAL_KEEP;
81aae789181b585 Tejun Heo       2024-06-18  2430  			goto has_tasks;
f0e1a0643a59bf1 Tejun Heo       2024-06-18  2431  		}
f0e1a0643a59bf1 Tejun Heo       2024-06-18  2432  	}
f0e1a0643a59bf1 Tejun Heo       2024-06-18  2433  
f0e1a0643a59bf1 Tejun Heo       2024-06-18  2434  	/* if there already are tasks to run, nothing to do */
f0e1a0643a59bf1 Tejun Heo       2024-06-18  2435  	if (rq->scx.local_dsq.nr)
81aae789181b585 Tejun Heo       2024-06-18  2436  		goto has_tasks;
f0e1a0643a59bf1 Tejun Heo       2024-06-18  2437  
8409b800a0b1f14 Tejun Heo       2025-04-29  2438  	if (consume_global_dsq(sch, rq))
81aae789181b585 Tejun Heo       2024-06-18  2439  		goto has_tasks;
f0e1a0643a59bf1 Tejun Heo       2024-06-18  2440  
61debc251c1c915 Tejun Heo       2025-11-11  2441  	if (scx_rq_bypassing(rq)) {
61debc251c1c915 Tejun Heo       2025-11-11  2442  		if (consume_dispatch_q(sch, rq, &rq->scx.bypass_dsq))
61debc251c1c915 Tejun Heo       2025-11-11  2443  			goto has_tasks;
61debc251c1c915 Tejun Heo       2025-11-11  2444  		else
61debc251c1c915 Tejun Heo       2025-11-11  2445  			goto no_tasks;
61debc251c1c915 Tejun Heo       2025-11-11  2446  	}
61debc251c1c915 Tejun Heo       2025-11-11  2447  
61debc251c1c915 Tejun Heo       2025-11-11  2448  	if (unlikely(!SCX_HAS_OP(sch, dispatch)) || !scx_rq_online(rq))
7c65ae81ea86a6e Tejun Heo       2024-09-03  2449  		goto no_tasks;
f0e1a0643a59bf1 Tejun Heo       2024-06-18  2450  
f0e1a0643a59bf1 Tejun Heo       2024-06-18  2451  	dspc->rq = rq;
f0e1a0643a59bf1 Tejun Heo       2024-06-18  2452  
f0e1a0643a59bf1 Tejun Heo       2024-06-18  2453  	/*
f0e1a0643a59bf1 Tejun Heo       2024-06-18  2454  	 * The dispatch loop. Because flush_dispatch_buf() may drop the rq lock,
f0e1a0643a59bf1 Tejun Heo       2024-06-18  2455  	 * the local DSQ might still end up empty after a successful
f0e1a0643a59bf1 Tejun Heo       2024-06-18  2456  	 * ops.dispatch(). If the local DSQ is empty even after ops.dispatch()
f0e1a0643a59bf1 Tejun Heo       2024-06-18  2457  	 * produced some tasks, retry. The BPF scheduler may depend on this
f0e1a0643a59bf1 Tejun Heo       2024-06-18  2458  	 * looping behavior to simplify its implementation.
f0e1a0643a59bf1 Tejun Heo       2024-06-18  2459  	 */
f0e1a0643a59bf1 Tejun Heo       2024-06-18  2460  	do {
f0e1a0643a59bf1 Tejun Heo       2024-06-18  2461  		dspc->nr_tasks = 0;
f0e1a0643a59bf1 Tejun Heo       2024-06-18  2462  
ab3f497ac18d486 Tejun Heo       2025-05-14  2463  		SCX_CALL_OP(sch, SCX_KF_DISPATCH, dispatch, rq,
ab3f497ac18d486 Tejun Heo       2025-05-14  2464  			    cpu_of(rq), prev_on_scx ? prev : NULL);
f0e1a0643a59bf1 Tejun Heo       2024-06-18  2465  
cdf5a6faa8cf0ef Tejun Heo       2025-04-29  2466  		flush_dispatch_buf(sch, rq);
f0e1a0643a59bf1 Tejun Heo       2024-06-18  2467  
30dd3b13f9de612 Henry Huang     2025-01-08  2468  		if (prev_on_rq && prev->scx.slice) {
30dd3b13f9de612 Henry Huang     2025-01-08  2469  			rq->scx.flags |= SCX_RQ_BAL_KEEP;
30dd3b13f9de612 Henry Huang     2025-01-08  2470  			goto has_tasks;
30dd3b13f9de612 Henry Huang     2025-01-08  2471  		}
f0e1a0643a59bf1 Tejun Heo       2024-06-18  2472  		if (rq->scx.local_dsq.nr)
81aae789181b585 Tejun Heo       2024-06-18  2473  			goto has_tasks;
8409b800a0b1f14 Tejun Heo       2025-04-29  2474  		if (consume_global_dsq(sch, rq))
81aae789181b585 Tejun Heo       2024-06-18  2475  			goto has_tasks;
0922f54fdd15aed Tejun Heo       2024-06-18  2476  
0922f54fdd15aed Tejun Heo       2024-06-18  2477  		/*
0922f54fdd15aed Tejun Heo       2024-06-18  2478  		 * ops.dispatch() can trap us in this loop by repeatedly
0922f54fdd15aed Tejun Heo       2024-06-18  2479  		 * dispatching ineligible tasks. Break out once in a while to
0922f54fdd15aed Tejun Heo       2024-06-18  2480  		 * allow the watchdog to run. As IRQ can't be enabled in
0922f54fdd15aed Tejun Heo       2024-06-18  2481  		 * balance(), we want to complete this scheduling cycle and then
0922f54fdd15aed Tejun Heo       2024-06-18  2482  		 * start a new one. IOW, we want to call resched_curr() on the
0922f54fdd15aed Tejun Heo       2024-06-18  2483  		 * next, most likely idle, task, not the current one. Use
9fc687edf205dbc Tejun Heo       2025-09-23  2484  		 * scx_kick_cpu() for deferred kicking.
0922f54fdd15aed Tejun Heo       2024-06-18  2485  		 */
0922f54fdd15aed Tejun Heo       2024-06-18  2486  		if (unlikely(!--nr_loops)) {
9fc687edf205dbc Tejun Heo       2025-09-23  2487  			scx_kick_cpu(sch, cpu_of(rq), 0);
0922f54fdd15aed Tejun Heo       2024-06-18  2488  			break;
0922f54fdd15aed Tejun Heo       2024-06-18  2489  		}
f0e1a0643a59bf1 Tejun Heo       2024-06-18  2490  	} while (dspc->nr_tasks);
f0e1a0643a59bf1 Tejun Heo       2024-06-18  2491  
7c65ae81ea86a6e Tejun Heo       2024-09-03  2492  no_tasks:
7c65ae81ea86a6e Tejun Heo       2024-09-03  2493  	/*
7c65ae81ea86a6e Tejun Heo       2024-09-03  2494  	 * Didn't find another task to run. Keep running @prev unless
7c65ae81ea86a6e Tejun Heo       2024-09-03  2495  	 * %SCX_OPS_ENQ_LAST is in effect.
7c65ae81ea86a6e Tejun Heo       2024-09-03  2496  	 */
cc39454c341e02b Tejun Heo       2025-04-09  2497  	if (prev_on_rq &&
d310fb40096896a Tejun Heo       2025-05-14  2498  	    (!(sch->ops.flags & SCX_OPS_ENQ_LAST) || scx_rq_bypassing(rq))) {
8b1451f2f723f84 Tejun Heo       2024-09-03  2499  		rq->scx.flags |= SCX_RQ_BAL_KEEP;
c201ea1578d3b9e Tejun Heo       2025-04-29  2500  		__scx_add_event(sch, SCX_EV_DISPATCH_KEEP_LAST, 1);
7c65ae81ea86a6e Tejun Heo       2024-09-03  2501  		goto has_tasks;
7c65ae81ea86a6e Tejun Heo       2024-09-03  2502  	}
7c65ae81ea86a6e Tejun Heo       2024-09-03  2503  	rq->scx.flags &= ~SCX_RQ_IN_BALANCE;
7c65ae81ea86a6e Tejun Heo       2024-09-03  2504  	return false;
81aae789181b585 Tejun Heo       2024-06-18  2505  
81aae789181b585 Tejun Heo       2024-06-18  2506  has_tasks:
f47a818950dd5e5 Tejun Heo       2024-07-12  2507  	rq->scx.flags &= ~SCX_RQ_IN_BALANCE;
7c65ae81ea86a6e Tejun Heo       2024-09-03  2508  	return true;
f0e1a0643a59bf1 Tejun Heo       2024-06-18  2509  }
f0e1a0643a59bf1 Tejun Heo       2024-06-18  2510  

:::::: The code at line 2391 was first introduced by commit
:::::: cdf5a6faa8cf0ef62ec238a18b898ca9827bc472 sched_ext: Move dsq_hash into scx_sched

:::::: TO: Tejun Heo <tj@kernel.org>
:::::: CC: Tejun Heo <tj@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
