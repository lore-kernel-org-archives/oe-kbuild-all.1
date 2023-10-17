Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A2732E3ED
	for <oe-kbuild-all@lists.linux.dev>; Tue, 17 Oct 2023 23:47:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="a8nl2IbR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697586451; x=1729122451;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=XaOyMmcbfrxPSZL50htun0GO3dwEluHH55lzgnetYe8=;
  b=a8nl2IbR2sCY4fwl1B/v05JOMF3AUSDLD/dQnY/6AK6TYiWAnzT21207
   y11agBh/NF1/cqzoheGltmxxwCO2PUvTpOdnp3TjkF0tzxJL39rSGNf25
   BK7lCaGDjl01sM4UTa9MCgm5aJpmVvdj0eF/iY8B+Mz2LFpqbOShAnR4r
   wAWlpIrmUeocAeItsHqKhtjckuZYK2nanZCOz20ifZTfCvqLVB9j11oH9
   roiuW2O6vR3ugGUMuGaW2vL+eWpQWZSLRAarDrlRG50AU8zApt2fxjE3J
   MC8ygTr1cN+oW7GTqikRKpWHSdkOVc6f+VYRxwgsJnZ570FPfto8laBX7
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10866"; a="472128400"
X-IronPort-AV: E=Sophos;i="6.03,233,1694761200"; 
   d="scan'208";a="472128400"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Oct 2023 16:47:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,233,1694761200"; 
   d="scan'208";a="4288724"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 17 Oct 2023 16:47:34 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qstmY-000AEZ-2R;
	Tue, 17 Oct 2023 23:47:26 +0000
Date: Wed, 18 Oct 2023 07:47:22 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:pr/317 13/48]
 drivers/pci/controller/dwc/pci-imx6.c:2935: undefined reference to
 `dw_pcie_find_ext_capability'
Message-ID: <202310180719.bkdsSRCz-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Freescale/linux-fslc pr/317
head:   cffe4fb95c43405f2fe3ceab81948a12c8769724
commit: a32bd4692437b1a2fc977fc8b1302e6107b2f0d6 [13/48] MLK-25283-4 PCI: imx: adjust the l1ss support to proper place
config: x86_64-randconfig-076-20231017 (https://download.01.org/0day-ci/archive/20231018/202310180719.bkdsSRCz-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231018/202310180719.bkdsSRCz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310180719.bkdsSRCz-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: warning: arch/x86/lib/csum-copy_64.o: missing .note.GNU-stack section implies executable stack
   ld: NOTE: This behaviour is deprecated and will be removed in a future version of the linker
   ld: warning: arch/x86/lib/csum-copy_64.o: missing .note.GNU-stack section implies executable stack
   ld: NOTE: This behaviour is deprecated and will be removed in a future version of the linker
   ld: warning: .tmp_vmlinux.kallsyms1 has a LOAD segment with RWX permissions
   ld: drivers/pci/controller/dwc/pci-imx6.o: in function `imx6_pcie_start_link':
   drivers/pci/controller/dwc/pci-imx6.c:1965: undefined reference to `dw_pcie_link_up'
   ld: drivers/pci/controller/dwc/pci-imx6.o: in function `imx6_pcie_l1ss_quirk':
>> drivers/pci/controller/dwc/pci-imx6.c:2935: undefined reference to `dw_pcie_find_ext_capability'
   ld: drivers/pci/controller/dwc/pci-imx6.o: in function `dw_pcie_readl_dbi':
   drivers/pci/controller/dwc/pcie-designware.h:294: undefined reference to `dw_pcie_read_dbi'
   ld: drivers/pci/controller/dwc/pci-imx6.o: in function `imx6_pcie_l1ss_quirk':
>> drivers/pci/controller/dwc/pci-imx6.c:2940: undefined reference to `dw_pcie_read'
>> ld: drivers/pci/controller/dwc/pci-imx6.c:2956: undefined reference to `dw_pcie_read'
   ld: drivers/pci/controller/dwc/pci-imx6.c:2958: undefined reference to `dw_pcie_read'
   ld: drivers/pci/controller/dwc/pci-imx6.o: in function `dw_pcie_readl_dbi':
   drivers/pci/controller/dwc/pcie-designware.h:294: undefined reference to `dw_pcie_read_dbi'
   ld: drivers/pci/controller/dwc/pci-imx6.o: in function `dw_pcie_writel_dbi':
   drivers/pci/controller/dwc/pcie-designware.h:289: undefined reference to `dw_pcie_write_dbi'
   ld: drivers/pci/controller/dwc/pci-imx6.o: in function `dw_pcie_readl_dbi':
   drivers/pci/controller/dwc/pcie-designware.h:294: undefined reference to `dw_pcie_read_dbi'
   ld: drivers/pci/controller/dwc/pci-imx6.o: in function `dw_pcie_writel_dbi':
   drivers/pci/controller/dwc/pcie-designware.h:289: undefined reference to `dw_pcie_write_dbi'
   ld: drivers/pci/controller/dwc/pcie-designware.h:289: undefined reference to `dw_pcie_write_dbi'
   ld: drivers/pci/controller/dwc/pcie-designware.h:289: undefined reference to `dw_pcie_write_dbi'
   ld: drivers/pci/controller/dwc/pci-imx6.o: in function `dw_pcie_readl_dbi':
   drivers/pci/controller/dwc/pcie-designware.h:294: undefined reference to `dw_pcie_read_dbi'
   ld: drivers/pci/controller/dwc/pci-imx6.o: in function `dw_pcie_writel_dbi':
   drivers/pci/controller/dwc/pcie-designware.h:289: undefined reference to `dw_pcie_write_dbi'
   ld: drivers/pci/controller/dwc/pci-imx6.o: in function `dw_pcie_readl_dbi':
   drivers/pci/controller/dwc/pcie-designware.h:294: undefined reference to `dw_pcie_read_dbi'
   ld: drivers/pci/controller/dwc/pci-imx6.o: in function `dw_pcie_writel_dbi':
   drivers/pci/controller/dwc/pcie-designware.h:289: undefined reference to `dw_pcie_write_dbi'
   ld: drivers/pci/controller/dwc/pci-imx6.o: in function `dw_pcie_readl_dbi':
   drivers/pci/controller/dwc/pcie-designware.h:294: undefined reference to `dw_pcie_read_dbi'
   ld: drivers/pci/controller/dwc/pcie-designware.h:294: undefined reference to `dw_pcie_read_dbi'
   ld: drivers/pci/controller/dwc/pci-imx6.o: in function `dw_pcie_writel_dbi':
   drivers/pci/controller/dwc/pcie-designware.h:289: undefined reference to `dw_pcie_write_dbi'
   ld: drivers/pci/controller/dwc/pci-imx6.o: in function `dw_pcie_readl_dbi':
   drivers/pci/controller/dwc/pcie-designware.h:294: undefined reference to `dw_pcie_read_dbi'
   ld: drivers/pci/controller/dwc/pci-imx6.o: in function `dw_pcie_writel_dbi':
   drivers/pci/controller/dwc/pcie-designware.h:289: undefined reference to `dw_pcie_write_dbi'
   ld: drivers/pci/controller/dwc/pcie-designware.h:289: undefined reference to `dw_pcie_write_dbi'
   ld: drivers/pci/controller/dwc/pci-imx6.o: in function `dw_pcie_readl_dbi':
   drivers/pci/controller/dwc/pcie-designware.h:294: undefined reference to `dw_pcie_read_dbi'
   ld: drivers/pci/controller/dwc/pci-imx6.o: in function `dw_pcie_writel_dbi':
   drivers/pci/controller/dwc/pcie-designware.h:289: undefined reference to `dw_pcie_write_dbi'
   ld: drivers/pci/controller/dwc/pci-imx6.o: in function `dw_pcie_readl_dbi':
   drivers/pci/controller/dwc/pcie-designware.h:294: undefined reference to `dw_pcie_read_dbi'
   ld: drivers/pci/controller/dwc/pci-imx6.o: in function `dw_pcie_writel_dbi':
   drivers/pci/controller/dwc/pcie-designware.h:289: undefined reference to `dw_pcie_write_dbi'
   ld: drivers/pci/controller/dwc/pci-imx6.o: in function `dw_pcie_readl_dbi':
   drivers/pci/controller/dwc/pcie-designware.h:294: undefined reference to `dw_pcie_read_dbi'
   ld: drivers/pci/controller/dwc/pci-imx6.o: in function `dw_pcie_writel_dbi':
   drivers/pci/controller/dwc/pcie-designware.h:289: undefined reference to `dw_pcie_write_dbi'
   ld: drivers/pci/controller/dwc/pci-imx6.o: in function `dw_pcie_readl_dbi':
   drivers/pci/controller/dwc/pcie-designware.h:294: undefined reference to `dw_pcie_read_dbi'
   ld: drivers/pci/controller/dwc/pci-imx6.o: in function `dw_pcie_writel_dbi':
   drivers/pci/controller/dwc/pcie-designware.h:289: undefined reference to `dw_pcie_write_dbi'
   ld: drivers/pci/controller/dwc/pci-imx6.o: in function `dw_pcie_readl_dbi':
   drivers/pci/controller/dwc/pcie-designware.h:294: undefined reference to `dw_pcie_read_dbi'
   ld: drivers/pci/controller/dwc/pci-imx6.o: in function `dw_pcie_writel_dbi':
   drivers/pci/controller/dwc/pcie-designware.h:289: undefined reference to `dw_pcie_write_dbi'
   ld: drivers/pci/controller/dwc/pci-imx6.o: in function `dw_pcie_readl_dbi':
   drivers/pci/controller/dwc/pcie-designware.h:294: undefined reference to `dw_pcie_read_dbi'
   ld: drivers/pci/controller/dwc/pci-imx6.o: in function `dw_pcie_writel_dbi':
   drivers/pci/controller/dwc/pcie-designware.h:289: undefined reference to `dw_pcie_write_dbi'
   ld: drivers/pci/controller/dwc/pci-imx6.o: in function `dw_pcie_readl_dbi':
   drivers/pci/controller/dwc/pcie-designware.h:294: undefined reference to `dw_pcie_read_dbi'
   ld: drivers/pci/controller/dwc/pci-imx6.o: in function `dw_pcie_writel_dbi':
   drivers/pci/controller/dwc/pcie-designware.h:289: undefined reference to `dw_pcie_write_dbi'
   ld: drivers/pci/controller/dwc/pci-imx6.o: in function `imx6_pcie_establish_link':
   drivers/pci/controller/dwc/pci-imx6.c:1818: undefined reference to `dw_pcie_wait_for_link'
   ld: drivers/pci/controller/dwc/pci-imx6.o: in function `dw_pcie_readl_dbi':
   drivers/pci/controller/dwc/pcie-designware.h:294: undefined reference to `dw_pcie_read_dbi'
   ld: drivers/pci/controller/dwc/pci-imx6.o: in function `dw_pcie_writel_dbi':
   drivers/pci/controller/dwc/pcie-designware.h:289: undefined reference to `dw_pcie_write_dbi'
   ld: drivers/pci/controller/dwc/pci-imx6.o: in function `dw_pcie_readl_dbi':
   drivers/pci/controller/dwc/pcie-designware.h:294: undefined reference to `dw_pcie_read_dbi'
   ld: drivers/pci/controller/dwc/pci-imx6.o: in function `dw_pcie_writel_dbi':
   drivers/pci/controller/dwc/pcie-designware.h:289: undefined reference to `dw_pcie_write_dbi'
   ld: drivers/pci/controller/dwc/pci-imx6.o: in function `dw_pcie_readl_dbi':
   drivers/pci/controller/dwc/pcie-designware.h:294: undefined reference to `dw_pcie_read_dbi'
   ld: drivers/pci/controller/dwc/pci-imx6.o: in function `dw_pcie_writel_dbi':
   drivers/pci/controller/dwc/pcie-designware.h:289: undefined reference to `dw_pcie_write_dbi'
   ld: drivers/pci/controller/dwc/pci-imx6.o: in function `dw_pcie_readl_dbi':
   drivers/pci/controller/dwc/pcie-designware.h:294: undefined reference to `dw_pcie_read_dbi'
   ld: drivers/pci/controller/dwc/pci-imx6.o: in function `dw_pcie_writel_dbi':
   drivers/pci/controller/dwc/pcie-designware.h:289: undefined reference to `dw_pcie_write_dbi'
   ld: drivers/pci/controller/dwc/pci-imx6.o: in function `dw_pcie_readl_dbi':
   drivers/pci/controller/dwc/pcie-designware.h:294: undefined reference to `dw_pcie_read_dbi'
   ld: drivers/pci/controller/dwc/pci-imx6.o: in function `imx6_pcie_establish_link':
   drivers/pci/controller/dwc/pci-imx6.c:1866: undefined reference to `dw_pcie_wait_for_link'
   ld: drivers/pci/controller/dwc/pci-imx6.o: in function `dw_pcie_readl_dbi':
   drivers/pci/controller/dwc/pcie-designware.h:294: undefined reference to `dw_pcie_read_dbi'
   ld: drivers/pci/controller/dwc/pci-imx6.o: in function `dw_pcie_writel_dbi':
   drivers/pci/controller/dwc/pcie-designware.h:289: undefined reference to `dw_pcie_write_dbi'
   ld: drivers/pci/controller/dwc/pci-imx6.o: in function `dw_pcie_readl_dbi':
   drivers/pci/controller/dwc/pcie-designware.h:294: undefined reference to `dw_pcie_read_dbi'
   ld: drivers/pci/controller/dwc/pcie-designware.h:294: undefined reference to `dw_pcie_read_dbi'
   ld: drivers/pci/controller/dwc/pci-imx6.o: in function `dw_pcie_writel_dbi':
   drivers/pci/controller/dwc/pcie-designware.h:289: undefined reference to `dw_pcie_write_dbi'


vim +2935 drivers/pci/controller/dwc/pci-imx6.c

  2889	
  2890	static void imx6_pcie_quirk(struct pci_dev *dev)
  2891	{
  2892		struct pci_bus *bus = dev->bus;
  2893		struct pcie_port *pp = bus->sysdata;
  2894	
  2895		/* Bus parent is the PCI bridge, its parent is this platform driver */
  2896		if (!bus->dev.parent || !bus->dev.parent->parent)
  2897			return;
  2898	
  2899		/* Make sure we only quirk devices associated with this driver */
  2900		if (bus->dev.parent->parent->driver != &imx6_pcie_driver.driver)
  2901			return;
  2902	
  2903		if (bus->number == pp->root_bus_nr) {
  2904			struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
  2905			struct imx6_pcie *imx6_pcie = to_imx6_pcie(pci);
  2906	
  2907			/*
  2908			 * Limit config length to avoid the kernel reading beyond
  2909			 * the register set and causing an abort on i.MX 6Quad
  2910			 */
  2911			if (imx6_pcie->drvdata->dbi_length) {
  2912				dev->cfg_size = imx6_pcie->drvdata->dbi_length;
  2913				dev_info(&dev->dev, "Limiting cfg_size to %d\n",
  2914						dev->cfg_size);
  2915			}
  2916		}
  2917	}
  2918	DECLARE_PCI_FIXUP_CLASS_HEADER(PCI_VENDOR_ID_SYNOPSYS, 0xabcd,
  2919				PCI_CLASS_BRIDGE_PCI, 8, imx6_pcie_quirk);
  2920	
  2921	static void imx6_pcie_l1ss_quirk(struct pci_dev *dev)
  2922	{
  2923		u32 reg, rc_l1sub, ep_l1sub, header;
  2924		int ttl, ret;
  2925		int pos = PCI_CFG_SPACE_SIZE;
  2926		struct pci_bus *bus = dev->bus;
  2927		struct pcie_port *pp = bus->sysdata;
  2928		struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
  2929		struct imx6_pcie *imx6_pcie = to_imx6_pcie(pci);
  2930	
  2931		/* Return directly, if the L1SS is not supported by RC */
  2932		if (!(imx6_pcie->drvdata->flags & IMX6_PCIE_FLAG_SUPPORTS_L1SS))
  2933			return;
  2934	
> 2935		reg = dw_pcie_find_ext_capability(pci, PCI_EXT_CAP_ID_L1SS);
  2936		rc_l1sub = dw_pcie_readl_dbi(pci, reg + PCI_L1SS_CAP);
  2937	
  2938		/* minimum 8 bytes per capability */
  2939		ttl = (PCI_CFG_SPACE_EXP_SIZE - PCI_CFG_SPACE_SIZE) / 8;
> 2940		ret = dw_pcie_read(pp->va_cfg0_base + pos, 4, &header);
  2941		/*
  2942		 * If we have no capabilities, this is indicated by cap ID,
  2943		 * cap version and next pointer all being 0.
  2944		 */
  2945		if (header == 0)
  2946			return;
  2947	
  2948		while (ttl-- > 0) {
  2949			if (PCI_EXT_CAP_ID(header) == PCI_EXT_CAP_ID_L1SS && pos != 0)
  2950				break;
  2951	
  2952			pos = PCI_EXT_CAP_NEXT(header);
  2953			if (pos < PCI_CFG_SPACE_SIZE)
  2954				break;
  2955	
> 2956			ret = dw_pcie_read(pp->va_cfg0_base + pos, 4, &header);
  2957		}
  2958		ret = dw_pcie_read(pp->va_cfg0_base + pos + PCI_L1SS_CAP, 4, &ep_l1sub);
  2959	
  2960		if ((rc_l1sub && ep_l1sub) && PCI_L1SS_CAP_L1_PM_SS) {
  2961			imx6_pcie->l1ss_clkreq = 1;
  2962			imx6_pcie_clkreq_enable(imx6_pcie);
  2963		} else {
  2964			imx6_pcie->l1ss_clkreq = 0;
  2965		}
  2966	}
  2967	DECLARE_PCI_FIXUP_FINAL(PCI_VENDOR_ID_SYNOPSYS, 0xabcd, imx6_pcie_l1ss_quirk);
  2968	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
