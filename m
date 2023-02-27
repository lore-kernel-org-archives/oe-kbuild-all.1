Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C4526FDC
	for <oe-kbuild-all@lists.linux.dev>; Mon, 27 Feb 2023 15:01:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677510116; x=1709046116;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=XUZQcg1RVQ/k1cs8Xtlwp/FhFE8uNn2AntsHy5KgIFQ=;
  b=AmwNHsco0oQs6MJqNVBjwSQyuaq1A+Ce6jHo3H0TtFYIBwBVpbMVz3hP
   YR/rKZBGXvJVdIXPO8P5xTWlh/qbz7qwP1DsBjjLDxXX+rSqa3+ForC5e
   s1a+926dZ6mtc+sJTsq1HEqXvsTjpNLscqN5G6hV1wKlPePnTVqZEK5pg
   E/HurZt4vqr1M4kYxQ7bamLCPlHu62drNU1qc1dsa+lfRTqTmXZuLSJF/
   928Y+Vbg+By6y5iqvU1sLGSxpJPQcg1yAzOfpdES4qZ8GroP1MiQ0Zqe0
   VaDQB+dYRXLvHh/U4rLrg/B2b5L5iDRfbxSPDr36m4maOojK5dCsjd4Lu
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10634"; a="332597892"
X-IronPort-AV: E=Sophos;i="5.98,219,1673942400"; 
   d="scan'208";a="332597892"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Feb 2023 07:01:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10634"; a="847883166"
X-IronPort-AV: E=Sophos;i="5.98,219,1673942400"; 
   d="scan'208";a="847883166"
Received: from lkp-server01.sh.intel.com (HELO 3895f5c55ead) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 27 Feb 2023 07:01:46 -0800
Received: from kbuild by 3895f5c55ead with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pWf0b-0004Vz-26;
	Mon, 27 Feb 2023 15:01:45 +0000
Date: Mon, 27 Feb 2023 23:01:14 +0800
From: kernel test robot <lkp@intel.com>
To: Lukas Wunner <lukas@wunner.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [l1k:rpi-6.2.y-await-linktraining 139/583]
 drivers/tty/serial/amba-pl011.c:1727:15: warning: no previous prototype for
 'pl011_clk_round'
Message-ID: <202302272203.PxJyX6hz-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/l1k/linux rpi-6.2.y-await-linktraining
head:   f3a9201f7f484c1295cdec53c1b9bd2a19ffb231
commit: f7452c100dda998d689b3d112876661ff1b7d432 [139/583] amba_pl011: Round input clock up
config: arm64-allyesconfig (https://download.01.org/0day-ci/archive/20230227/202302272203.PxJyX6hz-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/l1k/linux/commit/f7452c100dda998d689b3d112876661ff1b7d432
        git remote add l1k https://github.com/l1k/linux
        git fetch --no-tags l1k rpi-6.2.y-await-linktraining
        git checkout f7452c100dda998d689b3d112876661ff1b7d432
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash drivers/char/ drivers/dma/ drivers/gpio/ drivers/irqchip/ drivers/misc/ drivers/mmc/host/ drivers/perf/ drivers/tty/serial/ drivers/usb/host/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302272203.PxJyX6hz-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/tty/serial/amba-pl011.c:1727:15: warning: no previous prototype for 'pl011_clk_round' [-Wmissing-prototypes]
    1727 | unsigned long pl011_clk_round(unsigned long clk)
         |               ^~~~~~~~~~~~~~~


vim +/pl011_clk_round +1727 drivers/tty/serial/amba-pl011.c

  1726	
> 1727	unsigned long pl011_clk_round(unsigned long clk)
  1728	{
  1729		unsigned long scaler;
  1730	
  1731		/*
  1732		 * If increasing a clock by less than 0.1% changes it
  1733		 * from ..999.. to ..000.., round up.
  1734		 */
  1735		scaler = 1;
  1736		while (scaler * 100000 < clk)
  1737			scaler *= 10;
  1738		if ((clk + scaler - 1)/scaler % 1000 == 0)
  1739			clk = (clk/scaler + 1) * scaler;
  1740	
  1741		return clk;
  1742	}
  1743	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
