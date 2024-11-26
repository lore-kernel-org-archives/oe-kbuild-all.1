Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8F3846B5
	for <oe-kbuild-all@lists.linux.dev>; Tue, 26 Nov 2024 04:01:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732593715; cv=none; b=aEiSLDac1zYCfskk5vOKyJ2Q905BmE+prZI54sEjImxYzofp+ZG1MdcN2+GFJphh4iGCn6d72kpsamxHM/dxJhQhDnv/q1YwZeiTfq8XE0R3ws4TMwqQEqHaGa8MjDgdN46Dswc3DRFzwI23805y80BuT/J+v8Zy5uuuBc0wFHI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732593715; c=relaxed/simple;
	bh=VRLdehlmL/8Ls8hynbVk0HmqRbSlvAS42GYPiSzxSdI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=kyZSxJX3quotx/Imix+wdj1+ub1ur8kz/kalY8tJL6J04WU4c+hkBCuqR0c4X0ngH83aVtJGB4UeFomPHH8wvqgNeUYj4xA/R9iS04QKEO898cPGVf/aoyO1S8LOFZDIo693EOs8y43rVO0U8Epru5Qn6VExYOQ0UmdvliUzZfk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=c1cKFxkc; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="c1cKFxkc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732593714; x=1764129714;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=VRLdehlmL/8Ls8hynbVk0HmqRbSlvAS42GYPiSzxSdI=;
  b=c1cKFxkcVXcPn4tan9oZaUxQBkYijfto3/4tEcAVbQKgwc4ksktSPUnB
   hasqaCaJ7xXS1E3P1fUkAYkBFscL4BSi1SHrppeBaPzNiWaFqBexTBcSL
   95G/1hhTmImXPgaQlKEim7oIkfR7vsi+Cg8VTZoxUzOe07A3dKG97IZMk
   LFC6sPPSpxs2x+dCBBM5ppF3dVO9ngaJlpQpeRZZChw1wwDEYrkne4KMF
   9hQvTSYJ+Fjt3URrKF9l9z27RMmdLFj0LwcTto8qgVhFwqZTmj/ESYun7
   557iqfzLjMOTHVBMoMgbgmkSvorhYE4OOCcQsr698vnT9D/VmsvX7xHop
   g==;
X-CSE-ConnectionGUID: mlVxQq8PQZS/j/NJ1UEKnw==
X-CSE-MsgGUID: LCvEO+IOQKi8xXdzqDdrng==
X-IronPort-AV: E=McAfee;i="6700,10204,11267"; a="32108144"
X-IronPort-AV: E=Sophos;i="6.12,184,1728975600"; 
   d="scan'208";a="32108144"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2024 20:01:42 -0800
X-CSE-ConnectionGUID: /u5hbJQdSs2gmBa5Q9gCTQ==
X-CSE-MsgGUID: Gg2Ndvg2SNeL00Go1TuOug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,184,1728975600"; 
   d="scan'208";a="114748947"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 25 Nov 2024 20:01:41 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tFmle-00073B-2D;
	Tue, 26 Nov 2024 04:01:38 +0000
Date: Tue, 26 Nov 2024 12:00:50 +0800
From: kernel test robot <lkp@intel.com>
To: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
Cc: oe-kbuild-all@lists.linux.dev,
	"Steven Rostedt (Google)" <rostedt@goodmis.org>
Subject: [trace:trace/for-next 5/6] arch/arm64/include/asm/cmpxchg.h:171:1:
 sparse: sparse: cast truncates bits from constant value (ffffffff becomes
 ff)
Message-ID: <202411261146.ZKAxW8uf-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/trace/linux-trace trace/for-next
head:   ef0d4186083127d2f99ed04e051fd94ba061d253
commit: 98bf0fbb65226809a8df4d1948c5b6cf0c91590f [5/6] tracing: Remove conditional locking from __DO_TRACE()
config: arm64-randconfig-r133-20241125 (https://download.01.org/0day-ci/archive/20241126/202411261146.ZKAxW8uf-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
reproduce: (https://download.01.org/0day-ci/archive/20241126/202411261146.ZKAxW8uf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411261146.ZKAxW8uf-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   kernel/sched/core.c:765:25: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *task @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/core.c:765:25: sparse:     expected struct task_struct *task
   kernel/sched/core.c:765:25: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/core.c:835:49: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/core.c:835:49: sparse:     expected struct task_struct *p
   kernel/sched/core.c:835:49: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/core.c:1080:38: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *curr @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/core.c:1080:38: sparse:     expected struct task_struct *curr
   kernel/sched/core.c:1080:38: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/core.c:2179:39: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *donor @@     got struct task_struct [noderef] __rcu *donor @@
   kernel/sched/core.c:2179:39: sparse:     expected struct task_struct *donor
   kernel/sched/core.c:2179:39: sparse:     got struct task_struct [noderef] __rcu *donor
   kernel/sched/core.c:2190:65: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *tsk @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/core.c:2190:65: sparse:     expected struct task_struct *tsk
   kernel/sched/core.c:2190:65: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/core.c:3669:17: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct sched_domain *[assigned] sd @@     got struct sched_domain [noderef] __rcu *parent @@
   kernel/sched/core.c:3669:17: sparse:     expected struct sched_domain *[assigned] sd
   kernel/sched/core.c:3669:17: sparse:     got struct sched_domain [noderef] __rcu *parent
   kernel/sched/core.c:3878:36: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct const *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/core.c:3878:36: sparse:     expected struct task_struct const *p
   kernel/sched/core.c:3878:36: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/core.c:7986:43: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *push_task @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/core.c:7986:43: sparse:     expected struct task_struct *push_task
   kernel/sched/core.c:7986:43: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/core.c:5641:15: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct task_struct *donor @@     got struct task_struct [noderef] __rcu *donor @@
   kernel/sched/core.c:5641:15: sparse:     expected struct task_struct *donor
   kernel/sched/core.c:5641:15: sparse:     got struct task_struct [noderef] __rcu *donor
   kernel/sched/core.c:6653:14: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct task_struct *prev @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/core.c:6653:14: sparse:     expected struct task_struct *prev
   kernel/sched/core.c:6653:14: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/core.c:7199:17: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/core.c:7199:17: sparse:    struct task_struct *
   kernel/sched/core.c:7199:17: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/core.c:10099:25: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/core.c:10099:25: sparse:     expected struct task_struct *p
   kernel/sched/core.c:10099:25: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/core.c: note: in included file:
   kernel/sched/sched.h:1481:17: sparse: sparse: self-comparison always evaluates to true
   kernel/sched/core.c:591:6: sparse: sparse: context imbalance in 'raw_spin_rq_lock_nested' - wrong count at exit
   kernel/sched/sched.h:1481:17: sparse: sparse: self-comparison always evaluates to true
   kernel/sched/core.c:616:6: sparse: sparse: context imbalance in 'raw_spin_rq_trylock' - wrong count at exit
   kernel/sched/core.c:640:6: sparse: sparse: context imbalance in 'raw_spin_rq_unlock' - unexpected unlock
   kernel/sched/core.c:678:36: sparse: sparse: context imbalance in '__task_rq_lock' - wrong count at exit
   kernel/sched/core.c:719:36: sparse: sparse: context imbalance in 'task_rq_lock' - wrong count at exit
   kernel/sched/core.c: note: in included file:
   kernel/sched/pelt.h:98:13: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct const *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/pelt.h:98:13: sparse:     expected struct task_struct const *p
   kernel/sched/pelt.h:98:13: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/core.c:835:11: sparse: sparse: dereference of noderef expression
   kernel/sched/core.c:2260:35: sparse: sparse: context imbalance in 'wait_task_inactive' - different lock contexts for basic block
   kernel/sched/core.c: note: in included file:
   kernel/sched/sched.h:2260:26: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2260:26: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2260:26: sparse:    struct task_struct *
   kernel/sched/sched.h:2449:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2449:9: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2449:9: sparse:    struct task_struct *
   kernel/sched/core.c:2143:38: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/core.c:2143:38: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/core.c:2143:38: sparse:    struct task_struct const *
   kernel/sched/core.c:3796:25: sparse: sparse: context imbalance in 'ttwu_runnable' - wrong count at exit
   kernel/sched/core.c:4405:9: sparse: sparse: context imbalance in 'task_call_func' - wrong count at exit
   kernel/sched/core.c:4884:23: sparse: sparse: context imbalance in 'wake_up_new_task' - wrong count at exit
   kernel/sched/core.c: note: in included file (through include/linux/preempt.h, include/linux/spinlock.h, include/linux/wait.h, ...):
   arch/arm64/include/asm/preempt.h:19:9: sparse: sparse: cast truncates bits from constant value (100000002 becomes 2)
   kernel/sched/core.c:5281:9: sparse: sparse: context imbalance in 'finish_task_switch' - wrong count at exit
   kernel/sched/core.c: note: in included file:
   kernel/sched/sched.h:2260:26: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2260:26: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2260:26: sparse:    struct task_struct *
   kernel/sched/sched.h:2472:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2472:9: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2472:9: sparse:    struct task_struct *
   kernel/sched/sched.h:2472:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2472:9: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2472:9: sparse:    struct task_struct *
   kernel/sched/core.c: note: in included file (through arch/arm64/include/asm/atomic.h, include/linux/atomic.h, include/linux/jump_label.h, ...):
>> arch/arm64/include/asm/cmpxchg.h:171:1: sparse: sparse: cast truncates bits from constant value (ffffffff becomes ff)
>> arch/arm64/include/asm/cmpxchg.h:171:1: sparse: sparse: cast truncates bits from constant value (ffffffff becomes ffff)
>> arch/arm64/include/asm/cmpxchg.h:171:1: sparse: sparse: cast truncates bits from constant value (ffffffff becomes ff)
>> arch/arm64/include/asm/cmpxchg.h:171:1: sparse: sparse: cast truncates bits from constant value (ffffffff becomes ffff)
   kernel/sched/core.c:5364:22: sparse: sparse: context imbalance in '__schedule' - unexpected unlock
   kernel/sched/core.c: note: in included file:
   kernel/sched/sched.h:2260:26: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2260:26: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2260:26: sparse:    struct task_struct *
   kernel/sched/sched.h:2449:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2449:9: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2449:9: sparse:    struct task_struct *
   kernel/sched/sched.h:2260:26: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2260:26: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2260:26: sparse:    struct task_struct *
   kernel/sched/sched.h:2449:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2449:9: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2449:9: sparse:    struct task_struct *
   kernel/sched/core.c: note: in included file (through arch/arm64/include/asm/atomic.h, include/linux/atomic.h, include/linux/jump_label.h, ...):
>> arch/arm64/include/asm/cmpxchg.h:171:1: sparse: sparse: cast truncates bits from constant value (ffffffff becomes ff)
>> arch/arm64/include/asm/cmpxchg.h:171:1: sparse: sparse: cast truncates bits from constant value (ffffffff becomes ffff)
>> arch/arm64/include/asm/cmpxchg.h:171:1: sparse: sparse: cast truncates bits from constant value (ffffffff becomes ff)
>> arch/arm64/include/asm/cmpxchg.h:171:1: sparse: sparse: cast truncates bits from constant value (ffffffff becomes ffff)
>> arch/arm64/include/asm/cmpxchg.h:171:1: sparse: sparse: cast truncates bits from constant value (ffffffff becomes ff)
>> arch/arm64/include/asm/cmpxchg.h:171:1: sparse: sparse: cast truncates bits from constant value (ffffffff becomes ffff)
>> arch/arm64/include/asm/cmpxchg.h:171:1: sparse: sparse: cast truncates bits from constant value (ffffffff becomes ff)
>> arch/arm64/include/asm/cmpxchg.h:171:1: sparse: sparse: cast truncates bits from constant value (ffffffff becomes ffff)
>> arch/arm64/include/asm/cmpxchg.h:171:1: sparse: sparse: cast truncates bits from constant value (ffffffff becomes ff)
>> arch/arm64/include/asm/cmpxchg.h:171:1: sparse: sparse: cast truncates bits from constant value (ffffffff becomes ffff)

vim +171 arch/arm64/include/asm/cmpxchg.h

10b663aef1c247 Catalin Marinas 2012-03-05  167  
305d454aaa292b Will Deacon     2015-10-08  168  __CMPXCHG_GEN()
305d454aaa292b Will Deacon     2015-10-08  169  __CMPXCHG_GEN(_acq)
305d454aaa292b Will Deacon     2015-10-08  170  __CMPXCHG_GEN(_rel)
305d454aaa292b Will Deacon     2015-10-08 @171  __CMPXCHG_GEN(_mb)
10b663aef1c247 Catalin Marinas 2012-03-05  172  

:::::: The code at line 171 was first introduced by commit
:::::: 305d454aaa292be3a09a9d674e6c35f5b4249a13 arm64: atomics: implement native {relaxed, acquire, release} atomics

:::::: TO: Will Deacon <will.deacon@arm.com>
:::::: CC: Catalin Marinas <catalin.marinas@arm.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
