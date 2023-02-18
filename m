Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E36E5623
	for <oe-kbuild-all@lists.linux.dev>; Sat, 18 Feb 2023 09:04:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676711096; x=1708247096;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Vn9jJSsIGVYRLxuwWWUZqCK3+ij+Go2DdjYSkqb8OpA=;
  b=HdM0zZ2TsHY7jvVDKkody46w/C50NJoCpVa5lTbB4If8TcI9MRlksCT9
   neMtzpXitR1IycSqYOFv5KQo8ItVLPfYGStlcgHZELqf1ZMrYUR7GKJ5j
   sbOiW29UYxcE9MxlRAy+vM3M7uXWAdA0Ievsmtwf8RE4ojONzIzr3gqgE
   6w2EplwywKSk1TKwBhFa0wF/4cgyHoUY70Wyg28rcovaJ8Iydl4N8VWVJ
   Tcd5Oeya1GMZWUqVC1mzwYtD/QVff5Gyc3UYrp6RM5ZEi6RI5qPtI/5H9
   EjparhSxp4/6Uw7GRsdyK4t4/l4PU+WYBTXLWoyKVJhzKk1c0DevLnKi0
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10624"; a="334356785"
X-IronPort-AV: E=Sophos;i="5.97,306,1669104000"; 
   d="scan'208";a="334356785"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Feb 2023 01:04:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10624"; a="703203932"
X-IronPort-AV: E=Sophos;i="5.97,306,1669104000"; 
   d="scan'208";a="703203932"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 18 Feb 2023 01:04:55 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pTJ9K-000CFt-0U;
	Sat, 18 Feb 2023 09:04:54 +0000
Date: Sat, 18 Feb 2023 17:04:26 +0800
From: kernel test robot <lkp@intel.com>
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [krzk-github:wip/sm8450-hdmi-audio-on-qcomlt 502/584]
 drivers/pci/endpoint/functions/pci-epf-mhi.c:185:5: warning: no previous
 prototype for 'pci_epf_mhi_iatu_read'
Message-ID: <202302181708.neL9U1Oh-lkp@intel.com>
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
commit: 47d67f8e63d05bc45a69e67a414bd69ca6bcd5b0 [502/584] PCI: endpoint: epf-mhi: Add eDMA support
config: arm-allmodconfig (https://download.01.org/0day-ci/archive/20230218/202302181708.neL9U1Oh-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/krzk/linux/commit/47d67f8e63d05bc45a69e67a414bd69ca6bcd5b0
        git remote add krzk-github https://github.com/krzk/linux
        git fetch --no-tags krzk-github wip/sm8450-hdmi-audio-on-qcomlt
        git checkout 47d67f8e63d05bc45a69e67a414bd69ca6bcd5b0
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash drivers/pci/endpoint/functions/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302181708.neL9U1Oh-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/pci/endpoint/functions/pci-epf-mhi.c:124:31: error: field 'event' has incomplete type
     124 |         enum pci_notify_event event;
         |                               ^~~~~
   drivers/pci/endpoint/functions/pci-epf-mhi.c:172:6: warning: no previous prototype for 'pci_epf_mhi_raise_irq' [-Wmissing-prototypes]
     172 | void pci_epf_mhi_raise_irq(struct mhi_ep_cntrl *mhi_cntrl, u32 vector)
         |      ^~~~~~~~~~~~~~~~~~~~~
>> drivers/pci/endpoint/functions/pci-epf-mhi.c:185:5: warning: no previous prototype for 'pci_epf_mhi_iatu_read' [-Wmissing-prototypes]
     185 | int pci_epf_mhi_iatu_read(struct mhi_ep_cntrl *mhi_cntrl, u64 from, void __iomem *to,
         |     ^~~~~~~~~~~~~~~~~~~~~
>> drivers/pci/endpoint/functions/pci-epf-mhi.c:222:5: warning: no previous prototype for 'pci_epf_mhi_iatu_write' [-Wmissing-prototypes]
     222 | int pci_epf_mhi_iatu_write(struct mhi_ep_cntrl *mhi_cntrl, void __iomem *from, u64 to,
         |     ^~~~~~~~~~~~~~~~~~~~~~
   In file included from include/linux/bits.h:22,
                    from include/linux/ratelimit_types.h:5,
                    from include/linux/ratelimit.h:5,
                    from include/linux/dev_printk.h:16,
                    from include/linux/device.h:15,
                    from include/linux/dmaengine.h:8,
                    from drivers/pci/endpoint/functions/pci-epf-mhi.c:9:
   drivers/pci/endpoint/functions/pci-epf-mhi.c: In function 'pci_epf_mhi_notifier':
   include/linux/container_of.h:20:54: error: 'struct pci_epf' has no member named 'nb'
      20 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |                                                      ^~
   include/linux/build_bug.h:78:56: note: in definition of macro '__static_assert'
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                                        ^~~~
   include/linux/container_of.h:20:9: note: in expansion of macro 'static_assert'
      20 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |         ^~~~~~~~~~~~~
   include/linux/container_of.h:20:23: note: in expansion of macro '__same_type'
      20 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |                       ^~~~~~~~~~~
   drivers/pci/endpoint/functions/pci-epf-mhi.c:450:31: note: in expansion of macro 'container_of'
     450 |         struct pci_epf *epf = container_of(nb, struct pci_epf, nb);
         |                               ^~~~~~~~~~~~
   include/linux/compiler_types.h:299:27: error: expression in static assertion is not an integer
     299 | #define __same_type(a, b) __builtin_types_compatible_p(typeof(a), typeof(b))
         |                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:78:56: note: in definition of macro '__static_assert'
      78 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                                        ^~~~
   include/linux/container_of.h:20:9: note: in expansion of macro 'static_assert'
      20 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |         ^~~~~~~~~~~~~
   include/linux/container_of.h:20:23: note: in expansion of macro '__same_type'
      20 |         static_assert(__same_type(*(ptr), ((type *)0)->member) ||       \
         |                       ^~~~~~~~~~~
   drivers/pci/endpoint/functions/pci-epf-mhi.c:450:31: note: in expansion of macro 'container_of'
     450 |         struct pci_epf *epf = container_of(nb, struct pci_epf, nb);
         |                               ^~~~~~~~~~~~
   In file included from include/uapi/linux/posix_types.h:5,
                    from include/uapi/linux/types.h:14,
                    from include/linux/types.h:6,
                    from include/linux/kasan-checks.h:5,
                    from include/asm-generic/rwonce.h:26,
                    from ./arch/arm/include/generated/asm/rwonce.h:1,
                    from include/linux/compiler.h:247,
                    from include/linux/dev_printk.h:14:
   include/linux/stddef.h:16:33: error: 'struct pci_epf' has no member named 'nb'
      16 | #define offsetof(TYPE, MEMBER)  __builtin_offsetof(TYPE, MEMBER)
         |                                 ^~~~~~~~~~~~~~~~~~
   include/linux/container_of.h:23:28: note: in expansion of macro 'offsetof'
      23 |         ((type *)(__mptr - offsetof(type, member))); })
         |                            ^~~~~~~~
   drivers/pci/endpoint/functions/pci-epf-mhi.c:450:31: note: in expansion of macro 'container_of'
     450 |         struct pci_epf *epf = container_of(nb, struct pci_epf, nb);
         |                               ^~~~~~~~~~~~
   drivers/pci/endpoint/functions/pci-epf-mhi.c:460:14: error: 'CORE_INIT' undeclared (first use in this function); did you mean 'CSD_INIT'?
     460 |         case CORE_INIT:
         |              ^~~~~~~~~
         |              CSD_INIT
   drivers/pci/endpoint/functions/pci-epf-mhi.c:460:14: note: each undeclared identifier is reported only once for each function it appears in
   drivers/pci/endpoint/functions/pci-epf-mhi.c:485:14: error: 'LINK_UP' undeclared (first use in this function)
     485 |         case LINK_UP:
         |              ^~~~~~~
   drivers/pci/endpoint/functions/pci-epf-mhi.c:525:14: error: 'LINK_DOWN' undeclared (first use in this function); did you mean 'PFN_DOWN'?
     525 |         case LINK_DOWN:
         |              ^~~~~~~~~
         |              PFN_DOWN
   drivers/pci/endpoint/functions/pci-epf-mhi.c:535:14: error: 'BME' undeclared (first use in this function)
     535 |         case BME:
         |              ^~~
   drivers/pci/endpoint/functions/pci-epf-mhi.c: In function 'pci_epf_mhi_bind':
   drivers/pci/endpoint/functions/pci-epf-mhi.c:588:12: error: 'struct pci_epf' has no member named 'nb'
     588 |         epf->nb.notifier_call = pci_epf_mhi_notifier;
         |            ^~
   drivers/pci/endpoint/functions/pci-epf-mhi.c:589:9: error: implicit declaration of function 'pci_epc_register_notifier'; did you mean 'lease_register_notifier'? [-Werror=implicit-function-declaration]
     589 |         pci_epc_register_notifier(epc, &epf->nb);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~
         |         lease_register_notifier
   drivers/pci/endpoint/functions/pci-epf-mhi.c:589:44: error: 'struct pci_epf' has no member named 'nb'
     589 |         pci_epc_register_notifier(epc, &epf->nb);
         |                                            ^~
   drivers/pci/endpoint/functions/pci-epf-mhi.c: In function 'pci_epf_mhi_unbind':
   drivers/pci/endpoint/functions/pci-epf-mhi.c:602:9: error: implicit declaration of function 'pci_epc_unregister_notifier'; did you mean 'pci_epf_unregister_driver'? [-Werror=implicit-function-declaration]
     602 |         pci_epc_unregister_notifier(epc, &epf->nb);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~
         |         pci_epf_unregister_driver
   drivers/pci/endpoint/functions/pci-epf-mhi.c:602:46: error: 'struct pci_epf' has no member named 'nb'
     602 |         pci_epc_unregister_notifier(epc, &epf->nb);
         |                                              ^~
   cc1: some warnings being treated as errors


vim +/pci_epf_mhi_iatu_read +185 drivers/pci/endpoint/functions/pci-epf-mhi.c

   116	
   117	struct pci_epf_mhi {
   118		const struct pci_epf_mhi_ep_info *info;
   119		struct mhi_ep_cntrl mhi_cntrl;
   120		struct pci_epf *epf;
   121		struct mutex lock;
   122		void __iomem *mmio;
   123		resource_size_t mmio_phys;
 > 124		enum pci_notify_event event;
   125		struct dma_chan *dma_chan_tx;
   126		struct dma_chan *dma_chan_rx;
   127		u32 mmio_size;
   128		int irq;
   129		bool mhi_registered;
   130	};
   131	
   132	static int pci_epf_mhi_alloc_map(struct mhi_ep_cntrl *mhi_cntrl, u64 pci_addr,
   133					 phys_addr_t *phys_ptr, void __iomem **virt, size_t size)
   134	{
   135		struct pci_epf_mhi *epf_mhi = container_of(mhi_cntrl, struct pci_epf_mhi, mhi_cntrl);
   136		struct pci_epf *epf = epf_mhi->epf;
   137		struct pci_epc *epc = epf_mhi->epf->epc;
   138		size_t offset = pci_addr & (epc->mem->window.page_size - 1);
   139		void __iomem *virt_addr;
   140		phys_addr_t phys_addr;
   141		int ret;
   142	
   143		virt_addr = pci_epc_mem_alloc_addr(epc, &phys_addr, size + offset);
   144		if (!virt_addr)
   145			return -ENOMEM;
   146	
   147		ret = pci_epc_map_addr(epc, epf->func_no, epf->vfunc_no, phys_addr, pci_addr - offset, size + offset);
   148		if (ret) {
   149			pci_epc_mem_free_addr(epc, phys_addr, virt_addr, size + offset);
   150	
   151			return ret;
   152		}
   153	
   154		*phys_ptr = phys_addr + offset;
   155		*virt = virt_addr + offset;
   156	
   157		return 0;
   158	}
   159	
   160	static void pci_epf_mhi_unmap_free(struct mhi_ep_cntrl *mhi_cntrl, u64 pci_addr,
   161					   phys_addr_t phys_addr, void __iomem *virt_addr, size_t size)
   162	{
   163		struct pci_epf_mhi *epf_mhi = container_of(mhi_cntrl, struct pci_epf_mhi, mhi_cntrl);
   164		struct pci_epf *epf = epf_mhi->epf;
   165		struct pci_epc *epc = epf->epc;
   166		size_t offset = pci_addr & (epc->mem->window.page_size - 1);
   167	
   168		pci_epc_unmap_addr(epc, epf->func_no, epf->vfunc_no, phys_addr - offset);
   169		pci_epc_mem_free_addr(epc, phys_addr - offset, virt_addr - offset, size + offset);
   170	}
   171	
   172	void pci_epf_mhi_raise_irq(struct mhi_ep_cntrl *mhi_cntrl, u32 vector)
   173	{
   174		struct pci_epf_mhi *epf_mhi = container_of(mhi_cntrl, struct pci_epf_mhi, mhi_cntrl);
   175		struct pci_epf *epf = epf_mhi->epf;
   176		struct pci_epc *epc = epf->epc;
   177	
   178		/*
   179		 * Vector is incremented by 1 here as the DWC core will decrement it before
   180		 * writing to iATU.
   181		 */
   182		pci_epc_raise_irq(epc, epf->func_no, epf->vfunc_no, PCI_EPC_IRQ_MSI, vector + 1);
   183	}
   184	
 > 185	int pci_epf_mhi_iatu_read(struct mhi_ep_cntrl *mhi_cntrl, u64 from, void __iomem *to,
   186				  size_t size)
   187	{
   188		struct pci_epf_mhi *epf_mhi = container_of(mhi_cntrl, struct pci_epf_mhi, mhi_cntrl);
   189		struct pci_epf *epf = epf_mhi->epf;
   190		struct pci_epc *epc = epf_mhi->epf->epc;
   191		void __iomem *tre_buf;
   192		phys_addr_t tre_phys;
   193		size_t offset = from % 0x1000;
   194		int ret;
   195	
   196		mutex_lock(&epf_mhi->lock);
   197	
   198		tre_buf = pci_epc_mem_alloc_addr(epc, &tre_phys, size + offset);
   199		if (!tre_buf) {
   200			mutex_unlock(&epf_mhi->lock);
   201			return -ENOMEM;
   202		}
   203	
   204		ret = pci_epc_map_addr(epc, epf->func_no, epf->vfunc_no, tre_phys, from - offset,
   205				       size + offset);
   206		if (ret) {
   207			pci_epc_mem_free_addr(epc, tre_phys, tre_buf, size + offset);
   208			mutex_unlock(&epf_mhi->lock);
   209			return ret;
   210		}
   211	
   212		memcpy_fromio(to, tre_buf + offset, size);
   213	
   214		pci_epc_unmap_addr(epc, epf->func_no, epf->vfunc_no, tre_phys);
   215		pci_epc_mem_free_addr(epc, tre_phys, tre_buf, size + offset);
   216	
   217		mutex_unlock(&epf_mhi->lock);
   218	
   219		return 0;
   220	}
   221	
 > 222	int pci_epf_mhi_iatu_write(struct mhi_ep_cntrl *mhi_cntrl, void __iomem *from, u64 to,
   223				   size_t size)
   224	{
   225		struct pci_epf_mhi *epf_mhi = container_of(mhi_cntrl, struct pci_epf_mhi, mhi_cntrl);
   226		struct pci_epf *epf = epf_mhi->epf;
   227		struct pci_epc *epc = epf_mhi->epf->epc;
   228		void __iomem *tre_buf;
   229		phys_addr_t tre_phys;
   230		size_t offset = to % 0x1000;
   231		int ret;
   232	
   233		mutex_lock(&epf_mhi->lock);
   234	
   235		tre_buf = pci_epc_mem_alloc_addr(epc, &tre_phys, size + offset);
   236		if (!tre_buf) {
   237			mutex_unlock(&epf_mhi->lock);
   238			return -ENOMEM;
   239		}
   240	
   241		ret = pci_epc_map_addr(epc, epf->func_no, epf->vfunc_no, tre_phys, to - offset,
   242				       size + offset);
   243		if (ret) {
   244			pci_epc_mem_free_addr(epc, tre_phys, tre_buf, size + offset);
   245			mutex_unlock(&epf_mhi->lock);
   246			return ret;
   247		}
   248	
   249		memcpy_toio(tre_buf + offset, from, size);
   250	
   251		pci_epc_unmap_addr(epc, epf->func_no, epf->vfunc_no, tre_phys);
   252		pci_epc_mem_free_addr(epc, tre_phys, tre_buf, size + offset);
   253	
   254		mutex_unlock(&epf_mhi->lock);
   255	
   256		return 0;
   257	}
   258	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
