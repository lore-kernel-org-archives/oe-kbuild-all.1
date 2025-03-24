Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A45B61F17E9
	for <oe-kbuild-all@lists.linux.dev>; Mon, 24 Mar 2025 23:57:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742860655; cv=none; b=H1CyitSjMBEJejMIu1qibFxC1U8DoHM1CJPKlyd8mzO2t4aFpH/up5QkZZnOLJeviazxNQv1lqerMhvl1l53a2Pvlv6aDKoROeCd/5o15WaJiTz7Sh27PKSSnNNQGdaHn9xKUwEtEAtxPSS/aokIiMZZYkPGdtUgLIwSM2jPuyE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742860655; c=relaxed/simple;
	bh=mBe9nYlZSo5tnJOTRrwI1TCQ/jC8f1LASjVMtGYeFZE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=MCbV1ZcZJp3f/v4cW6dBMEReoLRsPPYNkYIa/JtoBpwXtcBPPa+lwLeBqLFulTbQ/yUL1DFkyj+wTuATDJiOHBlARjw2+1LBItkhovdubr52WIgz5HOk1sHElMnmgq2SE41KdDq4alrGqEPnqYRVx+JfQnEkaXdTGY5kt/QbaQs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=h9uGQmnO; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="h9uGQmnO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742860653; x=1774396653;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=mBe9nYlZSo5tnJOTRrwI1TCQ/jC8f1LASjVMtGYeFZE=;
  b=h9uGQmnOldG8Wc4wbqx++mhQBn1gfvFb0D/JA/BxMQpRdLFnysz26gcf
   gqMpypZ33em1g0ZXkX6Ip/Uk7M4pFyFNQ5K1rm5gZC5FhiUwGNrESa4wE
   b8jhzjWiwTk6gzIiSMc9l24DHBP1WW7qOrmJj1IctAnrl98Yw2lriNesc
   irltUHyNw2esxpP3T3zq4nQhMwBulOYqbsgQ2rXZCicN7ZitUaUwtZAzk
   CH7H+GSB9YCfWdnGjq1UWe+NWOtxQXVYrYOW2htOG/K6ZSFtIu7PhjXeW
   Hpn2AnqCsuS5Ogu3Tl8XrQGKunZ+UDG8c7X9RrPBAI/gEkMtIIKWLlySY
   Q==;
X-CSE-ConnectionGUID: FGrXJ7uoRi2btp7f7hbvhw==
X-CSE-MsgGUID: /lhdzbqmQ5erHC+PAgdEmQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11383"; a="44013152"
X-IronPort-AV: E=Sophos;i="6.14,273,1736841600"; 
   d="scan'208";a="44013152"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Mar 2025 16:57:32 -0700
X-CSE-ConnectionGUID: EaU4ijUkRUSUzF2eBCTQow==
X-CSE-MsgGUID: lV9vwky5Rli7wmxYCcnvsA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,273,1736841600"; 
   d="scan'208";a="124372493"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by fmviesa008.fm.intel.com with ESMTP; 24 Mar 2025 16:57:30 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1twrfc-00041f-2D;
	Mon, 24 Mar 2025 23:57:28 +0000
Date: Tue, 25 Mar 2025 07:57:13 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [koverstreet-bcachefs:latency_debug 83/84]
 include/linux/rhashtable.h:413: undefined reference to `debugfs_sched'
Message-ID: <202503250708.5SMtjzwL-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/koverstreet/bcachefs latency_debug
head:   bd176ff969fbde282f5e3335fe3e45e341427941
commit: a415e1f10898f9cb706c57814655cfe578cd8374 [83/84] sched_wakeup_backtrace debugfs
config: xtensa-randconfig-002-20250325 (https://download.01.org/0day-ci/archive/20250325/202503250708.5SMtjzwL-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250325/202503250708.5SMtjzwL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503250708.5SMtjzwL-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/xtensa/kernel/entry.o: in function `fast_syscall_spill_registers':
   arch/xtensa/kernel/entry.S:1436:(.exception.text+0x293): dangerous relocation: windowed longcall crosses 1GB boundary; return may fail: make_task_dead
   xtensa-linux-ld: kernel/sched/core.o: in function `wait_task_inactive':
   kernel/sched/core.c:2338: undefined reference to `__xchg_called_with_bad_pointer'
   xtensa-linux-ld: kernel/sched/core.o: in function `__arch_xchg':
   arch/xtensa/include/asm/cmpxchg.h:218: undefined reference to `__xchg_called_with_bad_pointer'
   xtensa-linux-ld: kernel/sched/timestats_bt.o: in function `rht_assign_unlock':
>> include/linux/rhashtable.h:413: undefined reference to `debugfs_sched'


vim +413 include/linux/rhashtable.h

c5783311a1248c NeilBrown  2019-04-12  400  
c5783311a1248c NeilBrown  2019-04-12  401  static inline void rht_assign_unlock(struct bucket_table *tbl,
ce9b362bf6db51 Herbert Xu 2020-07-24  402  				     struct rhash_lock_head __rcu **bkt,
e47877c7aa821c Tejun Heo  2022-12-06  403  				     struct rhash_head *obj,
e47877c7aa821c Tejun Heo  2022-12-06  404  				     unsigned long flags)
c5783311a1248c NeilBrown  2019-04-12  405  {
ca0b709d1a07b1 NeilBrown  2019-04-12  406  	if (rht_is_a_nulls(obj))
ca0b709d1a07b1 NeilBrown  2019-04-12  407  		obj = NULL;
c5783311a1248c NeilBrown  2019-04-12  408  	lock_map_release(&tbl->dep_map);
ce9b362bf6db51 Herbert Xu 2020-07-24  409  	rcu_assign_pointer(*bkt, (void *)obj);
c5783311a1248c NeilBrown  2019-04-12  410  	preempt_enable();
c5783311a1248c NeilBrown  2019-04-12  411  	__release(bitlock);
e47877c7aa821c Tejun Heo  2022-12-06  412  	local_irq_restore(flags);
c5783311a1248c NeilBrown  2019-04-12 @413  }
c5783311a1248c NeilBrown  2019-04-12  414  

:::::: The code at line 413 was first introduced by commit
:::::: c5783311a1248c437614d438b69c5f31fe483ecb rhashtable: reorder some inline functions and macros.

:::::: TO: NeilBrown <neilb@suse.com>
:::::: CC: David S. Miller <davem@davemloft.net>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
