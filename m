Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABFD0BA3F
	for <oe-kbuild-all@lists.linux.dev>; Fri,  3 Feb 2023 21:50:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675461019; x=1706997019;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=FFIzjhdgqknkplRurXg/LkwlosBerP8ZvQ2Rz7ToWLg=;
  b=PuIWNy14WpoIFrTtSPBol+/2rTDL6Uygya8yPm+EJsbWx3xY/JBOqjbm
   B66OkZaP7KQOmv0/Bo/k4CedFVkaq0IEn2wFOVMwCOa6i/oUu1SwI1gVn
   FXBL+HVOza2Vz05Y3HawGQQM8bLFbJ/4+JkiRbgOUdnOZ74CQOyEU/YzI
   Xrnpw81n7zcr2ynbzBxPFzGjJP3DOvdSFN1F0gukCz6OlraA2xIVu5nNp
   xdML8S74BUHPzag8yKvtu/mv97bSdC3riz3xpC30tCD8lQP9yoxWuNxvw
   bSbAjjfMO5V6CPxiMrGR5mSx8nGSFgJ0rjY7oYM6ixc0VLmLhrPpiRICA
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10610"; a="330994155"
X-IronPort-AV: E=Sophos;i="5.97,271,1669104000"; 
   d="scan'208";a="330994155"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2023 13:50:19 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10610"; a="754613977"
X-IronPort-AV: E=Sophos;i="5.97,271,1669104000"; 
   d="scan'208";a="754613977"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 03 Feb 2023 13:50:17 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pO3wn-0000mP-1D;
	Fri, 03 Feb 2023 21:50:17 +0000
Date: Sat, 4 Feb 2023 05:50:14 +0800
From: kernel test robot <lkp@intel.com>
To: Lukas Wunner <lukas@wunner.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [l1k:doe 11/23] drivers/pci/msi/../pci.h:361:9: error: implicit
 declaration of function 'pci_doe_disconnected'; did you mean
 'pci_dev_set_disconnected'?
Message-ID: <202302040502.LnurG7E5-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/l1k/linux doe
head:   167c147eed6cb9d32a5f27c0aa5ac8d07e960982
commit: cad83afa09817cb77ae9b53ad992c8894b6ecdb5 [11/23] PCI/DOE: Create mailboxes on device enumeration
config: alpha-defconfig (https://download.01.org/0day-ci/archive/20230204/202302040502.LnurG7E5-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/l1k/linux/commit/cad83afa09817cb77ae9b53ad992c8894b6ecdb5
        git remote add l1k https://github.com/l1k/linux
        git fetch --no-tags l1k doe
        git checkout cad83afa09817cb77ae9b53ad992c8894b6ecdb5
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=alpha olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=alpha SHELL=/bin/bash drivers/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All error/warnings (new ones prefixed by >>):

   In file included from drivers/pci/msi/pcidev_msi.c:5:
   drivers/pci/msi/../pci.h: In function 'pci_dev_set_disconnected':
>> drivers/pci/msi/../pci.h:361:9: error: implicit declaration of function 'pci_doe_disconnected'; did you mean 'pci_dev_set_disconnected'? [-Werror=implicit-function-declaration]
     361 |         pci_doe_disconnected(dev);
         |         ^~~~~~~~~~~~~~~~~~~~
         |         pci_dev_set_disconnected
   drivers/pci/msi/../pci.h: At top level:
>> drivers/pci/msi/../pci.h:789:20: warning: conflicting types for 'pci_doe_disconnected'; have 'void(struct pci_dev *)'
     789 | static inline void pci_doe_disconnected(struct pci_dev *pdev) { }
         |                    ^~~~~~~~~~~~~~~~~~~~
>> drivers/pci/msi/../pci.h:789:20: error: static declaration of 'pci_doe_disconnected' follows non-static declaration
   drivers/pci/msi/../pci.h:361:9: note: previous implicit declaration of 'pci_doe_disconnected' with type 'void(struct pci_dev *)'
     361 |         pci_doe_disconnected(dev);
         |         ^~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors
--
   In file included from drivers/pci/pcie/aspm.c:22:
   drivers/pci/pcie/../pci.h: In function 'pci_dev_set_disconnected':
>> drivers/pci/pcie/../pci.h:361:9: error: implicit declaration of function 'pci_doe_disconnected'; did you mean 'pci_dev_set_disconnected'? [-Werror=implicit-function-declaration]
     361 |         pci_doe_disconnected(dev);
         |         ^~~~~~~~~~~~~~~~~~~~
         |         pci_dev_set_disconnected
   drivers/pci/pcie/../pci.h: At top level:
>> drivers/pci/pcie/../pci.h:789:20: warning: conflicting types for 'pci_doe_disconnected'; have 'void(struct pci_dev *)'
     789 | static inline void pci_doe_disconnected(struct pci_dev *pdev) { }
         |                    ^~~~~~~~~~~~~~~~~~~~
>> drivers/pci/pcie/../pci.h:789:20: error: static declaration of 'pci_doe_disconnected' follows non-static declaration
   drivers/pci/pcie/../pci.h:361:9: note: previous implicit declaration of 'pci_doe_disconnected' with type 'void(struct pci_dev *)'
     361 |         pci_doe_disconnected(dev);
         |         ^~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +361 drivers/pci/msi/../pci.h

   354	
   355	static inline int pci_dev_set_disconnected(struct pci_dev *dev, void *unused)
   356	{
   357		device_lock(&dev->dev);
   358		pci_dev_set_io_state(dev, pci_channel_io_perm_failure);
   359		device_unlock(&dev->dev);
   360	
 > 361		pci_doe_disconnected(dev);
   362	
   363		return 0;
   364	}
   365	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
