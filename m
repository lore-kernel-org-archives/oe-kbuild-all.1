Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8C175685
	for <oe-kbuild-all@lists.linux.dev>; Sat, 24 Jun 2023 16:18:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1687623491; x=1719159491;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Zn5HP/skmA2hGGSRrxPzUJQURgeDZ2U19N1mGL0BjAg=;
  b=Hv5MaxZXmDuBjEHUu+yxaj2WFvJxAE43JGTjA9K9isvyicQtfAfxSc0r
   kwJcOfLXs8tDKN0SF4OHsrNI0rCO9KPtgZ0kwL9xFYWd3wImjch/c4EnG
   uTG6nlAS1H7uk0Zu2nAyp5TLiSCPLFHMh9/SxQ5SjACNyBOCylpvFaLAg
   AloybUtADfeW9St3UrLBVcqBskuLWukD8OjawIS44GHdACmx0QjfSsrja
   Vya4cny94CMIo/tzW45dceVVlAfMobiFCWHLKSLVyBvPXtJPAgtQPalAz
   yk7e+VhFs7JCClFxOlm7RDp0VHD/lsulxFzP0BMQp8TQIpM63AfR9t3YP
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10751"; a="424635700"
X-IronPort-AV: E=Sophos;i="6.01,155,1684825200"; 
   d="scan'208";a="424635700"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jun 2023 09:18:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10751"; a="839771519"
X-IronPort-AV: E=Sophos;i="6.01,155,1684825200"; 
   d="scan'208";a="839771519"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 24 Jun 2023 09:18:09 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qD5xh-0009BS-02;
	Sat, 24 Jun 2023 16:18:09 +0000
Date: Sun, 25 Jun 2023 00:17:52 +0800
From: kernel test robot <lkp@intel.com>
To: Max Filippov <jcmvbkbc@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jcmvbkbc-xtensa:xtensa-6.4-esp32 10/37] irq-esp32-intc.c:undefined
 reference to `devm_of_iomap'
Message-ID: <202306250006.sbRVRC3z-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jcmvbkbc/linux-xtensa xtensa-6.4-esp32
head:   65f7b38b91d5a39bb0ed44ed208c758daaad85e3
commit: b00b2982ef0c6969c2feae81b53fddc0a02611b9 [10/37] WIP: irqchip: add driver for the ESP32 interrupt matrix
config: s390-randconfig-r022-20230624 (https://download.01.org/0day-ci/archive/20230625/202306250006.sbRVRC3z-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230625/202306250006.sbRVRC3z-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306250006.sbRVRC3z-lkp@intel.com/

All errors (new ones prefixed by >>):

   s390-linux-ld: kernel/dma/coherent.o: in function `_dma_release_coherent_memory':
   coherent.c:(.text+0x9c): undefined reference to `memunmap'
   s390-linux-ld: kernel/dma/coherent.o: in function `dma_init_coherent_memory':
   coherent.c:(.text+0x114): undefined reference to `memremap'
   s390-linux-ld: coherent.c:(.text+0x204): undefined reference to `memunmap'
   s390-linux-ld: drivers/irqchip/irq-al-fic.o: in function `al_fic_init_dt':
   irq-al-fic.c:(.init.text+0x4e): undefined reference to `of_iomap'
   s390-linux-ld: irq-al-fic.c:(.init.text+0x3e4): undefined reference to `iounmap'
   s390-linux-ld: drivers/irqchip/irq-esp32-intc.o: in function `esp32_intc_init':
>> irq-esp32-intc.c:(.init.text+0x1aa): undefined reference to `devm_of_iomap'
   s390-linux-ld: drivers/misc/open-dice.o: in function `open_dice_write':
   open-dice.c:(.text+0xea): undefined reference to `devm_memremap'
   s390-linux-ld: open-dice.c:(.text+0x156): undefined reference to `devm_memunmap'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
