Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6360C320C
	for <oe-kbuild-all@lists.linux.dev>; Fri, 28 Apr 2023 21:30:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682717447; x=1714253447;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=W+cDeZBugAbFyvLxMgn9CekOcDR/RHSF2Lw6ZvMnv0s=;
  b=mOsIUQ9qOdR68/KSS+3Cd3QoRDGLPrBoSxyvV2JdodonG0mWRALHZioA
   yZSUZeVJy/vwACaWNiMhE84w7M9tuqMY+hEyqroDlGd8ACk5mNk7Xj/+x
   Fok0Tuz0mg7am+bi1YbzjueD/JbJnoXTHbxwPhrNaL7+ThFrc3o7zhZFB
   GBqi+xIScFRGGKaqiH6/P7dCxYdeQxqXX6+jNxdo97LmzOE3ecEbsewD3
   I8sNgoJGt5iUEzsrmkccD/C8EnI6+x7cXsLb43D0fK3KhF6KLY3uM/JUV
   4JuuxVkc2fgL9EoNKuEEwIdAZNEHhuP+2c3r2ATzyx+ZwXwk7hY6e429v
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10694"; a="332187644"
X-IronPort-AV: E=Sophos;i="5.99,235,1677571200"; 
   d="scan'208";a="332187644"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Apr 2023 14:30:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10694"; a="819152371"
X-IronPort-AV: E=Sophos;i="5.99,235,1677571200"; 
   d="scan'208";a="819152371"
Received: from lkp-server01.sh.intel.com (HELO 5bad9d2b7fcb) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 28 Apr 2023 14:30:45 -0700
Received: from kbuild by 5bad9d2b7fcb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1psVfw-0000hZ-2X;
	Fri, 28 Apr 2023 21:30:44 +0000
Date: Sat, 29 Apr 2023 05:30:36 +0800
From: kernel test robot <lkp@intel.com>
To: Darren Etheridge <detheridge@ti.com>
Cc: oe-kbuild-all@lists.linux.dev, vigneshr@ti.com, nm@ti.com,
	Praneeth Bajjuri <praneeth@ti.com>
Subject: [ti:ti-rt-linux-6.1.y-cicd 62/70] ERROR: modpost: "__aeabi_uldivmod"
 [drivers/media/platform/img/vxe-vxd/vxd-dec.ko] undefined!
Message-ID: <202304290558.SrjWbyMg-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git ti-rt-linux-6.1.y-cicd
head:   d0673ae878bb78807f65a6021cd9642d6d45bb93
commit: 3b23f836c2ec0541aea62823eeed7f2bbe88dc43 [62/70] media: platform: img: add the vxe-vxd driver into the build infra
config: arm-allmodconfig (https://download.01.org/0day-ci/archive/20230429/202304290558.SrjWbyMg-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        git remote add ti git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git
        git fetch --no-tags ti ti-rt-linux-6.1.y-cicd
        git checkout 3b23f836c2ec0541aea62823eeed7f2bbe88dc43
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304290558.SrjWbyMg-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

WARNING: modpost: module dma-buf-phys uses symbol dma_buf_unmap_attachment from namespace DMA_BUF, but does not import it.
WARNING: modpost: module dma-buf-phys uses symbol dma_buf_detach from namespace DMA_BUF, but does not import it.
WARNING: modpost: module dma-buf-phys uses symbol dma_buf_put from namespace DMA_BUF, but does not import it.
WARNING: modpost: module dma-buf-phys uses symbol dma_buf_get from namespace DMA_BUF, but does not import it.
WARNING: modpost: module dma-buf-phys uses symbol dma_buf_attach from namespace DMA_BUF, but does not import it.
WARNING: modpost: module dma-buf-phys uses symbol dma_buf_map_attachment from namespace DMA_BUF, but does not import it.
>> ERROR: modpost: "__aeabi_uldivmod" [drivers/media/platform/img/vxe-vxd/vxd-dec.ko] undefined!
>> ERROR: modpost: "__aeabi_ldivmod" [drivers/media/platform/img/vxe-vxd/vxd-dec.ko] undefined!
>> ERROR: modpost: "__aeabi_uldivmod" [drivers/media/platform/img/vxe-vxd/vxe-enc.ko] undefined!
>> ERROR: modpost: "__aeabi_ldivmod" [drivers/media/platform/img/vxe-vxd/vxe-enc.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
