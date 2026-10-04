Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE83B32B12C
	for <oe-kbuild-all@lists.linux.dev>; Sun,  4 Oct 2026 06:37:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791095858; cv=none; b=j7q80S6ABTvznqn1Btl7wXRTmsPLLk7od1p8gUmLUyu5htUmTI/tPyzH3Kle/pED4yB1G0ciMibKS5TfPfPVJ7ZG24c5+S1TL7wUC4kO+yUfpEvtueiqPAzJrIskQ4jao09vei5te8YXk3dq0TdvYIsMDyH72DG1LTEW43sqZcc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791095858; c=relaxed/simple;
	bh=A0bFArovMbLDB2rWVd/SVXM29/ZHE1xuAyElOYC7440=;
	h=Date:From:To:Cc:Subject:Message-ID; b=lEAKpT1qIb49fHT6dhu0OVKB6WfNWO8NT9TyYxbpOzWiNzzv/pUTuxJZ2TNLoIGcQv8MPi4OHDTj8hHTuW1/wIFiUsXY6ULAVOC40WGNE4TkoKG/0nrunK78w6JUHF50onIdKmsDp0/Lfagu1IsbvQYtxX6M4n2zHX9xcJvy7W8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=g3LLFjdz; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="g3LLFjdz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791095856; x=1822631856;
  h=date:from:to:cc:subject:message-id;
  bh=A0bFArovMbLDB2rWVd/SVXM29/ZHE1xuAyElOYC7440=;
  b=g3LLFjdzhN2BW0DJdsbf+4KUHnkMgp2lGuio/SWtCKyiMCly0jkcK0Ia
   1X6nCgJaX98C15gfSMLsNOyTuclY2Yg3Z9y4SNben2U6n8Nd9jH3cT7qv
   LZohKJKClb3KWC6uPpaXn9oFdSA3UR0exShS/c6evvAEuMWMhkCrO1LXm
   UMhN7d64JFtAwk2BiqAoQN+YzD7znB5+ZVs1WIysBktRRrF1R7gNTKDO9
   jExBFGmC+jUsWXG9RS7MnMOVYENeZmJ/66hFPFSkFasizg/5K/mLWu9Et
   zOngC9lm/13H3MkCm0VtpYplRHhJbE448CAeY2L5FKNJJv9owKh3UZ7CX
   A==;
X-CSE-ConnectionGUID: J92I40JySZ6bqDPZ4OPWfA==
X-CSE-MsgGUID: 8icU57KeQT2EcCwzArxdrg==
X-IronPort-AV: E=McAfee;i="6800,10657,11924"; a="90931641"
X-IronPort-AV: E=Sophos;i="6.27,139,1787036400"; 
   d="scan'208";a="90931641"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Oct 2026 23:37:35 -0700
X-CSE-ConnectionGUID: 3gGH/Qe9S/GZEW7cFeDR9Q==
X-CSE-MsgGUID: tHmAvCfFS76MrhyMZ0Q3TA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,139,1787036400"; 
   d="scan'208";a="587524"
Received: from igk-lkp-server01.igk.intel.com (HELO 3a02ec7efc9f) ([10.211.93.152])
  by fmviesa012.fm.intel.com with ESMTP; 03 Oct 2026 23:37:34 -0700
Received: from kbuild by 3a02ec7efc9f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xDFqm-000000000Dn-0333;
	Sun, 04 Oct 2026 06:37:32 +0000
Date: Sun, 04 Oct 2026 08:36:40 +0200
From: kernel test robot <lkp@intel.com>
To: Manik Bajpai <manik.bajpai@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, 0day robot <lkp@intel.com>
Subject: drivers/media/pci/intel/ipu6/ipu7-boot.c:249:17: error:
 implicit declaration of function 'ipu7_release_boot_config'; did you mean
 'ipu6_ipu7_release_boot_config'?
Message-ID: <202610040829.wYNTqHst-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/intel-lab-lkp/linux/commits/Manik-Bajpai/media-ipu6-Free-boot-config-on-queue-memory-alloc-failure/20260928-172643
head:   5b83218feeee7f71c10dedecc073175c8e936510
commit: c71ae86fcb6b3f0ce91cc3025abdbd51094320db media: ipu6: Free boot config on queue memory alloc failure
date:   6 days ago
config: x86_64-randconfig-2103-20261004 (https://download.01.org/0day-ci/archive/20261004/202610040829.wYNTqHst-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261004/202610040829.wYNTqHst-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610040829.wYNTqHst-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/media/pci/intel/ipu6/ipu7-boot.c: In function 'ipu6_ipu7_init_boot_config':
>> drivers/media/pci/intel/ipu6/ipu7-boot.c:249:17: error: implicit declaration of function 'ipu7_release_boot_config'; did you mean 'ipu6_ipu7_release_boot_config'? [-Wimplicit-function-declaration]
     249 |                 ipu7_release_boot_config(adev);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~
         |                 ipu6_ipu7_release_boot_config


vim +249 drivers/media/pci/intel/ipu6/ipu7-boot.c

   192	
   193	int ipu6_ipu7_init_boot_config(struct ipu6_bus_device *adev,
   194				       struct ipu7_fw_com_queue_config *qconfigs,
   195				       int num_queues, u32 uc_freq,
   196				       dma_addr_t subsys_config, u8 major)
   197	{
   198		struct ipu6_isys *isys = ipu6_bus_get_drvdata(adev);
   199		struct ipu7_fw_com_context *fwctx = isys->fwctx;
   200		struct ipu7_boot_abi_cfg *boot_config;
   201		struct ipu7_fw_com_queue_params_config *cfgs;
   202		struct device *dev = &adev->auxdev.dev;
   203		u32 total_queue_size_aligned = 0;
   204		dma_addr_t queue_mem_dma_ptr;
   205		void *queue_mem_ptr;
   206		unsigned int i;
   207	
   208		/* Allocate boot config. */
   209		fwctx->boot_config_size =
   210			sizeof(*cfgs) * num_queues + sizeof(*boot_config);
   211		fwctx->boot_config = ipu6_dma_alloc(adev, fwctx->boot_config_size,
   212						    &fwctx->boot_config_dma_addr,
   213						    GFP_KERNEL, 0);
   214		if (!fwctx->boot_config) {
   215			dev_err(dev, "Failed to allocate boot config.\n");
   216			return -ENOMEM;
   217		}
   218	
   219		boot_config = fwctx->boot_config;
   220		memset(boot_config, 0, sizeof(*boot_config));
   221		init_cfg_versions(boot_config, fwctx->boot_config_size, major);
   222		boot_config->subsys_config = subsys_config;
   223	
   224		boot_config->uc_tile_frequency = uc_freq;
   225		boot_config->uc_tile_frequency_units = 0;
   226		boot_config->fw_com_config.max_output_queues =
   227			fwctx->num_output_queues;
   228		boot_config->fw_com_config.max_input_queues =
   229			fwctx->num_input_queues;
   230	
   231		ipu6_dma_sync_single(adev, fwctx->boot_config_dma_addr,
   232				     fwctx->boot_config_size);
   233	
   234		for (i = 0; i < num_queues; i++) {
   235			u32 queue_size = qconfigs[i].max_capacity *
   236				qconfigs[i].token_size_in_bytes;
   237	
   238			queue_size = ALIGN(queue_size, 64U);
   239			total_queue_size_aligned += queue_size;
   240			qconfigs[i].queue_size = queue_size;
   241		}
   242	
   243		/* Allocate queue memory */
   244		fwctx->queue_mem = ipu6_dma_alloc(adev, total_queue_size_aligned,
   245						  &fwctx->queue_mem_dma_addr,
   246						  GFP_KERNEL, 0);
   247		if (!fwctx->queue_mem) {
   248			dev_err(dev, "Failed to allocate queue memory.\n");
 > 249			ipu7_release_boot_config(adev);
   250			return -ENOMEM;
   251		}
   252		fwctx->queue_mem_size = total_queue_size_aligned;
   253	
   254		cfgs = ipu7_fw_com_get_queue_config(&boot_config->fw_com_config);
   255		queue_mem_ptr = fwctx->queue_mem;
   256		queue_mem_dma_ptr = fwctx->queue_mem_dma_addr;
   257		for (i = 0; i < num_queues; i++) {
   258			cfgs[i].token_array_mem = queue_mem_dma_ptr;
   259			cfgs[i].max_capacity = qconfigs[i].max_capacity;
   260			cfgs[i].token_size_in_bytes = qconfigs[i].token_size_in_bytes;
   261			qconfigs[i].token_array_mem = queue_mem_ptr;
   262			queue_mem_dma_ptr += qconfigs[i].queue_size;
   263			queue_mem_ptr += qconfigs[i].queue_size;
   264		}
   265	
   266		ipu6_dma_sync_single(adev, fwctx->queue_mem_dma_addr,
   267				     total_queue_size_aligned);
   268	
   269		return 0;
   270	}
   271	EXPORT_SYMBOL_NS_GPL(ipu6_ipu7_init_boot_config, "INTEL_IPU6");
   272	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
