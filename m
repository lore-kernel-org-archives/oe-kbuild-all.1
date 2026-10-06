Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F1FF21CC71
	for <oe-kbuild-all@lists.linux.dev>; Tue,  6 Oct 2026 00:54:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791248050; cv=none; b=T702KrzWDa/hflN/lK28KQ/7xTc9xpeoCjqpfx4LY1yjwFRKcHtAsYUaAA21AbhvSCERRBBOKtLwZ5BP0BQo8deD4Fj6Q55JEvXYhhtG8nFsuLsOnjQ3a1kXKG0qPtgxcW4TPW+KkpSoBdMDV4xvsD+rI+LQMCtJOh7mg24/uP0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791248050; c=relaxed/simple;
	bh=OkPYIdR7ZWhqvIARjTKtwHM0ZuvUppWP7FzO7R3Y3FY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=B9PJQuqyq5bSFbmsLFy2PhpIFxXpAZvR5cgBFTLXUiZmpqs61pcT5bkP8uYX3QkzlvtR80LyLihSyX27zUVEqfgfAls9i4DbJ4zi+up4LCdciq0/mpeOhCL6PUbRHWP5/IxLlNuhxkw6PPpRdEoFjEVOsA+V8uZYRSxAcHYP2/I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dxT36Gnc; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dxT36Gnc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791248048; x=1822784048;
  h=date:from:to:cc:subject:message-id;
  bh=OkPYIdR7ZWhqvIARjTKtwHM0ZuvUppWP7FzO7R3Y3FY=;
  b=dxT36GncDdx7aG5qeeiA+AhtH37KkukkLPg+4KhVCbGWKuzwS0/LyUBi
   k7EQbRAcw/fwIIuX2xbmda+Y1yPsv0r7gi/0EBcdO9rtYn2agHyrOPkfr
   s4W/SFi/mreDJHDGIr0Q8J5JkpXdEdvZ+SlcZQV0I+2rUfKT1rtz/uT3z
   TYfmWtV+8mxn6s/Dyx1qeyBNg1Mpgli/xEXThyFudufDkgQHcSkrEuDpQ
   IQFQFcDd1ptI5YDP9E4wHCMBoMsw9KBe2wU+HS3BXJnd8Mtcn/FIahv4e
   baXNR9CfYz8fEBhgVE8i8m8ZNMzg3DF8FJINpDHodAdVLTrcrg9vWhj8o
   A==;
X-CSE-ConnectionGUID: yEZ0+7F/QQyqrEKtue68Rw==
X-CSE-MsgGUID: G9neRjAzSQacH6dPT4ge0Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11926"; a="79062"
X-IronPort-AV: E=Sophos;i="6.27,143,1787036400"; 
   d="scan'208";a="79062"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Oct 2026 17:54:08 -0700
X-CSE-ConnectionGUID: B5iZqU7pSTanI7FmhAR4zg==
X-CSE-MsgGUID: qdZke1ZPTYm+Vp/bJVerHA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,143,1787036400"; 
   d="scan'208";a="280252387"
Received: from igk-lkp-server01.igk.intel.com (HELO d0de6c2a75a7) ([10.211.93.152])
  by orviesa004.jf.intel.com with ESMTP; 05 Oct 2026 17:54:07 -0700
Received: from kbuild by d0de6c2a75a7 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xDtRU-000000000Vn-1oRw;
	Tue, 06 Oct 2026 00:54:04 +0000
Date: Tue, 06 Oct 2026 02:53:32 +0200
From: kernel test robot <lkp@intel.com>
To: Xianwei Zhao <xianwei.zhao@amlogic.com>
Cc: oe-kbuild-all@lists.linux.dev, Vinod Koul <vkoul@kernel.org>,
 Frank Li <Frank.Li@nxp.com>
Subject: [vkoul-dmaengine:next 90/130]
 drivers/dma/amlogic-dma.c:324:22: sparse: sparse: invalid assignment: |=
Message-ID: <202610060235.PuCxWQdk-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vkoul/dmaengine.git next
head:   0ac4a90c4805b41013044fdefff051ae59a54302
commit: b84b5197e344e2d378a9edf5d782b6fbddff8d06 [90/130] dmaengine: amlogic: Add general DMA driver for A9
config: arc-randconfig-r2307-20261006 (https://download.01.org/0day-ci/archive/20261006/202610060235.PuCxWQdk-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 12.5.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261006/202610060235.PuCxWQdk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610060235.PuCxWQdk-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/dma/amlogic-dma.c:324:22: sparse: sparse: invalid assignment: |=
   drivers/dma/amlogic-dma.c:324:22: sparse:    left side has type restricted __le32
   drivers/dma/amlogic-dma.c:324:22: sparse:    right side has type unsigned long

vim +324 drivers/dma/amlogic-dma.c

   260	
   261	static struct dma_async_tx_descriptor *aml_dma_prep_slave_sg
   262			(struct dma_chan *chan, struct scatterlist *sgl,
   263			unsigned int sg_len, enum dma_transfer_direction direction,
   264			unsigned long flags, void *context)
   265	{
   266		struct aml_dma_chan *aml_chan = to_aml_dma_chan(chan);
   267		struct aml_dma_dev *aml_dma = aml_chan->aml_dma;
   268		struct aml_dma_desc *aml_desc = NULL;
   269		struct aml_dma_sg_link *sg_link = NULL;
   270		struct scatterlist *sg = NULL;
   271		u64 paddr;
   272		u32 link_count, avail;
   273		u32 i;
   274	
   275		if (aml_chan->direction != direction) {
   276			dev_err(aml_dma->dma_device.dev, "direction not support\n");
   277			return NULL;
   278		}
   279	
   280		link_count = sg_nents_for_dma(sgl, sg_len, SG_MAX_LEN);
   281		if (link_count == 0)
   282			return NULL;
   283	
   284		aml_desc = kzalloc_obj(*aml_desc, GFP_NOWAIT);
   285		if (!aml_desc)
   286			return NULL;
   287	
   288		INIT_WORK(&aml_desc->free_work, aml_dma_free_desc_work);
   289		aml_desc->sg_link_size = link_count * sizeof(*sg_link);
   290		aml_desc->sg_link = dma_alloc_coherent(aml_dma->dma_device.dev, aml_desc->sg_link_size,
   291						       &aml_desc->sg_link_phys, GFP_NOWAIT);
   292		if (!aml_desc->sg_link) {
   293			kfree(aml_desc);
   294			return NULL;
   295		}
   296		aml_desc->dma_device = &aml_dma->dma_device;
   297	
   298		sg_link = aml_desc->sg_link;
   299		for_each_sg(sgl, sg, sg_len, i) {
   300			avail = sg_dma_len(sg);
   301			if (avail == 0)
   302				continue;
   303			paddr = sg->dma_address;
   304			while (avail > SG_MAX_LEN) {
   305				/* set dma address and len to sglink*/
   306				sg_link->addr_low = cpu_to_le32(lower_32_bits(paddr));
   307				sg_link->addr_high = cpu_to_le32(upper_32_bits(paddr));
   308				sg_link->ctl = cpu_to_le32(FIELD_PREP(LINK_LEN, SG_MAX_LEN));
   309				paddr = paddr + SG_MAX_LEN;
   310				avail = avail - SG_MAX_LEN;
   311				sg_link++;
   312			}
   313			/* set dma address and len to sglink*/
   314			sg_link->addr_low = cpu_to_le32(lower_32_bits(paddr));
   315			sg_link->addr_high = cpu_to_le32(upper_32_bits(paddr));
   316			sg_link->ctl = cpu_to_le32(FIELD_PREP(LINK_LEN, avail));
   317	
   318			aml_desc->data_len += sg_dma_len(sg);
   319			sg_link++;
   320		}
   321	
   322		/* the last sg set eoc flag */
   323		sg_link--;
 > 324		sg_link->ctl |= LINK_EOC;
   325	
   326		return vchan_tx_prep(&aml_chan->vchan, &aml_desc->vd, flags);
   327	}
   328	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
