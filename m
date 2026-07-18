Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7283F30D3F5
	for <oe-kbuild-all@lists.linux.dev>; Sat, 18 Jul 2026 17:40:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784396403; cv=none; b=U+3FTJlF4OUkOKmuw94Fu4iVi7GbozT95POMzlWSQoIOCY/ohnNcPyHWKEP2UzGwVdLajeOaLNMexeJZiedJn2/+ocIaD2DMo8CrHYDbU5+V75JjGuscUjHy4UlGwGkCLPDI2lFI8AH0nkZ/W8hfs30KlkvNYoQ2nfkSWMYbvBY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784396403; c=relaxed/simple;
	bh=e7pKgH0xygvSpC6GXhJHsxrqaFL64GlGuKfrccQ/+aQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=LE/mVsmFaMEKTP22WO4eZa0V0+YudraLPF9FHCkIykMfPinlB05gcmtLxGsEgVYfCN57d8BRKuPrUkIRiCQZ8/VzOL76pma9KfKwatUolCpBr20TX5x74AlDScC4kP+RHNF8yQpOnsJZa03B6pxAAfq/1EmaXMTrotOebuJfmg8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ExRAGnUi; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ExRAGnUi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784396401; x=1815932401;
  h=date:from:to:cc:subject:message-id;
  bh=e7pKgH0xygvSpC6GXhJHsxrqaFL64GlGuKfrccQ/+aQ=;
  b=ExRAGnUi006jnjkqCG0u/+s8QN3F2F/GVdXL0A5J4F0BKZhrx2wf6c5r
   dRqK8Hqc/iihpn4UVaOyIeYdPjNdzQeeQny0dp5gri4z8Z3TrrzdNeM1C
   +6u+kGP7IPLNRUxiDxrVySIAWVZOXsz7cacxmP4q5Lj3vmvqMTbbAbzYa
   qmSNQFkK9BDyj3oMonnLCK+icJRYU+eDQWjMi1fxTkhl9VKexIy5my8Mw
   nQoihkVCwUHO9onIgvM8izIVP2l6CK/R4WnR0j9yDoDk1l0IQD86iPOLq
   govow9m0IHCG5ic0rau+1oX7dOzPiMzJ1IS+MGRibvdHK09Y5/gVLR9OB
   g==;
X-CSE-ConnectionGUID: +NdPnDofRamRwwyd/NxH3A==
X-CSE-MsgGUID: 32kD69KfRXu/aYr8OEnqWQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11850"; a="96402363"
X-IronPort-AV: E=Sophos;i="6.25,171,1779174000"; 
   d="scan'208";a="96402363"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jul 2026 10:39:57 -0700
X-CSE-ConnectionGUID: br0S3/EURm+wfqs+rgVz2g==
X-CSE-MsgGUID: ZchrDTw6QJWWAadFWkl/4w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,171,1779174000"; 
   d="scan'208";a="257140855"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa007.jf.intel.com with ESMTP; 18 Jul 2026 10:39:55 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wl90y-00000000Uys-3ngm;
	Sat, 18 Jul 2026 17:39:52 +0000
Date: Sun, 19 Jul 2026 01:39:43 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12 12/12]
 kernel/sched/core.c:7745:20: sparse: sparse: incorrect type in assignment
 (different address spaces)
Message-ID: <202607190108.x6It4FEc-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android16-6.12
head:   0fd55a309793adc6b8cddb5c29e80caa545ba4bb
commit: 998de772b46b660a07d46c79ccd2e290a2948357 [12/12] ANDROID: sched: Fix potentially missing balancing with Proxy Exec
config: arm-randconfig-r112-20260716 (https://download.01.org/0day-ci/archive/20260719/202607190108.x6It4FEc-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 15.2.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260719/202607190108.x6It4FEc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607190108.x6It4FEc-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   kernel/sched/core.c:1502:47: sparse:     got struct rq *
   kernel/sched/core.c:2339:39: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct task_struct *donor @@     got struct task_struct [noderef] __rcu *donor @@
   kernel/sched/core.c:2339:39: sparse:     expected struct task_struct *donor
   kernel/sched/core.c:2339:39: sparse:     got struct task_struct [noderef] __rcu *donor
   kernel/sched/core.c:2350:65: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *tsk @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/core.c:2350:65: sparse:     expected struct task_struct *tsk
   kernel/sched/core.c:2350:65: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/core.c:2408:22: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct rq * @@
   kernel/sched/core.c:2408:22: sparse:     expected void const [noderef] __percpu *__vpp_verify
   kernel/sched/core.c:2408:22: sparse:     got struct rq *
   kernel/sched/core.c:3863:14: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct rq * @@
   kernel/sched/core.c:3863:14: sparse:     expected void const [noderef] __percpu *__vpp_verify
   kernel/sched/core.c:3863:14: sparse:     got struct rq *
   kernel/sched/core.c:4279:29: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct rq * @@
   kernel/sched/core.c:4279:29: sparse:     expected void const [noderef] __percpu *__vpp_verify
   kernel/sched/core.c:4279:29: sparse:     got struct rq *
   kernel/sched/core.c:4571:25: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct rq * @@
   kernel/sched/core.c:4571:25: sparse:     expected void const [noderef] __percpu *__vpp_verify
   kernel/sched/core.c:4571:25: sparse:     got struct rq *
   kernel/sched/core.c:4931:34: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct rq * @@
   kernel/sched/core.c:4931:34: sparse:     expected void const [noderef] __percpu *__vpp_verify
   kernel/sched/core.c:4931:34: sparse:     got struct rq *
   kernel/sched/core.c:5037:25: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct rq * @@
   kernel/sched/core.c:5037:25: sparse:     expected void const [noderef] __percpu *__vpp_verify
   kernel/sched/core.c:5037:25: sparse:     got struct rq *
   kernel/sched/core.c:5043:13: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct rq * @@
   kernel/sched/core.c:5043:13: sparse:     expected void const [noderef] __percpu *__vpp_verify
   kernel/sched/core.c:5043:13: sparse:     got struct rq *
   kernel/sched/core.c:5043:13: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct rq * @@
   kernel/sched/core.c:5043:13: sparse:     expected void const [noderef] __percpu *__vpp_verify
   kernel/sched/core.c:5043:13: sparse:     got struct rq *
   kernel/sched/core.c:5043:13: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct rq * @@
   kernel/sched/core.c:5043:13: sparse:     expected void const [noderef] __percpu *__vpp_verify
   kernel/sched/core.c:5043:13: sparse:     got struct rq *
   kernel/sched/core.c:5043:13: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct rq * @@
   kernel/sched/core.c:5043:13: sparse:     expected void const [noderef] __percpu *__vpp_verify
   kernel/sched/core.c:5043:13: sparse:     got struct rq *
   kernel/sched/core.c:5043:13: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct rq * @@
   kernel/sched/core.c:5043:13: sparse:     expected void const [noderef] __percpu *__vpp_verify
   kernel/sched/core.c:5043:13: sparse:     got struct rq *
   kernel/sched/core.c:5043:13: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct rq * @@
   kernel/sched/core.c:5043:13: sparse:     expected void const [noderef] __percpu *__vpp_verify
   kernel/sched/core.c:5043:13: sparse:     got struct rq *
   kernel/sched/core.c:5043:13: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct rq * @@
   kernel/sched/core.c:5043:13: sparse:     expected void const [noderef] __percpu *__vpp_verify
   kernel/sched/core.c:5043:13: sparse:     got struct rq *
   kernel/sched/core.c:5043:13: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct rq * @@
   kernel/sched/core.c:5043:13: sparse:     expected void const [noderef] __percpu *__vpp_verify
   kernel/sched/core.c:5043:13: sparse:     got struct rq *
   kernel/sched/core.c:5043:13: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct rq * @@
   kernel/sched/core.c:5043:13: sparse:     expected void const [noderef] __percpu *__vpp_verify
   kernel/sched/core.c:5043:13: sparse:     got struct rq *
   kernel/sched/core.c:5043:13: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct rq * @@
   kernel/sched/core.c:5043:13: sparse:     expected void const [noderef] __percpu *__vpp_verify
   kernel/sched/core.c:5043:13: sparse:     got struct rq *
   kernel/sched/core.c:5043:13: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct rq * @@
   kernel/sched/core.c:5043:13: sparse:     expected void const [noderef] __percpu *__vpp_verify
   kernel/sched/core.c:5043:13: sparse:     got struct rq *
   kernel/sched/core.c:5043:13: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct rq * @@
   kernel/sched/core.c:5043:13: sparse:     expected void const [noderef] __percpu *__vpp_verify
   kernel/sched/core.c:5043:13: sparse:     got struct rq *
   kernel/sched/core.c:5043:13: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct rq * @@
   kernel/sched/core.c:5043:13: sparse:     expected void const [noderef] __percpu *__vpp_verify
   kernel/sched/core.c:5043:13: sparse:     got struct rq *
   kernel/sched/core.c:5043:13: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct rq * @@
   kernel/sched/core.c:5043:13: sparse:     expected void const [noderef] __percpu *__vpp_verify
   kernel/sched/core.c:5043:13: sparse:     got struct rq *
   kernel/sched/core.c:5865:25: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct rq * @@
   kernel/sched/core.c:5865:25: sparse:     expected void const [noderef] __percpu *__vpp_verify
   kernel/sched/core.c:5865:25: sparse:     got struct rq *
   kernel/sched/core.c:6050:24: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct rq * @@
   kernel/sched/core.c:6050:24: sparse:     expected void const [noderef] __percpu *__vpp_verify
   kernel/sched/core.c:6050:24: sparse:     got struct rq *
   kernel/sched/core.c:6070:16: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct rq * @@
   kernel/sched/core.c:6070:16: sparse:     expected void const [noderef] __percpu *__vpp_verify
   kernel/sched/core.c:6070:16: sparse:     got struct rq *
   kernel/sched/core.c:6076:16: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct rq * @@
   kernel/sched/core.c:6076:16: sparse:     expected void const [noderef] __percpu *__vpp_verify
   kernel/sched/core.c:6076:16: sparse:     got struct rq *
   kernel/sched/core.c:6085:24: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct rq * @@
   kernel/sched/core.c:6085:24: sparse:     expected void const [noderef] __percpu *__vpp_verify
   kernel/sched/core.c:6085:24: sparse:     got struct rq *
   kernel/sched/core.c:6099:29: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct rq * @@
   kernel/sched/core.c:6099:29: sparse:     expected void const [noderef] __percpu *__vpp_verify
   kernel/sched/core.c:6099:29: sparse:     got struct rq *
   kernel/sched/core.c:6297:25: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct rq * @@
   kernel/sched/core.c:6297:25: sparse:     expected void const [noderef] __percpu *__vpp_verify
   kernel/sched/core.c:6297:25: sparse:     got struct rq *
   kernel/sched/core.c:6310:15: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct task_struct *donor @@     got struct task_struct [noderef] __rcu *donor @@
   kernel/sched/core.c:6310:15: sparse:     expected struct task_struct *donor
   kernel/sched/core.c:6310:15: sparse:     got struct task_struct [noderef] __rcu *donor
   kernel/sched/core.c:6665:60: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct task_struct *prev @@     got struct task_struct [noderef] __rcu *donor @@
   kernel/sched/core.c:6665:60: sparse:     expected struct task_struct *prev
   kernel/sched/core.c:6665:60: sparse:     got struct task_struct [noderef] __rcu *donor
   kernel/sched/core.c:7743:14: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct rq * @@
   kernel/sched/core.c:7743:14: sparse:     expected void const [noderef] __percpu *__vpp_verify
   kernel/sched/core.c:7743:14: sparse:     got struct rq *
   kernel/sched/core.c:7744:14: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct task_struct *prev @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/core.c:7744:14: sparse:     expected struct task_struct *prev
   kernel/sched/core.c:7744:14: sparse:     got struct task_struct [noderef] __rcu *curr
>> kernel/sched/core.c:7745:20: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct task_struct *prev_donor @@     got struct task_struct [noderef] __rcu *donor @@
   kernel/sched/core.c:7745:20: sparse:     expected struct task_struct *prev_donor
   kernel/sched/core.c:7745:20: sparse:     got struct task_struct [noderef] __rcu *donor
   kernel/sched/core.c:7830:37: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct task_struct *prev @@     got struct task_struct [noderef] __rcu *donor @@
   kernel/sched/core.c:7830:37: sparse:     expected struct task_struct *prev
   kernel/sched/core.c:7830:37: sparse:     got struct task_struct [noderef] __rcu *donor
   kernel/sched/core.c:7844:31: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/core.c:7844:31: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/core.c:7844:31: sparse:    struct task_struct *
   kernel/sched/core.c:8378:17: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/core.c:8378:17: sparse:    struct task_struct *
   kernel/sched/core.c:8378:17: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/core.c:8936:25: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct rq * @@
   kernel/sched/core.c:8936:25: sparse:     expected void const [noderef] __percpu *__vpp_verify
   kernel/sched/core.c:8936:25: sparse:     got struct rq *
   kernel/sched/core.c:9695:22: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct rq * @@
   kernel/sched/core.c:9695:22: sparse:     expected void const [noderef] __percpu *__vpp_verify
   kernel/sched/core.c:9695:22: sparse:     got struct rq *
   kernel/sched/core.c:11285:25: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct rq * @@
   kernel/sched/core.c:11285:25: sparse:     expected void const [noderef] __percpu *__vpp_verify
   kernel/sched/core.c:11285:25: sparse:     got struct rq *
   kernel/sched/core.c:11285:25: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/core.c:11285:25: sparse:     expected struct task_struct *p
   kernel/sched/core.c:11285:25: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/core.c:685:6: sparse: sparse: context imbalance in 'raw_spin_rq_lock_nested' - wrong count at exit
   kernel/sched/core.c:711:6: sparse: sparse: context imbalance in 'raw_spin_rq_trylock' - wrong count at exit
   kernel/sched/core.c:735:6: sparse: sparse: context imbalance in 'raw_spin_rq_unlock' - unexpected unlock
   kernel/sched/core.c:775:36: sparse: sparse: context imbalance in '__task_rq_lock' - wrong count at exit
   kernel/sched/core.c:817:36: sparse: sparse: context imbalance in 'task_rq_lock' - wrong count at exit
   kernel/sched/core.c:937:11: sparse: sparse: dereference of noderef expression
   kernel/sched/core.c: note: in included file:
   kernel/sched/sched.h:2369:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2369:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2369:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2369:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2369:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2369:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2369:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2369:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2369:25: sparse:    struct task_struct *
   kernel/sched/sched.h:2380:26: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2380:26: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2380:26: sparse:    struct task_struct *
   kernel/sched/sched.h:2604:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2604:9: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2604:9: sparse:    struct task_struct *
   kernel/sched/sched.h:2604:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2604:9: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2604:9: sparse:    struct task_struct *
   kernel/sched/sched.h:2380:26: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2380:26: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2380:26: sparse:    struct task_struct *
   kernel/sched/sched.h:2581:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2581:9: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2581:9: sparse:    struct task_struct *

vim +7745 kernel/sched/core.c

  7684	
  7685	/*
  7686	 * __schedule() is the main scheduler function.
  7687	 *
  7688	 * The main means of driving the scheduler and thus entering this function are:
  7689	 *
  7690	 *   1. Explicit blocking: mutex, semaphore, waitqueue, etc.
  7691	 *
  7692	 *   2. TIF_NEED_RESCHED flag is checked on interrupt and userspace return
  7693	 *      paths. For example, see arch/x86/entry_64.S.
  7694	 *
  7695	 *      To drive preemption between tasks, the scheduler sets the flag in timer
  7696	 *      interrupt handler sched_tick().
  7697	 *
  7698	 *   3. Wakeups don't really cause entry into schedule(). They add a
  7699	 *      task to the run-queue and that's it.
  7700	 *
  7701	 *      Now, if the new task added to the run-queue preempts the current
  7702	 *      task, then the wakeup sets TIF_NEED_RESCHED and schedule() gets
  7703	 *      called on the nearest possible occasion:
  7704	 *
  7705	 *       - If the kernel is preemptible (CONFIG_PREEMPTION=y):
  7706	 *
  7707	 *         - in syscall or exception context, at the next outmost
  7708	 *           preempt_enable(). (this might be as soon as the wake_up()'s
  7709	 *           spin_unlock()!)
  7710	 *
  7711	 *         - in IRQ context, return from interrupt-handler to
  7712	 *           preemptible context
  7713	 *
  7714	 *       - If the kernel is not preemptible (CONFIG_PREEMPTION is not set)
  7715	 *         then at the next:
  7716	 *
  7717	 *          - cond_resched() call
  7718	 *          - explicit schedule() call
  7719	 *          - return from syscall or exception to user-space
  7720	 *          - return from interrupt-handler to user-space
  7721	 *
  7722	 * WARNING: must be called with preemption disabled!
  7723	 */
  7724	static void __sched notrace __schedule(int sched_mode)
  7725	{
  7726		struct task_struct *prev, *next;
  7727		struct task_struct *prev_donor;
  7728		/*
  7729		 * On PREEMPT_RT kernel, SM_RTLOCK_WAIT is noted
  7730		 * as a preemption by schedule_debug() and RCU.
  7731		 */
  7732		bool preempt = sched_mode > SM_NONE;
  7733		bool block = false;
  7734		unsigned long *switch_count;
  7735		unsigned long prev_state;
  7736		struct rq_flags rf;
  7737		struct rq *rq;
  7738		bool prev_not_proxied;
  7739		int cpu;
  7740		bool skip_schedule = false;
  7741	
  7742		cpu = smp_processor_id();
  7743		rq = cpu_rq(cpu);
  7744		prev = rq->curr;
> 7745		prev_donor = rq->donor;
  7746	
  7747		schedule_debug(prev, preempt);
  7748	
  7749		trace_android_vh_lock_delay_schedule(prev, sched_mode, &skip_schedule);
  7750	
  7751		if (skip_schedule)
  7752			return;
  7753	
  7754		if (sched_feat(HRTICK) || sched_feat(HRTICK_DL))
  7755			hrtick_clear(rq);
  7756	
  7757		local_irq_disable();
  7758		rcu_note_context_switch(preempt);
  7759	
  7760		/*
  7761		 * Make sure that signal_pending_state()->signal_pending() below
  7762		 * can't be reordered with __set_current_state(TASK_INTERRUPTIBLE)
  7763		 * done by the caller to avoid the race with signal_wake_up():
  7764		 *
  7765		 * __set_current_state(@state)		signal_wake_up()
  7766		 * schedule()				  set_tsk_thread_flag(p, TIF_SIGPENDING)
  7767		 *					  wake_up_state(p, state)
  7768		 *   LOCK rq->lock			    LOCK p->pi_state
  7769		 *   smp_mb__after_spinlock()		    smp_mb__after_spinlock()
  7770		 *     if (signal_pending_state())	    if (p->state & @state)
  7771		 *
  7772		 * Also, the membarrier system call requires a full memory barrier
  7773		 * after coming from user-space, before storing to rq->curr; this
  7774		 * barrier matches a full barrier in the proximity of the membarrier
  7775		 * system call exit.
  7776		 */
  7777		rq_lock(rq, &rf);
  7778		smp_mb__after_spinlock();
  7779	
  7780		/* Promote REQ to ACT */
  7781		rq->clock_update_flags <<= 1;
  7782		update_rq_clock(rq);
  7783		rq->clock_update_flags = RQCF_UPDATED;
  7784	
  7785		switch_count = &prev->nivcsw;
  7786	
  7787		/* Task state changes only considers SM_PREEMPT as preemption */
  7788		preempt = sched_mode == SM_PREEMPT;
  7789	
  7790		/*
  7791		 * We must load prev->state once (task_struct::state is volatile), such
  7792		 * that we form a control dependency vs deactivate_task() below.
  7793		 */
  7794		prev_state = READ_ONCE(prev->__state);
  7795		if (sched_mode == SM_IDLE) {
  7796			/* SCX must consult the BPF scheduler to tell if rq is empty */
  7797			if (!rq->nr_running && !scx_enabled()) {
  7798				next = prev;
  7799				goto picked;
  7800			}
  7801		} else if (!preempt && prev_state) {
  7802			/*
  7803			 * We pass task_is_blocked() as the should_block arg
  7804			 * in order to keep mutex-blocked tasks on the runqueue
  7805			 * for slection with proxy-exec (without proxy-exec
  7806			 * task_is_blocked() will always be false).
  7807			 */
  7808			block = try_to_block_task(rq, prev, &prev_state,
  7809						  !task_is_blocked(prev));
  7810			switch_count = &prev->nvcsw;
  7811		} else if (preempt && prev->blocked_on) {
  7812			/*
  7813			 * If we are SM_PREEMPT, we may have interrupted
  7814			 * after blocked_on was set, before schedule()
  7815			 * was run, preventing workques from running. So
  7816			 * clear blocked_on and mark task RUNNING so it
  7817			 * can be reselected to run and complete its
  7818			 * logic
  7819			 */
  7820			if (prev_state & TASK_NORMAL) {
  7821				WRITE_ONCE(prev->__state, TASK_RUNNING);
  7822				clear_task_blocked_on(prev, NULL);
  7823			}
  7824		}
  7825	
  7826		prev_not_proxied = !prev->blocked_donor;
  7827	
  7828		trace_sched_start_task_selection(prev, cpu, task_is_blocked(prev));
  7829	pick_again:
  7830		next = pick_next_task(rq, rq->donor, &rf);
  7831		rq_set_donor(rq, next);
  7832		next->blocked_donor = NULL;
  7833		if (unlikely(task_is_blocked(next))) {
  7834			next = find_proxy_task(rq, next, &rf);
  7835			if (!next) {
  7836				/* zap the balance_callbacks before picking again */
  7837				zap_balance_callbacks(rq);
  7838				goto pick_again;
  7839			}
  7840			if (next == rq->idle) {
  7841				zap_balance_callbacks(rq);
  7842				goto keep_resched;
  7843			}
  7844			if (rq->donor == prev_donor && prev != next) {
  7845				struct task_struct *donor = rq->donor;
  7846				/*
  7847				 * When transitioning like:
  7848				 *
  7849				 *         prev         next
  7850				 * donor:    B            B
  7851				 * curr:     A          B or C
  7852				 *
  7853				 * then put_prev_set_next_task() will not have done
  7854				 * anything, since B == B. However, A might have
  7855				 * missed a RT/DL balance opportunity due to being
  7856				 * on_cpu.
  7857				 */
  7858				donor->sched_class->put_prev_task(rq, donor, donor);
  7859				donor->sched_class->set_next_task(rq, donor, true);
  7860			}
  7861		}
  7862		trace_sched_finish_task_selection(rq->donor, next, cpu);
  7863	picked:
  7864		clear_tsk_need_resched(prev);
  7865		clear_preempt_need_resched();
  7866		trace_android_vh_clear_curr_lazy(prev);
  7867	keep_resched:
  7868	#ifdef CONFIG_SCHED_DEBUG
  7869		rq->last_seen_need_resched_ns = 0;
  7870	#endif
  7871	
  7872		trace_android_rvh_schedule(prev, next, rq);
  7873		if (likely(prev != next)) {
  7874			rq->nr_switches++;
  7875			/*
  7876			 * RCU users of rcu_dereference(rq->curr) may not see
  7877			 * changes to task_struct made by pick_next_task().
  7878			 */
  7879			RCU_INIT_POINTER(rq->curr, next);
  7880	
  7881			/*
  7882			 * The membarrier system call requires each architecture
  7883			 * to have a full memory barrier after updating
  7884			 * rq->curr, before returning to user-space.
  7885			 *
  7886			 * Here are the schemes providing that barrier on the
  7887			 * various architectures:
  7888			 * - mm ? switch_mm() : mmdrop() for x86, s390, sparc, PowerPC,
  7889			 *   RISC-V.  switch_mm() relies on membarrier_arch_switch_mm()
  7890			 *   on PowerPC and on RISC-V.
  7891			 * - finish_lock_switch() for weakly-ordered
  7892			 *   architectures where spin_unlock is a full barrier,
  7893			 * - switch_to() for arm64 (weakly-ordered, spin_unlock
  7894			 *   is a RELEASE barrier),
  7895			 *
  7896			 * The barrier matches a full barrier in the proximity of
  7897			 * the membarrier system call entry.
  7898			 *
  7899			 * On RISC-V, this barrier pairing is also needed for the
  7900			 * SYNC_CORE command when switching between processes, cf.
  7901			 * the inline comments in membarrier_arch_switch_mm().
  7902			 */
  7903			++*switch_count;
  7904	
  7905			migrate_disable_switch(rq, prev);
  7906			psi_account_irqtime(rq, prev, next);
  7907			psi_sched_switch(prev, next, !task_on_rq_queued(prev) ||
  7908						     prev->se.sched_delayed);
  7909	
  7910			trace_sched_switch(preempt, prev, next, prev_state);
  7911	
  7912			if (block && (prev_state & TASK_UNINTERRUPTIBLE)
  7913				&& trace_sched_blocked_reason_enabled()) {
  7914				unsigned long blocked_func = 0;
  7915	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
