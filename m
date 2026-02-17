Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C09E931C576
	for <oe-kbuild-all@lists.linux.dev>; Tue, 17 Feb 2026 22:42:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771368141; cv=none; b=omQmEu3TL4/zEDYdiWuakpUpE0X1ezGWswxZ5pswAg0fJPXUWGRxNwhLtvwT1vkE31ZdKC7TZxSslQYwLN0riK+n5gIVoLtA/je6KbEcIFupa/1qv7opKPtAY5fvrvOc7JTi3qSilW/SV+oZUN3ee1eaqMzK+To+PyuRHUbfDR4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771368141; c=relaxed/simple;
	bh=gFeOFj6Z4eOFuoIhYFQGbrkWX9ka8rCSLARXM5k0Y28=;
	h=Date:From:To:Cc:Subject:Message-ID; b=kU2DrsJqkguVSVJjnn9k7HAbIEw8BJvn6Y5W8zZlpg85pPnfjHShRYg9vo+NnznM1JdJCRbbA+0igpwQCq5DM2YlExrsRE+ndoRyVpQgMpnZsHyD4glEPwEMAY+GL1mnRsIyqlPy6L4QMSl5smEqNP1nBWHtEBsFVto/M95hvTU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=l7RJEJ1q; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="l7RJEJ1q"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771368140; x=1802904140;
  h=date:from:to:cc:subject:message-id;
  bh=gFeOFj6Z4eOFuoIhYFQGbrkWX9ka8rCSLARXM5k0Y28=;
  b=l7RJEJ1qVl9JeZDXBXhG5DIQGqy4C/yMmTswXl8cTO1NZifZ5Y0mXQtc
   /lpnawooHzITkLWY8l/iHdfaRugBSf8Tbk5QM4fpbnjuts/fkbui3y85l
   sbTszec9EN/1EEa5eyrWjYIXepOtxEWgqLCDbvPcZ+xyEyetbBIJbgCGW
   mu1GT8p62KpqhXoIfNPYlEQwnJi/X4D4xyIAM/pw8eol8+fMS+aXKACkd
   rihJt+KJxU/v2mV1+hhoyJGOYB4hNbhvWWGyFbxV1la0EmWAeXC5U68yu
   kVwlMRnvbMR3dRAPgu/L2m+dElmpMg/lz/ugx89lM8oik5Fni98EF51QF
   Q==;
X-CSE-ConnectionGUID: Izk2ZICfQNW4PxDz/OuWxw==
X-CSE-MsgGUID: anL82EO5SkiTFMQuV2u5GQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11704"; a="76307700"
X-IronPort-AV: E=Sophos;i="6.21,297,1763452800"; 
   d="scan'208";a="76307700"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Feb 2026 14:42:19 -0800
X-CSE-ConnectionGUID: jJ++8fiCQB6vVU+yl0FT3g==
X-CSE-MsgGUID: OEwpNpaGQ+yrdSoyXHVvDg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,297,1763452800"; 
   d="scan'208";a="218556807"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 17 Feb 2026 14:42:17 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vsTln-000000011lI-1DGf;
	Tue, 17 Feb 2026 22:42:15 +0000
Date: Wed, 18 Feb 2026 06:42:02 +0800
From: kernel test robot <lkp@intel.com>
To: Ido Schimmel <idosch@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev, Petr Machata <petrm@nvidia.com>
Subject: [jpirko-mlxsw:combined_queue 14/14]
 drivers/mmc/host/dw_mmc.c:606:29: sparse: sparse: incorrect type in argument
 1 (different address spaces)
Message-ID: <202602180637.f9ALfUbC-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/jpirko/linux_mlxsw combined_queue
head:   795595cd79ba6d53ee6165ab807c5452487ec0f3
commit: 795595cd79ba6d53ee6165ab807c5452487ec0f3 [14/14] TMP: Revert "module: Add compile-time check for embedded NUL characters"
config: csky-randconfig-r132-20260218 (https://download.01.org/0day-ci/archive/20260218/202602180637.f9ALfUbC-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 9.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260218/202602180637.f9ALfUbC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602180637.f9ALfUbC-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/mmc/host/dw_mmc.c:606:29: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got unsigned int * @@
   drivers/mmc/host/dw_mmc.c:606:29: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/mmc/host/dw_mmc.c:606:29: sparse:     got unsigned int *
>> drivers/mmc/host/dw_mmc.c:619:25: sparse: sparse: restricted __le32 degrades to integer
>> drivers/mmc/host/dw_mmc.c:619:25: sparse: sparse: restricted __le32 degrades to integer
>> drivers/mmc/host/dw_mmc.c:678:29: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got restricted __le32 * @@
   drivers/mmc/host/dw_mmc.c:678:29: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/mmc/host/dw_mmc.c:678:29: sparse:     got restricted __le32 *
   drivers/mmc/host/dw_mmc.c:678:29: sparse: sparse: restricted __le32 degrades to integer
--
>> drivers/mtd/nand/raw/nandsim.c:1900:41: sparse: sparse: cast from restricted __le16
   drivers/mtd/nand/raw/nandsim.c:2072:59: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned short [usertype] @@     got restricted __le16 [usertype] @@
   drivers/mtd/nand/raw/nandsim.c:2072:59: sparse:     expected unsigned short [usertype]
   drivers/mtd/nand/raw/nandsim.c:2072:59: sparse:     got restricted __le16 [usertype]

vim +606 drivers/mmc/host/dw_mmc.c

3b2a067b98b45f7 Shawn Lin         2016-09-02  577  
3b2a067b98b45f7 Shawn Lin         2016-09-02  578  static inline int dw_mci_prepare_desc64(struct dw_mci *host,
ec0baaa6b33932a Shawn Lin         2016-09-02  579  					 struct mmc_data *data,
f95f3850f7a9e1d Will Newton       2011-01-02  580  					 unsigned int sg_len)
f95f3850f7a9e1d Will Newton       2011-01-02  581  {
5959b32e3636f9b Alexey Brodkin    2015-06-25  582  	unsigned int desc_len;
5959b32e3636f9b Alexey Brodkin    2015-06-25  583  	struct idmac_desc_64addr *desc_first, *desc_last, *desc;
b6d2d81c5c2de6b Shawn Lin         2017-02-17  584  	u32 val;
ec0baaa6b33932a Shawn Lin         2016-09-02  585  	int i;
5959b32e3636f9b Alexey Brodkin    2015-06-25  586  
5959b32e3636f9b Alexey Brodkin    2015-06-25  587  	desc_first = desc_last = desc = host->sg_cpu;
69d99fdcfd7815d Prabu Thangamuthu 2014-10-20  588  
5959b32e3636f9b Alexey Brodkin    2015-06-25  589  	for (i = 0; i < sg_len; i++) {
69d99fdcfd7815d Prabu Thangamuthu 2014-10-20  590  		unsigned int length = sg_dma_len(&data->sg[i]);
0e3a22c044478b6 Shawn Lin         2015-08-03  591  
69d99fdcfd7815d Prabu Thangamuthu 2014-10-20  592  		u64 mem_addr = sg_dma_address(&data->sg[i]);
69d99fdcfd7815d Prabu Thangamuthu 2014-10-20  593  
5959b32e3636f9b Alexey Brodkin    2015-06-25  594  		for ( ; length ; desc++) {
5959b32e3636f9b Alexey Brodkin    2015-06-25  595  			desc_len = (length <= DW_MCI_DESC_DATA_LENGTH) ?
5959b32e3636f9b Alexey Brodkin    2015-06-25  596  				   length : DW_MCI_DESC_DATA_LENGTH;
5959b32e3636f9b Alexey Brodkin    2015-06-25  597  
5959b32e3636f9b Alexey Brodkin    2015-06-25  598  			length -= desc_len;
5959b32e3636f9b Alexey Brodkin    2015-06-25  599  
3b2a067b98b45f7 Shawn Lin         2016-09-02  600  			/*
3b2a067b98b45f7 Shawn Lin         2016-09-02  601  			 * Wait for the former clear OWN bit operation
3b2a067b98b45f7 Shawn Lin         2016-09-02  602  			 * of IDMAC to make sure that this descriptor
3b2a067b98b45f7 Shawn Lin         2016-09-02  603  			 * isn't still owned by IDMAC as IDMAC's write
3b2a067b98b45f7 Shawn Lin         2016-09-02  604  			 * ops and CPU's read ops are asynchronous.
3b2a067b98b45f7 Shawn Lin         2016-09-02  605  			 */
b6d2d81c5c2de6b Shawn Lin         2017-02-17 @606  			if (readl_poll_timeout_atomic(&desc->des0, val,
b6d2d81c5c2de6b Shawn Lin         2017-02-17  607  						!(val & IDMAC_DES0_OWN),
b6d2d81c5c2de6b Shawn Lin         2017-02-17  608  						10, 100 * USEC_PER_MSEC))
3b2a067b98b45f7 Shawn Lin         2016-09-02  609  				goto err_own_bit;
3b2a067b98b45f7 Shawn Lin         2016-09-02  610  
69d99fdcfd7815d Prabu Thangamuthu 2014-10-20  611  			/*
5959b32e3636f9b Alexey Brodkin    2015-06-25  612  			 * Set the OWN bit and disable interrupts
5959b32e3636f9b Alexey Brodkin    2015-06-25  613  			 * for this descriptor
69d99fdcfd7815d Prabu Thangamuthu 2014-10-20  614  			 */
69d99fdcfd7815d Prabu Thangamuthu 2014-10-20  615  			desc->des0 = IDMAC_DES0_OWN | IDMAC_DES0_DIC |
69d99fdcfd7815d Prabu Thangamuthu 2014-10-20  616  						IDMAC_DES0_CH;
5959b32e3636f9b Alexey Brodkin    2015-06-25  617  
69d99fdcfd7815d Prabu Thangamuthu 2014-10-20  618  			/* Buffer length */
5959b32e3636f9b Alexey Brodkin    2015-06-25 @619  			IDMAC_64ADDR_SET_BUFFER1_SIZE(desc, desc_len);
69d99fdcfd7815d Prabu Thangamuthu 2014-10-20  620  
69d99fdcfd7815d Prabu Thangamuthu 2014-10-20  621  			/* Physical address to DMA to/from */
69d99fdcfd7815d Prabu Thangamuthu 2014-10-20  622  			desc->des4 = mem_addr & 0xffffffff;
69d99fdcfd7815d Prabu Thangamuthu 2014-10-20  623  			desc->des5 = mem_addr >> 32;
5959b32e3636f9b Alexey Brodkin    2015-06-25  624  
5959b32e3636f9b Alexey Brodkin    2015-06-25  625  			/* Update physical address for the next desc */
5959b32e3636f9b Alexey Brodkin    2015-06-25  626  			mem_addr += desc_len;
5959b32e3636f9b Alexey Brodkin    2015-06-25  627  
5959b32e3636f9b Alexey Brodkin    2015-06-25  628  			/* Save pointer to the last descriptor */
5959b32e3636f9b Alexey Brodkin    2015-06-25  629  			desc_last = desc;
5959b32e3636f9b Alexey Brodkin    2015-06-25  630  		}
69d99fdcfd7815d Prabu Thangamuthu 2014-10-20  631  	}
69d99fdcfd7815d Prabu Thangamuthu 2014-10-20  632  
69d99fdcfd7815d Prabu Thangamuthu 2014-10-20  633  	/* Set first descriptor */
5959b32e3636f9b Alexey Brodkin    2015-06-25  634  	desc_first->des0 |= IDMAC_DES0_FD;
69d99fdcfd7815d Prabu Thangamuthu 2014-10-20  635  
69d99fdcfd7815d Prabu Thangamuthu 2014-10-20  636  	/* Set last descriptor */
5959b32e3636f9b Alexey Brodkin    2015-06-25  637  	desc_last->des0 &= ~(IDMAC_DES0_CH | IDMAC_DES0_DIC);
5959b32e3636f9b Alexey Brodkin    2015-06-25  638  	desc_last->des0 |= IDMAC_DES0_LD;
3b2a067b98b45f7 Shawn Lin         2016-09-02  639  
3b2a067b98b45f7 Shawn Lin         2016-09-02  640  	return 0;
3b2a067b98b45f7 Shawn Lin         2016-09-02  641  err_own_bit:
3b2a067b98b45f7 Shawn Lin         2016-09-02  642  	/* restore the descriptor chain as it's polluted */
26be9d705f44521 Colin Ian King    2016-11-16  643  	dev_dbg(host->dev, "descriptor is still owned by IDMAC.\n");
cc190d4c6499b1b Shawn Lin         2016-09-02  644  	memset(host->sg_cpu, 0, DESC_RING_BUF_SZ);
3b2a067b98b45f7 Shawn Lin         2016-09-02  645  	dw_mci_idmac_init(host);
3b2a067b98b45f7 Shawn Lin         2016-09-02  646  	return -EINVAL;
ec0baaa6b33932a Shawn Lin         2016-09-02  647  }
69d99fdcfd7815d Prabu Thangamuthu 2014-10-20  648  
ec0baaa6b33932a Shawn Lin         2016-09-02  649  
3b2a067b98b45f7 Shawn Lin         2016-09-02  650  static inline int dw_mci_prepare_desc32(struct dw_mci *host,
ec0baaa6b33932a Shawn Lin         2016-09-02  651  					 struct mmc_data *data,
ec0baaa6b33932a Shawn Lin         2016-09-02  652  					 unsigned int sg_len)
ec0baaa6b33932a Shawn Lin         2016-09-02  653  {
ec0baaa6b33932a Shawn Lin         2016-09-02  654  	unsigned int desc_len;
5959b32e3636f9b Alexey Brodkin    2015-06-25  655  	struct idmac_desc *desc_first, *desc_last, *desc;
b6d2d81c5c2de6b Shawn Lin         2017-02-17  656  	u32 val;
ec0baaa6b33932a Shawn Lin         2016-09-02  657  	int i;
f95f3850f7a9e1d Will Newton       2011-01-02  658  
5959b32e3636f9b Alexey Brodkin    2015-06-25  659  	desc_first = desc_last = desc = host->sg_cpu;
5959b32e3636f9b Alexey Brodkin    2015-06-25  660  
5959b32e3636f9b Alexey Brodkin    2015-06-25  661  	for (i = 0; i < sg_len; i++) {
f95f3850f7a9e1d Will Newton       2011-01-02  662  		unsigned int length = sg_dma_len(&data->sg[i]);
0e3a22c044478b6 Shawn Lin         2015-08-03  663  
f95f3850f7a9e1d Will Newton       2011-01-02  664  		u32 mem_addr = sg_dma_address(&data->sg[i]);
f95f3850f7a9e1d Will Newton       2011-01-02  665  
5959b32e3636f9b Alexey Brodkin    2015-06-25  666  		for ( ; length ; desc++) {
5959b32e3636f9b Alexey Brodkin    2015-06-25  667  			desc_len = (length <= DW_MCI_DESC_DATA_LENGTH) ?
5959b32e3636f9b Alexey Brodkin    2015-06-25  668  				   length : DW_MCI_DESC_DATA_LENGTH;
5959b32e3636f9b Alexey Brodkin    2015-06-25  669  
5959b32e3636f9b Alexey Brodkin    2015-06-25  670  			length -= desc_len;
5959b32e3636f9b Alexey Brodkin    2015-06-25  671  
3b2a067b98b45f7 Shawn Lin         2016-09-02  672  			/*
3b2a067b98b45f7 Shawn Lin         2016-09-02  673  			 * Wait for the former clear OWN bit operation
3b2a067b98b45f7 Shawn Lin         2016-09-02  674  			 * of IDMAC to make sure that this descriptor
3b2a067b98b45f7 Shawn Lin         2016-09-02  675  			 * isn't still owned by IDMAC as IDMAC's write
3b2a067b98b45f7 Shawn Lin         2016-09-02  676  			 * ops and CPU's read ops are asynchronous.
3b2a067b98b45f7 Shawn Lin         2016-09-02  677  			 */
b6d2d81c5c2de6b Shawn Lin         2017-02-17 @678  			if (readl_poll_timeout_atomic(&desc->des0, val,
b6d2d81c5c2de6b Shawn Lin         2017-02-17  679  						      IDMAC_OWN_CLR64(val),
b6d2d81c5c2de6b Shawn Lin         2017-02-17  680  						      10,
b6d2d81c5c2de6b Shawn Lin         2017-02-17  681  						      100 * USEC_PER_MSEC))
3b2a067b98b45f7 Shawn Lin         2016-09-02  682  				goto err_own_bit;
3b2a067b98b45f7 Shawn Lin         2016-09-02  683  
69d99fdcfd7815d Prabu Thangamuthu 2014-10-20  684  			/*
5959b32e3636f9b Alexey Brodkin    2015-06-25  685  			 * Set the OWN bit and disable interrupts
5959b32e3636f9b Alexey Brodkin    2015-06-25  686  			 * for this descriptor
69d99fdcfd7815d Prabu Thangamuthu 2014-10-20  687  			 */
6687c42fa71acd6 Ben Dooks         2015-03-25  688  			desc->des0 = cpu_to_le32(IDMAC_DES0_OWN |
5959b32e3636f9b Alexey Brodkin    2015-06-25  689  						 IDMAC_DES0_DIC |
5959b32e3636f9b Alexey Brodkin    2015-06-25  690  						 IDMAC_DES0_CH);
5959b32e3636f9b Alexey Brodkin    2015-06-25  691  
f95f3850f7a9e1d Will Newton       2011-01-02  692  			/* Buffer length */
5959b32e3636f9b Alexey Brodkin    2015-06-25  693  			IDMAC_SET_BUFFER1_SIZE(desc, desc_len);
f95f3850f7a9e1d Will Newton       2011-01-02  694  
f95f3850f7a9e1d Will Newton       2011-01-02  695  			/* Physical address to DMA to/from */
6687c42fa71acd6 Ben Dooks         2015-03-25  696  			desc->des2 = cpu_to_le32(mem_addr);
5959b32e3636f9b Alexey Brodkin    2015-06-25  697  
5959b32e3636f9b Alexey Brodkin    2015-06-25  698  			/* Update physical address for the next desc */
5959b32e3636f9b Alexey Brodkin    2015-06-25  699  			mem_addr += desc_len;
5959b32e3636f9b Alexey Brodkin    2015-06-25  700  
5959b32e3636f9b Alexey Brodkin    2015-06-25  701  			/* Save pointer to the last descriptor */
5959b32e3636f9b Alexey Brodkin    2015-06-25  702  			desc_last = desc;
5959b32e3636f9b Alexey Brodkin    2015-06-25  703  		}
f95f3850f7a9e1d Will Newton       2011-01-02  704  	}
f95f3850f7a9e1d Will Newton       2011-01-02  705  
f95f3850f7a9e1d Will Newton       2011-01-02  706  	/* Set first descriptor */
5959b32e3636f9b Alexey Brodkin    2015-06-25  707  	desc_first->des0 |= cpu_to_le32(IDMAC_DES0_FD);
f95f3850f7a9e1d Will Newton       2011-01-02  708  
f95f3850f7a9e1d Will Newton       2011-01-02  709  	/* Set last descriptor */
5959b32e3636f9b Alexey Brodkin    2015-06-25  710  	desc_last->des0 &= cpu_to_le32(~(IDMAC_DES0_CH |
5959b32e3636f9b Alexey Brodkin    2015-06-25  711  				       IDMAC_DES0_DIC));
5959b32e3636f9b Alexey Brodkin    2015-06-25  712  	desc_last->des0 |= cpu_to_le32(IDMAC_DES0_LD);
3b2a067b98b45f7 Shawn Lin         2016-09-02  713  
3b2a067b98b45f7 Shawn Lin         2016-09-02  714  	return 0;
3b2a067b98b45f7 Shawn Lin         2016-09-02  715  err_own_bit:
3b2a067b98b45f7 Shawn Lin         2016-09-02  716  	/* restore the descriptor chain as it's polluted */
26be9d705f44521 Colin Ian King    2016-11-16  717  	dev_dbg(host->dev, "descriptor is still owned by IDMAC.\n");
cc190d4c6499b1b Shawn Lin         2016-09-02  718  	memset(host->sg_cpu, 0, DESC_RING_BUF_SZ);
3b2a067b98b45f7 Shawn Lin         2016-09-02  719  	dw_mci_idmac_init(host);
3b2a067b98b45f7 Shawn Lin         2016-09-02  720  	return -EINVAL;
69d99fdcfd7815d Prabu Thangamuthu 2014-10-20  721  }
f95f3850f7a9e1d Will Newton       2011-01-02  722  

:::::: The code at line 606 was first introduced by commit
:::::: b6d2d81c5c2de6b3c69da3be9b2044dd008dbe45 mmc: dw_mmc: improve the timeout polling code

:::::: TO: Shawn Lin <shawn.lin@rock-chips.com>
:::::: CC: Ulf Hansson <ulf.hansson@linaro.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
