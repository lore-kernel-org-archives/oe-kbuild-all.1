Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CD105BAF0
	for <oe-kbuild-all@lists.linux.dev>; Sat, 21 Dec 2024 18:56:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734807396; cv=none; b=kAK9ByJg4vl3bYy8Ot8Woi+gr1fJaFamM1wtegUsWHEzT5Uiv8Jl9ue18oEiOZp/B6upT8XJWUQ6T3tlpyxTyVkW7rRg1Bpz7Bxva12nVdqFQ73LZyJMFa4RQBpOx2kacWaX7ALYSIs24NIMENmI8w/ajTkWhQaJ/UrI0/jWYmg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734807396; c=relaxed/simple;
	bh=DJLdvodacm9b+Fo3CyPvsqIQPjzmm85kZYrZ0igO6JM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=cfrtaqLan67VTUSbCXjuQ3VIo8cV30t77Vq9q8FTvHUfJiiBpf3o0tINT5S9squEEoQ++7KcBVW7cDxd0FaRKB7kNEjyepjUDY2UacUH0F0mgqvL2PgwSI3LPX0s+vt3XjsBw3Zzd6TSB9BxZBVUPYyyZ02qfyBN4ckMWiZeFCQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mhXBiSUT; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mhXBiSUT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734807395; x=1766343395;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=DJLdvodacm9b+Fo3CyPvsqIQPjzmm85kZYrZ0igO6JM=;
  b=mhXBiSUThOmXq24gAhpiRJ/2UN1v44Dj/Mw0RBC83e7YUq575dIELCdp
   Qx64x0ILzEuc/dKy+VyVTmeLZVsoUZtjYOF2Xwac9oi/l0QEui+HI8XTb
   0Lphx9bDXYdmnTgI+X9nnLk1cjH4gnjGV6degP4oQ/moq/WC1r2ROJMvZ
   KgXXLNfbz/PJ5vQEj8WLHFVotH+JD6wo/Gm5VgXomKFKApBB1M3cxw8Na
   psIjuZnG3VDsm+5tlOCccOABO9uFgW04/kW/iF4+obyZaZsq4yAJXA0du
   6YKBaOuubbmV1sndeGB7GWp7IxIxnnNKpu/O0NBWQifKC8UeZ7rNgAJ2g
   A==;
X-CSE-ConnectionGUID: tDYf1RtBTzSAcLqDx9qimw==
X-CSE-MsgGUID: tT5b0UApSDW8a+4eRjkrDg==
X-IronPort-AV: E=McAfee;i="6700,10204,11293"; a="34606280"
X-IronPort-AV: E=Sophos;i="6.12,254,1728975600"; 
   d="scan'208";a="34606280"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Dec 2024 10:56:34 -0800
X-CSE-ConnectionGUID: 5cYufa/EQJS0tx8guLM/hA==
X-CSE-MsgGUID: boXUKj2FRUS9rk5pZNgDOw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,254,1728975600"; 
   d="scan'208";a="99031610"
Received: from lkp-server01.sh.intel.com (HELO a46f226878e0) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 21 Dec 2024 10:56:33 -0800
Received: from kbuild by a46f226878e0 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tP4eN-0002Pq-1T;
	Sat, 21 Dec 2024 18:56:31 +0000
Date: Sun, 22 Dec 2024 02:56:22 +0800
From: kernel test robot <lkp@intel.com>
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [paulmckrcu:dev 29/32] kernel/rcu/srcutree.c:779:46: error: 'idx'
 undeclared; did you mean 'ida'?
Message-ID: <202412220224.7NlsDpAF-lkp@intel.com>
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
commit: 2d83ec26a0f96c719fdc81b54f75d7b924dcd6bf [29/32] srcu: Make SRCU readers use ->srcu_ctrs for counter selection
config: sparc-randconfig-002-20241221 (https://download.01.org/0day-ci/archive/20241222/202412220224.7NlsDpAF-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241222/202412220224.7NlsDpAF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412220224.7NlsDpAF-lkp@intel.com/

All errors (new ones prefixed by >>):

   kernel/rcu/srcutree.c: In function '__srcu_read_lock_nmisafe':
>> kernel/rcu/srcutree.c:779:46: error: 'idx' undeclared (first use in this function); did you mean 'ida'?
     779 |         atomic_long_inc(&ssp->sda->srcu_ctrs[idx].srcu_locks.counter);
         |                                              ^~~
         |                                              ida
   kernel/rcu/srcutree.c:779:46: note: each undeclared identifier is reported only once for each function it appears in
   kernel/rcu/srcutree.c:777:27: warning: unused variable 'sdp' [-Wunused-variable]
     777 |         struct srcu_data *sdp = raw_cpu_ptr(ssp->sda);
         |                           ^~~
   kernel/rcu/srcutree.c: In function '__srcu_read_unlock_nmisafe':
   kernel/rcu/srcutree.c:795:25: error: passing argument 1 of 'atomic_long_inc' from incompatible pointer type [-Wincompatible-pointer-types]
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


vim +779 kernel/rcu/srcutree.c

   768	
   769	/*
   770	 * Counts the new reader in the appropriate per-CPU element of the
   771	 * srcu_struct, but in an NMI-safe manner using RMW atomics.
   772	 * Returns an index that must be passed to the matching srcu_read_unlock().
   773	 */
   774	int __srcu_read_lock_nmisafe(struct srcu_struct *ssp)
   775	{
   776		struct srcu_ctr *scp = READ_ONCE(ssp->srcu_ctrp);
   777		struct srcu_data *sdp = raw_cpu_ptr(ssp->sda);
   778	
 > 779		atomic_long_inc(&ssp->sda->srcu_ctrs[idx].srcu_locks.counter);
   780		smp_mb__after_atomic(); /* B */  /* Avoid leaking the critical section. */
   781		return scp - &ssp->sda->srcu_ctrs[0];
   782	}
   783	EXPORT_SYMBOL_GPL(__srcu_read_lock_nmisafe);
   784	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
