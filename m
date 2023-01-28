Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBDA8192
	for <oe-kbuild-all@lists.linux.dev>; Sat, 28 Jan 2023 20:30:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674937853; x=1706473853;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+dkx2OnG1sNxv5xiIHYtI4YmAgvmJ7jTUTbRnhIs8UE=;
  b=I9jyZT9pVFtCp7iQtYHmXtrmZB3yoazUYhJlFkyDnibDjUlsDfVwIx3B
   fTs05UiJ15vM3Yep5LSMivot9XhKWfVTX/XcQtAfh5fYJR0l1qCkvPoVx
   zjMmcOrpgG+KGpiBEPqEj0NHQQqf1LDtZIRujVz5yX+DQOw2p466rO8wA
   Pb7WzD50Y99zaKhxxQh2tldWomKn8Tiwa6j5HaB9SFS7hTsxSI+kjzJe6
   aM/SucwQ676bZBIjDhIv8fo+I8Gxmxm9o5mpYFZAerret34dTv1XyBc5O
   IQs7wBlMBtw9BzqTZq3M17/bxYO1uzk7o4yI2CyODT8cqrCWxbnYE/tUQ
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10604"; a="325025752"
X-IronPort-AV: E=Sophos;i="5.97,254,1669104000"; 
   d="scan'208";a="325025752"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jan 2023 12:30:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10604"; a="837533304"
X-IronPort-AV: E=Sophos;i="5.97,254,1669104000"; 
   d="scan'208";a="837533304"
Received: from lkp-server01.sh.intel.com (HELO ffa7f14d1d0f) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 28 Jan 2023 12:30:51 -0800
Received: from kbuild by ffa7f14d1d0f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pLrqc-00015A-2V;
	Sat, 28 Jan 2023 20:30:50 +0000
Date: Sun, 29 Jan 2023 04:30:31 +0800
From: kernel test robot <lkp@intel.com>
To: Rajnesh Kanwal <rkanwal@rivosinc.com>
Cc: oe-kbuild-all@lists.linux.dev, Atish Patra <Atish.Patra@wdc.com>,
	Atish Patra <atishp@rivosinc.com>
Subject: [atishp04:dev/atishp/kvm_aptee_guest_rfc 97/109]
 drivers/pci/pci.c:4310:35: warning: passing argument 1 of
 'pci_remap_cfgspace' makes integer from pointer without a cast
Message-ID: <202301290447.iZ6JVhxl-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/atishp04/linux dev/atishp/kvm_aptee_guest_rfc
head:   adf357593cff6780e32553a751d6cb7bb88dd6a6
commit: 0a94986ec599af4753ae09044918266401a266c3 [97/109] pci: iomap: Mark ioremap shared when the device is authorized.
config: arm-defconfig (https://download.01.org/0day-ci/archive/20230129/202301290447.iZ6JVhxl-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/atishp04/linux/commit/0a94986ec599af4753ae09044918266401a266c3
        git remote add atishp04 https://github.com/atishp04/linux
        git fetch --no-tags atishp04 dev/atishp/kvm_aptee_guest_rfc
        git checkout 0a94986ec599af4753ae09044918266401a266c3
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash drivers/pci/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   drivers/pci/pci.c: In function 'devm_pci_remap_cfgspace':
>> drivers/pci/pci.c:4310:35: warning: passing argument 1 of 'pci_remap_cfgspace' makes integer from pointer without a cast [-Wint-conversion]
    4310 |         addr = pci_remap_cfgspace(dev, offset, size);
         |                                   ^~~
         |                                   |
         |                                   struct device *
   In file included from include/linux/io.h:14,
                    from include/linux/irq.h:20,
                    from include/linux/msi.h:27,
                    from drivers/pci/pci.c:16:
   arch/arm/include/asm/io.h:195:50: note: expected 'resource_size_t' {aka 'unsigned int'} but argument is of type 'struct device *'
     195 | void __iomem *pci_remap_cfgspace(resource_size_t res_cookie, size_t size);
         |                                  ~~~~~~~~~~~~~~~~^~~~~~~~~~
   arch/arm/include/asm/io.h:194:28: error: too many arguments to function 'pci_remap_cfgspace'
     194 | #define pci_remap_cfgspace pci_remap_cfgspace
         |                            ^~~~~~~~~~~~~~~~~~
   drivers/pci/pci.c:4310:16: note: in expansion of macro 'pci_remap_cfgspace'
    4310 |         addr = pci_remap_cfgspace(dev, offset, size);
         |                ^~~~~~~~~~~~~~~~~~
   arch/arm/include/asm/io.h:194:28: note: declared here
     194 | #define pci_remap_cfgspace pci_remap_cfgspace
         |                            ^~~~~~~~~~~~~~~~~~
   arch/arm/include/asm/io.h:195:15: note: in expansion of macro 'pci_remap_cfgspace'
     195 | void __iomem *pci_remap_cfgspace(resource_size_t res_cookie, size_t size);
         |               ^~~~~~~~~~~~~~~~~~
--
   drivers/pci/ecam.c: In function 'pci_ecam_create':
>> drivers/pci/ecam.c:83:44: warning: passing argument 1 of 'pci_remap_cfgspace' makes integer from pointer without a cast [-Wint-conversion]
      83 |                         pci_remap_cfgspace(dev, cfgres->start, bus_range * bsz);
         |                                            ^~~
         |                                            |
         |                                            struct device *
   In file included from include/linux/io.h:14,
                    from drivers/pci/ecam.c:7:
   arch/arm/include/asm/io.h:195:50: note: expected 'resource_size_t' {aka 'unsigned int'} but argument is of type 'struct device *'
     195 | void __iomem *pci_remap_cfgspace(resource_size_t res_cookie, size_t size);
         |                                  ~~~~~~~~~~~~~~~~^~~~~~~~~~
   arch/arm/include/asm/io.h:194:28: error: too many arguments to function 'pci_remap_cfgspace'
     194 | #define pci_remap_cfgspace pci_remap_cfgspace
         |                            ^~~~~~~~~~~~~~~~~~
   drivers/pci/ecam.c:83:25: note: in expansion of macro 'pci_remap_cfgspace'
      83 |                         pci_remap_cfgspace(dev, cfgres->start, bus_range * bsz);
         |                         ^~~~~~~~~~~~~~~~~~
   arch/arm/include/asm/io.h:194:28: note: declared here
     194 | #define pci_remap_cfgspace pci_remap_cfgspace
         |                            ^~~~~~~~~~~~~~~~~~
   arch/arm/include/asm/io.h:195:15: note: in expansion of macro 'pci_remap_cfgspace'
     195 | void __iomem *pci_remap_cfgspace(resource_size_t res_cookie, size_t size);
         |               ^~~~~~~~~~~~~~~~~~
   drivers/pci/ecam.c: In function 'pci_ecam_add_bus':
   drivers/pci/ecam.c:143:46: warning: passing argument 1 of 'pci_remap_cfgspace' makes integer from pointer without a cast [-Wint-conversion]
     143 |         cfg->winp[busn] = pci_remap_cfgspace(&bus->dev, start, bsz);
         |                                              ^~~~~~~~~
         |                                              |
         |                                              struct device *
   arch/arm/include/asm/io.h:195:50: note: expected 'resource_size_t' {aka 'unsigned int'} but argument is of type 'struct device *'
     195 | void __iomem *pci_remap_cfgspace(resource_size_t res_cookie, size_t size);
         |                                  ~~~~~~~~~~~~~~~~^~~~~~~~~~
   arch/arm/include/asm/io.h:194:28: error: too many arguments to function 'pci_remap_cfgspace'
     194 | #define pci_remap_cfgspace pci_remap_cfgspace
         |                            ^~~~~~~~~~~~~~~~~~
   drivers/pci/ecam.c:143:27: note: in expansion of macro 'pci_remap_cfgspace'
     143 |         cfg->winp[busn] = pci_remap_cfgspace(&bus->dev, start, bsz);
         |                           ^~~~~~~~~~~~~~~~~~
   arch/arm/include/asm/io.h:194:28: note: declared here
     194 | #define pci_remap_cfgspace pci_remap_cfgspace
         |                            ^~~~~~~~~~~~~~~~~~
   arch/arm/include/asm/io.h:195:15: note: in expansion of macro 'pci_remap_cfgspace'
     195 | void __iomem *pci_remap_cfgspace(resource_size_t res_cookie, size_t size);
         |               ^~~~~~~~~~~~~~~~~~


vim +/pci_remap_cfgspace +4310 drivers/pci/pci.c

  4290	
  4291	/**
  4292	 * devm_pci_remap_cfgspace - Managed pci_remap_cfgspace()
  4293	 * @dev: Generic device to remap IO address for
  4294	 * @offset: Resource address to map
  4295	 * @size: Size of map
  4296	 *
  4297	 * Managed pci_remap_cfgspace().  Map is automatically unmapped on driver
  4298	 * detach.
  4299	 */
  4300	void __iomem *devm_pci_remap_cfgspace(struct device *dev,
  4301					      resource_size_t offset,
  4302					      resource_size_t size)
  4303	{
  4304		void __iomem **ptr, *addr;
  4305	
  4306		ptr = devres_alloc(devm_ioremap_release, sizeof(*ptr), GFP_KERNEL);
  4307		if (!ptr)
  4308			return NULL;
  4309	
> 4310		addr = pci_remap_cfgspace(dev, offset, size);
  4311		if (addr) {
  4312			*ptr = addr;
  4313			devres_add(dev, ptr);
  4314		} else
  4315			devres_free(ptr);
  4316	
  4317		return addr;
  4318	}
  4319	EXPORT_SYMBOL(devm_pci_remap_cfgspace);
  4320	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
