Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7398B1BFE01
	for <oe-kbuild-all@lists.linux.dev>; Mon, 14 Oct 2024 17:12:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728925980; cv=none; b=YK7qgq7JKT2/iwP1KV74BstluTFIjkWfHJlBN2uBH3FgGI6f7jRyJweQ51THX1oUIHlU9aB2CRXpfWmaRpAEl4AYwDmNCa0qj1p55xdBKghEOpkM4OBcjBEUGzOz7QcEojNdPzRPlGBMU79WSnHmdl7kjkFWYyr9Dtk/e1IKgLQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728925980; c=relaxed/simple;
	bh=UPD1wteoxzAuYm9FlMtGfWrInzRXftH90PaRkCiKoaU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=tIMbBkd2kA1VXfy1h6kBsfAEd1raQH0b4F/kAeGkWZP4ZT4pxruFVDnxGCnPh/fhXes9/ODeimlaqiF2ILBJvl8j7mcOfyO7xZ+NjGaHpFMq7FGV2CW9Jxzq7naSwQVLp+YSBNGuVcL1/YLx0nZnyKEHs31gb2knaS2Wfmj20CQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DaMxTVsl; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DaMxTVsl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728925979; x=1760461979;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=UPD1wteoxzAuYm9FlMtGfWrInzRXftH90PaRkCiKoaU=;
  b=DaMxTVslP/d4BmbOhoAddkcXz7dz3QEAWoCiXNXCCnCUHHxt9DfhM0J0
   aRXrhx/J6lX/h2nl/spuZJ5+JCevJnDJS5a8muoN5//h09kWmpIBXKLzK
   tl99qukbnVBMYt3ON5oVvydJXriZX+vmQQIs9+OnpnTJHfC24nP4qCXbF
   QyujNMniI4c/BW+aaEjyNVxeh+UhyawO9xEBrUULofALz/YM9RJRFnQc6
   xHNzYL2R41+XGccG+pLdoaWYkbnWdlK3YN2EU0FVqtS7XwQH9NWg8Q/D8
   PIJ2tEmLbbHtIxcp7dTZ0fSb2xzyBSKMG8qGvTEqfjg/6SjULFstgeZT8
   g==;
X-CSE-ConnectionGUID: eRG5KC3vSw2nkPhQCMBiNg==
X-CSE-MsgGUID: ILDgnIo6TVGDpNJOEm61tg==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="28429442"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="28429442"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2024 10:12:57 -0700
X-CSE-ConnectionGUID: RiReb1FQTkyVtLnw2TT4wQ==
X-CSE-MsgGUID: 5NbajVZ9TCudkQ42D18wkQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,203,1725346800"; 
   d="scan'208";a="77507780"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 14 Oct 2024 10:12:55 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t0Ocn-000Gv9-02;
	Mon, 14 Oct 2024 17:12:53 +0000
Date: Tue, 15 Oct 2024 01:12:13 +0800
From: kernel test robot <lkp@intel.com>
To: Christoph Hellwig <hch@lst.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [hch-misc:pci-dma-mapping.h 1/1] drivers/dma/idxd/device.c:125:22:
 error: implicit declaration of function 'dma_alloc_coherent'
Message-ID: <202410150149.VAfVteNS-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.infradead.org/users/hch/misc.git pci-dma-mapping.h
head:   c195cf19ee228a0e49465bc91e2d3700b6bce5d1
commit: c195cf19ee228a0e49465bc91e2d3700b6bce5d1 [1/1] pci.h: don't include dma-mapping.h
config: x86_64-rhel-8.3-func (https://download.01.org/0day-ci/archive/20241015/202410150149.VAfVteNS-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241015/202410150149.VAfVteNS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410150149.VAfVteNS-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   drivers/dma/idxd/device.c: In function 'idxd_wq_alloc_resources':
>> drivers/dma/idxd/device.c:125:22: error: implicit declaration of function 'dma_alloc_coherent' [-Werror=implicit-function-declaration]
     125 |         wq->compls = dma_alloc_coherent(dev, wq->compls_size, &wq->compls_addr, GFP_KERNEL);
         |                      ^~~~~~~~~~~~~~~~~~
>> drivers/dma/idxd/device.c:125:20: warning: assignment to 'struct dsa_completion_record *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     125 |         wq->compls = dma_alloc_coherent(dev, wq->compls_size, &wq->compls_addr, GFP_KERNEL);
         |                    ^
>> drivers/dma/idxd/device.c:159:9: error: implicit declaration of function 'dma_free_coherent' [-Werror=implicit-function-declaration]
     159 |         dma_free_coherent(dev, wq->compls_size, wq->compls, wq->compls_addr);
         |         ^~~~~~~~~~~~~~~~~
   drivers/dma/idxd/device.c: In function 'idxd_device_evl_setup':
>> drivers/dma/idxd/device.c:772:14: warning: assignment to 'void *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     772 |         addr = dma_alloc_coherent(dev, size, &dma_addr, GFP_KERNEL);
         |              ^
   cc1: some warnings being treated as errors
--
   drivers/crypto/intel/qat/qat_4xxx/adf_drv.c: In function 'adf_probe':
>> drivers/crypto/intel/qat/qat_4xxx/adf_drv.c:111:15: error: implicit declaration of function 'dma_set_mask_and_coherent' [-Werror=implicit-function-declaration]
     111 |         ret = dma_set_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(64));
         |               ^~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/crypto/intel/qat/qat_4xxx/adf_drv.c:111:53: error: implicit declaration of function 'DMA_BIT_MASK'; did you mean 'BIT_MASK'? [-Werror=implicit-function-declaration]
     111 |         ret = dma_set_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(64));
         |                                                     ^~~~~~~~~~~~
         |                                                     BIT_MASK
   cc1: some warnings being treated as errors


vim +/dma_alloc_coherent +125 drivers/dma/idxd/device.c

bfe1d56091c1a4 Dave Jiang  2020-01-21  106  
bfe1d56091c1a4 Dave Jiang  2020-01-21  107  /* WQ control bits */
bfe1d56091c1a4 Dave Jiang  2020-01-21  108  int idxd_wq_alloc_resources(struct idxd_wq *wq)
bfe1d56091c1a4 Dave Jiang  2020-01-21  109  {
bfe1d56091c1a4 Dave Jiang  2020-01-21  110  	struct idxd_device *idxd = wq->idxd;
bfe1d56091c1a4 Dave Jiang  2020-01-21  111  	struct device *dev = &idxd->pdev->dev;
bfe1d56091c1a4 Dave Jiang  2020-01-21  112  	int rc, num_descs, i;
bfe1d56091c1a4 Dave Jiang  2020-01-21  113  
c52ca478233c17 Dave Jiang  2020-01-21  114  	if (wq->type != IDXD_WQT_KERNEL)
c52ca478233c17 Dave Jiang  2020-01-21  115  		return 0;
c52ca478233c17 Dave Jiang  2020-01-21  116  
9806eb5c79579e Dave Jiang  2021-08-06  117  	num_descs = wq_dedicated(wq) ? wq->size : wq->threshold;
9806eb5c79579e Dave Jiang  2021-08-06  118  	wq->num_descs = num_descs;
bfe1d56091c1a4 Dave Jiang  2020-01-21  119  
bfe1d56091c1a4 Dave Jiang  2020-01-21  120  	rc = alloc_hw_descs(wq, num_descs);
bfe1d56091c1a4 Dave Jiang  2020-01-21  121  	if (rc < 0)
bfe1d56091c1a4 Dave Jiang  2020-01-21  122  		return rc;
bfe1d56091c1a4 Dave Jiang  2020-01-21  123  
2efe58cfaad4ad Dave Jiang  2021-10-25  124  	wq->compls_size = num_descs * idxd->data->compl_size;
2efe58cfaad4ad Dave Jiang  2021-10-25 @125  	wq->compls = dma_alloc_coherent(dev, wq->compls_size, &wq->compls_addr, GFP_KERNEL);
2efe58cfaad4ad Dave Jiang  2021-10-25  126  	if (!wq->compls) {
bfe1d56091c1a4 Dave Jiang  2020-01-21  127  		rc = -ENOMEM;
bfe1d56091c1a4 Dave Jiang  2020-01-21  128  		goto fail_alloc_compls;
bfe1d56091c1a4 Dave Jiang  2020-01-21  129  	}
bfe1d56091c1a4 Dave Jiang  2020-01-21  130  
bfe1d56091c1a4 Dave Jiang  2020-01-21  131  	rc = alloc_descs(wq, num_descs);
bfe1d56091c1a4 Dave Jiang  2020-01-21  132  	if (rc < 0)
bfe1d56091c1a4 Dave Jiang  2020-01-21  133  		goto fail_alloc_descs;
bfe1d56091c1a4 Dave Jiang  2020-01-21  134  
0705107fcc8071 Dave Jiang  2020-06-15  135  	rc = sbitmap_queue_init_node(&wq->sbq, num_descs, -1, false, GFP_KERNEL,
bfe1d56091c1a4 Dave Jiang  2020-01-21  136  				     dev_to_node(dev));
bfe1d56091c1a4 Dave Jiang  2020-01-21  137  	if (rc < 0)
bfe1d56091c1a4 Dave Jiang  2020-01-21  138  		goto fail_sbitmap_init;
bfe1d56091c1a4 Dave Jiang  2020-01-21  139  
bfe1d56091c1a4 Dave Jiang  2020-01-21  140  	for (i = 0; i < num_descs; i++) {
bfe1d56091c1a4 Dave Jiang  2020-01-21  141  		struct idxd_desc *desc = wq->descs[i];
bfe1d56091c1a4 Dave Jiang  2020-01-21  142  
bfe1d56091c1a4 Dave Jiang  2020-01-21  143  		desc->hw = wq->hw_descs[i];
435b512dbc0dac Dave Jiang  2021-04-15  144  		if (idxd->data->type == IDXD_TYPE_DSA)
bfe1d56091c1a4 Dave Jiang  2020-01-21  145  			desc->completion = &wq->compls[i];
435b512dbc0dac Dave Jiang  2021-04-15  146  		else if (idxd->data->type == IDXD_TYPE_IAX)
f25b463883a8a2 Dave Jiang  2020-11-17  147  			desc->iax_completion = &wq->iax_compls[i];
435b512dbc0dac Dave Jiang  2021-04-15  148  		desc->compl_dma = wq->compls_addr + idxd->data->compl_size * i;
bfe1d56091c1a4 Dave Jiang  2020-01-21  149  		desc->id = i;
bfe1d56091c1a4 Dave Jiang  2020-01-21  150  		desc->wq = wq;
0705107fcc8071 Dave Jiang  2020-06-15  151  		desc->cpu = -1;
bfe1d56091c1a4 Dave Jiang  2020-01-21  152  	}
bfe1d56091c1a4 Dave Jiang  2020-01-21  153  
bfe1d56091c1a4 Dave Jiang  2020-01-21  154  	return 0;
bfe1d56091c1a4 Dave Jiang  2020-01-21  155  
bfe1d56091c1a4 Dave Jiang  2020-01-21  156   fail_sbitmap_init:
bfe1d56091c1a4 Dave Jiang  2020-01-21  157  	free_descs(wq);
bfe1d56091c1a4 Dave Jiang  2020-01-21  158   fail_alloc_descs:
2efe58cfaad4ad Dave Jiang  2021-10-25 @159  	dma_free_coherent(dev, wq->compls_size, wq->compls, wq->compls_addr);
bfe1d56091c1a4 Dave Jiang  2020-01-21  160   fail_alloc_compls:
bfe1d56091c1a4 Dave Jiang  2020-01-21  161  	free_hw_descs(wq);
bfe1d56091c1a4 Dave Jiang  2020-01-21  162  	return rc;
bfe1d56091c1a4 Dave Jiang  2020-01-21  163  }
86d3a34144fd63 Tom Zanussi 2023-12-05  164  EXPORT_SYMBOL_NS_GPL(idxd_wq_alloc_resources, IDXD);
bfe1d56091c1a4 Dave Jiang  2020-01-21  165  

:::::: The code at line 125 was first introduced by commit
:::::: 2efe58cfaad4ad94eab888d287c174de5209a0c2 dmaengine: idxd: cleanup completion record allocation

:::::: TO: Dave Jiang <dave.jiang@intel.com>
:::::: CC: Vinod Koul <vkoul@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
