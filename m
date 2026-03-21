Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3989374184
	for <oe-kbuild-all@lists.linux.dev>; Sat, 21 Mar 2026 06:54:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774076102; cv=none; b=OuQSZDVcGRVwxU9FmJGBTtmqT6P/xVBWDrSs24SaX5BFlfEQEyTH1yPA4oPj0BYjlKyxZcN4fF8aq9OqxK4EFx401juD58rnjcUOHqfmNmRohzKm6WOTX0VxtFJM/KiWaSnfnGsQ3DYNrHl1b6LoTQImVNL6ThB6ioeU/Z04328=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774076102; c=relaxed/simple;
	bh=DtAIB6k1aw6FFPHxEVEvXQ7zgC+oXfvPriFbqFKGSWo=;
	h=Date:From:To:Cc:Subject:Message-ID; b=NBEKhZfC/4PGnfYofSdUR2Wcbi91PZC7BJJZReqbUEShFqxmzae+xsTES/YfiI805l52th/xcW6rDZI7QvUXWKAAmUCizvFBUzAra+GaigQNQoQDCU/3yZia2S4w9kWAePZUW+NUEetxeMs0QrF7xWT2HNEK8O7RTQZWnOUbqBc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fsy/T0R1; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fsy/T0R1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774076100; x=1805612100;
  h=date:from:to:cc:subject:message-id;
  bh=DtAIB6k1aw6FFPHxEVEvXQ7zgC+oXfvPriFbqFKGSWo=;
  b=fsy/T0R1x4V5bT5ooBfk3fCbPNaR9p6JV4+5lsZL1ak0e7loSHntPFfM
   Z+CsbGsUdNcXHIzK6d2Wf4rK6MXMKNsfj5E8QCVMhTLjpu0KNwd0mag1h
   mmb7vj90Rw9oiqecEcf970GQG841/Fiaxgl/vJIvoahvY+BONtAttVyqC
   nGzDTd6E/J0PWQWwblu5mf+/86ITg3clabYyfbkreVnXAKNIBYOlHSuFY
   Zhdsga8A5lR+mb3ME4qObHE4B8pQN3+f/dI8apGEkEORdxTeF0tCUDDCl
   n9eHg7QTDC/YtqerC9jz2ZWSQ538oNnQnDWPby79cx/23Yln11ot/fLig
   g==;
X-CSE-ConnectionGUID: fxp+ME5lQvC//z3WmldDcw==
X-CSE-MsgGUID: oY32+Wp7T96E5UUr0gZURA==
X-IronPort-AV: E=McAfee;i="6800,10657,11735"; a="97780097"
X-IronPort-AV: E=Sophos;i="6.23,132,1770624000"; 
   d="scan'208";a="97780097"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Mar 2026 23:55:00 -0700
X-CSE-ConnectionGUID: 2xxUT7olRQmpLFNqyO6J4w==
X-CSE-MsgGUID: oTgN+aY4SfC9mEhf7el3Fg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,132,1770624000"; 
   d="scan'208";a="223718699"
Received: from lkp-server02.sh.intel.com (HELO d7fefbca0d04) ([10.239.97.151])
  by orviesa007.jf.intel.com with ESMTP; 20 Mar 2026 23:54:57 -0700
Received: from kbuild by d7fefbca0d04 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w3qEY-000000000PF-0pXu;
	Sat, 21 Mar 2026 06:54:54 +0000
Date: Sat, 21 Mar 2026 14:54:48 +0800
From: kernel test robot <lkp@intel.com>
To: Tejun Heo <tj@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, Andrea Righi <arighi@nvidia.com>
Subject: [linux-next:master 3193/7971] kernel/sched/ext.c:3403:62:
 sparse: sparse: incorrect type in initializer (different address spaces)
Message-ID: <202603211439.pwmWWkNI-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   785f0eb2f85decbe7c1ef9ae922931f0194ffc2e
commit: 337ec00b1d9c676f637651c2cefddb8612b867ee [3193/7971] sched_ext: Implement cgroup sub-sched enabling and disabling
config: arm64-randconfig-r112-20260321 (https://download.01.org/0day-ci/archive/20260321/202603211439.pwmWWkNI-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260321/202603211439.pwmWWkNI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603211439.pwmWWkNI-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
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
   kernel/sched/ext.c:1127:38: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *curr @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/ext.c:1207:27: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct scx_sched *sch @@     got struct scx_sched [noderef] __rcu *[addressable] [toplevel] scx_root @@
   kernel/sched/ext.c:1217:48: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/ext.c:1217:48: sparse:    struct task_struct *
   kernel/sched/ext.c:1217:48: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/ext.c:1376:66: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/ext.c:1376:66: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/ext.c:1376:66: sparse:    struct task_struct *
   kernel/sched/ext.c:1875:35: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *donor @@
   kernel/sched/ext.c:1875:35: sparse:     expected struct task_struct *p
   kernel/sched/ext.c:1875:35: sparse:     got struct task_struct [noderef] __rcu *donor
   kernel/sched/ext.c:1886:38: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *from @@     got struct task_struct [noderef] __rcu *donor @@
   kernel/sched/ext.c:1886:38: sparse:     expected struct task_struct *from
   kernel/sched/ext.c:1886:38: sparse:     got struct task_struct [noderef] __rcu *donor
   kernel/sched/ext.c:2520:33: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct scx_sched *sch @@     got struct scx_sched [noderef] __rcu *[addressable] [toplevel] scx_root @@
   kernel/sched/ext.c:2520:33: sparse:     expected struct scx_sched *sch
   kernel/sched/ext.c:2520:33: sparse:     got struct scx_sched [noderef] __rcu *[addressable] [toplevel] scx_root
   kernel/sched/ext.c:2675:33: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct scx_sched *sch @@     got struct scx_sched [noderef] __rcu *[addressable] [toplevel] scx_root @@
   kernel/sched/ext.c:2675:33: sparse:     expected struct scx_sched *sch
   kernel/sched/ext.c:2675:33: sparse:     got struct scx_sched [noderef] __rcu *[addressable] [toplevel] scx_root
   kernel/sched/ext.c:2770:38: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *prev @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/ext.c:2770:38: sparse:     expected struct task_struct *prev
   kernel/sched/ext.c:2770:38: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/ext.c:2990:33: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct scx_sched *sch @@     got struct scx_sched [noderef] __rcu *[addressable] [toplevel] scx_root @@
   kernel/sched/ext.c:2990:33: sparse:     expected struct scx_sched *sch
   kernel/sched/ext.c:2990:33: sparse:     got struct scx_sched [noderef] __rcu *[addressable] [toplevel] scx_root
>> kernel/sched/ext.c:3403:62: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct scx_sched *sch @@     got struct scx_sched [noderef] __rcu *scx_sched @@
   kernel/sched/ext.c:3403:62: sparse:     expected struct scx_sched *sch
   kernel/sched/ext.c:3403:62: sparse:     got struct scx_sched [noderef] __rcu *scx_sched
   kernel/sched/ext.c:3613:33: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct scx_sched *sch @@     got struct scx_sched [noderef] __rcu *[addressable] [toplevel] scx_root @@
   kernel/sched/ext.c:3613:33: sparse:     expected struct scx_sched *sch
   kernel/sched/ext.c:3613:33: sparse:     got struct scx_sched [noderef] __rcu *[addressable] [toplevel] scx_root
   kernel/sched/ext.c:3642:33: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct scx_sched *sch @@     got struct scx_sched [noderef] __rcu *[addressable] [toplevel] scx_root @@
   kernel/sched/ext.c:3642:33: sparse:     expected struct scx_sched *sch
   kernel/sched/ext.c:3642:33: sparse:     got struct scx_sched [noderef] __rcu *[addressable] [toplevel] scx_root
   kernel/sched/ext.c:3655:33: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct scx_sched *sch @@     got struct scx_sched [noderef] __rcu *[addressable] [toplevel] scx_root @@
   kernel/sched/ext.c:3655:33: sparse:     expected struct scx_sched *sch
   kernel/sched/ext.c:3655:33: sparse:     got struct scx_sched [noderef] __rcu *[addressable] [toplevel] scx_root
   kernel/sched/ext.c:3704:33: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct scx_sched *sch @@     got struct scx_sched [noderef] __rcu *[addressable] [toplevel] scx_root @@
   kernel/sched/ext.c:3704:33: sparse:     expected struct scx_sched *sch
   kernel/sched/ext.c:3704:33: sparse:     got struct scx_sched [noderef] __rcu *[addressable] [toplevel] scx_root
   kernel/sched/ext.c:3723:33: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct scx_sched *sch @@     got struct scx_sched [noderef] __rcu *[addressable] [toplevel] scx_root @@
   kernel/sched/ext.c:3723:33: sparse:     expected struct scx_sched *sch
   kernel/sched/ext.c:3723:33: sparse:     got struct scx_sched [noderef] __rcu *[addressable] [toplevel] scx_root
   kernel/sched/ext.c:3741:33: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct scx_sched *sch @@     got struct scx_sched [noderef] __rcu *[addressable] [toplevel] scx_root @@
   kernel/sched/ext.c:3741:33: sparse:     expected struct scx_sched *sch
   kernel/sched/ext.c:3741:33: sparse:     got struct scx_sched [noderef] __rcu *[addressable] [toplevel] scx_root
   kernel/sched/ext.c:3757:33: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct scx_sched *sch @@     got struct scx_sched [noderef] __rcu *[addressable] [toplevel] scx_root @@
   kernel/sched/ext.c:3757:33: sparse:     expected struct scx_sched *sch
   kernel/sched/ext.c:3757:33: sparse:     got struct scx_sched [noderef] __rcu *[addressable] [toplevel] scx_root
   kernel/sched/ext.c:3774:33: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct scx_sched *sch @@     got struct scx_sched [noderef] __rcu *[addressable] [toplevel] scx_root @@
   kernel/sched/ext.c:3774:33: sparse:     expected struct scx_sched *sch
   kernel/sched/ext.c:3774:33: sparse:     got struct scx_sched [noderef] __rcu *[addressable] [toplevel] scx_root
   kernel/sched/ext.c:4786:50: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct scx_kick_syncs **ksyncs @@     got struct scx_kick_syncs [noderef] __rcu ** @@
   kernel/sched/ext.c:4786:50: sparse:     expected struct scx_kick_syncs **ksyncs
   kernel/sched/ext.c:4786:50: sparse:     got struct scx_kick_syncs [noderef] __rcu **
   kernel/sched/ext.c:4789:27: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/ext.c:4789:27: sparse:    struct scx_kick_syncs [noderef] __rcu *
   kernel/sched/ext.c:4789:27: sparse:    struct scx_kick_syncs *
   kernel/sched/ext.c:4789:27: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/ext.c:4789:27: sparse:    struct scx_kick_syncs [noderef] __rcu *
   kernel/sched/ext.c:4789:27: sparse:    struct scx_kick_syncs *
   kernel/sched/ext.c:5506:65: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct task_struct const *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/ext.c:5506:65: sparse:     expected struct task_struct const *p
   kernel/sched/ext.c:5506:65: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/ext.c:5507:57: sparse: sparse: incorrect type in argument 4 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/ext.c:5507:57: sparse:     expected struct task_struct *p
   kernel/sched/ext.c:5507:57: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/ext.c:5587:50: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct scx_kick_syncs **ksyncs @@     got struct scx_kick_syncs [noderef] __rcu ** @@
   kernel/sched/ext.c:5587:50: sparse:     expected struct scx_kick_syncs **ksyncs
   kernel/sched/ext.c:5587:50: sparse:     got struct scx_kick_syncs [noderef] __rcu **
   kernel/sched/ext.c:5590:17: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/ext.c:5590:17: sparse:    struct scx_kick_syncs [noderef] __rcu *
   kernel/sched/ext.c:5590:17: sparse:    struct scx_kick_syncs *
   kernel/sched/ext.c:5599:17: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/ext.c:5599:17: sparse:    struct scx_kick_syncs [noderef] __rcu *
   kernel/sched/ext.c:5599:17: sparse:    struct scx_kick_syncs *
   kernel/sched/ext.c:6059:40: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct scx_sched *parent @@     got struct scx_sched [noderef] __rcu *scx_sched @@
   kernel/sched/ext.c:6059:40: sparse:     expected struct scx_sched *parent
   kernel/sched/ext.c:6059:40: sparse:     got struct scx_sched [noderef] __rcu *scx_sched
   kernel/sched/ext.c:6344:38: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct scx_sched *sch @@     got struct scx_sched [noderef] __rcu *scx_sched @@
   kernel/sched/ext.c:6344:38: sparse:     expected struct scx_sched *sch
   kernel/sched/ext.c:6344:38: sparse:     got struct scx_sched [noderef] __rcu *scx_sched
   kernel/sched/ext.c:6734:32: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct const *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/ext.c:6734:32: sparse:     expected struct task_struct const *p
   kernel/sched/ext.c:6734:32: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/ext.c:6861:33: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct scx_sched *sch @@     got struct scx_sched [noderef] __rcu *[addressable] [assigned] [toplevel] scx_root @@
   kernel/sched/ext.c:6861:33: sparse:     expected struct scx_sched *sch
   kernel/sched/ext.c:6861:33: sparse:     got struct scx_sched [noderef] __rcu *[addressable] [assigned] [toplevel] scx_root
   kernel/sched/ext.c:8175:18: sparse: sparse: symbol 'scx_bpf_reenqueue_local___v2' was not declared. Should it be static?
   kernel/sched/ext.c:8352:33: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/ext.c:8352:33: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/ext.c:8352:33: sparse:    struct task_struct const *

vim +3403 kernel/sched/ext.c

  3394	
  3395	int scx_fork(struct task_struct *p, struct kernel_clone_args *kargs)
  3396	{
  3397		s32 ret;
  3398	
  3399		percpu_rwsem_assert_held(&scx_fork_rwsem);
  3400	
  3401		if (scx_init_task_enabled) {
  3402	#ifdef CONFIG_EXT_SUB_SCHED
> 3403			struct scx_sched *sch = kargs->cset->dfl_cgrp->scx_sched;
  3404	#else
  3405			struct scx_sched *sch = scx_root;
  3406	#endif
  3407			ret = scx_init_task(sch, p, true);
  3408			if (!ret)
  3409				scx_set_task_sched(p, sch);
  3410			return ret;
  3411		}
  3412	
  3413		return 0;
  3414	}
  3415	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
