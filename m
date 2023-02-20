Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 883057E9
	for <oe-kbuild-all@lists.linux.dev>; Mon, 20 Feb 2023 01:31:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676856715; x=1708392715;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=s9VPzlqpIG5R3AwCzzS8Aqk93UuLXCRFby1yBXpeo9Y=;
  b=LyEEG/CshOcEmscbsrtZEkOUm5pP1mhcrqt6GV8ASljoz7FvxUGgfGUe
   ytJ70mITQPQ0sEw5EiaS0fPxErNKC4SAB0AQr6OAXverwRKn4a/rEgMO9
   BuEgfsgx8oGucxYO2097XVRQ25Wi7w70bZMFa23uNny6CRfFR0Zflx2WE
   65TQzLmBk7ayJQUGe37NN91tOF4sSk1YEbieAuuvd8oq4UsQCKESkY0nj
   1zaMnZ3RIF1EUVxOlZMpXAFrgmAvAIL/jRv3f3uTrPkK/X9VAUZcedDjP
   gQ0Xdm6Q9/c4LH2jPvDcyochZBs9LuBskjEDddLGHcKT/YR1GRiPsqSUj
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10626"; a="312670272"
X-IronPort-AV: E=Sophos;i="5.97,311,1669104000"; 
   d="scan'208";a="312670272"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Feb 2023 17:31:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10626"; a="845159124"
X-IronPort-AV: E=Sophos;i="5.97,311,1669104000"; 
   d="scan'208";a="845159124"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 19 Feb 2023 17:31:52 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pTv20-000DXJ-0T;
	Mon, 20 Feb 2023 01:31:52 +0000
Date: Mon, 20 Feb 2023 09:31:28 +0800
From: kernel test robot <lkp@intel.com>
To: Luciano Coelho <luciano.coelho@intel.com>,
	Golan Ben Ami <golan.ben.ami@intel.com>,
	Michael Golant <michael.golant@intel.com>,
	Johannes Berg <johannes.berg@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: ld.lld: error:
 drivers/phy/mediatek/phy-mtk-mipi-dsi.o:(.riscv.attributes):
 rv64i2p0_m2p0_a2p0_zicsr2p0_zifencei2p0: unsupported version number 2.0 for
 extension 'zicsr'
Message-ID: <202302200923.1v4EMLVT-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Linux,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/iwlwifi/chromeos.git chromeos-5.10__release/core59-61
head:   a12a9bd00b095b42f606b124f67769641193a99c
commit: a133294e9b3617ebf328b728f8ef49db273343b7 UPSTREAM: phy: mediatek: allow compile-testing the dsi phy
date:   2 years, 1 month ago
config: riscv-randconfig-r031-20230219 (https://download.01.org/0day-ci/archive/20230220/202302200923.1v4EMLVT-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project db89896bbbd2251fff457699635acbbedeead27f)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/iwlwifi/chromeos.git/commit/?id=a133294e9b3617ebf328b728f8ef49db273343b7
        git remote add iwlwifi-chromeos https://git.kernel.org/pub/scm/linux/kernel/git/iwlwifi/chromeos.git
        git fetch --no-tags iwlwifi-chromeos chromeos-5.10__release/core59-61
        git checkout a133294e9b3617ebf328b728f8ef49db273343b7
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash drivers/ net/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302200923.1v4EMLVT-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: drivers/phy/mediatek/phy-mtk-mipi-dsi.o:(.riscv.attributes): rv64i2p0_m2p0_a2p0_zicsr2p0_zifencei2p0: unsupported version number 2.0 for extension 'zicsr'
>> ld.lld: error: drivers/phy/mediatek/phy-mtk-mipi-dsi-mt8173.o:(.riscv.attributes): rv64i2p0_m2p0_a2p0_zicsr2p0_zifencei2p0: unsupported version number 2.0 for extension 'zicsr'
>> ld.lld: error: drivers/phy/mediatek/phy-mtk-mipi-dsi-mt8183.o:(.riscv.attributes): rv64i2p0_m2p0_a2p0_zicsr2p0_zifencei2p0: unsupported version number 2.0 for extension 'zicsr'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
