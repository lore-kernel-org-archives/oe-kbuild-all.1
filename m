Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B22D953A0
	for <oe-kbuild-all@lists.linux.dev>; Wed, 18 Jan 2023 18:24:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674066252; x=1705602252;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=g0iUkzL8BlcoIQxV0wTRt6LAgbwj95y5H+PoR9fOXAY=;
  b=ceCLNHCfwk5Hp64vDXoBc6M47voYYSqFORRTGDNQAVRvdzDWXsQJQjlw
   3iOkXoczho8GgdCUZyP3SOHg3CicYiJLn0UQxUGujx7VIk/ZC6kbCJbXK
   Lz32StKIFV4a/cPC+DTMl5nqwaGL4N14URh2Jy1l3xldfwmd5mRMOgpDX
   ijoaykRkwAWZv0Pr0Bt0DWDBpgqz5jhPtf4r2Aod9fIR9P1CfJqo3bVib
   OWJeb6XcN6Vi1mveB19QDLQz4xOguirNEuAi6Det1+8WNhdwb4qQy/M6G
   +Z/VlbxTnNeEfcoeM3kR+nuPigW1n6eCCiXMaWIGkB0qqiV5zSQznfgEC
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10594"; a="312939087"
X-IronPort-AV: E=Sophos;i="5.97,226,1669104000"; 
   d="scan'208";a="312939087"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jan 2023 10:24:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10594"; a="690322882"
X-IronPort-AV: E=Sophos;i="5.97,226,1669104000"; 
   d="scan'208";a="690322882"
Received: from lkp-server01.sh.intel.com (HELO 5646d64e7320) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 18 Jan 2023 10:24:08 -0800
Received: from kbuild by 5646d64e7320 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pID6W-0000cD-03;
	Wed, 18 Jan 2023 18:24:08 +0000
Date: Thu, 19 Jan 2023 02:23:52 +0800
From: kernel test robot <lkp@intel.com>
To: Pratyush Yadav <p.yadav@ti.com>
Cc: oe-kbuild-all@lists.linux.dev, vigneshr@ti.com, nm@ti.com
Subject: [ti:ti-rt-linux-5.10.y 4481/9999] cdns-csi2rx.c:undefined reference
 to `phy_mipi_dphy_get_default_config'
Message-ID: <202301190259.kKkHDqA1-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git ti-rt-linux-5.10.y
head:   4a5931fd0c1e9db301f6d44d780227ed1b164093
commit: e9849aee398a96f041666cda81660daadc7f5b06 [4481/9999] media: cadence: csi2rx: Add external DPHY support
config: nds32-randconfig-r005-20230118 (https://download.01.org/0day-ci/archive/20230119/202301190259.kKkHDqA1-lkp@intel.com/config)
compiler: nds32le-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        git remote add ti git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git
        git fetch --no-tags ti ti-rt-linux-5.10.y
        git checkout e9849aee398a96f041666cda81660daadc7f5b06
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=nds32 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=nds32 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   nds32le-linux-ld: drivers/media/platform/cadence/cdns-csi2rx.o: in function `csi2rx_configure_external_dphy':
>> cdns-csi2rx.c:(.text+0x14e): undefined reference to `phy_mipi_dphy_get_default_config'
>> nds32le-linux-ld: cdns-csi2rx.c:(.text+0x152): undefined reference to `phy_mipi_dphy_get_default_config'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
