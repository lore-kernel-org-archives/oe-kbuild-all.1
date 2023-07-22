Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22C457C
	for <oe-kbuild-all@lists.linux.dev>; Sat, 22 Jul 2023 00:07:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689984462; x=1721520462;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=GudumOnvq7Xw69K6ZyEoGPbI9jzn6Vhjhto7L5uWL0o=;
  b=dWBvm/vXV9A6DSB7CmcpE18TWSHTciqGRAKJIvL82JZ4hoV44s1Ng5nZ
   7ID8Ey38wA2jYVA14FZwUpSm5jGzuc11jj7a1nccHQh3T2p1F5ORkQHjf
   iDMEWOYEbCv8Z0kwQ/FI5XxmlT4GdRKnCw320riMoDpUhINla+zdZhkVp
   8CZrhKQF8hr7L/48kw29vkgn89j4PXyoIOxsZV89vDHtME0oxSr88eL3d
   zuVdmsI9Qv6mM7GUZdF1MjqPfpza6yc630n+/rVLr0eMnGn7K6GJ899ij
   4lHWTU9nsWiduVem1v6aeeRgcvKwhRTiSL8aqQH1Yw4g9YqURcJ1ErzU9
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10778"; a="352032996"
X-IronPort-AV: E=Sophos;i="6.01,223,1684825200"; 
   d="scan'208";a="352032996"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jul 2023 17:07:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10778"; a="728263093"
X-IronPort-AV: E=Sophos;i="6.01,223,1684825200"; 
   d="scan'208";a="728263093"
Received: from lkp-server02.sh.intel.com (HELO 36946fcf73d7) ([10.239.97.151])
  by fmsmga007.fm.intel.com with ESMTP; 21 Jul 2023 17:07:40 -0700
Received: from kbuild by 36946fcf73d7 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qN09Y-0007mj-2b;
	Sat, 22 Jul 2023 00:07:30 +0000
Date: Sat, 22 Jul 2023 08:07:06 +0800
From: kernel test robot <lkp@intel.com>
To: Xiaoguang Xing <xiaoguang.xing@sophgo.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [csky-linux:sg2042-master-qspinlock-64ilp32_v3 8/67]
 drivers/pci/controller/cadence/pcie-cadence-sophgo.c:164:5: warning: no
 previous prototype for 'cdns_pcie_config_read'
Message-ID: <202307220817.FJcDRovx-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/c-sky/csky-linux sg2042-master-qspinlock-64ilp32_v3
head:   7f9f76d36814ed6fcbca4c27a5d2ec3724c46add
commit: 7b0ad6270e48635cd221c2a13a361542f3dcb947 [8/67] driver: pcie: Add sophgo sg2042 soc support
config: sparc-allyesconfig (https://download.01.org/0day-ci/archive/20230722/202307220817.FJcDRovx-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230722/202307220817.FJcDRovx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307220817.FJcDRovx-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/pci/controller/cadence/pcie-cadence-sophgo.c:164:5: warning: no previous prototype for 'cdns_pcie_config_read' [-Wmissing-prototypes]
     164 | int cdns_pcie_config_read(struct pci_bus *bus, unsigned int devfn,
         |     ^~~~~~~~~~~~~~~~~~~~~
>> drivers/pci/controller/cadence/pcie-cadence-sophgo.c:200:5: warning: no previous prototype for 'cdns_pcie_config_write' [-Wmissing-prototypes]
     200 | int cdns_pcie_config_write(struct pci_bus *bus, unsigned int devfn,
         |     ^~~~~~~~~~~~~~~~~~~~~~
>> drivers/pci/controller/cadence/pcie-cadence-sophgo.c:473:13: warning: no previous prototype for 'cdns_handle_msi_irq' [-Wmissing-prototypes]
     473 | irqreturn_t cdns_handle_msi_irq(struct cdns_mango_pcie_rc *rc)
         |             ^~~~~~~~~~~~~~~~~~~
>> drivers/pci/controller/cadence/pcie-cadence-sophgo.c:686:5: warning: no previous prototype for 'cdns_pcie_allocate_domains' [-Wmissing-prototypes]
     686 | int cdns_pcie_allocate_domains(struct cdns_mango_pcie_rc *rc)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/pci/controller/cadence/pcie-cadence-sophgo.c:711:6: warning: no previous prototype for 'cdns_pcie_free_msi' [-Wmissing-prototypes]
     711 | void cdns_pcie_free_msi(struct cdns_mango_pcie_rc *rc)
         |      ^~~~~~~~~~~~~~~~~~


vim +/cdns_pcie_config_read +164 drivers/pci/controller/cadence/pcie-cadence-sophgo.c

   163	
 > 164	int cdns_pcie_config_read(struct pci_bus *bus, unsigned int devfn,
   165				    int where, int size, u32 *val)
   166	{
   167		unsigned long addr;
   168		unsigned int value, offset;
   169		void __iomem *aligned_addr;
   170	
   171		if ((bus->number != 0) && (bus->number != 0x40) &&
   172		    (bus->number != 0x80) && (bus->number != 0xc0))
   173			return pci_generic_config_read(bus, devfn, where, size, val);
   174	
   175		addr = (unsigned long)bus->ops->map_bus(bus, devfn, where);
   176		if (!addr) {
   177			*val = ~0;
   178			return PCIBIOS_DEVICE_NOT_FOUND;
   179		}
   180	
   181		if (size == 1) {
   182			offset = addr & 0x3;
   183			aligned_addr = (void __iomem *)(addr & ~0x3UL);
   184			value = readl(aligned_addr);
   185			*val = (value >> (8 * offset)) & 0xff;
   186		} else if (size == 2) {
   187			WARN_ON((addr & 0x1) != 0); // address should be aligned to 2 bytes
   188			offset = addr & 0x3;
   189			aligned_addr = (void __iomem *)(addr & ~0x3UL);
   190			value = readl(aligned_addr);
   191			*val = (value >> (8 * offset)) & 0xffff;
   192		} else {
   193			WARN_ON((addr & 0x3) != 0); // address should be aligned to 4 bytes
   194			*val = readl((void __iomem *)(addr));
   195		}
   196	
   197		return PCIBIOS_SUCCESSFUL;
   198	}
   199	
 > 200	int cdns_pcie_config_write(struct pci_bus *bus, unsigned int devfn,
   201				     int where, int size, u32 val)
   202	{
   203		unsigned long addr;
   204		unsigned int value, offset;
   205		void __iomem *aligned_addr;
   206	
   207		if ((bus->number != 0) && (bus->number != 0x40) &&
   208		    (bus->number != 0x80) && (bus->number != 0xc0))
   209			return pci_generic_config_write(bus, devfn, where, size, val);
   210	
   211		addr = (unsigned long)bus->ops->map_bus(bus, devfn, where);
   212		if (!addr)
   213			return PCIBIOS_DEVICE_NOT_FOUND;
   214	
   215		if (size == 1) {
   216			offset = addr & 0x3;
   217			aligned_addr = (void __iomem *)(addr & ~0x3UL);
   218			value = readl(aligned_addr);
   219			value &= ~(0xFF << (8 * offset));
   220			value |= ((val << (8 * offset)) & (0xFF << (8 * offset)));
   221			writel(value, aligned_addr);
   222		} else if (size == 2) {
   223			WARN_ON((addr & 0x1) != 0);
   224			offset = addr & 0x3;
   225			aligned_addr = (void __iomem *)(addr & ~0x3UL);
   226			value = readl(aligned_addr);
   227			value &= ~(0xFFFF << (8 * offset));
   228			value |= ((val << (8 * offset)) & (0xFFFF << (8 * offset)));
   229			writel(value, aligned_addr);
   230		} else {
   231			WARN_ON((addr & 0x3) != 0);
   232			writel(val, (void __iomem *)(addr));
   233		}
   234	
   235		return PCIBIOS_SUCCESSFUL;
   236	}
   237	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
