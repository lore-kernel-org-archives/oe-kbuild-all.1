Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD75E810
	for <oe-kbuild-all@lists.linux.dev>; Sat, 18 Feb 2023 10:05:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676714757; x=1708250757;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=wUgR3JqA7sLIM1bixQ4F/t61dk4ShfiYxPflK3JOFzM=;
  b=IEFdNHfyw+okt3SNdDg8o/kPSWrT3pf0sIBeI05z+RaJGQIbgqs+olrW
   Ojq4wYu0jta1h1UY3KGQsaXgIH7ISETX9K4+GvfjVjz4uU2obN7JgIlwX
   kozDDLjtitQcLnxo69JCl8iqn72iaw1qdRMTeMmojxkIx6+px1YbUAgqa
   AfmHZdJK6yNmjOxyydNZ0KJtlbYoYVzAdEWbwINo8qO7dI4nErx+MKduE
   6FY5PGR54FRElFZWhLKwyEXH5qa52tJcMj72OoQAE2VLGP+WmhII83YL3
   NkqwJJ3KzSyiuWCS9pzXPNmKVfRo2CArj4UDeMerIYxzpHxM+eVEGzigi
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10624"; a="330827937"
X-IronPort-AV: E=Sophos;i="5.97,306,1669104000"; 
   d="scan'208";a="330827937"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Feb 2023 02:05:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10624"; a="648349421"
X-IronPort-AV: E=Sophos;i="5.97,306,1669104000"; 
   d="scan'208";a="648349421"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 18 Feb 2023 02:05:55 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pTK6N-000CHx-13;
	Sat, 18 Feb 2023 10:05:55 +0000
Date: Sat, 18 Feb 2023 18:05:34 +0800
From: kernel test robot <lkp@intel.com>
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [krzk-github:wip/sm8450-hdmi-audio-on-qcomlt 518/584]
 drivers/pci/endpoint/functions/pci-epf-mhi.c:447:5: warning: no previous
 prototype for 'pci_epf_mhi_core_init'
Message-ID: <202302181844.DfjKh8Ut-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/krzk/linux wip/sm8450-hdmi-audio-on-qcomlt
head:   e1df0b14d2e3085d5ff5a1c7474b47840640da92
commit: 0840855a12a5683128ad79aa891c6d8d22ee869e [518/584] PCI: endpoint: epf-mhi: Switch to new interface between EPC and EPF
config: arm-allmodconfig (https://download.01.org/0day-ci/archive/20230218/202302181844.DfjKh8Ut-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/krzk/linux/commit/0840855a12a5683128ad79aa891c6d8d22ee869e
        git remote add krzk-github https://github.com/krzk/linux
        git fetch --no-tags krzk-github wip/sm8450-hdmi-audio-on-qcomlt
        git checkout 0840855a12a5683128ad79aa891c6d8d22ee869e
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash drivers/pci/endpoint/functions/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302181844.DfjKh8Ut-lkp@intel.com/

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
