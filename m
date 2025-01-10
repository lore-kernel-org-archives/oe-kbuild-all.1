Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 900F220A5E4
	for <oe-kbuild-all@lists.linux.dev>; Fri, 10 Jan 2025 22:39:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736548764; cv=none; b=Zer5aoRaVXp44qGYFEhSVtrwNBguKmDs7bsxkwHMFHAQwlfZFOUh7ykijMymYHHhjaWFQT72P/muaQ2L7F91cnMf21ldJU77xr5FWTGfp3Za4emC5niqZxWmQUC6+zhIhpNVPuSrdd1szHLKifx5ykIa7S5idp5VXo6UwOQOYF8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736548764; c=relaxed/simple;
	bh=3fScl+wJHepCRKtEgGw79xpce1mv5ZxQsEktgMGGvSo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=P1pqSqVDB+AHUZC8qyPT0B22nv1+PEreVCvKfq1OFZPe+istwlxyh3V9mW3TLie/fhuE8QvZuyVFEj63QMI0elznpYc7xMuZucR/7V43u4eG7d1cF4WBm9ocxHU0/4KV5FhvuBa6xwV397O+s+vifRpTEY5JvDYLRaylHH/8GX4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=S0CZXNan; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="S0CZXNan"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736548763; x=1768084763;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3fScl+wJHepCRKtEgGw79xpce1mv5ZxQsEktgMGGvSo=;
  b=S0CZXNan5Fq+KFYedIIh7F3Qo5BprU761lGGEl7tYjfAUoKXoel0C2TB
   JkWsC131Hp9JSCy+uZGexMXh1AjVPfO42oGX+hlTNZ1NQq1zs8zkHZ+LU
   uYVrr2tHt7udSrXFVP75CD22etWOzMK0W1bgdWl7un4r2lxBodmrLhSDZ
   QmlzETg0JbegIfGlCU5PLM6c+LfUPzYGa5SNmZqkdhrR+Qx6zJbMv6iAm
   f9dkEEpllEv32ZaZ/LyZvjoWKJL4qqz6n2KrvqxYbq71ol6ZzUgzDWyha
   egGU2o+pqpzczG9ZD2EvGHuauyl4EPGB7bS66onGdofuy2ko2d5nLGaH7
   Q==;
X-CSE-ConnectionGUID: a/VSZzmVSIKxQ4Xgo2YIGA==
X-CSE-MsgGUID: bDJOS+RKS6C1+sb3J6w2GA==
X-IronPort-AV: E=McAfee;i="6700,10204,11311"; a="36964101"
X-IronPort-AV: E=Sophos;i="6.12,305,1728975600"; 
   d="scan'208";a="36964101"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jan 2025 14:39:22 -0800
X-CSE-ConnectionGUID: Mz0G9WKfSpaht/F7luNVNA==
X-CSE-MsgGUID: hR0mqKrLR8q/5EshbEvAyQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,305,1728975600"; 
   d="scan'208";a="104414865"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 10 Jan 2025 14:39:21 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tWNew-000JqJ-2T;
	Fri, 10 Jan 2025 22:39:18 +0000
Date: Sat, 11 Jan 2025 06:39:14 +0800
From: kernel test robot <lkp@intel.com>
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [paulmckrcu:dev.2025.01.07a 54/56] kernel/rcu/rcutorture.c:711:21:
 sparse: sparse: incorrect type in assignment (different address spaces)
Message-ID: <202501110618.vupBQHpd-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/paulmckrcu/linux dev.2025.01.07a
head:   88e44a908bff076d1e7f47634f06a8a4560c19e9
commit: 7c89f902dc2a29c68a0fad0ea6ac592d7fd647ec [54/56] rcutorture: Add ability to test srcu_read_{,un}lock_fast()
config: x86_64-randconfig-121-20250111 (https://download.01.org/0day-ci/archive/20250111/202501110618.vupBQHpd-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250111/202501110618.vupBQHpd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501110618.vupBQHpd-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> kernel/rcu/rcutorture.c:711:21: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct srcu_ctr *scp @@     got struct srcu_ctr [noderef] __percpu * @@
   kernel/rcu/rcutorture.c:711:21: sparse:     expected struct srcu_ctr *scp
   kernel/rcu/rcutorture.c:711:21: sparse:     got struct srcu_ctr [noderef] __percpu *
>> kernel/rcu/rcutorture.c:712:52: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct srcu_ctr [noderef] __percpu *scpp @@     got struct srcu_ctr *scp @@
   kernel/rcu/rcutorture.c:712:52: sparse:     expected struct srcu_ctr [noderef] __percpu *scpp
   kernel/rcu/rcutorture.c:712:52: sparse:     got struct srcu_ctr *scp
>> kernel/rcu/rcutorture.c:742:67: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct srcu_ctr [noderef] __percpu *scp @@     got struct srcu_ctr * @@
   kernel/rcu/rcutorture.c:742:67: sparse:     expected struct srcu_ctr [noderef] __percpu *scp
   kernel/rcu/rcutorture.c:742:67: sparse:     got struct srcu_ctr *
   kernel/rcu/rcutorture.c: note: in included file (through include/linux/module.h):
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   kernel/rcu/rcutorture.c:439:22: sparse: sparse: context imbalance in 'rcu_torture_read_lock' - wrong count at exit
   kernel/rcu/rcutorture.c: note: in included file (through include/linux/rbtree.h, include/linux/mm_types.h, include/linux/mmzone.h, ...):
   include/linux/rcupdate.h:871:25: sparse: sparse: context imbalance in 'rcu_torture_read_unlock' - unexpected unlock
   kernel/rcu/rcutorture.c: note: in included file (through include/linux/module.h):
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   kernel/rcu/rcutorture.c: note: in included file (through include/linux/notifier.h, arch/x86/include/asm/uprobes.h, include/linux/uprobes.h, ...):
   include/linux/srcu.h:75:22: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/rcu/rcutorture.c:716:9: sparse: sparse: context imbalance in 'srcu_torture_read_lock' - wrong count at exit
   include/linux/srcu.h:87:39: sparse: sparse: cast removes address space '__percpu' of expression
   kernel/rcu/rcutorture.c:742:38: sparse: sparse: context imbalance in 'srcu_torture_read_unlock' - unexpected unlock
   kernel/rcu/rcutorture.c:2047:9: sparse: sparse: context imbalance in 'rcutorture_one_extend' - different lock contexts for basic block
   include/linux/srcu.h:407:9: sparse: sparse: context imbalance in 'rcu_torture_init_srcu_lockdep' - unexpected unlock
   kernel/rcu/rcutorture.c: note: in included file (through include/linux/module.h):
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true

vim +711 kernel/rcu/rcutorture.c

   686	
   687	static int srcu_torture_read_lock(void)
   688	{
   689		int idx;
   690		struct srcu_ctr *scp;
   691		int ret = 0;
   692	
   693		WARN_ON_ONCE(reader_flavor & ~SRCU_READ_FLAVOR_ALL);
   694	
   695		if ((reader_flavor & SRCU_READ_FLAVOR_NORMAL) || !(reader_flavor & SRCU_READ_FLAVOR_ALL)) {
   696			idx = srcu_read_lock(srcu_ctlp);
   697			WARN_ON_ONCE(idx & ~0x1);
   698			ret += idx;
   699		}
   700		if (reader_flavor & SRCU_READ_FLAVOR_NMI) {
   701			idx = srcu_read_lock_nmisafe(srcu_ctlp);
   702			WARN_ON_ONCE(idx & ~0x1);
   703			ret += idx << 1;
   704		}
   705		if (reader_flavor & SRCU_READ_FLAVOR_LITE) {
   706			idx = srcu_read_lock_lite(srcu_ctlp);
   707			WARN_ON_ONCE(idx & ~0x1);
   708			ret += idx << 2;
   709		}
   710		if (reader_flavor & SRCU_READ_FLAVOR_FAST) {
 > 711			scp = srcu_read_lock_fast(srcu_ctlp);
 > 712			idx = __srcu_ptr_to_ctr(srcu_ctlp, scp);
   713			WARN_ON_ONCE(idx & ~0x1);
   714			ret += idx << 3;
   715		}
   716		return ret;
   717	}
   718	
   719	static void
   720	srcu_read_delay(struct torture_random_state *rrsp, struct rt_read_seg *rtrsp)
   721	{
   722		long delay;
   723		const long uspertick = 1000000 / HZ;
   724		const long longdelay = 10;
   725	
   726		/* We want there to be long-running readers, but not all the time. */
   727	
   728		delay = torture_random(rrsp) %
   729			(nrealreaders * 2 * longdelay * uspertick);
   730		if (!delay && in_task()) {
   731			schedule_timeout_interruptible(longdelay);
   732			rtrsp->rt_delay_jiffies = longdelay;
   733		} else {
   734			rcu_read_delay(rrsp, rtrsp);
   735		}
   736	}
   737	
   738	static void srcu_torture_read_unlock(int idx)
   739	{
   740		WARN_ON_ONCE((reader_flavor && (idx & ~reader_flavor)) || (!reader_flavor && (idx & ~0x1)));
   741		if (reader_flavor & SRCU_READ_FLAVOR_FAST)
 > 742			srcu_read_unlock_fast(srcu_ctlp, __srcu_ctr_to_ptr(srcu_ctlp, (idx & 0x8) >> 3));
   743		if (reader_flavor & SRCU_READ_FLAVOR_LITE)
   744			srcu_read_unlock_lite(srcu_ctlp, (idx & 0x4) >> 2);
   745		if (reader_flavor & SRCU_READ_FLAVOR_NMI)
   746			srcu_read_unlock_nmisafe(srcu_ctlp, (idx & 0x2) >> 1);
   747		if ((reader_flavor & SRCU_READ_FLAVOR_NORMAL) || !(reader_flavor & SRCU_READ_FLAVOR_ALL))
   748			srcu_read_unlock(srcu_ctlp, idx & 0x1);
   749	}
   750	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
