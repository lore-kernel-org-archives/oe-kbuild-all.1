Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4799530DEA
	for <oe-kbuild-all@lists.linux.dev>; Wed, 23 Sep 2026 14:20:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.6
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790173239; cv=none; b=BsMNMqpTpoyR6KYm5yLuBeNOqfycqjCTYIKjg/lkIlykFoapiyXGqWJIcXgZ9/SicJQfqMj6bxdh45UsmwMnb4pt7nMz4IS6au406q7GC0L6E6jgj9d4Gnghl7Ver9C31bbyMq+khhZNQLwyX4EmpVdIpuL48cATqhRHKdsVcF4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790173239; c=relaxed/simple;
	bh=OK6iTmW9CFR2NUHc7mkI6lS7LAqJkTb1n2rlSjqc88k=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=pvW5Wx8ergzsgWOhYCOox2Zo/W0YzydT4+kSXpntCLmrroBvnSgWOujELvMqBAABB/sBNceHZi82KNYJ9hf4NERmIe7yNHjv0ozOoo303itedKZBrk0SnEtvztYbcj9oRJJ2/NEMv2N6OicJ980xQpC+y6nxkBzK/C5S8L8gLkg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bnyb7p17; arc=none smtp.client-ip=192.198.163.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bnyb7p17"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790173234; x=1821709234;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=OK6iTmW9CFR2NUHc7mkI6lS7LAqJkTb1n2rlSjqc88k=;
  b=bnyb7p17YXz+mWcVMi7zccVs8diUt5EQ7Cg3mllmkn4tjxMc8LtucSiI
   ZRk3rvDLhWNuRtRg6XhA5P0kVP7520GULOxzAfyiAK3vQwMqHQwN4ut7c
   BtcOqyuaK9BOC4mTPDDPTv9YUGVc65o9wxgBLPqVz2YueOqIEAh+QO0gz
   SB6XissTENvCZ8oyFOzWndOuHI428g3kvwg+qlma4svQd28ex+yZZU5Nz
   KRhRhWCv1jKVpOECcIW1187hOmj6KwBLQKoEeizc4TWbMhrxKNbZJLVKZ
   imffEP/JUqlmitQIEpn//E3lElvZva/U3HTto6NUCwxcj86/jHuZYLL06
   A==;
X-CSE-ConnectionGUID: 0zabsps/QlqQmu6p9mewcQ==
X-CSE-MsgGUID: z3l/K1dWQiyvvNwaUfB4zQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11913"; a="1367458"
X-IronPort-AV: E=Sophos;i="6.27,118,1787036400"; 
   d="scan'208";a="1367458"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa116.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2026 07:20:33 -0700
X-CSE-ConnectionGUID: XHNPQpy4Riq/SVhIXxUnyA==
X-CSE-MsgGUID: 1l9/G9vHQ2qo0z6kota1pg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,118,1787036400"; 
   d="scan'208";a="278358663"
Received: from igk-lkp-server01.igk.intel.com (HELO 1bbc298b9a73) ([10.211.93.152])
  by fmviesa004.fm.intel.com with ESMTP; 23 Sep 2026 07:20:31 -0700
Received: from kbuild by 1bbc298b9a73 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x9Npk-000000000hz-3XxP;
	Wed, 23 Sep 2026 14:20:28 +0000
Date: Wed, 23 Sep 2026 16:20:27 +0200
From: kernel test robot <lkp@intel.com>
To: =?utf-8?Q?"Beno=C3=AEt?= Monin" <benoit.monin@bootlin.com>
Cc: oe-kbuild-all@lists.linux.dev, 0day robot <lkp@intel.com>
Subject: drivers/dma/fsl-edma-common.c:59:33: error: implicit
 declaration of function 'FIELD_GET'
Message-ID: <202609231629.TwIPJLPs-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

tree:   https://github.com/intel-lab-lkp/linux/commits/Beno-t-Monin/dmaengine-fsl-edma-Implement-device_prep_peripheral_dma_vec/20260911-151136
head:   d367ca414ff70c2acdc2f8d2c0410092ae34645d
commit: d367ca414ff70c2acdc2f8d2c0410092ae34645d dmaengine: fsl-edma: Support dynamic scatter/gather chaining
date:   12 days ago
config: sparc-randconfig-r2201-20260923 (https://download.01.org/0day-ci/archive/20260923/202609231629.TwIPJLPs-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 11.5.0
smatch: v0.5.0-9187-g5189e3fb
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260923/202609231629.TwIPJLPs-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609231629.TwIPJLPs-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/dma/fsl-edma-common.c: In function 'fsl_edma_tx_chan_handler':
>> drivers/dma/fsl-edma-common.c:59:33: error: implicit declaration of function 'FIELD_GET' [-Werror=implicit-function-declaration]
      59 |                 u8 link_sg_id = FIELD_GET(EDMA_TCD_CSR_LINKCH, csr);
         |                                 ^~~~~~~~~
   drivers/dma/fsl-edma-common.c: In function 'fsl_edma_prep_peripheral_dma_vec':
   drivers/dma/fsl-edma-common.c:784:55: error: implicit declaration of function 'FIELD_MAX' [-Werror=implicit-function-declaration]
     784 |                 if (!nbytes || vecs[i].len / nbytes > FIELD_MAX(EDMA_TCD_ITER_MASK))
         |                                                       ^~~~~~~~~
   drivers/dma/fsl-edma-common.c: In function 'fsl_edma_link_sg':
>> drivers/dma/fsl-edma-common.c:1015:24: error: implicit declaration of function 'FIELD_PREP' [-Werror=implicit-function-declaration]
    1015 |                 csr |= FIELD_PREP(EDMA_TCD_CSR_LINKCH, fsl_chan->link_sg_id);
         |                        ^~~~~~~~~~
   cc1: some warnings being treated as errors


vim +/FIELD_GET +59 drivers/dma/fsl-edma-common.c

    46	
    47	void fsl_edma_tx_chan_handler(struct fsl_edma_chan *fsl_chan)
    48	{
    49		spin_lock(&fsl_chan->vchan.lock);
    50	
    51		if (!fsl_chan->edesc) {
    52			/* terminate_all called before */
    53			spin_unlock(&fsl_chan->vchan.lock);
    54			return;
    55		}
    56	
    57		if (!fsl_chan->edesc->iscyclic) {
    58			u16 csr = edma_read_tcdreg(fsl_chan, csr);
  > 59			u8 link_sg_id = FIELD_GET(EDMA_TCD_CSR_LINKCH, csr);
    60			struct virt_dma_desc *vdesc, *tmp;
    61	
    62			/* Channel is DONE when a TCD with D_REQ set completes */
    63			if (!(fsl_edma_drvflags(fsl_chan) & FSL_EDMA_DRV_SPLIT_REG) ||
    64			    (edma_readl_chreg(fsl_chan, ch_csr) & EDMA_V3_CH_CSR_DONE)) {
    65				fsl_chan->status = DMA_COMPLETE;
    66			}
    67	
    68			list_for_each_entry_safe(vdesc, tmp, &fsl_chan->vchan.desc_issued, node) {
    69				struct fsl_edma_desc *fsl_desc = to_fsl_edma_desc(vdesc);
    70				bool id_match = (link_sg_id == fsl_desc->link_sg_id);
    71	
    72				/*
    73				 * If the transfer is still running,
    74				 * don't mark as complete the current descriptor
    75				 */
    76				if (id_match && fsl_chan->status != DMA_COMPLETE)
    77					break;
    78	
    79				list_del(&vdesc->node);
    80				vchan_cookie_complete(vdesc);
    81	
    82				if (id_match)
    83					break;
    84			}
    85	
    86			fsl_chan->edesc = NULL;
    87	
    88		} else {
    89			vchan_cyclic_callback(&fsl_chan->edesc->vdesc);
    90		}
    91	
    92		if (!fsl_chan->edesc)
    93			fsl_edma_xfer_desc(fsl_chan);
    94	
    95		spin_unlock(&fsl_chan->vchan.lock);
    96	}
    97	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
