Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FCF7194ADE
	for <oe-kbuild-all@lists.linux.dev>; Mon, 17 Jun 2024 11:24:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718623489; cv=none; b=KUWUNnQGf0FN6bBod+L+Zz1KAB0QhEd+Saeo+ncC0c6da4MArrm/l3mnMgtigW4bMU9MuogQuDH1XLUtviiMYAQmUpWCgshNLy6zcM41Fl0MRcyr1ujecmsLtIYtz+TwJcLFxxvZbZkrx5monk/ySVQgW0DXVHUt0Tpp6UZCM8s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718623489; c=relaxed/simple;
	bh=sRhB1/jcEdYfjMqOrKqPTiWhyJG6E966KMcQu8v7Vic=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=aHtz/yQf4d1LrdTTmvzGkF7ArU8SChlDg/7PjKRRVUYCA8hq1UTi9DxSHZ0IUuEQv1Q9uHGu7PYk9t6GAA81n6EQH3/4044ikgm5RnoEP2qGZI+qK9Vk159IRAHp2LVQxhnEwiwmpil9kgj2IoQEM5RqJfwsFfnojHd4A4PyAP4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WB+dRaqo; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WB+dRaqo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718623487; x=1750159487;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=sRhB1/jcEdYfjMqOrKqPTiWhyJG6E966KMcQu8v7Vic=;
  b=WB+dRaqo/alRE2W/qVXv6PCMfNrS5JvpNyY4oM1rgJuxJ5g3q0iI5lQu
   jZXSo36wyKli/6p9m3RH5e7LP/Gz88wa9iShxS2PMJNKl+G/7kGcFs6xO
   /ubZSjhuEehTzkVNWuunh34Jc+qgr9l3Ivu9NAUvIk3h2/7vw3YMKmqyj
   3O8PT2xssrzl6e6CRfl1UfbNTyspPiMtRaEsztcDcBE4xcw+/buhmv1/W
   GZLnp1rGHDozPy9ixzhuKMRl/ONRdDunYYKEnDBcEQsVuW39f2zRKrsLz
   n7gJRXVlOxQ+OqL3eTNjUOfeyBMswBHFmlRrWJ2O05PlnKi5PKAl9Q7Iq
   w==;
X-CSE-ConnectionGUID: oxS9iu77RkaSuhegBXxy/Q==
X-CSE-MsgGUID: J1fx3XdpTxS5PUkVDR1LEw==
X-IronPort-AV: E=McAfee;i="6700,10204,11105"; a="15214984"
X-IronPort-AV: E=Sophos;i="6.08,244,1712646000"; 
   d="scan'208";a="15214984"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jun 2024 04:24:46 -0700
X-CSE-ConnectionGUID: vJPnwUAwQSCWugSQ9QOnrQ==
X-CSE-MsgGUID: kgdlfD2KRL2eU+bUOMgUqg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,244,1712646000"; 
   d="scan'208";a="46281442"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 17 Jun 2024 04:24:45 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sJATa-0004Dq-11;
	Mon, 17 Jun 2024 11:24:42 +0000
Date: Mon, 17 Jun 2024 19:24:16 +0800
From: kernel test robot <lkp@intel.com>
To: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Guo Ren <guoren@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [morimoto:renesas-bsp/v6.1.94-2024-06-17 52/661]
 drivers/iommu/ipmmu-vmsa.c:485:undefined reference to `free_io_pgtable_ops'
Message-ID: <202406171924.M6q32pv6-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/morimoto/linux renesas-bsp/v6.1.94-2024-06-17
head:   6ce189abfade2a17cc6b84c39ec1d82e4be871b2
commit: d623e64054303ef67c85496510b46687497508ab [52/661] riscv: Kconfig.socs: Add ARCH_RENESAS kconfig option
config: riscv-randconfig-002-20240617 (https://download.01.org/0day-ci/archive/20240617/202406171924.M6q32pv6-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240617/202406171924.M6q32pv6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406171924.M6q32pv6-lkp@intel.com/

All errors (new ones prefixed by >>):

   riscv64-linux-ld: drivers/iommu/ipmmu-vmsa.o: in function `ipmmu_domain_destroy_context':
>> drivers/iommu/ipmmu-vmsa.c:485:(.text+0x98e): undefined reference to `free_io_pgtable_ops'
   riscv64-linux-ld: drivers/iommu/ipmmu-vmsa.o: in function `ipmmu_domain_allocate_context':
>> drivers/iommu/ipmmu-vmsa.c:342:(.text+0xf5e): undefined reference to `alloc_io_pgtable_ops'

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for IOMMU_IO_PGTABLE_LPAE
   Depends on [n]: IOMMU_SUPPORT [=y] && (ARM || ARM64 || COMPILE_TEST [=n] && !GENERIC_ATOMIC64 [=n])
   Selected by [y]:
   - IPMMU_VMSA [=y] && IOMMU_SUPPORT [=y] && (ARCH_RENESAS [=y] || COMPILE_TEST [=n] && !GENERIC_ATOMIC64 [=n])


vim +485 drivers/iommu/ipmmu-vmsa.c

f20ed39f53145e Laurent Pinchart     2015-01-20  331  
d25a2a16f0889d Laurent Pinchart     2014-04-02  332  /* -----------------------------------------------------------------------------
d25a2a16f0889d Laurent Pinchart     2014-04-02  333   * Domain/Context Management
d25a2a16f0889d Laurent Pinchart     2014-04-02  334   */
d25a2a16f0889d Laurent Pinchart     2014-04-02  335  
dbb7069223bed0 Magnus Damm          2017-05-17  336  static int ipmmu_domain_allocate_context(struct ipmmu_vmsa_device *mmu,
dbb7069223bed0 Magnus Damm          2017-05-17  337  					 struct ipmmu_vmsa_domain *domain)
dbb7069223bed0 Magnus Damm          2017-05-17  338  {
dbb7069223bed0 Magnus Damm          2017-05-17  339  	unsigned long flags;
dbb7069223bed0 Magnus Damm          2017-05-17  340  	int ret;
dbb7069223bed0 Magnus Damm          2017-05-17  341  
dbb7069223bed0 Magnus Damm          2017-05-17 @342  	spin_lock_irqsave(&mmu->lock, flags);
dbb7069223bed0 Magnus Damm          2017-05-17  343  
5fd163416fb7b6 Magnus Damm          2017-10-16  344  	ret = find_first_zero_bit(mmu->ctx, mmu->num_ctx);
5fd163416fb7b6 Magnus Damm          2017-10-16  345  	if (ret != mmu->num_ctx) {
dbb7069223bed0 Magnus Damm          2017-05-17  346  		mmu->domains[ret] = domain;
dbb7069223bed0 Magnus Damm          2017-05-17  347  		set_bit(ret, mmu->ctx);
5fd163416fb7b6 Magnus Damm          2017-10-16  348  	} else
5fd163416fb7b6 Magnus Damm          2017-10-16  349  		ret = -EBUSY;
dbb7069223bed0 Magnus Damm          2017-05-17  350  
dbb7069223bed0 Magnus Damm          2017-05-17  351  	spin_unlock_irqrestore(&mmu->lock, flags);
dbb7069223bed0 Magnus Damm          2017-05-17  352  
dbb7069223bed0 Magnus Damm          2017-05-17  353  	return ret;
dbb7069223bed0 Magnus Damm          2017-05-17  354  }
dbb7069223bed0 Magnus Damm          2017-05-17  355  
a175a67d306ab3 Oleksandr Tyshchenko 2017-08-23  356  static void ipmmu_domain_free_context(struct ipmmu_vmsa_device *mmu,
a175a67d306ab3 Oleksandr Tyshchenko 2017-08-23  357  				      unsigned int context_id)
a175a67d306ab3 Oleksandr Tyshchenko 2017-08-23  358  {
a175a67d306ab3 Oleksandr Tyshchenko 2017-08-23  359  	unsigned long flags;
a175a67d306ab3 Oleksandr Tyshchenko 2017-08-23  360  
a175a67d306ab3 Oleksandr Tyshchenko 2017-08-23  361  	spin_lock_irqsave(&mmu->lock, flags);
a175a67d306ab3 Oleksandr Tyshchenko 2017-08-23  362  
a175a67d306ab3 Oleksandr Tyshchenko 2017-08-23  363  	clear_bit(context_id, mmu->ctx);
a175a67d306ab3 Oleksandr Tyshchenko 2017-08-23  364  	mmu->domains[context_id] = NULL;
a175a67d306ab3 Oleksandr Tyshchenko 2017-08-23  365  
a175a67d306ab3 Oleksandr Tyshchenko 2017-08-23  366  	spin_unlock_irqrestore(&mmu->lock, flags);
a175a67d306ab3 Oleksandr Tyshchenko 2017-08-23  367  }
a175a67d306ab3 Oleksandr Tyshchenko 2017-08-23  368  
892db541cc68eb Geert Uytterhoeven   2019-05-27  369  static void ipmmu_domain_setup_context(struct ipmmu_vmsa_domain *domain)
d25a2a16f0889d Laurent Pinchart     2014-04-02  370  {
f64232eee61906 Geert Uytterhoeven   2015-12-22  371  	u64 ttbr;
c295f504fb5a38 Magnus Damm          2017-10-16  372  	u32 tmp;
a175a67d306ab3 Oleksandr Tyshchenko 2017-08-23  373  
d25a2a16f0889d Laurent Pinchart     2014-04-02  374  	/* TTBR0 */
d1e5f26f14272b Robin Murphy         2019-10-25  375  	ttbr = domain->cfg.arm_lpae_s1_cfg.ttbr;
d574893aee991e Magnus Damm          2017-10-16  376  	ipmmu_ctx_write_root(domain, IMTTLBR0, ttbr);
d574893aee991e Magnus Damm          2017-10-16  377  	ipmmu_ctx_write_root(domain, IMTTUBR0, ttbr >> 32);
d25a2a16f0889d Laurent Pinchart     2014-04-02  378  
d25a2a16f0889d Laurent Pinchart     2014-04-02  379  	/*
d25a2a16f0889d Laurent Pinchart     2014-04-02  380  	 * TTBCR
3623002f0f761e Hai Nguyen Pham      2019-09-04  381  	 * We use long descriptors and allocate the whole 32-bit VA space to
3623002f0f761e Hai Nguyen Pham      2019-09-04  382  	 * TTBR0.
d25a2a16f0889d Laurent Pinchart     2014-04-02  383  	 */
c295f504fb5a38 Magnus Damm          2017-10-16  384  	if (domain->mmu->features->twobit_imttbcr_sl0)
c295f504fb5a38 Magnus Damm          2017-10-16  385  		tmp = IMTTBCR_SL0_TWOBIT_LVL_1;
c295f504fb5a38 Magnus Damm          2017-10-16  386  	else
c295f504fb5a38 Magnus Damm          2017-10-16  387  		tmp = IMTTBCR_SL0_LVL_1;
c295f504fb5a38 Magnus Damm          2017-10-16  388  
3623002f0f761e Hai Nguyen Pham      2019-09-04  389  	if (domain->mmu->features->cache_snoop)
3623002f0f761e Hai Nguyen Pham      2019-09-04  390  		tmp |= IMTTBCR_SH0_INNER_SHAREABLE | IMTTBCR_ORGN0_WB_WA |
3623002f0f761e Hai Nguyen Pham      2019-09-04  391  		       IMTTBCR_IRGN0_WB_WA;
3623002f0f761e Hai Nguyen Pham      2019-09-04  392  
3623002f0f761e Hai Nguyen Pham      2019-09-04  393  	ipmmu_ctx_write_root(domain, IMTTBCR, IMTTBCR_EAE | tmp);
d25a2a16f0889d Laurent Pinchart     2014-04-02  394  
f20ed39f53145e Laurent Pinchart     2015-01-20  395  	/* MAIR0 */
d574893aee991e Magnus Damm          2017-10-16  396  	ipmmu_ctx_write_root(domain, IMMAIR0,
205577ab6f7ade Robin Murphy         2019-10-25  397  			     domain->cfg.arm_lpae_s1_cfg.mair);
d25a2a16f0889d Laurent Pinchart     2014-04-02  398  
d25a2a16f0889d Laurent Pinchart     2014-04-02  399  	/* IMBUSCR */
f5c858912acd2b Magnus Damm          2017-10-16  400  	if (domain->mmu->features->setup_imbuscr)
d574893aee991e Magnus Damm          2017-10-16  401  		ipmmu_ctx_write_root(domain, IMBUSCR,
d574893aee991e Magnus Damm          2017-10-16  402  				     ipmmu_ctx_read_root(domain, IMBUSCR) &
d25a2a16f0889d Laurent Pinchart     2014-04-02  403  				     ~(IMBUSCR_DVM | IMBUSCR_BUSSEL_MASK));
d25a2a16f0889d Laurent Pinchart     2014-04-02  404  
d25a2a16f0889d Laurent Pinchart     2014-04-02  405  	/*
d25a2a16f0889d Laurent Pinchart     2014-04-02  406  	 * IMSTR
d25a2a16f0889d Laurent Pinchart     2014-04-02  407  	 * Clear all interrupt flags.
d25a2a16f0889d Laurent Pinchart     2014-04-02  408  	 */
d574893aee991e Magnus Damm          2017-10-16  409  	ipmmu_ctx_write_root(domain, IMSTR, ipmmu_ctx_read_root(domain, IMSTR));
d25a2a16f0889d Laurent Pinchart     2014-04-02  410  
d25a2a16f0889d Laurent Pinchart     2014-04-02  411  	/*
d25a2a16f0889d Laurent Pinchart     2014-04-02  412  	 * IMCTR
d25a2a16f0889d Laurent Pinchart     2014-04-02  413  	 * Enable the MMU and interrupt generation. The long-descriptor
d25a2a16f0889d Laurent Pinchart     2014-04-02  414  	 * translation table format doesn't use TEX remapping. Don't enable AF
d25a2a16f0889d Laurent Pinchart     2014-04-02  415  	 * software management as we have no use for it. Flush the TLB as
d25a2a16f0889d Laurent Pinchart     2014-04-02  416  	 * required when modifying the context registers.
d25a2a16f0889d Laurent Pinchart     2014-04-02  417  	 */
d574893aee991e Magnus Damm          2017-10-16  418  	ipmmu_ctx_write_all(domain, IMCTR,
d574893aee991e Magnus Damm          2017-10-16  419  			    IMCTR_INTEN | IMCTR_FLUSH | IMCTR_MMUEN);
892db541cc68eb Geert Uytterhoeven   2019-05-27  420  }
892db541cc68eb Geert Uytterhoeven   2019-05-27  421  
892db541cc68eb Geert Uytterhoeven   2019-05-27  422  static int ipmmu_domain_init_context(struct ipmmu_vmsa_domain *domain)
892db541cc68eb Geert Uytterhoeven   2019-05-27  423  {
892db541cc68eb Geert Uytterhoeven   2019-05-27  424  	int ret;
892db541cc68eb Geert Uytterhoeven   2019-05-27  425  
892db541cc68eb Geert Uytterhoeven   2019-05-27  426  	/*
892db541cc68eb Geert Uytterhoeven   2019-05-27  427  	 * Allocate the page table operations.
892db541cc68eb Geert Uytterhoeven   2019-05-27  428  	 *
892db541cc68eb Geert Uytterhoeven   2019-05-27  429  	 * VMSA states in section B3.6.3 "Control of Secure or Non-secure memory
892db541cc68eb Geert Uytterhoeven   2019-05-27  430  	 * access, Long-descriptor format" that the NStable bit being set in a
892db541cc68eb Geert Uytterhoeven   2019-05-27  431  	 * table descriptor will result in the NStable and NS bits of all child
892db541cc68eb Geert Uytterhoeven   2019-05-27  432  	 * entries being ignored and considered as being set. The IPMMU seems
892db541cc68eb Geert Uytterhoeven   2019-05-27  433  	 * not to comply with this, as it generates a secure access page fault
892db541cc68eb Geert Uytterhoeven   2019-05-27  434  	 * if any of the NStable and NS bits isn't set when running in
892db541cc68eb Geert Uytterhoeven   2019-05-27  435  	 * non-secure mode.
892db541cc68eb Geert Uytterhoeven   2019-05-27  436  	 */
892db541cc68eb Geert Uytterhoeven   2019-05-27  437  	domain->cfg.quirks = IO_PGTABLE_QUIRK_ARM_NS;
892db541cc68eb Geert Uytterhoeven   2019-05-27  438  	domain->cfg.pgsize_bitmap = SZ_1G | SZ_2M | SZ_4K;
892db541cc68eb Geert Uytterhoeven   2019-05-27  439  	domain->cfg.ias = 32;
892db541cc68eb Geert Uytterhoeven   2019-05-27  440  	domain->cfg.oas = 40;
298f78895b0819 Will Deacon          2019-07-02  441  	domain->cfg.tlb = &ipmmu_flush_ops;
892db541cc68eb Geert Uytterhoeven   2019-05-27  442  	domain->io_domain.geometry.aperture_end = DMA_BIT_MASK(32);
892db541cc68eb Geert Uytterhoeven   2019-05-27  443  	domain->io_domain.geometry.force_aperture = true;
892db541cc68eb Geert Uytterhoeven   2019-05-27  444  	/*
892db541cc68eb Geert Uytterhoeven   2019-05-27  445  	 * TODO: Add support for coherent walk through CCI with DVM and remove
892db541cc68eb Geert Uytterhoeven   2019-05-27  446  	 * cache handling. For now, delegate it to the io-pgtable code.
892db541cc68eb Geert Uytterhoeven   2019-05-27  447  	 */
3430abd6f403ce Joerg Roedel         2019-07-01  448  	domain->cfg.coherent_walk = false;
892db541cc68eb Geert Uytterhoeven   2019-05-27  449  	domain->cfg.iommu_dev = domain->mmu->root->dev;
892db541cc68eb Geert Uytterhoeven   2019-05-27  450  
892db541cc68eb Geert Uytterhoeven   2019-05-27  451  	/*
892db541cc68eb Geert Uytterhoeven   2019-05-27  452  	 * Find an unused context.
892db541cc68eb Geert Uytterhoeven   2019-05-27  453  	 */
892db541cc68eb Geert Uytterhoeven   2019-05-27  454  	ret = ipmmu_domain_allocate_context(domain->mmu->root, domain);
892db541cc68eb Geert Uytterhoeven   2019-05-27  455  	if (ret < 0)
892db541cc68eb Geert Uytterhoeven   2019-05-27  456  		return ret;
892db541cc68eb Geert Uytterhoeven   2019-05-27  457  
892db541cc68eb Geert Uytterhoeven   2019-05-27  458  	domain->context_id = ret;
892db541cc68eb Geert Uytterhoeven   2019-05-27  459  
892db541cc68eb Geert Uytterhoeven   2019-05-27  460  	domain->iop = alloc_io_pgtable_ops(ARM_32_LPAE_S1, &domain->cfg,
892db541cc68eb Geert Uytterhoeven   2019-05-27  461  					   domain);
892db541cc68eb Geert Uytterhoeven   2019-05-27  462  	if (!domain->iop) {
892db541cc68eb Geert Uytterhoeven   2019-05-27  463  		ipmmu_domain_free_context(domain->mmu->root,
892db541cc68eb Geert Uytterhoeven   2019-05-27  464  					  domain->context_id);
892db541cc68eb Geert Uytterhoeven   2019-05-27  465  		return -EINVAL;
892db541cc68eb Geert Uytterhoeven   2019-05-27  466  	}
d25a2a16f0889d Laurent Pinchart     2014-04-02  467  
892db541cc68eb Geert Uytterhoeven   2019-05-27  468  	ipmmu_domain_setup_context(domain);
d25a2a16f0889d Laurent Pinchart     2014-04-02  469  	return 0;
d25a2a16f0889d Laurent Pinchart     2014-04-02  470  }
d25a2a16f0889d Laurent Pinchart     2014-04-02  471  
d25a2a16f0889d Laurent Pinchart     2014-04-02  472  static void ipmmu_domain_destroy_context(struct ipmmu_vmsa_domain *domain)
d25a2a16f0889d Laurent Pinchart     2014-04-02  473  {
e5b78f2e349eef Geert Uytterhoeven   2018-11-07  474  	if (!domain->mmu)
e5b78f2e349eef Geert Uytterhoeven   2018-11-07  475  		return;
e5b78f2e349eef Geert Uytterhoeven   2018-11-07  476  
d25a2a16f0889d Laurent Pinchart     2014-04-02  477  	/*
d25a2a16f0889d Laurent Pinchart     2014-04-02  478  	 * Disable the context. Flush the TLB as required when modifying the
d25a2a16f0889d Laurent Pinchart     2014-04-02  479  	 * context registers.
d25a2a16f0889d Laurent Pinchart     2014-04-02  480  	 *
d25a2a16f0889d Laurent Pinchart     2014-04-02  481  	 * TODO: Is TLB flush really needed ?
d25a2a16f0889d Laurent Pinchart     2014-04-02  482  	 */
d574893aee991e Magnus Damm          2017-10-16  483  	ipmmu_ctx_write_all(domain, IMCTR, IMCTR_FLUSH);
d25a2a16f0889d Laurent Pinchart     2014-04-02  484  	ipmmu_tlb_sync(domain);
fd5140e29a59e0 Magnus Damm          2017-10-16 @485  	ipmmu_domain_free_context(domain->mmu->root, domain->context_id);
d25a2a16f0889d Laurent Pinchart     2014-04-02  486  }
d25a2a16f0889d Laurent Pinchart     2014-04-02  487  

:::::: The code at line 485 was first introduced by commit
:::::: fd5140e29a59e04a6c3e8cc56536bda3e60bbf49 iommu/ipmmu-vmsa: Add optional root device feature

:::::: TO: Magnus Damm <damm+renesas@opensource.se>
:::::: CC: Alex Williamson <alex.williamson@redhat.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
