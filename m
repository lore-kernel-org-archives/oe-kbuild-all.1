Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F005376490
	for <oe-kbuild-all@lists.linux.dev>; Tue,  7 Apr 2026 03:57:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775534263; cv=none; b=kF8g2fmQiVh6iU6s/MEyyYhKeKS9bHd6Tv3X7kp2OGhsTYkdyarknkPQg32tHKW0Yf9d2YIBAHK2F3z88UO8x9rf6OgRMiOgjXW7Y21CirHbN8nY7nzqso/47BglNwKlFerIGvS/dMM5p7gJiANKUPeo0bMZZZEUNJYuEqdEVTk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775534263; c=relaxed/simple;
	bh=4Dm0bnaDH+eTS+R2eMoQJtD52N/H+YUt7wBFqaztuEs=;
	h=Date:From:To:Cc:Subject:Message-ID; b=iNc2kaE0pAH1XFMVZnWa96lnzNDKRN1sqD+Fy97Ewi55N1zt2i9pRBJwJhJOwpumCCi3pjt4wsKoJD77qxlRuMaxbywX29BPS9fdZvqZmiPmCKJ4ChrfSeUUjph9O3pdHwy6rC9DxGpJw/VscD0QNtnT6moAG6f81UTCtjui/C4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AjdAByOm; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AjdAByOm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775534261; x=1807070261;
  h=date:from:to:cc:subject:message-id;
  bh=4Dm0bnaDH+eTS+R2eMoQJtD52N/H+YUt7wBFqaztuEs=;
  b=AjdAByOmHFIZdo7Y+eqzGua8qlWuzBsqCPfK2z7dCMRh8SMi9mt6L6bX
   XL5aKTd1f3ABQpzLYl0Ucw25E+J+Vy4Kg9d1vPXt5FUE+Rs5iyPyuUOvc
   LyuDHXYaFcGKjC8Owr2UgLASS1b/CrDHVURUmp/Hnx0NMHECye18lfvxg
   V4Kv32eh/k8oNbRZ78C+UhVe8JX6ib/NYUKgNhtiCnx/c38kYtCDgMMYu
   kkHxBU1W88yEfPG8DfGqc7oPVdks/W7pFQnj64jbB/UaKvz7WmByIOt8F
   gfXrvfswVtkCmoRBqR8UAhNJ5JjKlBL57orUGgP4+W4l5/JlwEDvyLquu
   Q==;
X-CSE-ConnectionGUID: A0wvZPVvRHak6ubs9I/skQ==
X-CSE-MsgGUID: MQD9dx8FQjSTAZDMyxfesA==
X-IronPort-AV: E=McAfee;i="6800,10657,11751"; a="80081103"
X-IronPort-AV: E=Sophos;i="6.23,164,1770624000"; 
   d="scan'208";a="80081103"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Apr 2026 20:57:38 -0700
X-CSE-ConnectionGUID: JyR2hFv7S6iyM+H4d2atNQ==
X-CSE-MsgGUID: ShjjYHbeQLia4NT/x9MWpA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,164,1770624000"; 
   d="scan'208";a="227995305"
Received: from lkp-server01.sh.intel.com (HELO d00eb8a6782a) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 06 Apr 2026 20:57:35 -0700
Received: from kbuild by d00eb8a6782a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w9xZE-0000000005N-3Ma8;
	Tue, 07 Apr 2026 03:57:32 +0000
Date: Tue, 07 Apr 2026 11:56:56 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android17-6.18 1/1]
 kernel/sched/core.c:7711:20: sparse: sparse: incorrect type in assignment
 (different address spaces)
Message-ID: <202604050458.UwqBlw5R-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android17-6.18
head:   ada21cf1539a8f6cc18fdcfef09428a01df5b627
commit: a8c5da5a2ee2415ecf2b25d625311d8c806eccc8 [1/1] ANDROID: sched: Fix potentially missing balancing with Proxy Exec
config: arm-randconfig-r131-20260405 (https://download.01.org/0day-ci/archive/20260405/202604050458.UwqBlw5R-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.5.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260405/202604050458.UwqBlw5R-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604050458.UwqBlw5R-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   kernel/sched/core.c:4263:29: sparse:     got struct rq *
   kernel/sched/core.c:4355:25: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct rq * @@
   kernel/sched/core.c:4355:25: sparse:     expected void const [noderef] __percpu *__vpp_verify
   kernel/sched/core.c:4355:25: sparse:     got struct rq *
   kernel/sched/core.c:4403:31: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct rq * @@
   kernel/sched/core.c:4403:31: sparse:     expected void const [noderef] __percpu *__vpp_verify
   kernel/sched/core.c:4403:31: sparse:     got struct rq *
   kernel/sched/core.c:4419:25: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct rq * @@
   kernel/sched/core.c:4419:25: sparse:     expected void const [noderef] __percpu *__vpp_verify
   kernel/sched/core.c:4419:25: sparse:     got struct rq *
   kernel/sched/core.c:4431:25: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct rq * @@
   kernel/sched/core.c:4431:25: sparse:     expected void const [noderef] __percpu *__vpp_verify
   kernel/sched/core.c:4431:25: sparse:     got struct rq *
   kernel/sched/core.c:4436:36: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct const *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/core.c:4436:36: sparse:     expected struct task_struct const *p
   kernel/sched/core.c:4436:36: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/core.c:4540:25: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct rq * @@
   kernel/sched/core.c:4540:25: sparse:     expected void const [noderef] __percpu *__vpp_verify
   kernel/sched/core.c:4540:25: sparse:     got struct rq *
   kernel/sched/core.c:4879:45: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct rq * @@
   kernel/sched/core.c:4879:45: sparse:     expected void const [noderef] __percpu *__vpp_verify
   kernel/sched/core.c:4879:45: sparse:     got struct rq *
   kernel/sched/core.c:4900:34: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct rq * @@
   kernel/sched/core.c:4900:34: sparse:     expected void const [noderef] __percpu *__vpp_verify
   kernel/sched/core.c:4900:34: sparse:     got struct rq *
   kernel/sched/core.c:5004:25: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct rq * @@
   kernel/sched/core.c:5004:25: sparse:     expected void const [noderef] __percpu *__vpp_verify
   kernel/sched/core.c:5004:25: sparse:     got struct rq *
   kernel/sched/core.c:5010:13: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct rq * @@
   kernel/sched/core.c:5010:13: sparse:     expected void const [noderef] __percpu *__vpp_verify
   kernel/sched/core.c:5010:13: sparse:     got struct rq *
   kernel/sched/core.c:5010:13: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct rq * @@
   kernel/sched/core.c:5010:13: sparse:     expected void const [noderef] __percpu *__vpp_verify
   kernel/sched/core.c:5010:13: sparse:     got struct rq *
   kernel/sched/core.c:5010:13: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct rq * @@
   kernel/sched/core.c:5010:13: sparse:     expected void const [noderef] __percpu *__vpp_verify
   kernel/sched/core.c:5010:13: sparse:     got struct rq *
   kernel/sched/core.c:5010:13: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct rq * @@
   kernel/sched/core.c:5010:13: sparse:     expected void const [noderef] __percpu *__vpp_verify
   kernel/sched/core.c:5010:13: sparse:     got struct rq *
   kernel/sched/core.c:5010:13: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct rq * @@
   kernel/sched/core.c:5010:13: sparse:     expected void const [noderef] __percpu *__vpp_verify
   kernel/sched/core.c:5010:13: sparse:     got struct rq *
   kernel/sched/core.c:5010:13: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct rq * @@
   kernel/sched/core.c:5010:13: sparse:     expected void const [noderef] __percpu *__vpp_verify
   kernel/sched/core.c:5010:13: sparse:     got struct rq *
   kernel/sched/core.c:5010:13: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct rq * @@
   kernel/sched/core.c:5010:13: sparse:     expected void const [noderef] __percpu *__vpp_verify
   kernel/sched/core.c:5010:13: sparse:     got struct rq *
   kernel/sched/core.c:5010:13: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct rq * @@
   kernel/sched/core.c:5010:13: sparse:     expected void const [noderef] __percpu *__vpp_verify
   kernel/sched/core.c:5010:13: sparse:     got struct rq *
   kernel/sched/core.c:5010:13: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct rq * @@
   kernel/sched/core.c:5010:13: sparse:     expected void const [noderef] __percpu *__vpp_verify
   kernel/sched/core.c:5010:13: sparse:     got struct rq *
   kernel/sched/core.c:5010:13: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct rq * @@
   kernel/sched/core.c:5010:13: sparse:     expected void const [noderef] __percpu *__vpp_verify
   kernel/sched/core.c:5010:13: sparse:     got struct rq *
   kernel/sched/core.c:5010:13: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct rq * @@
   kernel/sched/core.c:5010:13: sparse:     expected void const [noderef] __percpu *__vpp_verify
   kernel/sched/core.c:5010:13: sparse:     got struct rq *
   kernel/sched/core.c:5010:13: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct rq * @@
   kernel/sched/core.c:5010:13: sparse:     expected void const [noderef] __percpu *__vpp_verify
   kernel/sched/core.c:5010:13: sparse:     got struct rq *
   kernel/sched/core.c:5010:13: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct rq * @@
   kernel/sched/core.c:5010:13: sparse:     expected void const [noderef] __percpu *__vpp_verify
   kernel/sched/core.c:5010:13: sparse:     got struct rq *
   kernel/sched/core.c:5010:13: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct rq * @@
   kernel/sched/core.c:5010:13: sparse:     expected void const [noderef] __percpu *__vpp_verify
   kernel/sched/core.c:5010:13: sparse:     got struct rq *
   kernel/sched/core.c:5802:25: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct rq * @@
   kernel/sched/core.c:5802:25: sparse:     expected void const [noderef] __percpu *__vpp_verify
   kernel/sched/core.c:5802:25: sparse:     got struct rq *
   kernel/sched/core.c:5993:24: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct rq * @@
   kernel/sched/core.c:5993:24: sparse:     expected void const [noderef] __percpu *__vpp_verify
   kernel/sched/core.c:5993:24: sparse:     got struct rq *
   kernel/sched/core.c:6014:16: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct rq * @@
   kernel/sched/core.c:6014:16: sparse:     expected void const [noderef] __percpu *__vpp_verify
   kernel/sched/core.c:6014:16: sparse:     got struct rq *
   kernel/sched/core.c:6020:16: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct rq * @@
   kernel/sched/core.c:6020:16: sparse:     expected void const [noderef] __percpu *__vpp_verify
   kernel/sched/core.c:6020:16: sparse:     got struct rq *
   kernel/sched/core.c:6029:24: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct rq * @@
   kernel/sched/core.c:6029:24: sparse:     expected void const [noderef] __percpu *__vpp_verify
   kernel/sched/core.c:6029:24: sparse:     got struct rq *
   kernel/sched/core.c:6043:29: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct rq * @@
   kernel/sched/core.c:6043:29: sparse:     expected void const [noderef] __percpu *__vpp_verify
   kernel/sched/core.c:6043:29: sparse:     got struct rq *
   kernel/sched/core.c:6233:25: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct rq * @@
   kernel/sched/core.c:6233:25: sparse:     expected void const [noderef] __percpu *__vpp_verify
   kernel/sched/core.c:6233:25: sparse:     got struct rq *
   kernel/sched/core.c:6246:15: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct task_struct *donor @@     got struct task_struct [noderef] __rcu *donor @@
   kernel/sched/core.c:6246:15: sparse:     expected struct task_struct *donor
   kernel/sched/core.c:6246:15: sparse:     got struct task_struct [noderef] __rcu *donor
   kernel/sched/core.c:7709:14: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct rq * @@
   kernel/sched/core.c:7709:14: sparse:     expected void const [noderef] __percpu *__vpp_verify
   kernel/sched/core.c:7709:14: sparse:     got struct rq *
   kernel/sched/core.c:7710:14: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct task_struct *prev @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/core.c:7710:14: sparse:     expected struct task_struct *prev
   kernel/sched/core.c:7710:14: sparse:     got struct task_struct [noderef] __rcu *curr
>> kernel/sched/core.c:7711:20: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct task_struct *prev_donor @@     got struct task_struct [noderef] __rcu *donor @@
   kernel/sched/core.c:7711:20: sparse:     expected struct task_struct *prev_donor
   kernel/sched/core.c:7711:20: sparse:     got struct task_struct [noderef] __rcu *donor
   kernel/sched/core.c:7788:53: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *donor @@     got struct task_struct [noderef] __rcu *donor @@
   kernel/sched/core.c:7788:53: sparse:     expected struct task_struct *donor
   kernel/sched/core.c:7788:53: sparse:     got struct task_struct [noderef] __rcu *donor
   kernel/sched/core.c:7788:85: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *donor @@
   kernel/sched/core.c:7788:85: sparse:     expected struct task_struct *p
   kernel/sched/core.c:7788:85: sparse:     got struct task_struct [noderef] __rcu *donor
   kernel/sched/core.c:7793:58: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *donor @@     got struct task_struct [noderef] __rcu *donor @@
   kernel/sched/core.c:7793:58: sparse:     expected struct task_struct *donor
   kernel/sched/core.c:7793:58: sparse:     got struct task_struct [noderef] __rcu *donor
   kernel/sched/core.c:7793:90: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *donor @@
   kernel/sched/core.c:7793:90: sparse:     expected struct task_struct *p
   kernel/sched/core.c:7793:90: sparse:     got struct task_struct [noderef] __rcu *donor
   kernel/sched/core.c:7797:31: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/core.c:7797:31: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/core.c:7797:31: sparse:    struct task_struct *
   kernel/sched/core.c:8310:17: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/core.c:8310:17: sparse:    struct task_struct *
   kernel/sched/core.c:8310:17: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/core.c:8911:25: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct rq * @@
   kernel/sched/core.c:8911:25: sparse:     expected void const [noderef] __percpu *__vpp_verify
   kernel/sched/core.c:8911:25: sparse:     got struct rq *
   kernel/sched/core.c:9334:25: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct rq * @@
   kernel/sched/core.c:9334:25: sparse:     expected void const [noderef] __percpu *__vpp_verify
   kernel/sched/core.c:9334:25: sparse:     got struct rq *
   kernel/sched/core.c:9372:25: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct rq * @@
   kernel/sched/core.c:9372:25: sparse:     expected void const [noderef] __percpu *__vpp_verify
   kernel/sched/core.c:9372:25: sparse:     got struct rq *
   kernel/sched/core.c:9432:25: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct rq * @@
   kernel/sched/core.c:9432:25: sparse:     expected void const [noderef] __percpu *__vpp_verify
   kernel/sched/core.c:9432:25: sparse:     got struct rq *
   kernel/sched/core.c:9658:22: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct rq * @@
   kernel/sched/core.c:9658:22: sparse:     expected void const [noderef] __percpu *__vpp_verify
   kernel/sched/core.c:9658:22: sparse:     got struct rq *
   kernel/sched/core.c:11321:25: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct rq * @@
   kernel/sched/core.c:11321:25: sparse:     expected void const [noderef] __percpu *__vpp_verify
   kernel/sched/core.c:11321:25: sparse:     got struct rq *
   kernel/sched/core.c:11321:25: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/core.c:11321:25: sparse:     expected struct task_struct *p
   kernel/sched/core.c:11321:25: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/core.c:721:6: sparse: sparse: context imbalance in 'raw_spin_rq_lock_nested' - wrong count at exit
   kernel/sched/core.c:747:6: sparse: sparse: context imbalance in 'raw_spin_rq_trylock' - wrong count at exit
   kernel/sched/core.c:771:6: sparse: sparse: context imbalance in 'raw_spin_rq_unlock' - unexpected unlock
   kernel/sched/core.c:809:36: sparse: sparse: context imbalance in '__task_rq_lock' - wrong count at exit
   kernel/sched/core.c:851:36: sparse: sparse: context imbalance in 'task_rq_lock' - wrong count at exit
   kernel/sched/core.c: note: in included file:
   kernel/sched/pelt.h:117:13: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct task_struct const *p @@     got struct task_struct [noderef] __rcu *curr @@
   kernel/sched/pelt.h:117:13: sparse:     expected struct task_struct const *p
   kernel/sched/pelt.h:117:13: sparse:     got struct task_struct [noderef] __rcu *curr
   kernel/sched/core.c:2471:35: sparse: sparse: context imbalance in 'wait_task_inactive' - different lock contexts for basic block
   kernel/sched/core.c: note: in included file:
   kernel/sched/sched.h:2350:26: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2350:26: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2350:26: sparse:    struct task_struct *
   kernel/sched/sched.h:2563:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2563:9: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2563:9: sparse:    struct task_struct *
   kernel/sched/sched.h:2350:26: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2350:26: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2350:26: sparse:    struct task_struct *
   kernel/sched/sched.h:2339:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2339:25: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2339:25: sparse:    struct task_struct *
   kernel/sched/core.c:2353:38: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/core.c:2353:38: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/core.c:2353:38: sparse:    struct task_struct const *
   kernel/sched/sched.h:2350:26: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2350:26: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2350:26: sparse:    struct task_struct *
   kernel/sched/sched.h:2586:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2586:9: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2586:9: sparse:    struct task_struct *
   kernel/sched/sched.h:2586:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2586:9: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2586:9: sparse:    struct task_struct *
   kernel/sched/sched.h:2350:26: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2350:26: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2350:26: sparse:    struct task_struct *
   kernel/sched/sched.h:2563:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:2563:9: sparse:    struct task_struct [noderef] __rcu *
   kernel/sched/sched.h:2563:9: sparse:    struct task_struct *

vim +7711 kernel/sched/core.c

  7648	
  7649	/*
  7650	 * __schedule() is the main scheduler function.
  7651	 *
  7652	 * The main means of driving the scheduler and thus entering this function are:
  7653	 *
  7654	 *   1. Explicit blocking: mutex, semaphore, waitqueue, etc.
  7655	 *
  7656	 *   2. TIF_NEED_RESCHED flag is checked on interrupt and userspace return
  7657	 *      paths. For example, see arch/x86/entry_64.S.
  7658	 *
  7659	 *      To drive preemption between tasks, the scheduler sets the flag in timer
  7660	 *      interrupt handler sched_tick().
  7661	 *
  7662	 *   3. Wakeups don't really cause entry into schedule(). They add a
  7663	 *      task to the run-queue and that's it.
  7664	 *
  7665	 *      Now, if the new task added to the run-queue preempts the current
  7666	 *      task, then the wakeup sets TIF_NEED_RESCHED and schedule() gets
  7667	 *      called on the nearest possible occasion:
  7668	 *
  7669	 *       - If the kernel is preemptible (CONFIG_PREEMPTION=y):
  7670	 *
  7671	 *         - in syscall or exception context, at the next outmost
  7672	 *           preempt_enable(). (this might be as soon as the wake_up()'s
  7673	 *           spin_unlock()!)
  7674	 *
  7675	 *         - in IRQ context, return from interrupt-handler to
  7676	 *           preemptible context
  7677	 *
  7678	 *       - If the kernel is not preemptible (CONFIG_PREEMPTION is not set)
  7679	 *         then at the next:
  7680	 *
  7681	 *          - cond_resched() call
  7682	 *          - explicit schedule() call
  7683	 *          - return from syscall or exception to user-space
  7684	 *          - return from interrupt-handler to user-space
  7685	 *
  7686	 * WARNING: must be called with preemption disabled!
  7687	 */
  7688	static void __sched notrace __schedule(int sched_mode)
  7689	{
  7690		struct task_struct *prev, *next;
  7691		struct task_struct *prev_donor;
  7692		/*
  7693		 * On PREEMPT_RT kernel, SM_RTLOCK_WAIT is noted
  7694		 * as a preemption by schedule_debug() and RCU.
  7695		 */
  7696		bool preempt = sched_mode > SM_NONE;
  7697		bool is_switch = false;
  7698		unsigned long *switch_count;
  7699		unsigned long prev_state;
  7700		struct rq_flags rf;
  7701		struct rq *rq;
  7702		bool prev_not_proxied;
  7703		int cpu;
  7704	
  7705		/* Trace preemptions consistently with task switches */
  7706		trace_sched_entry_tp(sched_mode == SM_PREEMPT);
  7707	
  7708		cpu = smp_processor_id();
  7709		rq = cpu_rq(cpu);
  7710		prev = rq->curr;
> 7711		prev_donor = rq->donor;
  7712	
  7713		schedule_debug(prev, preempt);
  7714	
  7715		if (sched_feat(HRTICK) || sched_feat(HRTICK_DL))
  7716			hrtick_clear(rq);
  7717	
  7718		klp_sched_try_switch(prev);
  7719	
  7720		local_irq_disable();
  7721		rcu_note_context_switch(preempt);
  7722	
  7723		/*
  7724		 * Make sure that signal_pending_state()->signal_pending() below
  7725		 * can't be reordered with __set_current_state(TASK_INTERRUPTIBLE)
  7726		 * done by the caller to avoid the race with signal_wake_up():
  7727		 *
  7728		 * __set_current_state(@state)		signal_wake_up()
  7729		 * schedule()				  set_tsk_thread_flag(p, TIF_SIGPENDING)
  7730		 *					  wake_up_state(p, state)
  7731		 *   LOCK rq->lock			    LOCK p->pi_state
  7732		 *   smp_mb__after_spinlock()		    smp_mb__after_spinlock()
  7733		 *     if (signal_pending_state())	    if (p->state & @state)
  7734		 *
  7735		 * Also, the membarrier system call requires a full memory barrier
  7736		 * after coming from user-space, before storing to rq->curr; this
  7737		 * barrier matches a full barrier in the proximity of the membarrier
  7738		 * system call exit.
  7739		 */
  7740		rq_lock(rq, &rf);
  7741		smp_mb__after_spinlock();
  7742	
  7743		/* Promote REQ to ACT */
  7744		rq->clock_update_flags <<= 1;
  7745		update_rq_clock(rq);
  7746		rq->clock_update_flags = RQCF_UPDATED;
  7747	
  7748		switch_count = &prev->nivcsw;
  7749	
  7750		/* Task state changes only considers SM_PREEMPT as preemption */
  7751		preempt = sched_mode == SM_PREEMPT;
  7752	
  7753		/*
  7754		 * We must load prev->state once (task_struct::state is volatile), such
  7755		 * that we form a control dependency vs deactivate_task() below.
  7756		 */
  7757		prev_state = READ_ONCE(prev->__state);
  7758		if (sched_mode == SM_IDLE) {
  7759			/* SCX must consult the BPF scheduler to tell if rq is empty */
  7760			if (!rq->nr_running && !scx_enabled()) {
  7761				next = prev;
  7762				goto picked;
  7763			}
  7764		} else if (!preempt && prev_state) {
  7765			/*
  7766			 * We pass task_is_blocked() as the should_block arg
  7767			 * in order to keep mutex-blocked tasks on the runqueue
  7768			 * for slection with proxy-exec (without proxy-exec
  7769			 * task_is_blocked() will always be false).
  7770			 */
  7771			try_to_block_task(rq, prev, &prev_state,
  7772					  !task_is_blocked(prev));
  7773			switch_count = &prev->nvcsw;
  7774		}
  7775	
  7776		prev_not_proxied = !prev->blocked_donor;
  7777	
  7778		trace_sched_start_task_selection(prev, cpu, task_is_blocked(prev));
  7779	pick_again:
  7780		assert_balance_callbacks_empty(rq);
  7781		next = pick_next_task(rq, &rf);
  7782		rq_set_donor(rq, next);
  7783		next->blocked_donor = NULL;
  7784		if (unlikely(task_is_blocked(next))) {
  7785			next = find_proxy_task(rq, next, &rf);
  7786			if (!next) {
  7787				/* zap the balance_callbacks before picking again */
  7788				trace_sched_picking_again(rq->donor, cpu, task_is_blocked(rq->donor));
  7789				zap_balance_callbacks(rq);
  7790				goto pick_again;
  7791			}
  7792			if (next == rq->idle) {
  7793				trace_sched_proxy_resched_idle(rq->donor, cpu, task_is_blocked(rq->donor));
  7794				zap_balance_callbacks(rq);
  7795				goto keep_resched;
  7796			}
  7797			if (rq->donor == prev_donor && prev != next) {
  7798				struct task_struct *donor = rq->donor;
  7799				/*
  7800				 * When transitioning like:
  7801				 *
  7802				 *         prev         next
  7803				 * donor:    B            B
  7804				 * curr:     A          B or C
  7805				 *
  7806				 * then put_prev_set_next_task() will not have done
  7807				 * anything, since B == B. However, A might have
  7808				 * missed a RT/DL balance opportunity due to being
  7809				 * on_cpu.
  7810				 */
  7811				donor->sched_class->put_prev_task(rq, donor, donor);
  7812				donor->sched_class->set_next_task(rq, donor, true);
  7813			}
  7814			trace_sched_found_proxy_task(rq->donor, next, cpu);
  7815		}
  7816		trace_sched_finish_task_selection(rq->donor, next, cpu);
  7817	picked:
  7818		clear_tsk_need_resched(prev);
  7819		clear_preempt_need_resched();
  7820	keep_resched:
  7821		rq->last_seen_need_resched_ns = 0;
  7822	
  7823		trace_android_rvh_schedule(prev, next, rq);
  7824		is_switch = prev != next;
  7825		if (likely(is_switch)) {
  7826			rq->nr_switches++;
  7827			/*
  7828			 * RCU users of rcu_dereference(rq->curr) may not see
  7829			 * changes to task_struct made by pick_next_task().
  7830			 */
  7831			RCU_INIT_POINTER(rq->curr, next);
  7832	
  7833			/*
  7834			 * The membarrier system call requires each architecture
  7835			 * to have a full memory barrier after updating
  7836			 * rq->curr, before returning to user-space.
  7837			 *
  7838			 * Here are the schemes providing that barrier on the
  7839			 * various architectures:
  7840			 * - mm ? switch_mm() : mmdrop() for x86, s390, sparc, PowerPC,
  7841			 *   RISC-V.  switch_mm() relies on membarrier_arch_switch_mm()
  7842			 *   on PowerPC and on RISC-V.
  7843			 * - finish_lock_switch() for weakly-ordered
  7844			 *   architectures where spin_unlock is a full barrier,
  7845			 * - switch_to() for arm64 (weakly-ordered, spin_unlock
  7846			 *   is a RELEASE barrier),
  7847			 *
  7848			 * The barrier matches a full barrier in the proximity of
  7849			 * the membarrier system call entry.
  7850			 *
  7851			 * On RISC-V, this barrier pairing is also needed for the
  7852			 * SYNC_CORE command when switching between processes, cf.
  7853			 * the inline comments in membarrier_arch_switch_mm().
  7854			 */
  7855			++*switch_count;
  7856	
  7857			migrate_disable_switch(rq, prev);
  7858			psi_account_irqtime(rq, prev, next);
  7859			psi_sched_switch(prev, next, !task_on_rq_queued(prev) ||
  7860						     prev->se.sched_delayed);
  7861	
  7862			trace_sched_switch(preempt, prev, next, prev_state);
  7863	
  7864			/* Also unlocks the rq: */
  7865			rq = context_switch(rq, prev, next, &rf);
  7866		} else {
  7867			rq_unpin_lock(rq, &rf);
  7868			__balance_callbacks(rq);
  7869			raw_spin_rq_unlock_irq(rq);
  7870		}
  7871		trace_sched_exit_tp(is_switch);
  7872	}
  7873	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
