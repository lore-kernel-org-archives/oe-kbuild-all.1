Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4847615A0
	for <oe-kbuild-all@lists.linux.dev>; Mon, 19 Jun 2023 05:05:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1687151107; x=1718687107;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=cBezhm8JJLYYJWYKWCI11FXuciXo+VD59nScl8lv9eE=;
  b=gpzUDljfrbswEP1/DIOyogiH31Hhdkyg6HVsp/tiUlVMRNVTbQMEaZss
   MqFuW4WQ9TiGnvmFNDRa21fDPEBVNcRoLq3UX9gfH2hcPisuJ15RAHfEj
   lHi1W48s834TtfWxchqGSqBJ8VfEkplVtHFUamy4G5gXfLCOb3ESP2U4v
   E57P+z0sCG+awuI10jNptZAcdY9An1ZjvsSUYsoyJjFPF8EHQiYJEmENO
   7R80wFrfzBRknNMUgLKkn1BCrA23PpBZH6Sj/R6PiXXh229BAdPUSG3Xh
   tzTgHKe9C+cAxUTWgjN6yKXucIRND3jYGSND/y67Wrp701fMI0/Q2rSJg
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10745"; a="357032056"
X-IronPort-AV: E=Sophos;i="6.00,253,1681196400"; 
   d="scan'208";a="357032056"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jun 2023 22:05:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10745"; a="707756123"
X-IronPort-AV: E=Sophos;i="6.00,253,1681196400"; 
   d="scan'208";a="707756123"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 18 Jun 2023 22:05:04 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qB74a-0004M4-0T;
	Mon, 19 Jun 2023 05:05:04 +0000
Date: Mon, 19 Jun 2023 13:04:29 +0800
From: kernel test robot <lkp@intel.com>
To: Luis Chamberlain <mcgrof@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [mcgrof-next:large-block-20230618-hacks-v2 44/45]
 bus.c:(.text+0x264): multiple definition of `bdev_aops_reset';
 drivers/mmc/core/core.o:core.c:(.text+0x2060): first defined here
Message-ID: <202306191312.jurjHYAb-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mcgrof/linux-next.git large-block-20230618-hacks-v2
head:   45755261f269a9ff35d37c5aa481e86424e78716
commit: f698784915e1c993a52b563936ef824727a98e77 [44/45] bdev: allow to switch between bdev aops
config: arc-randconfig-r043-20230619 (https://download.01.org/0day-ci/archive/20230619/202306191312.jurjHYAb-lkp@intel.com/config)
compiler: arceb-elf-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230619/202306191312.jurjHYAb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306191312.jurjHYAb-lkp@intel.com/

All errors (new ones prefixed by >>):

   arceb-elf-ld: drivers/mmc/core/bus.o: in function `bdev_aops_reset':
>> bus.c:(.text+0x264): multiple definition of `bdev_aops_reset'; drivers/mmc/core/core.o:core.c:(.text+0x2060): first defined here
   arceb-elf-ld: drivers/mmc/core/host.o: in function `bdev_aops_reset':
   host.c:(.text+0xc98): multiple definition of `bdev_aops_reset'; drivers/mmc/core/core.o:core.c:(.text+0x2060): first defined here
   arceb-elf-ld: drivers/mmc/core/mmc.o: in function `bdev_aops_reset':
   mmc.c:(.text+0x2810): multiple definition of `bdev_aops_reset'; drivers/mmc/core/core.o:core.c:(.text+0x2060): first defined here
   arceb-elf-ld: drivers/mmc/core/mmc_ops.o: in function `bdev_aops_reset':
   mmc_ops.c:(.text+0x888): multiple definition of `bdev_aops_reset'; drivers/mmc/core/core.o:core.c:(.text+0x2060): first defined here
   arceb-elf-ld: drivers/mmc/core/sd.o: in function `bdev_aops_reset':
   sd.c:(.text+0x146c): multiple definition of `bdev_aops_reset'; drivers/mmc/core/core.o:core.c:(.text+0x2060): first defined here
   arceb-elf-ld: drivers/mmc/core/sd_ops.o: in function `bdev_aops_reset':
   sd_ops.c:(.text+0x23c): multiple definition of `bdev_aops_reset'; drivers/mmc/core/core.o:core.c:(.text+0x2060): first defined here
   arceb-elf-ld: drivers/mmc/core/sdio.o: in function `bdev_aops_reset':
   sdio.c:(.text+0x158c): multiple definition of `bdev_aops_reset'; drivers/mmc/core/core.o:core.c:(.text+0x2060): first defined here
   arceb-elf-ld: drivers/mmc/core/sdio_ops.o: in function `bdev_aops_reset':
   sdio_ops.c:(.text+0xd4): multiple definition of `bdev_aops_reset'; drivers/mmc/core/core.o:core.c:(.text+0x2060): first defined here
   arceb-elf-ld: drivers/mmc/core/sdio_bus.o: in function `bdev_aops_reset':
   sdio_bus.c:(.text+0x5dc): multiple definition of `bdev_aops_reset'; drivers/mmc/core/core.o:core.c:(.text+0x2060): first defined here
   arceb-elf-ld: drivers/mmc/core/sdio_cis.o: in function `bdev_aops_reset':
   sdio_cis.c:(.text+0x60c): multiple definition of `bdev_aops_reset'; drivers/mmc/core/core.o:core.c:(.text+0x2060): first defined here
   arceb-elf-ld: drivers/mmc/core/sdio_io.o: in function `bdev_aops_reset':
   sdio_io.c:(.text+0x83c): multiple definition of `bdev_aops_reset'; drivers/mmc/core/core.o:core.c:(.text+0x2060): first defined here
   arceb-elf-ld: drivers/mmc/core/sdio_irq.o: in function `bdev_aops_reset':
   sdio_irq.c:(.text+0x79c): multiple definition of `bdev_aops_reset'; drivers/mmc/core/core.o:core.c:(.text+0x2060): first defined here
   arceb-elf-ld: drivers/mmc/core/slot-gpio.o: in function `bdev_aops_reset':
   slot-gpio.c:(.text+0x3f4): multiple definition of `bdev_aops_reset'; drivers/mmc/core/core.o:core.c:(.text+0x2060): first defined here
   arceb-elf-ld: drivers/mmc/core/regulator.o: in function `bdev_aops_reset':
   regulator.c:(.text+0x4b4): multiple definition of `bdev_aops_reset'; drivers/mmc/core/core.o:core.c:(.text+0x2060): first defined here
   arceb-elf-ld: drivers/mmc/core/pwrseq.o: in function `bdev_aops_reset':
   pwrseq.c:(.text+0xe4): multiple definition of `bdev_aops_reset'; drivers/mmc/core/core.o:core.c:(.text+0x2060): first defined here
   arceb-elf-ld: drivers/mmc/core/debugfs.o: in function `bdev_aops_reset':
   debugfs.c:(.text+0x42c): multiple definition of `bdev_aops_reset'; drivers/mmc/core/core.o:core.c:(.text+0x2060): first defined here

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
