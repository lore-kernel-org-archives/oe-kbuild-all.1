Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 990202574
	for <oe-kbuild-all@lists.linux.dev>; Fri, 21 Apr 2023 09:41:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682070074; x=1713606074;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=EkbiBvAQOTU6KAHuxolZdVpn2+V8Q/8B1eCLx/p+1cs=;
  b=mxoiL4hmhnbfhNkAtD0Pf6q/6GSoI3CdlCil9tFzKqgUsGY4kora1Mas
   HcXoV2oMmk1YJBHdtdUMztQAWI5h/jTaaOyBjK8cUnGYAc0/wHgJvr5GB
   Bgsk+J51aBhXK1t2EgUaSfkFV6iB1dCpXBh7pdltJw3SmVjq3oipDsDgR
   rVGsGTLP48y4wnSRxmL3yNx8eZPbTFyffCJVD/A1jUV7ASVO5Dd9XXv5I
   4Ihz8722+TtIq/rDJotAYHOG0qn99eXjircwizh8FgnGlEx14gsyfSaLd
   hZOdHqnmHE64Im6fUMzivYZwsDJdiDNfYLhm0jskkgG2jE42EH9Tm/V10
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10686"; a="347856538"
X-IronPort-AV: E=Sophos;i="5.99,214,1677571200"; 
   d="scan'208";a="347856538"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Apr 2023 02:41:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10686"; a="816365876"
X-IronPort-AV: E=Sophos;i="5.99,214,1677571200"; 
   d="scan'208";a="816365876"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 21 Apr 2023 02:41:10 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ppnGP-000gUy-38;
	Fri, 21 Apr 2023 09:41:09 +0000
Date: Fri, 21 Apr 2023 17:40:21 +0800
From: kernel test robot <lkp@intel.com>
To: Minghao Chi <chi.minghao@zte.com.cn>
Cc: oe-kbuild-all@lists.linux.dev,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Mark Brown <broonie@kernel.org>, Sasha Levin <sashal@kernel.org>
Subject: [stable:linux-4.14.y 1753/4521] spi-tegra20-slink.c:undefined
 reference to `clk_set_rate'
Message-ID: <202304211746.gDcbqjuq-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Minghao,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git linux-4.14.y
head:   df06e352f27a9f368ec6a3b077881c35d933e32c
commit: 29b0cbee425c70b9928f94dcf6ed75cd967c2451 [1753/4521] spi: tegra20: Use of_device_get_match_data()
config: m68k-randconfig-c034-20230417 (https://download.01.org/0day-ci/archive/20230421/202304211746.gDcbqjuq-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 7.5.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git/commit/?id=29b0cbee425c70b9928f94dcf6ed75cd967c2451
        git remote add stable https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git
        git fetch --no-tags stable linux-4.14.y
        git checkout 29b0cbee425c70b9928f94dcf6ed75cd967c2451
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-7.5.0 make.cross W=1 O=build_dir ARCH=m68k olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-7.5.0 make.cross W=1 O=build_dir ARCH=m68k SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304211746.gDcbqjuq-lkp@intel.com/

All errors (new ones prefixed by >>):

   m68k-linux-ld: section .rodata VMA [0000000000002000,00000000001bdde7] overlaps section .text VMA [0000000000000400,00000000004a211f]
   drivers/tty/serial/mxs-auart.o: In function `mxs_auart_probe':
   mxs-auart.c:(.text+0x1076): undefined reference to `clk_set_rate'
   drivers/tty/serial/owl-uart.o: In function `owl_uart_set_termios':
   owl-uart.c:(.text+0xe10): undefined reference to `clk_set_rate'
   drivers/spi/spi-sun4i.o: In function `sun4i_spi_transfer_one':
   spi-sun4i.c:(.text+0x27c): undefined reference to `clk_set_rate'
   drivers/spi/spi-sun6i.o: In function `sun6i_spi_transfer_one':
   spi-sun6i.c:(.text+0x2b0): undefined reference to `clk_set_rate'
   drivers/spi/spi-tegra20-slink.o: In function `tegra_slink_transfer_one':
>> spi-tegra20-slink.c:(.text+0x13dc): undefined reference to `clk_set_rate'
   drivers/media/i2c/mt9v032.o:mt9v032.c:(.text+0x100): more undefined references to `clk_set_rate' follow
   drivers/media/v4l2-core/v4l2-clk.o: In function `v4l2_clk_set_rate':
   v4l2-clk.c:(.text+0x362): undefined reference to `clk_round_rate'
   v4l2-clk.c:(.text+0x380): undefined reference to `clk_set_rate'
   drivers/media/platform/sti/hva/hva-hw.o: In function `hva_hw_runtime_resume':
   hva-hw.c:(.text+0x7d8): undefined reference to `clk_set_rate'
   drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_pm.o: In function `mtk_vcodec_dec_clock_on':
   mtk_vcodec_dec_pm.c:(.text+0x88): undefined reference to `clk_set_rate'
   mtk_vcodec_dec_pm.c:(.text+0x188): undefined reference to `clk_set_parent'
   drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_pm.o: In function `mtk_vcodec_enc_clock_on':
   mtk_vcodec_enc_pm.c:(.text+0x8a): undefined reference to `clk_set_parent'
   drivers/iio/frequency/adf4350.o: In function `adf4350_write':
   adf4350.c:(.text+0x992): undefined reference to `clk_round_rate'
   adf4350.c:(.text+0x9b2): undefined reference to `clk_set_rate'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
