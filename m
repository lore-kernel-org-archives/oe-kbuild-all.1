Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B251A55
	for <oe-kbuild-all@lists.linux.dev>; Tue, 12 Sep 2023 01:10:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694481007; x=1726017007;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+Uvu7q+m85ooZsPmlS83MoSZRQOkl6ZVhvejGoiZmNg=;
  b=ZNmVVBRl+u+VHVL+vsQE3T0GXBIXTjP+ZVpjqwT4ckdoE0d9MZG6OV7N
   5ZYeGq7nQeFGqDj9C0VpIINAZ8kULQK8lBtDRS15KkwEKErA9q1LvZVdI
   EB6/upiDpUR6j/I3k/tChOmpQeV5P1zAp7n8yDGL4u28JHGrBOGouUUYg
   zFHlZ1vgdvL6MwGZGFxNaeydDIgkraD4ZddT37Pk9nC1br2s758noXC43
   njzwywLQfdEf5goAZ5pCM06g+8lOA8dmkPYWWls9AHOJ1/PgR+ZW2RFHV
   GagylSF8/GEpWh8DC00yvGY0g5Uo0KDvXgvcmbdXkIr+xw9U1l/gC29SG
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10830"; a="378154780"
X-IronPort-AV: E=Sophos;i="6.02,244,1688454000"; 
   d="scan'208";a="378154780"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Sep 2023 18:10:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10830"; a="858575203"
X-IronPort-AV: E=Sophos;i="6.02,244,1688454000"; 
   d="scan'208";a="858575203"
Received: from lkp-server01.sh.intel.com (HELO 59b3c6e06877) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 11 Sep 2023 18:10:04 -0700
Received: from kbuild by 59b3c6e06877 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qfruk-000729-32;
	Tue, 12 Sep 2023 01:10:02 +0000
Date: Tue, 12 Sep 2023 09:09:12 +0800
From: kernel test robot <lkp@intel.com>
To: Frank Li <frank.li@nxp.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Lorenzo Pieralisi <lpieralisi@kernel.org>
Subject: drivers/pci/endpoint/functions/pci-epf-vntb.c:574:38: sparse:
 sparse: incorrect type in argument 2 (different address spaces)
Message-ID: <202309120945.5UQE5GCL-lkp@intel.com>
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
commit: 0c031262d2ddfb938f9668d620d7ed674771646c PCI: endpoint: pci-epf-vntb: Fix call pci_epc_mem_free_addr() in error path
date:   10 months ago
config: i386-randconfig-063-20230912 (https://download.01.org/0day-ci/archive/20230912/202309120945.5UQE5GCL-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230912/202309120945.5UQE5GCL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309120945.5UQE5GCL-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/pci/endpoint/functions/pci-epf-vntb.c:556:17: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void [noderef] __iomem *mw_addr @@     got void * @@
   drivers/pci/endpoint/functions/pci-epf-vntb.c:556:17: sparse:     expected void [noderef] __iomem *mw_addr
   drivers/pci/endpoint/functions/pci-epf-vntb.c:556:17: sparse:     got void *
>> drivers/pci/endpoint/functions/pci-epf-vntb.c:574:38: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void *addr @@     got void [noderef] __iomem *mw_addr @@
   drivers/pci/endpoint/functions/pci-epf-vntb.c:574:38: sparse:     expected void *addr
   drivers/pci/endpoint/functions/pci-epf-vntb.c:574:38: sparse:     got void [noderef] __iomem *mw_addr
   drivers/pci/endpoint/functions/pci-epf-vntb.c:590:41: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void *addr @@     got void [noderef] __iomem *epf_db @@
   drivers/pci/endpoint/functions/pci-epf-vntb.c:590:41: sparse:     expected void *addr
   drivers/pci/endpoint/functions/pci-epf-vntb.c:590:41: sparse:     got void [noderef] __iomem *epf_db
   drivers/pci/endpoint/functions/pci-epf-vntb.c:1127:33: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void [noderef] __iomem *base @@     got struct epf_ntb_ctrl *reg @@
   drivers/pci/endpoint/functions/pci-epf-vntb.c:1127:33: sparse:     expected void [noderef] __iomem *base
   drivers/pci/endpoint/functions/pci-epf-vntb.c:1127:33: sparse:     got struct epf_ntb_ctrl *reg
   drivers/pci/endpoint/functions/pci-epf-vntb.c:1138:33: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void [noderef] __iomem *base @@     got struct epf_ntb_ctrl *reg @@
   drivers/pci/endpoint/functions/pci-epf-vntb.c:1138:33: sparse:     expected void [noderef] __iomem *base
   drivers/pci/endpoint/functions/pci-epf-vntb.c:1138:33: sparse:     got struct epf_ntb_ctrl *reg
   drivers/pci/endpoint/functions/pci-epf-vntb.c:1149:33: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void [noderef] __iomem *base @@     got struct epf_ntb_ctrl *reg @@
   drivers/pci/endpoint/functions/pci-epf-vntb.c:1149:33: sparse:     expected void [noderef] __iomem *base
   drivers/pci/endpoint/functions/pci-epf-vntb.c:1149:33: sparse:     got struct epf_ntb_ctrl *reg
   drivers/pci/endpoint/functions/pci-epf-vntb.c:1161:33: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void [noderef] __iomem *base @@     got struct epf_ntb_ctrl *reg @@
   drivers/pci/endpoint/functions/pci-epf-vntb.c:1161:33: sparse:     expected void [noderef] __iomem *base
   drivers/pci/endpoint/functions/pci-epf-vntb.c:1161:33: sparse:     got struct epf_ntb_ctrl *reg

vim +574 drivers/pci/endpoint/functions/pci-epf-vntb.c

   523	
   524	/**
   525	 * epf_ntb_db_bar_init() - Configure Doorbell window BARs
   526	 * @ntb: NTB device that facilitates communication between HOST and VHOST
   527	 *
   528	 * Returns: Zero for success, or an error code in case of failure
   529	 */
   530	static int epf_ntb_db_bar_init(struct epf_ntb *ntb)
   531	{
   532		const struct pci_epc_features *epc_features;
   533		u32 align;
   534		struct device *dev = &ntb->epf->dev;
   535		int ret;
   536		struct pci_epf_bar *epf_bar;
   537		void __iomem *mw_addr;
   538		enum pci_barno barno;
   539		size_t size = 4 * ntb->db_count;
   540	
   541		epc_features = pci_epc_get_features(ntb->epf->epc,
   542						    ntb->epf->func_no,
   543						    ntb->epf->vfunc_no);
   544		align = epc_features->align;
   545	
   546		if (size < 128)
   547			size = 128;
   548	
   549		if (align)
   550			size = ALIGN(size, align);
   551		else
   552			size = roundup_pow_of_two(size);
   553	
   554		barno = ntb->epf_ntb_bar[BAR_DB];
   555	
 > 556		mw_addr = pci_epf_alloc_space(ntb->epf, size, barno, align, 0);
   557		if (!mw_addr) {
   558			dev_err(dev, "Failed to allocate OB address\n");
   559			return -ENOMEM;
   560		}
   561	
   562		ntb->epf_db = mw_addr;
   563	
   564		epf_bar = &ntb->epf->bar[barno];
   565	
   566		ret = pci_epc_set_bar(ntb->epf->epc, ntb->epf->func_no, ntb->epf->vfunc_no, epf_bar);
   567		if (ret) {
   568			dev_err(dev, "Doorbell BAR set failed\n");
   569				goto err_alloc_peer_mem;
   570		}
   571		return ret;
   572	
   573	err_alloc_peer_mem:
 > 574		pci_epf_free_space(ntb->epf, mw_addr, barno, 0);
   575		return -1;
   576	}
   577	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
