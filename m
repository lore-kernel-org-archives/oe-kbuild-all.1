Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7E6A192D8B
	for <oe-kbuild-all@lists.linux.dev>; Mon, 13 Jan 2025 17:28:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736789330; cv=none; b=rlWc/JkbD9KCF3qxdvGD1xB75tOJmUyaOQd1Ejrect0ki1LoLBRPiHbChYAVhdQS0cpksyHEDnTCrf3xayWuNFAIWhszelq3CURKJ0oifGFnBSG9D6sxBtlFBevLtFWqY307ZmANVMV/M3qMvw9MeM4DEz9FyC1w1/5I6FyKDtA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736789330; c=relaxed/simple;
	bh=XBG4WJKVc4nvosToil7Q2Cbii3DY7b3J+PU85nR5Iks=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=SlByYqJfR/T20XQLPaKht838uKklqwVQ+v2cTj6HZKv7mPbz29hMtIEkq7H/sTEcZYX8SuaJb+MUG4Pqfv+xoYLdTEOb74p0RbO8aTqIwmNLGc0zAAOpGuG7HLO+r0X/oCHuICRV1s2BNjXdu9n5E+bXdPxlaURu8DIPyjwG1lg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=H3NQpxQG; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="H3NQpxQG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736789328; x=1768325328;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=XBG4WJKVc4nvosToil7Q2Cbii3DY7b3J+PU85nR5Iks=;
  b=H3NQpxQGUjiwONGH7CWT+oG3H+kdiZwAT1k2Q3Kug6h8JXIjMVXhWzdC
   QPOq4hYqB1pndCrGYZppn1Krak/bS3GXG1O7boIO1MQTX245UmTiMCBSc
   lgKotUs9ILZNNqZvk1VzivfoBnFCK5gSFup2BvPGNKWr+cPfQ4HGpeueY
   QjVVD1+//lP2M8FgPPFheBZkmXz2NbN9Vh2rx0iq7qlDF4VsdD3wm6GHO
   qYpuHSrg7gnKXQBHIhOweo3Mw2OxcxqsHmGD1GGC9q6DpIP0yk4DiBjmW
   WnOEFiGFTAQz6lJNMQwiM5A8M+cPATCz0qdcUr0bRrAeQCOmReREf8PB/
   A==;
X-CSE-ConnectionGUID: Pr8XZBeBQq2djlFgsOsu6Q==
X-CSE-MsgGUID: GoevNZiCSdirkUAqeHPj2A==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="40832079"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; 
   d="scan'208";a="40832079"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jan 2025 09:28:47 -0800
X-CSE-ConnectionGUID: sDsafA8ASbmXCsq1oYNu3A==
X-CSE-MsgGUID: kQdGwzHCSOWKKRHryPR/Ew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="105421152"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 13 Jan 2025 09:28:46 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tXOF1-000NTn-0u;
	Mon, 13 Jan 2025 17:28:43 +0000
Date: Tue, 14 Jan 2025 01:27:53 +0800
From: kernel test robot <lkp@intel.com>
To: Andrea Righi <arighi@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev, Tejun Heo <tj@kernel.org>
Subject: [linux-next:master 1004/8485] kernel/sched/ext.c:3243:24: sparse:
 sparse: Using plain integer as NULL pointer
Message-ID: <202501140146.oSvShYS0-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Andrea,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   37136bf5c3a6f6b686d74f41837a6406bec6b7bc
commit: 4572541892ea4e1dade2e9c1313d3f8069d37f0a [1004/8485] sched_ext: Use the NUMA scheduling domain for NUMA optimizations
config: powerpc64-randconfig-r131-20250113 (https://download.01.org/0day-ci/archive/20250114/202501140146.oSvShYS0-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce: (https://download.01.org/0day-ci/archive/20250114/202501140146.oSvShYS0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501140146.oSvShYS0-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   kernel/sched/rt.c:1550:15: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct task_struct *donor @@     got struct task_struct [noderef] __rcu * @@
   kernel/sched/rt.c:1550:15: sparse:     expected struct task_struct *donor
   kernel/sched/rt.c:1550:15: sparse:     got struct task_struct [noderef] __rcu *
   kernel/sched/rt.c:1611:45: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *donor @@
   kernel/sched/rt.c:1611:45: sparse:     expected struct task_struct *p
   kernel/sched/rt.c:1611:45: sparse:     got struct task_struct [noderef] __rcu *donor
   kernel/sched/rt.c:1654:39: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *donor @@     got struct task_struct [noderef] __rcu *donor @@
   kernel/sched/rt.c:1654:39: sparse:     expected struct task_struct *donor
   kernel/sched/rt.c:1654:39: sparse:     got struct task_struct [noderef] __rcu *donor
   kernel/sched/rt.c:1674:64: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *tsk @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/rt.c:1674:64: sparse:     expected struct task_struct *tsk
   kernel/sched/rt.c:1674:64: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/rt.c:2018:40: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *task @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/rt.c:2018:40: sparse:     expected struct task_struct *task
   kernel/sched/rt.c:2018:40: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/rt.c:2041:13: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/rt.c:2041:13: sparse:    struct task_struct *
   kernel/sched/rt.c:2041:13: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/rt.c:2387:54: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *tsk @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/rt.c:2387:54: sparse:     expected struct task_struct *tsk
   kernel/sched/rt.c:2387:54: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/rt.c:2389:40: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *donor @@
   kernel/sched/rt.c:2389:40: sparse:     expected struct task_struct *p
   kernel/sched/rt.c:2389:40: sparse:     got struct task_struct [noderef] __rcu *donor
   kernel/sched/rt.c:2389:62: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *donor @@
   kernel/sched/rt.c:2389:62: sparse:     expected struct task_struct *p
   kernel/sched/rt.c:2389:62: sparse:     got struct task_struct [noderef] __rcu *donor
   kernel/sched/build_policy.c: note: in included file:
   kernel/sched/deadline.c:2703:23: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *donor @@
   kernel/sched/deadline.c:2703:23: sparse:     expected struct task_struct *p
   kernel/sched/deadline.c:2703:23: sparse:     got struct task_struct [noderef] __rcu *donor
   kernel/sched/deadline.c:2713:13: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/deadline.c:2713:13: sparse:    struct task_struct *
   kernel/sched/deadline.c:2713:13: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/deadline.c:2819:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/deadline.c:2819:25: sparse:    struct task_struct *
   kernel/sched/deadline.c:2819:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/deadline.c:2342:42: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct sched_dl_entity const *b @@     got struct sched_dl_entity [noderef] __rcu * @@
   kernel/sched/deadline.c:2342:42: sparse:     expected struct sched_dl_entity const *b
   kernel/sched/deadline.c:2342:42: sparse:     got struct sched_dl_entity [noderef] __rcu *
   kernel/sched/deadline.c:2353:38: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *tsk @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/deadline.c:2353:38: sparse:     expected struct task_struct *tsk
   kernel/sched/deadline.c:2353:38: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/deadline.c:1242:39: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/deadline.c:1242:39: sparse:     expected struct task_struct *p
   kernel/sched/deadline.c:1242:39: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/deadline.c:1242:85: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct sched_dl_entity const *b @@     got struct sched_dl_entity [noderef] __rcu * @@
   kernel/sched/deadline.c:1242:85: sparse:     expected struct sched_dl_entity const *b
   kernel/sched/deadline.c:1242:85: sparse:     got struct sched_dl_entity [noderef] __rcu *
   kernel/sched/deadline.c:1342:23: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *donor @@
   kernel/sched/deadline.c:1342:23: sparse:     expected struct task_struct *p
   kernel/sched/deadline.c:1342:23: sparse:     got struct task_struct [noderef] __rcu *donor
   kernel/sched/deadline.c:1651:31: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/deadline.c:1651:31: sparse:     expected struct task_struct *p
   kernel/sched/deadline.c:1651:31: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/deadline.c:1651:70: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct sched_dl_entity const *b @@     got struct sched_dl_entity [noderef] __rcu * @@
   kernel/sched/deadline.c:1651:70: sparse:     expected struct sched_dl_entity const *b
   kernel/sched/deadline.c:1651:70: sparse:     got struct sched_dl_entity [noderef] __rcu *
   kernel/sched/deadline.c:1739:39: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *donor @@     got struct task_struct [noderef] __rcu *donor @@
   kernel/sched/deadline.c:1739:39: sparse:     expected struct task_struct *donor
   kernel/sched/deadline.c:1739:39: sparse:     got struct task_struct [noderef] __rcu *donor
   kernel/sched/deadline.c:2564:9: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] sd @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/deadline.c:2564:9: sparse:     expected struct sched_domain *[assigned] sd
   kernel/sched/deadline.c:2564:9: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/deadline.c:2226:14: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct task_struct *curr @@     got struct task_struct [noderef] __rcu * @@
   kernel/sched/deadline.c:2226:14: sparse:     expected struct task_struct *curr
   kernel/sched/deadline.c:2226:14: sparse:     got struct task_struct [noderef] __rcu *
   kernel/sched/deadline.c:2227:15: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct task_struct *donor @@     got struct task_struct [noderef] __rcu * @@
   kernel/sched/deadline.c:2227:15: sparse:     expected struct task_struct *donor
   kernel/sched/deadline.c:2227:15: sparse:     got struct task_struct [noderef] __rcu *
   kernel/sched/deadline.c:2303:43: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *donor @@
   kernel/sched/deadline.c:2303:43: sparse:     expected struct task_struct *p
   kernel/sched/deadline.c:2303:43: sparse:     got struct task_struct [noderef] __rcu *donor
   kernel/sched/deadline.c:2864:38: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *tsk @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/deadline.c:2864:38: sparse:     expected struct task_struct *tsk
   kernel/sched/deadline.c:2864:38: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/deadline.c:2866:23: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *donor @@
   kernel/sched/deadline.c:2866:23: sparse:     expected struct task_struct *p
   kernel/sched/deadline.c:2866:23: sparse:     got struct task_struct [noderef] __rcu *donor
   kernel/sched/deadline.c:2868:44: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct sched_dl_entity const *b @@     got struct sched_dl_entity [noderef] __rcu * @@
   kernel/sched/deadline.c:2868:44: sparse:     expected struct sched_dl_entity const *b
   kernel/sched/deadline.c:2868:44: sparse:     got struct sched_dl_entity [noderef] __rcu *
   kernel/sched/deadline.c:3043:23: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/deadline.c:3043:23: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/deadline.c:3043:23: sparse:    struct task_struct *
   kernel/sched/deadline.c:3092:32: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/build_policy.c: note: in included file:
   kernel/sched/ext.c:1653:38: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *curr @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/ext.c:1785:56: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/ext.c:1785:56: sparse:    struct task_struct *
   kernel/sched/ext.c:1785:56: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/ext.c:2226:35: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/ext.c:2226:35: sparse:     expected struct task_struct *p
   kernel/sched/ext.c:2226:35: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/ext.c:2236:38: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *from @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/ext.c:2236:38: sparse:     expected struct task_struct *from
   kernel/sched/ext.c:2236:38: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/ext.c:3066:38: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *prev @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/ext.c:3066:38: sparse:     expected struct task_struct *prev
   kernel/sched/ext.c:3066:38: sparse:     got struct task_struct [noderef] __rcu *curr
>> kernel/sched/ext.c:3243:24: sparse: sparse: Using plain integer as NULL pointer
   kernel/sched/ext.c:5352:52: sparse: sparse: incorrect type in argument 3 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/ext.c:5352:52: sparse:     expected struct task_struct *p
   kernel/sched/ext.c:5352:52: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/ext.c:6076:32: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct const *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/ext.c:6076:32: sparse:     expected struct task_struct const *p
   kernel/sched/ext.c:6076:32: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/ext.c:7552:33: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/ext.c:7552:33: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/ext.c:7552:33: sparse:    struct task_struct const *
   kernel/sched/build_policy.c: note: in included file:
   kernel/sched/syscalls.c:206:22: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/syscalls.c:206:22: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/syscalls.c:206:22: sparse:    struct task_struct *
   kernel/sched/build_policy.c: note: in included file (through include/linux/smp.h, include/linux/sched/clock.h):
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   kernel/sched/build_policy.c: note: in included file:
   kernel/sched/sched.h:2249:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2249:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2249:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2249:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2249:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2249:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2249:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2249:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2249:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2249:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2249:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2249:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2260:26: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2260:26: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2260:26: sparse:    struct task_struct *
   kernel/sched/sched.h:2260:26: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2260:26: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2260:26: sparse:    struct task_struct *
   kernel/sched/sched.h:2260:26: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2260:26: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2260:26: sparse:    struct task_struct *
   kernel/sched/sched.h:2249:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2249:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2249:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2260:26: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2260:26: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2260:26: sparse:    struct task_struct *
   kernel/sched/sched.h:2249:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2249:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2249:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2249:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2249:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2249:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2260:26: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2260:26: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2260:26: sparse:    struct task_struct *
   kernel/sched/sched.h:2249:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2249:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2249:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2249:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2249:25: sparse:    struct task_struct [noderef] __rcu *

vim +3243 kernel/sched/ext.c

  3232	
  3233	/*
  3234	 * Return the cpumask representing the LLC domain of @cpu (or NULL if the LLC
  3235	 * domain is not defined).
  3236	 */
  3237	static struct cpumask *llc_span(s32 cpu)
  3238	{
  3239		struct sched_domain *sd;
  3240	
  3241		sd = rcu_dereference(per_cpu(sd_llc, cpu));
  3242		if (!sd)
> 3243			return 0;
  3244	
  3245		return sched_domain_span(sd);
  3246	}
  3247	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
