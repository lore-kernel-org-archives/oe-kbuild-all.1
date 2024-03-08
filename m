Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FFD454792
	for <oe-kbuild-all@lists.linux.dev>; Fri,  8 Mar 2024 18:23:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709922183; cv=none; b=ENyrunM0m5kmrfxeMWkx5HQfauh7C9zlwxrYQlaVJiBuXyjQpBhKiMAY4Z0tdlOKk4vSVR78fLFGQWtp42SwKr5hpSE3NpeWRm8nyCZ0lHLdw1DpENB7+++asW2M+AXL+SftwxipwlvjovH62Wl/nPTwlNeH8vs9q+A2cQgGmcg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709922183; c=relaxed/simple;
	bh=mvKf5HYYHZdhJWDbpiY/rcXOew1+XJl8VyjG+W0zWxE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=uAJD/r0uyAIa0uF986b61Yx1hWbL/dPxbfb+neuYVE0n8znOSDpssU1F+q8nOBNhEEV11N/FvHzT92TDrwJOoSM0GidbtHHEzCZn8rf2Jkn4Hi6Q+P3iELCZsHfxvNFQ8EGWqgFp8MAgI1sudx4IhsIxqx+/Dzfkle77g4lpPFg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CCO1501S; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CCO1501S"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709922181; x=1741458181;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=mvKf5HYYHZdhJWDbpiY/rcXOew1+XJl8VyjG+W0zWxE=;
  b=CCO1501So8ypLRwHYJuR2udtJUZtZC3V0Wbey54t0tZj8yIqA7BDLX8m
   jpcJMKTCSmVi7xy7nkV1XwsOCxEfpM3wj4zQg0TxcgdUjH9SHM9kzHHwe
   Ty/gPwY+6pYF0fGPOXvjOMQAa9iTLdfqF1kCWWBdnuaaA5o6Sn1RPZ/rw
   bFLyZAHk/f1g11ksdiMinHae3PLwMB5MdS7MSL5ol437olCnJcZ8km5jA
   J9r9hQHeMJ8OLe7BusZL/caU1S9O1+QPhHNEGIgpjKNYXKFMuXCvx05DU
   w598MBjTl4unSscJw2O1H3irGNZFacafK7PVngZ+bgJp7PFXHz/63u/BV
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11007"; a="4498061"
X-IronPort-AV: E=Sophos;i="6.07,110,1708416000"; 
   d="scan'208";a="4498061"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Mar 2024 10:23:00 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,110,1708416000"; 
   d="scan'208";a="41508645"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 08 Mar 2024 10:22:59 -0800
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rierw-0006bT-1i;
	Fri, 08 Mar 2024 18:22:56 +0000
Date: Sat, 9 Mar 2024 02:22:32 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Cheng Jian <cj.chengjian@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 15642/21783]
 kernel/sched/topology.c:1624:32: sparse: sparse: incorrect type in
 initializer (different base types)
Message-ID: <202403090244.2pF6BywY-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   eac3c6a044aaf481751d9f7fb4b6096ae431e167
commit: b3cf6ed8fbc01dda9fe93f5d4c1877a68d344678 [15642/21783] sched/topology: Provide cfs_overload_cpus bitmap
config: x86_64-randconfig-r131-20240304 (https://download.01.org/0day-ci/archive/20240309/202403090244.2pF6BywY-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240309/202403090244.2pF6BywY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403090244.2pF6BywY-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   kernel/sched/topology.c:11:15: sparse: sparse: symbol 'sched_domains_tmpmask' was not declared. Should it be static?
   kernel/sched/topology.c:12:15: sparse: sparse: symbol 'sched_domains_tmpmask2' was not declared. Should it be static?
>> kernel/sched/topology.c:1624:32: sparse: sparse: incorrect type in initializer (different base types) @@     expected int flags @@     got restricted gfp_t @@
   kernel/sched/topology.c:1624:32: sparse:     expected int flags
   kernel/sched/topology.c:1624:32: sparse:     got restricted gfp_t
>> kernel/sched/topology.c:1632:61: sparse: sparse: incorrect type in argument 3 (different base types) @@     expected restricted gfp_t [usertype] flags @@     got int flags @@
   kernel/sched/topology.c:1632:61: sparse:     expected restricted gfp_t [usertype] flags
   kernel/sched/topology.c:1632:61: sparse:     got int flags
   kernel/sched/topology.c:428:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/topology.c:428:9: sparse:    struct sparsemask [noderef] __rcu *
   kernel/sched/topology.c:428:9: sparse:    struct sparsemask *
   kernel/sched/topology.c:429:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/topology.c:429:9: sparse:    struct sched_domain [noderef] __rcu *
   kernel/sched/topology.c:429:9: sparse:    struct sched_domain *
   kernel/sched/topology.c:432:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/topology.c:432:9: sparse:    struct sched_domain_shared [noderef] __rcu *
   kernel/sched/topology.c:432:9: sparse:    struct sched_domain_shared *
   kernel/sched/topology.c:435:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/topology.c:435:9: sparse:    struct sched_domain [noderef] __rcu *
   kernel/sched/topology.c:435:9: sparse:    struct sched_domain *
   kernel/sched/topology.c:438:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/topology.c:438:9: sparse:    struct sched_domain [noderef] __rcu *
   kernel/sched/topology.c:438:9: sparse:    struct sched_domain *
   kernel/sched/topology.c:485:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/topology.c:485:9: sparse:    struct sched_domain [noderef] __rcu *
   kernel/sched/topology.c:485:9: sparse:    struct sched_domain *
   kernel/sched/topology.c: note: in included file:
   kernel/sched/sched.h:1206:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:1206:9: sparse:    struct sched_domain [noderef] __rcu *
   kernel/sched/sched.h:1206:9: sparse:    struct sched_domain *
   kernel/sched/sched.h:1219:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:1219:9: sparse:    struct sched_domain [noderef] __rcu *
   kernel/sched/sched.h:1219:9: sparse:    struct sched_domain *
   kernel/sched/sched.h:1206:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   kernel/sched/sched.h:1206:9: sparse:    struct sched_domain [noderef] __rcu *
   kernel/sched/sched.h:1206:9: sparse:    struct sched_domain *
   In file included from kernel/sched/topology.c:5:
   In file included from kernel/sched/sched.h:39:
   In file included from include/linux/blkdev.h:16:
   include/linux/pagemap.h:425:21: warning: cast from 'int (*)(struct file *, struct page *)' to 'filler_t *' (aka 'int (*)(void *, struct page *)') converts to incompatible function type [-Wcast-function-type-strict]
     425 |         filler_t *filler = (filler_t *)mapping->a_ops->readpage;
         |                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from kernel/sched/topology.c:5:
   kernel/sched/sched.h:1169:15: warning: cast from 'void (*)(struct rq *)' to 'void (*)(struct callback_head *)' converts to incompatible function type [-Wcast-function-type-strict]
    1169 |         head->func = (void (*)(struct callback_head *))func;
         |                      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   2 warnings generated.

vim +1624 kernel/sched/topology.c

  1618	
  1619	static int sd_llc_alloc(struct sched_domain *sd)
  1620	{
  1621		struct sched_domain_shared *sds = sd->shared;
  1622		struct cpumask *span = sched_domain_span(sd);
  1623		int nid = cpu_to_node(cpumask_first(span));
> 1624		int flags = __GFP_ZERO | GFP_KERNEL;
  1625		struct sparsemask *mask;
  1626	
  1627		/*
  1628		 * Allocate the bitmap if not already allocated.  This is called for
  1629		 * every CPU in the LLC but only allocates once per sd_llc_shared.
  1630		 */
  1631		if (!sds->cfs_overload_cpus) {
> 1632			mask = sparsemask_alloc_node(nr_cpu_ids, 3, flags, nid);
  1633			if (!mask)
  1634				return 1;
  1635			sds->cfs_overload_cpus = mask;
  1636		}
  1637	
  1638		return 0;
  1639	}
  1640	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
