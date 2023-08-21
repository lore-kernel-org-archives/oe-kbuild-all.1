Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76EFD11737
	for <oe-kbuild-all@lists.linux.dev>; Mon, 21 Aug 2023 20:54:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692651297; x=1724187297;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=AGsz4yZ0hw+J8M1Ms6LViWHmpg/EaU9JeO+ZIPIXmTY=;
  b=mI0OP+70+sL9FLBCjijmY/GQ7/VcmQQPBh/o5QoXrNHTSVzi769szNYJ
   KPkRF6HLuEqVOscFZe1V7kgx4JUfXk7Ku20G3W03xcD/8rwvzsci38oAs
   c5yatX8tbxHsYQzLRmU5SpRA5kDzo3UVwnT2srcz3CuuO40xRyVXqV75P
   fb5xdMXv9tgsb3QsTzBfK02FyICiYJRz2WO0WSJAGvzb4f8mZ1qSBIdYY
   Asm6BfXG+NQDZNQY2iHDmiAqScSYIRz7Q6xNWItPZge5cQBGKw1tRX+SY
   ARiGyzibfSQpmZ7cAx+W6qSBVhzjGBeo8TXCtGyuyItrUQcaMdFSQ4Yy1
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10809"; a="404701016"
X-IronPort-AV: E=Sophos;i="6.01,191,1684825200"; 
   d="scan'208";a="404701016"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Aug 2023 13:54:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10809"; a="806048053"
X-IronPort-AV: E=Sophos;i="6.01,191,1684825200"; 
   d="scan'208";a="806048053"
Received: from lkp-server02.sh.intel.com (HELO 6809aa828f2a) ([10.239.97.151])
  by fmsmga004.fm.intel.com with ESMTP; 21 Aug 2023 13:54:55 -0700
Received: from kbuild by 6809aa828f2a with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qYBuc-0000uy-2K;
	Mon, 21 Aug 2023 20:54:30 +0000
Date: Tue, 22 Aug 2023 04:54:00 +0800
From: kernel test robot <lkp@intel.com>
To: Lukas Wunner <lukas@wunner.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [l1k:doe 8/14] drivers/pci/controller/dwc/../../pci.h:322:34:
 warning: 'struct x509_certificate' declared inside parameter list will not
 be visible outside of this definition or declaration
Message-ID: <202308220410.jIVy3LKf-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/l1k/linux doe
head:   bacc658a77ea402d1c961c2e56c3eb5e061a913a
commit: a63b45e21736daae5de480f41c2c0677a85cb515 [8/14] PCI/CMA: Validate Subject Alternative Name in certificates
config: powerpc-allmodconfig (https://download.01.org/0day-ci/archive/20230822/202308220410.jIVy3LKf-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230822/202308220410.jIVy3LKf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308220410.jIVy3LKf-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/pci/controller/dwc/pcie-designware.c:23:
>> drivers/pci/controller/dwc/../../pci.h:322:34: warning: 'struct x509_certificate' declared inside parameter list will not be visible outside of this definition or declaration
     322 | int pci_cma_validate_cert(struct x509_certificate *leaf_cert,
         |                                  ^~~~~~~~~~~~~~~~
--
   In file included from drivers/pci/controller/mobiveil/pcie-mobiveil.h:18,
                    from drivers/pci/controller/mobiveil/pcie-mobiveil.c:18:
>> drivers/pci/controller/mobiveil/../../pci.h:322:34: warning: 'struct x509_certificate' declared inside parameter list will not be visible outside of this definition or declaration
     322 | int pci_cma_validate_cert(struct x509_certificate *leaf_cert,
         |                                  ^~~~~~~~~~~~~~~~
--
   In file included from drivers/pci/doe.c:23:
>> drivers/pci/pci.h:322:34: warning: 'struct x509_certificate' declared inside parameter list will not be visible outside of this definition or declaration
     322 | int pci_cma_validate_cert(struct x509_certificate *leaf_cert,
         |                                  ^~~~~~~~~~~~~~~~
--
   In file included from drivers/pci/pci-sysfs.c:32:
>> drivers/pci/pci.h:322:34: warning: 'struct x509_certificate' declared inside parameter list will not be visible outside of this definition or declaration
     322 | int pci_cma_validate_cert(struct x509_certificate *leaf_cert,
         |                                  ^~~~~~~~~~~~~~~~
   drivers/pci/pci-sysfs.c:936:13: warning: no previous prototype for 'pci_adjust_legacy_attr' [-Wmissing-prototypes]
     936 | void __weak pci_adjust_legacy_attr(struct pci_bus *b,
         |             ^~~~~~~~~~~~~~~~~~~~~~
--
   In file included from drivers/pci/hotplug/rpaphp_core.c:25:
>> drivers/pci/hotplug/../pci.h:322:34: warning: 'struct x509_certificate' declared inside parameter list will not be visible outside of this definition or declaration
     322 | int pci_cma_validate_cert(struct x509_certificate *leaf_cert,
         |                                  ^~~~~~~~~~~~~~~~
--
   In file included from drivers/pci/msi/pcidev_msi.c:5:
>> drivers/pci/msi/../pci.h:322:34: warning: 'struct x509_certificate' declared inside parameter list will not be visible outside of this definition or declaration
     322 | int pci_cma_validate_cert(struct x509_certificate *leaf_cert,
         |                                  ^~~~~~~~~~~~~~~~
--
   In file included from drivers/pci/pcie/portdrv.c:21:
>> drivers/pci/pcie/../pci.h:322:34: warning: 'struct x509_certificate' declared inside parameter list will not be visible outside of this definition or declaration
     322 | int pci_cma_validate_cert(struct x509_certificate *leaf_cert,
         |                                  ^~~~~~~~~~~~~~~~


vim +322 drivers/pci/controller/dwc/../../pci.h

   318	
   319	#ifdef CONFIG_PCI_CMA
   320	void pci_cma_init(struct pci_dev *pdev);
   321	void pci_cma_destroy(struct pci_dev *pdev);
 > 322	int pci_cma_validate_cert(struct x509_certificate *leaf_cert,
   323				  struct device *dev);
   324	#else
   325	static inline void pci_cma_init(struct pci_dev *pdev) { }
   326	static inline void pci_cma_destroy(struct pci_dev *pdev) { }
   327	#endif
   328	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
