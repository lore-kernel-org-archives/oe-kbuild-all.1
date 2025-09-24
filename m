Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 540E628136C
	for <oe-kbuild-all@lists.linux.dev>; Wed, 24 Sep 2025 09:08:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758704930; cv=none; b=Zo6zIAKV8sSgc9w0cqvp3sxC8s9wuAgtdljIecHNUmiymtQwE+HrbJIgB/TMcUGRpeLObtReono96goD6iHOkhSYpX/mVQQX9r4OqkZEjR6YnLbXacyqO+4XFwYL/SQuMX6mg7E0Uh9GQxianjsiGLTn8vx2tbctDUgt7eHlrvM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758704930; c=relaxed/simple;
	bh=1lRhFVpy/Bv4Gtjjzpds787pEfndqXe4avfsUoZQqPo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=OVYUk12EJ49PAYtmaGmEyb2bSoBop++38o+qhJSAos5lRDZ2trd/NEP4+2hrkQ6svlQzpXtVIFMa5eAcpQJIWYOroXl1UdHEIX4gkdzdavcN56haaolCWlaO3123oqauzM8mgSKHWCyETWbh2YeUYd7N19ljUDpsITj4kjFtmT4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QiN+8oaI; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QiN+8oaI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758704929; x=1790240929;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1lRhFVpy/Bv4Gtjjzpds787pEfndqXe4avfsUoZQqPo=;
  b=QiN+8oaIJUMGx4PTMGiuzsld/FbNE2IU5NEw/T/H4KkvFLx8BMaJ3SBw
   c/eEkp1KQ35F+G3penVektmeus73WhrE0bGiDOct9u72OufUUVc81396+
   ZlVe0+Wp8RcXaojDgrI5P+75g1OsXqIY9dkSYMMBy1TklbpRui/Lv1wQt
   YrmtDgWWrLRGKfTayiwi7Jlh8xTPeBxvJVIasrJNUz6ynqzBKPMxMuBnr
   iJiQukZ+0YAIJXM5qGFd7bLPC23C/4zojcy4Ys6EHA48RI3Y8q+3zcf33
   qLqoFwmfBs5Ntjj8KjiqjiZTrcZWjiOXTr7imFrbvjtp76Do6pZ+wHXiz
   w==;
X-CSE-ConnectionGUID: GyMT873uRLyDKY6lUV6mPA==
X-CSE-MsgGUID: /Jnf3KagQ5ytcCoAKgSzjQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="60911374"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="60911374"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Sep 2025 02:08:47 -0700
X-CSE-ConnectionGUID: Bd3mQysmREGgnlZw5M2jVg==
X-CSE-MsgGUID: ZSmODR6OQF2Fb10auqsORA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,290,1751266800"; 
   d="scan'208";a="176110496"
Received: from lkp-server02.sh.intel.com (HELO 84c55410ccf6) ([10.239.97.151])
  by orviesa006.jf.intel.com with ESMTP; 24 Sep 2025 02:08:45 -0700
Received: from kbuild by 84c55410ccf6 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v1LUR-0003yB-1X;
	Wed, 24 Sep 2025 09:08:43 +0000
Date: Wed, 24 Sep 2025 17:08:24 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android13-5.15 1/1]
 drivers/pci/endpoint/functions/pci-epf-vntb.c:560:66: sparse: sparse:
 incorrect type in argument 3 (different address spaces)
Message-ID: <202509241919.HzNaO0c8-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android13-5.15
head:   0adf7888fd0aa146baed7b11d7f57eedb0727c93
commit: d2016efbc42a642ea512d5496eb2672a79a12bf3 [1/1] PCI: endpoint: pci-epf-vntb: Fix the incorrect usage of __iomem attribute
config: i386-randconfig-r113-20250924 (https://download.01.org/0day-ci/archive/20250924/202509241919.HzNaO0c8-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250924/202509241919.HzNaO0c8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509241919.HzNaO0c8-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/pci/endpoint/functions/pci-epf-vntb.c:548:21: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void [noderef] __iomem *epf_db @@     got void *[assigned] mw_addr @@
   drivers/pci/endpoint/functions/pci-epf-vntb.c:548:21: sparse:     expected void [noderef] __iomem *epf_db
   drivers/pci/endpoint/functions/pci-epf-vntb.c:548:21: sparse:     got void *[assigned] mw_addr
>> drivers/pci/endpoint/functions/pci-epf-vntb.c:560:66: sparse: sparse: incorrect type in argument 3 (different address spaces) @@     expected void [noderef] __iomem *virt_addr @@     got void *[assigned] mw_addr @@
   drivers/pci/endpoint/functions/pci-epf-vntb.c:560:66: sparse:     expected void [noderef] __iomem *virt_addr
   drivers/pci/endpoint/functions/pci-epf-vntb.c:560:66: sparse:     got void *[assigned] mw_addr
   drivers/pci/endpoint/functions/pci-epf-vntb.c:574:41: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void *addr @@     got void [noderef] __iomem *epf_db @@
   drivers/pci/endpoint/functions/pci-epf-vntb.c:574:41: sparse:     expected void *addr
   drivers/pci/endpoint/functions/pci-epf-vntb.c:574:41: sparse:     got void [noderef] __iomem *epf_db
   drivers/pci/endpoint/functions/pci-epf-vntb.c:600:45: sparse: sparse: Using plain integer as NULL pointer
   drivers/pci/endpoint/functions/pci-epf-vntb.c:985:16: sparse: sparse: symbol 'vpci_ops' was not declared. Should it be static?
   drivers/pci/endpoint/functions/pci-epf-vntb.c:1091:33: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void [noderef] __iomem *base @@     got struct epf_ntb_ctrl *reg @@
   drivers/pci/endpoint/functions/pci-epf-vntb.c:1091:33: sparse:     expected void [noderef] __iomem *base
   drivers/pci/endpoint/functions/pci-epf-vntb.c:1091:33: sparse:     got struct epf_ntb_ctrl *reg
   drivers/pci/endpoint/functions/pci-epf-vntb.c:1102:33: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void [noderef] __iomem *base @@     got struct epf_ntb_ctrl *reg @@
   drivers/pci/endpoint/functions/pci-epf-vntb.c:1102:33: sparse:     expected void [noderef] __iomem *base
   drivers/pci/endpoint/functions/pci-epf-vntb.c:1102:33: sparse:     got struct epf_ntb_ctrl *reg
   drivers/pci/endpoint/functions/pci-epf-vntb.c:1113:33: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void [noderef] __iomem *base @@     got struct epf_ntb_ctrl *reg @@
   drivers/pci/endpoint/functions/pci-epf-vntb.c:1113:33: sparse:     expected void [noderef] __iomem *base
   drivers/pci/endpoint/functions/pci-epf-vntb.c:1113:33: sparse:     got struct epf_ntb_ctrl *reg
   drivers/pci/endpoint/functions/pci-epf-vntb.c:1125:33: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void [noderef] __iomem *base @@     got struct epf_ntb_ctrl *reg @@
   drivers/pci/endpoint/functions/pci-epf-vntb.c:1125:33: sparse:     expected void [noderef] __iomem *base
   drivers/pci/endpoint/functions/pci-epf-vntb.c:1125:33: sparse:     got struct epf_ntb_ctrl *reg

vim +560 drivers/pci/endpoint/functions/pci-epf-vntb.c

e2b6ef72b7aea9 Frank Li              2022-02-22  511  
e2b6ef72b7aea9 Frank Li              2022-02-22  512  /**
e2b6ef72b7aea9 Frank Li              2022-02-22  513   * epf_ntb_db_bar_init() - Configure Doorbell window BARs
e2b6ef72b7aea9 Frank Li              2022-02-22  514   * @ntb: NTB device that facilitates communication between HOST and vHOST
e2b6ef72b7aea9 Frank Li              2022-02-22  515   */
e2b6ef72b7aea9 Frank Li              2022-02-22  516  static int epf_ntb_db_bar_init(struct epf_ntb *ntb)
e2b6ef72b7aea9 Frank Li              2022-02-22  517  {
e2b6ef72b7aea9 Frank Li              2022-02-22  518  	const struct pci_epc_features *epc_features;
e2b6ef72b7aea9 Frank Li              2022-02-22  519  	u32 align;
e2b6ef72b7aea9 Frank Li              2022-02-22  520  	struct device *dev = &ntb->epf->dev;
e2b6ef72b7aea9 Frank Li              2022-02-22  521  	int ret;
e2b6ef72b7aea9 Frank Li              2022-02-22  522  	struct pci_epf_bar *epf_bar;
d2016efbc42a64 Manivannan Sadhasivam 2025-07-09  523  	void *mw_addr;
e2b6ef72b7aea9 Frank Li              2022-02-22  524  	enum pci_barno barno;
e2b6ef72b7aea9 Frank Li              2022-02-22  525  	size_t size = 4 * ntb->db_count;
e2b6ef72b7aea9 Frank Li              2022-02-22  526  
e2b6ef72b7aea9 Frank Li              2022-02-22  527  	epc_features = pci_epc_get_features(ntb->epf->epc,
e2b6ef72b7aea9 Frank Li              2022-02-22  528  					    ntb->epf->func_no,
e2b6ef72b7aea9 Frank Li              2022-02-22  529  					    ntb->epf->vfunc_no);
e2b6ef72b7aea9 Frank Li              2022-02-22  530  	align = epc_features->align;
e2b6ef72b7aea9 Frank Li              2022-02-22  531  
e2b6ef72b7aea9 Frank Li              2022-02-22  532  	if (size < 128)
e2b6ef72b7aea9 Frank Li              2022-02-22  533  		size = 128;
e2b6ef72b7aea9 Frank Li              2022-02-22  534  
e2b6ef72b7aea9 Frank Li              2022-02-22  535  	if (align)
e2b6ef72b7aea9 Frank Li              2022-02-22  536  		size = ALIGN(size, align);
e2b6ef72b7aea9 Frank Li              2022-02-22  537  	else
e2b6ef72b7aea9 Frank Li              2022-02-22  538  		size = roundup_pow_of_two(size);
e2b6ef72b7aea9 Frank Li              2022-02-22  539  
e2b6ef72b7aea9 Frank Li              2022-02-22  540  	barno = ntb->epf_ntb_bar[BAR_DB];
e2b6ef72b7aea9 Frank Li              2022-02-22  541  
e2b6ef72b7aea9 Frank Li              2022-02-22  542  	mw_addr = pci_epf_alloc_space(ntb->epf, size, barno, align, 0);
e2b6ef72b7aea9 Frank Li              2022-02-22  543  	if (!mw_addr) {
e2b6ef72b7aea9 Frank Li              2022-02-22  544  		dev_err(dev, "Failed to allocate OB address\n");
e2b6ef72b7aea9 Frank Li              2022-02-22  545  		return -ENOMEM;
e2b6ef72b7aea9 Frank Li              2022-02-22  546  	}
e2b6ef72b7aea9 Frank Li              2022-02-22  547  
e2b6ef72b7aea9 Frank Li              2022-02-22  548  	ntb->epf_db = mw_addr;
e2b6ef72b7aea9 Frank Li              2022-02-22  549  
e2b6ef72b7aea9 Frank Li              2022-02-22  550  	epf_bar = &ntb->epf->bar[barno];
e2b6ef72b7aea9 Frank Li              2022-02-22  551  
e2b6ef72b7aea9 Frank Li              2022-02-22  552  	ret = pci_epc_set_bar(ntb->epf->epc, ntb->epf->func_no, ntb->epf->vfunc_no, epf_bar);
e2b6ef72b7aea9 Frank Li              2022-02-22  553  	if (ret) {
e2b6ef72b7aea9 Frank Li              2022-02-22  554  		dev_err(dev, "Doorbell BAR set failed\n");
e2b6ef72b7aea9 Frank Li              2022-02-22  555  			goto err_alloc_peer_mem;
e2b6ef72b7aea9 Frank Li              2022-02-22  556  	}
e2b6ef72b7aea9 Frank Li              2022-02-22  557  	return ret;
e2b6ef72b7aea9 Frank Li              2022-02-22  558  
e2b6ef72b7aea9 Frank Li              2022-02-22  559  err_alloc_peer_mem:
e2b6ef72b7aea9 Frank Li              2022-02-22 @560  	pci_epc_mem_free_addr(ntb->epf->epc, epf_bar->phys_addr, mw_addr, epf_bar->size);
e2b6ef72b7aea9 Frank Li              2022-02-22  561  	return -1;
e2b6ef72b7aea9 Frank Li              2022-02-22  562  }
e2b6ef72b7aea9 Frank Li              2022-02-22  563  

:::::: The code at line 560 was first introduced by commit
:::::: e2b6ef72b7aea9d7d480d2df499bcd1c93247abb PCI: endpoint: Support NTB transfer between RC and EP

:::::: TO: Frank Li <Frank.Li@nxp.com>
:::::: CC: Sasha Levin <sashal@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
