Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EF0853AA
	for <oe-kbuild-all@lists.linux.dev>; Sun,  2 Apr 2023 19:47:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680464837; x=1712000837;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=iZEXXHTNgcEyhepf6O/51XOSpOAWplNMXErvO86DuCU=;
  b=denAwXwalg17FJD+btIoAP8R/0eynQbpn+3ze+8vqLkO2RKjxDMnGstp
   Mqjooz3I/FqMyeZRqe3WvV2vrshOTFtC2emWhgTMvgAcS1WBs6LRyyE+V
   w510tUk7Xy4PNwPuifO4KIm88rtQ36jFIr+LJwpbyTz5NKjSl3war2WkO
   LFslVBPqy2sRSNpEn7B0j9HbKMn4eGjkocsgEgdB2PZM53NMClvw2Hxky
   5m7j1ka6yxEfV/HvXgS01M4jTknNcj1EM0WIJwhI1eIvrBzqzmI8rlqRw
   kg7PgJuVDYImYcgaRzOutD32aOLPfEeS/VP4WPI/9xxcYC5c5XCwZXRJe
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10668"; a="322154842"
X-IronPort-AV: E=Sophos;i="5.98,313,1673942400"; 
   d="scan'208";a="322154842"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Apr 2023 12:47:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10668"; a="1015458095"
X-IronPort-AV: E=Sophos;i="5.98,313,1673942400"; 
   d="scan'208";a="1015458095"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 02 Apr 2023 12:47:15 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pj3fW-000Ndh-1Q;
	Sun, 02 Apr 2023 19:47:14 +0000
Date: Mon, 3 Apr 2023 03:46:51 +0800
From: kernel test robot <lkp@intel.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Chen-Yu Tsai <wenst@chromium.org>
Subject: [matthias-bgg:v6.3-next/soc 20/23] mtk-mmsys.c:undefined reference
 to `cmdq_pkt_write_mask'
Message-ID: <202304030314.tgvusZ7n-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/matthias.bgg/linux.git v6.3-next/soc
head:   e9a6f5bca5ea56f05d92a966034ed472408821b8
commit: b34884b4c878a6ad2a4f70d7c88ef60ac39ad408 [20/23] soc: mediatek: Cleanup ifdefs for IS_REACHABLE(CONFIG_MTK_CMDQ)
config: arm64-randconfig-r002-20230402 (https://download.01.org/0day-ci/archive/20230403/202304030314.tgvusZ7n-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/matthias.bgg/linux.git/commit/?id=b34884b4c878a6ad2a4f70d7c88ef60ac39ad408
        git remote add matthias-bgg https://git.kernel.org/pub/scm/linux/kernel/git/matthias.bgg/linux.git
        git fetch --no-tags matthias-bgg v6.3-next/soc
        git checkout b34884b4c878a6ad2a4f70d7c88ef60ac39ad408
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304030314.tgvusZ7n-lkp@intel.com/

All errors (new ones prefixed by >>):

>> aarch64-linux-ld: Unexpected GOT/PLT entries detected!
>> aarch64-linux-ld: Unexpected run-time procedure linkages detected!
   aarch64-linux-ld: aarch64-linux-ld: DWARF error: could not find abbrev number 1427041
   drivers/soc/mediatek/mtk-mmsys.o: in function `mtk_mmsys_update_bits':
>> mtk-mmsys.c:(.text+0xbc): undefined reference to `cmdq_pkt_write_mask'
   aarch64-linux-ld: drivers/soc/mediatek/mtk-mmsys.o: in function `mtk_mmsys_probe':
>> mtk-mmsys.c:(.text+0xa74): undefined reference to `cmdq_dev_get_client_reg'
   aarch64-linux-ld: aarch64-linux-ld: DWARF error: could not find abbrev number 5110
   drivers/soc/mediatek/mtk-mutex.o: in function `mtk_mutex_enable_by_cmdq':
>> mtk-mutex.c:(.text+0x7f0): undefined reference to `cmdq_pkt_write'
   aarch64-linux-ld: drivers/soc/mediatek/mtk-mutex.o: in function `mtk_mutex_probe':
>> mtk-mutex.c:(.text+0xa98): undefined reference to `cmdq_dev_get_client_reg'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
