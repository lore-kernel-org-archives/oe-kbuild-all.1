Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4534226ED25
	for <oe-kbuild-all@lists.linux.dev>; Thu, 15 Jan 2026 05:26:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768454809; cv=none; b=q+thD+2WasUA/Fjp7pFm/lyp3qrmwJakhveP+BsHQmv4Dhl4MxmhKLt3XzZ3Q4Im9UhpbLMAsqfiXNrI/kFhRR7YrHXV3Llc+SXmItREVa5nkjjCUeIlS0gC1cQM2xFwhXcSwP8WCvOpWwQX+ZuqTqN3+Xrac8q27OvkeBzt9ho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768454809; c=relaxed/simple;
	bh=olJLEnEfsUnFET9fba2PgMlsCvqOrE/eSoTMAHO3yqg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=WV9WaSfSUo398ZJlDs+EeBR5Ltpiz0o0X7/Ja2IJN0IFQUGG9Z9EzhDbMecCGHV1QskNDCyZZM2LjVN/0F4ucm+dh7XBSvuGqhexbiI5qw/zSIq4v3z3SxyzMK69twMxoDOQK8Yvwl+BV2nxLXoBbLlPSHGu3EnhWemZ2ouvnxg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=d2rBslLn; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="d2rBslLn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768454808; x=1799990808;
  h=date:from:to:cc:subject:message-id;
  bh=olJLEnEfsUnFET9fba2PgMlsCvqOrE/eSoTMAHO3yqg=;
  b=d2rBslLn0Yt0OyLjRv0HMAqJQHX58BXPDWyG78dpJn19UKiUbabILTjJ
   sdyaEaFJ9CDxpJk2exjMEgQLv3RxEWGw0Z50lrfMO6wTBSOBDmi7qYFGw
   JqlBZwjYBGAzR0idMxMbS1hL5DS9ewzqHP1fz1BpbH7weBXkL2nCzcBQm
   spEt1l6nJ9KX9mGnRESDT4WL0M+VJWPLQV5Hg/LpL6nGLc4mHd+WMrRfh
   vUbrLnTeRRZN2IMzAkzftLK+jNQA6mT7umj8/W89tgrmN6DU2gCtzsyhK
   mvZxYtCQx/bjn+88aUqvxD571UJBqg9Lb2cynuCFTUWCKgNW9VJQqTHtC
   Q==;
X-CSE-ConnectionGUID: NKf4uhtlRKqPwFmA191E4A==
X-CSE-MsgGUID: 9D+t9b5TTLKmupT7AJDXtA==
X-IronPort-AV: E=McAfee;i="6800,10657,11671"; a="73610985"
X-IronPort-AV: E=Sophos;i="6.21,226,1763452800"; 
   d="scan'208";a="73610985"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jan 2026 21:26:48 -0800
X-CSE-ConnectionGUID: u319IdTQTHS6WlQBEsscxQ==
X-CSE-MsgGUID: OKHrHNY5Rk2hhKpTQ3j8mw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,226,1763452800"; 
   d="scan'208";a="204489865"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 14 Jan 2026 21:26:46 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vgFsa-00000000HaK-1xE4;
	Thu, 15 Jan 2026 05:26:44 +0000
Date: Thu, 15 Jan 2026 13:25:58 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android13-5.15 0/2]
 drivers/pci/endpoint/functions/pci-epf-vntb.c:560:66: sparse: sparse:
 incorrect type in argument 3 (different address spaces)
Message-ID: <202601151341.Sy3LaiXR-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android13-5.15
head:   f1af71170bbd2a241e39473036d3c14bc7c27d21
commit: d2016efbc42a642ea512d5496eb2672a79a12bf3 [0/2] PCI: endpoint: pci-epf-vntb: Fix the incorrect usage of __iomem attribute
config: i386-randconfig-062-20260115 (https://download.01.org/0day-ci/archive/20260115/202601151341.Sy3LaiXR-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260115/202601151341.Sy3LaiXR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601151341.Sy3LaiXR-lkp@intel.com/

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
