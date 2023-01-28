Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFAB08BEC
	for <oe-kbuild-all@lists.linux.dev>; Sat, 28 Jan 2023 22:03:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674943437; x=1706479437;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=F4nvwOJgMLk6YHQNYJVp6cGF0bDeDPIQG0ZJYQPuFvM=;
  b=EdqnsWQF0+ln2fs2VQ4q0J+QsUMcOyP/5+4vkYs1tcWQ9lMIGnYIkYEb
   oHnmHFSZQjGA8l3JdjJnyGGO5wQIz04CfPh6h9pm+3w7ijWh586n1/E1i
   Bvrst4IRhkil21h3yO75bTFznpfy+IoeZYSQAj3cXO5Ua3pHsGdVLHTiX
   QfIedsnuf/01F9foJRoi2txL3bvAlrzwyqRTQys3D0y3kMT9lSb6iVfcz
   P8gogt/hA+0bOnqf5rSEjTDdIjhH66EvUgiDFgmSma6Je2EsrrgJ1bhPP
   0h4yLDpKpI1qOy5J9mnDYPKD9GLZAWyFYwAYceEppXTBm504TNBApkF6V
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10604"; a="354652399"
X-IronPort-AV: E=Sophos;i="5.97,254,1669104000"; 
   d="scan'208";a="354652399"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jan 2023 14:03:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10604"; a="665638624"
X-IronPort-AV: E=Sophos;i="5.97,254,1669104000"; 
   d="scan'208";a="665638624"
Received: from lkp-server01.sh.intel.com (HELO ffa7f14d1d0f) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 28 Jan 2023 14:03:55 -0800
Received: from kbuild by ffa7f14d1d0f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pLtIg-000196-15;
	Sat, 28 Jan 2023 22:03:54 +0000
Date: Sun, 29 Jan 2023 06:03:33 +0800
From: kernel test robot <lkp@intel.com>
To: Rajnesh Kanwal <rkanwal@rivosinc.com>
Cc: oe-kbuild-all@lists.linux.dev, Atish Patra <Atish.Patra@wdc.com>,
	Atish Patra <atishp@rivosinc.com>
Subject: [atishp04:dev/atishp/kvm_aptee_guest_rfc 97/109]
 arch/arm/include/asm/io.h:194:28: error: too many arguments to function
 'pci_remap_cfgspace'
Message-ID: <202301290557.t4jlEUrA-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

tree:   https://github.com/atishp04/linux dev/atishp/kvm_aptee_guest_rfc
head:   adf357593cff6780e32553a751d6cb7bb88dd6a6
commit: 0a94986ec599af4753ae09044918266401a266c3 [97/109] pci: iomap: Mark ioremap shared when the device is authorized.
config: arm-defconfig (https://download.01.org/0day-ci/archive/20230129/202301290557.t4jlEUrA-lkp@intel.com/config)
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
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash drivers/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   drivers/pci/pci.c: In function 'devm_pci_remap_cfgspace':
   drivers/pci/pci.c:4310:35: warning: passing argument 1 of 'pci_remap_cfgspace' makes integer from pointer without a cast [-Wint-conversion]
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
>> arch/arm/include/asm/io.h:194:28: error: too many arguments to function 'pci_remap_cfgspace'
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
   drivers/pci/ecam.c:83:44: warning: passing argument 1 of 'pci_remap_cfgspace' makes integer from pointer without a cast [-Wint-conversion]
      83 |                         pci_remap_cfgspace(dev, cfgres->start, bus_range * bsz);
         |                                            ^~~
         |                                            |
         |                                            struct device *
   In file included from include/linux/io.h:14,
                    from drivers/pci/ecam.c:7:
   arch/arm/include/asm/io.h:195:50: note: expected 'resource_size_t' {aka 'unsigned int'} but argument is of type 'struct device *'
     195 | void __iomem *pci_remap_cfgspace(resource_size_t res_cookie, size_t size);
         |                                  ~~~~~~~~~~~~~~~~^~~~~~~~~~
>> arch/arm/include/asm/io.h:194:28: error: too many arguments to function 'pci_remap_cfgspace'
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
>> arch/arm/include/asm/io.h:194:28: error: too many arguments to function 'pci_remap_cfgspace'
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


vim +/pci_remap_cfgspace +194 arch/arm/include/asm/io.h

bc02973a06a6c7 arch/arm/include/asm/io.h Pali Rohár        2021-11-24  185  
b9cdbe6e39351f arch/arm/include/asm/io.h Lorenzo Pieralisi 2017-04-19  186  /*
b9cdbe6e39351f arch/arm/include/asm/io.h Lorenzo Pieralisi 2017-04-19  187   * PCI configuration space mapping function.
b9cdbe6e39351f arch/arm/include/asm/io.h Lorenzo Pieralisi 2017-04-19  188   *
b9cdbe6e39351f arch/arm/include/asm/io.h Lorenzo Pieralisi 2017-04-19  189   * The PCI specification does not allow configuration write
b9cdbe6e39351f arch/arm/include/asm/io.h Lorenzo Pieralisi 2017-04-19  190   * transactions to be posted. Add an arch specific
b9cdbe6e39351f arch/arm/include/asm/io.h Lorenzo Pieralisi 2017-04-19  191   * pci_remap_cfgspace() definition that is implemented
b9cdbe6e39351f arch/arm/include/asm/io.h Lorenzo Pieralisi 2017-04-19  192   * through strongly ordered memory mappings.
b9cdbe6e39351f arch/arm/include/asm/io.h Lorenzo Pieralisi 2017-04-19  193   */
b9cdbe6e39351f arch/arm/include/asm/io.h Lorenzo Pieralisi 2017-04-19 @194  #define pci_remap_cfgspace pci_remap_cfgspace
b9cdbe6e39351f arch/arm/include/asm/io.h Lorenzo Pieralisi 2017-04-19 @195  void __iomem *pci_remap_cfgspace(resource_size_t res_cookie, size_t size);
^1da177e4c3f41 include/asm-arm/io.h      Linus Torvalds    2005-04-16  196  /*
^1da177e4c3f41 include/asm-arm/io.h      Linus Torvalds    2005-04-16  197   * Now, pick up the machine-defined IO definitions
^1da177e4c3f41 include/asm-arm/io.h      Linus Torvalds    2005-04-16  198   */
c334bc150524f8 arch/arm/include/asm/io.h Rob Herring       2012-03-04  199  #ifdef CONFIG_NEED_MACH_IO_H
a09e64fbc0094e arch/arm/include/asm/io.h Russell King      2008-08-05  200  #include <mach/io.h>
c334bc150524f8 arch/arm/include/asm/io.h Rob Herring       2012-03-04  201  #else
645b302673bb74 arch/arm/include/asm/io.h Arnd Bergmann     2022-04-24  202  #if IS_ENABLED(CONFIG_PCMCIA) || defined(CONFIG_PCI)
645b302673bb74 arch/arm/include/asm/io.h Arnd Bergmann     2022-04-24  203  #define IO_SPACE_LIMIT	((resource_size_t)0xfffff)
04e1c83806e30a arch/arm/include/asm/io.h Russell King      2011-07-06  204  #else
04e1c83806e30a arch/arm/include/asm/io.h Russell King      2011-07-06  205  #define IO_SPACE_LIMIT ((resource_size_t)0)
04e1c83806e30a arch/arm/include/asm/io.h Russell King      2011-07-06  206  #endif
645b302673bb74 arch/arm/include/asm/io.h Arnd Bergmann     2022-04-24  207  #define __io(a)		__typesafe_io(PCI_IO_VIRT_BASE + ((a) & IO_SPACE_LIMIT))
04e1c83806e30a arch/arm/include/asm/io.h Russell King      2011-07-06  208  #endif
04e1c83806e30a arch/arm/include/asm/io.h Russell King      2011-07-06  209  

:::::: The code at line 194 was first introduced by commit
:::::: b9cdbe6e39351f0ba6cc0c5bc218443f0898e123 ARM: Implement pci_remap_cfgspace() interface

:::::: TO: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
:::::: CC: Bjorn Helgaas <bhelgaas@google.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
