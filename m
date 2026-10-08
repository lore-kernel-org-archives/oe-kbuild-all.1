Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F33143B6FD
	for <oe-kbuild-all@lists.linux.dev>; Thu,  8 Oct 2026 08:35:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791448542; cv=none; b=s267br8sNXGAc4WZ+RYsNkdDJi+giudYuDEkRL314KFuKqD0NjMRWRTQ2caS1/zc2RurmN70bjoZOw6m7WJWYvF5LvY45UDTkcqliSW7Tf797Xezdw4CpBg461IVTzyQ3N3lC3rZJ+j8t/+6Zk9XH78yA47cjll3ZBniFK8DasM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791448542; c=relaxed/simple;
	bh=twcZ8H6r91tvWOGWonRV2sNLfql4DuDlNyQaAYSUSQo=;
	h=Date:From:To:Cc:Subject:Message-ID; b=nsJeiDCxTA0yOGfdyXILNiiSJ5axHSpDy4WjZ/D8sROwgdq02WN95kEYIsdE3HvUHk8fUSvRBO/nUW0Jme0o9qXzgFxQrqcYAbHmTAT5s92O8BxUYL+QUU0+ngnlM1yMw+r3o8TyyEXTLxkYgGVTQ6tehDLb7ZqDJXFtMcVA1sQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eZePNNkQ; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eZePNNkQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791448539; x=1822984539;
  h=date:from:to:cc:subject:message-id;
  bh=twcZ8H6r91tvWOGWonRV2sNLfql4DuDlNyQaAYSUSQo=;
  b=eZePNNkQf1Df8d4w5FW2eWkvOqjiyI4A2q4bGNXfdeTuTYt96uhiG5FH
   QCiJrRTzJm7qqq+QAYvpeVEzFTP31V+JMdfRvrdkhT2wlBiZbNrtTBFra
   ODdpBsIZ7/FFGuJMplP+mGg6BxVDcKjLYG7XEIpR0zqwT18jZz/pVrtoK
   9uoMmxs1/O84fkCxLLrU7ilt0DjDqNR0i10QRP18Q/q6V3pG78a7tGmAx
   9/oAESQkQSnLJ6RD86AfM+B7VyYjHf9g8DxEOht/R0ihF4KmRoo1WVnBQ
   /Ti+EwKlbnknYb9wKMHQxWpPPwLK4+w0ZHfKvMNtd2pd43EQ0XcmgtxLU
   w==;
X-CSE-ConnectionGUID: BxEbDKTUT2OvSVjxdK5Wcg==
X-CSE-MsgGUID: nUBI6bbDT22tCQwpCcm3hA==
X-IronPort-AV: E=McAfee;i="6800,10657,11928"; a="108743"
X-IronPort-AV: E=Sophos;i="6.27,146,1787036400"; 
   d="scan'208";a="108743"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Oct 2026 01:35:36 -0700
X-CSE-ConnectionGUID: YBD6WEEvTUaWp9MwthX/MA==
X-CSE-MsgGUID: vqdh4dYeRV+JOf5qFiLvew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,146,1787036400"; 
   d="scan'208";a="1807635"
Received: from igk-lkp-server01.igk.intel.com (HELO d0de6c2a75a7) ([10.211.93.152])
  by fmviesa012.fm.intel.com with ESMTP; 08 Oct 2026 01:35:35 -0700
Received: from kbuild by d0de6c2a75a7 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xEjbA-0000000058z-1Tmm;
	Thu, 08 Oct 2026 08:35:32 +0000
Date: Thu, 08 Oct 2026 10:35:09 +0200
From: kernel test robot <lkp@intel.com>
To: Andrea Righi <arighi@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev, Tejun Heo <tj@kernel.org>,
 John Stultz <jstultz@google.com>
Subject: [tj-sched-ext:sub-child-ecaps 10/29]
 kernel/sched/ext/ext.c:1473:15: sparse: sparse: incorrect type in assignment
 (different address spaces)
Message-ID: <202610081054.lem5Cp12-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tj/sched_ext.git sub-child-ecaps
head:   a7f032d8f4aa889c3e6d9d232ab4b2fdcf97dc93
commit: 3d6577ea93c9633d95430c82c1cfe189d0f8fd47 [10/29] sched_ext: Split curr|donor references properly
config: sparc-randconfig-r2300-20261006 (https://download.01.org/0day-ci/archive/20261008/202610081054.lem5Cp12-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 8.5.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261008/202610081054.lem5Cp12-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610081054.lem5Cp12-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   kernel/sched/rt.c:1830:9: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] sd @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/rt.c:1830:9: sparse:     expected struct sched_domain *[assigned] sd
   kernel/sched/rt.c:1830:9: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/rt.c:1517:14: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct task_struct *curr @@     got struct task_struct [noderef] __rcu * @@
   kernel/sched/rt.c:1517:14: sparse:     expected struct task_struct *curr
   kernel/sched/rt.c:1517:14: sparse:     got struct task_struct [noderef] __rcu *
   kernel/sched/rt.c:1518:15: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct task_struct *donor @@     got struct task_struct [noderef] __rcu * @@
   kernel/sched/rt.c:1518:15: sparse:     expected struct task_struct *donor
   kernel/sched/rt.c:1518:15: sparse:     got struct task_struct [noderef] __rcu *
   kernel/sched/rt.c:1579:45: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *donor @@
   kernel/sched/rt.c:1579:45: sparse:     expected struct task_struct *p
   kernel/sched/rt.c:1579:45: sparse:     got struct task_struct [noderef] __rcu *donor
   kernel/sched/rt.c:1605:35: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *donor @@
   kernel/sched/rt.c:1605:35: sparse:     expected struct task_struct *p
   kernel/sched/rt.c:1605:35: sparse:     got struct task_struct [noderef] __rcu *donor
   kernel/sched/rt.c:1627:39: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *donor @@     got struct task_struct [noderef] __rcu *donor @@
   kernel/sched/rt.c:1627:39: sparse:     expected struct task_struct *donor
   kernel/sched/rt.c:1627:39: sparse:     got struct task_struct [noderef] __rcu *donor
   kernel/sched/rt.c:1653:64: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *tsk @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/rt.c:1653:64: sparse:     expected struct task_struct *tsk
   kernel/sched/rt.c:1653:64: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/rt.c:2006:40: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *task @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/rt.c:2006:40: sparse:     expected struct task_struct *task
   kernel/sched/rt.c:2006:40: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/rt.c:2029:13: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/rt.c:2029:13: sparse:    struct task_struct *
   kernel/sched/rt.c:2029:13: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/rt.c:2380:54: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *tsk @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/rt.c:2380:54: sparse:     expected struct task_struct *tsk
   kernel/sched/rt.c:2380:54: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/rt.c:2382:40: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *donor @@
   kernel/sched/rt.c:2382:40: sparse:     expected struct task_struct *p
   kernel/sched/rt.c:2382:40: sparse:     got struct task_struct [noderef] __rcu *donor
   kernel/sched/rt.c:2382:62: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *donor @@
   kernel/sched/rt.c:2382:62: sparse:     expected struct task_struct *p
   kernel/sched/rt.c:2382:62: sparse:     got struct task_struct [noderef] __rcu *donor
   kernel/sched/build_policy.c: note: in included file:
   kernel/sched/deadline.c:3157:23: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *donor @@
   kernel/sched/deadline.c:3157:23: sparse:     expected struct task_struct *p
   kernel/sched/deadline.c:3157:23: sparse:     got struct task_struct [noderef] __rcu *donor
   kernel/sched/deadline.c:3167:13: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/deadline.c:3167:13: sparse:    struct task_struct *
   kernel/sched/deadline.c:3167:13: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/deadline.c:3273:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/deadline.c:3273:25: sparse:    struct task_struct *
   kernel/sched/deadline.c:3273:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/deadline.c:2737:39: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *donor @@     got struct task_struct [noderef] __rcu *donor @@
   kernel/sched/deadline.c:2737:39: sparse:     expected struct task_struct *donor
   kernel/sched/deadline.c:2737:39: sparse:     got struct task_struct [noderef] __rcu *donor
   kernel/sched/deadline.c:2757:38: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *tsk @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/deadline.c:2757:38: sparse:     expected struct task_struct *tsk
   kernel/sched/deadline.c:2757:38: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/deadline.c:1189:39: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/deadline.c:1189:39: sparse:     expected struct task_struct *p
   kernel/sched/deadline.c:1189:39: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/deadline.c:1189:85: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct sched_dl_entity const *b @@     got struct sched_dl_entity [noderef] __rcu * @@
   kernel/sched/deadline.c:1189:85: sparse:     expected struct sched_dl_entity const *b
   kernel/sched/deadline.c:1189:85: sparse:     got struct sched_dl_entity [noderef] __rcu *
   kernel/sched/deadline.c:1287:23: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *donor @@
   kernel/sched/deadline.c:1287:23: sparse:     expected struct task_struct *p
   kernel/sched/deadline.c:1287:23: sparse:     got struct task_struct [noderef] __rcu *donor
   kernel/sched/deadline.c:1816:31: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/deadline.c:1816:31: sparse:     expected struct task_struct *p
   kernel/sched/deadline.c:1816:31: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/deadline.c:1816:70: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct sched_dl_entity const *b @@     got struct sched_dl_entity [noderef] __rcu * @@
   kernel/sched/deadline.c:1816:70: sparse:     expected struct sched_dl_entity const *b
   kernel/sched/deadline.c:1816:70: sparse:     got struct sched_dl_entity [noderef] __rcu *
   kernel/sched/deadline.c:2131:39: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *donor @@     got struct task_struct [noderef] __rcu *donor @@
   kernel/sched/deadline.c:2131:39: sparse:     expected struct task_struct *donor
   kernel/sched/deadline.c:2131:39: sparse:     got struct task_struct [noderef] __rcu *donor
   kernel/sched/deadline.c:2979:9: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] sd @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/deadline.c:2979:9: sparse:     expected struct sched_domain *[assigned] sd
   kernel/sched/deadline.c:2979:9: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/deadline.c:2619:14: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct task_struct *curr @@     got struct task_struct [noderef] __rcu * @@
   kernel/sched/deadline.c:2619:14: sparse:     expected struct task_struct *curr
   kernel/sched/deadline.c:2619:14: sparse:     got struct task_struct [noderef] __rcu *
   kernel/sched/deadline.c:2620:15: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct task_struct *donor @@     got struct task_struct [noderef] __rcu * @@
   kernel/sched/deadline.c:2620:15: sparse:     expected struct task_struct *donor
   kernel/sched/deadline.c:2620:15: sparse:     got struct task_struct [noderef] __rcu *
   kernel/sched/deadline.c:2694:43: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *donor @@
   kernel/sched/deadline.c:2694:43: sparse:     expected struct task_struct *p
   kernel/sched/deadline.c:2694:43: sparse:     got struct task_struct [noderef] __rcu *donor
   kernel/sched/deadline.c:2714:35: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *donor @@
   kernel/sched/deadline.c:2714:35: sparse:     expected struct task_struct *p
   kernel/sched/deadline.c:2714:35: sparse:     got struct task_struct [noderef] __rcu *donor
   kernel/sched/deadline.c:3318:38: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *tsk @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/deadline.c:3318:38: sparse:     expected struct task_struct *tsk
   kernel/sched/deadline.c:3318:38: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/deadline.c:3320:23: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *donor @@
   kernel/sched/deadline.c:3320:23: sparse:     expected struct task_struct *p
   kernel/sched/deadline.c:3320:23: sparse:     got struct task_struct [noderef] __rcu *donor
   kernel/sched/deadline.c:3322:44: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct sched_dl_entity const *b @@     got struct sched_dl_entity [noderef] __rcu * @@
   kernel/sched/deadline.c:3322:44: sparse:     expected struct sched_dl_entity const *b
   kernel/sched/deadline.c:3322:44: sparse:     got struct sched_dl_entity [noderef] __rcu *
   kernel/sched/deadline.c:3584:23: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/deadline.c:3584:23: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/deadline.c:3584:23: sparse:    struct task_struct *
   kernel/sched/deadline.c:3637:32: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/build_policy.c: note: in included file:
   kernel/sched/ext/ext.c:442:47: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *donor @@     got struct task_struct [noderef] __rcu *donor @@
>> kernel/sched/ext/ext.c:1473:15: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct task_struct *donor @@     got struct task_struct [noderef] __rcu *donor @@
   kernel/sched/ext/ext.c:1677:15: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/ext/ext.c:1677:15: sparse:    struct task_struct *
   kernel/sched/ext/ext.c:1677:15: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/ext/ext.c:2466:35: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *donor @@
   kernel/sched/ext/ext.c:2480:38: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *from @@     got struct task_struct [noderef] __rcu *donor @@
   kernel/sched/ext/ext.c:3338:39: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *donor @@     got struct task_struct [noderef] __rcu *donor @@
>> kernel/sched/ext/ext.c:3648:38: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *prev @@     got struct task_struct [noderef] __rcu *donor @@
>> kernel/sched/ext/ext.c:4813:48: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *donor @@
   kernel/sched/ext/ext.c:4814:38: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *donor @@
   kernel/sched/ext/ext.c:7353:57: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct task_struct const *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/ext/ext.c:7354:51: sparse: sparse: incorrect type in argument 5 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *curr @@
>> kernel/sched/ext/ext.c:7357:57: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct task_struct const *p @@     got struct task_struct [noderef] __rcu *donor @@
   kernel/sched/ext/ext.c:7358:51: sparse: sparse: incorrect type in argument 5 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *donor @@
   kernel/sched/ext/ext.c:8902:32: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct const *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/ext/ext.c:8948:44: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *donor @@
   kernel/sched/ext/ext.c:9311:18: sparse: sparse: symbol 'scx_bpf_dsq_insert___v2' was not declared. Should it be static?
   kernel/sched/ext/ext.c:9333:18: sparse: sparse: symbol 'scx_bpf_dsq_insert' was not declared. Should it be static?
   kernel/sched/ext/ext.c:9393:1: sparse: sparse: symbol '__scx_bpf_dsq_insert_vtime' was not declared. Should it be static?
   kernel/sched/ext/ext.c:9412:18: sparse: sparse: symbol 'scx_bpf_dsq_insert_vtime' was not declared. Should it be static?
   kernel/sched/ext/ext.c:9573:17: sparse: sparse: symbol 'scx_bpf_dispatch_nr_slots' was not declared. Should it be static?
   kernel/sched/ext/ext.c:9593:18: sparse: sparse: symbol 'scx_bpf_dispatch_cancel' was not declared. Should it be static?
   kernel/sched/ext/ext.c:9637:18: sparse: sparse: symbol 'scx_bpf_dsq_move_to_local___v2' was not declared. Should it be static?
   kernel/sched/ext/ext.c:9680:18: sparse: sparse: symbol 'scx_bpf_dsq_move_to_local' was not declared. Should it be static?
   kernel/sched/ext/ext.c:9694:18: sparse: sparse: symbol 'scx_bpf_dsq_move_set_slice' was not declared. Should it be static?
   kernel/sched/ext/ext.c:9713:18: sparse: sparse: symbol 'scx_bpf_dsq_move_set_vtime' was not declared. Should it be static?
   kernel/sched/ext/ext.c:9747:18: sparse: sparse: symbol 'scx_bpf_dsq_move' was not declared. Should it be static?
   kernel/sched/ext/ext.c:9772:18: sparse: sparse: symbol 'scx_bpf_dsq_move_vtime' was not declared. Should it be static?
   kernel/sched/ext/ext.c:9813:17: sparse: sparse: symbol 'scx_bpf_reenqueue_local' was not declared. Should it be static?
   kernel/sched/ext/ext.c:9852:17: sparse: sparse: symbol 'scx_bpf_create_dsq' was not declared. Should it be static?
   kernel/sched/ext/ext.c:9939:18: sparse: sparse: symbol 'scx_bpf_task_set_slice' was not declared. Should it be static?
   kernel/sched/ext/ext.c:9995:18: sparse: sparse: symbol 'scx_bpf_task_set_dsq_vtime' was not declared. Should it be static?
   kernel/sched/ext/ext.c:10127:18: sparse: sparse: symbol 'scx_bpf_kick_cpu' was not declared. Should it be static?
   kernel/sched/ext/ext.c:10150:18: sparse: sparse: symbol 'scx_bpf_kick_cid' was not declared. Should it be static?
   kernel/sched/ext/ext.c:10177:17: sparse: sparse: symbol 'scx_bpf_dsq_nr_queued' was not declared. Should it be static?
   kernel/sched/ext/ext.c:10224:18: sparse: sparse: symbol 'scx_bpf_destroy_dsq' was not declared. Should it be static?
   kernel/sched/ext/ext.c:10250:17: sparse: sparse: symbol 'bpf_iter_scx_dsq_new' was not declared. Should it be static?
   kernel/sched/ext/ext.c:10294:32: sparse: sparse: symbol 'bpf_iter_scx_dsq_next' was not declared. Should it be static?
   kernel/sched/ext/ext.c:10312:18: sparse: sparse: symbol 'bpf_iter_scx_dsq_destroy' was not declared. Should it be static?
   kernel/sched/ext/ext.c:10341:32: sparse: sparse: symbol 'scx_bpf_dsq_peek' was not declared. Should it be static?
   kernel/sched/ext/ext.c:10384:18: sparse: sparse: symbol 'scx_bpf_dsq_reenq' was not declared. Should it be static?
   kernel/sched/ext/ext.c:10424:18: sparse: sparse: symbol 'scx_bpf_reenqueue_local___v2' was not declared. Should it be static?
   kernel/sched/ext/ext.c:10517:18: sparse: sparse: symbol 'scx_bpf_exit_bstr' was not declared. Should it be static?
   kernel/sched/ext/ext.c:10542:18: sparse: sparse: symbol 'scx_bpf_error_bstr' was not declared. Should it be static?
   kernel/sched/ext/ext.c:10569:18: sparse: sparse: symbol 'scx_bpf_dump_bstr' was not declared. Should it be static?
   kernel/sched/ext/ext.c:10624:17: sparse: sparse: symbol 'scx_bpf_cpuperf_cap' was not declared. Should it be static?
   kernel/sched/ext/ext.c:10644:17: sparse: sparse: symbol 'scx_bpf_cidperf_cap' was not declared. Should it be static?
   kernel/sched/ext/ext.c:10675:17: sparse: sparse: symbol 'scx_bpf_cpuperf_cur' was not declared. Should it be static?
   kernel/sched/ext/ext.c:10695:17: sparse: sparse: symbol 'scx_bpf_cidperf_cur' was not declared. Should it be static?
   kernel/sched/ext/ext.c:10782:18: sparse: sparse: symbol 'scx_bpf_cpuperf_set' was not declared. Should it be static?
   kernel/sched/ext/ext.c:10809:17: sparse: sparse: symbol 'scx_bpf_cidperf_set' was not declared. Should it be static?
   kernel/sched/ext/ext.c:10836:17: sparse: sparse: symbol 'scx_bpf_nr_node_ids' was not declared. Should it be static?
   kernel/sched/ext/ext.c:10846:17: sparse: sparse: symbol 'scx_bpf_nr_cpu_ids' was not declared. Should it be static?
   kernel/sched/ext/ext.c:10856:17: sparse: sparse: symbol 'scx_bpf_nr_cids' was not declared. Should it be static?
   kernel/sched/ext/ext.c:10871:17: sparse: sparse: symbol 'scx_bpf_nr_online_cids' was not declared. Should it be static?
   kernel/sched/ext/ext.c:10889:24: sparse: sparse: symbol 'scx_bpf_online_cmask' was not declared. Should it be static?
   kernel/sched/ext/ext.c:10913:17: sparse: sparse: symbol 'scx_bpf_this_cid' was not declared. Should it be static?
   kernel/sched/ext/ext.c:10928:34: sparse: sparse: symbol 'scx_bpf_get_possible_cpumask' was not declared. Should it be static?
   kernel/sched/ext/ext.c:10936:34: sparse: sparse: symbol 'scx_bpf_get_online_cpumask' was not declared. Should it be static?
   kernel/sched/ext/ext.c:10945:18: sparse: sparse: symbol 'scx_bpf_put_cpumask' was not declared. Should it be static?
   kernel/sched/ext/ext.c:10973:17: sparse: sparse: symbol 'scx_bpf_task_cpu' was not declared. Should it be static?
   kernel/sched/ext/ext.c:10986:17: sparse: sparse: symbol 'scx_bpf_task_cid' was not declared. Should it be static?
   kernel/sched/ext/ext.c:11006:23: sparse: sparse: symbol 'scx_bpf_locked_rq' was not declared. Should it be static?
   kernel/sched/ext/ext.c:11038:32: sparse: sparse: symbol 'scx_bpf_cpu_curr' was not declared. Should it be static?
   kernel/sched/ext/ext.c:11062:32: sparse: sparse: symbol 'scx_bpf_cid_curr' was not declared. Should it be static?
   kernel/sched/ext/ext.c:11087:32: sparse: sparse: symbol 'scx_bpf_tid_to_task' was not declared. Should it be static?
   kernel/sched/ext/ext.c:11155:17: sparse: sparse: symbol 'scx_bpf_now' was not declared. Should it be static?
   kernel/sched/ext/ext.c:11190:18: sparse: sparse: symbol 'scx_bpf_events' was not declared. Should it be static?
   kernel/sched/build_policy.c: note: in included file:
   kernel/sched/ext/cid.c:492:18: sparse: sparse: symbol 'scx_bpf_cid_override' was not declared. Should it be static?
   kernel/sched/ext/cid.c:656:17: sparse: sparse: symbol 'scx_bpf_cid_to_cpu' was not declared. Should it be static?
   kernel/sched/ext/cid.c:701:17: sparse: sparse: symbol 'scx_bpf_cpu_to_cid' was not declared. Should it be static?
   kernel/sched/ext/cid.c:975:18: sparse: sparse: symbol 'scx_bpf_cid_topo' was not declared. Should it be static?
   kernel/sched/build_policy.c: note: in included file:
   kernel/sched/ext/idle.c:1039:17: sparse: sparse: symbol 'scx_bpf_cpu_node' was not declared. Should it be static?
   kernel/sched/ext/idle.c:1122:1: sparse: sparse: symbol '__scx_bpf_select_cpu_and' was not declared. Should it be static?
   kernel/sched/ext/idle.c:1141:17: sparse: sparse: symbol 'scx_bpf_select_cpu_and' was not declared. Should it be static?
   kernel/sched/ext/idle.c:1184:34: sparse: sparse: symbol 'scx_bpf_get_idle_cpumask_node' was not declared. Should it be static?
   kernel/sched/ext/idle.c:1242:34: sparse: sparse: symbol 'scx_bpf_get_idle_smtmask_node' was not declared. Should it be static?
   kernel/sched/ext/idle.c:1361:17: sparse: sparse: symbol 'scx_bpf_pick_idle_cpu_node' was not declared. Should it be static?
   kernel/sched/ext/idle.c:1447:17: sparse: sparse: symbol 'scx_bpf_pick_any_cpu_node' was not declared. Should it be static?
   kernel/sched/build_policy.c: note: in included file:
   kernel/sched/ext/sub.c:2270:17: sparse: sparse: symbol 'scx_bpf_sub_grant' was not declared. Should it be static?
   kernel/sched/ext/sub.c:2390:18: sparse: sparse: symbol 'scx_bpf_sub_revoke' was not declared. Should it be static?
   kernel/sched/ext/sub.c:2484:17: sparse: sparse: symbol 'scx_bpf_sub_caps' was not declared. Should it be static?
   kernel/sched/ext/sub.c:2574:17: sparse: sparse: symbol 'scx_bpf_sub_kill_bstr' was not declared. Should it be static?
   kernel/sched/build_policy.c: note: in included file:
   kernel/sched/syscalls.c:1420:22: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct task_struct *curr @@     got struct task_struct [noderef] __rcu *donor @@
   kernel/sched/build_policy.c: note: in included file:
   kernel/sched/rt.c:1313:23: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/rt.c:1313:23: sparse:    struct task_struct *
   kernel/sched/rt.c:1313:23: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/build_policy.c: note: in included file:
   kernel/sched/sched.h:2498:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2498:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2498:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2498:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2498:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2498:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2509:26: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2509:26: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2509:26: sparse:    struct task_struct *

vim +1473 kernel/sched/ext/ext.c

  1462	
  1463	static void update_curr_scx(struct rq *rq)
  1464	{
  1465		struct task_struct *donor;
  1466		s64 delta_exec;
  1467	
  1468		/*
  1469		 * update_curr_scx() is selected through rq->donor->sched_class, not
  1470		 * rq->curr->sched_class, so @donor is always an EXT task here. If an EXT
  1471		 * owner executes for a FAIR donor, FAIR's update_curr() runs instead.
  1472		 */
> 1473		donor = rq->donor;
  1474	
  1475		/* apply even on 0 delta_exec, callers may still act on the slice */
  1476		apply_task_slice_oob(rq, donor);
  1477	
  1478		delta_exec = update_curr_common(rq);
  1479		if (unlikely(delta_exec <= 0))
  1480			return;
  1481	
  1482		if (donor->scx.slice != SCX_SLICE_INF)
  1483			donor->scx.slice -= min_t(u64, donor->scx.slice, delta_exec);
  1484	
  1485		if (unlikely(donor == scx_rescuee(rq)))
  1486			scx_rescue_charge(rq, delta_exec);
  1487	
  1488		dl_server_update(&rq->ext_server, delta_exec);
  1489	}
  1490	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
