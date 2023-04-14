Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 747337C
	for <oe-kbuild-all@lists.linux.dev>; Fri, 14 Apr 2023 04:35:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681446927; x=1712982927;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=KVCTWQJI/SOUuYOZfuXBiMV4Y17G0auD7y04z/f3yyE=;
  b=jAhoYkVNJJ1lNbP99iXMyiau//pKOodDWfeS7eZ5t8EfMRREUHgjUqCA
   YwAhnBkSn6OCKOlDfaoPVx1m1wBzG3VgLN/gem8rZLNJFAOb1R9RVsAGv
   V+A1HP4BSute8eTIjYaj1XGR8TA8c242MEsn4MGsivKzTt8wfZUvk5zZ3
   78geo5kJ0YeLjeedeixv5FovZ+IMMxXU4fpANzYeEJo7gtlQI3HWAZxEA
   S6FQNrtOfwyA66X1374k+/mC7WnleQUqhMiLmeXQ0aZ6a4MidZWB/mX2t
   wSsJX9fsltu7MO53SWMZMpxlCHbWJZCmkhjXEPVR+RkFeIJcXtiseEvvS
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10679"; a="333145713"
X-IronPort-AV: E=Sophos;i="5.99,195,1677571200"; 
   d="scan'208";a="333145713"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Apr 2023 21:35:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10679"; a="689646608"
X-IronPort-AV: E=Sophos;i="5.99,195,1677571200"; 
   d="scan'208";a="689646608"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 13 Apr 2023 21:35:15 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pnB9W-000ZE9-1A;
	Fri, 14 Apr 2023 04:35:14 +0000
Date: Fri, 14 Apr 2023 12:34:24 +0800
From: kernel test robot <lkp@intel.com>
To: Rajnesh Kanwal <rkanwal@rivosinc.com>
Cc: oe-kbuild-all@lists.linux.dev, Atish Patra <Atish.Patra@wdc.com>,
	Atish Patra <atishp@rivosinc.com>
Subject: [atishp04:cove_integeration_v2 2/50] drivers/pci/ecam.c:83:44:
 warning: passing argument 1 of 'pci_remap_cfgspace' makes integer from
 pointer without a cast
Message-ID: <202304141258.RVatjrHo-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/atishp04/linux cove_integeration_v2
head:   94c0fb847a505a21d11c0de2e0acefc2e9965311
commit: 221c4ab39514a85f7ce6236849897bb4d00af571 [2/50] pci: Use ioremap_driver_hardened for ECAM spaces for authorized devices.
config: arm-allyesconfig (https://download.01.org/0day-ci/archive/20230414/202304141258.RVatjrHo-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/atishp04/linux/commit/221c4ab39514a85f7ce6236849897bb4d00af571
        git remote add atishp04 https://github.com/atishp04/linux
        git fetch --no-tags atishp04 cove_integeration_v2
        git checkout 221c4ab39514a85f7ce6236849897bb4d00af571
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash drivers/pci/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304141258.RVatjrHo-lkp@intel.com/

All warnings (new ones prefixed by >>):

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


vim +/pci_remap_cfgspace +83 drivers/pci/ecam.c

    20	
    21	/*
    22	 * Create a PCI config space window
    23	 *  - reserve mem region
    24	 *  - alloc struct pci_config_window with space for all mappings
    25	 *  - ioremap the config space
    26	 */
    27	struct pci_config_window *pci_ecam_create(struct device *dev,
    28			struct resource *cfgres, struct resource *busr,
    29			const struct pci_ecam_ops *ops)
    30	{
    31		unsigned int bus_shift = ops->bus_shift;
    32		struct pci_config_window *cfg;
    33		unsigned int bus_range, bus_range_max, bsz;
    34		struct resource *conflict;
    35		int err;
    36	
    37		if (busr->start > busr->end)
    38			return ERR_PTR(-EINVAL);
    39	
    40		cfg = kzalloc(sizeof(*cfg), GFP_KERNEL);
    41		if (!cfg)
    42			return ERR_PTR(-ENOMEM);
    43	
    44		/* ECAM-compliant platforms need not supply ops->bus_shift */
    45		if (!bus_shift)
    46			bus_shift = PCIE_ECAM_BUS_SHIFT;
    47	
    48		cfg->parent = dev;
    49		cfg->ops = ops;
    50		cfg->busr.start = busr->start;
    51		cfg->busr.end = busr->end;
    52		cfg->busr.flags = IORESOURCE_BUS;
    53		cfg->bus_shift = bus_shift;
    54		bus_range = resource_size(&cfg->busr);
    55		bus_range_max = resource_size(cfgres) >> bus_shift;
    56		if (bus_range > bus_range_max) {
    57			bus_range = bus_range_max;
    58			cfg->busr.end = busr->start + bus_range - 1;
    59			dev_warn(dev, "ECAM area %pR can only accommodate %pR (reduced from %pR desired)\n",
    60				 cfgres, &cfg->busr, busr);
    61		}
    62		bsz = 1 << bus_shift;
    63	
    64		cfg->res.start = cfgres->start;
    65		cfg->res.end = cfgres->end;
    66		cfg->res.flags = IORESOURCE_MEM | IORESOURCE_BUSY;
    67		cfg->res.name = "PCI ECAM";
    68	
    69		conflict = request_resource_conflict(&iomem_resource, &cfg->res);
    70		if (conflict) {
    71			err = -EBUSY;
    72			dev_err(dev, "can't claim ECAM area %pR: address conflict with %s %pR\n",
    73				&cfg->res, conflict->name, conflict);
    74			goto err_exit;
    75		}
    76	
    77		if (per_bus_mapping) {
    78			cfg->winp = kcalloc(bus_range, sizeof(*cfg->winp), GFP_KERNEL);
    79			if (!cfg->winp)
    80				goto err_exit_malloc;
    81		} else {
    82			cfg->win =
  > 83				pci_remap_cfgspace(dev, cfgres->start, bus_range * bsz);
    84			if (!cfg->win)
    85				goto err_exit_iomap;
    86		}
    87	
    88		if (ops->init) {
    89			err = ops->init(cfg);
    90			if (err)
    91				goto err_exit;
    92		}
    93		dev_info(dev, "ECAM at %pR for %pR\n", &cfg->res, &cfg->busr);
    94		return cfg;
    95	
    96	err_exit_iomap:
    97		dev_err(dev, "ECAM ioremap failed\n");
    98	err_exit_malloc:
    99		err = -ENOMEM;
   100	err_exit:
   101		pci_ecam_free(cfg);
   102		return ERR_PTR(err);
   103	}
   104	EXPORT_SYMBOL_GPL(pci_ecam_create);
   105	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
