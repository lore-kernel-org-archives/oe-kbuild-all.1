Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4036C179A0
	for <oe-kbuild-all@lists.linux.dev>; Tue, 12 Sep 2023 15:53:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694534005; x=1726070005;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=moA/tMsTaVKPH9vu3gm0ztbPxssiQ8mT+1/up42rqwo=;
  b=G1vD8EByXBAP3r5gTz7Gk/0vmGDTMMo4nXU3NW8bTMx9hLcFeWjSmw5u
   pqLZcHWjX4SJcdrHWCEG0x5m0q5YFKBapFnwrCVOAqmeOpQS+0LrLjeK0
   35j+G1QFbBpze/eWm4NBHFQdm1Gi5Gaq4CEitGeMVoIP+cDoaw07Cc6B7
   YWZsyqVHIMHB4I9lxQbfRv9K0BsM+JlewJkJb6kGIH7ZvIqy1LG0dLMWY
   6BmHoTKf82+5r2VKCtB6ecBNpupEMgwk5fC+4VnJgvRC90OEK7TYO0640
   EAozrm5hBAGp2/n8RdRT3Lw9xPXr9q0+zD6SLa2vLuuPwHuKz4kzk9RVl
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10831"; a="444848760"
X-IronPort-AV: E=Sophos;i="6.02,139,1688454000"; 
   d="scan'208";a="444848760"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Sep 2023 08:53:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10831"; a="990540606"
X-IronPort-AV: E=Sophos;i="6.02,139,1688454000"; 
   d="scan'208";a="990540606"
Received: from lkp-server02.sh.intel.com (HELO 0a6943a0b3e1) ([10.239.97.151])
  by fmsmga006.fm.intel.com with ESMTP; 12 Sep 2023 08:53:22 -0700
Received: from kbuild by 0a6943a0b3e1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qg5eC-00008b-0m;
	Tue, 12 Sep 2023 15:51:25 +0000
Date: Tue, 12 Sep 2023 23:49:00 +0800
From: kernel test robot <lkp@intel.com>
To: Frank Li <frank.li@nxp.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Lorenzo Pieralisi <lpieralisi@kernel.org>
Subject: drivers/pci/endpoint/functions/pci-epf-vntb.c:559:21: sparse:
 sparse: incorrect type in assignment (different address spaces)
Message-ID: <202309122334.yIGJPKhz-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   0bb80ecc33a8fb5a682236443c1e740d5c917d1d
commit: 01dcec6d57ce62d535b2016fc4a617627fff506d PCI: endpoint: pci-epf-vntb: Fix sparse build warning for epf_db
date:   10 months ago
config: i386-randconfig-063-20230912 (https://download.01.org/0day-ci/archive/20230912/202309122334.yIGJPKhz-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230912/202309122334.yIGJPKhz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309122334.yIGJPKhz-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/pci/endpoint/functions/pci-epf-vntb.c:553:17: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void [noderef] __iomem *mw_addr @@     got void * @@
   drivers/pci/endpoint/functions/pci-epf-vntb.c:553:17: sparse:     expected void [noderef] __iomem *mw_addr
   drivers/pci/endpoint/functions/pci-epf-vntb.c:553:17: sparse:     got void *
>> drivers/pci/endpoint/functions/pci-epf-vntb.c:559:21: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected unsigned int [usertype] *epf_db @@     got void [noderef] __iomem *mw_addr @@
   drivers/pci/endpoint/functions/pci-epf-vntb.c:559:21: sparse:     expected unsigned int [usertype] *epf_db
   drivers/pci/endpoint/functions/pci-epf-vntb.c:559:21: sparse:     got void [noderef] __iomem *mw_addr
   drivers/pci/endpoint/functions/pci-epf-vntb.c:571:38: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void *addr @@     got void [noderef] __iomem *mw_addr @@
   drivers/pci/endpoint/functions/pci-epf-vntb.c:571:38: sparse:     expected void *addr
   drivers/pci/endpoint/functions/pci-epf-vntb.c:571:38: sparse:     got void [noderef] __iomem *mw_addr
   drivers/pci/endpoint/functions/pci-epf-vntb.c:1124:33: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void [noderef] __iomem *base @@     got struct epf_ntb_ctrl *reg @@
   drivers/pci/endpoint/functions/pci-epf-vntb.c:1124:33: sparse:     expected void [noderef] __iomem *base
   drivers/pci/endpoint/functions/pci-epf-vntb.c:1124:33: sparse:     got struct epf_ntb_ctrl *reg
   drivers/pci/endpoint/functions/pci-epf-vntb.c:1135:33: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void [noderef] __iomem *base @@     got struct epf_ntb_ctrl *reg @@
   drivers/pci/endpoint/functions/pci-epf-vntb.c:1135:33: sparse:     expected void [noderef] __iomem *base
   drivers/pci/endpoint/functions/pci-epf-vntb.c:1135:33: sparse:     got struct epf_ntb_ctrl *reg
   drivers/pci/endpoint/functions/pci-epf-vntb.c:1146:33: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void [noderef] __iomem *base @@     got struct epf_ntb_ctrl *reg @@
   drivers/pci/endpoint/functions/pci-epf-vntb.c:1146:33: sparse:     expected void [noderef] __iomem *base
   drivers/pci/endpoint/functions/pci-epf-vntb.c:1146:33: sparse:     got struct epf_ntb_ctrl *reg
   drivers/pci/endpoint/functions/pci-epf-vntb.c:1158:33: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void [noderef] __iomem *base @@     got struct epf_ntb_ctrl *reg @@
   drivers/pci/endpoint/functions/pci-epf-vntb.c:1158:33: sparse:     expected void [noderef] __iomem *base
   drivers/pci/endpoint/functions/pci-epf-vntb.c:1158:33: sparse:     got struct epf_ntb_ctrl *reg

vim +559 drivers/pci/endpoint/functions/pci-epf-vntb.c

e35f56bb03304a Frank Li 2022-02-22  520  
e35f56bb03304a Frank Li 2022-02-22  521  /**
e35f56bb03304a Frank Li 2022-02-22  522   * epf_ntb_db_bar_init() - Configure Doorbell window BARs
9298804840457c Frank Li 2022-11-02  523   * @ntb: NTB device that facilitates communication between HOST and VHOST
9298804840457c Frank Li 2022-11-02  524   *
9298804840457c Frank Li 2022-11-02  525   * Returns: Zero for success, or an error code in case of failure
e35f56bb03304a Frank Li 2022-02-22  526   */
e35f56bb03304a Frank Li 2022-02-22  527  static int epf_ntb_db_bar_init(struct epf_ntb *ntb)
e35f56bb03304a Frank Li 2022-02-22  528  {
e35f56bb03304a Frank Li 2022-02-22  529  	const struct pci_epc_features *epc_features;
e35f56bb03304a Frank Li 2022-02-22  530  	u32 align;
e35f56bb03304a Frank Li 2022-02-22  531  	struct device *dev = &ntb->epf->dev;
e35f56bb03304a Frank Li 2022-02-22  532  	int ret;
e35f56bb03304a Frank Li 2022-02-22  533  	struct pci_epf_bar *epf_bar;
e35f56bb03304a Frank Li 2022-02-22  534  	void __iomem *mw_addr;
e35f56bb03304a Frank Li 2022-02-22  535  	enum pci_barno barno;
2b35c886556a24 Frank Li 2022-11-02  536  	size_t size = sizeof(u32) * ntb->db_count;
e35f56bb03304a Frank Li 2022-02-22  537  
e35f56bb03304a Frank Li 2022-02-22  538  	epc_features = pci_epc_get_features(ntb->epf->epc,
e35f56bb03304a Frank Li 2022-02-22  539  					    ntb->epf->func_no,
e35f56bb03304a Frank Li 2022-02-22  540  					    ntb->epf->vfunc_no);
e35f56bb03304a Frank Li 2022-02-22  541  	align = epc_features->align;
e35f56bb03304a Frank Li 2022-02-22  542  
e35f56bb03304a Frank Li 2022-02-22  543  	if (size < 128)
e35f56bb03304a Frank Li 2022-02-22  544  		size = 128;
e35f56bb03304a Frank Li 2022-02-22  545  
e35f56bb03304a Frank Li 2022-02-22  546  	if (align)
e35f56bb03304a Frank Li 2022-02-22  547  		size = ALIGN(size, align);
e35f56bb03304a Frank Li 2022-02-22  548  	else
e35f56bb03304a Frank Li 2022-02-22  549  		size = roundup_pow_of_two(size);
e35f56bb03304a Frank Li 2022-02-22  550  
e35f56bb03304a Frank Li 2022-02-22  551  	barno = ntb->epf_ntb_bar[BAR_DB];
e35f56bb03304a Frank Li 2022-02-22  552  
e35f56bb03304a Frank Li 2022-02-22  553  	mw_addr = pci_epf_alloc_space(ntb->epf, size, barno, align, 0);
e35f56bb03304a Frank Li 2022-02-22  554  	if (!mw_addr) {
e35f56bb03304a Frank Li 2022-02-22  555  		dev_err(dev, "Failed to allocate OB address\n");
e35f56bb03304a Frank Li 2022-02-22  556  		return -ENOMEM;
e35f56bb03304a Frank Li 2022-02-22  557  	}
e35f56bb03304a Frank Li 2022-02-22  558  
e35f56bb03304a Frank Li 2022-02-22 @559  	ntb->epf_db = mw_addr;
e35f56bb03304a Frank Li 2022-02-22  560  
e35f56bb03304a Frank Li 2022-02-22  561  	epf_bar = &ntb->epf->bar[barno];
e35f56bb03304a Frank Li 2022-02-22  562  
e35f56bb03304a Frank Li 2022-02-22  563  	ret = pci_epc_set_bar(ntb->epf->epc, ntb->epf->func_no, ntb->epf->vfunc_no, epf_bar);
e35f56bb03304a Frank Li 2022-02-22  564  	if (ret) {
e35f56bb03304a Frank Li 2022-02-22  565  		dev_err(dev, "Doorbell BAR set failed\n");
e35f56bb03304a Frank Li 2022-02-22  566  			goto err_alloc_peer_mem;
e35f56bb03304a Frank Li 2022-02-22  567  	}
e35f56bb03304a Frank Li 2022-02-22  568  	return ret;
e35f56bb03304a Frank Li 2022-02-22  569  
e35f56bb03304a Frank Li 2022-02-22  570  err_alloc_peer_mem:
0c031262d2ddfb Frank Li 2022-11-02  571  	pci_epf_free_space(ntb->epf, mw_addr, barno, 0);
e35f56bb03304a Frank Li 2022-02-22  572  	return -1;
e35f56bb03304a Frank Li 2022-02-22  573  }
e35f56bb03304a Frank Li 2022-02-22  574  

:::::: The code at line 559 was first introduced by commit
:::::: e35f56bb03304abc92c928b641af41ca372966bb PCI: endpoint: Support NTB transfer between RC and EP

:::::: TO: Frank Li <Frank.Li@nxp.com>
:::::: CC: Jon Mason <jdmason@kudzu.us>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
