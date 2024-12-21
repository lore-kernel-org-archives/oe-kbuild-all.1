Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59E2540849
	for <oe-kbuild-all@lists.linux.dev>; Sat, 21 Dec 2024 18:03:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734804211; cv=none; b=Y7D9Hg6bPB1Wm0+n4hKlrm9O0/FYF4M4Fjeq56/urmKk6Jwt7VOoWjL7rnvh75KinhcmylD6o8xWbowPAga4fLazn4vq/ySPgNOKE4wwbunI0ftEy4TDadF2FenW0hSN99O/E6iUNSZ8uwFEzTu/vjqcdn9sJWByQgtjgs23LqM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734804211; c=relaxed/simple;
	bh=xjPIiWlUsRl2bhE6XLQ063uxxFnb1ZYIkF1LVUL8Pig=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Xs6Zd29ZiXUUqgWwjRfcW6FFd+gMEgYAT+V/+9RCUvtMQulF6gtDklaw0LLC7RotQJcIvAhs3ArWbAoJRNdt3tBU57hL2PxrFKQNRooMAiDEI1fAmrLBlcST84dUK+jmoVUAK1lLDztyqRwTo7I7ROwnHKMaj5ZwK5U6vn+VPIg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KtSYXhYs; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KtSYXhYs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734804210; x=1766340210;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=xjPIiWlUsRl2bhE6XLQ063uxxFnb1ZYIkF1LVUL8Pig=;
  b=KtSYXhYsxaQmLyavJxGEASzJ+WGrDze50dTyaAJEu22Q1/IxdGC3dequ
   kzmAHHmO2PrGukm7LwWaXxlTslz8wMwCCq0p56SE2HD1lCtS1r+EDSYKO
   wMgDQknlQpTH9WLb+nB+JGsXhCVYzwYPvCMt7x83N35JSyJM4dyV1uv8R
   sjgVHKy/rfgfYvLkpNfOH5D00lxGFOLYaz5fY9CstNM8JrwstLd2xKIxt
   pse1xAGYiIMkdL/N7gh1D+wr0ADUzRHfPD4bk2jg3LZIFMOw0oVhmArl/
   9sQ/SPoEix97kYK7rX12da2qts2JnH7krZA7o+dGnYGTif7921+oC+1oc
   w==;
X-CSE-ConnectionGUID: m3Mzner+RJyywQ9scE/BgQ==
X-CSE-MsgGUID: Xr3bCIqDRYOGvMdDEqPXIg==
X-IronPort-AV: E=McAfee;i="6700,10204,11293"; a="35219217"
X-IronPort-AV: E=Sophos;i="6.12,254,1728975600"; 
   d="scan'208";a="35219217"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Dec 2024 10:03:29 -0800
X-CSE-ConnectionGUID: 5QY7UzWRQnGODBIHjc5T+w==
X-CSE-MsgGUID: JK+ogW31Tf6HOBlpZM9cng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="122097759"
Received: from lkp-server01.sh.intel.com (HELO a46f226878e0) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 21 Dec 2024 10:03:28 -0800
Received: from kbuild by a46f226878e0 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tP3oz-0002MW-1X;
	Sat, 21 Dec 2024 18:03:25 +0000
Date: Sun, 22 Dec 2024 02:03:25 +0800
From: kernel test robot <lkp@intel.com>
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [paulmckrcu:dev 28/32] kernel/rcu/srcutree.c:795:25: error: passing
 argument 1 of 'atomic_long_inc' from incompatible pointer type
Message-ID: <202412220101.64Tr3TwV-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/paulmckrcu/linux dev
head:   61a0b92b3a3cfef69e3848806e51d1b99a9e9406
commit: 62986fee7c7a83cb091dca361bcb1ea1b40d4ec4 [28/32] srcu: Pull ->srcu_{un,}lock_count into a new srcu_ctr structure
config: sparc-randconfig-002-20241221 (https://download.01.org/0day-ci/archive/20241222/202412220101.64Tr3TwV-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241222/202412220101.64Tr3TwV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412220101.64Tr3TwV-lkp@intel.com/

All errors (new ones prefixed by >>):

   kernel/rcu/srcutree.c: In function '__srcu_read_lock_nmisafe':
   kernel/rcu/srcutree.c:779:56: error: expected ')' before ']' token
     779 |         atomic_long_inc(&sdp->srcu_ctrs[idx].srcu_locks]);
         |                        ~                               ^
         |                                                        )
   kernel/rcu/srcutree.c:779:56: error: expected ';' before ']' token
     779 |         atomic_long_inc(&sdp->srcu_ctrs[idx].srcu_locks]);
         |                                                        ^
         |                                                        ;
   kernel/rcu/srcutree.c:779:56: error: expected statement before ']' token
   kernel/rcu/srcutree.c:779:57: error: expected statement before ')' token
     779 |         atomic_long_inc(&sdp->srcu_ctrs[idx].srcu_locks]);
         |                                                         ^
   kernel/rcu/srcutree.c: In function '__srcu_read_unlock_nmisafe':
>> kernel/rcu/srcutree.c:795:25: error: passing argument 1 of 'atomic_long_inc' from incompatible pointer type [-Wincompatible-pointer-types]
     795 |         atomic_long_inc(&sdp->srcu_ctrs[idx].srcu_unlocks.counter);
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                         |
         |                         s64 * {aka long long int *}
   In file included from include/linux/atomic.h:82,
                    from include/asm-generic/bitops/lock.h:5,
                    from arch/sparc/include/asm/bitops_64.h:52,
                    from arch/sparc/include/asm/bitops.h:5,
                    from include/linux/bitops.h:68,
                    from include/linux/thread_info.h:27,
                    from arch/sparc/include/asm/current.h:15,
                    from include/linux/mutex.h:14,
                    from kernel/rcu/srcutree.c:19:
   include/linux/atomic/atomic-instrumented.h:3589:32: note: expected 'atomic_long_t *' {aka 'atomic64_t *'} but argument is of type 's64 *' {aka 'long long int *'}
    3589 | atomic_long_inc(atomic_long_t *v)
         |                 ~~~~~~~~~~~~~~~^


vim +/atomic_long_inc +795 kernel/rcu/srcutree.c

   784	
   785	/*
   786	 * Removes the count for the old reader from the appropriate per-CPU
   787	 * element of the srcu_struct.  Note that this may well be a different
   788	 * CPU than that which was incremented by the corresponding srcu_read_lock().
   789	 */
   790	void __srcu_read_unlock_nmisafe(struct srcu_struct *ssp, int idx)
   791	{
   792		struct srcu_data *sdp = raw_cpu_ptr(ssp->sda);
   793	
   794		smp_mb__before_atomic(); /* C */  /* Avoid leaking the critical section. */
 > 795		atomic_long_inc(&sdp->srcu_ctrs[idx].srcu_unlocks.counter);
   796	}
   797	EXPORT_SYMBOL_GPL(__srcu_read_unlock_nmisafe);
   798	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
