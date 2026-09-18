Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2638926AA91
	for <oe-kbuild-all@lists.linux.dev>; Fri, 18 Sep 2026 00:12:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789690330; cv=none; b=ENve4xE96KywQ9UKc2suOkkoUUgXBm+tnWWadBua1LFQ3PaJeiMjhp2vw8plgSo/csIi88+tucq+Fl5htHD+YvMHKps193XAkANmOGro+D46CMFpT1vUV9c5UkWdFVPhwUosFUdboOFLRXreNuQpKntY8Ju7M4Mr+Gmnt15yUUI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789690330; c=relaxed/simple;
	bh=DT/L4tUHBX4NP6IWsih4CTOzSnA0yfOJT1Q3jByFx0g=;
	h=Date:From:To:Cc:Subject:Message-ID; b=okRSLZKCLeEngNKghZG+54R6OxUNYSOU/Q8TuM6IXbBrCsxNVKw1xCZ2FkIEZBFslm6EBhEWirb0E4zra9qgJ2JcHfhxWkWHFTgSTlb0GIDgWQY6JTEu4MEI6q07IYDv71EAtVefOJQEGQGnMVk2VOrWObLKAqSK1Dh7izR6O6A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PbpYyB9I; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PbpYyB9I"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789690328; x=1821226328;
  h=date:from:to:cc:subject:message-id;
  bh=DT/L4tUHBX4NP6IWsih4CTOzSnA0yfOJT1Q3jByFx0g=;
  b=PbpYyB9IjYwmowBG7KdPMwLzPTrB3rUWz8hvxYqUEP+RhFnCYEfZeNQh
   JkjVwsaJibUjeax1sL3VESVHREPPX2Z82GS7JfxbSKKOBCe5guOtqBSQT
   Q3M2LAdrXWGvNCVkd3hrk8E9R9uCaGdjq7YGKDS6aOYhrK3IbSbiZvXpq
   UELb0sAB+6bhL32CooeefBLSQfm8M92JUV1OyGga+IZobNhZEGLZ/P0IS
   m2ZT2EtmObXH89rlcSGag38dQFb856rYEjaHip0DssWuK6jDHmDhqjjCU
   9nZx1QvK0BqTrfTS82tYL6kJ2cYHSeKF+Hjn1YfBAZkTxyPWe96+fq91U
   A==;
X-CSE-ConnectionGUID: s/ulsvP5RvK8QtaZpvNleA==
X-CSE-MsgGUID: Zi7dt8DCTlCO2HkGqed2Gw==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="90029986"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="90029986"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Sep 2026 17:12:07 -0700
X-CSE-ConnectionGUID: qlRCyF5pTIuHU7SJ42dn2Q==
X-CSE-MsgGUID: MH09TRxbR02NqKW1tTvccA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="269814190"
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 17 Sep 2026 17:12:06 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x7MCx-000000008pZ-32zR;
	Fri, 18 Sep 2026 00:12:03 +0000
Date: Fri, 18 Sep 2026 08:12:00 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-6.1-2026-09 0/1]
 drivers/pci/endpoint/functions/pci-epf-vntb.c:562:21: sparse: sparse:
 incorrect type in assignment (different address spaces)
Message-ID: <202609180811.yin1B54F-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android14-6.1-2026-09
head:   79480508eb1eed09620f1cd5484dbfa4a677d0a9
commit: b397e26abb5cf7481033bffacb9fe766f4ee117a [0/1] PCI: endpoint: pci-epf-vntb: Fix the incorrect usage of __iomem attribute
config: i386-randconfig-1300-20260918 (https://download.01.org/0day-ci/archive/20260918/202609180811.yin1B54F-lkp@intel.com/config)
compiler: clang version 22.1.3 (https://github.com/llvm/llvm-project e9846648fd6183ee6d8cbdb4502213fcf902a211)
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260918/202609180811.yin1B54F-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609180811.yin1B54F-lkp@intel.com/

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
