Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10387511E8D
	for <oe-kbuild-all@lists.linux.dev>; Fri,  4 Sep 2026 17:55:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788544555; cv=none; b=WS3wMmIKycAJSbkly9qRul8fqwYKOkTtoPBCn8QcGwS3LAJriQkZWHyuygdiaQD2ysKWV7y6r2Yw7ljyAw8FQIhtUMD2WezDL/1x5FdjwZOO2UTvSoG9elcEjZUk3qYtyGXYcz16vWAMxoI61S3Kyi2APy4QGSsps7oG0Od/vS4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788544555; c=relaxed/simple;
	bh=fA/XvqwO3TWLpuNUjY+6gw0Ch/Ql6uuoYASkSTlHmYQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Fyr1+sYUgjobosv1a8QX43NBh5U/7GyyaQCu5Xf+qpkwQbH2IKTFoFIHCwjeIl0jRLaWhClLZa+OHHr9X7IE3Ot61oIOxTb3iQKtwlLvmbP1qkXr3cY2Z+YblZJrqe4vQYNX6qbUBDDZYHMqjvYH8z5EXLFPc9B1qjM+HxlM2j4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ASY4s6hY; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ASY4s6hY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788544553; x=1820080553;
  h=date:from:to:cc:subject:message-id;
  bh=fA/XvqwO3TWLpuNUjY+6gw0Ch/Ql6uuoYASkSTlHmYQ=;
  b=ASY4s6hYuC6u5IbDlrDuCqWjE7JlVavixWIcbO6/GyEyX+9b/lbxJl9S
   +fM/s8bk6licmS9fM8RU6P9PxL3QGS/5AQ7OiZ8bPHRYOBXj/gCjdgQsH
   a7fmWo1j4du7oJZTSdZ1imEMjQXwk4OCfKtI+d8ja3zRjo0xG2LmL3FN3
   I7aok/i3CTY6YnEOk6MITRM4ekQG3buL6aDiS18ynjzW39P5JJqBA6FKs
   Xs7wDPhSfykag/WgaVvUMmlblg0W/ywq994VsWWCMym4tbTPtboxIUas4
   Fr2gvh6cVsHwIUDEwK8NJIjggdULtgRDrluXHx3UJeVBLXOsLboojXYOW
   A==;
X-CSE-ConnectionGUID: 0CVnei7hQ+q5dDcnIvODKg==
X-CSE-MsgGUID: 6+iey1BbRI6bFW1Dp/a1Uw==
X-IronPort-AV: E=McAfee;i="6800,10657,11896"; a="88195190"
X-IronPort-AV: E=Sophos;i="6.25,262,1779174000"; 
   d="scan'208";a="88195190"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Sep 2026 10:55:52 -0700
X-CSE-ConnectionGUID: mB5UGa4uTR6OG6Ni5t5JEg==
X-CSE-MsgGUID: quhEzKvMRsepICcZe5HTSw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,262,1779174000"; 
   d="scan'208";a="267523431"
Received: from lkp-server01.sh.intel.com (HELO bfac249b2189) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 04 Sep 2026 10:55:50 -0700
Received: from kbuild by bfac249b2189 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x2Y8h-00000000A2M-3EvP;
	Fri, 04 Sep 2026 17:55:47 +0000
Date: Sat, 05 Sep 2026 01:55:26 +0800
From: kernel test robot <lkp@intel.com>
To: Oleg Nesterov <oleg@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev, Kees Cook <kees@kernel.org>
Subject: [kees:for-next/hardening 3/5] fs/signalfd.c:53:40: sparse:
 sparse: incorrect type in initializer (different address spaces)
Message-ID: <202609050133.FiFJjPsm-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/kees/linux.git for-next/hardening
head:   8d799af8b1b6f35fb1879e2e32c0a4d310984c7b
commit: 37eadcb919b02a742582de781097b455f7b16d76 [3/5] signalfd: don't dequeue the forced fatal signals
config: i386-randconfig-061-20260904 (https://download.01.org/0day-ci/archive/20260905/202609050133.FiFJjPsm-lkp@intel.com/config)
compiler: gcc-13 (Debian 13.3.0-16) 13.3.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260905/202609050133.FiFJjPsm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609050133.FiFJjPsm-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> fs/signalfd.c:53:40: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct k_sigaction *k @@     got struct k_sigaction [noderef] __rcu * @@
   fs/signalfd.c:53:40: sparse:     expected struct k_sigaction *k
   fs/signalfd.c:53:40: sparse:     got struct k_sigaction [noderef] __rcu *
   fs/signalfd.c:69:33: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct wait_queue_head [usertype] *wait_address @@     got struct wait_queue_head [noderef] __rcu * @@
   fs/signalfd.c:69:33: sparse:     expected struct wait_queue_head [usertype] *wait_address
   fs/signalfd.c:69:33: sparse:     got struct wait_queue_head [noderef] __rcu *
   fs/signalfd.c:71:31: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   fs/signalfd.c:71:31: sparse:     expected struct spinlock [usertype] *lock
   fs/signalfd.c:71:31: sparse:     got struct spinlock [noderef] __rcu *
   fs/signalfd.c:76:33: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   fs/signalfd.c:76:33: sparse:     expected struct spinlock [usertype] *lock
   fs/signalfd.c:76:33: sparse:     got struct spinlock [noderef] __rcu *
   fs/signalfd.c:110:32: sparse: sparse: cast removes address space '__user' of expression
   fs/signalfd.c:128:33: sparse: sparse: cast removes address space '__user' of expression
   fs/signalfd.c:131:33: sparse: sparse: cast removes address space '__user' of expression
   fs/signalfd.c:135:33: sparse: sparse: cast removes address space '__user' of expression
   fs/signalfd.c:151:32: sparse: sparse: cast removes address space '__user' of expression
   fs/signalfd.c:155:38: sparse: sparse: cast removes address space '__user' of expression
   fs/signalfd.c:175:31: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   fs/signalfd.c:175:31: sparse:     expected struct spinlock [usertype] *lock
   fs/signalfd.c:175:31: sparse:     got struct spinlock [noderef] __rcu *
   fs/signalfd.c:185:41: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   fs/signalfd.c:185:41: sparse:     expected struct spinlock [usertype] *lock
   fs/signalfd.c:185:41: sparse:     got struct spinlock [noderef] __rcu *
   fs/signalfd.c:189:32: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct wait_queue_head *wq_head @@     got struct wait_queue_head [noderef] __rcu * @@
   fs/signalfd.c:189:32: sparse:     expected struct wait_queue_head *wq_head
   fs/signalfd.c:189:32: sparse:     got struct wait_queue_head [noderef] __rcu *
   fs/signalfd.c:199:41: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   fs/signalfd.c:199:41: sparse:     expected struct spinlock [usertype] *lock
   fs/signalfd.c:199:41: sparse:     got struct spinlock [noderef] __rcu *
   fs/signalfd.c:201:39: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   fs/signalfd.c:201:39: sparse:     expected struct spinlock [usertype] *lock
   fs/signalfd.c:201:39: sparse:     got struct spinlock [noderef] __rcu *
   fs/signalfd.c:204:33: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   fs/signalfd.c:204:33: sparse:     expected struct spinlock [usertype] *lock
   fs/signalfd.c:204:33: sparse:     got struct spinlock [noderef] __rcu *
   fs/signalfd.c:206:35: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct wait_queue_head *wq_head @@     got struct wait_queue_head [noderef] __rcu * @@
   fs/signalfd.c:206:35: sparse:     expected struct wait_queue_head *wq_head
   fs/signalfd.c:206:35: sparse:     got struct wait_queue_head [noderef] __rcu *
   fs/signalfd.c:305:39: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   fs/signalfd.c:305:39: sparse:     expected struct spinlock [usertype] *lock
   fs/signalfd.c:305:39: sparse:     got struct spinlock [noderef] __rcu *
   fs/signalfd.c:307:41: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct spinlock [usertype] *lock @@     got struct spinlock [noderef] __rcu * @@
   fs/signalfd.c:307:41: sparse:     expected struct spinlock [usertype] *lock
   fs/signalfd.c:307:41: sparse:     got struct spinlock [noderef] __rcu *
   fs/signalfd.c:309:17: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct wait_queue_head *wq_head @@     got struct wait_queue_head [noderef] __rcu * @@
   fs/signalfd.c:309:17: sparse:     expected struct wait_queue_head *wq_head
   fs/signalfd.c:309:17: sparse:     got struct wait_queue_head [noderef] __rcu *

vim +53 fs/signalfd.c

    50	
    51	static void refine_sigmask(struct signalfd_ctx *ctx, sigset_t *sigmask)
    52	{
  > 53		struct k_sigaction *k = current->sighand->action;
    54		int n;
    55	
    56		*sigmask = ctx->sigmask;
    57		for (n = 1; n <= _NSIG; ++n, ++k) {
    58			if (k->sa.sa_flags & SA_IMMUTABLE)
    59				sigaddset(sigmask, n);
    60		}
    61	}
    62	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
