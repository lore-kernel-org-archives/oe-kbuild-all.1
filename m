Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9F66280335
	for <oe-kbuild-all@lists.linux.dev>; Tue, 13 Jan 2026 21:44:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768340692; cv=none; b=qLEzUKlUVhSTzH7O2XBbaEh/8PZhWx2UayywKO6gd9ZQ/5hcFzhZTfFvogtZSIhLAx7/ukVpAG6gAOro7ry1ZOkTOvFqrIzGZF5kDOWteczxWk7CaaF6pVMMjOLR0onWUjaoLCXdxF5Unsjd5AvLVi6VV52HZQi6CfWjo8J05P4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768340692; c=relaxed/simple;
	bh=cHM6b8EpGBus7yafnB20GB0lOhNC2ardinwl02nPsto=;
	h=Date:From:To:Cc:Subject:Message-ID; b=CNI2v1///cND/aXgoaGL1pQGob8wLyEuU/3jMeI+BUvmrdbq/dTaGmJANYea0YlRpuuqRm0k2khaJkUFjOidxN4cBQ53NREuWF5h8BvboXnnDYHKOlfugYgAVM3YvA9PuQ9pswLihs232YADHLRJgdZR4DRytmzixd2w340NDmE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KtlE663v; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KtlE663v"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768340690; x=1799876690;
  h=date:from:to:cc:subject:message-id;
  bh=cHM6b8EpGBus7yafnB20GB0lOhNC2ardinwl02nPsto=;
  b=KtlE663v3Jb6DE/HuHy1H5aIAT7O9zjO7CcvYC3iD3rARSmXX9vOCCb+
   rFaaiBp4XoaGSlGAoE0n+eLsytzflLVWquHyiQSdE+MdSvMamg2W3EO3e
   acxe0dq5e85N1SpYWIDKsv8GhLUnST1jk/0W0BVeN3WuwJSDqDFDpkdd9
   S9rLtYbbKCb637FNUdQ+B2CLeUNk3TkUt1uKIrdxTZGk0Tl4dsAwZdvo3
   zDk0WanD+R1uU1xbPkHBmjsxLephWKfTbX0srHKAPwWcWVa4gbuS5hZzn
   aO6ZmcVYCyFzfte5h3xCgLT7VhjU9f9NWaBqvQve0p/LtODI77miDWkC7
   g==;
X-CSE-ConnectionGUID: g6vsKv3CSlesm4OiPxDv8A==
X-CSE-MsgGUID: PR33p0nyQEeHW7Mu7NZUlw==
X-IronPort-AV: E=McAfee;i="6800,10657,11670"; a="81001404"
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; 
   d="scan'208";a="81001404"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jan 2026 13:44:50 -0800
X-CSE-ConnectionGUID: tKEYG3PqSaW3QOJFwqCVbQ==
X-CSE-MsgGUID: UrRTRI3NQRikKlhCwWh5nw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; 
   d="scan'208";a="204571032"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 13 Jan 2026 13:44:48 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vfmBy-00000000FQO-0Zmb;
	Tue, 13 Jan 2026 21:44:46 +0000
Date: Wed, 14 Jan 2026 05:44:38 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-6.1-2025-12 0/4]
 drivers/pci/endpoint/functions/pci-epf-vntb.c:562:21: sparse: sparse:
 incorrect type in assignment (different address spaces)
Message-ID: <202601140542.4QFkP40f-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android14-6.1-2025-12
head:   27b608536f8660a5fbd79f9e1390c90a9c1589db
commit: b397e26abb5cf7481033bffacb9fe766f4ee117a [0/4] PCI: endpoint: pci-epf-vntb: Fix the incorrect usage of __iomem attribute
config: i386-randconfig-063-20260113 (https://download.01.org/0day-ci/archive/20260114/202601140542.4QFkP40f-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260114/202601140542.4QFkP40f-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601140542.4QFkP40f-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/pci/endpoint/functions/pci-epf-vntb.c:562:21: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void [noderef] __iomem *epf_db @@     got void *[assigned] mw_addr @@
   drivers/pci/endpoint/functions/pci-epf-vntb.c:562:21: sparse:     expected void [noderef] __iomem *epf_db
   drivers/pci/endpoint/functions/pci-epf-vntb.c:562:21: sparse:     got void *[assigned] mw_addr
   drivers/pci/endpoint/functions/pci-epf-vntb.c:590:41: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void *addr @@     got void [noderef] __iomem *epf_db @@
   drivers/pci/endpoint/functions/pci-epf-vntb.c:590:41: sparse:     expected void *addr
   drivers/pci/endpoint/functions/pci-epf-vntb.c:590:41: sparse:     got void [noderef] __iomem *epf_db
   drivers/pci/endpoint/functions/pci-epf-vntb.c:1131:33: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void [noderef] __iomem *base @@     got struct epf_ntb_ctrl *reg @@
   drivers/pci/endpoint/functions/pci-epf-vntb.c:1131:33: sparse:     expected void [noderef] __iomem *base
   drivers/pci/endpoint/functions/pci-epf-vntb.c:1131:33: sparse:     got struct epf_ntb_ctrl *reg
   drivers/pci/endpoint/functions/pci-epf-vntb.c:1142:33: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void [noderef] __iomem *base @@     got struct epf_ntb_ctrl *reg @@
   drivers/pci/endpoint/functions/pci-epf-vntb.c:1142:33: sparse:     expected void [noderef] __iomem *base
   drivers/pci/endpoint/functions/pci-epf-vntb.c:1142:33: sparse:     got struct epf_ntb_ctrl *reg
   drivers/pci/endpoint/functions/pci-epf-vntb.c:1153:33: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void [noderef] __iomem *base @@     got struct epf_ntb_ctrl *reg @@
   drivers/pci/endpoint/functions/pci-epf-vntb.c:1153:33: sparse:     expected void [noderef] __iomem *base
   drivers/pci/endpoint/functions/pci-epf-vntb.c:1153:33: sparse:     got struct epf_ntb_ctrl *reg
   drivers/pci/endpoint/functions/pci-epf-vntb.c:1165:33: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void [noderef] __iomem *base @@     got struct epf_ntb_ctrl *reg @@
   drivers/pci/endpoint/functions/pci-epf-vntb.c:1165:33: sparse:     expected void [noderef] __iomem *base
   drivers/pci/endpoint/functions/pci-epf-vntb.c:1165:33: sparse:     got struct epf_ntb_ctrl *reg

vim +562 drivers/pci/endpoint/functions/pci-epf-vntb.c

e35f56bb03304a Frank Li              2022-02-22  523  
e35f56bb03304a Frank Li              2022-02-22  524  /**
e35f56bb03304a Frank Li              2022-02-22  525   * epf_ntb_db_bar_init() - Configure Doorbell window BARs
16c06d34e27c4a Frank Li              2022-11-02  526   * @ntb: NTB device that facilitates communication between HOST and VHOST
16c06d34e27c4a Frank Li              2022-11-02  527   *
16c06d34e27c4a Frank Li              2022-11-02  528   * Returns: Zero for success, or an error code in case of failure
e35f56bb03304a Frank Li              2022-02-22  529   */
e35f56bb03304a Frank Li              2022-02-22  530  static int epf_ntb_db_bar_init(struct epf_ntb *ntb)
e35f56bb03304a Frank Li              2022-02-22  531  {
e35f56bb03304a Frank Li              2022-02-22  532  	const struct pci_epc_features *epc_features;
e35f56bb03304a Frank Li              2022-02-22  533  	u32 align;
e35f56bb03304a Frank Li              2022-02-22  534  	struct device *dev = &ntb->epf->dev;
e35f56bb03304a Frank Li              2022-02-22  535  	int ret;
e35f56bb03304a Frank Li              2022-02-22  536  	struct pci_epf_bar *epf_bar;
b397e26abb5cf7 Manivannan Sadhasivam 2025-07-09  537  	void *mw_addr;
e35f56bb03304a Frank Li              2022-02-22  538  	enum pci_barno barno;
e35f56bb03304a Frank Li              2022-02-22  539  	size_t size = 4 * ntb->db_count;
e35f56bb03304a Frank Li              2022-02-22  540  
e35f56bb03304a Frank Li              2022-02-22  541  	epc_features = pci_epc_get_features(ntb->epf->epc,
e35f56bb03304a Frank Li              2022-02-22  542  					    ntb->epf->func_no,
e35f56bb03304a Frank Li              2022-02-22  543  					    ntb->epf->vfunc_no);
e35f56bb03304a Frank Li              2022-02-22  544  	align = epc_features->align;
e35f56bb03304a Frank Li              2022-02-22  545  
e35f56bb03304a Frank Li              2022-02-22  546  	if (size < 128)
e35f56bb03304a Frank Li              2022-02-22  547  		size = 128;
e35f56bb03304a Frank Li              2022-02-22  548  
e35f56bb03304a Frank Li              2022-02-22  549  	if (align)
e35f56bb03304a Frank Li              2022-02-22  550  		size = ALIGN(size, align);
e35f56bb03304a Frank Li              2022-02-22  551  	else
e35f56bb03304a Frank Li              2022-02-22  552  		size = roundup_pow_of_two(size);
e35f56bb03304a Frank Li              2022-02-22  553  
e35f56bb03304a Frank Li              2022-02-22  554  	barno = ntb->epf_ntb_bar[BAR_DB];
e35f56bb03304a Frank Li              2022-02-22  555  
e35f56bb03304a Frank Li              2022-02-22  556  	mw_addr = pci_epf_alloc_space(ntb->epf, size, barno, align, 0);
e35f56bb03304a Frank Li              2022-02-22  557  	if (!mw_addr) {
e35f56bb03304a Frank Li              2022-02-22  558  		dev_err(dev, "Failed to allocate OB address\n");
e35f56bb03304a Frank Li              2022-02-22  559  		return -ENOMEM;
e35f56bb03304a Frank Li              2022-02-22  560  	}
e35f56bb03304a Frank Li              2022-02-22  561  
e35f56bb03304a Frank Li              2022-02-22 @562  	ntb->epf_db = mw_addr;
e35f56bb03304a Frank Li              2022-02-22  563  
e35f56bb03304a Frank Li              2022-02-22  564  	epf_bar = &ntb->epf->bar[barno];
e35f56bb03304a Frank Li              2022-02-22  565  
e35f56bb03304a Frank Li              2022-02-22  566  	ret = pci_epc_set_bar(ntb->epf->epc, ntb->epf->func_no, ntb->epf->vfunc_no, epf_bar);
e35f56bb03304a Frank Li              2022-02-22  567  	if (ret) {
e35f56bb03304a Frank Li              2022-02-22  568  		dev_err(dev, "Doorbell BAR set failed\n");
e35f56bb03304a Frank Li              2022-02-22  569  			goto err_alloc_peer_mem;
e35f56bb03304a Frank Li              2022-02-22  570  	}
e35f56bb03304a Frank Li              2022-02-22  571  	return ret;
e35f56bb03304a Frank Li              2022-02-22  572  
e35f56bb03304a Frank Li              2022-02-22  573  err_alloc_peer_mem:
21d8b6bd3730fc Frank Li              2022-11-02  574  	pci_epf_free_space(ntb->epf, mw_addr, barno, 0);
e35f56bb03304a Frank Li              2022-02-22  575  	return -1;
e35f56bb03304a Frank Li              2022-02-22  576  }
e35f56bb03304a Frank Li              2022-02-22  577  

:::::: The code at line 562 was first introduced by commit
:::::: e35f56bb03304abc92c928b641af41ca372966bb PCI: endpoint: Support NTB transfer between RC and EP

:::::: TO: Frank Li <Frank.Li@nxp.com>
:::::: CC: Jon Mason <jdmason@kudzu.us>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
