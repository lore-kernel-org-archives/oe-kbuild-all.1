Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E15FBA3F
	for <oe-kbuild-all@lists.linux.dev>; Fri,  3 Feb 2023 21:40:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675460423; x=1706996423;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+IdrVE8yGgPfkWbFmdeatEZlYvPv7+wLadAkcBt+4gQ=;
  b=DPXn8DptNfZyd0SlfzHX+Y5v4IIkL15FTvEIIU+ipPVC8sPKGdrtkyFO
   RUWCwLxH6RKIuBFAUYzdiah2EJ5Cd34oEaoKeVfkJbn2wwhmA2wzu2XUI
   QxdbzV3m4us9jJYzvZM+03MbrNw302POFqfePcrT5b10IaP9Zw3k19tQo
   vDxgtfQNIoVT8l6Q4e6mP/LRPR7HWfocsEoAHwRgJrHdDQPg+hcw0KGgk
   hkGKgy4FF7mwS1XRYVMRF5fWXA91DvJ7AZTBxP9WF4LotyoozuDFRFnu0
   q4Dn+qORB/KtmYXtT3imRIlR6JTUJoEjpLxOS1RjJDjrT14yZydTswOOx
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10610"; a="309197609"
X-IronPort-AV: E=Sophos;i="5.97,271,1669104000"; 
   d="scan'208";a="309197609"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2023 13:40:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10610"; a="734500909"
X-IronPort-AV: E=Sophos;i="5.97,271,1669104000"; 
   d="scan'208";a="734500909"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 03 Feb 2023 13:40:17 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pO3n7-0000m5-0H;
	Fri, 03 Feb 2023 21:40:17 +0000
Date: Sat, 4 Feb 2023 05:39:47 +0800
From: kernel test robot <lkp@intel.com>
To: Lukas Wunner <lukas@wunner.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [l1k:doe 11/23] drivers/pci/pci.h:789:20: warning: conflicting types
 for 'pci_doe_disconnected'; have 'void(struct pci_dev *)'
Message-ID: <202302040558.b5kMgC86-lkp@intel.com>
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
config: arc-defconfig (https://download.01.org/0day-ci/archive/20230204/202302040558.b5kMgC86-lkp@intel.com/config)
compiler: arc-elf-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/l1k/linux/commit/cad83afa09817cb77ae9b53ad992c8894b6ecdb5
        git remote add l1k https://github.com/l1k/linux
        git fetch --no-tags l1k doe
        git checkout cad83afa09817cb77ae9b53ad992c8894b6ecdb5
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arc SHELL=/bin/bash drivers/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   In file included from drivers/pci/of.c:16:
   drivers/pci/pci.h: In function 'pci_dev_set_disconnected':
   drivers/pci/pci.h:361:9: error: implicit declaration of function 'pci_doe_disconnected'; did you mean 'pci_dev_set_disconnected'? [-Werror=implicit-function-declaration]
     361 |         pci_doe_disconnected(dev);
         |         ^~~~~~~~~~~~~~~~~~~~
         |         pci_dev_set_disconnected
   drivers/pci/pci.h: At top level:
>> drivers/pci/pci.h:789:20: warning: conflicting types for 'pci_doe_disconnected'; have 'void(struct pci_dev *)'
     789 | static inline void pci_doe_disconnected(struct pci_dev *pdev) { }
         |                    ^~~~~~~~~~~~~~~~~~~~
   drivers/pci/pci.h:789:20: error: static declaration of 'pci_doe_disconnected' follows non-static declaration
   drivers/pci/pci.h:361:9: note: previous implicit declaration of 'pci_doe_disconnected' with type 'void(struct pci_dev *)'
     361 |         pci_doe_disconnected(dev);
         |         ^~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +789 drivers/pci/pci.h

   781	
   782	#ifdef CONFIG_PCI_DOE
   783	void pci_doe_init(struct pci_dev *pdev);
   784	void pci_doe_destroy(struct pci_dev *pdev);
   785	void pci_doe_disconnected(struct pci_dev *pdev);
   786	#else
   787	static inline void pci_doe_init(struct pci_dev *pdev) { }
   788	static inline void pci_doe_destroy(struct pci_dev *pdev) { }
 > 789	static inline void pci_doe_disconnected(struct pci_dev *pdev) { }
   790	#endif
   791	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
