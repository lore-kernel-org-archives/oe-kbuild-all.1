Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E12BEA94B
	for <oe-kbuild-all@lists.linux.dev>; Thu,  9 Feb 2023 22:22:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675981332; x=1707517332;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=4u3nTc5vbHVi8aw/wQxVXpF78/HmsNW3oJTLCa1YyLE=;
  b=LOiPgbvh29KrGMb1ljKFuJt8sh1F57w5/3Tr5uG5E+Hsfp9RvH0JTxUh
   9ii8LwUU8zObPPSIDcN4NBch0+QZJBDcA+qymJIe0r1ViRPBQ7UKZVd+9
   XXrtUnJunXntNMzWq2tpZotUhRpIaAT0+AJtNkIjk1jBoCguNQlXd1p58
   D4zuhum7zJ2rAUreAoNSndK0zMRkD5sHidZ81LDN8Dmk0GTALTOXGDdJU
   7AkRE5nu5dqcMFyiWoMpvBMIJZ6F9GBU9FZAvr5JuOQxTp3qT+JQm00JF
   J30GwR9mSSBlqedAOR9bDU/grmt6IkVgaoy/5ulrWFGhb8BRmof+xOmhp
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10616"; a="331562857"
X-IronPort-AV: E=Sophos;i="5.97,285,1669104000"; 
   d="scan'208";a="331562857"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Feb 2023 14:22:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10616"; a="736513018"
X-IronPort-AV: E=Sophos;i="5.97,285,1669104000"; 
   d="scan'208";a="736513018"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 09 Feb 2023 14:22:10 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pQFIw-0005Lm-04;
	Thu, 09 Feb 2023 22:22:10 +0000
Date: Fri, 10 Feb 2023 06:21:34 +0800
From: kernel test robot <lkp@intel.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: oe-kbuild-all@lists.linux.dev, devel@driverdev.osuosl.org
Subject: [driver-core:kobject-const-2 78/78]
 arch/arm/mm/dma-mapping.c:1713:47: warning: passing argument 1 of
 'arm_iommu_create_mapping' discards 'const' qualifier from pointer target
 type
Message-ID: <202302100601.wZtQDBrU-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/driver-core.git kobject-const-2
head:   0be8abebbd476395ee73f4a83d4988dc9958f83c
commit: 0be8abebbd476395ee73f4a83d4988dc9958f83c [78/78] driver core: mark struct device's bus_type as const.
config: arm-randconfig-r046-20230209 (https://download.01.org/0day-ci/archive/20230210/202302100601.wZtQDBrU-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/driver-core.git/commit/?id=0be8abebbd476395ee73f4a83d4988dc9958f83c
        git remote add driver-core https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/driver-core.git
        git fetch --no-tags driver-core kobject-const-2
        git checkout 0be8abebbd476395ee73f4a83d4988dc9958f83c
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash arch/arm/mm/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302100601.wZtQDBrU-lkp@intel.com/

All warnings (new ones prefixed by >>):

   arch/arm/mm/dma-mapping.c: In function 'arm_setup_iommu_dma_ops':
>> arch/arm/mm/dma-mapping.c:1713:47: warning: passing argument 1 of 'arm_iommu_create_mapping' discards 'const' qualifier from pointer target type [-Wdiscarded-qualifiers]
    1713 |         mapping = arm_iommu_create_mapping(dev->bus, dma_base, size);
         |                                            ~~~^~~~~
   arch/arm/mm/dma-mapping.c:1543:43: note: expected 'struct bus_type *' but argument is of type 'const struct bus_type *'
    1543 | arm_iommu_create_mapping(struct bus_type *bus, dma_addr_t base, u64 size)
         |                          ~~~~~~~~~~~~~~~~~^~~


vim +1713 arch/arm/mm/dma-mapping.c

6fe367580339a3a Hiroshi Doyu      2013-01-24  1707  
ae626eb97376148 Christoph Hellwig 2022-04-19  1708  static void arm_setup_iommu_dma_ops(struct device *dev, u64 dma_base, u64 size,
ae626eb97376148 Christoph Hellwig 2022-04-19  1709  				    const struct iommu_ops *iommu, bool coherent)
4bb25789ed28228 Will Deacon       2014-08-27  1710  {
4bb25789ed28228 Will Deacon       2014-08-27  1711  	struct dma_iommu_mapping *mapping;
4bb25789ed28228 Will Deacon       2014-08-27  1712  
4bb25789ed28228 Will Deacon       2014-08-27 @1713  	mapping = arm_iommu_create_mapping(dev->bus, dma_base, size);
4bb25789ed28228 Will Deacon       2014-08-27  1714  	if (IS_ERR(mapping)) {
4bb25789ed28228 Will Deacon       2014-08-27  1715  		pr_warn("Failed to create %llu-byte IOMMU mapping for device %s\n",
4bb25789ed28228 Will Deacon       2014-08-27  1716  				size, dev_name(dev));
ae626eb97376148 Christoph Hellwig 2022-04-19  1717  		return;
4bb25789ed28228 Will Deacon       2014-08-27  1718  	}
4bb25789ed28228 Will Deacon       2014-08-27  1719  
eab8d6530cc0074 Laurent Pinchart  2015-01-23  1720  	if (__arm_iommu_attach_device(dev, mapping)) {
4bb25789ed28228 Will Deacon       2014-08-27  1721  		pr_warn("Failed to attached device %s to IOMMU_mapping\n",
4bb25789ed28228 Will Deacon       2014-08-27  1722  				dev_name(dev));
4bb25789ed28228 Will Deacon       2014-08-27  1723  		arm_iommu_release_mapping(mapping);
ae626eb97376148 Christoph Hellwig 2022-04-19  1724  		return;
4bb25789ed28228 Will Deacon       2014-08-27  1725  	}
4bb25789ed28228 Will Deacon       2014-08-27  1726  
ae626eb97376148 Christoph Hellwig 2022-04-19  1727  	set_dma_ops(dev, &iommu_ops);
4bb25789ed28228 Will Deacon       2014-08-27  1728  }
4bb25789ed28228 Will Deacon       2014-08-27  1729  

:::::: The code at line 1713 was first introduced by commit
:::::: 4bb25789ed28228a52c030bf28edb2fcdb214be8 arm: dma-mapping: plumb our iommu mapping ops into arch_setup_dma_ops

:::::: TO: Will Deacon <will.deacon@arm.com>
:::::: CC: Will Deacon <will.deacon@arm.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
