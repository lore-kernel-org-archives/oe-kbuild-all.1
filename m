Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3323323E
	for <oe-kbuild-all@lists.linux.dev>; Fri, 17 Feb 2023 18:50:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676659833; x=1708195833;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=rx3wxfq7uLxtWbalLNII+JlxYgqEZsLP89FmQIMYouo=;
  b=emJ64udNhYFaytGNrhS77Fm6+FwKyxmSaHDNIUso1zX1fGjcwVlJGGS/
   b7IcFTacMcfe/GMOGpUNn+5fAaxMd/MugD8qxycUXCZ7yRAGQRmIlJLZa
   oKC6dVMRt+FVcG4T/n/G9nDKO7jiQ6hT/Zdi//IUh9ceOjRvD5iiwBH6Z
   k/xZ25erZNYOU0VvwpQfJx01wJQ89wBal35QfXyle9faXWJKKDnGMTiEP
   8iPm/QKMhcmKpOG54GfOBnKRbfpdZiAV9r7X8wbNUB3XNbP1qOqtIWAQc
   y8U6xvBos3I4NPY+aF8WC80GdVagps4lqSFtcrJJvSNbXsINGpwVPUGLb
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10624"; a="315775333"
X-IronPort-AV: E=Sophos;i="5.97,306,1669104000"; 
   d="scan'208";a="315775333"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Feb 2023 10:50:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10624"; a="703032318"
X-IronPort-AV: E=Sophos;i="5.97,306,1669104000"; 
   d="scan'208";a="703032318"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 17 Feb 2023 10:50:31 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pT5oU-000BjN-1A;
	Fri, 17 Feb 2023 18:50:30 +0000
Date: Sat, 18 Feb 2023 02:49:31 +0800
From: kernel test robot <lkp@intel.com>
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [krzk-github:n/audio-wsa884x-on-top-of-audio-wsa881x-gpio 222/615]
 drivers/pci/endpoint/functions/pci-epf-mhi.c:447:5: warning: no previous
 prototype for 'pci_epf_mhi_core_init'
Message-ID: <202302180227.3r9S2GiK-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/krzk/linux n/audio-wsa884x-on-top-of-audio-wsa881x-gpio
head:   04e5048badb91c86b22993d0d9fd1bf8b79c0d91
commit: 0e3655d1808e5898845af7327f0ff7de95ad84be [222/615] PCI: endpoint: epf-mhi: Switch to new interface between EPC and EPF
config: sparc-allyesconfig (https://download.01.org/0day-ci/archive/20230218/202302180227.3r9S2GiK-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/krzk/linux/commit/0e3655d1808e5898845af7327f0ff7de95ad84be
        git remote add krzk-github https://github.com/krzk/linux
        git fetch --no-tags krzk-github n/audio-wsa884x-on-top-of-audio-wsa881x-gpio
        git checkout 0e3655d1808e5898845af7327f0ff7de95ad84be
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=sparc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=sparc SHELL=/bin/bash drivers/pci/endpoint/functions/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302180227.3r9S2GiK-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/pci/endpoint/functions/pci-epf-mhi.c:171:6: warning: no previous prototype for 'pci_epf_mhi_raise_irq' [-Wmissing-prototypes]
     171 | void pci_epf_mhi_raise_irq(struct mhi_ep_cntrl *mhi_cntrl, u32 vector)
         |      ^~~~~~~~~~~~~~~~~~~~~
   drivers/pci/endpoint/functions/pci-epf-mhi.c:184:5: warning: no previous prototype for 'pci_epf_mhi_iatu_read' [-Wmissing-prototypes]
     184 | int pci_epf_mhi_iatu_read(struct mhi_ep_cntrl *mhi_cntrl, u64 from, void __iomem *to,
         |     ^~~~~~~~~~~~~~~~~~~~~
   drivers/pci/endpoint/functions/pci-epf-mhi.c:221:5: warning: no previous prototype for 'pci_epf_mhi_iatu_write' [-Wmissing-prototypes]
     221 | int pci_epf_mhi_iatu_write(struct mhi_ep_cntrl *mhi_cntrl, void __iomem *from, u64 to,
         |     ^~~~~~~~~~~~~~~~~~~~~~
>> drivers/pci/endpoint/functions/pci-epf-mhi.c:447:5: warning: no previous prototype for 'pci_epf_mhi_core_init' [-Wmissing-prototypes]
     447 | int pci_epf_mhi_core_init(struct pci_epf *epf)
         |     ^~~~~~~~~~~~~~~~~~~~~
>> drivers/pci/endpoint/functions/pci-epf-mhi.c:482:5: warning: no previous prototype for 'pci_epf_mhi_link_up' [-Wmissing-prototypes]
     482 | int pci_epf_mhi_link_up(struct pci_epf *epf)
         |     ^~~~~~~~~~~~~~~~~~~
>> drivers/pci/endpoint/functions/pci-epf-mhi.c:533:5: warning: no previous prototype for 'pci_epf_mhi_link_down' [-Wmissing-prototypes]
     533 | int pci_epf_mhi_link_down(struct pci_epf *epf)
         |     ^~~~~~~~~~~~~~~~~~~~~
>> drivers/pci/endpoint/functions/pci-epf-mhi.c:550:5: warning: no previous prototype for 'pci_epf_mhi_bme' [-Wmissing-prototypes]
     550 | int pci_epf_mhi_bme(struct pci_epf *epf)
         |     ^~~~~~~~~~~~~~~


vim +/pci_epf_mhi_core_init +447 drivers/pci/endpoint/functions/pci-epf-mhi.c

   446	
 > 447	int pci_epf_mhi_core_init(struct pci_epf *epf)
   448	{
   449		struct pci_epf_mhi *epf_mhi = epf_get_drvdata(epf);
   450		const struct pci_epf_mhi_ep_info *info = epf_mhi->info;
   451		struct pci_epf_bar *epf_bar = &epf->bar[info->bar_num];
   452		struct pci_epc *epc = epf->epc;
   453		struct device *dev = &epf->dev;
   454		int ret;
   455	
   456		epf_bar->phys_addr = epf_mhi->mmio_phys;
   457		epf_bar->size = epf_mhi->mmio_size;
   458		epf_bar->barno = info->bar_num;
   459		epf_bar->flags = info->epf_flags;
   460		ret = pci_epc_set_bar(epc, epf->func_no, epf->vfunc_no, epf_bar);
   461		if (ret) {
   462			dev_err(dev, "Failed to set BAR: %d\n", ret);
   463			return ret;
   464		}
   465	
   466		ret = pci_epc_set_msi(epc, epf->func_no, epf->vfunc_no,
   467				      order_base_2(info->msi_count));
   468		if (ret) {
   469			dev_err(dev, "Failed to set MSI configuration: %d\n", ret);
   470			return ret;
   471		}
   472	
   473		ret = pci_epc_write_header(epc, epf->func_no, epf->vfunc_no, epf->header);
   474		if (ret) {
   475			dev_err(dev, "Failed to set Configuration header: %d\n", ret);
   476			return ret;
   477		}
   478	
   479		return 0;
   480	}
   481	
 > 482	int pci_epf_mhi_link_up(struct pci_epf *epf)
   483	{
   484		struct pci_epf_mhi *epf_mhi = epf_get_drvdata(epf);
   485		const struct pci_epf_mhi_ep_info *info = epf_mhi->info;
   486		struct mhi_ep_cntrl *mhi_cntrl = &epf_mhi->mhi_cntrl;
   487		struct pci_epc *epc = epf->epc;
   488		struct device *dev = &epf->dev;
   489		int ret;
   490	
   491		if (info->flags & MHI_EPF_USE_DMA) {
   492			ret = pci_epf_mhi_dma_init(epf_mhi);
   493			if (ret) {
   494				dev_err(dev, "Failed to initialize DMA: %d\n", ret);
   495				return ret;
   496			}
   497		}
   498	
   499		mhi_cntrl->mmio = epf_mhi->mmio;
   500		mhi_cntrl->irq = epf_mhi->irq;
   501		mhi_cntrl->mru = info->mru;
   502	
   503		/* Assign the struct dev of PCI EP as MHI controller device */
   504		mhi_cntrl->cntrl_dev = epc->dev.parent;
   505		mhi_cntrl->raise_irq = pci_epf_mhi_raise_irq;
   506		mhi_cntrl->alloc_map = pci_epf_mhi_alloc_map;
   507		mhi_cntrl->unmap_free = pci_epf_mhi_unmap_free;
   508		mhi_cntrl->read_from_host = pci_epf_mhi_iatu_read;
   509		mhi_cntrl->write_to_host = pci_epf_mhi_iatu_write;
   510		if (info->flags & MHI_EPF_USE_DMA) {
   511			mhi_cntrl->transfer_from_host = pci_epf_mhi_edma_read;
   512			mhi_cntrl->transfer_to_host = pci_epf_mhi_edma_write;
   513		} else {
   514			mhi_cntrl->transfer_from_host = pci_epf_mhi_iatu_read;
   515			mhi_cntrl->transfer_to_host = pci_epf_mhi_iatu_write;
   516		}
   517	
   518		/* Register the MHI EP controller */
   519		ret = mhi_ep_register_controller(mhi_cntrl, info->config);
   520		if (ret) {
   521			dev_err(dev, "Failed to register MHI EP controller: %d\n", ret);
   522			if (info->flags & MHI_EPF_USE_DMA)
   523				pci_epf_mhi_dma_deinit(epf_mhi);
   524	
   525			return ret;
   526		}
   527	
   528		epf_mhi->mhi_registered = true;
   529	
   530		return 0;
   531	}
   532	
 > 533	int pci_epf_mhi_link_down(struct pci_epf *epf)
   534	{
   535		struct pci_epf_mhi *epf_mhi = epf_get_drvdata(epf);
   536		const struct pci_epf_mhi_ep_info *info = epf_mhi->info;
   537		struct mhi_ep_cntrl *mhi_cntrl = &epf_mhi->mhi_cntrl;
   538	
   539		if (epf_mhi->mhi_registered) {
   540			mhi_ep_power_down(mhi_cntrl);
   541			if (info->flags & MHI_EPF_USE_DMA)
   542				pci_epf_mhi_dma_deinit(epf_mhi);
   543			mhi_ep_unregister_controller(mhi_cntrl);
   544			epf_mhi->mhi_registered = false;
   545		}
   546	
   547		return 0;
   548	}
   549	
 > 550	int pci_epf_mhi_bme(struct pci_epf *epf)
   551	{
   552		struct pci_epf_mhi *epf_mhi = epf_get_drvdata(epf);
   553		const struct pci_epf_mhi_ep_info *info = epf_mhi->info;
   554		struct mhi_ep_cntrl *mhi_cntrl = &epf_mhi->mhi_cntrl;
   555		struct device *dev = &epf->dev;
   556		int ret;
   557	
   558		/* Power up the MHI EP stack if link is up and stack is in power down state */
   559		if (!mhi_cntrl->enabled && epf_mhi->mhi_registered) {
   560			ret = mhi_ep_power_up(mhi_cntrl);
   561			if (ret) {
   562				dev_err(dev, "Failed to power up MHI EP: %d\n", ret);
   563				if (info->flags & MHI_EPF_USE_DMA)
   564					pci_epf_mhi_dma_deinit(epf_mhi);
   565				mhi_ep_unregister_controller(mhi_cntrl);
   566				epf_mhi->mhi_registered = false;
   567			}
   568		}
   569	
   570		return 0;
   571	}
   572	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
