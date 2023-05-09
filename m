Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 593478BE8
	for <oe-kbuild-all@lists.linux.dev>; Tue,  9 May 2023 10:18:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683627483; x=1715163483;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=diVLWOT5Bqi6cJtsS/rqyH5lRvmslTzFgfxD9S4hEKc=;
  b=CVctW3nMTiGB5puwVhr+9nl7a+rG8aeEmBfBRvXlCdIQ7bMO0VU3io1l
   oGPaGalvP+8G6tgCPoZSqCzKj7/R88Hp9MJFtdKfkG1YeXfw37QB3Frvm
   1bcAr9lxa9pf96+djScw0GK5607L+8W6Nm8kE570jXOa8L00wMJzgdPKH
   Ws69INeKUGTjXp0CYMnGfLFywZSzCIKWhcBuBzWnwG2PZCvrKRkboRhrm
   SGZ+YjazrKePKfZx8E+0R8Upd1QkZ3WpWEGe9a0oIUhV0LsLX0UaAri+A
   TfeEBp4iV3PsoS2xzd2jIPOd4wKEn6PnVSqK1a+DJPvcfLRAkd1g34zMn
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10704"; a="330248988"
X-IronPort-AV: E=Sophos;i="5.99,261,1677571200"; 
   d="scan'208";a="330248988"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 May 2023 03:18:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10704"; a="649265421"
X-IronPort-AV: E=Sophos;i="5.99,261,1677571200"; 
   d="scan'208";a="649265421"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 09 May 2023 03:18:00 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pwKPr-00024A-09;
	Tue, 09 May 2023 10:17:55 +0000
Date: Tue, 9 May 2023 18:17:44 +0800
From: kernel test robot <lkp@intel.com>
To: Shunsuke Mie <mie@igel.co.jp>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH v2 3/3] PCI: endpoint: Add EP function driver to
 provide virtio-console functionality
Message-ID: <202305091852.DYtMNvWB-lkp@intel.com>
References: <20230427104428.862643-4-mie@igel.co.jp>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230427104428.862643-4-mie@igel.co.jp>

Hi Shunsuke,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on pci/next]
[also build test ERROR on pci/for-linus linus/master v6.4-rc1 next-20230509]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Shunsuke-Mie/PCI-endpoint-introduce-a-helper-to-implement-pci-ep-virtio-function/20230427-184534
base:   https://git.kernel.org/pub/scm/linux/kernel/git/pci/pci.git next
patch link:    https://lore.kernel.org/r/20230427104428.862643-4-mie%40igel.co.jp
patch subject: [RFC PATCH v2 3/3] PCI: endpoint: Add EP function driver to provide virtio-console functionality
config: loongarch-allmodconfig (https://download.01.org/0day-ci/archive/20230509/202305091852.DYtMNvWB-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/988a24cb673bb7a63b7f92f04eff6393be2e70b3
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Shunsuke-Mie/PCI-endpoint-introduce-a-helper-to-implement-pci-ep-virtio-function/20230427-184534
        git checkout 988a24cb673bb7a63b7f92f04eff6393be2e70b3
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=loongarch olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=loongarch SHELL=/bin/bash drivers/pci/endpoint/functions/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202305091852.DYtMNvWB-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/pci/endpoint/functions/pci-epf-virtio.c: In function 'epf_virtio_alloc_vringh':
>> drivers/pci/endpoint/functions/pci-epf-virtio.c:75:15: error: implicit declaration of function 'vringh_init_iomem'; did you mean 'vringh_init_iotlb'? [-Werror=implicit-function-declaration]
      75 |         err = vringh_init_iomem(&evrh->vrh, features, num, false, vring.desc,
         |               ^~~~~~~~~~~~~~~~~
         |               vringh_init_iotlb
   drivers/pci/endpoint/functions/pci-epf-virtio.c: In function 'epf_virtio_getdesc':
>> drivers/pci/endpoint/functions/pci-epf-virtio.c:382:16: error: implicit declaration of function 'vringh_getdesc_iomem'; did you mean 'vringh_getdesc_iotlb'? [-Werror=implicit-function-declaration]
     382 |         return vringh_getdesc_iomem(vrh, riov, wiov, head, GFP_KERNEL);
         |                ^~~~~~~~~~~~~~~~~~~~
         |                vringh_getdesc_iotlb
   drivers/pci/endpoint/functions/pci-epf-virtio.c: In function 'epf_virtio_abandon':
>> drivers/pci/endpoint/functions/pci-epf-virtio.c:389:9: error: implicit declaration of function 'vringh_abandon_iomem'; did you mean 'vringh_abandon_iotlb'? [-Werror=implicit-function-declaration]
     389 |         vringh_abandon_iomem(vrh, num);
         |         ^~~~~~~~~~~~~~~~~~~~
         |         vringh_abandon_iotlb
   drivers/pci/endpoint/functions/pci-epf-virtio.c: In function 'epf_virtio_iov_complete':
>> drivers/pci/endpoint/functions/pci-epf-virtio.c:397:9: error: implicit declaration of function 'vringh_complete_iomem'; did you mean 'vringh_complete_iotlb'? [-Werror=implicit-function-declaration]
     397 |         vringh_complete_iomem(vrh, head, total_len);
         |         ^~~~~~~~~~~~~~~~~~~~~
         |         vringh_complete_iotlb
   cc1: some warnings being treated as errors
--
   drivers/pci/endpoint/functions/pci-epf-vcon.c: In function 'epf_vcon_raise_irq_handler':
>> drivers/pci/endpoint/functions/pci-epf-vcon.c:162:27: error: 'PCI_EPC_IRQ_INTX' undeclared (first use in this function); did you mean 'PCI_EPC_IRQ_MSIX'?
     162 |                           PCI_EPC_IRQ_INTX, 0);
         |                           ^~~~~~~~~~~~~~~~
         |                           PCI_EPC_IRQ_MSIX
   drivers/pci/endpoint/functions/pci-epf-vcon.c:162:27: note: each undeclared identifier is reported only once for each function it appears in


vim +162 drivers/pci/endpoint/functions/pci-epf-vcon.c

   154	
   155	static void epf_vcon_raise_irq_handler(struct work_struct *work)
   156	{
   157		struct epf_vcon *vcon =
   158			container_of(work, struct epf_vcon, raise_irq_work);
   159		struct pci_epf *epf = vcon->evio.epf;
   160	
   161		pci_epc_raise_irq(epf->epc, epf->func_no, epf->vfunc_no,
 > 162				  PCI_EPC_IRQ_INTX, 0);
   163	}
   164	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
