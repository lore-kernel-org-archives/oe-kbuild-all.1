Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AF589446
	for <oe-kbuild-all@lists.linux.dev>; Fri, 17 Feb 2023 17:48:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676656112; x=1708192112;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=4Q+O/J7jtWjISNPXkSpHLsHKeC8+Qck4M1zZknDD4j4=;
  b=JsxM5/6A+T0YGXv0cUGfwa8OZcF2QaAoFVzHIqKl4TH1WXtfSNY4DIa2
   U9FWafjKajXCk3mto3oLumEzaaWUuKyDJr7F9NZ4+n5RfgmgoCRpBdwi4
   xaSq4o/hMHrI3CeTDmDRVTdRXcc2jV5P12BFI2rDTSfGDCO9RbMKyB9QK
   msr5fyS3Xx9Ql46pCCWysk62BxkpX32cDoEfkws6da+qW0NDvSEkuAgGN
   dbuIc+aoi/zzmhhuVXwuHEmDW7QSrKtTA1Rs8yMPXKqwZoSWsZ7ZB7IvQ
   1m0kBGxWvFsXrQFjDlQbOdPDufOzmhZWmmMpOr25fTFPN6lFHiO1jCoHd
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10624"; a="396722165"
X-IronPort-AV: E=Sophos;i="5.97,306,1669104000"; 
   d="scan'208";a="396722165"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Feb 2023 09:48:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10624"; a="620458826"
X-IronPort-AV: E=Sophos;i="5.97,306,1669104000"; 
   d="scan'208";a="620458826"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 17 Feb 2023 09:48:29 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pT4qS-000Bgv-2S;
	Fri, 17 Feb 2023 17:48:28 +0000
Date: Sat, 18 Feb 2023 01:48:06 +0800
From: kernel test robot <lkp@intel.com>
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [krzk-github:n/audio-wsa884x-on-top-of-audio-wsa881x-gpio 194/615]
 drivers/pci/endpoint/functions/pci-epf-mhi.c:185:5: warning: no previous
 prototype for 'pci_epf_mhi_iatu_read'
Message-ID: <202302180158.V2u8TtCH-lkp@intel.com>
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
commit: cf705be7d17a786ef3ecf2f2de76728aaded97d2 [194/615] PCI: endpoint: epf-mhi: Add eDMA support
config: sparc-allyesconfig (https://download.01.org/0day-ci/archive/20230218/202302180158.V2u8TtCH-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/krzk/linux/commit/cf705be7d17a786ef3ecf2f2de76728aaded97d2
        git remote add krzk-github https://github.com/krzk/linux
        git fetch --no-tags krzk-github n/audio-wsa884x-on-top-of-audio-wsa881x-gpio
        git checkout cf705be7d17a786ef3ecf2f2de76728aaded97d2
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=sparc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=sparc SHELL=/bin/bash drivers/pci/endpoint/functions/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302180158.V2u8TtCH-lkp@intel.com/

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
                    from ./arch/sparc/include/generated/asm/rwonce.h:1,
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
   drivers/pci/endpoint/functions/pci-epf-mhi.c:460:14: error: 'CORE_INIT' undeclared (first use in this function); did you mean 'MTREE_INIT'?
     460 |         case CORE_INIT:
         |              ^~~~~~~~~
         |              MTREE_INIT
   drivers/pci/endpoint/functions/pci-epf-mhi.c:460:14: note: each undeclared identifier is reported only once for each function it appears in
   drivers/pci/endpoint/functions/pci-epf-mhi.c:485:14: error: 'LINK_UP' undeclared (first use in this function)
     485 |         case LINK_UP:
         |              ^~~~~~~
   drivers/pci/endpoint/functions/pci-epf-mhi.c:525:14: error: 'LINK_DOWN' undeclared (first use in this function); did you mean 'ALIGN_DOWN'?
     525 |         case LINK_DOWN:
         |              ^~~~~~~~~
         |              ALIGN_DOWN
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
