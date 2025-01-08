Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DCDF1F8F14
	for <oe-kbuild-all@lists.linux.dev>; Wed,  8 Jan 2025 21:11:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736370715; cv=none; b=GQjBqkO+0WR2e5a5sbHFw26pK4Sw/rrRYeqCijSZMLuIKXyJq2GF4y7Z9IE0GwVaXvwE+W+BgizREvxHJyrR7WpRFTqxU6o7aY1JcNyHs1liRsVx9t84J+X9n1hKHQi24ibKikMG0omqTTIjSz6xMRuM7ks29mKi9yFtI2gBoR4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736370715; c=relaxed/simple;
	bh=yhbH+Pwcy/luUF36bdhVNlSs3Z6j01Uv9ocnH/zP99E=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=onekZSJ8O4FiBT2lbH4hgjMOKMqYX1dIcpCOQMA6Reba/ZWHbGs/NpBxK+er+wCZurV2mYfMEUR8sJE2qlWk+DAQ5l9RjIF8zOWCcYv8x76/HhtwEU/cT8xd2gEOP4QoywlLu64Ep6SOSOWKtG6IW1oArTrq9hZ9ogbhkraVbsQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Vj1V32di; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Vj1V32di"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736370714; x=1767906714;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=yhbH+Pwcy/luUF36bdhVNlSs3Z6j01Uv9ocnH/zP99E=;
  b=Vj1V32diI6s5hJtLdkfs4Rk/i2EunjSGqwL4lmwgvUsfCwDHv5+k01uc
   TTBXgAEJ5kypBQTvXbMGjdd8DiHJVSFv6OrYj5r4+IYHDiiOCJhapMxhH
   Le+lg8OAAK0HfpsfBcCN4jtNeQg3ERdvNk2K6quf9XdVI9A/V3YeARJhy
   ioogQaCSb6MNNdsoAk9CsswD2Hqsp+n3nEEIOugZbH3g2wPG34trQZ1Ay
   b+7788drkHqNQp7LrJT3hvQs/S52Ftr89IBsUDByJpLKSGfrICF5gRfKV
   /HzNAjYsbbHR0xwynJLkMMQuhUaKeiyxyQlZ5ioUn0rAT3tHuP4P9PgOw
   w==;
X-CSE-ConnectionGUID: RLYctuzLRU+zP2ozW+8u/w==
X-CSE-MsgGUID: PCTMjmOfRM+QiyACk2MBDw==
X-IronPort-AV: E=McAfee;i="6700,10204,11309"; a="36728766"
X-IronPort-AV: E=Sophos;i="6.12,299,1728975600"; 
   d="scan'208";a="36728766"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jan 2025 13:11:54 -0800
X-CSE-ConnectionGUID: DiWnf0BoSTOFi6KitDgxeA==
X-CSE-MsgGUID: cSMp6mW4SDutqAshd9Cl8g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="126502680"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 08 Jan 2025 13:11:52 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tVdLC-000Gh9-0J;
	Wed, 08 Jan 2025 21:11:50 +0000
Date: Thu, 9 Jan 2025 05:11:44 +0800
From: kernel test robot <lkp@intel.com>
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [paulmckrcu:dev.2024.12.31a 21/29] kernel/rcu/srcutree.c:778:26:
 sparse: sparse: incorrect type in argument 1 (different address spaces)
Message-ID: <202501090502.9qIoaG7H-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/paulmckrcu/linux dev.2024.12.31a
head:   adaa614a85924c685533b2cc28dea7969f33c562
commit: 17de1a67bd96dd8010947686f82e795a24d81078 [21/29] srcu: Make SRCU readers use ->srcu_ctrs for counter selection
config: powerpc-randconfig-r112-20250109 (https://download.01.org/0day-ci/archive/20250109/202501090502.9qIoaG7H-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 14.2.0
reproduce: (https://download.01.org/0day-ci/archive/20250109/202501090502.9qIoaG7H-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501090502.9qIoaG7H-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> kernel/rcu/srcutree.c:778:26: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct atomic_t [usertype] *v @@     got struct atomic_t [noderef] __percpu * @@
   kernel/rcu/srcutree.c:778:26: sparse:     expected struct atomic_t [usertype] *v
   kernel/rcu/srcutree.c:778:26: sparse:     got struct atomic_t [noderef] __percpu *
   kernel/rcu/srcutree.c:372:13: sparse: sparse: context imbalance in 'spin_lock_irqsave_sdp_contention' - wrong count at exit
   kernel/rcu/srcutree.c:390:13: sparse: sparse: context imbalance in 'spin_lock_irqsave_ssp_contention' - wrong count at exit
   kernel/rcu/srcutree.c:1002:9: sparse: sparse: context imbalance in 'srcu_funnel_exp_start' - unexpected unlock
   kernel/rcu/srcutree.c:1091:9: sparse: sparse: context imbalance in 'srcu_funnel_gp_start' - unexpected unlock
   kernel/rcu/srcutree.c:1330:9: sparse: sparse: context imbalance in 'srcu_gp_start_if_needed' - unexpected unlock

vim +778 kernel/rcu/srcutree.c

   768	
   769	/*
   770	 * Counts the new reader in the appropriate per-CPU element of the
   771	 * srcu_struct, but in an NMI-safe manner using RMW atomics.
   772	 * Returns an index that must be passed to the matching srcu_read_unlock().
   773	 */
   774	int __srcu_read_lock_nmisafe(struct srcu_struct *ssp)
   775	{
   776		struct srcu_ctr __percpu *scp = READ_ONCE(ssp->srcu_ctrp);
   777	
 > 778		atomic_long_inc(&scp->srcu_locks);
   779		smp_mb__after_atomic(); /* B */  /* Avoid leaking the critical section. */
   780		return scp - &ssp->sda->srcu_ctrs[0];
   781	}
   782	EXPORT_SYMBOL_GPL(__srcu_read_lock_nmisafe);
   783	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
