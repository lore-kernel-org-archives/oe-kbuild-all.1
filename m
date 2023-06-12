Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F375822D44
	for <oe-kbuild-all@lists.linux.dev>; Mon, 12 Jun 2023 22:02:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686607341; x=1718143341;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Fj9KWsCu8qAY7TaRTK2VlseduZabDyG7FQkgBKqCPCs=;
  b=TXU7Pkul5JEX31EdwMdUAYxlujdIi5tNOf/efygK0CAUz/G8vB8i4AIc
   tpM6Myk5emeHPySP91riQ/QWUO2VLt4hSoz0VAQ9HlaORD6FKqrZ24bk6
   xwv/4L4ZCBo542mFXJJM9PW0aGBPJ/7iHzp10aIxBLp2uZJgIQLucV1Jz
   bmCntesK8PBr6Uva7S7hz7e558RGmRNHPrxnxP2h5TgIKiZ7ZlneryM+3
   TF+GLnI8PJ0/pi1On/q6RozuYdjruUXcfnXENqEc2dTP+gqrHgKH2tkHD
   V05FY9XTadkJiW9/+ex+dTKkezn/waDkF1R7xHRhdy1jhh+jnp+YwHZU6
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10739"; a="358169314"
X-IronPort-AV: E=Sophos;i="6.00,236,1681196400"; 
   d="scan'208";a="358169314"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jun 2023 15:02:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10739"; a="688796336"
X-IronPort-AV: E=Sophos;i="6.00,236,1681196400"; 
   d="scan'208";a="688796336"
Received: from lkp-server01.sh.intel.com (HELO 211f47bdb1cb) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 12 Jun 2023 15:02:18 -0700
Received: from kbuild by 211f47bdb1cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q8pc9-0000ma-2o;
	Mon, 12 Jun 2023 22:02:17 +0000
Date: Tue, 13 Jun 2023 06:01:33 +0800
From: kernel test robot <lkp@intel.com>
To: Sarath Babu Naidu Gaddam <sarath.babu.naidu.gaddam@amd.com>
Cc: oe-kbuild-all@lists.linux.dev, git@amd.com,
	Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>
Subject: [xilinx-xlnx:lkp_test 3/3]
 xilinx_axienet_main.c:(.text.axienet_probe+0x16d8): undefined reference to
 `xilinx_vdma_channel_set_config'
Message-ID: <202306130511.T17IqGzi-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Xilinx/linux-xlnx lkp_test
head:   008dab8f0109b0f762a72a01e3ffa8a334ec447b
commit: 008dab8f0109b0f762a72a01e3ffa8a334ec447b [3/3] net: axienet: Introduce dmaengine support
config: mips-allyesconfig (https://download.01.org/0day-ci/archive/20230613/202306130511.T17IqGzi-lkp@intel.com/config)
compiler: mips-linux-gcc (GCC) 12.3.0
reproduce (this is a W=1 build):
        mkdir -p ~/bin
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/Xilinx/linux-xlnx/commit/008dab8f0109b0f762a72a01e3ffa8a334ec447b
        git remote add xilinx-xlnx https://github.com/Xilinx/linux-xlnx
        git fetch --no-tags xilinx-xlnx lkp_test
        git checkout 008dab8f0109b0f762a72a01e3ffa8a334ec447b
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.3.0 ~/bin/make.cross W=1 O=build_dir ARCH=mips olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.3.0 ~/bin/make.cross W=1 O=build_dir ARCH=mips SHELL=/bin/bash

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306130511.T17IqGzi-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/mips/kernel/head.o: in function `_stext':
   (.text+0x0): relocation truncated to fit: R_MIPS_26 against `kernel_entry'
   arch/mips/kernel/head.o: in function `smp_bootstrap':
   (.ref.text+0xd8): relocation truncated to fit: R_MIPS_26 against `start_secondary'
   init/main.o: in function `set_reset_devices':
   main.c:(.init.text+0x20): relocation truncated to fit: R_MIPS_26 against `_mcount'
   main.c:(.init.text+0x30): relocation truncated to fit: R_MIPS_26 against `__sanitizer_cov_trace_pc'
   init/main.o: in function `debug_kernel':
   main.c:(.init.text+0xa4): relocation truncated to fit: R_MIPS_26 against `_mcount'
   main.c:(.init.text+0xb4): relocation truncated to fit: R_MIPS_26 against `__sanitizer_cov_trace_pc'
   init/main.o: in function `quiet_kernel':
   main.c:(.init.text+0x128): relocation truncated to fit: R_MIPS_26 against `_mcount'
   main.c:(.init.text+0x138): relocation truncated to fit: R_MIPS_26 against `__sanitizer_cov_trace_pc'
   init/main.o: in function `warn_bootconfig':
   main.c:(.init.text+0x1ac): relocation truncated to fit: R_MIPS_26 against `_mcount'
   main.c:(.init.text+0x1bc): relocation truncated to fit: R_MIPS_26 against `__sanitizer_cov_trace_pc'
   init/main.o: in function `init_setup':
   main.c:(.init.text+0x230): additional relocation overflows omitted from the output
   mips-linux-ld: drivers/net/ethernet/xilinx/xilinx_axienet_main.o: in function `axienet_probe':
>> xilinx_axienet_main.c:(.text.axienet_probe+0x16d8): undefined reference to `xilinx_vdma_channel_set_config'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
