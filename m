Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D58625949B
	for <oe-kbuild-all@lists.linux.dev>; Sat, 21 Dec 2024 10:53:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734778408; cv=none; b=tiR/Z2KLOjV63qRDF13ddtPTCHaPC/lAdCmVE7zXQCRPehFC4Hx/SacINHt462ptOpDgLLtq09hAayoFIr+Htn7ndCbtxq7Zj2GvJjYfW5ImFP/pZhz4k70CwbZmnZryenkcjKjzhNS6jjE2tDx3C9O30SDAd1KhvVVnNYL+eeA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734778408; c=relaxed/simple;
	bh=O6AV6mwHNpkgRMO5khqUg+uHk8XldS/T3AUFEy6dRiY=;
	h=Date:From:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=HEEBf261welCZDoI42eG5sn99gWZ5CWyhEK9rWFLOnOHZbHZYoNCgh5koPwQVJ3X6bw2Su7l9lmJNAZuxR04277fdgH2l/B7dWDmsnAl776uB20xz+en0wkz17NdPU7E1f6lgnhUvTTAmabMLI+FlpU47sO8WNEyO40Y6frQPl8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QJv6AlLT; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QJv6AlLT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734778407; x=1766314407;
  h=date:from:cc:subject:message-id:mime-version;
  bh=O6AV6mwHNpkgRMO5khqUg+uHk8XldS/T3AUFEy6dRiY=;
  b=QJv6AlLTjP3NnvEjIhzhoKmpeVa2Rus8NCBjtPGKnP1wS1IRNTwTbfpC
   p8cCnKV3L0xgPE0mMi89lY6lD8DOc4DntBJYE9q3/wWUXja60AOu7kfoF
   viF/4MQ08Jev0tAIFWlpT9gq4LWrIbZQhnNsyLDR/LwYHgIuJKJUAuGhz
   QeEnQ13yQ96XujDTSachwrZSAkofvnq5eF4HNElU+CJkNri9YTqnpX9d8
   QXSjYewwH7zlAoOxs0wUTw5Mpm0qOFkiG0iHby7kk/D8Vj7zPHO/6fwgw
   My1U8xhgCaibAcA0WmG4IGkI0mUZkdg+50GIPFA/xr+3XmgZqA6QTq6mj
   A==;
X-CSE-ConnectionGUID: O/WhxI19SSOZ7paJ9X1TAA==
X-CSE-MsgGUID: vF3Ll1B1SQ6IzbgC0/csLQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11292"; a="57787568"
X-IronPort-AV: E=Sophos;i="6.12,253,1728975600"; 
   d="scan'208";a="57787568"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Dec 2024 02:53:26 -0800
X-CSE-ConnectionGUID: podRoSntSUqeWELGoUG9Tw==
X-CSE-MsgGUID: 0fPPl80/Qbq/PqZy0+j/kw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="102851450"
Received: from lkp-server01.sh.intel.com (HELO a46f226878e0) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 21 Dec 2024 02:53:25 -0800
Received: from kbuild by a46f226878e0 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tOx6o-00028p-2f;
	Sat, 21 Dec 2024 10:53:22 +0000
Date: Sat, 21 Dec 2024 18:52:28 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, "Qiao, Wei" <wei.qiao@intel.com>
Subject: [intel-lts:6.6/linux 6/9] drivers/bus/mhi/host/pci_generic.c:321:38:
 warning: 'mhi_qcom_sdx55_info' defined but not used
Message-ID: <202412211804.KTNkgTiK-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel/linux-intel-lts.git 6.6/linux
head:   a4ec5f44dc60164d4e5f12f91b65052ab30accc5
commit: 81d55423faad1b99bef446b88d57bfae3589108b [6/9] drivers: bus: mhi: add FN980 v2 support
config: arm-randconfig-001-20241221 (https://download.01.org/0day-ci/archive/20241221/202412211804.KTNkgTiK-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241221/202412211804.KTNkgTiK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412211804.KTNkgTiK-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/bus/mhi/host/pci_generic.c:321:38: warning: 'mhi_qcom_sdx55_info' defined but not used [-Wunused-const-variable=]
     321 | static const struct mhi_pci_dev_info mhi_qcom_sdx55_info = {
         |                                      ^~~~~~~~~~~~~~~~~~~


vim +/mhi_qcom_sdx55_info +321 drivers/bus/mhi/host/pci_generic.c

49d38ebb6faad9 drivers/bus/mhi/pci_generic.c Bhaumik Bhatt  2021-04-02  320  
855a70c12021bd drivers/bus/mhi/pci_generic.c Loic Poulain   2020-10-21 @321  static const struct mhi_pci_dev_info mhi_qcom_sdx55_info = {
855a70c12021bd drivers/bus/mhi/pci_generic.c Loic Poulain   2020-10-21  322  	.name = "qcom-sdx55m",
855a70c12021bd drivers/bus/mhi/pci_generic.c Loic Poulain   2020-10-21  323  	.fw = "qcom/sdx55m/sbl1.mbn",
855a70c12021bd drivers/bus/mhi/pci_generic.c Loic Poulain   2020-10-21  324  	.edl = "qcom/sdx55m/edl.mbn",
855a70c12021bd drivers/bus/mhi/pci_generic.c Loic Poulain   2020-10-21  325  	.config = &modem_qcom_v1_mhiv_config,
855a70c12021bd drivers/bus/mhi/pci_generic.c Loic Poulain   2020-10-21  326  	.bar_num = MHI_PCI_DEFAULT_BAR_NUM,
5c2c85315948c4 drivers/bus/mhi/pci_generic.c Richard Laing  2021-07-15  327  	.dma_data_width = 32,
d2e11fd2b7fcd1 drivers/bus/mhi/pci_generic.c Jakub Kicinski 2021-07-31  328  	.mru_default = 32768,
56f6f4c4eb2a71 drivers/bus/mhi/pci_generic.c Bhaumik Bhatt  2021-07-16  329  	.sideband_wake = false,
855a70c12021bd drivers/bus/mhi/pci_generic.c Loic Poulain   2020-10-21  330  };
855a70c12021bd drivers/bus/mhi/pci_generic.c Loic Poulain   2020-10-21  331  

:::::: The code at line 321 was first introduced by commit
:::::: 855a70c12021bdc5df60512f1d3f6d492dc715be bus: mhi: Add MHI PCI support for WWAN modems

:::::: TO: Loic Poulain <loic.poulain@linaro.org>
:::::: CC: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
