Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2EEF3CB911
	for <oe-kbuild-all@lists.linux.dev>; Thu,  8 Oct 2026 06:52:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791442352; cv=none; b=YcjFSTEui4tnnqLed+nt81MNOiQweQcC407AjL8Q6O4KiYEeSIt2CgRb1afiXl+1fNfhJiILhztpDaJjtvbhjH63JvuFNsfyUmWa+UbgQy37GyY8cBFNgmbvs6do7gxGN/Wff/G5DzR3I176ZmL3pXVpKSchk7suFURqH1iGrXI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791442352; c=relaxed/simple;
	bh=1nAxsojND6HConPa+2EK0A5GYgWUBNA9D/ITQ5pxlQQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=vAX4lO9y0g+Dk+QwcPZSknPWkqOwG9gR2dt6TDaEWRtTulzD7wijtX7XX40w7FLpEnvrXUj3DQXtA59kQItEkqQIo8PuBIDFPOsMvhgopu+O/F6APPmdsYpfm32Uig8WwoiIjlG2wi15jj7ciIhS3rmGXMpMd/pDcid6LkPS4pI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BdnmCuQ6; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BdnmCuQ6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791442350; x=1822978350;
  h=date:from:to:cc:subject:message-id;
  bh=1nAxsojND6HConPa+2EK0A5GYgWUBNA9D/ITQ5pxlQQ=;
  b=BdnmCuQ688c71nDcXQkhuFJVdnRlXLOQHCgnI6ZhcZqazWbX5BIyF3iQ
   9+VFfA/ESroaPfu5CA+ZwnxTiCKhvg34EfvxFzVF4C2yMxAb4sTy5juQR
   w3coW3deGfQ9ovk9Q7bqG1hu8QbHtEq242bCy5AT554O5zjST1zo0zvG/
   Kd/QcTahz1QyESYUNrpSdLZeRhB+NUk7XoBIaqzCy8SKpYgKCcfGT7NkW
   dtF+5xrAwhuj6SL9CPIi+RbRkLRPdltCsTIls3aLNPT7DPKTN3VkQqVHT
   4inbADEd05CWMPgflN6YRHPlAM8ApUxlWBqD4egVRDuA/PF79aIYOBPFy
   Q==;
X-CSE-ConnectionGUID: hUR/oo5ZQd6P9Nid3TbR7A==
X-CSE-MsgGUID: /oZrInUkSemoQ7DpG31r7g==
X-IronPort-AV: E=McAfee;i="6800,10657,11928"; a="225504"
X-IronPort-AV: E=Sophos;i="6.27,145,1787036400"; 
   d="scan'208";a="225504"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Oct 2026 23:52:30 -0700
X-CSE-ConnectionGUID: tmuvqQSpQeSxq1XnqNUj5g==
X-CSE-MsgGUID: 0/HhnLtnTLCq86XYuTOF7A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,145,1787036400"; 
   d="scan'208";a="271267"
Received: from igk-lkp-server01.igk.intel.com (HELO d0de6c2a75a7) ([10.211.93.152])
  by fmviesa008.fm.intel.com with ESMTP; 07 Oct 2026 23:52:29 -0700
Received: from kbuild by d0de6c2a75a7 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xEhzN-000000004yl-3qUP;
	Thu, 08 Oct 2026 06:52:25 +0000
Date: Thu, 08 Oct 2026 08:52:15 +0200
From: kernel test robot <lkp@intel.com>
To: Andrea Righi <arighi@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev, Tejun Heo <tj@kernel.org>
Subject: [tj-sched-ext:sub-child-ecaps 6/29]
 kernel/sched/ext/ext.c:3206:39: sparse: sparse: incorrect type in initializer
 (different address spaces)
Message-ID: <202610080812.3jEiUqhi-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tj/sched_ext.git sub-child-ecaps
head:   a7f032d8f4aa889c3e6d9d232ab4b2fdcf97dc93
commit: 5f882051efabaf19f9b4dbe4b50cee1d250ac19e [6/29] sched_ext: Fix ops.running/stopping() pairing for proxy-exec donors
config: sparc-randconfig-r2300-20261006 (https://download.01.org/0day-ci/archive/20261008/202610080812.3jEiUqhi-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 8.5.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261008/202610080812.3jEiUqhi-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610080812.3jEiUqhi-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
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
   kernel/sched/ext/ext.c:442:46: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *curr @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/ext/ext.c:1456:38: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *curr @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/ext/ext.c:1658:73: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/ext/ext.c:1658:73: sparse:    struct task_struct *
   kernel/sched/ext/ext.c:1658:73: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/ext/ext.c:2424:35: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *donor @@
   kernel/sched/ext/ext.c:2438:38: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *from @@     got struct task_struct [noderef] __rcu *donor @@
>> kernel/sched/ext/ext.c:3206:39: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *donor @@     got struct task_struct [noderef] __rcu *donor @@
   kernel/sched/ext/ext.c:3517:38: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *prev @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/ext/ext.c:4683:48: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/ext/ext.c:4684:38: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/ext/ext.c:7165:57: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct task_struct const *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/ext/ext.c:7166:51: sparse: sparse: incorrect type in argument 5 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/ext/ext.c:8710:32: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct const *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/ext/ext.c:8756:44: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/ext/ext.c:9119:18: sparse: sparse: symbol 'scx_bpf_dsq_insert___v2' was not declared. Should it be static?
   kernel/sched/ext/ext.c:9141:18: sparse: sparse: symbol 'scx_bpf_dsq_insert' was not declared. Should it be static?
   kernel/sched/ext/ext.c:9201:1: sparse: sparse: symbol '__scx_bpf_dsq_insert_vtime' was not declared. Should it be static?
   kernel/sched/ext/ext.c:9220:18: sparse: sparse: symbol 'scx_bpf_dsq_insert_vtime' was not declared. Should it be static?
   kernel/sched/ext/ext.c:9381:17: sparse: sparse: symbol 'scx_bpf_dispatch_nr_slots' was not declared. Should it be static?
   kernel/sched/ext/ext.c:9401:18: sparse: sparse: symbol 'scx_bpf_dispatch_cancel' was not declared. Should it be static?
   kernel/sched/ext/ext.c:9445:18: sparse: sparse: symbol 'scx_bpf_dsq_move_to_local___v2' was not declared. Should it be static?
   kernel/sched/ext/ext.c:9488:18: sparse: sparse: symbol 'scx_bpf_dsq_move_to_local' was not declared. Should it be static?
   kernel/sched/ext/ext.c:9502:18: sparse: sparse: symbol 'scx_bpf_dsq_move_set_slice' was not declared. Should it be static?
   kernel/sched/ext/ext.c:9521:18: sparse: sparse: symbol 'scx_bpf_dsq_move_set_vtime' was not declared. Should it be static?
   kernel/sched/ext/ext.c:9555:18: sparse: sparse: symbol 'scx_bpf_dsq_move' was not declared. Should it be static?
   kernel/sched/ext/ext.c:9580:18: sparse: sparse: symbol 'scx_bpf_dsq_move_vtime' was not declared. Should it be static?
   kernel/sched/ext/ext.c:9621:17: sparse: sparse: symbol 'scx_bpf_reenqueue_local' was not declared. Should it be static?
   kernel/sched/ext/ext.c:9660:17: sparse: sparse: symbol 'scx_bpf_create_dsq' was not declared. Should it be static?
   kernel/sched/ext/ext.c:9747:18: sparse: sparse: symbol 'scx_bpf_task_set_slice' was not declared. Should it be static?
   kernel/sched/ext/ext.c:9801:18: sparse: sparse: symbol 'scx_bpf_task_set_dsq_vtime' was not declared. Should it be static?
   kernel/sched/ext/ext.c:9933:18: sparse: sparse: symbol 'scx_bpf_kick_cpu' was not declared. Should it be static?
   kernel/sched/ext/ext.c:9956:18: sparse: sparse: symbol 'scx_bpf_kick_cid' was not declared. Should it be static?
   kernel/sched/ext/ext.c:9983:17: sparse: sparse: symbol 'scx_bpf_dsq_nr_queued' was not declared. Should it be static?
   kernel/sched/ext/ext.c:10030:18: sparse: sparse: symbol 'scx_bpf_destroy_dsq' was not declared. Should it be static?
   kernel/sched/ext/ext.c:10056:17: sparse: sparse: symbol 'bpf_iter_scx_dsq_new' was not declared. Should it be static?
   kernel/sched/ext/ext.c:10100:32: sparse: sparse: symbol 'bpf_iter_scx_dsq_next' was not declared. Should it be static?
   kernel/sched/ext/ext.c:10118:18: sparse: sparse: symbol 'bpf_iter_scx_dsq_destroy' was not declared. Should it be static?
   kernel/sched/ext/ext.c:10147:32: sparse: sparse: symbol 'scx_bpf_dsq_peek' was not declared. Should it be static?
   kernel/sched/ext/ext.c:10190:18: sparse: sparse: symbol 'scx_bpf_dsq_reenq' was not declared. Should it be static?
   kernel/sched/ext/ext.c:10230:18: sparse: sparse: symbol 'scx_bpf_reenqueue_local___v2' was not declared. Should it be static?
   kernel/sched/ext/ext.c:10323:18: sparse: sparse: symbol 'scx_bpf_exit_bstr' was not declared. Should it be static?
   kernel/sched/ext/ext.c:10348:18: sparse: sparse: symbol 'scx_bpf_error_bstr' was not declared. Should it be static?
   kernel/sched/ext/ext.c:10375:18: sparse: sparse: symbol 'scx_bpf_dump_bstr' was not declared. Should it be static?
   kernel/sched/ext/ext.c:10430:17: sparse: sparse: symbol 'scx_bpf_cpuperf_cap' was not declared. Should it be static?
   kernel/sched/ext/ext.c:10450:17: sparse: sparse: symbol 'scx_bpf_cidperf_cap' was not declared. Should it be static?
   kernel/sched/ext/ext.c:10481:17: sparse: sparse: symbol 'scx_bpf_cpuperf_cur' was not declared. Should it be static?
   kernel/sched/ext/ext.c:10501:17: sparse: sparse: symbol 'scx_bpf_cidperf_cur' was not declared. Should it be static?
   kernel/sched/ext/ext.c:10588:18: sparse: sparse: symbol 'scx_bpf_cpuperf_set' was not declared. Should it be static?
   kernel/sched/ext/ext.c:10615:17: sparse: sparse: symbol 'scx_bpf_cidperf_set' was not declared. Should it be static?
   kernel/sched/ext/ext.c:10642:17: sparse: sparse: symbol 'scx_bpf_nr_node_ids' was not declared. Should it be static?
   kernel/sched/ext/ext.c:10652:17: sparse: sparse: symbol 'scx_bpf_nr_cpu_ids' was not declared. Should it be static?
   kernel/sched/ext/ext.c:10662:17: sparse: sparse: symbol 'scx_bpf_nr_cids' was not declared. Should it be static?
   kernel/sched/ext/ext.c:10677:17: sparse: sparse: symbol 'scx_bpf_nr_online_cids' was not declared. Should it be static?
   kernel/sched/ext/ext.c:10695:24: sparse: sparse: symbol 'scx_bpf_online_cmask' was not declared. Should it be static?
   kernel/sched/ext/ext.c:10719:17: sparse: sparse: symbol 'scx_bpf_this_cid' was not declared. Should it be static?
   kernel/sched/ext/ext.c:10734:34: sparse: sparse: symbol 'scx_bpf_get_possible_cpumask' was not declared. Should it be static?
   kernel/sched/ext/ext.c:10742:34: sparse: sparse: symbol 'scx_bpf_get_online_cpumask' was not declared. Should it be static?
   kernel/sched/ext/ext.c:10751:18: sparse: sparse: symbol 'scx_bpf_put_cpumask' was not declared. Should it be static?
   kernel/sched/ext/ext.c:10767:33: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/ext/ext.c:10767:33: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/ext/ext.c:10767:33: sparse:    struct task_struct const *
   kernel/sched/ext/ext.c:10774:17: sparse: sparse: symbol 'scx_bpf_task_cpu' was not declared. Should it be static?
   kernel/sched/ext/ext.c:10787:17: sparse: sparse: symbol 'scx_bpf_task_cid' was not declared. Should it be static?
   kernel/sched/ext/ext.c:10807:23: sparse: sparse: symbol 'scx_bpf_locked_rq' was not declared. Should it be static?
   kernel/sched/ext/ext.c:10834:32: sparse: sparse: symbol 'scx_bpf_cpu_curr' was not declared. Should it be static?
   kernel/sched/ext/ext.c:10858:32: sparse: sparse: symbol 'scx_bpf_cid_curr' was not declared. Should it be static?
   kernel/sched/ext/ext.c:10883:32: sparse: sparse: symbol 'scx_bpf_tid_to_task' was not declared. Should it be static?
   kernel/sched/ext/ext.c:10951:17: sparse: sparse: symbol 'scx_bpf_now' was not declared. Should it be static?
   kernel/sched/ext/ext.c:10986:18: sparse: sparse: symbol 'scx_bpf_events' was not declared. Should it be static?
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
   kernel/sched/ext/sub.c:288:16: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct const *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/ext/sub.c:288:16: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct const *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/ext/sub.c:288:16: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct const *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/ext/sub.c:2313:17: sparse: sparse: symbol 'scx_bpf_sub_grant' was not declared. Should it be static?
   kernel/sched/ext/sub.c:2433:18: sparse: sparse: symbol 'scx_bpf_sub_revoke' was not declared. Should it be static?
   kernel/sched/ext/sub.c:2527:17: sparse: sparse: symbol 'scx_bpf_sub_caps' was not declared. Should it be static?
   kernel/sched/ext/sub.c:2617:17: sparse: sparse: symbol 'scx_bpf_sub_kill_bstr' was not declared. Should it be static?
   kernel/sched/build_policy.c: note: in included file:
   kernel/sched/syscalls.c:1420:22: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct task_struct *curr @@     got struct task_struct [noderef] __rcu *donor @@
   kernel/sched/build_policy.c: note: in included file:
   kernel/sched/rt.c:1313:23: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/rt.c:1313:23: sparse:    struct task_struct *
   kernel/sched/rt.c:1313:23: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/build_policy.c: note: in included file:

vim +3206 kernel/sched/ext/ext.c

  3203	
  3204	void scx_proxy_donor_start(struct rq *rq)
  3205	{
> 3206		struct task_struct *donor = rq->donor;
  3207	
  3208		lockdep_assert_rq_held(rq);
  3209	
  3210		if (donor->sched_class == &ext_sched_class && (donor->scx.flags & SCX_TASK_QUEUED))
  3211			scx_start_task_running(rq, donor);
  3212	}
  3213	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
