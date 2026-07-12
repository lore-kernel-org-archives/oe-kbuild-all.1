Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85A813358B9
	for <oe-kbuild-all@lists.linux.dev>; Sun, 12 Jul 2026 01:58:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783821506; cv=none; b=iXGnYOtX3ElwgiZMOMWvWWO7ac8PNHb0Ach9MRCRKo5U9WK01XHnG9oV9Mcohe21Qdm9xeHNj6+K5NHtnOALRnuU/j+TqtdMLj8jCdkohz+Hn+v7KhNaiqXHezEFMMzediwBthcyB+P3I+tnKQ/5XY+Sa5z3J4A1XHx5i/SvWy8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783821506; c=relaxed/simple;
	bh=2Zik3AfUH2MJYO8pDM92V/OPfhWQ6Qy37KtAmoa2buY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=taZh0WXuFP86uptnXisZisuenMO6quXeMJJGMlY1m/uhn6CcSbQyKzLc7+ym3U1HNoBAjeUVP+PqxajBTBl1dKsPmKwhMqluMghOfp5UDp7B5HNocKTTD3I4GqAF+WkQjw6cL4u8WhapLGbjeGdPYjZn3ILSM1evT9/0UqjjXuk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SKoR/s+x; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SKoR/s+x"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783821504; x=1815357504;
  h=date:from:to:cc:subject:message-id;
  bh=2Zik3AfUH2MJYO8pDM92V/OPfhWQ6Qy37KtAmoa2buY=;
  b=SKoR/s+x74IDxv3czBJjIgyJ3TLzT6MXKE4TajCBydC+jN5mDNTCOQ1Y
   4YN0TKko7aKC15Fq9trkhGEnwzoLKizCTREDHNTmPvGbXW39woNlI78zy
   gIqDFhXc2Dd1vIowFs3nzKgqhQ0X2T6In/QZfjT/SYA9+0+UPq2U15oSF
   mMIwSAvhKY2wW76yZkb49NKSfuDEjYUwFyaGiHhXCjK6M0x77IDGLwA7S
   fTzEQETLepxQoxepNZbyRQIPOCtBCO/CzfqBUDlc4rffo1/d1KAJKeenw
   EW+ORtBxcgHSQ1S3jiyrSaSzP/WEnKg0G7vQIXPCDsZzSgRIFVGGyYpWs
   A==;
X-CSE-ConnectionGUID: AD/1BkuZQJyqtDeQ3K1Cpw==
X-CSE-MsgGUID: dQrD+UZqRhOlyOTqm5+mpg==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="95123512"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="95123512"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jul 2026 18:58:23 -0700
X-CSE-ConnectionGUID: ta/Ey6PeRtGzJiRsYxmoKQ==
X-CSE-MsgGUID: UViHdeX7TDalUYAigg3tRw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="254092315"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa010.jf.intel.com with ESMTP; 11 Jul 2026 18:58:22 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wijSV-00000000Kaa-3PP5;
	Sun, 12 Jul 2026 01:58:19 +0000
Date: Sun, 12 Jul 2026 09:58:18 +0800
From: kernel test robot <lkp@intel.com>
To: Tejun Heo <tj@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [tj-sched-ext:scx-sub-caps-v5 44/61]
 kernel/sched/ext/sub.c:433:9: sparse: sparse: incorrect type in argument 2
 (different address spaces)
Message-ID: <202607120904.hnv0giJi-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tj/sched_ext.git scx-sub-caps-v5
head:   c51c3642e76ea3b627413ecb76f893f1289cf4ae
commit: cf1ccf1e23d0fa2f8f5a4a23a3f2a70a1c7e6f74 [44/61] sched_ext: Add sub_ecaps_updated() effective-cap change notifier
config: arm64-randconfig-r132-20260711 (https://download.01.org/0day-ci/archive/20260712/202607120904.hnv0giJi-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 10.5.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260712/202607120904.hnv0giJi-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607120904.hnv0giJi-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   kernel/sched/ext/ext.c:2603:33: sparse:     got struct scx_sched [noderef] __rcu *[addressable] [toplevel] scx_root
   kernel/sched/ext/ext.c:2755:33: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct scx_sched *sch @@     got struct scx_sched [noderef] __rcu *[addressable] [toplevel] scx_root @@
   kernel/sched/ext/ext.c:2755:33: sparse:     expected struct scx_sched *sch
   kernel/sched/ext/ext.c:2755:33: sparse:     got struct scx_sched [noderef] __rcu *[addressable] [toplevel] scx_root
   kernel/sched/ext/ext.c:2902:38: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *prev @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/ext/ext.c:2902:38: sparse:     expected struct task_struct *prev
   kernel/sched/ext/ext.c:2902:38: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/ext/ext.c:3133:33: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct scx_sched *sch @@     got struct scx_sched [noderef] __rcu *[addressable] [toplevel] scx_root @@
   kernel/sched/ext/ext.c:3133:33: sparse:     expected struct scx_sched *sch
   kernel/sched/ext/ext.c:3133:33: sparse:     got struct scx_sched [noderef] __rcu *[addressable] [toplevel] scx_root
   kernel/sched/ext/ext.c:3550:62: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct scx_sched *sch @@     got struct scx_sched [noderef] __rcu *scx_sched @@
   kernel/sched/ext/ext.c:3550:62: sparse:     expected struct scx_sched *sch
   kernel/sched/ext/ext.c:3550:62: sparse:     got struct scx_sched [noderef] __rcu *scx_sched
   kernel/sched/ext/ext.c:6174:57: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct task_struct const *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/ext/ext.c:6174:57: sparse:     expected struct task_struct const *p
   kernel/sched/ext/ext.c:6174:57: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/ext/ext.c:6175:51: sparse: sparse: incorrect type in argument 5 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/ext/ext.c:6175:51: sparse:     expected struct task_struct *p
   kernel/sched/ext/ext.c:6175:51: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/ext/ext.c:7670:32: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct const *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/ext/ext.c:7670:32: sparse:     expected struct task_struct const *p
   kernel/sched/ext/ext.c:7670:32: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/ext/ext.c:9026:18: sparse: sparse: symbol 'scx_bpf_reenqueue_local___v2' was not declared. Should it be static?
   kernel/sched/ext/ext.c:9471:33: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/ext/ext.c:9471:33: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/ext/ext.c:9471:33: sparse:    struct task_struct const *
   kernel/sched/build_policy.c: note: in included file:
   kernel/sched/build_policy.c: note: in included file:
   kernel/sched/ext/idle.c:751:33: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct scx_sched *sch @@     got struct scx_sched [noderef] __rcu *[addressable] [assigned] [toplevel] scx_root @@
   kernel/sched/ext/idle.c:771:49: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct const *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/build_policy.c: note: in included file:
   kernel/sched/ext/sub.c:336:30: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct scx_sched *sch @@     got struct scx_sched [noderef] __rcu *[addressable] [assigned] [toplevel] scx_root @@
>> kernel/sched/ext/sub.c:433:9: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct scx_sched *root @@     got struct scx_sched [noderef] __rcu *[addressable] [assigned] [toplevel] scx_root @@
>> kernel/sched/ext/sub.c:437:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/ext/sub.c:437:25: sparse:    struct scx_sched *
   kernel/sched/ext/sub.c:437:25: sparse:    struct scx_sched [noderef] __rcu *
   kernel/sched/ext/sub.c:461:9: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct scx_sched *root @@     got struct scx_sched [noderef] __rcu *[addressable] [assigned] [toplevel] scx_root @@
   kernel/sched/ext/sub.c:463:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/ext/sub.c:463:25: sparse:    struct scx_sched *
   kernel/sched/ext/sub.c:463:25: sparse:    struct scx_sched [noderef] __rcu *
   kernel/sched/ext/sub.c:733:40: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct scx_sched *parent @@     got struct scx_sched [noderef] __rcu *scx_sched @@
   kernel/sched/ext/sub.c:1080:25: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct scx_sched *sch @@     got struct scx_sched [noderef] __rcu *scx_sched @@
   kernel/sched/build_policy.c: note: in included file:
   kernel/sched/syscalls.c:1418:22: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct task_struct *curr @@     got struct task_struct [noderef] __rcu *donor @@
   kernel/sched/build_policy.c: note: in included file:
   kernel/sched/rt.c:1313:23: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/rt.c:1313:23: sparse:    struct task_struct *
   kernel/sched/rt.c:1313:23: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/build_policy.c: note: in included file:
   kernel/sched/sched.h:2453:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2453:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2453:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2453:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2453:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2453:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2464:26: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2464:26: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2464:26: sparse:    struct task_struct *
   kernel/sched/sched.h:2453:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2453:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2453:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2464:26: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2464:26: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2464:26: sparse:    struct task_struct *
   kernel/sched/sched.h:1425:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:1425:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:1425:25: sparse:    struct task_struct *
   kernel/sched/build_policy.c: note: in included file:
   kernel/sched/deadline.c:2339:15: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/deadline.c:2339:15: sparse:    struct task_struct *
   kernel/sched/deadline.c:2339:15: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/build_policy.c: note: in included file:
   kernel/sched/sched.h:2453:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2453:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2453:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2453:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2453:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2453:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2464:26: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2464:26: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2464:26: sparse:    struct task_struct *
   kernel/sched/sched.h:2464:26: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2464:26: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2464:26: sparse:    struct task_struct *
   kernel/sched/sched.h:2453:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2453:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2453:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2453:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2453:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2453:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2453:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2453:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2453:25: sparse:    struct task_struct *
   kernel/sched/sched.h:1425:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:1425:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:1425:25: sparse:    struct task_struct *
   kernel/sched/build_policy.c: note: in included file:
   kernel/sched/syscalls.c:1343:11: sparse: sparse: dereference of noderef expression
   kernel/sched/build_policy.c: note: in included file:
   kernel/sched/rt.c:1676:15: sparse: sparse: dereference of noderef expression

vim +433 kernel/sched/ext/sub.c

   419	
   420	/*
   421	 * A cpu came back. Re-seed each sub-sched's ecaps on the cpu's cid. The sync
   422	 * recomputes effective caps from the pshard and fires ops.sub_ecaps_updated()
   423	 * only on a real change since offline.
   424	 */
   425	void scx_online_ecaps(struct rq *rq)
   426	{
   427		s32 cid = __scx_cpu_to_cid(cpu_of(rq));
   428		s32 shard = scx_cid_to_shard[cid];
   429		struct scx_sched *pos;
   430	
   431		guard(rq_lock_irqsave)(rq);
   432	
 > 433		scx_for_each_descendant_pre(pos, scx_root) {
   434			struct scx_pshard *ps;
   435	
   436			/* root holds every cap and never uses ecaps */
 > 437			if (pos == scx_root)
   438				continue;
   439	
   440			ps = pos->pshard[shard];
   441			guard(raw_spinlock)(&ps->lock);
   442			queue_sync_ecaps(pos, cid);
   443		}
   444	}
   445	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
