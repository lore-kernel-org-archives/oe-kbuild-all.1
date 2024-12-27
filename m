Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70965320B
	for <oe-kbuild-all@lists.linux.dev>; Fri, 27 Dec 2024 14:40:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735310434; cv=none; b=QYERrZGvClAWJlS/MVZLfeDPZAB97CJ4VV7Vw+rovH8IN/XFMGjTdSBuv18UIvbcT6+JxWoWFVIIO4E5GLOFCGkK7RB9+XJ6c0//MA51Hh9QYRKzqgpxZu7CIt+qA65M3fs3VZxC08T3vNMK+jAUGgxtrbte2/HgOEKwC2et8sY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735310434; c=relaxed/simple;
	bh=OG+1dTRsYOGV6NFjR1zihkT8usTAm3jwaoMuD6Kl6iM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nSfQsyrxUXBDfSl3i6KGSwM5YgIVDjEuwra9oZCvLZFv/fXA44V20e4RUbbnLrAqMjtPF/EQ3HUOiyTAkaJUJTk6G4qeM1oNTDgq5NvvFK1UExxYOuzI5oGz0MyY2rLUBtZJUQpT5VpDnurKsJwCEcSInjk086NR+XJChzuolbM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=grrV2bs2; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="grrV2bs2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735310432; x=1766846432;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=OG+1dTRsYOGV6NFjR1zihkT8usTAm3jwaoMuD6Kl6iM=;
  b=grrV2bs21DIE4b5yGjNqvqzLmfd3dT0p7k0mrtQI4qUn8Vra/hkba3/C
   QzYsscdl9UXwe8k3BMhSn+PaBrbBiMlzpED7lXnVrwXAcyeEB5ZllJrZ2
   /l5MKOtpnKd02Iff1RplLnVLeaXdw0aRWON3svbY40XYKDVLFxR3rigyP
   2o6lqOf7aYWIzUaap4mJtW/2Mt+odjzWVRjC0KjO421/rZj/7JWiEJGo/
   gKBsTiaexK7Zs32rCGfuPug14NsV9/EZwX9zxuKs18pMhKenic6qgmIK+
   XIY1uGU/63rNdWzbLC3UpZVxyE/jK/xrXUTOtYMM8YXN7mMwLcr22XbyF
   A==;
X-CSE-ConnectionGUID: KeFYrnIMRXezo2l+thgT2A==
X-CSE-MsgGUID: fTkSgCn1SYGl1NrqT3GuIA==
X-IronPort-AV: E=McAfee;i="6700,10204,11298"; a="35736979"
X-IronPort-AV: E=Sophos;i="6.12,269,1728975600"; 
   d="scan'208";a="35736979"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Dec 2024 06:40:31 -0800
X-CSE-ConnectionGUID: TPuYzuppTy6pI2v+YYyJOA==
X-CSE-MsgGUID: pxqTnnc1TQGKBHL66ZxXKg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="101010951"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 27 Dec 2024 06:40:30 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tRBVr-0003Ek-1t;
	Fri, 27 Dec 2024 14:40:27 +0000
Date: Fri, 27 Dec 2024 22:39:33 +0800
From: kernel test robot <lkp@intel.com>
To: Suren Baghdasaryan <surenb@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH 1/2] alloc_tag: avoid current->alloc_tag manipulations
 when profiling is disabled
Message-ID: <202412272206.wWI5m9aG-lkp@intel.com>
References: <20241226211639.1357704-1-surenb@google.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241226211639.1357704-1-surenb@google.com>

Hi Suren,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 431614f1580a03c1a653340c55ea76bd12a9403f]

url:    https://github.com/intel-lab-lkp/linux/commits/Suren-Baghdasaryan/alloc_tag-skip-pgalloc_tag_swap-if-profiling-is-disabled/20241227-051744
base:   431614f1580a03c1a653340c55ea76bd12a9403f
patch link:    https://lore.kernel.org/r/20241226211639.1357704-1-surenb%40google.com
patch subject: [PATCH 1/2] alloc_tag: avoid current->alloc_tag manipulations when profiling is disabled
config: i386-randconfig-061-20241227 (https://download.01.org/0day-ci/archive/20241227/202412272206.wWI5m9aG-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241227/202412272206.wWI5m9aG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412272206.wWI5m9aG-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   kernel/power/energy_model.c:168:15: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct em_perf_table [noderef] __rcu *table @@     got struct em_perf_table * @@
   kernel/power/energy_model.c:168:15: sparse:     expected struct em_perf_table [noderef] __rcu *table
   kernel/power/energy_model.c:168:15: sparse:     got struct em_perf_table *
   kernel/power/energy_model.c:169:15: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const *objp @@     got struct em_perf_table [noderef] __rcu *table @@
   kernel/power/energy_model.c:169:15: sparse:     expected void const *objp
   kernel/power/energy_model.c:169:15: sparse:     got struct em_perf_table [noderef] __rcu *table
   kernel/power/energy_model.c:177:15: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct em_perf_table [noderef] __rcu *table @@     got struct em_perf_table * @@
   kernel/power/energy_model.c:177:15: sparse:     expected struct em_perf_table [noderef] __rcu *table
   kernel/power/energy_model.c:177:15: sparse:     got struct em_perf_table *
   kernel/power/energy_model.c:179:19: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct callback_head *head @@     got struct callback_head [noderef] __rcu * @@
   kernel/power/energy_model.c:179:19: sparse:     expected struct callback_head *head
   kernel/power/energy_model.c:179:19: sparse:     got struct callback_head [noderef] __rcu *
   kernel/power/energy_model.c:190:19: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct kref *kref @@     got struct kref [noderef] __rcu * @@
   kernel/power/energy_model.c:190:19: sparse:     expected struct kref *kref
   kernel/power/energy_model.c:190:19: sparse:     got struct kref [noderef] __rcu *
>> kernel/power/energy_model.c:208:15: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct em_perf_table [noderef] __rcu *table @@     got void *[assigned] _res @@
   kernel/power/energy_model.c:208:15: sparse:     expected struct em_perf_table [noderef] __rcu *table
   kernel/power/energy_model.c:208:15: sparse:     got void *[assigned] _res
   kernel/power/energy_model.c:212:20: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct kref *kref @@     got struct kref [noderef] __rcu * @@
   kernel/power/energy_model.c:212:20: sparse:     expected struct kref *kref
   kernel/power/energy_model.c:212:20: sparse:     got struct kref [noderef] __rcu *
   kernel/power/energy_model.c:328:19: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct kref *kref @@     got struct kref [noderef] __rcu * @@
   kernel/power/energy_model.c:328:19: sparse:     expected struct kref *kref
   kernel/power/energy_model.c:328:19: sparse:     got struct kref [noderef] __rcu *
   kernel/power/energy_model.c:333:45: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct em_perf_state *table @@     got struct em_perf_state [noderef] __rcu * @@
   kernel/power/energy_model.c:333:45: sparse:     expected struct em_perf_state *table
   kernel/power/energy_model.c:333:45: sparse:     got struct em_perf_state [noderef] __rcu *
   kernel/power/energy_model.c:433:45: sparse: sparse: incorrect type in argument 3 (different address spaces) @@     expected struct em_perf_state *table @@     got struct em_perf_state [noderef] __rcu * @@
   kernel/power/energy_model.c:433:45: sparse:     expected struct em_perf_state *table
   kernel/power/energy_model.c:433:45: sparse:     got struct em_perf_state [noderef] __rcu *
   kernel/power/energy_model.c:450:15: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const *objp @@     got struct em_perf_table [noderef] __rcu *[assigned] em_table @@
   kernel/power/energy_model.c:450:15: sparse:     expected void const *objp
   kernel/power/energy_model.c:450:15: sparse:     got struct em_perf_table [noderef] __rcu *[assigned] em_table
   kernel/power/energy_model.c:634:55: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct em_perf_state *table @@     got struct em_perf_state [noderef] __rcu * @@
   kernel/power/energy_model.c:634:55: sparse:     expected struct em_perf_state *table
   kernel/power/energy_model.c:634:55: sparse:     got struct em_perf_state [noderef] __rcu *
   kernel/power/energy_model.c:689:16: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct em_perf_state *new_ps @@     got struct em_perf_state [noderef] __rcu * @@
   kernel/power/energy_model.c:689:16: sparse:     expected struct em_perf_state *new_ps
   kernel/power/energy_model.c:689:16: sparse:     got struct em_perf_state [noderef] __rcu *
   kernel/power/energy_model.c:707:37: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct em_perf_state *table @@     got struct em_perf_state [noderef] __rcu * @@
   kernel/power/energy_model.c:707:37: sparse:     expected struct em_perf_state *table
   kernel/power/energy_model.c:707:37: sparse:     got struct em_perf_state [noderef] __rcu *
   kernel/power/energy_model.c:742:38: sparse: sparse: incorrect type in argument 3 (different address spaces) @@     expected struct em_perf_state *table @@     got struct em_perf_state [noderef] __rcu * @@
   kernel/power/energy_model.c:742:38: sparse:     expected struct em_perf_state *table
   kernel/power/energy_model.c:742:38: sparse:     got struct em_perf_state [noderef] __rcu *
   kernel/power/energy_model.c:846:53: sparse: sparse: dereference of noderef expression
   kernel/power/energy_model.c:855:32: sparse: sparse: dereference of noderef expression

vim +208 kernel/power/energy_model.c

ffcf9bce7af02a Lukasz Luba 2024-02-08  192  
ffcf9bce7af02a Lukasz Luba 2024-02-08  193  /**
ffcf9bce7af02a Lukasz Luba 2024-02-08  194   * em_table_alloc() - Allocate a new EM table
ffcf9bce7af02a Lukasz Luba 2024-02-08  195   * @pd		: EM performance domain for which this must be done
ffcf9bce7af02a Lukasz Luba 2024-02-08  196   *
ffcf9bce7af02a Lukasz Luba 2024-02-08  197   * Allocate a new EM table and initialize its kref to indicate that it
ffcf9bce7af02a Lukasz Luba 2024-02-08  198   * has a user.
ffcf9bce7af02a Lukasz Luba 2024-02-08  199   * Returns allocated table or NULL.
ffcf9bce7af02a Lukasz Luba 2024-02-08  200   */
ffcf9bce7af02a Lukasz Luba 2024-02-08  201  struct em_perf_table __rcu *em_table_alloc(struct em_perf_domain *pd)
ca0fc871f16f4b Lukasz Luba 2024-02-08  202  {
ca0fc871f16f4b Lukasz Luba 2024-02-08  203  	struct em_perf_table __rcu *table;
ca0fc871f16f4b Lukasz Luba 2024-02-08  204  	int table_size;
ca0fc871f16f4b Lukasz Luba 2024-02-08  205  
ca0fc871f16f4b Lukasz Luba 2024-02-08  206  	table_size = sizeof(struct em_perf_state) * pd->nr_perf_states;
ca0fc871f16f4b Lukasz Luba 2024-02-08  207  
ca0fc871f16f4b Lukasz Luba 2024-02-08 @208  	table = kzalloc(sizeof(*table) + table_size, GFP_KERNEL);
ffcf9bce7af02a Lukasz Luba 2024-02-08  209  	if (!table)
ffcf9bce7af02a Lukasz Luba 2024-02-08  210  		return NULL;
ffcf9bce7af02a Lukasz Luba 2024-02-08  211  
ffcf9bce7af02a Lukasz Luba 2024-02-08  212  	kref_init(&table->kref);
ffcf9bce7af02a Lukasz Luba 2024-02-08  213  
ca0fc871f16f4b Lukasz Luba 2024-02-08  214  	return table;
ca0fc871f16f4b Lukasz Luba 2024-02-08  215  }
ca0fc871f16f4b Lukasz Luba 2024-02-08  216  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
