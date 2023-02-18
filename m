Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31AA565C
	for <oe-kbuild-all@lists.linux.dev>; Sat, 18 Feb 2023 06:42:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676702575; x=1708238575;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=0+75X4J3aU/fL9FfhPP2U6CO6FJg3+iYDkoNilKaqd0=;
  b=J4xHezcdPQqa2VAQ6JxGTEDxHUp7NPp3tLXPC+dKrP1DROpH4ehp1bVe
   SLLQ3uV3ZF+1xLBsaJqfSdONo8GFmYWMWMYszg4dMeh7dcxWUeWiMTzko
   FRJ7E/ldeXjDjfCXIFX7SiCg2ip7bnjywNSz6m8015FD6CTMbGYkQxq/M
   u5ELJPQrVKHc5pBhN+0s52UnviJnBz73ltZmTJvktdbPtxPfiaNq2x+rJ
   995w02CM23yG7+0H93u9xMo8qhn/uJ14Ehh9Ytq+93FUjgJt+2yyqzxtH
   GHMjEjGtCHhgjwNt0zVSH6p+eeYuXQppy2Ity7rKNN+278i6wbHlJ0/s8
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10624"; a="333510462"
X-IronPort-AV: E=Sophos;i="5.97,306,1669104000"; 
   d="scan'208";a="333510462"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Feb 2023 22:42:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10624"; a="759644970"
X-IronPort-AV: E=Sophos;i="5.97,306,1669104000"; 
   d="scan'208";a="759644970"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 17 Feb 2023 22:42:50 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pTGvq-000CC3-0d;
	Sat, 18 Feb 2023 06:42:50 +0000
Date: Sat, 18 Feb 2023 14:42:22 +0800
From: kernel test robot <lkp@intel.com>
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [krzk-github:wip/sm8450-hdmi-audio-on-qcomlt 485/584]
 drivers/pci/endpoint/functions/pci-epf-mhi.c:146:6: warning: no previous
 prototype for 'pci_epf_mhi_raise_irq'
Message-ID: <202302181410.22iFekcN-lkp@intel.com>
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
commit: 1ab20b2aa9185e9001215a2820150769fa200ab8 [485/584] PCI: endpoint: Add PCI Endpoint function driver for MHI bus
config: arm-allmodconfig (https://download.01.org/0day-ci/archive/20230218/202302181410.22iFekcN-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/krzk/linux/commit/1ab20b2aa9185e9001215a2820150769fa200ab8
        git remote add krzk-github https://github.com/krzk/linux
        git fetch --no-tags krzk-github wip/sm8450-hdmi-audio-on-qcomlt
        git checkout 1ab20b2aa9185e9001215a2820150769fa200ab8
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash drivers/pci/endpoint/functions/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302181410.22iFekcN-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/pci/endpoint/functions/pci-epf-mhi.c:146:6: warning: no previous prototype for 'pci_epf_mhi_raise_irq' [-Wmissing-prototypes]
     146 | void pci_epf_mhi_raise_irq(struct mhi_ep_cntrl *mhi_cntrl, u32 vector)
         |      ^~~~~~~~~~~~~~~~~~~~~
   drivers/pci/endpoint/functions/pci-epf-mhi.c:159:5: warning: no previous prototype for 'pci_epf_mhi_read_from_host' [-Wmissing-prototypes]
     159 | int pci_epf_mhi_read_from_host(struct mhi_ep_cntrl *mhi_cntrl, u64 from, void __iomem *to,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/pci/endpoint/functions/pci-epf-mhi.c:196:5: warning: no previous prototype for 'pci_epf_mhi_write_to_host' [-Wmissing-prototypes]
     196 | int pci_epf_mhi_write_to_host(struct mhi_ep_cntrl *mhi_cntrl, void __iomem *from, u64 to,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/pci/endpoint/functions/pci-epf-mhi.c: In function 'pci_epf_mhi_notifier':
   drivers/pci/endpoint/functions/pci-epf-mhi.c:292:14: error: 'LINK_DOWN' undeclared (first use in this function); did you mean 'PFN_DOWN'?
     292 |         case LINK_DOWN:
         |              ^~~~~~~~~
         |              PFN_DOWN
   drivers/pci/endpoint/functions/pci-epf-mhi.c:292:14: note: each undeclared identifier is reported only once for each function it appears in
   drivers/pci/endpoint/functions/pci-epf-mhi.c:300:14: error: 'BME' undeclared (first use in this function)
     300 |         case BME:
         |              ^~~
   drivers/pci/endpoint/functions/pci-epf-mhi.c: In function 'pci_epf_mhi_unbind':
   drivers/pci/endpoint/functions/pci-epf-mhi.c:365:9: error: implicit declaration of function 'pci_epc_unregister_notifier'; did you mean 'pci_epc_register_notifier'? [-Werror=implicit-function-declaration]
     365 |         pci_epc_unregister_notifier(epc, &epf->nb);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~
         |         pci_epc_register_notifier
   drivers/pci/endpoint/functions/pci-epf-mhi.c: At top level:
   drivers/pci/endpoint/functions/pci-epf-mhi.c:416:27: error: initialization of 'int (*)(struct pci_epf *)' from incompatible pointer type 'int (*)(struct pci_epf *, const struct pci_epf_device_id *)' [-Werror=incompatible-pointer-types]
     416 |         .probe          = pci_epf_mhi_probe,
         |                           ^~~~~~~~~~~~~~~~~
   drivers/pci/endpoint/functions/pci-epf-mhi.c:416:27: note: (near initialization for 'pci_epf_mhi_driver.probe')
   cc1: some warnings being treated as errors


vim +/pci_epf_mhi_raise_irq +146 drivers/pci/endpoint/functions/pci-epf-mhi.c

   145	
 > 146	void pci_epf_mhi_raise_irq(struct mhi_ep_cntrl *mhi_cntrl, u32 vector)
   147	{
   148		struct pci_epf_mhi *epf_mhi = container_of(mhi_cntrl, struct pci_epf_mhi, mhi_cntrl);
   149		struct pci_epf *epf = epf_mhi->epf;
   150		struct pci_epc *epc = epf->epc;
   151	
   152		/*
   153		 * Vector is incremented by 1 here as the DWC core will decrement it before
   154		 * writing to iATU.
   155		 */
   156		pci_epc_raise_irq(epc, epf->func_no, epf->vfunc_no, PCI_EPC_IRQ_MSI, vector + 1);
   157	}
   158	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
