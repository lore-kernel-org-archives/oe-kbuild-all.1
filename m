Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C326217F7
	for <oe-kbuild-all@lists.linux.dev>; Mon,  6 Mar 2023 03:25:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678073100; x=1709609100;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Bk5ohMEFJX5YFe6UJx3PARN2811h8aoxEOXB9eThpc0=;
  b=V7ZbHRyGYp1kVM2h4nzktslfydzS7TAN3TsEARDXJReJ09nSzLvR36AH
   ZSEh9po1wOPZ6fobF6UfIP431sIOetFXz4EeSm5VFNy9OLDnSsjpiMD/o
   hcgLeR/S1Y/0HhNhlKmoZx2SurWFvlPBW888Oi6P0Dm6PbFNoH8fYN8KC
   rn3sHTewIYUnemN/Ep+P+2SXZhGqQiymkWkJXAbLqW0pXL+xK8o1FX5mD
   Cz7gQzHf2AxvBRjUW4hVsxAsRss/KYNLx26YF+hXV/Un2QPTbCN6p1AWZ
   e18lsCiqTtiuSPnt9vYjwnrJXIcKTXCtlNP4JRywCg2FHDN6/PmB7JaXI
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10640"; a="323770158"
X-IronPort-AV: E=Sophos;i="5.98,236,1673942400"; 
   d="scan'208";a="323770158"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Mar 2023 19:25:00 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10640"; a="765075563"
X-IronPort-AV: E=Sophos;i="5.98,236,1673942400"; 
   d="scan'208";a="765075563"
Received: from lkp-server01.sh.intel.com (HELO 776573491cc5) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 05 Mar 2023 19:24:59 -0800
Received: from kbuild by 776573491cc5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pZ1T8-0003HS-18;
	Mon, 06 Mar 2023 03:24:58 +0000
Date: Mon, 6 Mar 2023 11:24:02 +0800
From: kernel test robot <lkp@intel.com>
To: Max Filippov <jcmvbkbc@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: xtensa-linux-ld: section .Level2InterruptVector.text VMA
 [0000000000000180,0000000000000193] overlaps section .data VMA
 [0000000000000000,00000000002eeb0f]
Message-ID: <202303061133.6YKlFR4B-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Max,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   fe15c26ee26efa11741a7b632e9f23b01aca4cc6
commit: c20e1117d9aa22c558646a1060ddd1dd042fb107 xtensa: add kernel ABI selection to Kconfig
date:   12 months ago
config: xtensa-randconfig-r016-20230306 (https://download.01.org/0day-ci/archive/20230306/202303061133.6YKlFR4B-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=c20e1117d9aa22c558646a1060ddd1dd042fb107
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout c20e1117d9aa22c558646a1060ddd1dd042fb107
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=xtensa olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=xtensa SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303061133.6YKlFR4B-lkp@intel.com/

All errors (new ones prefixed by >>):

>> xtensa-linux-ld: section .Level2InterruptVector.text VMA [0000000000000180,0000000000000193] overlaps section .data VMA [0000000000000000,00000000002eeb0f]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
