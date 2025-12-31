Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F1B62AE99
	for <oe-kbuild-all@lists.linux.dev>; Wed, 31 Dec 2025 22:37:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767220642; cv=none; b=S7rxZtuGb0LJ2nW2Ktl7sYqLZP1mZjeEEXvDfU+ZquXVm86giHy26T6fectnFvrt3u61ei/ItGq3jKRoo0kZq+OxjuZ+KKxa87wRrbTjapkxZEOj2pRHWiNd1ipAtc7Ffwlys0uZfMvH/ZuNlYR5LR3DPGn5joAVeOxZdv3Chbs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767220642; c=relaxed/simple;
	bh=exzofYunmE5ySnQD6Plejn7hElr1m/0GcgQBZ75AN/Y=;
	h=Date:From:To:Cc:Subject:Message-ID; b=trDu0BX9jOu6GsLcVHm0b9QIOpsjPP63YAym98ya8l+tRsMNyf1Nq71n7z3DaSh1doPREm/aZyMNZe+EMRrRnQGGs5vHpjFuXDP/LnF7jhO/dMR6stmSQ0Abl9dlgvS/xJgK5Ff9Sye6jku2BYSYP2H8agPHNKekXFWKvZIVfv8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=X+AvX34L; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="X+AvX34L"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767220640; x=1798756640;
  h=date:from:to:cc:subject:message-id;
  bh=exzofYunmE5ySnQD6Plejn7hElr1m/0GcgQBZ75AN/Y=;
  b=X+AvX34LPPHgCk8pknvme0bOk+cTpSvolXSCpSktsYelV5RNcBbGYBur
   WakKbmmKKcBhD4GBUSlO6ptx7g1F2vU3N+7PevJ/pewf0arnuILYadKd4
   FrSAMqfLX8NlyWICkJU9ZY24b7uSB7ROGuBZZfS+vENJUsCdIX3VmdoXQ
   wOLHyjBrry1lZdYaAOxOx0yJpf2fyHYc9XIAM6hquGzgrpZ83d+u21yQE
   xxSW7YEMSYRTVUfkDj7uHuub1fgvUyjJQgWaEBLKeyZV0XByKXa1q3mV2
   JQNXn0qr7EI/g/uIEXJwUNHdAuNcMF4EfhVcMAtiEy1z8xp5AZQTsIokr
   w==;
X-CSE-ConnectionGUID: UEwC9FfKS3+VLqKkso2gAA==
X-CSE-MsgGUID: ruAqilKgRIm3SDdG8yqU9g==
X-IronPort-AV: E=McAfee;i="6800,10657,11658"; a="79896182"
X-IronPort-AV: E=Sophos;i="6.21,193,1763452800"; 
   d="scan'208";a="79896182"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Dec 2025 14:37:20 -0800
X-CSE-ConnectionGUID: iNLhhNmsQTK6TDa/TOYOvA==
X-CSE-MsgGUID: 3K34Hs9GSUi0y2nZuGUF3w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,193,1763452800"; 
   d="scan'208";a="201148463"
Received: from lkp-server01.sh.intel.com (HELO c9aa31daaa89) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 31 Dec 2025 14:37:18 -0800
Received: from kbuild by c9aa31daaa89 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vb4oe-000000001WL-04M1;
	Wed, 31 Dec 2025 22:37:16 +0000
Date: Thu, 01 Jan 2026 06:37:03 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12 2/2]
 kernel/sched/ext.c:2224:35: sparse: sparse: incorrect type in initializer
 (different address spaces)
Message-ID: <202601010630.AwHKNG91-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android16-6.12
head:   a0c89b9a66cb83f486730bdbb70f960e58cb0274
commit: 23608cbf97d0ea0f1647c48ff56218a48248a5e5 [2/2] BACKPORT: FROMGIT: sched/proxy: Yield the donor task
config: arm64-randconfig-r123-20251231 (https://download.01.org/0day-ci/archive/20260101/202601010630.AwHKNG91-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 10.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260101/202601010630.AwHKNG91-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601010630.AwHKNG91-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   kernel/sched/rt.c:1623:15: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct task_struct *donor @@     got struct task_struct [noderef] __rcu * @@
   kernel/sched/rt.c:1623:15: sparse:     expected struct task_struct *donor
   kernel/sched/rt.c:1623:15: sparse:     got struct task_struct [noderef] __rcu *
   kernel/sched/rt.c:1702:45: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct task_struct *sched_ctx @@     got struct task_struct [noderef] __rcu *donor @@
   kernel/sched/rt.c:1702:45: sparse:     expected struct task_struct *sched_ctx
   kernel/sched/rt.c:1702:45: sparse:     got struct task_struct [noderef] __rcu *donor
   kernel/sched/rt.c:1702:56: sparse: sparse: incorrect type in argument 3 (different address spaces) @@     expected struct task_struct *exec_ctx @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/rt.c:1702:56: sparse:     expected struct task_struct *exec_ctx
   kernel/sched/rt.c:1702:56: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/rt.c:1754:39: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *donor @@     got struct task_struct [noderef] __rcu *donor @@
   kernel/sched/rt.c:1754:39: sparse:     expected struct task_struct *donor
   kernel/sched/rt.c:1754:39: sparse:     got struct task_struct [noderef] __rcu *donor
   kernel/sched/rt.c:1774:64: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *tsk @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/rt.c:1774:64: sparse:     expected struct task_struct *tsk
   kernel/sched/rt.c:1774:64: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/rt.c:2209:40: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *sched_ctx @@     got struct task_struct [noderef] __rcu *donor @@
   kernel/sched/rt.c:2209:40: sparse:     expected struct task_struct *sched_ctx
   kernel/sched/rt.c:2209:40: sparse:     got struct task_struct [noderef] __rcu *donor
   kernel/sched/rt.c:2209:51: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct task_struct *exec_ctx @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/rt.c:2209:51: sparse:     expected struct task_struct *exec_ctx
   kernel/sched/rt.c:2209:51: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/rt.c:2232:13: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/rt.c:2232:13: sparse:    struct task_struct *
   kernel/sched/rt.c:2232:13: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/rt.c:2581:54: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *tsk @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/rt.c:2581:54: sparse:     expected struct task_struct *tsk
   kernel/sched/rt.c:2581:54: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/rt.c:2583:40: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *donor @@
   kernel/sched/rt.c:2583:40: sparse:     expected struct task_struct *p
   kernel/sched/rt.c:2583:40: sparse:     got struct task_struct [noderef] __rcu *donor
   kernel/sched/rt.c:2583:62: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *donor @@
   kernel/sched/rt.c:2583:62: sparse:     expected struct task_struct *p
   kernel/sched/rt.c:2583:62: sparse:     got struct task_struct [noderef] __rcu *donor
   kernel/sched/build_policy.c: note: in included file:
   kernel/sched/deadline.c:2775:23: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *donor @@
   kernel/sched/deadline.c:2775:23: sparse:     expected struct task_struct *p
   kernel/sched/deadline.c:2775:23: sparse:     got struct task_struct [noderef] __rcu *donor
   kernel/sched/deadline.c:2785:13: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/deadline.c:2785:13: sparse:    struct task_struct *
   kernel/sched/deadline.c:2785:13: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/deadline.c:2891:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/deadline.c:2891:25: sparse:    struct task_struct *
   kernel/sched/deadline.c:2891:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/deadline.c:2355:42: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct sched_dl_entity const *b @@     got struct sched_dl_entity [noderef] __rcu * @@
   kernel/sched/deadline.c:2355:42: sparse:     expected struct sched_dl_entity const *b
   kernel/sched/deadline.c:2355:42: sparse:     got struct sched_dl_entity [noderef] __rcu *
   kernel/sched/deadline.c:2366:38: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *tsk @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/deadline.c:2366:38: sparse:     expected struct task_struct *tsk
   kernel/sched/deadline.c:2366:38: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/deadline.c:1237:39: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/deadline.c:1237:39: sparse:     expected struct task_struct *p
   kernel/sched/deadline.c:1237:39: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/deadline.c:1237:85: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct sched_dl_entity const *b @@     got struct sched_dl_entity [noderef] __rcu * @@
   kernel/sched/deadline.c:1237:85: sparse:     expected struct sched_dl_entity const *b
   kernel/sched/deadline.c:1237:85: sparse:     got struct sched_dl_entity [noderef] __rcu *
   kernel/sched/deadline.c:1337:23: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *donor @@
   kernel/sched/deadline.c:1337:23: sparse:     expected struct task_struct *p
   kernel/sched/deadline.c:1337:23: sparse:     got struct task_struct [noderef] __rcu *donor
   kernel/sched/deadline.c:1649:31: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/deadline.c:1649:31: sparse:     expected struct task_struct *p
   kernel/sched/deadline.c:1649:31: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/deadline.c:1649:70: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct sched_dl_entity const *b @@     got struct sched_dl_entity [noderef] __rcu * @@
   kernel/sched/deadline.c:1649:70: sparse:     expected struct sched_dl_entity const *b
   kernel/sched/deadline.c:1649:70: sparse:     got struct sched_dl_entity [noderef] __rcu *
   kernel/sched/deadline.c:1736:39: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *donor @@     got struct task_struct [noderef] __rcu *donor @@
   kernel/sched/deadline.c:1736:39: sparse:     expected struct task_struct *donor
   kernel/sched/deadline.c:1736:39: sparse:     got struct task_struct [noderef] __rcu *donor
   kernel/sched/deadline.c:2581:9: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] sd @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/deadline.c:2581:9: sparse:     expected struct sched_domain *[assigned] sd
   kernel/sched/deadline.c:2581:9: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/deadline.c:2233:14: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct task_struct *curr @@     got struct task_struct [noderef] __rcu * @@
   kernel/sched/deadline.c:2233:14: sparse:     expected struct task_struct *curr
   kernel/sched/deadline.c:2233:14: sparse:     got struct task_struct [noderef] __rcu *
   kernel/sched/deadline.c:2234:15: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct task_struct *donor @@     got struct task_struct [noderef] __rcu * @@
   kernel/sched/deadline.c:2234:15: sparse:     expected struct task_struct *donor
   kernel/sched/deadline.c:2234:15: sparse:     got struct task_struct [noderef] __rcu *
   kernel/sched/deadline.c:2312:43: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct task_struct *sched_ctx @@     got struct task_struct [noderef] __rcu *donor @@
   kernel/sched/deadline.c:2312:43: sparse:     expected struct task_struct *sched_ctx
   kernel/sched/deadline.c:2312:43: sparse:     got struct task_struct [noderef] __rcu *donor
   kernel/sched/deadline.c:2312:54: sparse: sparse: incorrect type in argument 3 (different address spaces) @@     expected struct task_struct *exec_ctx @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/deadline.c:2312:54: sparse:     expected struct task_struct *exec_ctx
   kernel/sched/deadline.c:2312:54: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/deadline.c:2936:38: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *tsk @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/deadline.c:2936:38: sparse:     expected struct task_struct *tsk
   kernel/sched/deadline.c:2936:38: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/deadline.c:2938:23: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *donor @@
   kernel/sched/deadline.c:2938:23: sparse:     expected struct task_struct *p
   kernel/sched/deadline.c:2938:23: sparse:     got struct task_struct [noderef] __rcu *donor
   kernel/sched/deadline.c:2940:44: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct sched_dl_entity const *b @@     got struct sched_dl_entity [noderef] __rcu * @@
   kernel/sched/deadline.c:2940:44: sparse:     expected struct sched_dl_entity const *b
   kernel/sched/deadline.c:2940:44: sparse:     got struct sched_dl_entity [noderef] __rcu *
   kernel/sched/deadline.c:3115:23: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/deadline.c:3115:23: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/deadline.c:3115:23: sparse:    struct task_struct *
   kernel/sched/deadline.c:3164:32: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/build_policy.c: note: in included file:
   kernel/sched/ext.c:1642:38: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *curr @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/ext.c:1774:56: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/ext.c:1774:56: sparse:    struct task_struct *
   kernel/sched/ext.c:1774:56: sparse:    struct task_struct [noderef] __rcu *
>> kernel/sched/ext.c:2224:35: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *donor @@
   kernel/sched/ext.c:2224:35: sparse:     expected struct task_struct *p
   kernel/sched/ext.c:2224:35: sparse:     got struct task_struct [noderef] __rcu *donor
>> kernel/sched/ext.c:2234:38: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *from @@     got struct task_struct [noderef] __rcu *donor @@
   kernel/sched/ext.c:2234:38: sparse:     expected struct task_struct *from
   kernel/sched/ext.c:2234:38: sparse:     got struct task_struct [noderef] __rcu *donor
   kernel/sched/ext.c:2868:56: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *sprev @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/ext.c:2868:56: sparse:     expected struct task_struct *sprev
   kernel/sched/ext.c:2868:56: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/ext.c:3059:38: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *prev @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/ext.c:3059:38: sparse:     expected struct task_struct *prev
   kernel/sched/ext.c:3059:38: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/ext.c:3438:49: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct const *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/ext.c:3438:49: sparse:     expected struct task_struct const *p
   kernel/sched/ext.c:3438:49: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/ext.c:5058:52: sparse: sparse: incorrect type in argument 3 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/ext.c:5058:52: sparse:     expected struct task_struct *p
   kernel/sched/ext.c:5058:52: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/ext.c:5857:32: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct const *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/ext.c:5857:32: sparse:     expected struct task_struct const *p
   kernel/sched/ext.c:5857:32: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/ext.c:7266:33: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/ext.c:7266:33: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/ext.c:7266:33: sparse:    struct task_struct const *
   kernel/sched/build_policy.c: note: in included file:
   kernel/sched/syscalls.c:215:22: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/syscalls.c:215:22: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/syscalls.c:215:22: sparse:    struct task_struct *
   kernel/sched/syscalls.c:263:48: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/syscalls.c:263:48: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/syscalls.c:263:48: sparse:    struct task_struct *
   kernel/sched/syscalls.c:1516:22: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct task_struct *curr @@     got struct task_struct [noderef] __rcu *donor @@
   kernel/sched/syscalls.c:1516:22: sparse:     expected struct task_struct *curr
   kernel/sched/syscalls.c:1516:22: sparse:     got struct task_struct [noderef] __rcu *donor
   kernel/sched/build_policy.c: note: in included file:
   kernel/sched/rt.c:1489:45: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/rt.c:1489:45: sparse:     expected struct task_struct *p
   kernel/sched/rt.c:1489:45: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/build_policy.c: note: in included file:
   kernel/sched/sched.h:2364:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2364:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2364:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2364:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2364:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2364:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2364:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2364:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2364:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2375:26: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2375:26: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2375:26: sparse:    struct task_struct *
   kernel/sched/sched.h:2364:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2364:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2364:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2375:26: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2375:26: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2375:26: sparse:    struct task_struct *
   kernel/sched/sched.h:2364:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2364:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2364:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2364:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2364:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2364:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2364:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2364:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2364:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2375:26: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2375:26: sparse:    struct task_struct [noderef] __rcu *

vim +2224 kernel/sched/ext.c

  2221	
  2222	static void yield_task_scx(struct rq *rq)
  2223	{
> 2224		struct task_struct *p = rq->donor;
  2225	
  2226		if (SCX_HAS_OP(yield))
  2227			SCX_CALL_OP_2TASKS_RET(SCX_KF_REST, yield, p, NULL);
  2228		else
  2229			p->scx.slice = 0;
  2230	}
  2231	
  2232	static bool yield_to_task_scx(struct rq *rq, struct task_struct *to)
  2233	{
> 2234		struct task_struct *from = rq->donor;
  2235	
  2236		if (SCX_HAS_OP(yield))
  2237			return SCX_CALL_OP_2TASKS_RET(SCX_KF_REST, yield, from, to);
  2238		else
  2239			return false;
  2240	}
  2241	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
