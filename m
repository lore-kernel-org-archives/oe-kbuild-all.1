Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D6961C6885
	for <oe-kbuild-all@lists.linux.dev>; Wed, 29 May 2024 20:55:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717016157; cv=none; b=DDDxpH/PPOlruDLgvOv+M/Buh8kjMbeRFwIZM2yNjrDOweUKULGKg3/oYRdD/aqSEtvoqfQllAtVXY7nvDpKrfl72RJH03W81PIcXtNCvqfex2xAmLORe777KE1sa/gln7U8Kr6Umy63ecLGLlM4gQmSaKkoeBZ2olhcWXt8/Sk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717016157; c=relaxed/simple;
	bh=WuyoN2elQR2/B1+PQo8Oxok8YqoSEi0nNuhN51Q6ulc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=FHnRo5pOxYnH74yjXk3+KaJ+YH4Vc62SXxywgeCJSfrDQPv5Cml0kuI8JQqXAg0mw2qRQizlm20Udj5Sp6zxIDWCWeF5oOR3D3863xfooQ+GEDlZ6eJGQ+fyeJkcq/570FjYa87eC19JMsPbz19tzqVnuQ+kwXSM64YTUOOG1DU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GtP/uUgu; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GtP/uUgu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717016155; x=1748552155;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=WuyoN2elQR2/B1+PQo8Oxok8YqoSEi0nNuhN51Q6ulc=;
  b=GtP/uUguH7TGrV1SHNrEjYvt1YL7NjTa83fa7brSZszG6pwVH5LxD+tL
   APldUNGNZoVccuP6Y+MzJGo+OWZ1xGdJ69/7JoXAWkQLjlpqwoYL88n+l
   tL+XuX+gSuNVSlPyyOUtbAZWyW+LX7MFBcV6qKfkEKoB3HvaQ06wv1Txs
   1Yp8LbS5M9xoPy+tqIxKN2zfszgX7wwp+wx5vbuSfuXRpZ1eRe9HFvGdR
   UsAXCgsWgZ2y24BUQYu4NjNyG028qp3bNhYn25c8lo7jTOkAuMjF+DKoR
   VTXQcF2DQjEnA3DAYEXglqh96GlY6bgrGFTKvDoYUBP4zjqLFVmifZlBe
   w==;
X-CSE-ConnectionGUID: uub1j/xLTZi4BDux1WMrCQ==
X-CSE-MsgGUID: RIL/ya2cRQ+KD2V94UDxgA==
X-IronPort-AV: E=McAfee;i="6600,9927,11087"; a="17287736"
X-IronPort-AV: E=Sophos;i="6.08,199,1712646000"; 
   d="scan'208";a="17287736"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 May 2024 13:55:54 -0700
X-CSE-ConnectionGUID: sQmt2HQ8SlaUYZRO7sb92w==
X-CSE-MsgGUID: 1qZmQzvcRZ+YrE84JXydYQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,199,1712646000"; 
   d="scan'208";a="40424806"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by orviesa003.jf.intel.com with ESMTP; 29 May 2024 13:55:53 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sCQKV-000EBh-1y;
	Wed, 29 May 2024 20:55:48 +0000
Date: Thu, 30 May 2024 04:54:59 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Steven Song <steven.song@3snic.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 21121/22575]
 drivers/net/ethernet/3snic/sssnic/hw/sss_adapter_mgmt.c:234:30: error: no
 member named 'physfn' in 'struct pci_dev'
Message-ID: <202405300401.gTFtRxYB-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   aec283517697385e25d19ae7312a63bad805b4a7
commit: a6a7981cbf66d4951425d33cdce6ef39206eba83 [21121/22575] Net: ethernet: Support 3snic 3s9xx network card
config: x86_64-randconfig-015-20240530 (https://download.01.org/0day-ci/archive/20240530/202405300401.gTFtRxYB-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240530/202405300401.gTFtRxYB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405300401.gTFtRxYB-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/net/ethernet/3snic/sssnic/hw/sss_adapter_mgmt.c:234:30: error: no member named 'physfn' in 'struct pci_dev'
     234 |                 pf_pdev = adapter->pcidev->physfn;
         |                           ~~~~~~~~~~~~~~~  ^
   1 error generated.
--
>> drivers/net/ethernet/3snic/sssnic/hw/sss_pci_probe.c:53:32: error: no member named 'physfn' in 'struct pci_dev'
      53 |         dev = pdev->is_virtfn ? pdev->physfn : pdev;
         |                                 ~~~~  ^
   drivers/net/ethernet/3snic/sssnic/hw/sss_pci_probe.c:84:31: warning: shift count >= width of type [-Wshift-count-overflow]
      84 |         ret = pci_set_dma_mask(pdev, DMA_BIT_MASK(64));
         |                                      ^~~~~~~~~~~~~~~~
   include/linux/dma-mapping.h:149:54: note: expanded from macro 'DMA_BIT_MASK'
     149 | #define DMA_BIT_MASK(n) (((n) == 64) ? ~0ULL : ((1ULL<<(n))-1))
         |                                                      ^ ~~~
   drivers/net/ethernet/3snic/sssnic/hw/sss_pci_probe.c:95:42: warning: shift count >= width of type [-Wshift-count-overflow]
      95 |         ret = pci_set_consistent_dma_mask(pdev, DMA_BIT_MASK(64));
         |                                                 ^~~~~~~~~~~~~~~~
   include/linux/dma-mapping.h:149:54: note: expanded from macro 'DMA_BIT_MASK'
     149 | #define DMA_BIT_MASK(n) (((n) == 64) ? ~0ULL : ((1ULL<<(n))-1))
         |                                                      ^ ~~~
   drivers/net/ethernet/3snic/sssnic/hw/sss_pci_probe.c:276:5: warning: no previous prototype for function 'sss_attach_uld_driver' [-Wmissing-prototypes]
     276 | int sss_attach_uld_driver(struct sss_pci_adapter *adapter,
         |     ^
   drivers/net/ethernet/3snic/sssnic/hw/sss_pci_probe.c:276:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     276 | int sss_attach_uld_driver(struct sss_pci_adapter *adapter,
         | ^
         | static 
   drivers/net/ethernet/3snic/sssnic/hw/sss_pci_probe.c:319:39: error: no member named 'physfn' in 'struct pci_dev'
     319 |         dev = (pdev->is_virtfn != 0) ? pdev->physfn : pdev;
         |                                        ~~~~  ^
   drivers/net/ethernet/3snic/sssnic/hw/sss_pci_probe.c:548:5: warning: no previous prototype for function 'sss_pci_probe' [-Wmissing-prototypes]
     548 | int sss_pci_probe(struct pci_dev *pdev, const struct pci_device_id *id)
         |     ^
   drivers/net/ethernet/3snic/sssnic/hw/sss_pci_probe.c:548:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     548 | int sss_pci_probe(struct pci_dev *pdev, const struct pci_device_id *id)
         | ^
         | static 
   4 warnings and 2 errors generated.


vim +234 drivers/net/ethernet/3snic/sssnic/hw/sss_adapter_mgmt.c

   221	
   222	static unsigned char sss_get_pci_bus_id(struct sss_pci_adapter *adapter)
   223	{
   224		struct pci_dev *pf_pdev = NULL;
   225		unsigned char bus_id = 0;
   226	
   227		if (!pci_is_root_bus(adapter->pcidev->bus))
   228			bus_id = adapter->pcidev->bus->number;
   229	
   230		if (bus_id == 0)
   231			return bus_id;
   232	
   233		if (adapter->pcidev->is_virtfn) {
 > 234			pf_pdev = adapter->pcidev->physfn;
   235			bus_id = pf_pdev->bus->number;
   236		}
   237	
   238		return bus_id;
   239	}
   240	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
