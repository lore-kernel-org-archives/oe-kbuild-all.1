Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88E8729B0
	for <oe-kbuild-all@lists.linux.dev>; Sun, 19 Feb 2023 17:05:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676826350; x=1708362350;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=tv70kHaebwWqUYMjGwORavb2Rn5ayuSSdE/gnaKbPH0=;
  b=dhEjWxVrm04Pn3rwKZXE5rKeKnbZkRuxgZs92/urj3bTJ7ltYb8Mh7jp
   oyIOMQE3zwt1yaSa000cgtEgXdPxA63nsTg+oW1GcHCoIVfY1lkKR+iHQ
   FM3GB2/5FJ5t3vhyUOVXK1PU3YX/OMhaEhTTsMsEwdakaEII+94PCAT8Q
   RvEMdhQ1TYwqjgP8aJrhDeYnpUk2Ep3gSBclrSQmAH8FULZ3SAY4RkT7h
   aTK1Pyy5ZoaRqq5Zx7hd9dfm5tYLD03/TgS1vd8tlFKskQaWNDJGEFs+3
   xF5KYZRzx7ETWDrRV8DB8QRa7w+yC2a9BhU1vgdScwqVilqQzQUmeQws1
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10626"; a="311895505"
X-IronPort-AV: E=Sophos;i="5.97,310,1669104000"; 
   d="scan'208";a="311895505"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Feb 2023 09:05:49 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10626"; a="1000038985"
X-IronPort-AV: E=Sophos;i="5.97,310,1669104000"; 
   d="scan'208";a="1000038985"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 19 Feb 2023 09:05:41 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pTn88-000DNx-0W;
	Sun, 19 Feb 2023 17:05:40 +0000
Date: Mon, 20 Feb 2023 01:04:49 +0800
From: kernel test robot <lkp@intel.com>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frank-w-bpi-r2-4.14:6.2-rc 53/53]
 drivers/pci/controller/pcie-mediatek-gen3.c:360:29: error: 'port' undeclared
Message-ID: <202302200050.1WZ9Lxlg-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/frank-w/BPI-R2-4.14 6.2-rc
head:   08286f12df4d7c9eff138a9a70925115018a02d5
commit: 08286f12df4d7c9eff138a9a70925115018a02d5 [53/53] PCI: mediatek-gen3: handle PERST after reset
config: ia64-randconfig-r016-20230219 (https://download.01.org/0day-ci/archive/20230220/202302200050.1WZ9Lxlg-lkp@intel.com/config)
compiler: ia64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/frank-w/BPI-R2-4.14/commit/08286f12df4d7c9eff138a9a70925115018a02d5
        git remote add frank-w-bpi-r2-4.14 https://github.com/frank-w/BPI-R2-4.14
        git fetch --no-tags frank-w-bpi-r2-4.14 6.2-rc
        git checkout 08286f12df4d7c9eff138a9a70925115018a02d5
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=ia64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=ia64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302200050.1WZ9Lxlg-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/pci/controller/pcie-mediatek-gen3.c: In function 'mtk_pcie_startup_port':
>> drivers/pci/controller/pcie-mediatek-gen3.c:360:29: error: 'port' undeclared (first use in this function)
     360 |         writel_relaxed(val, port->base + PCIE_RST_CTRL_REG);
         |                             ^~~~
   drivers/pci/controller/pcie-mediatek-gen3.c:360:29: note: each undeclared identifier is reported only once for each function it appears in


vim +/port +360 drivers/pci/controller/pcie-mediatek-gen3.c

   309	
   310	static int mtk_pcie_startup_port(struct mtk_gen3_pcie *pcie)
   311	{
   312		struct resource_entry *entry;
   313		struct pci_host_bridge *host = pci_host_bridge_from_priv(pcie);
   314		unsigned int table_index = 0;
   315		int err;
   316		u32 val;
   317	
   318		/* Set as RC mode */
   319		val = readl_relaxed(pcie->base + PCIE_SETTING_REG);
   320		val |= PCIE_RC_MODE;
   321		writel_relaxed(val, pcie->base + PCIE_SETTING_REG);
   322	
   323		/* Set class code */
   324		val = readl_relaxed(pcie->base + PCIE_PCI_IDS_1);
   325		val &= ~GENMASK(31, 8);
   326		val |= PCI_CLASS(PCI_CLASS_BRIDGE_PCI_NORMAL);
   327		writel_relaxed(val, pcie->base + PCIE_PCI_IDS_1);
   328	
   329		/* Mask all INTx interrupts */
   330		val = readl_relaxed(pcie->base + PCIE_INT_ENABLE_REG);
   331		val &= ~PCIE_INTX_ENABLE;
   332		writel_relaxed(val, pcie->base + PCIE_INT_ENABLE_REG);
   333	
   334		/* Disable DVFSRC voltage request */
   335		val = readl_relaxed(pcie->base + PCIE_MISC_CTRL_REG);
   336		val |= PCIE_DISABLE_DVFSRC_VLT_REQ;
   337		writel_relaxed(val, pcie->base + PCIE_MISC_CTRL_REG);
   338	
   339		/* Assert all reset signals */
   340		val = readl_relaxed(pcie->base + PCIE_RST_CTRL_REG);
   341		val |= PCIE_MAC_RSTB | PCIE_PHY_RSTB | PCIE_BRG_RSTB | PCIE_PE_RSTB;
   342		writel_relaxed(val, pcie->base + PCIE_RST_CTRL_REG);
   343	
   344		/*
   345		 * Described in PCIe CEM specification sections 2.2 (PERST# Signal)
   346		 * and 2.2.1 (Initial Power-Up (G3 to S0)).
   347		 * The deassertion of PERST# should be delayed 100ms (TPVPERL)
   348		 * for the power and clock to become stable.
   349		 */
   350		msleep(100);
   351	
   352		/* De-assert reset signals */
   353		val &= ~(PCIE_MAC_RSTB | PCIE_PHY_RSTB | PCIE_BRG_RSTB);
   354		writel_relaxed(val, pcie->base + PCIE_RST_CTRL_REG);
   355	
   356		msleep(100);
   357	
   358		/* De-assert PERST# signals */
   359		val &= ~(PCIE_PE_RSTB);
 > 360		writel_relaxed(val, port->base + PCIE_RST_CTRL_REG);
   361	
   362		/* Check if the link is up or not */
   363		err = readl_poll_timeout(pcie->base + PCIE_LINK_STATUS_REG, val,
   364					 !!(val & PCIE_PORT_LINKUP), 20,
   365					 PCI_PM_D3COLD_WAIT * USEC_PER_MSEC);
   366		if (err) {
   367			const char *ltssm_state;
   368			int ltssm_index;
   369	
   370			val = readl_relaxed(pcie->base + PCIE_LTSSM_STATUS_REG);
   371			ltssm_index = PCIE_LTSSM_STATE(val);
   372			ltssm_state = ltssm_index >= ARRAY_SIZE(ltssm_str) ?
   373				      "Unknown state" : ltssm_str[ltssm_index];
   374			dev_err(pcie->dev,
   375				"PCIe link down, current LTSSM state: %s (%#x)\n",
   376				ltssm_state, val);
   377			return err;
   378		}
   379	
   380		mtk_pcie_enable_msi(pcie);
   381	
   382		/* Set PCIe translation windows */
   383		resource_list_for_each_entry(entry, &host->windows) {
   384			struct resource *res = entry->res;
   385			unsigned long type = resource_type(res);
   386			resource_size_t cpu_addr;
   387			resource_size_t pci_addr;
   388			resource_size_t size;
   389			const char *range_type;
   390	
   391			if (type == IORESOURCE_IO) {
   392				cpu_addr = pci_pio_to_address(res->start);
   393				range_type = "IO";
   394			} else if (type == IORESOURCE_MEM) {
   395				cpu_addr = res->start;
   396				range_type = "MEM";
   397			} else {
   398				continue;
   399			}
   400	
   401			pci_addr = res->start - entry->offset;
   402			size = resource_size(res);
   403			err = mtk_pcie_set_trans_table(pcie, cpu_addr, pci_addr, size,
   404						       type, table_index);
   405			if (err)
   406				return err;
   407	
   408			dev_dbg(pcie->dev, "set %s trans window[%d]: cpu_addr = %#llx, pci_addr = %#llx, size = %#llx\n",
   409				range_type, table_index, (unsigned long long)cpu_addr,
   410				(unsigned long long)pci_addr, (unsigned long long)size);
   411	
   412			table_index++;
   413		}
   414	
   415		return 0;
   416	}
   417	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
