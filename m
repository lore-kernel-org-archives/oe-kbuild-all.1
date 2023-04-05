Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 377277470
	for <oe-kbuild-all@lists.linux.dev>; Wed,  5 Apr 2023 17:32:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680715942; x=1712251942;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ub/zDH7OVZ2kpvPE909iL1BPnvG8C6J5yOcSSTd69xc=;
  b=a23orp/W0LsDjINyPQGdtd9CtXsmdvrKuYWjSNNPewqZh5AEq7GRJWMs
   KxNdsu8Zlu9NWbClrqPI0vueBHykpj0urXV74wk0UdCCgwfWTKdT0f8oU
   G9XCtqWAVb0FbLo56UR/JUykgkGx1nMPvCnY2R/OZKNebxXkZPl5wmli/
   6c3RwBj1+Vr38PrOVw7pBvZIQrJI2KIkGAfKoXsB0XF3zf3kS0BMSXphN
   fUE1Btd17QXXnSDZbIfCGf+AS2JUiZEWCGV6Bi5obRxC7R0VVV0fLgc6u
   rnsq49tdA6drqDKhCLp3kYUzWOdodyEGf7CQwcUyPfkQY2Yto1by38UeA
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10671"; a="405298294"
X-IronPort-AV: E=Sophos;i="5.98,321,1673942400"; 
   d="scan'208";a="405298294"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Apr 2023 10:32:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10671"; a="686826630"
X-IronPort-AV: E=Sophos;i="5.98,321,1673942400"; 
   d="scan'208";a="686826630"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 05 Apr 2023 10:32:20 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pk6zb-000QgE-1K;
	Wed, 05 Apr 2023 17:32:19 +0000
Date: Thu, 6 Apr 2023 01:32:03 +0800
From: kernel test robot <lkp@intel.com>
To: Sasha Levin <sashal@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [sashal-stable:pending-5.15 119/124] Error:
 arch/arm64/boot/dts/freescale/imx8mp.dtsi:893.12-13 syntax error
Message-ID: <202304060139.y7hnknyk-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Li,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sashal/linux-stable.git pending-5.15
head:   7379ec723197b418f1f4f8b77bd497e4c552aa73
commit: 9f5f04746be02e094ffcb051b9ea0061e6ad0f4e [119/124] arm64: dts: imx8mp: correct usb clocks
config: arm64-allyesconfig (https://download.01.org/0day-ci/archive/20230406/202304060139.y7hnknyk-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/sashal/linux-stable.git/commit/?id=9f5f04746be02e094ffcb051b9ea0061e6ad0f4e
        git remote add sashal-stable https://git.kernel.org/pub/scm/linux/kernel/git/sashal/linux-stable.git
        git fetch --no-tags sashal-stable pending-5.15
        git checkout 9f5f04746be02e094ffcb051b9ea0061e6ad0f4e
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304060139.y7hnknyk-lkp@intel.com/

All errors (new ones prefixed by >>):

>> Error: arch/arm64/boot/dts/freescale/imx8mp.dtsi:893.12-13 syntax error
   FATAL ERROR: Unable to parse input tree

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
