Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70DBC2F2C
	for <oe-kbuild-all@lists.linux.dev>; Fri, 24 Mar 2023 19:19:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679685572; x=1711221572;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=8/qKiew+054cPBw+Sm/N1rAXXMte7nVvjOewX9qKU+8=;
  b=Cu+7rnVGLHQcOj404RtHMQDzxSjKhAWfrbJMfmMfxRjijDiICks1ghjm
   HCueQTHFrNthAkTKxVAAWPkJ147SUP6onUgSwyeGKqinNrgYrsxzm8PBP
   bHcvBLJN0ly5U2h72cKWVboCOADO70C3BDPxmeTPJyL4NXRtNa4TJn1/v
   T94GgVe7SAna2stnhMWysxdzgUUG1c5V7tiPiB/MHvwKneMIhUSp2RRdq
   S7BDvAzbKjasUjY6Zr+HImiA6D5vxOpRHJrPLqaWeNyNVyDTMVsb8nkXU
   a+q/HsGOU7+i4Fmg5OOOrvTWfboXNBUdtFxaIijL26Cd4sqzMA2JYTcB7
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10659"; a="339890999"
X-IronPort-AV: E=Sophos;i="5.98,288,1673942400"; 
   d="scan'208";a="339890999"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Mar 2023 12:19:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10659"; a="715355577"
X-IronPort-AV: E=Sophos;i="5.98,288,1673942400"; 
   d="scan'208";a="715355577"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 24 Mar 2023 12:19:30 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pfmwj-000Fax-1c;
	Fri, 24 Mar 2023 19:19:29 +0000
Date: Sat, 25 Mar 2023 03:18:38 +0800
From: kernel test robot <lkp@intel.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [arm-integrator:virt-to-pfn-v6.3-rc3-redux 6/8]
 drivers/tee/tee_shm.c:35:16: sparse: sparse: incorrect type in argument 1
 (different base types)
Message-ID: <202303250333.lWWO1e3x-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-integrator.git virt-to-pfn-v6.3-rc3-redux
head:   b5fe3402030c1ea066167108866fd21881895594
commit: 1df3431f995d6bb7a731770a7393c3011b52a581 [6/8] ARM: mm: Make virt_to_pfn() a static inline
config: arm-randconfig-s053-20230322 (https://download.01.org/0day-ci/archive/20230325/202303250333.lWWO1e3x-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.1.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.4-39-gce1a6720-dirty
        # https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-integrator.git/commit/?id=1df3431f995d6bb7a731770a7393c3011b52a581
        git remote add arm-integrator https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-integrator.git
        git fetch --no-tags arm-integrator virt-to-pfn-v6.3-rc3-redux
        git checkout 1df3431f995d6bb7a731770a7393c3011b52a581
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=arm olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=arm SHELL=/bin/bash drivers/gpu/drm/ drivers/tee/ kernel/trace/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303250333.lWWO1e3x-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/tee/tee_shm.c:35:16: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected void const *p @@     got unsigned long start @@
   drivers/tee/tee_shm.c:35:16: sparse:     expected void const *p
   drivers/tee/tee_shm.c:35:16: sparse:     got unsigned long start
--
   drivers/gpu/drm/drm_client.c: note: in included file (through arch/arm/include/asm/io.h, include/linux/io.h, include/linux/iosys-map.h):
   arch/arm/include/asm/memory.h:384:9: sparse: sparse: preprocessor token ARCH_PFN_OFFSET redefined
   drivers/gpu/drm/drm_client.c: note: in included file (through arch/arm/include/asm/page.h, arch/arm/include/asm/memory.h, arch/arm/include/asm/io.h, ...):
>> include/asm-generic/memory_model.h:15:9: sparse: this was the original definition
--
   drivers/gpu/drm/drm_gem.c: note: in included file (through arch/arm/include/asm/io.h, include/linux/io.h, include/linux/iosys-map.h, ...):
   arch/arm/include/asm/memory.h:384:9: sparse: sparse: preprocessor token ARCH_PFN_OFFSET redefined
   drivers/gpu/drm/drm_gem.c: note: in included file (through arch/arm/include/asm/page.h, arch/arm/include/asm/memory.h, arch/arm/include/asm/io.h, ...):
>> include/asm-generic/memory_model.h:15:9: sparse: this was the original definition
--
   drivers/gpu/drm/drm_print.c: note: in included file (through arch/arm/include/asm/io.h, include/linux/io.h):
   arch/arm/include/asm/memory.h:384:9: sparse: sparse: preprocessor token ARCH_PFN_OFFSET redefined
   drivers/gpu/drm/drm_print.c: note: in included file (through arch/arm/include/asm/page.h, arch/arm/include/asm/memory.h, arch/arm/include/asm/io.h, ...):
>> include/asm-generic/memory_model.h:15:9: sparse: this was the original definition
--
   drivers/gpu/drm/drm_prime.c: note: in included file (through arch/arm/include/asm/io.h, include/linux/io.h, include/linux/iosys-map.h, ...):
   arch/arm/include/asm/memory.h:384:9: sparse: sparse: preprocessor token ARCH_PFN_OFFSET redefined
   drivers/gpu/drm/drm_prime.c: note: in included file (through arch/arm/include/asm/page.h, arch/arm/include/asm/memory.h, arch/arm/include/asm/io.h, ...):
>> include/asm-generic/memory_model.h:15:9: sparse: this was the original definition
--
   drivers/gpu/drm/drm_gem_dma_helper.c: note: in included file (through arch/arm/include/asm/io.h, include/linux/io.h, include/linux/iosys-map.h, ...):
   arch/arm/include/asm/memory.h:384:9: sparse: sparse: preprocessor token ARCH_PFN_OFFSET redefined
   drivers/gpu/drm/drm_gem_dma_helper.c: note: in included file (through arch/arm/include/asm/page.h, arch/arm/include/asm/memory.h, arch/arm/include/asm/io.h, ...):
>> include/asm-generic/memory_model.h:15:9: sparse: this was the original definition
--
   drivers/gpu/drm/drm_gem_shmem_helper.c: note: in included file (through arch/arm/include/asm/io.h, include/linux/io.h, include/linux/iosys-map.h, ...):
   arch/arm/include/asm/memory.h:384:9: sparse: sparse: preprocessor token ARCH_PFN_OFFSET redefined
   drivers/gpu/drm/drm_gem_shmem_helper.c: note: in included file (through arch/arm/include/asm/page.h, arch/arm/include/asm/memory.h, arch/arm/include/asm/io.h, ...):
>> include/asm-generic/memory_model.h:15:9: sparse: this was the original definition
--
   drivers/gpu/drm/drm_format_helper.c: note: in included file (through arch/arm/include/asm/io.h, include/linux/io.h):
   arch/arm/include/asm/memory.h:384:9: sparse: sparse: preprocessor token ARCH_PFN_OFFSET redefined
   drivers/gpu/drm/drm_format_helper.c: note: in included file (through arch/arm/include/asm/page.h, arch/arm/include/asm/memory.h, arch/arm/include/asm/io.h, ...):
>> include/asm-generic/memory_model.h:15:9: sparse: this was the original definition
--
   drivers/gpu/drm/arm/display/komeda/komeda_dev.c: note: in included file (through arch/arm/include/asm/io.h, include/linux/io.h):
   arch/arm/include/asm/memory.h:384:9: sparse: sparse: preprocessor token ARCH_PFN_OFFSET redefined
   drivers/gpu/drm/arm/display/komeda/komeda_dev.c: note: in included file (through arch/arm/include/asm/page.h, arch/arm/include/asm/memory.h, arch/arm/include/asm/io.h, ...):
>> include/asm-generic/memory_model.h:15:9: sparse: this was the original definition
--
   drivers/gpu/drm/bridge/cadence/cdns-dsi-j721e.c: note: in included file (through arch/arm/include/asm/io.h, include/linux/io.h):
   arch/arm/include/asm/memory.h:384:9: sparse: sparse: preprocessor token ARCH_PFN_OFFSET redefined
   drivers/gpu/drm/bridge/cadence/cdns-dsi-j721e.c: note: in included file (through arch/arm/include/asm/page.h, arch/arm/include/asm/memory.h, arch/arm/include/asm/io.h, ...):
>> include/asm-generic/memory_model.h:15:9: sparse: this was the original definition
--
   drivers/gpu/drm/bridge/synopsys/dw-hdmi-gp-audio.c: note: in included file (through arch/arm/include/asm/io.h, include/linux/io.h):
   arch/arm/include/asm/memory.h:384:9: sparse: sparse: preprocessor token ARCH_PFN_OFFSET redefined
   drivers/gpu/drm/bridge/synopsys/dw-hdmi-gp-audio.c: note: in included file (through arch/arm/include/asm/page.h, arch/arm/include/asm/memory.h, arch/arm/include/asm/io.h, ...):
>> include/asm-generic/memory_model.h:15:9: sparse: this was the original definition
--
   drivers/gpu/drm/v3d/v3d_bo.c: note: in included file (through arch/arm/include/asm/io.h, include/linux/io.h, include/linux/iosys-map.h, ...):
   arch/arm/include/asm/memory.h:384:9: sparse: sparse: preprocessor token ARCH_PFN_OFFSET redefined
   drivers/gpu/drm/v3d/v3d_bo.c: note: in included file (through arch/arm/include/asm/page.h, arch/arm/include/asm/memory.h, arch/arm/include/asm/io.h, ...):
>> include/asm-generic/memory_model.h:15:9: sparse: this was the original definition
--
   drivers/gpu/drm/vkms/vkms_plane.c: note: in included file (through arch/arm/include/asm/io.h, include/linux/io.h, include/linux/iosys-map.h):
   arch/arm/include/asm/memory.h:384:9: sparse: sparse: preprocessor token ARCH_PFN_OFFSET redefined
   drivers/gpu/drm/vkms/vkms_plane.c: note: in included file (through arch/arm/include/asm/page.h, arch/arm/include/asm/memory.h, arch/arm/include/asm/io.h, ...):
>> include/asm-generic/memory_model.h:15:9: sparse: this was the original definition
--
   drivers/gpu/drm/vkms/vkms_writeback.c: note: in included file (through arch/arm/include/asm/io.h, include/linux/io.h, include/linux/iosys-map.h):
   arch/arm/include/asm/memory.h:384:9: sparse: sparse: preprocessor token ARCH_PFN_OFFSET redefined
   drivers/gpu/drm/vkms/vkms_writeback.c: note: in included file (through arch/arm/include/asm/page.h, arch/arm/include/asm/memory.h, arch/arm/include/asm/io.h, ...):
>> include/asm-generic/memory_model.h:15:9: sparse: this was the original definition
--
   drivers/gpu/drm/armada/armada_gem.c: note: in included file (through arch/arm/include/asm/io.h, include/linux/io.h, include/linux/iosys-map.h, ...):
   arch/arm/include/asm/memory.h:384:9: sparse: sparse: preprocessor token ARCH_PFN_OFFSET redefined
   drivers/gpu/drm/armada/armada_gem.c: note: in included file (through arch/arm/include/asm/page.h, arch/arm/include/asm/memory.h, arch/arm/include/asm/io.h, ...):
>> include/asm-generic/memory_model.h:15:9: sparse: this was the original definition
   drivers/gpu/drm/armada/armada_gem.c:63:37: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void volatile [noderef] __iomem *io_addr @@     got void *addr @@
   drivers/gpu/drm/armada/armada_gem.c:63:37: sparse:     expected void volatile [noderef] __iomem *io_addr
   drivers/gpu/drm/armada/armada_gem.c:63:37: sparse:     got void *addr
   drivers/gpu/drm/armada/armada_gem.c:185:28: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void *addr @@     got void [noderef] __iomem * @@
   drivers/gpu/drm/armada/armada_gem.c:185:28: sparse:     expected void *addr
   drivers/gpu/drm/armada/armada_gem.c:185:28: sparse:     got void [noderef] __iomem *
--
   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dspp.c: note: in included file (through arch/arm/include/asm/io.h, include/linux/io.h, drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h, ...):
   arch/arm/include/asm/memory.h:384:9: sparse: sparse: preprocessor token ARCH_PFN_OFFSET redefined
   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dspp.c: note: in included file (through arch/arm/include/asm/page.h, arch/arm/include/asm/memory.h, arch/arm/include/asm/io.h, ...):
>> include/asm-generic/memory_model.h:15:9: sparse: this was the original definition
--
   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c: note: in included file (through arch/arm/include/asm/io.h, include/linux/io.h, drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h, ...):
   arch/arm/include/asm/memory.h:384:9: sparse: sparse: preprocessor token ARCH_PFN_OFFSET redefined
   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c: note: in included file (through arch/arm/include/asm/page.h, arch/arm/include/asm/memory.h, arch/arm/include/asm/io.h, ...):
>> include/asm-generic/memory_model.h:15:9: sparse: this was the original definition
--
   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c: note: in included file (through arch/arm/include/asm/io.h, include/linux/io.h, drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h, ...):
   arch/arm/include/asm/memory.h:384:9: sparse: sparse: preprocessor token ARCH_PFN_OFFSET redefined
   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c: note: in included file (through arch/arm/include/asm/page.h, arch/arm/include/asm/memory.h, arch/arm/include/asm/io.h, ...):
>> include/asm-generic/memory_model.h:15:9: sparse: this was the original definition
--
   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c: note: in included file (through arch/arm/include/asm/io.h, include/linux/io.h, drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h, ...):
   arch/arm/include/asm/memory.h:384:9: sparse: sparse: preprocessor token ARCH_PFN_OFFSET redefined
   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c: note: in included file (through arch/arm/include/asm/page.h, arch/arm/include/asm/memory.h, arch/arm/include/asm/io.h, ...):
>> include/asm-generic/memory_model.h:15:9: sparse: this was the original definition
--
   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_vbif.c: note: in included file (through arch/arm/include/asm/io.h, include/linux/io.h, drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h, ...):
   arch/arm/include/asm/memory.h:384:9: sparse: sparse: preprocessor token ARCH_PFN_OFFSET redefined
   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_vbif.c: note: in included file (through arch/arm/include/asm/page.h, arch/arm/include/asm/memory.h, arch/arm/include/asm/io.h, ...):
>> include/asm-generic/memory_model.h:15:9: sparse: this was the original definition
--
   drivers/gpu/drm/msm/msm_gem_prime.c: note: in included file (through arch/arm/include/asm/io.h, include/linux/io.h, include/linux/iosys-map.h, ...):
   arch/arm/include/asm/memory.h:384:9: sparse: sparse: preprocessor token ARCH_PFN_OFFSET redefined
   drivers/gpu/drm/msm/msm_gem_prime.c: note: in included file (through arch/arm/include/asm/page.h, arch/arm/include/asm/memory.h, arch/arm/include/asm/io.h, ...):
>> include/asm-generic/memory_model.h:15:9: sparse: this was the original definition

vim +35 drivers/tee/tee_shm.c

53e16519c2eccd Jens Wiklander 2022-02-04  24  
53e16519c2eccd Jens Wiklander 2022-02-04  25  static int shm_get_kernel_pages(unsigned long start, size_t page_count,
53e16519c2eccd Jens Wiklander 2022-02-04  26  				struct page **pages)
53e16519c2eccd Jens Wiklander 2022-02-04  27  {
0249a75b365911 Ira Weiny      2023-02-03  28  	struct page *page;
53e16519c2eccd Jens Wiklander 2022-02-04  29  	size_t n;
53e16519c2eccd Jens Wiklander 2022-02-04  30  
0249a75b365911 Ira Weiny      2023-02-03  31  	if (WARN_ON_ONCE(is_vmalloc_addr((void *)start) ||
0249a75b365911 Ira Weiny      2023-02-03  32  			 is_kmap_addr((void *)start)))
c83900393aa133 Ira Weiny      2023-02-03  33  		return -EINVAL;
3e47235eaee094 Phil Chang     2022-02-25  34  
0249a75b365911 Ira Weiny      2023-02-03 @35  	page = virt_to_page(start);
53e16519c2eccd Jens Wiklander 2022-02-04  36  	for (n = 0; n < page_count; n++) {
0249a75b365911 Ira Weiny      2023-02-03  37  		pages[n] = page + n;
0249a75b365911 Ira Weiny      2023-02-03  38  		get_page(pages[n]);
53e16519c2eccd Jens Wiklander 2022-02-04  39  	}
53e16519c2eccd Jens Wiklander 2022-02-04  40  
0249a75b365911 Ira Weiny      2023-02-03  41  	return page_count;
4300cd6374a519 John Hubbard   2020-08-24  42  }
4300cd6374a519 John Hubbard   2020-08-24  43  

:::::: The code at line 35 was first introduced by commit
:::::: 0249a75b365911f91b87935bc08a4795a6fa7dd0 tee: Remove call to get_kernel_pages()

:::::: TO: Ira Weiny <ira.weiny@intel.com>
:::::: CC: Jens Wiklander <jens.wiklander@linaro.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
