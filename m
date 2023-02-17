Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1DC6746A
	for <oe-kbuild-all@lists.linux.dev>; Fri, 17 Feb 2023 15:41:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676648483; x=1708184483;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3dDKXtrbTUE7BxA2DIG2WIFkYduzCeXwiK9NvdGUCzg=;
  b=P2sT6XP3luOizo1/va0Du+wIPLk/CF4BGdcRVb1g4nC+UdcodlCgpLYS
   0vuXUKJ2qvRabF6iJSwMVuU0jEuHs0/o7Q95VXSBhF3LI/RTsXfPvfzxF
   CuocxOT8zRlbqm/1map4ESLoKP4eYkcc2Pbu7UFvzsTyg8kDBMKRYZY6Q
   utXk36NGy/jeczYU1r0JtcJwflag5P5XFLDsUoOGng5FM/eADH6o0wbPC
   ZuPdtN5cs57BhoDrtMFVRM9sbZylg6kxEK6zQoleJskM+Cgv98Q0sM8Dt
   h9wGxmebF0yhwVxFPMNm8MhjW/y1Y+VmBuEEKl65TGFiFc7Lpj0jTy3J4
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10624"; a="333368608"
X-IronPort-AV: E=Sophos;i="5.97,306,1669104000"; 
   d="scan'208";a="333368608"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Feb 2023 07:41:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10624"; a="813410111"
X-IronPort-AV: E=Sophos;i="5.97,306,1669104000"; 
   d="scan'208";a="813410111"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 17 Feb 2023 07:41:18 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pT2rO-000Bat-0L;
	Fri, 17 Feb 2023 15:41:18 +0000
Date: Fri, 17 Feb 2023 23:40:24 +0800
From: kernel test robot <lkp@intel.com>
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [krzk-github:n/audio-wsa884x-on-top-of-audio-wsa881x-gpio 177/615]
 drivers/pci/endpoint/functions/pci-epf-mhi.c:146:6: warning: no previous
 prototype for 'pci_epf_mhi_raise_irq'
Message-ID: <202302172318.E5Oci5ZA-lkp@intel.com>
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
commit: 3f4492e10bd44729c4e6826384d3642ff474808f [177/615] PCI: endpoint: Add PCI Endpoint function driver for MHI bus
config: sparc-allyesconfig (https://download.01.org/0day-ci/archive/20230217/202302172318.E5Oci5ZA-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/krzk/linux/commit/3f4492e10bd44729c4e6826384d3642ff474808f
        git remote add krzk-github https://github.com/krzk/linux
        git fetch --no-tags krzk-github n/audio-wsa884x-on-top-of-audio-wsa881x-gpio
        git checkout 3f4492e10bd44729c4e6826384d3642ff474808f
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=sparc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=sparc SHELL=/bin/bash drivers/pci/endpoint/functions/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302172318.E5Oci5ZA-lkp@intel.com/

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
   drivers/pci/endpoint/functions/pci-epf-mhi.c:292:14: error: 'LINK_DOWN' undeclared (first use in this function); did you mean 'ALIGN_DOWN'?
     292 |         case LINK_DOWN:
         |              ^~~~~~~~~
         |              ALIGN_DOWN
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
