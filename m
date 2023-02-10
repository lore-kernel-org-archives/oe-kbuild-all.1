Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 944146D1B
	for <oe-kbuild-all@lists.linux.dev>; Fri, 10 Feb 2023 19:13:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676056426; x=1707592426;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6SbOWMvFResU/rYtnYeFlf2/Mf+1HeUq7yaDHN/9S3o=;
  b=Gbbrnqj3bcP5nysZ3TV8lvIOeXaBpneKgrQDtY/sJJcLPz56FwPSsxGu
   rN3TdW96o2/lYHn0Er2+E+aLUvb4hpQ8lpALA1K4vd78MIaKCW3fY4aow
   UuhFs21ZCrRbiWyXzPHpmcUHAR5kan1R4ELn1trO4sErue7xonLBgFtWX
   LkhEVCkj7KBWPzwmD4Mw2JYhcBtevOKMo5NRUYJYOaoEAC4Uqk9Wmwfqt
   wdFPetCt17lHsZupKcwLCRtKW1qzoCAgrXk6R0AKPjtzL5WEB/qRUo3mh
   ehmbnUZmUGRt6EPtidfQuR+reGZNPf2ch8EV02O60Z3MNp2V7b9tJl4Nc
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10617"; a="310135271"
X-IronPort-AV: E=Sophos;i="5.97,287,1669104000"; 
   d="scan'208";a="310135271"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2023 11:13:46 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10617"; a="736832077"
X-IronPort-AV: E=Sophos;i="5.97,287,1669104000"; 
   d="scan'208";a="736832077"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 10 Feb 2023 11:13:44 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pQYq8-00060H-0U;
	Fri, 10 Feb 2023 19:13:44 +0000
Date: Sat, 11 Feb 2023 03:12:54 +0800
From: kernel test robot <lkp@intel.com>
To: Luciano Coelho <luciano.coelho@intel.com>,
	Golan Ben Ami <golan.ben.ami@intel.com>,
	Michael Golant <michael.golant@intel.com>,
	Johannes Berg <johannes.berg@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: ld.lld: error:
 drivers/phy/mediatek/phy-mtk-mipi-dsi.o:(.riscv.attributes):
 rv64i2p0_m2p0_a2p0_c2p0_zicsr2p0_zifencei2p0: unsupported version number 2.0
 for extension 'zicsr'
Message-ID: <202302110338.BQc4tnyP-lkp@intel.com>
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
config: riscv-randconfig-r042-20230210 (https://download.01.org/0day-ci/archive/20230211/202302110338.BQc4tnyP-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project db0e6591612b53910a1b366863348bdb9d7d2fb1)
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
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash drivers/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302110338.BQc4tnyP-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: drivers/phy/mediatek/phy-mtk-mipi-dsi.o:(.riscv.attributes): rv64i2p0_m2p0_a2p0_c2p0_zicsr2p0_zifencei2p0: unsupported version number 2.0 for extension 'zicsr'
>> ld.lld: error: drivers/phy/mediatek/phy-mtk-mipi-dsi-mt8173.o:(.riscv.attributes): rv64i2p0_m2p0_a2p0_c2p0_zicsr2p0_zifencei2p0: unsupported version number 2.0 for extension 'zicsr'
>> ld.lld: error: drivers/phy/mediatek/phy-mtk-mipi-dsi-mt8183.o:(.riscv.attributes): rv64i2p0_m2p0_a2p0_c2p0_zicsr2p0_zifencei2p0: unsupported version number 2.0 for extension 'zicsr'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
