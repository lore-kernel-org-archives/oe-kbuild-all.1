Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B85C2F43
	for <oe-kbuild-all@lists.linux.dev>; Sun,  5 Feb 2023 13:53:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675605206; x=1707141206;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=brmGPl8rw0P0RNva3TIjID7ew80m19KvqoTKphIryjg=;
  b=NxKi+3aI/hNXIkowQ3MSU1MBS5yj5wnL1K5fMLEK3RbmZsku6x5rcxBJ
   jnl0UEzepNBfDnqkoGvVCEzaZTcuvTuw2LKS7KiStHdkweEJeWghne4Mo
   ulCGOnlrXKOX7psPNrCcFWS9KEMNbUaleX5b8WNaI3dBVxKGbPptW2xec
   oOf9JJXG2juuWjL4EAbaPVqfxtqVWiBZkVvGpOL8ayckJRxumSKnx/HFm
   7dximIlMRt8vC46+Q57fVZ70ctNB3I4k89KB+jHN/5adyUukzHLwqj+xC
   6l9iwiL9ybZwQbT/SL/UxqEg+GXiAZId3l1CCsvU0vdWPFV+pJjqgGYFq
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10611"; a="309382142"
X-IronPort-AV: E=Sophos;i="5.97,275,1669104000"; 
   d="scan'208";a="309382142"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Feb 2023 05:53:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10611"; a="698601889"
X-IronPort-AV: E=Sophos;i="5.97,275,1669104000"; 
   d="scan'208";a="698601889"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 05 Feb 2023 05:53:21 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pOfSK-00022W-1y;
	Sun, 05 Feb 2023 13:53:20 +0000
Date: Sun, 5 Feb 2023 21:53:03 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:pr/621 6178/20208]
 drivers/pci/controller/dwc/pci-imx6.c:2882:11: warning: variable 'ret' set
 but not used
Message-ID: <202302052114.7mPPbFoE-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Dong,

FYI, the error/warning still remains.

tree:   https://github.com/Freescale/linux-fslc pr/621
head:   b9ae52e89c61eed5d446a9693d8bf0f55a5323e7
commit: 57c0f9fc3024aa4d28f39a99a56cffd31c845c58 [6178/20208] Merge branch 'pcie/next' into next
config: powerpc-buildonly-randconfig-r005-20230205 (https://download.01.org/0day-ci/archive/20230205/202302052114.7mPPbFoE-lkp@intel.com/config)
compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project 4196ca3278f78c6e19246e54ab0ecb364e37d66a)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install powerpc cross compiling tool for clang build
        # apt-get install binutils-powerpc-linux-gnu
        # https://github.com/Freescale/linux-fslc/commit/57c0f9fc3024aa4d28f39a99a56cffd31c845c58
        git remote add freescale-fslc https://github.com/Freescale/linux-fslc
        git fetch --no-tags freescale-fslc pr/621
        git checkout 57c0f9fc3024aa4d28f39a99a56cffd31c845c58
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=powerpc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=powerpc SHELL=/bin/bash drivers/pci/controller/dwc/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   drivers/pci/controller/dwc/pci-imx6.c:905:2: warning: variable 'ret' is used uninitialized whenever switch default is taken [-Wsometimes-uninitialized]
           default:
           ^~~~~~~
   drivers/pci/controller/dwc/pci-imx6.c:908:6: note: uninitialized use occurs here
           if (ret)
               ^~~
   drivers/pci/controller/dwc/pci-imx6.c:874:7: warning: variable 'ret' is used uninitialized whenever 'if' condition is false [-Wsometimes-uninitialized]
                   if (cond >= 2000)
                       ^~~~~~~~~~~~
   drivers/pci/controller/dwc/pci-imx6.c:908:6: note: uninitialized use occurs here
           if (ret)
               ^~~
   drivers/pci/controller/dwc/pci-imx6.c:874:3: note: remove the 'if' if its condition is always true
                   if (cond >= 2000)
                   ^~~~~~~~~~~~~~~~~
   drivers/pci/controller/dwc/pci-imx6.c:863:7: warning: variable 'ret' is used uninitialized whenever 'if' condition is false [-Wsometimes-uninitialized]
                   if (cond >= 2000)
                       ^~~~~~~~~~~~
   drivers/pci/controller/dwc/pci-imx6.c:908:6: note: uninitialized use occurs here
           if (ret)
               ^~~
   drivers/pci/controller/dwc/pci-imx6.c:863:3: note: remove the 'if' if its condition is always true
                   if (cond >= 2000)
                   ^~~~~~~~~~~~~~~~~
   drivers/pci/controller/dwc/pci-imx6.c:847:9: note: initialize the variable 'ret' to silence this warning
           int ret;
                  ^
                   = 0
   drivers/pci/controller/dwc/pci-imx6.c:2922:29: warning: use of logical '&&' with constant operand [-Wconstant-logical-operand]
           if ((rc_l1sub && ep_l1sub) && PCI_L1SS_CAP_L1_PM_SS) {
                                      ^  ~~~~~~~~~~~~~~~~~~~~~
   drivers/pci/controller/dwc/pci-imx6.c:2922:29: note: use '&' for a bitwise operation
           if ((rc_l1sub && ep_l1sub) && PCI_L1SS_CAP_L1_PM_SS) {
                                      ^~
                                      &
   drivers/pci/controller/dwc/pci-imx6.c:2922:29: note: remove constant to silence this warning
           if ((rc_l1sub && ep_l1sub) && PCI_L1SS_CAP_L1_PM_SS) {
                                     ~^~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/pci/controller/dwc/pci-imx6.c:2882:11: warning: variable 'ret' set but not used [-Wunused-but-set-variable]
           int ttl, ret;
                    ^
   5 warnings generated.


vim +/ret +2882 drivers/pci/controller/dwc/pci-imx6.c

bb38919ec56e075 drivers/pci/host/pci-imx6.c           Sean Cross   2013-09-26  2847  
075af61c19cdc32 drivers/pci/controller/dwc/pci-imx6.c Stefan Agner 2019-07-26  2848  static void imx6_pcie_quirk(struct pci_dev *dev)
075af61c19cdc32 drivers/pci/controller/dwc/pci-imx6.c Stefan Agner 2019-07-26  2849  {
075af61c19cdc32 drivers/pci/controller/dwc/pci-imx6.c Stefan Agner 2019-07-26  2850  	struct pci_bus *bus = dev->bus;
075af61c19cdc32 drivers/pci/controller/dwc/pci-imx6.c Stefan Agner 2019-07-26  2851  	struct pcie_port *pp = bus->sysdata;
075af61c19cdc32 drivers/pci/controller/dwc/pci-imx6.c Stefan Agner 2019-07-26  2852  
075af61c19cdc32 drivers/pci/controller/dwc/pci-imx6.c Stefan Agner 2019-07-26  2853  	/* Bus parent is the PCI bridge, its parent is this platform driver */
075af61c19cdc32 drivers/pci/controller/dwc/pci-imx6.c Stefan Agner 2019-07-26  2854  	if (!bus->dev.parent || !bus->dev.parent->parent)
075af61c19cdc32 drivers/pci/controller/dwc/pci-imx6.c Stefan Agner 2019-07-26  2855  		return;
075af61c19cdc32 drivers/pci/controller/dwc/pci-imx6.c Stefan Agner 2019-07-26  2856  
075af61c19cdc32 drivers/pci/controller/dwc/pci-imx6.c Stefan Agner 2019-07-26  2857  	/* Make sure we only quirk devices associated with this driver */
075af61c19cdc32 drivers/pci/controller/dwc/pci-imx6.c Stefan Agner 2019-07-26  2858  	if (bus->dev.parent->parent->driver != &imx6_pcie_driver.driver)
075af61c19cdc32 drivers/pci/controller/dwc/pci-imx6.c Stefan Agner 2019-07-26  2859  		return;
075af61c19cdc32 drivers/pci/controller/dwc/pci-imx6.c Stefan Agner 2019-07-26  2860  
552549386624583 drivers/pci/controller/dwc/pci-imx6.c Rob Herring  2020-07-21  2861  	if (pci_is_root_bus(bus)) {
075af61c19cdc32 drivers/pci/controller/dwc/pci-imx6.c Stefan Agner 2019-07-26  2862  		struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
075af61c19cdc32 drivers/pci/controller/dwc/pci-imx6.c Stefan Agner 2019-07-26  2863  		struct imx6_pcie *imx6_pcie = to_imx6_pcie(pci);
075af61c19cdc32 drivers/pci/controller/dwc/pci-imx6.c Stefan Agner 2019-07-26  2864  
075af61c19cdc32 drivers/pci/controller/dwc/pci-imx6.c Stefan Agner 2019-07-26  2865  		/*
075af61c19cdc32 drivers/pci/controller/dwc/pci-imx6.c Stefan Agner 2019-07-26  2866  		 * Limit config length to avoid the kernel reading beyond
075af61c19cdc32 drivers/pci/controller/dwc/pci-imx6.c Stefan Agner 2019-07-26  2867  		 * the register set and causing an abort on i.MX 6Quad
075af61c19cdc32 drivers/pci/controller/dwc/pci-imx6.c Stefan Agner 2019-07-26  2868  		 */
075af61c19cdc32 drivers/pci/controller/dwc/pci-imx6.c Stefan Agner 2019-07-26  2869  		if (imx6_pcie->drvdata->dbi_length) {
075af61c19cdc32 drivers/pci/controller/dwc/pci-imx6.c Stefan Agner 2019-07-26  2870  			dev->cfg_size = imx6_pcie->drvdata->dbi_length;
075af61c19cdc32 drivers/pci/controller/dwc/pci-imx6.c Stefan Agner 2019-07-26  2871  			dev_info(&dev->dev, "Limiting cfg_size to %d\n",
075af61c19cdc32 drivers/pci/controller/dwc/pci-imx6.c Stefan Agner 2019-07-26  2872  					dev->cfg_size);
075af61c19cdc32 drivers/pci/controller/dwc/pci-imx6.c Stefan Agner 2019-07-26  2873  		}
075af61c19cdc32 drivers/pci/controller/dwc/pci-imx6.c Stefan Agner 2019-07-26  2874  	}
075af61c19cdc32 drivers/pci/controller/dwc/pci-imx6.c Stefan Agner 2019-07-26  2875  }
075af61c19cdc32 drivers/pci/controller/dwc/pci-imx6.c Stefan Agner 2019-07-26  2876  DECLARE_PCI_FIXUP_CLASS_HEADER(PCI_VENDOR_ID_SYNOPSYS, 0xabcd,
075af61c19cdc32 drivers/pci/controller/dwc/pci-imx6.c Stefan Agner 2019-07-26  2877  			PCI_CLASS_BRIDGE_PCI, 8, imx6_pcie_quirk);
075af61c19cdc32 drivers/pci/controller/dwc/pci-imx6.c Stefan Agner 2019-07-26  2878  
a12a943c1ab0665 drivers/pci/controller/dwc/pci-imx6.c Richard Zhu  2021-02-09  2879  static void imx6_pcie_l1ss_quirk(struct pci_dev *dev)
a12a943c1ab0665 drivers/pci/controller/dwc/pci-imx6.c Richard Zhu  2021-02-09  2880  {
a12a943c1ab0665 drivers/pci/controller/dwc/pci-imx6.c Richard Zhu  2021-02-09  2881  	u32 reg, rc_l1sub, ep_l1sub, header;
a12a943c1ab0665 drivers/pci/controller/dwc/pci-imx6.c Richard Zhu  2021-02-09 @2882  	int ttl, ret;
a12a943c1ab0665 drivers/pci/controller/dwc/pci-imx6.c Richard Zhu  2021-02-09  2883  	int pos = PCI_CFG_SPACE_SIZE;
a12a943c1ab0665 drivers/pci/controller/dwc/pci-imx6.c Richard Zhu  2021-02-09  2884  	struct pci_bus *bus = dev->bus;
a12a943c1ab0665 drivers/pci/controller/dwc/pci-imx6.c Richard Zhu  2021-02-09  2885  	struct pcie_port *pp = bus->sysdata;
a12a943c1ab0665 drivers/pci/controller/dwc/pci-imx6.c Richard Zhu  2021-02-09  2886  	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
a12a943c1ab0665 drivers/pci/controller/dwc/pci-imx6.c Richard Zhu  2021-02-09  2887  	struct imx6_pcie *imx6_pcie = to_imx6_pcie(pci);
a12a943c1ab0665 drivers/pci/controller/dwc/pci-imx6.c Richard Zhu  2021-02-09  2888  
a12a943c1ab0665 drivers/pci/controller/dwc/pci-imx6.c Richard Zhu  2021-02-09  2889  	/* Return directly, if the L1SS is not supported by RC */
a12a943c1ab0665 drivers/pci/controller/dwc/pci-imx6.c Richard Zhu  2021-02-09  2890  	if (!(imx6_pcie->drvdata->flags & IMX6_PCIE_FLAG_SUPPORTS_L1SS))
a12a943c1ab0665 drivers/pci/controller/dwc/pci-imx6.c Richard Zhu  2021-02-09  2891  		return;
a12a943c1ab0665 drivers/pci/controller/dwc/pci-imx6.c Richard Zhu  2021-02-09  2892  
68db96f391f94b6 drivers/pci/controller/dwc/pci-imx6.c Richard Zhu  2021-03-08  2893  	/* Make sure the L1SS is not force disabled. */
68db96f391f94b6 drivers/pci/controller/dwc/pci-imx6.c Richard Zhu  2021-03-08  2894  	if (imx6_pcie->l1ss_clkreq == 0)
68db96f391f94b6 drivers/pci/controller/dwc/pci-imx6.c Richard Zhu  2021-03-08  2895  		return;
68db96f391f94b6 drivers/pci/controller/dwc/pci-imx6.c Richard Zhu  2021-03-08  2896  
a12a943c1ab0665 drivers/pci/controller/dwc/pci-imx6.c Richard Zhu  2021-02-09  2897  	reg = dw_pcie_find_ext_capability(pci, PCI_EXT_CAP_ID_L1SS);
a12a943c1ab0665 drivers/pci/controller/dwc/pci-imx6.c Richard Zhu  2021-02-09  2898  	rc_l1sub = dw_pcie_readl_dbi(pci, reg + PCI_L1SS_CAP);
a12a943c1ab0665 drivers/pci/controller/dwc/pci-imx6.c Richard Zhu  2021-02-09  2899  
a12a943c1ab0665 drivers/pci/controller/dwc/pci-imx6.c Richard Zhu  2021-02-09  2900  	/* minimum 8 bytes per capability */
a12a943c1ab0665 drivers/pci/controller/dwc/pci-imx6.c Richard Zhu  2021-02-09  2901  	ttl = (PCI_CFG_SPACE_EXP_SIZE - PCI_CFG_SPACE_SIZE) / 8;
a12a943c1ab0665 drivers/pci/controller/dwc/pci-imx6.c Richard Zhu  2021-02-09  2902  	ret = dw_pcie_read(pp->va_cfg0_base + pos, 4, &header);
a12a943c1ab0665 drivers/pci/controller/dwc/pci-imx6.c Richard Zhu  2021-02-09  2903  	/*
a12a943c1ab0665 drivers/pci/controller/dwc/pci-imx6.c Richard Zhu  2021-02-09  2904  	 * If we have no capabilities, this is indicated by cap ID,
a12a943c1ab0665 drivers/pci/controller/dwc/pci-imx6.c Richard Zhu  2021-02-09  2905  	 * cap version and next pointer all being 0.
a12a943c1ab0665 drivers/pci/controller/dwc/pci-imx6.c Richard Zhu  2021-02-09  2906  	 */
a12a943c1ab0665 drivers/pci/controller/dwc/pci-imx6.c Richard Zhu  2021-02-09  2907  	if (header == 0)
a12a943c1ab0665 drivers/pci/controller/dwc/pci-imx6.c Richard Zhu  2021-02-09  2908  		return;
a12a943c1ab0665 drivers/pci/controller/dwc/pci-imx6.c Richard Zhu  2021-02-09  2909  
a12a943c1ab0665 drivers/pci/controller/dwc/pci-imx6.c Richard Zhu  2021-02-09  2910  	while (ttl-- > 0) {
a12a943c1ab0665 drivers/pci/controller/dwc/pci-imx6.c Richard Zhu  2021-02-09  2911  		if (PCI_EXT_CAP_ID(header) == PCI_EXT_CAP_ID_L1SS && pos != 0)
a12a943c1ab0665 drivers/pci/controller/dwc/pci-imx6.c Richard Zhu  2021-02-09  2912  			break;
a12a943c1ab0665 drivers/pci/controller/dwc/pci-imx6.c Richard Zhu  2021-02-09  2913  
a12a943c1ab0665 drivers/pci/controller/dwc/pci-imx6.c Richard Zhu  2021-02-09  2914  		pos = PCI_EXT_CAP_NEXT(header);
a12a943c1ab0665 drivers/pci/controller/dwc/pci-imx6.c Richard Zhu  2021-02-09  2915  		if (pos < PCI_CFG_SPACE_SIZE)
a12a943c1ab0665 drivers/pci/controller/dwc/pci-imx6.c Richard Zhu  2021-02-09  2916  			break;
a12a943c1ab0665 drivers/pci/controller/dwc/pci-imx6.c Richard Zhu  2021-02-09  2917  
a12a943c1ab0665 drivers/pci/controller/dwc/pci-imx6.c Richard Zhu  2021-02-09  2918  		ret = dw_pcie_read(pp->va_cfg0_base + pos, 4, &header);
a12a943c1ab0665 drivers/pci/controller/dwc/pci-imx6.c Richard Zhu  2021-02-09  2919  	}
a12a943c1ab0665 drivers/pci/controller/dwc/pci-imx6.c Richard Zhu  2021-02-09  2920  	ret = dw_pcie_read(pp->va_cfg0_base + pos + PCI_L1SS_CAP, 4, &ep_l1sub);
a12a943c1ab0665 drivers/pci/controller/dwc/pci-imx6.c Richard Zhu  2021-02-09  2921  
a12a943c1ab0665 drivers/pci/controller/dwc/pci-imx6.c Richard Zhu  2021-02-09  2922  	if ((rc_l1sub && ep_l1sub) && PCI_L1SS_CAP_L1_PM_SS) {
a12a943c1ab0665 drivers/pci/controller/dwc/pci-imx6.c Richard Zhu  2021-02-09  2923  		imx6_pcie->l1ss_clkreq = 1;
a12a943c1ab0665 drivers/pci/controller/dwc/pci-imx6.c Richard Zhu  2021-02-09  2924  		imx6_pcie_clkreq_enable(imx6_pcie);
a12a943c1ab0665 drivers/pci/controller/dwc/pci-imx6.c Richard Zhu  2021-02-09  2925  	} else {
a12a943c1ab0665 drivers/pci/controller/dwc/pci-imx6.c Richard Zhu  2021-02-09  2926  		imx6_pcie->l1ss_clkreq = 0;
a12a943c1ab0665 drivers/pci/controller/dwc/pci-imx6.c Richard Zhu  2021-02-09  2927  	}
a12a943c1ab0665 drivers/pci/controller/dwc/pci-imx6.c Richard Zhu  2021-02-09  2928  }
a12a943c1ab0665 drivers/pci/controller/dwc/pci-imx6.c Richard Zhu  2021-02-09  2929  DECLARE_PCI_FIXUP_FINAL(PCI_VENDOR_ID_SYNOPSYS, 0xabcd, imx6_pcie_l1ss_quirk);
a12a943c1ab0665 drivers/pci/controller/dwc/pci-imx6.c Richard Zhu  2021-02-09  2930  

:::::: The code at line 2882 was first introduced by commit
:::::: a12a943c1ab0665ee6d5c3249e1363a4cfabc7d4 MLK-25283-4 PCI: imx: adjust the l1ss support to proper place

:::::: TO: Richard Zhu <hongxing.zhu@nxp.com>
:::::: CC: Dong Aisheng <aisheng.dong@nxp.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
