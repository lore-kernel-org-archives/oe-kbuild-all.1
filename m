Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BE9613A3F4
	for <oe-kbuild-all@lists.linux.dev>; Sun, 13 Oct 2024 11:38:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728819531; cv=none; b=EiJ1DxqbyKgz4fmWKgHAzS/0z5cq851nw+yYQJ9U79pwcV5taA3Yak2zajNzZIHJIpUTCHk1fOR9ojSa7VCM3NOt4pSEsz9v8nqIsLBIS+NQMCbqIkepQoIGV9QWRAyYiCn17gg2rXn3Pn90DlcrrTEYditY+oqyl2Nb2qoWa/w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728819531; c=relaxed/simple;
	bh=ixKWhQrwr8FP7S8q1wlg0bqVBgNn6JL9s2zePssTg+w=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=IL/REdrgVVd4eye26In+8XA3FGdOkFaI1dJhBUi6fzg6p+LpCEILxBfBZ2ms5/UCrDGDRBSBgVecx8vAi83Ofoqy0JWPBO8/d1ZL3UVwppcxVW4S50WyOBq9YMtHKMNxe1zREZaa5Ldk4K0JdRRjK/v+LQBB5gR3bRbkLMQFSa8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=D7iInN/6; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="D7iInN/6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728819528; x=1760355528;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ixKWhQrwr8FP7S8q1wlg0bqVBgNn6JL9s2zePssTg+w=;
  b=D7iInN/6T8qq//xew0shFey7HZmeVHnFeJhWRriIaJ0c/VG5HYxAWLSp
   x/AydRgZ2P0iCNW+gaKlciIVkGIsRdqb+xvg0SKwLyO/qcl8Zj+N81i09
   +0FVTbzFQ3HmIDtWKeNrwikgFrXnGZRAFsfKrJF6FEnDZa9/VaPzOg+jj
   DceQglbWHTVajaqOeuu64XvjKRz22O3ha/pMoMjBwQfwKfQXJL9YQiDVN
   k8wseU1Q4rk/83J7hXuMzYeuQZQp1mofmtHKvwprFwQr7c+1PadZlzZt3
   /b/pNJqnhhT1eXs7T+OeLnqh8RPWn551+t3qKL95U+KDx2iaIP9JLJcD6
   Q==;
X-CSE-ConnectionGUID: Fqzo111+TaycQcM19kLSFA==
X-CSE-MsgGUID: Gg+4mEB8Q8uV1y9teNYBTg==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="27625095"
X-IronPort-AV: E=Sophos;i="6.11,200,1725346800"; 
   d="scan'208";a="27625095"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2024 04:38:47 -0700
X-CSE-ConnectionGUID: +ZIZtffkQgCiTCHnLRhuOg==
X-CSE-MsgGUID: vvthZnAdQ+Gc6S+0aGZoYw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,200,1725346800"; 
   d="scan'208";a="100647806"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 13 Oct 2024 04:38:45 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1szwvr-000EL1-0b;
	Sun, 13 Oct 2024 11:38:43 +0000
Date: Sun, 13 Oct 2024 19:38:38 +0800
From: kernel test robot <lkp@intel.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: oe-kbuild-all@lists.linux.dev, Juri Lelli <juri.lelli@redhat.com>,
	Connor O'Brien <connoro@google.com>,
	John Stultz <jstultz@google.com>, Metin Kaya <metin.kaya@arm.com>
Subject: [peterz-queue:sched/core 10/10] kernel/sched/core.c:2138:39: sparse:
 sparse: incorrect type in initializer (different address spaces)
Message-ID: <202410131911.UPrIJgEg-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git sched/core
head:   f3542dc97564eea82e113e7978ed9ea5ccc7f37e
commit: f3542dc97564eea82e113e7978ed9ea5ccc7f37e [10/10] sched: Split scheduler and execution contexts
config: x86_64-randconfig-122-20241013 (https://download.01.org/0day-ci/archive/20241013/202410131911.UPrIJgEg-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241013/202410131911.UPrIJgEg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410131911.UPrIJgEg-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   kernel/sched/core.c:765:25: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *task @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/core.c:765:25: sparse:     expected struct task_struct *task
   kernel/sched/core.c:765:25: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/core.c:1081:38: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *curr @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/core.c:1081:38: sparse:     expected struct task_struct *curr
   kernel/sched/core.c:1081:38: sparse:     got struct task_struct [noderef] __rcu *curr
>> kernel/sched/core.c:2138:39: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *donor @@     got struct task_struct [noderef] __rcu *donor @@
   kernel/sched/core.c:2138:39: sparse:     expected struct task_struct *donor
   kernel/sched/core.c:2138:39: sparse:     got struct task_struct [noderef] __rcu *donor
   kernel/sched/core.c:2149:65: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *tsk @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/core.c:2149:65: sparse:     expected struct task_struct *tsk
   kernel/sched/core.c:2149:65: sparse:     got struct task_struct [noderef] __rcu *curr
>> kernel/sched/core.c:5592:15: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct task_struct *donor @@     got struct task_struct [noderef] __rcu *donor @@
   kernel/sched/core.c:5592:15: sparse:     expected struct task_struct *donor
   kernel/sched/core.c:5592:15: sparse:     got struct task_struct [noderef] __rcu *donor
   kernel/sched/core.c:6597:14: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct task_struct *prev @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/core.c:6597:14: sparse:     expected struct task_struct *prev
   kernel/sched/core.c:6597:14: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/core.c:7143:17: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/core.c:7143:17: sparse:    struct task_struct *
   kernel/sched/core.c:7143:17: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/core.c:10005:25: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/core.c:10005:25: sparse:     expected struct task_struct *p
   kernel/sched/core.c:10005:25: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/core.c: note: in included file:
   kernel/sched/sched.h:1480:17: sparse: sparse: self-comparison always evaluates to true
   kernel/sched/core.c:591:6: sparse: sparse: context imbalance in 'raw_spin_rq_lock_nested' - wrong count at exit
   kernel/sched/sched.h:1480:17: sparse: sparse: self-comparison always evaluates to true
   kernel/sched/core.c:616:6: sparse: sparse: context imbalance in 'raw_spin_rq_trylock' - wrong count at exit
   kernel/sched/core.c:640:6: sparse: sparse: context imbalance in 'raw_spin_rq_unlock' - unexpected unlock
   kernel/sched/core.c:677:21: sparse: sparse: self-comparison always evaluates to true
   kernel/sched/core.c:678:36: sparse: sparse: context imbalance in '__task_rq_lock' - wrong count at exit
   kernel/sched/core.c:718:21: sparse: sparse: self-comparison always evaluates to true
   kernel/sched/core.c:719:36: sparse: sparse: context imbalance in 'task_rq_lock' - wrong count at exit
   kernel/sched/sched.h:2276:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2276:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2276:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2276:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2276:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2276:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2276:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2276:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2276:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2287:26: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2287:26: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2287:26: sparse:    struct task_struct *
   kernel/sched/sched.h:2496:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2496:9: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2496:9: sparse:    struct task_struct *
   kernel/sched/sched.h:2496:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2496:9: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2496:9: sparse:    struct task_struct *
   kernel/sched/sched.h:2287:26: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2287:26: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2287:26: sparse:    struct task_struct *
   kernel/sched/sched.h:2473:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2473:9: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2473:9: sparse:    struct task_struct *
   kernel/sched/sched.h:2287:26: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2287:26: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2287:26: sparse:    struct task_struct *
   kernel/sched/sched.h:2473:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2473:9: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2473:9: sparse:    struct task_struct *
--
>> kernel/sched/fair.c:1203:39: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *donor @@     got struct task_struct [noderef] __rcu *donor @@
   kernel/sched/fair.c:1203:39: sparse:     expected struct task_struct *donor
   kernel/sched/fair.c:1203:39: sparse:     got struct task_struct [noderef] __rcu *donor
   kernel/sched/fair.c:1261:34: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct sched_entity const *se @@     got struct sched_entity [noderef] __rcu * @@
   kernel/sched/fair.c:1261:34: sparse:     expected struct sched_entity const *se
   kernel/sched/fair.c:1261:34: sparse:     got struct sched_entity [noderef] __rcu *
   kernel/sched/fair.c:6103:22: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/fair.c:6103:22: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/fair.c:6103:22: sparse:    struct task_struct *
   kernel/sched/fair.c:7036:58: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/fair.c:7036:58: sparse:     expected struct task_struct *p
   kernel/sched/fair.c:7036:58: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/fair.c:8753:39: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *donor @@     got struct task_struct [noderef] __rcu *donor @@
   kernel/sched/fair.c:8753:39: sparse:     expected struct task_struct *donor
   kernel/sched/fair.c:8753:39: sparse:     got struct task_struct [noderef] __rcu *donor
   kernel/sched/fair.c:8784:37: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *tsk @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/fair.c:8784:37: sparse:     expected struct task_struct *tsk
   kernel/sched/fair.c:8784:37: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/fair.c:8995:38: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *curr @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/fair.c:8995:38: sparse:     expected struct task_struct *curr
   kernel/sched/fair.c:8995:38: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/fair.c: note: in included file (through include/linux/smp.h, include/linux/lockdep.h, include/linux/spinlock.h, ...):
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   kernel/sched/fair.c: note: in included file:
   kernel/sched/sched.h:2496:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2496:9: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2496:9: sparse:    struct task_struct *
   kernel/sched/sched.h:2287:26: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2287:26: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2287:26: sparse:    struct task_struct *
   kernel/sched/sched.h:2287:26: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2287:26: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2287:26: sparse:    struct task_struct *
--
   kernel/sched/build_policy.c: note: in included file:
>> kernel/sched/rt.c:991:39: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *donor @@     got struct task_struct [noderef] __rcu *donor @@
   kernel/sched/rt.c:991:39: sparse:     expected struct task_struct *donor
   kernel/sched/rt.c:991:39: sparse:     got struct task_struct [noderef] __rcu *donor
   kernel/sched/rt.c:1529:31: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/rt.c:1529:31: sparse:     expected struct task_struct *p
   kernel/sched/rt.c:1529:31: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/rt.c:1654:39: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *donor @@     got struct task_struct [noderef] __rcu *donor @@
   kernel/sched/rt.c:1654:39: sparse:     expected struct task_struct *donor
   kernel/sched/rt.c:1654:39: sparse:     got struct task_struct [noderef] __rcu *donor
   kernel/sched/build_policy.c: note: in included file:
   kernel/sched/deadline.c:2342:42: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct sched_dl_entity const *b @@     got struct sched_dl_entity [noderef] __rcu * @@
   kernel/sched/deadline.c:2342:42: sparse:     expected struct sched_dl_entity const *b
   kernel/sched/deadline.c:2342:42: sparse:     got struct sched_dl_entity [noderef] __rcu *
   kernel/sched/deadline.c:1242:39: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/deadline.c:1242:39: sparse:     expected struct task_struct *p
   kernel/sched/deadline.c:1242:39: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/deadline.c:1242:85: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct sched_dl_entity const *b @@     got struct sched_dl_entity [noderef] __rcu * @@
   kernel/sched/deadline.c:1242:85: sparse:     expected struct sched_dl_entity const *b
   kernel/sched/deadline.c:1242:85: sparse:     got struct sched_dl_entity [noderef] __rcu *
>> kernel/sched/deadline.c:1342:23: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *donor @@
   kernel/sched/deadline.c:1342:23: sparse:     expected struct task_struct *p
   kernel/sched/deadline.c:1342:23: sparse:     got struct task_struct [noderef] __rcu *donor
   kernel/sched/deadline.c:1651:31: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/deadline.c:1651:31: sparse:     expected struct task_struct *p
   kernel/sched/deadline.c:1651:31: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/deadline.c:1651:70: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct sched_dl_entity const *b @@     got struct sched_dl_entity [noderef] __rcu * @@
   kernel/sched/deadline.c:1651:70: sparse:     expected struct sched_dl_entity const *b
   kernel/sched/deadline.c:1651:70: sparse:     got struct sched_dl_entity [noderef] __rcu *
>> kernel/sched/deadline.c:1739:39: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *donor @@     got struct task_struct [noderef] __rcu *donor @@
   kernel/sched/deadline.c:1739:39: sparse:     expected struct task_struct *donor
   kernel/sched/deadline.c:1739:39: sparse:     got struct task_struct [noderef] __rcu *donor
   kernel/sched/deadline.c:3043:23: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/deadline.c:3043:23: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/deadline.c:3043:23: sparse:    struct task_struct *
   kernel/sched/build_policy.c: note: in included file:
   kernel/sched/syscalls.c:206:22: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/syscalls.c:206:22: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/syscalls.c:206:22: sparse:    struct task_struct *
   kernel/sched/build_policy.c: note: in included file (through include/linux/smp.h, include/linux/sched/clock.h):
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   kernel/sched/build_policy.c: note: in included file:
   kernel/sched/sched.h:2276:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2276:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2276:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2276:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2276:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2276:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2287:26: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2287:26: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2287:26: sparse:    struct task_struct *
   kernel/sched/sched.h:2276:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2276:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2276:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2287:26: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2287:26: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2287:26: sparse:    struct task_struct *
   kernel/sched/sched.h:2473:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2473:9: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2473:9: sparse:    struct task_struct *
   kernel/sched/sched.h:2287:26: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2287:26: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2287:26: sparse:    struct task_struct *
   kernel/sched/sched.h:2473:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2473:9: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2473:9: sparse:    struct task_struct *
   kernel/sched/build_policy.c: note: in included file:
   kernel/sched/syscalls.c:1336:6: sparse: sparse: context imbalance in 'sched_getaffinity' - different lock contexts for basic block
   kernel/sched/build_policy.c: note: in included file:
   kernel/sched/sched.h:2276:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2276:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2276:25: sparse:    struct task_struct *

vim +2138 kernel/sched/core.c

  2135	
  2136	void wakeup_preempt(struct rq *rq, struct task_struct *p, int flags)
  2137	{
> 2138		struct task_struct *donor = rq->donor;
  2139	
  2140		if (p->sched_class == donor->sched_class)
  2141			donor->sched_class->wakeup_preempt(rq, p, flags);
  2142		else if (sched_class_above(p->sched_class, donor->sched_class))
  2143			resched_curr(rq);
  2144	
  2145		/*
  2146		 * A queue event has occurred, and we're going to schedule.  In
  2147		 * this case, we can save a useless back to back clock update.
  2148		 */
  2149		if (task_on_rq_queued(donor) && test_tsk_need_resched(rq->curr))
  2150			rq_clock_skip_update(rq);
  2151	}
  2152	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
