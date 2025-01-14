Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A548F9D9
	for <oe-kbuild-all@lists.linux.dev>; Tue, 14 Jan 2025 01:01:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736816521; cv=none; b=l20m7FQjq40pYDZyUznbsxbnvSwZUW52bSw92ayaSu3Uo/kjA8nnLO0+7abLCCnpg96uMPdENQ3cL4Ybkh4Vj9YClZjyyB8DTTpCljPo50IQGVZiXrISl8POsyTxVtYfM1IgVoQyYtWuazllLze9O8n4HwpZadDJUfp9awq44Es=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736816521; c=relaxed/simple;
	bh=JmU3n/m5nfYnD/XNgVvmk9qCVJ2AufpsYJv3Xn5A2H8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=fIGiENKvWiAaLNQZGrS/F0HFdsCEHxNJEKOgZ9vMFqYbX+9o9ybpMOZgUiqRfLYzLK8xZMpRKJ8dwEcg3ZT1JkTAahNF6E3yWqIlj+nM3mOj4QjbrlUbU4n5PlK9ZfXINkClsVLVNpsRkKKHydCPAnn1WLNzvBrHtXPa4n8JqI0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MqxPbWys; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MqxPbWys"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736816520; x=1768352520;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=JmU3n/m5nfYnD/XNgVvmk9qCVJ2AufpsYJv3Xn5A2H8=;
  b=MqxPbWysDMrEhMAVv9xqVVG/ihZKM/4zOFc2i9zkLJLT9lMpSw8F9GEI
   dtqkc1IuAvsOgfgiVLpCNdm51AXnpf385c3aaT4ehxCNl5ZSUOZNSyxgT
   Za2nTvx2gQ4vXOy0O4KzyPfg+EhUqwGlcuKpAOFFU8Om035m7yQVdlEDP
   rI4jlGCHS6SYdNVYNGS2w0GmKgMsxNLKfYZkofkTyFhV4npdbVGXv95J7
   kwge5LM9GHseCj9BgSFNje9CA38ksyNTuDRqPhPQf9Iy1/R1g9pnNVTy1
   wDD1kxXA/T2ilGuxxygmD2HSTsJSU2IQ6pTOTlQsOyTOheRR3NQQGObgU
   w==;
X-CSE-ConnectionGUID: 3MWNBMIqSV+Is/yc66h4tg==
X-CSE-MsgGUID: NO531v3xRqetkg8HvweSSw==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="39910350"
X-IronPort-AV: E=Sophos;i="6.12,312,1728975600"; 
   d="scan'208";a="39910350"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jan 2025 17:02:00 -0800
X-CSE-ConnectionGUID: hYUborKnSgqIotImPS8P8g==
X-CSE-MsgGUID: DgG5JbtdTC2NbC8JxFwyoA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="141924816"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 13 Jan 2025 17:01:59 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tXVJc-000Nuj-0Y;
	Tue, 14 Jan 2025 01:01:56 +0000
Date: Tue, 14 Jan 2025 09:01:00 +0800
From: kernel test robot <lkp@intel.com>
To: "Paul E. McKenney" <paulmck@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [paulmckrcu:dev.2025.01.09a 57/60] kernel/rcu/srcutree.c:798:26:
 sparse: sparse: incorrect type in initializer (different address spaces)
Message-ID: <202501140806.qLVjWtmq-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/paulmckrcu/linux dev.2025.01.09a
head:   a99741861216c54658023bdc01f5ad5ad3330f52
commit: 7a99570b926cb1b906ef0c54613db372f859203e [57/60] fixup! srcu: Pull integer-to-pointer conversion into __srcu_ctr_to_ptr()
config: arc-randconfig-r133-20250114 (https://download.01.org/0day-ci/archive/20250114/202501140806.qLVjWtmq-lkp@intel.com/config)
compiler: arceb-elf-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20250114/202501140806.qLVjWtmq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501140806.qLVjWtmq-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   kernel/rcu/srcutree.c:768:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got int * @@
   kernel/rcu/srcutree.c:768:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   kernel/rcu/srcutree.c:768:9: sparse:     got int *
   kernel/rcu/srcutree.c:768:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got int * @@
   kernel/rcu/srcutree.c:768:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   kernel/rcu/srcutree.c:768:9: sparse:     got int *
   kernel/rcu/srcutree.c:768:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got int * @@
   kernel/rcu/srcutree.c:768:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   kernel/rcu/srcutree.c:768:9: sparse:     got int *
   kernel/rcu/srcutree.c:768:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got int * @@
   kernel/rcu/srcutree.c:768:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   kernel/rcu/srcutree.c:768:9: sparse:     got int *
   kernel/rcu/srcutree.c:768:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got int * @@
   kernel/rcu/srcutree.c:768:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
   kernel/rcu/srcutree.c:768:9: sparse:     got int *
   kernel/rcu/srcutree.c:786:39: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct srcu_ctr [noderef] __percpu *scpp @@     got struct srcu_ctr *scp @@
   kernel/rcu/srcutree.c:786:39: sparse:     expected struct srcu_ctr [noderef] __percpu *scpp
   kernel/rcu/srcutree.c:786:39: sparse:     got struct srcu_ctr *scp
>> kernel/rcu/srcutree.c:798:26: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct srcu_ctr * @@
   kernel/rcu/srcutree.c:798:26: sparse:     expected void const [noderef] __percpu *__vpp_verify
   kernel/rcu/srcutree.c:798:26: sparse:     got struct srcu_ctr *
   kernel/rcu/srcutree.c:371:13: sparse: sparse: context imbalance in 'spin_lock_irqsave_sdp_contention' - wrong count at exit
   kernel/rcu/srcutree.c:389:13: sparse: sparse: context imbalance in 'spin_lock_irqsave_ssp_contention' - wrong count at exit
   kernel/rcu/srcutree.c: note: in included file (through include/linux/srcu.h, include/linux/notifier.h, include/linux/memory_hotplug.h, ...):
   include/linux/srcutree.h:226:36: sparse: sparse: incorrect type in return expression (different address spaces) @@     expected struct srcu_ctr * @@     got struct srcu_ctr [noderef] __percpu * @@
   include/linux/srcutree.h:226:36: sparse:     expected struct srcu_ctr *
   include/linux/srcutree.h:226:36: sparse:     got struct srcu_ctr [noderef] __percpu *
   include/linux/srcutree.h:226:36: sparse: sparse: incorrect type in return expression (different address spaces) @@     expected struct srcu_ctr * @@     got struct srcu_ctr [noderef] __percpu * @@
   include/linux/srcutree.h:226:36: sparse:     expected struct srcu_ctr *
   include/linux/srcutree.h:226:36: sparse:     got struct srcu_ctr [noderef] __percpu *
   include/linux/srcutree.h:226:36: sparse: sparse: incorrect type in return expression (different address spaces) @@     expected struct srcu_ctr * @@     got struct srcu_ctr [noderef] __percpu * @@
   include/linux/srcutree.h:226:36: sparse:     expected struct srcu_ctr *
   include/linux/srcutree.h:226:36: sparse:     got struct srcu_ctr [noderef] __percpu *
   include/linux/srcutree.h:226:36: sparse: sparse: incorrect type in return expression (different address spaces) @@     expected struct srcu_ctr * @@     got struct srcu_ctr [noderef] __percpu * @@
   include/linux/srcutree.h:226:36: sparse:     expected struct srcu_ctr *
   include/linux/srcutree.h:226:36: sparse:     got struct srcu_ctr [noderef] __percpu *
   include/linux/srcutree.h:226:36: sparse: sparse: incorrect type in return expression (different address spaces) @@     expected struct srcu_ctr * @@     got struct srcu_ctr [noderef] __percpu * @@
   include/linux/srcutree.h:226:36: sparse:     expected struct srcu_ctr *
   include/linux/srcutree.h:226:36: sparse:     got struct srcu_ctr [noderef] __percpu *
   kernel/rcu/srcutree.c:1006:9: sparse: sparse: context imbalance in 'srcu_funnel_exp_start' - unexpected unlock
   kernel/rcu/srcutree.c:1095:9: sparse: sparse: context imbalance in 'srcu_funnel_gp_start' - unexpected unlock
   kernel/rcu/srcutree.c:1335:9: sparse: sparse: context imbalance in 'srcu_gp_start_if_needed' - unexpected unlock

vim +798 kernel/rcu/srcutree.c

   789	
   790	/*
   791	 * Removes the count for the old reader from the appropriate per-CPU
   792	 * element of the srcu_struct.  Note that this may well be a different
   793	 * CPU than that which was incremented by the corresponding srcu_read_lock().
   794	 */
   795	void __srcu_read_unlock_nmisafe(struct srcu_struct *ssp, int idx)
   796	{
   797		smp_mb__before_atomic(); /* C */  /* Avoid leaking the critical section. */
 > 798		atomic_long_inc(&raw_cpu_ptr(__srcu_ctr_to_ptr(ssp, idx))->srcu_unlocks);
   799	}
   800	EXPORT_SYMBOL_GPL(__srcu_read_unlock_nmisafe);
   801	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
