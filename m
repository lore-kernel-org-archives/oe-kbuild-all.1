Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F18563368B7
	for <oe-kbuild-all@lists.linux.dev>; Thu,  5 Mar 2026 01:06:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772672820; cv=none; b=gAdWWUHccRipTCkUlcGmcygnDmFfPBV5FFeTDk/Rh9oRTOR0uVNT5Li66yGsnzPTr/OnbIfj3XrUT2W+USQAeozZJ9xwqtGY/tBvMZ2YLjh3lPKFkC+BS2+gJHACEXyHSMZVqaThumLyG/Yw6dydtPTQNHFpX7p+cT9wuf2ls44=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772672820; c=relaxed/simple;
	bh=RoFiYj0mdXv8Bnl+L1lPnzntEdDjvH75InjGQmA7dMI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=mMIrKpuI15wHqqBSXvRU9lXw0mYdvyWhKiIuNchTZs5BtGr1FolxJ0xRbnwmmFsfNjMSwKmDa0VnzvoNH/TyEMqaQ/olc1xp2GLkxzNvY9LMcLhhqwCl4smd33aT2nRWdr2Qm2ku7260fWOVUq/nQRkoVWs4DygFQ4zOUgzOHJY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Qa1MC5qr; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Qa1MC5qr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772672818; x=1804208818;
  h=date:from:to:cc:subject:message-id;
  bh=RoFiYj0mdXv8Bnl+L1lPnzntEdDjvH75InjGQmA7dMI=;
  b=Qa1MC5qrtAfTLwWHzLHKZNhMggaHGm+upKyd+Trhgt1QSFCNHXoomnKs
   nWZq68lJHJc8UA+yzsWlMvZVVFYyJ3zg0tSIqCdfuCSUtLFwhvrwrhIDV
   ngRXHRA/wb8rBu0ZwUP5YR2HqnFxrPJMcKTWCMtc3PoYvDRz1m6VVB5KW
   Pr297M5f9WapgJ29ugDqEaw0nzvnTILtgi9J8r/K3d65ZBVMreBbc6z+E
   OEE9CSARKLck16IE3kNkIqDB/fM5qKcSEONI653IhuKFviPJJoC3H8M8F
   GnnmTtjNs196ag/2Dibz3f09R/wW2VMv1tObNKbE+DRhSmGA+4ShguCMb
   Q==;
X-CSE-ConnectionGUID: cPE/D0/hT5mfIjmHiA2E9w==
X-CSE-MsgGUID: MOXBt2BhQQaSBJX0jg8+CA==
X-IronPort-AV: E=McAfee;i="6800,10657,11719"; a="84084246"
X-IronPort-AV: E=Sophos;i="6.21,325,1763452800"; 
   d="scan'208";a="84084246"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2026 17:06:57 -0800
X-CSE-ConnectionGUID: SPqvPcCYQYyuhcHtaCjRjA==
X-CSE-MsgGUID: vFLHf1aiRKyUeIM9OE7MHw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,325,1763452800"; 
   d="scan'208";a="216353094"
Received: from lkp-server01.sh.intel.com (HELO f27a57aa7a36) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 04 Mar 2026 17:06:55 -0800
Received: from kbuild by f27a57aa7a36 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vxxAy-000000004tR-3wnS;
	Thu, 05 Mar 2026 01:06:52 +0000
Date: Thu, 05 Mar 2026 09:06:49 +0800
From: kernel test robot <lkp@intel.com>
To: Marco Elver <elver@google.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Peter Zijlstra <peterz@infradead.org>
Subject: kernel/kcov.c:877:9: sparse: sparse: incorrect type in
 argument 1 (different base types)
Message-ID: <202603050933.Q4XeFgSb-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   0b3bb205808195159be633a8cefb602670e856fb
commit: 6556fde265a7bd408ad8ff15ec08970f99f6201c kcov: Enable context analysis
date:   8 weeks ago
config: powerpc64-randconfig-r111-20260304 (https://download.01.org/0day-ci/archive/20260305/202603050933.Q4XeFgSb-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 9a109fbb6e184ec9bcce10615949f598f4c974a9)
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260305/202603050933.Q4XeFgSb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603050933.Q4XeFgSb-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   kernel/kcov.c: note: in included file (through include/linux/local_lock.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/local_lock_internal.h:332:40: sparse: sparse: multiple definitions for function '__this_cpu_local_lock'
   include/linux/local_lock_internal.h:326:37: sparse:  the previous one is here
>> kernel/kcov.c:877:9: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct local_trylock [noderef] [usertype] __percpu *base @@     got struct local_lock [noderef] __percpu * @@
   kernel/kcov.c:877:9: sparse:     expected struct local_trylock [noderef] [usertype] __percpu *base
   kernel/kcov.c:877:9: sparse:     got struct local_lock [noderef] __percpu *
>> kernel/kcov.c:877:9: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct local_trylock [noderef] [usertype] __percpu *base @@     got struct local_lock [noderef] __percpu * @@
   kernel/kcov.c:877:9: sparse:     expected struct local_trylock [noderef] [usertype] __percpu *base
   kernel/kcov.c:877:9: sparse:     got struct local_lock [noderef] __percpu *
   kernel/kcov.c:885:17: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct local_trylock [noderef] [usertype] __percpu *base @@     got struct local_lock [noderef] __percpu * @@
   kernel/kcov.c:885:17: sparse:     expected struct local_trylock [noderef] [usertype] __percpu *base
   kernel/kcov.c:885:17: sparse:     got struct local_lock [noderef] __percpu *
   kernel/kcov.c:885:17: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct local_trylock [noderef] [usertype] __percpu *base @@     got struct local_lock [noderef] __percpu * @@
   kernel/kcov.c:885:17: sparse:     expected struct local_trylock [noderef] [usertype] __percpu *base
   kernel/kcov.c:885:17: sparse:     got struct local_lock [noderef] __percpu *
   kernel/kcov.c:894:17: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct local_trylock [noderef] [usertype] __percpu *base @@     got struct local_lock [noderef] __percpu * @@
   kernel/kcov.c:894:17: sparse:     expected struct local_trylock [noderef] [usertype] __percpu *base
   kernel/kcov.c:894:17: sparse:     got struct local_lock [noderef] __percpu *
   kernel/kcov.c:894:17: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct local_trylock [noderef] [usertype] __percpu *base @@     got struct local_lock [noderef] __percpu * @@
   kernel/kcov.c:894:17: sparse:     expected struct local_trylock [noderef] [usertype] __percpu *base
   kernel/kcov.c:894:17: sparse:     got struct local_lock [noderef] __percpu *
   kernel/kcov.c:902:17: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct local_trylock [noderef] [usertype] __percpu *base @@     got struct local_lock [noderef] __percpu * @@
   kernel/kcov.c:902:17: sparse:     expected struct local_trylock [noderef] [usertype] __percpu *base
   kernel/kcov.c:902:17: sparse:     got struct local_lock [noderef] __percpu *
   kernel/kcov.c:902:17: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct local_trylock [noderef] [usertype] __percpu *base @@     got struct local_lock [noderef] __percpu * @@
   kernel/kcov.c:902:17: sparse:     expected struct local_trylock [noderef] [usertype] __percpu *base
   kernel/kcov.c:902:17: sparse:     got struct local_lock [noderef] __percpu *
   kernel/kcov.c:929:17: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct local_trylock [noderef] [usertype] __percpu *base @@     got struct local_lock [noderef] __percpu * @@
   kernel/kcov.c:929:17: sparse:     expected struct local_trylock [noderef] [usertype] __percpu *base
   kernel/kcov.c:929:17: sparse:     got struct local_lock [noderef] __percpu *
   kernel/kcov.c:929:17: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct local_trylock [noderef] [usertype] __percpu *base @@     got struct local_lock [noderef] __percpu * @@
   kernel/kcov.c:929:17: sparse:     expected struct local_trylock [noderef] [usertype] __percpu *base
   kernel/kcov.c:929:17: sparse:     got struct local_lock [noderef] __percpu *
   kernel/kcov.c:935:17: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct local_trylock [noderef] [usertype] __percpu *base @@     got struct local_lock [noderef] __percpu * @@
   kernel/kcov.c:935:17: sparse:     expected struct local_trylock [noderef] [usertype] __percpu *base
   kernel/kcov.c:935:17: sparse:     got struct local_lock [noderef] __percpu *
   kernel/kcov.c:935:17: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct local_trylock [noderef] [usertype] __percpu *base @@     got struct local_lock [noderef] __percpu * @@
   kernel/kcov.c:935:17: sparse:     expected struct local_trylock [noderef] [usertype] __percpu *base
   kernel/kcov.c:935:17: sparse:     got struct local_lock [noderef] __percpu *
   kernel/kcov.c:947:9: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct local_trylock [noderef] [usertype] __percpu *base @@     got struct local_lock [noderef] __percpu * @@
   kernel/kcov.c:947:9: sparse:     expected struct local_trylock [noderef] [usertype] __percpu *base
   kernel/kcov.c:947:9: sparse:     got struct local_lock [noderef] __percpu *
   kernel/kcov.c:947:9: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct local_trylock [noderef] [usertype] __percpu *base @@     got struct local_lock [noderef] __percpu * @@
   kernel/kcov.c:947:9: sparse:     expected struct local_trylock [noderef] [usertype] __percpu *base
   kernel/kcov.c:947:9: sparse:     got struct local_lock [noderef] __percpu *
   kernel/kcov.c:1030:9: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct local_trylock [noderef] [usertype] __percpu *base @@     got struct local_lock [noderef] __percpu * @@
   kernel/kcov.c:1030:9: sparse:     expected struct local_trylock [noderef] [usertype] __percpu *base
   kernel/kcov.c:1030:9: sparse:     got struct local_lock [noderef] __percpu *
   kernel/kcov.c:1030:9: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct local_trylock [noderef] [usertype] __percpu *base @@     got struct local_lock [noderef] __percpu * @@
   kernel/kcov.c:1030:9: sparse:     expected struct local_trylock [noderef] [usertype] __percpu *base
   kernel/kcov.c:1030:9: sparse:     got struct local_lock [noderef] __percpu *
   kernel/kcov.c:1035:17: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct local_trylock [noderef] [usertype] __percpu *base @@     got struct local_lock [noderef] __percpu * @@
   kernel/kcov.c:1035:17: sparse:     expected struct local_trylock [noderef] [usertype] __percpu *base
   kernel/kcov.c:1035:17: sparse:     got struct local_lock [noderef] __percpu *
   kernel/kcov.c:1035:17: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct local_trylock [noderef] [usertype] __percpu *base @@     got struct local_lock [noderef] __percpu * @@
   kernel/kcov.c:1035:17: sparse:     expected struct local_trylock [noderef] [usertype] __percpu *base
   kernel/kcov.c:1035:17: sparse:     got struct local_lock [noderef] __percpu *
   kernel/kcov.c:1043:17: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct local_trylock [noderef] [usertype] __percpu *base @@     got struct local_lock [noderef] __percpu * @@
   kernel/kcov.c:1043:17: sparse:     expected struct local_trylock [noderef] [usertype] __percpu *base
   kernel/kcov.c:1043:17: sparse:     got struct local_lock [noderef] __percpu *
   kernel/kcov.c:1043:17: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct local_trylock [noderef] [usertype] __percpu *base @@     got struct local_lock [noderef] __percpu * @@
   kernel/kcov.c:1043:17: sparse:     expected struct local_trylock [noderef] [usertype] __percpu *base
   kernel/kcov.c:1043:17: sparse:     got struct local_lock [noderef] __percpu *
   kernel/kcov.c:1048:17: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct local_trylock [noderef] [usertype] __percpu *base @@     got struct local_lock [noderef] __percpu * @@
   kernel/kcov.c:1048:17: sparse:     expected struct local_trylock [noderef] [usertype] __percpu *base
   kernel/kcov.c:1048:17: sparse:     got struct local_lock [noderef] __percpu *
   kernel/kcov.c:1048:17: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct local_trylock [noderef] [usertype] __percpu *base @@     got struct local_lock [noderef] __percpu * @@
   kernel/kcov.c:1048:17: sparse:     expected struct local_trylock [noderef] [usertype] __percpu *base
   kernel/kcov.c:1048:17: sparse:     got struct local_lock [noderef] __percpu *
   kernel/kcov.c:1078:9: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct local_trylock [noderef] [usertype] __percpu *base @@     got struct local_lock [noderef] __percpu * @@
   kernel/kcov.c:1078:9: sparse:     expected struct local_trylock [noderef] [usertype] __percpu *base
   kernel/kcov.c:1078:9: sparse:     got struct local_lock [noderef] __percpu *
   kernel/kcov.c:1078:9: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected struct local_trylock [noderef] [usertype] __percpu *base @@     got struct local_lock [noderef] __percpu * @@
   kernel/kcov.c:1078:9: sparse:     expected struct local_trylock [noderef] [usertype] __percpu *base
   kernel/kcov.c:1078:9: sparse:     got struct local_lock [noderef] __percpu *

vim +877 kernel/kcov.c

5ff3b30ab57da8 Andrey Konovalov          2020-06-04  860  
eec028c9386ed1 Andrey Konovalov          2019-12-04  861  void kcov_remote_start(u64 handle)
eec028c9386ed1 Andrey Konovalov          2019-12-04  862  {
5fe7042dc0a2e8 Andrey Konovalov          2020-06-04  863  	struct task_struct *t = current;
eec028c9386ed1 Andrey Konovalov          2019-12-04  864  	struct kcov_remote *remote;
67b3d3cca38550 Andrey Konovalov          2020-06-04  865  	struct kcov *kcov;
5fe7042dc0a2e8 Andrey Konovalov          2020-06-04  866  	unsigned int mode;
eec028c9386ed1 Andrey Konovalov          2019-12-04  867  	void *area;
eec028c9386ed1 Andrey Konovalov          2019-12-04  868  	unsigned int size;
eec028c9386ed1 Andrey Konovalov          2019-12-04  869  	int sequence;
5ff3b30ab57da8 Andrey Konovalov          2020-06-04  870  	unsigned long flags;
eec028c9386ed1 Andrey Konovalov          2019-12-04  871  
eec028c9386ed1 Andrey Konovalov          2019-12-04  872  	if (WARN_ON(!kcov_check_handle(handle, true, true, true)))
eec028c9386ed1 Andrey Konovalov          2019-12-04  873  		return;
7d4df2dad312f2 Andrey Konovalov          2024-07-29  874  	if (!in_task() && !in_softirq_really())
eec028c9386ed1 Andrey Konovalov          2019-12-04  875  		return;
5fe7042dc0a2e8 Andrey Konovalov          2020-06-04  876  
d5d2c51f1e5f56 Sebastian Andrzej Siewior 2021-11-08 @877  	local_lock_irqsave(&kcov_percpu_data.lock, flags);
5ff3b30ab57da8 Andrey Konovalov          2020-06-04  878  
eec028c9386ed1 Andrey Konovalov          2019-12-04  879  	/*
5ff3b30ab57da8 Andrey Konovalov          2020-06-04  880  	 * Check that kcov_remote_start() is not called twice in background
5ff3b30ab57da8 Andrey Konovalov          2020-06-04  881  	 * threads nor called by user tasks (with enabled kcov).
eec028c9386ed1 Andrey Konovalov          2019-12-04  882  	 */
5fe7042dc0a2e8 Andrey Konovalov          2020-06-04  883  	mode = READ_ONCE(t->kcov_mode);
5ff3b30ab57da8 Andrey Konovalov          2020-06-04  884  	if (WARN_ON(in_task() && kcov_mode_enabled(mode))) {
d5d2c51f1e5f56 Sebastian Andrzej Siewior 2021-11-08  885  		local_unlock_irqrestore(&kcov_percpu_data.lock, flags);
eec028c9386ed1 Andrey Konovalov          2019-12-04  886  		return;
5ff3b30ab57da8 Andrey Konovalov          2020-06-04  887  	}
5ff3b30ab57da8 Andrey Konovalov          2020-06-04  888  	/*
5ff3b30ab57da8 Andrey Konovalov          2020-06-04  889  	 * Check that kcov_remote_start() is not called twice in softirqs.
5ff3b30ab57da8 Andrey Konovalov          2020-06-04  890  	 * Note, that kcov_remote_start() can be called from a softirq that
5ff3b30ab57da8 Andrey Konovalov          2020-06-04  891  	 * happened while collecting coverage from a background thread.
5ff3b30ab57da8 Andrey Konovalov          2020-06-04  892  	 */
5ff3b30ab57da8 Andrey Konovalov          2020-06-04  893  	if (WARN_ON(in_serving_softirq() && t->kcov_softirq)) {
d5d2c51f1e5f56 Sebastian Andrzej Siewior 2021-11-08  894  		local_unlock_irqrestore(&kcov_percpu_data.lock, flags);
5ff3b30ab57da8 Andrey Konovalov          2020-06-04  895  		return;
5ff3b30ab57da8 Andrey Konovalov          2020-06-04  896  	}
eec028c9386ed1 Andrey Konovalov          2019-12-04  897  
eec028c9386ed1 Andrey Konovalov          2019-12-04  898  	spin_lock(&kcov_remote_lock);
eec028c9386ed1 Andrey Konovalov          2019-12-04  899  	remote = kcov_remote_find(handle);
eec028c9386ed1 Andrey Konovalov          2019-12-04  900  	if (!remote) {
d5d2c51f1e5f56 Sebastian Andrzej Siewior 2021-11-08  901  		spin_unlock(&kcov_remote_lock);
d5d2c51f1e5f56 Sebastian Andrzej Siewior 2021-11-08  902  		local_unlock_irqrestore(&kcov_percpu_data.lock, flags);
eec028c9386ed1 Andrey Konovalov          2019-12-04  903  		return;
eec028c9386ed1 Andrey Konovalov          2019-12-04  904  	}
5ff3b30ab57da8 Andrey Konovalov          2020-06-04  905  	kcov_debug("handle = %llx, context: %s\n", handle,
5ff3b30ab57da8 Andrey Konovalov          2020-06-04  906  			in_task() ? "task" : "softirq");
67b3d3cca38550 Andrey Konovalov          2020-06-04  907  	kcov = remote->kcov;
eec028c9386ed1 Andrey Konovalov          2019-12-04  908  	/* Put in kcov_remote_stop(). */
67b3d3cca38550 Andrey Konovalov          2020-06-04  909  	kcov_get(kcov);
eec028c9386ed1 Andrey Konovalov          2019-12-04  910  	/*
6556fde265a7bd Marco Elver               2025-12-19  911  	 * Read kcov fields before unlocking kcov_remote_lock to prevent races
6556fde265a7bd Marco Elver               2025-12-19  912  	 * with KCOV_DISABLE and kcov_remote_reset(); cannot acquire kcov->lock
6556fde265a7bd Marco Elver               2025-12-19  913  	 * here, because it might lead to deadlock given kcov_remote_lock is
6556fde265a7bd Marco Elver               2025-12-19  914  	 * acquired _after_ kcov->lock elsewhere.
eec028c9386ed1 Andrey Konovalov          2019-12-04  915  	 */
6556fde265a7bd Marco Elver               2025-12-19  916  	mode = context_unsafe(kcov->mode);
67b3d3cca38550 Andrey Konovalov          2020-06-04  917  	sequence = kcov->sequence;
5ff3b30ab57da8 Andrey Konovalov          2020-06-04  918  	if (in_task()) {
5ff3b30ab57da8 Andrey Konovalov          2020-06-04  919  		size = kcov->remote_size;
eec028c9386ed1 Andrey Konovalov          2019-12-04  920  		area = kcov_remote_area_get(size);
5ff3b30ab57da8 Andrey Konovalov          2020-06-04  921  	} else {
5ff3b30ab57da8 Andrey Konovalov          2020-06-04  922  		size = CONFIG_KCOV_IRQ_AREA_SIZE;
5ff3b30ab57da8 Andrey Konovalov          2020-06-04  923  		area = this_cpu_ptr(&kcov_percpu_data)->irq_area;
5ff3b30ab57da8 Andrey Konovalov          2020-06-04  924  	}
22036abe17c9f6 Sebastian Andrzej Siewior 2021-11-08  925  	spin_unlock(&kcov_remote_lock);
eec028c9386ed1 Andrey Konovalov          2019-12-04  926  
5ff3b30ab57da8 Andrey Konovalov          2020-06-04  927  	/* Can only happen when in_task(). */
eec028c9386ed1 Andrey Konovalov          2019-12-04  928  	if (!area) {
d5d2c51f1e5f56 Sebastian Andrzej Siewior 2021-11-08  929  		local_unlock_irqrestore(&kcov_percpu_data.lock, flags);
eec028c9386ed1 Andrey Konovalov          2019-12-04  930  		area = vmalloc(size * sizeof(unsigned long));
eec028c9386ed1 Andrey Konovalov          2019-12-04  931  		if (!area) {
67b3d3cca38550 Andrey Konovalov          2020-06-04  932  			kcov_put(kcov);
eec028c9386ed1 Andrey Konovalov          2019-12-04  933  			return;
eec028c9386ed1 Andrey Konovalov          2019-12-04  934  		}
d5d2c51f1e5f56 Sebastian Andrzej Siewior 2021-11-08  935  		local_lock_irqsave(&kcov_percpu_data.lock, flags);
22036abe17c9f6 Sebastian Andrzej Siewior 2021-11-08  936  	}
5ff3b30ab57da8 Andrey Konovalov          2020-06-04  937  
eec028c9386ed1 Andrey Konovalov          2019-12-04  938  	/* Reset coverage size. */
eec028c9386ed1 Andrey Konovalov          2019-12-04  939  	*(u64 *)area = 0;
eec028c9386ed1 Andrey Konovalov          2019-12-04  940  
5ff3b30ab57da8 Andrey Konovalov          2020-06-04  941  	if (in_serving_softirq()) {
5ff3b30ab57da8 Andrey Konovalov          2020-06-04  942  		kcov_remote_softirq_start(t);
5ff3b30ab57da8 Andrey Konovalov          2020-06-04  943  		t->kcov_softirq = 1;
5ff3b30ab57da8 Andrey Konovalov          2020-06-04  944  	}
76484b1c77242b Andrey Konovalov          2020-06-04  945  	kcov_start(t, kcov, size, area, mode, sequence);
eec028c9386ed1 Andrey Konovalov          2019-12-04  946  
d5d2c51f1e5f56 Sebastian Andrzej Siewior 2021-11-08  947  	local_unlock_irqrestore(&kcov_percpu_data.lock, flags);
5ff3b30ab57da8 Andrey Konovalov          2020-06-04  948  

:::::: The code at line 877 was first introduced by commit
:::::: d5d2c51f1e5f56ed01d2c773974630c007e5e5f5 kcov: replace local_irq_save() with a local_lock_t

:::::: TO: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
