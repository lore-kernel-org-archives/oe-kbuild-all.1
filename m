Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88D87624
	for <oe-kbuild-all@lists.linux.dev>; Thu, 11 May 2023 20:31:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683837113; x=1715373113;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=soE/vVtElS/LM63APB4xtMFkMs+Y1G9NaRHLAcCBO/4=;
  b=GKLSdoIo9J/b5VhvdbKLJU5dStwFPlmVWEVVpuIn0Nq4UO2ZS9uVpuU+
   enZkwtueJcdku0pdO2ola+9OOeeLUq1i5yJnNBD3VNdJ8LlfEvnj5YsQy
   W70CijvjAerGCikvhmPIGw+ULEfQmw7pb5JcpYQBfKIcwqbLyM6PBzHP7
   nQk+ZcgOlT8X24BpbGkvB5s74IuE2hgZcxhGgEG4nAJ2H4R0XT6GGvkB7
   1A8jbaSrfYlykAIR5eJumx/VJ5IdPv0g17P/Mdv0CKTWdMlCj5mlsOdpo
   DnzyFn/v9qkAqiLrY2Wcj8G1PAgDTuy8/zr1e/nPEK0jDk153h4eYBDs0
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10707"; a="353741716"
X-IronPort-AV: E=Sophos;i="5.99,268,1677571200"; 
   d="scan'208";a="353741716"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 May 2023 13:31:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10707"; a="874118718"
X-IronPort-AV: E=Sophos;i="5.99,268,1677571200"; 
   d="scan'208";a="874118718"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 11 May 2023 13:31:52 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pxCx5-0004Ey-0o;
	Thu, 11 May 2023 20:31:51 +0000
Date: Fri, 12 May 2023 04:30:54 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com,
	Guenter Roeck <groeck@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-6.1 413/415] ld.lld: error: undefined symbol:
 fhctl_parse_dt
Message-ID: <202305120419.rsGwvT7p-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-6.1
head:   05f325ba73111fe95321062ed6207dff7fcd7399
commit: c5c3f8b409530ff3b52199af84699d6a0313625a [413/415] UPSTREAM: clk: mediatek: mt8173: Add support for frequency hopping through FHCTL
config: riscv-randconfig-r042-20230509 (https://download.01.org/0day-ci/archive/20230512/202305120419.rsGwvT7p-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project b0fb98227c90adf2536c9ad644a74d5e92961111)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        git remote add chrome-os https://chromium.googlesource.com/chromiumos/third_party/kernel
        git fetch --no-tags chrome-os chromeos-6.1
        git checkout c5c3f8b409530ff3b52199af84699d6a0313625a
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202305120419.rsGwvT7p-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: fhctl_parse_dt
   >>> referenced by clk-mt8173-apmixedsys.c
   >>>               drivers/clk/mediatek/clk-mt8173-apmixedsys.o:(clk_mt8173_apmixed_probe) in archive vmlinux.a
--
>> ld.lld: error: undefined symbol: mtk_clk_register_pllfhs
   >>> referenced by clk-mt8173-apmixedsys.c
   >>>               drivers/clk/mediatek/clk-mt8173-apmixedsys.o:(clk_mt8173_apmixed_probe) in archive vmlinux.a
--
>> ld.lld: error: undefined symbol: mtk_clk_unregister_pllfhs
   >>> referenced by clk-mt8173-apmixedsys.c
   >>>               drivers/clk/mediatek/clk-mt8173-apmixedsys.o:(clk_mt8173_apmixed_probe) in archive vmlinux.a
   >>> referenced by clk-mt8173-apmixedsys.c
   >>>               drivers/clk/mediatek/clk-mt8173-apmixedsys.o:(clk_mt8173_apmixed_remove) in archive vmlinux.a

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
