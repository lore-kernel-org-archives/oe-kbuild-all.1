Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2F4F2FB62B
	for <oe-kbuild-all@lists.linux.dev>; Wed, 17 Sep 2025 16:06:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758125208; cv=none; b=Fkj5ehhRVIL6O667LjQpR73mdzyqlMBF59gGYaoBIITo6PVMWl7cMYzAxfG3wD4GoCc8sCOxaouO2g8Ri6lGUaJaERwjTHNk1jsgwIbhQJOo7Q16FP7m/FtId6Q8GK0LOGOsxu6Ai7F8DVXe4453G6cInHzFA/b61aSNMMZ+Bbg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758125208; c=relaxed/simple;
	bh=2OHSotoR6IlM83qWU8uEA3f8g4pFeGGxui3Pz/JqaRM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=V7h4V2NR0BtY4QWDXtutLYIp0yCbos2yodlLxefyrPm3eekNXFbbfCQOL0FVCQgtqjygURxAnSDjm+krt1JQAVtxGMl1u0qKXm1sDQMPBzEjqCRZL78uYm3NsZb0EJ2j5ggylFQ9K1kOUxdCenrsovSlBkyrOcObnYutD+B0PEo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=O3Ys/2wI; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="O3Ys/2wI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758125207; x=1789661207;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=2OHSotoR6IlM83qWU8uEA3f8g4pFeGGxui3Pz/JqaRM=;
  b=O3Ys/2wILObc4TRcofO1PillAkJTnamH2+yQBi/Xa3zj929+Ql+s4ltD
   kM69yyyL5ECiE4TloDIcBTBkscCtQYTYWTZRidPuj2oxCc4h2qU8ynysM
   tWGjW+odbL1ffnM0VXuk2PDaJ2npn0yo7lDlhoNFrjz7sjTldyXGaqn7I
   qegzVvfa8rS3n4SHGV8DMsUKfqgCIK7pADz9M7fcnMRQhND+B71BCf+9r
   4mbE6Gpaq8RNi3haycZmbkcPp0/kPf+sIHfI8sv1puLea1pQijKV3ghNs
   kyC9iSWwS0AW9YAzD3KfyEMzvPsb7MjPaQ73VcBYaPgSZjXodespWfgF6
   Q==;
X-CSE-ConnectionGUID: 9lW6Q+YOTlST+II24vTmUw==
X-CSE-MsgGUID: SlWw63ZuTh6qqA8Wu9nRuQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="64240116"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="64240116"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Sep 2025 09:06:45 -0700
X-CSE-ConnectionGUID: 3o689iR5TWOR+k4+y2+mBA==
X-CSE-MsgGUID: KTMgpZVRQMW8NR69uGBI0A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,272,1751266800"; 
   d="scan'208";a="180557039"
Received: from lkp-server01.sh.intel.com (HELO 84a20bd60769) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 17 Sep 2025 09:06:43 -0700
Received: from kbuild by 84a20bd60769 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uyug5-0002Bj-0g;
	Wed, 17 Sep 2025 16:06:41 +0000
Date: Thu, 18 Sep 2025 00:06:10 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-6.1-lts 0/1]
 drivers/pci/endpoint/functions/pci-epf-vntb.c:562:21: sparse: sparse:
 incorrect type in assignment (different address spaces)
Message-ID: <202509180053.ui2Q6Quy-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android14-6.1-lts
head:   8c8937bc84545d6e04812fafa04bcf969f3a5cab
commit: b397e26abb5cf7481033bffacb9fe766f4ee117a [0/1] PCI: endpoint: pci-epf-vntb: Fix the incorrect usage of __iomem attribute
config: i386-randconfig-061-20250917 (https://download.01.org/0day-ci/archive/20250918/202509180053.ui2Q6Quy-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250918/202509180053.ui2Q6Quy-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509180053.ui2Q6Quy-lkp@intel.com/

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

e35f56bb03304ab Frank Li              2022-02-22  523  
e35f56bb03304ab Frank Li              2022-02-22  524  /**
e35f56bb03304ab Frank Li              2022-02-22  525   * epf_ntb_db_bar_init() - Configure Doorbell window BARs
16c06d34e27c4ae Frank Li              2022-11-02  526   * @ntb: NTB device that facilitates communication between HOST and VHOST
16c06d34e27c4ae Frank Li              2022-11-02  527   *
16c06d34e27c4ae Frank Li              2022-11-02  528   * Returns: Zero for success, or an error code in case of failure
e35f56bb03304ab Frank Li              2022-02-22  529   */
e35f56bb03304ab Frank Li              2022-02-22  530  static int epf_ntb_db_bar_init(struct epf_ntb *ntb)
e35f56bb03304ab Frank Li              2022-02-22  531  {
e35f56bb03304ab Frank Li              2022-02-22  532  	const struct pci_epc_features *epc_features;
e35f56bb03304ab Frank Li              2022-02-22  533  	u32 align;
e35f56bb03304ab Frank Li              2022-02-22  534  	struct device *dev = &ntb->epf->dev;
e35f56bb03304ab Frank Li              2022-02-22  535  	int ret;
e35f56bb03304ab Frank Li              2022-02-22  536  	struct pci_epf_bar *epf_bar;
b397e26abb5cf74 Manivannan Sadhasivam 2025-07-09  537  	void *mw_addr;
e35f56bb03304ab Frank Li              2022-02-22  538  	enum pci_barno barno;
e35f56bb03304ab Frank Li              2022-02-22  539  	size_t size = 4 * ntb->db_count;
e35f56bb03304ab Frank Li              2022-02-22  540  
e35f56bb03304ab Frank Li              2022-02-22  541  	epc_features = pci_epc_get_features(ntb->epf->epc,
e35f56bb03304ab Frank Li              2022-02-22  542  					    ntb->epf->func_no,
e35f56bb03304ab Frank Li              2022-02-22  543  					    ntb->epf->vfunc_no);
e35f56bb03304ab Frank Li              2022-02-22  544  	align = epc_features->align;
e35f56bb03304ab Frank Li              2022-02-22  545  
e35f56bb03304ab Frank Li              2022-02-22  546  	if (size < 128)
e35f56bb03304ab Frank Li              2022-02-22  547  		size = 128;
e35f56bb03304ab Frank Li              2022-02-22  548  
e35f56bb03304ab Frank Li              2022-02-22  549  	if (align)
e35f56bb03304ab Frank Li              2022-02-22  550  		size = ALIGN(size, align);
e35f56bb03304ab Frank Li              2022-02-22  551  	else
e35f56bb03304ab Frank Li              2022-02-22  552  		size = roundup_pow_of_two(size);
e35f56bb03304ab Frank Li              2022-02-22  553  
e35f56bb03304ab Frank Li              2022-02-22  554  	barno = ntb->epf_ntb_bar[BAR_DB];
e35f56bb03304ab Frank Li              2022-02-22  555  
e35f56bb03304ab Frank Li              2022-02-22  556  	mw_addr = pci_epf_alloc_space(ntb->epf, size, barno, align, 0);
e35f56bb03304ab Frank Li              2022-02-22  557  	if (!mw_addr) {
e35f56bb03304ab Frank Li              2022-02-22  558  		dev_err(dev, "Failed to allocate OB address\n");
e35f56bb03304ab Frank Li              2022-02-22  559  		return -ENOMEM;
e35f56bb03304ab Frank Li              2022-02-22  560  	}
e35f56bb03304ab Frank Li              2022-02-22  561  
e35f56bb03304ab Frank Li              2022-02-22 @562  	ntb->epf_db = mw_addr;
e35f56bb03304ab Frank Li              2022-02-22  563  
e35f56bb03304ab Frank Li              2022-02-22  564  	epf_bar = &ntb->epf->bar[barno];
e35f56bb03304ab Frank Li              2022-02-22  565  
e35f56bb03304ab Frank Li              2022-02-22  566  	ret = pci_epc_set_bar(ntb->epf->epc, ntb->epf->func_no, ntb->epf->vfunc_no, epf_bar);
e35f56bb03304ab Frank Li              2022-02-22  567  	if (ret) {
e35f56bb03304ab Frank Li              2022-02-22  568  		dev_err(dev, "Doorbell BAR set failed\n");
e35f56bb03304ab Frank Li              2022-02-22  569  			goto err_alloc_peer_mem;
e35f56bb03304ab Frank Li              2022-02-22  570  	}
e35f56bb03304ab Frank Li              2022-02-22  571  	return ret;
e35f56bb03304ab Frank Li              2022-02-22  572  
e35f56bb03304ab Frank Li              2022-02-22  573  err_alloc_peer_mem:
21d8b6bd3730fc6 Frank Li              2022-11-02  574  	pci_epf_free_space(ntb->epf, mw_addr, barno, 0);
e35f56bb03304ab Frank Li              2022-02-22  575  	return -1;
e35f56bb03304ab Frank Li              2022-02-22  576  }
e35f56bb03304ab Frank Li              2022-02-22  577  

:::::: The code at line 562 was first introduced by commit
:::::: e35f56bb03304abc92c928b641af41ca372966bb PCI: endpoint: Support NTB transfer between RC and EP

:::::: TO: Frank Li <Frank.Li@nxp.com>
:::::: CC: Jon Mason <jdmason@kudzu.us>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
