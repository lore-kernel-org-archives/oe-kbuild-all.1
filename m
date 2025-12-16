Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F27833FE30
	for <oe-kbuild-all@lists.linux.dev>; Tue, 16 Dec 2025 23:42:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765928544; cv=none; b=jX7uKTJArvxFYi2cZFvsN/vJ+Bg/JwGSU21cECDqi/Pl8Y2+QAxwUpp+p6mNTy9Xy9Zv89X9FUlBWQO5Anbydvvc5+KdjZIqfZJPyjxytE6Hnxsm+K2/m+tq1DXP2V4SBAJ1x9pMokKpDyP86/aAB5KJsiNIhfW8n8u4lvh1aTo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765928544; c=relaxed/simple;
	bh=GDfskqIKBSaH/T9fsgF9+0hs2XHKOrOIjEcIltxt+M8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=FgRPGohWAKCmwRy3pE7njIYKuAkA4G45M6DKoracFMJ/xPaXeSeVQBd4ajS8THkF9JVFEx5h8SB7PMaZVJAvd7YpnohP2Gpc8vIvwDFVN5EUILRC2ldrj9i9EPvInkn7/2EcpBa1NwNWDrPWoccPt0Nx0OHJulLjZGHjVX8pvPI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=USCK2/Bt; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="USCK2/Bt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765928542; x=1797464542;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=GDfskqIKBSaH/T9fsgF9+0hs2XHKOrOIjEcIltxt+M8=;
  b=USCK2/Bt+gLsJPuV93/pRKzbxec3hY+484ojepLhQhFP7VBUB8FcJsE5
   7bVXz6vL5GOloB/RPGwqnvOQzW18Sfbr6FuP7QbGL8Vw+lAxvoIy3gD5G
   JEWhUUdKo8sL/oKTSRqR5xj1XkVXnKWnAUw6zE1yrJ6GIY9NiH3JiaY2B
   03RchS60vWCabbSkvlR1sQXsXxUImasF/ZlPsjqaZZXvsU+43yOpx441Z
   iSPUW3EdDLMSTTlp2MEEsokRSttF1zStImcCMbo1koY7bPfy4wfRq0c4E
   otQnvZJJHJyFs/93GR7JOd60yIpr3cwFmM0B5xE+BMZlgi1KKBkaX0kth
   Q==;
X-CSE-ConnectionGUID: zEQ9ew0yRra/T8l6mUFEIw==
X-CSE-MsgGUID: WJs+nz+2RvaKsjMv6FYJZg==
X-IronPort-AV: E=McAfee;i="6800,10657,11644"; a="78570886"
X-IronPort-AV: E=Sophos;i="6.21,154,1763452800"; 
   d="scan'208";a="78570886"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Dec 2025 15:42:20 -0800
X-CSE-ConnectionGUID: 7TxkB3vGQEaPMTgtVavDXQ==
X-CSE-MsgGUID: 21793IhTS9mkZ+V5gH4v4w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,154,1763452800"; 
   d="scan'208";a="198146488"
Received: from lkp-server02.sh.intel.com (HELO 034c7e8e53c3) ([10.239.97.151])
  by orviesa007.jf.intel.com with ESMTP; 16 Dec 2025 15:42:18 -0800
Received: from kbuild by 034c7e8e53c3 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vVegK-000000003wc-0xXB;
	Tue, 16 Dec 2025 23:42:16 +0000
Date: Wed, 17 Dec 2025 07:41:54 +0800
From: kernel test robot <lkp@intel.com>
To: elver@google.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [melver:ctx-analysis/dev 35/35] kernel/sched/core.c:3330:2: error:
 use of undeclared identifier '_T'
Message-ID: <202512170728.EOf5sSpM-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/melver/linux.git ctx-analysis/dev
head:   6f3ab5bf905fd39deead834b14bd046dbe168533
commit: 6f3ab5bf905fd39deead834b14bd046dbe168533 [35/35] sched: Enable context analysis for core.c and fair.c
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20251217/202512170728.EOf5sSpM-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251217/202512170728.EOf5sSpM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512170728.EOf5sSpM-lkp@intel.com/

All errors (new ones prefixed by >>):

>> kernel/sched/core.c:3330:2: error: use of undeclared identifier '_T'
    3330 |         guard(double_raw_spinlock)(&arg->src_task->pi_lock, &arg->dst_task->pi_lock);
         |         ^
   include/linux/cleanup.h:419:2: note: expanded from macro 'guard'
     419 |         CLASS(_name, __UNIQUE_ID(guard))
         |         ^
   include/linux/cleanup.h:300:3: note: expanded from macro 'CLASS'
     300 |                 class_##_name##_constructor
         |                 ^
   <scratch space>:3:1: note: expanded from here
       3 | class_double_raw_spinlock_constructor
         | ^
   kernel/sched/sched.h:3248:2: note: expanded from macro 'class_double_raw_spinlock_constructor'
    3248 |         WITH_LOCK_GUARD_2_ATTRS(double_raw_spinlock, _T1, _T2)
         |         ^
   kernel/sched/sched.h:3090:30: note: expanded from macro 'WITH_LOCK_GUARD_2_ATTRS'
    3090 |         class_##_name##_constructor(_T),                                                \
         |                                     ^
   1 error generated.


vim +/_T +3330 kernel/sched/core.c

ac66f5477239eb Peter Zijlstra            2013-10-07  3318  
ac66f5477239eb Peter Zijlstra            2013-10-07  3319  static int migrate_swap_stop(void *data)
ac66f5477239eb Peter Zijlstra            2013-10-07  3320  {
ac66f5477239eb Peter Zijlstra            2013-10-07  3321  	struct migration_swap_arg *arg = data;
ac66f5477239eb Peter Zijlstra            2013-10-07  3322  	struct rq *src_rq, *dst_rq;
ac66f5477239eb Peter Zijlstra            2013-10-07  3323  
62694cd5132226 Peter Zijlstra            2015-10-09  3324  	if (!cpu_active(arg->src_cpu) || !cpu_active(arg->dst_cpu))
62694cd5132226 Peter Zijlstra            2015-10-09  3325  		return -EAGAIN;
62694cd5132226 Peter Zijlstra            2015-10-09  3326  
ac66f5477239eb Peter Zijlstra            2013-10-07  3327  	src_rq = cpu_rq(arg->src_cpu);
ac66f5477239eb Peter Zijlstra            2013-10-07  3328  	dst_rq = cpu_rq(arg->dst_cpu);
ac66f5477239eb Peter Zijlstra            2013-10-07  3329  
5bb76f1ddf2a7d Peter Zijlstra            2023-08-01 @3330  	guard(double_raw_spinlock)(&arg->src_task->pi_lock, &arg->dst_task->pi_lock);
5bb76f1ddf2a7d Peter Zijlstra            2023-08-01  3331  	guard(double_rq_lock)(src_rq, dst_rq);
62694cd5132226 Peter Zijlstra            2015-10-09  3332  
ac66f5477239eb Peter Zijlstra            2013-10-07  3333  	if (task_cpu(arg->dst_task) != arg->dst_cpu)
5bb76f1ddf2a7d Peter Zijlstra            2023-08-01  3334  		return -EAGAIN;
ac66f5477239eb Peter Zijlstra            2013-10-07  3335  
ac66f5477239eb Peter Zijlstra            2013-10-07  3336  	if (task_cpu(arg->src_task) != arg->src_cpu)
5bb76f1ddf2a7d Peter Zijlstra            2023-08-01  3337  		return -EAGAIN;
ac66f5477239eb Peter Zijlstra            2013-10-07  3338  
3bd3706251ee8a Sebastian Andrzej Siewior 2019-04-23  3339  	if (!cpumask_test_cpu(arg->dst_cpu, arg->src_task->cpus_ptr))
5bb76f1ddf2a7d Peter Zijlstra            2023-08-01  3340  		return -EAGAIN;
ac66f5477239eb Peter Zijlstra            2013-10-07  3341  
3bd3706251ee8a Sebastian Andrzej Siewior 2019-04-23  3342  	if (!cpumask_test_cpu(arg->src_cpu, arg->dst_task->cpus_ptr))
5bb76f1ddf2a7d Peter Zijlstra            2023-08-01  3343  		return -EAGAIN;
ac66f5477239eb Peter Zijlstra            2013-10-07  3344  
ac66f5477239eb Peter Zijlstra            2013-10-07  3345  	__migrate_swap_task(arg->src_task, arg->dst_cpu);
ac66f5477239eb Peter Zijlstra            2013-10-07  3346  	__migrate_swap_task(arg->dst_task, arg->src_cpu);
ac66f5477239eb Peter Zijlstra            2013-10-07  3347  
5bb76f1ddf2a7d Peter Zijlstra            2023-08-01  3348  	return 0;
ac66f5477239eb Peter Zijlstra            2013-10-07  3349  }
ac66f5477239eb Peter Zijlstra            2013-10-07  3350  

:::::: The code at line 3330 was first introduced by commit
:::::: 5bb76f1ddf2a7dd98f5a89d7755600ed1b4a7fcd sched: Simplify: migrate_swap_stop()

:::::: TO: Peter Zijlstra <peterz@infradead.org>
:::::: CC: Peter Zijlstra <peterz@infradead.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
