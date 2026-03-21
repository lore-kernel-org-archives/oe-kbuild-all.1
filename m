Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6061D29BDAA
	for <oe-kbuild-all@lists.linux.dev>; Sat, 21 Mar 2026 04:26:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774067218; cv=none; b=NvTZRGdiQIxCf9J6Ma0sX+thuNLMTFcxe5wzJc3hwDd06OR/eWF0sP1nLkty1djfPIWl2iP0fgBjh35f7FhVyC/EMSIh9l/5mibztTXa+YXeTp0lvWI6QkzZn1HBLkZ/XjXiGtIyLDIc96CQ6eiuIvA5v4AEVSnsqEXdYL0omME=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774067218; c=relaxed/simple;
	bh=2011yjXnLfqsSeZAe0ODh4CssaNxVPT/iVWtMcDCHaM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=IvM9Lic/beaTOZMyHbxZuNfHIGWBDbxSpLIvN4SGJlmwidHLnTA0tR1JkvrgAlieFaBsNb+npzz0iYOYdJqsbY5y9vH+G8ZzjiL0nT+yi9ZEIu0fmp5T6kALYXbrNkk5pHn9eeTwGty36e/cOMU06bzIytRH6lUl7txJ4qu4bgo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lVDZyEEM; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lVDZyEEM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774067214; x=1805603214;
  h=date:from:to:cc:subject:message-id;
  bh=2011yjXnLfqsSeZAe0ODh4CssaNxVPT/iVWtMcDCHaM=;
  b=lVDZyEEMC2VZXFS/2xOHGm1fbT/4jQ0fi1oJikuC3dlhxlyXcA9k+s3Y
   J2eQi/F0Dk+ld6EG1Y0yTAB3wvhH80cVnrBXoxxNU+rRljDs/UdHuqFBQ
   sVdDnhMetayqJJtZuEDVIF1inrCjXAa1FhpRHndFmSTYE783/w17P0x7s
   eDt4VBoqx7OiHurLPpdQcTEFhv0l5iYCaizfeyf/1XB7E/P/HygsuD7X5
   hIfUiNp45mxnYKI/6Pfi5E5cTA+G8d1Of1+u7wI/NXTQJ/VdLMfP7eFZU
   wRllk1F+AE2cn+VtmtfpGhHiaBvmNU8JdkBTeYHnKWkC8o0LxosHHWGjo
   g==;
X-CSE-ConnectionGUID: klyfcAzoQze3BMgTqXNF2g==
X-CSE-MsgGUID: MydmIN3xS9GOew43AorZKQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11735"; a="75274628"
X-IronPort-AV: E=Sophos;i="6.23,132,1770624000"; 
   d="scan'208";a="75274628"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Mar 2026 21:26:54 -0700
X-CSE-ConnectionGUID: lRv3EAg9T7Cyjd+ytOmBkA==
X-CSE-MsgGUID: V1HbKFruSyysne2zkdIv1g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,132,1770624000"; 
   d="scan'208";a="227598616"
Received: from lkp-server02.sh.intel.com (HELO d7fefbca0d04) ([10.239.97.151])
  by orviesa003.jf.intel.com with ESMTP; 20 Mar 2026 21:26:51 -0700
Received: from kbuild by d7fefbca0d04 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w3nqa-000000000Hn-346Q;
	Sat, 21 Mar 2026 04:22:48 +0000
Date: Sat, 21 Mar 2026 12:15:47 +0800
From: kernel test robot <lkp@intel.com>
To: Tejun Heo <tj@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, Andrea Righi <arighi@nvidia.com>
Subject: [linux-next:master 3171/7971] kernel/sched/ext.c:5678:40:
 sparse: sparse: incorrect type in initializer (different address spaces)
Message-ID: <202603211220.dWi6MHR5-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   785f0eb2f85decbe7c1ef9ae922931f0194ffc2e
commit: ebeca1f930eac8f11f815d58eb38fa5d07e7c16e [3171/7971] sched_ext: Introduce cgroup sub-sched support
config: arm64-randconfig-r112-20260321 (https://download.01.org/0day-ci/archive/20260321/202603211220.dWi6MHR5-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260321/202603211220.dWi6MHR5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603211220.dWi6MHR5-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   kernel/sched/ext.c:1852:33: sparse:     got struct scx_sched [noderef] __rcu *static [toplevel] scx_root
   kernel/sched/ext.c:1853:38: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *from @@     got struct task_struct [noderef] __rcu *donor @@
   kernel/sched/ext.c:1853:38: sparse:     expected struct task_struct *from
   kernel/sched/ext.c:1853:38: sparse:     got struct task_struct [noderef] __rcu *donor
   kernel/sched/ext.c:2385:33: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct scx_sched *sch @@     got struct scx_sched [noderef] __rcu *static [toplevel] scx_root @@
   kernel/sched/ext.c:2385:33: sparse:     expected struct scx_sched *sch
   kernel/sched/ext.c:2385:33: sparse:     got struct scx_sched [noderef] __rcu *static [toplevel] scx_root
   kernel/sched/ext.c:2534:33: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct scx_sched *sch @@     got struct scx_sched [noderef] __rcu *static [toplevel] scx_root @@
   kernel/sched/ext.c:2534:33: sparse:     expected struct scx_sched *sch
   kernel/sched/ext.c:2534:33: sparse:     got struct scx_sched [noderef] __rcu *static [toplevel] scx_root
   kernel/sched/ext.c:2590:33: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct scx_sched *sch @@     got struct scx_sched [noderef] __rcu *static [toplevel] scx_root @@
   kernel/sched/ext.c:2590:33: sparse:     expected struct scx_sched *sch
   kernel/sched/ext.c:2590:33: sparse:     got struct scx_sched [noderef] __rcu *static [toplevel] scx_root
   kernel/sched/ext.c:2631:33: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct scx_sched *sch @@     got struct scx_sched [noderef] __rcu *static [toplevel] scx_root @@
   kernel/sched/ext.c:2631:33: sparse:     expected struct scx_sched *sch
   kernel/sched/ext.c:2631:33: sparse:     got struct scx_sched [noderef] __rcu *static [toplevel] scx_root
   kernel/sched/ext.c:2685:38: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *prev @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/ext.c:2685:38: sparse:     expected struct task_struct *prev
   kernel/sched/ext.c:2685:38: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/ext.c:2820:33: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct scx_sched *sch @@     got struct scx_sched [noderef] __rcu *static [addressable] [toplevel] scx_root @@
   kernel/sched/ext.c:2820:33: sparse:     expected struct scx_sched *sch
   kernel/sched/ext.c:2820:33: sparse:     got struct scx_sched [noderef] __rcu *static [addressable] [toplevel] scx_root
   kernel/sched/ext.c:2881:33: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct scx_sched *sch @@     got struct scx_sched [noderef] __rcu *static [addressable] [toplevel] scx_root @@
   kernel/sched/ext.c:2881:33: sparse:     expected struct scx_sched *sch
   kernel/sched/ext.c:2881:33: sparse:     got struct scx_sched [noderef] __rcu *static [addressable] [toplevel] scx_root
   kernel/sched/ext.c:2903:33: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct scx_sched *sch @@     got struct scx_sched [noderef] __rcu *static [addressable] [toplevel] scx_root @@
   kernel/sched/ext.c:2903:33: sparse:     expected struct scx_sched *sch
   kernel/sched/ext.c:2903:33: sparse:     got struct scx_sched [noderef] __rcu *static [addressable] [toplevel] scx_root
   kernel/sched/ext.c:3025:33: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct scx_sched *sch @@     got struct scx_sched [noderef] __rcu *static [addressable] [toplevel] scx_root @@
   kernel/sched/ext.c:3025:33: sparse:     expected struct scx_sched *sch
   kernel/sched/ext.c:3025:33: sparse:     got struct scx_sched [noderef] __rcu *static [addressable] [toplevel] scx_root
   kernel/sched/ext.c:3104:33: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct scx_sched *sch @@     got struct scx_sched [noderef] __rcu *static [addressable] [toplevel] scx_root @@
   kernel/sched/ext.c:3104:33: sparse:     expected struct scx_sched *sch
   kernel/sched/ext.c:3104:33: sparse:     got struct scx_sched [noderef] __rcu *static [addressable] [toplevel] scx_root
   kernel/sched/ext.c:3160:33: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct scx_sched *sch @@     got struct scx_sched [noderef] __rcu *static [addressable] [toplevel] scx_root @@
   kernel/sched/ext.c:3160:33: sparse:     expected struct scx_sched *sch
   kernel/sched/ext.c:3160:33: sparse:     got struct scx_sched [noderef] __rcu *static [addressable] [toplevel] scx_root
   kernel/sched/ext.c:3195:33: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct scx_sched *sch @@     got struct scx_sched [noderef] __rcu *static [addressable] [toplevel] scx_root @@
   kernel/sched/ext.c:3195:33: sparse:     expected struct scx_sched *sch
   kernel/sched/ext.c:3195:33: sparse:     got struct scx_sched [noderef] __rcu *static [addressable] [toplevel] scx_root
   kernel/sched/ext.c:3215:33: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct scx_sched *sch @@     got struct scx_sched [noderef] __rcu *static [addressable] [toplevel] scx_root @@
   kernel/sched/ext.c:3215:33: sparse:     expected struct scx_sched *sch
   kernel/sched/ext.c:3215:33: sparse:     got struct scx_sched [noderef] __rcu *static [addressable] [toplevel] scx_root
   kernel/sched/ext.c:3380:33: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct scx_sched *sch @@     got struct scx_sched [noderef] __rcu *static [addressable] [toplevel] scx_root @@
   kernel/sched/ext.c:3380:33: sparse:     expected struct scx_sched *sch
   kernel/sched/ext.c:3380:33: sparse:     got struct scx_sched [noderef] __rcu *static [addressable] [toplevel] scx_root
   kernel/sched/ext.c:3399:33: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct scx_sched *sch @@     got struct scx_sched [noderef] __rcu *static [addressable] [toplevel] scx_root @@
   kernel/sched/ext.c:3399:33: sparse:     expected struct scx_sched *sch
   kernel/sched/ext.c:3399:33: sparse:     got struct scx_sched [noderef] __rcu *static [addressable] [toplevel] scx_root
   kernel/sched/ext.c:3474:33: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct scx_sched *sch @@     got struct scx_sched [noderef] __rcu *static [addressable] [toplevel] scx_root @@
   kernel/sched/ext.c:3474:33: sparse:     expected struct scx_sched *sch
   kernel/sched/ext.c:3474:33: sparse:     got struct scx_sched [noderef] __rcu *static [addressable] [toplevel] scx_root
   kernel/sched/ext.c:3503:33: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct scx_sched *sch @@     got struct scx_sched [noderef] __rcu *static [addressable] [toplevel] scx_root @@
   kernel/sched/ext.c:3503:33: sparse:     expected struct scx_sched *sch
   kernel/sched/ext.c:3503:33: sparse:     got struct scx_sched [noderef] __rcu *static [addressable] [toplevel] scx_root
   kernel/sched/ext.c:3516:33: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct scx_sched *sch @@     got struct scx_sched [noderef] __rcu *static [addressable] [toplevel] scx_root @@
   kernel/sched/ext.c:3516:33: sparse:     expected struct scx_sched *sch
   kernel/sched/ext.c:3516:33: sparse:     got struct scx_sched [noderef] __rcu *static [addressable] [toplevel] scx_root
   kernel/sched/ext.c:3565:33: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct scx_sched *sch @@     got struct scx_sched [noderef] __rcu *static [addressable] [toplevel] scx_root @@
   kernel/sched/ext.c:3565:33: sparse:     expected struct scx_sched *sch
   kernel/sched/ext.c:3565:33: sparse:     got struct scx_sched [noderef] __rcu *static [addressable] [toplevel] scx_root
   kernel/sched/ext.c:3584:33: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct scx_sched *sch @@     got struct scx_sched [noderef] __rcu *static [addressable] [toplevel] scx_root @@
   kernel/sched/ext.c:3584:33: sparse:     expected struct scx_sched *sch
   kernel/sched/ext.c:3584:33: sparse:     got struct scx_sched [noderef] __rcu *static [addressable] [toplevel] scx_root
   kernel/sched/ext.c:3602:33: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct scx_sched *sch @@     got struct scx_sched [noderef] __rcu *static [addressable] [toplevel] scx_root @@
   kernel/sched/ext.c:3602:33: sparse:     expected struct scx_sched *sch
   kernel/sched/ext.c:3602:33: sparse:     got struct scx_sched [noderef] __rcu *static [addressable] [toplevel] scx_root
   kernel/sched/ext.c:3618:33: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct scx_sched *sch @@     got struct scx_sched [noderef] __rcu *static [addressable] [toplevel] scx_root @@
   kernel/sched/ext.c:3618:33: sparse:     expected struct scx_sched *sch
   kernel/sched/ext.c:3618:33: sparse:     got struct scx_sched [noderef] __rcu *static [addressable] [toplevel] scx_root
   kernel/sched/ext.c:3635:33: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct scx_sched *sch @@     got struct scx_sched [noderef] __rcu *static [addressable] [toplevel] scx_root @@
   kernel/sched/ext.c:3635:33: sparse:     expected struct scx_sched *sch
   kernel/sched/ext.c:3635:33: sparse:     got struct scx_sched [noderef] __rcu *static [addressable] [toplevel] scx_root
   kernel/sched/ext.c:4554:50: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct scx_kick_syncs **ksyncs @@     got struct scx_kick_syncs [noderef] __rcu ** @@
   kernel/sched/ext.c:4554:50: sparse:     expected struct scx_kick_syncs **ksyncs
   kernel/sched/ext.c:4554:50: sparse:     got struct scx_kick_syncs [noderef] __rcu **
   kernel/sched/ext.c:4557:27: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/ext.c:4557:27: sparse:    struct scx_kick_syncs [noderef] __rcu *
   kernel/sched/ext.c:4557:27: sparse:    struct scx_kick_syncs *
   kernel/sched/ext.c:4557:27: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/ext.c:4557:27: sparse:    struct scx_kick_syncs [noderef] __rcu *
   kernel/sched/ext.c:4557:27: sparse:    struct scx_kick_syncs *
   kernel/sched/ext.c:4963:33: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct scx_sched *sch @@     got struct scx_sched [noderef] __rcu *static [addressable] [assigned] [toplevel] scx_root @@
   kernel/sched/ext.c:4963:33: sparse:     expected struct scx_sched *sch
   kernel/sched/ext.c:4963:33: sparse:     got struct scx_sched [noderef] __rcu *static [addressable] [assigned] [toplevel] scx_root
   kernel/sched/ext.c:5006:33: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct scx_sched *sch @@     got struct scx_sched [noderef] __rcu *static [addressable] [assigned] [toplevel] scx_root @@
   kernel/sched/ext.c:5006:33: sparse:     expected struct scx_sched *sch
   kernel/sched/ext.c:5006:33: sparse:     got struct scx_sched [noderef] __rcu *static [addressable] [assigned] [toplevel] scx_root
   kernel/sched/ext.c:5117:52: sparse: sparse: incorrect type in argument 3 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/ext.c:5117:52: sparse:     expected struct task_struct *p
   kernel/sched/ext.c:5117:52: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/ext.c:5196:50: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct scx_kick_syncs **ksyncs @@     got struct scx_kick_syncs [noderef] __rcu ** @@
   kernel/sched/ext.c:5196:50: sparse:     expected struct scx_kick_syncs **ksyncs
   kernel/sched/ext.c:5196:50: sparse:     got struct scx_kick_syncs [noderef] __rcu **
   kernel/sched/ext.c:5199:17: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/ext.c:5199:17: sparse:    struct scx_kick_syncs [noderef] __rcu *
   kernel/sched/ext.c:5199:17: sparse:    struct scx_kick_syncs *
   kernel/sched/ext.c:5208:17: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/ext.c:5208:17: sparse:    struct scx_kick_syncs [noderef] __rcu *
   kernel/sched/ext.c:5208:17: sparse:    struct scx_kick_syncs *
>> kernel/sched/ext.c:5678:40: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct scx_sched *parent @@     got struct scx_sched [noderef] __rcu *scx_sched @@
   kernel/sched/ext.c:5678:40: sparse:     expected struct scx_sched *parent
   kernel/sched/ext.c:5678:40: sparse:     got struct scx_sched [noderef] __rcu *scx_sched
>> kernel/sched/ext.c:5832:38: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct scx_sched *sch @@     got struct scx_sched [noderef] __rcu *scx_sched @@
   kernel/sched/ext.c:5832:38: sparse:     expected struct scx_sched *sch
   kernel/sched/ext.c:5832:38: sparse:     got struct scx_sched [noderef] __rcu *scx_sched
   kernel/sched/ext.c:6213:32: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct const *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/ext.c:6213:32: sparse:     expected struct task_struct const *p
   kernel/sched/ext.c:6213:32: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/ext.c:6340:33: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct scx_sched *sch @@     got struct scx_sched [noderef] __rcu *static [addressable] [assigned] [toplevel] scx_root @@
   kernel/sched/ext.c:6340:33: sparse:     expected struct scx_sched *sch
   kernel/sched/ext.c:6340:33: sparse:     got struct scx_sched [noderef] __rcu *static [addressable] [assigned] [toplevel] scx_root
   kernel/sched/ext.c:6670:33: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct scx_sched *sch @@     got struct scx_sched [noderef] __rcu *static [addressable] [assigned] [toplevel] scx_root @@
   kernel/sched/ext.c:6670:33: sparse:     expected struct scx_sched *sch
   kernel/sched/ext.c:6670:33: sparse:     got struct scx_sched [noderef] __rcu *static [addressable] [assigned] [toplevel] scx_root
   kernel/sched/ext.c:7585:18: sparse: sparse: symbol 'scx_bpf_reenqueue_local___v2' was not declared. Should it be static?
   kernel/sched/ext.c:7759:33: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/ext.c:7759:33: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/ext.c:7759:33: sparse:    struct task_struct const *
   kernel/sched/build_policy.c: note: in included file:
   kernel/sched/ext_idle.c:735:33: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct scx_sched *sch @@     got struct scx_sched [noderef] __rcu *static [addressable] [assigned] [toplevel] scx_root @@
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

vim +5678 kernel/sched/ext.c

  5673	
  5674	#ifdef CONFIG_EXT_SUB_SCHED
  5675	/* verify that a scheduler can be attached to @cgrp and return the parent */
  5676	static struct scx_sched *find_parent_sched(struct cgroup *cgrp)
  5677	{
> 5678		struct scx_sched *parent = cgrp->scx_sched;
  5679		struct scx_sched *pos;
  5680	
  5681		lockdep_assert_held(&scx_sched_lock);
  5682	
  5683		/* can't attach twice to the same cgroup */
  5684		if (parent->cgrp == cgrp)
  5685			return ERR_PTR(-EBUSY);
  5686	
  5687		/* does $parent allow sub-scheds? */
  5688		if (!parent->ops.sub_attach)
  5689			return ERR_PTR(-EOPNOTSUPP);
  5690	
  5691		/* can't insert between $parent and its exiting children */
  5692		list_for_each_entry(pos, &parent->children, sibling)
  5693			if (cgroup_is_descendant(pos->cgrp, cgrp))
  5694				return ERR_PTR(-EBUSY);
  5695	
  5696		return parent;
  5697	}
  5698	
  5699	static void scx_sub_enable_workfn(struct kthread_work *work)
  5700	{
  5701		struct scx_enable_cmd *cmd = container_of(work, struct scx_enable_cmd, work);
  5702		struct sched_ext_ops *ops = cmd->ops;
  5703		struct cgroup *cgrp;
  5704		struct scx_sched *parent, *sch;
  5705		s32 ret;
  5706	
  5707		mutex_lock(&scx_enable_mutex);
  5708	
  5709		if (!scx_enabled()) {
  5710			ret = -ENODEV;
  5711			goto out_unlock;
  5712		}
  5713	
  5714		cgrp = cgroup_get_from_id(ops->sub_cgroup_id);
  5715		if (IS_ERR(cgrp)) {
  5716			ret = PTR_ERR(cgrp);
  5717			goto out_unlock;
  5718		}
  5719	
  5720		raw_spin_lock_irq(&scx_sched_lock);
  5721		parent = find_parent_sched(cgrp);
  5722		if (IS_ERR(parent)) {
  5723			raw_spin_unlock_irq(&scx_sched_lock);
  5724			ret = PTR_ERR(parent);
  5725			goto out_put_cgrp;
  5726		}
  5727		kobject_get(&parent->kobj);
  5728		raw_spin_unlock_irq(&scx_sched_lock);
  5729	
  5730		sch = scx_alloc_and_add_sched(ops, cgrp, parent);
  5731		kobject_put(&parent->kobj);
  5732		if (IS_ERR(sch)) {
  5733			ret = PTR_ERR(sch);
  5734			goto out_put_cgrp;
  5735		}
  5736	
  5737		raw_spin_lock_irq(&scx_sched_lock);
  5738		list_add_tail(&sch->sibling, &parent->children);
  5739		list_add_tail_rcu(&sch->all, &scx_sched_all);
  5740		raw_spin_unlock_irq(&scx_sched_lock);
  5741	
  5742		if (sch->level >= SCX_SUB_MAX_DEPTH) {
  5743			scx_error(sch, "max nesting depth %d violated",
  5744				  SCX_SUB_MAX_DEPTH);
  5745			goto err_disable;
  5746		}
  5747	
  5748		if (sch->ops.init) {
  5749			ret = SCX_CALL_OP_RET(sch, SCX_KF_UNLOCKED, init, NULL);
  5750			if (ret) {
  5751				ret = ops_sanitize_err(sch, "init", ret);
  5752				scx_error(sch, "ops.init() failed (%d)", ret);
  5753				goto err_disable;
  5754			}
  5755			sch->exit_info->flags |= SCX_EFLAG_INITIALIZED;
  5756		}
  5757	
  5758		if (validate_ops(sch, ops))
  5759			goto err_disable;
  5760	
  5761		struct scx_sub_attach_args sub_attach_args = {
  5762			.ops = &sch->ops,
  5763			.cgroup_path = sch->cgrp_path,
  5764		};
  5765	
  5766		ret = SCX_CALL_OP_RET(parent, SCX_KF_UNLOCKED, sub_attach, NULL,
  5767				      &sub_attach_args);
  5768		if (ret) {
  5769			ret = ops_sanitize_err(sch, "sub_attach", ret);
  5770			scx_error(sch, "parent rejected (%d)", ret);
  5771			goto err_disable;
  5772		}
  5773		sch->sub_attached = true;
  5774	
  5775		percpu_down_write(&scx_fork_rwsem);
  5776		scx_cgroup_lock();
  5777	
  5778		/*
  5779		 * Set cgroup->scx_sched's and check CSS_ONLINE. Either we see
  5780		 * !CSS_ONLINE or scx_cgroup_lifetime_notify() sees and shoots us down.
  5781		 */
  5782		set_cgroup_sched(sch_cgroup(sch), sch);
  5783		if (!(cgrp->self.flags & CSS_ONLINE)) {
  5784			scx_error(sch, "cgroup is not online");
  5785			goto err_unlock_and_disable;
  5786		}
  5787	
  5788		/* TODO - perform actual enabling here */
  5789	
  5790		scx_cgroup_unlock();
  5791		percpu_up_write(&scx_fork_rwsem);
  5792	
  5793		pr_info("sched_ext: BPF sub-scheduler \"%s\" enabled\n", sch->ops.name);
  5794		kobject_uevent(&sch->kobj, KOBJ_ADD);
  5795		ret = 0;
  5796		goto out_unlock;
  5797	
  5798	out_put_cgrp:
  5799		cgroup_put(cgrp);
  5800	out_unlock:
  5801		mutex_unlock(&scx_enable_mutex);
  5802		cmd->ret = ret;
  5803		return;
  5804	
  5805	err_unlock_and_disable:
  5806		scx_cgroup_unlock();
  5807		percpu_up_write(&scx_fork_rwsem);
  5808	err_disable:
  5809		mutex_unlock(&scx_enable_mutex);
  5810		kthread_flush_work(&sch->disable_work);
  5811		cmd->ret = 0;
  5812	}
  5813	
  5814	static s32 scx_cgroup_lifetime_notify(struct notifier_block *nb,
  5815					      unsigned long action, void *data)
  5816	{
  5817		struct cgroup *cgrp = data;
  5818		struct cgroup *parent = cgroup_parent(cgrp);
  5819	
  5820		if (!cgroup_on_dfl(cgrp))
  5821			return NOTIFY_OK;
  5822	
  5823		switch (action) {
  5824		case CGROUP_LIFETIME_ONLINE:
  5825			/* inherit ->scx_sched from $parent */
  5826			if (parent)
  5827				rcu_assign_pointer(cgrp->scx_sched, parent->scx_sched);
  5828			break;
  5829		case CGROUP_LIFETIME_OFFLINE:
  5830			/* if there is a sched attached, shoot it down */
  5831			if (cgrp->scx_sched && cgrp->scx_sched->cgrp == cgrp)
> 5832				scx_exit(cgrp->scx_sched, SCX_EXIT_UNREG_KERN,
  5833					 SCX_ECODE_RSN_CGROUP_OFFLINE,
  5834					 "cgroup %llu going offline", cgroup_id(cgrp));
  5835			break;
  5836		}
  5837	
  5838		return NOTIFY_OK;
  5839	}
  5840	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
