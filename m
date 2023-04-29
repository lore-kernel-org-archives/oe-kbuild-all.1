Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE2C32116
	for <oe-kbuild-all@lists.linux.dev>; Sat, 29 Apr 2023 06:55:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682751358; x=1714287358;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=tMmMphvZFWdUM7rsTmgjWEJo8zjR3j1Jjcubt3fDUe0=;
  b=K5Oz+g/c//JFOkftNvA2iqmI+hYWdsONvlyRg6E3YCJs/4yC6mBPDQxw
   LCVJnPhvrO+hiTpRhfyIzSGFbiyDV5dBbMCPVSLVDOcB2/fhbMt60xMFW
   tzNUj7CUI1u1X1cUPY2jreuQBfVlUh4gk4ZqPwdjiDS+rFAzfKZ/KUR+q
   PWVKuGiurxMKAFGq4YNhNKE7HZ4rqrKKsMFttIGrR6tumX4n/LBRGbNbm
   EKUcuH/UEAXz9eZoSf4yVtAQB2aWn5HIgSGt9dp/CfCzGIxvuiKoK9gVs
   oeOEHqpWySZn4RxnyjxVz0KCYaStFyAbULtFPaNYaUZKXNXifUPvFHbsu
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10694"; a="349947598"
X-IronPort-AV: E=Sophos;i="5.99,236,1677571200"; 
   d="scan'208";a="349947598"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Apr 2023 23:55:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10694"; a="806713951"
X-IronPort-AV: E=Sophos;i="5.99,236,1677571200"; 
   d="scan'208";a="806713951"
Received: from lkp-server01.sh.intel.com (HELO 5bad9d2b7fcb) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 28 Apr 2023 23:55:56 -0700
Received: from kbuild by 5bad9d2b7fcb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pseUt-0000yP-2h;
	Sat, 29 Apr 2023 06:55:55 +0000
Date: Sat, 29 Apr 2023 14:55:11 +0800
From: kernel test robot <lkp@intel.com>
To: Pratyush Yadav <p.yadav@ti.com>
Cc: oe-kbuild-all@lists.linux.dev, vigneshr@ti.com, nm@ti.com
Subject: [ti:ti-rt-linux-6.1.y-cicd 323/382] spi-cadence-quadspi.c:undefined
 reference to `spi_mem_exec_op'
Message-ID: <202304291442.3WgDFlPA-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git ti-rt-linux-6.1.y-cicd
head:   5b69be59af422fe55a3cee133b337b1027cb98c3
commit: 4535fc8cd288f5c537ff9b8abe0e3131a0ebcc98 [323/382] spi: cadence-qspi: Tune PHY to allow running at higher frequencies
config: arm-randconfig-r036-20230428 (https://download.01.org/0day-ci/archive/20230429/202304291442.3WgDFlPA-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        git remote add ti git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git
        git fetch --no-tags ti ti-rt-linux-6.1.y-cicd
        git checkout 4535fc8cd288f5c537ff9b8abe0e3131a0ebcc98
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304291442.3WgDFlPA-lkp@intel.com/

All errors (new ones prefixed by >>):

   arm-linux-gnueabi-ld: drivers/misc/dma-buf-phys.o: in function `dma_buf_phys_release':
   dma-buf-phys.c:(.text+0x24): undefined reference to `dma_buf_unmap_attachment'
   arm-linux-gnueabi-ld: dma-buf-phys.c:(.text+0x30): undefined reference to `dma_buf_detach'
   arm-linux-gnueabi-ld: dma-buf-phys.c:(.text+0x38): undefined reference to `dma_buf_put'
   arm-linux-gnueabi-ld: drivers/misc/dma-buf-phys.o: in function `dma_buf_phys_ioctl':
   dma-buf-phys.c:(.text+0x144): undefined reference to `dma_buf_get'
   arm-linux-gnueabi-ld: dma-buf-phys.c:(.text+0x156): undefined reference to `dma_buf_attach'
   arm-linux-gnueabi-ld: dma-buf-phys.c:(.text+0x166): undefined reference to `dma_buf_put'
   arm-linux-gnueabi-ld: dma-buf-phys.c:(.text+0x16e): undefined reference to `dma_buf_map_attachment'
   arm-linux-gnueabi-ld: dma-buf-phys.c:(.text+0x180): undefined reference to `dma_buf_detach'
   arm-linux-gnueabi-ld: dma-buf-phys.c:(.text+0x190): undefined reference to `dma_buf_unmap_attachment'
   arm-linux-gnueabi-ld: drivers/spi/spi-cadence-quadspi.o: in function `cqspi_phy_check_pattern':
>> spi-cadence-quadspi.c:(.text+0x3fe): undefined reference to `spi_mem_exec_op'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
