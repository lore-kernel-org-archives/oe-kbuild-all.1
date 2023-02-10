Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FCB82F45
	for <oe-kbuild-all@lists.linux.dev>; Fri, 10 Feb 2023 14:16:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676038599; x=1707574599;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ScafAphQsUhdV3uOgvgcWclp5nQGFnEMZfy4lacYcC8=;
  b=D68wDU9VHhnbwhQg4N3FAJRhWSgfj9jMnzAnsZtkcNL4d4OPhPNGAz2K
   zwspJkw/zS6P9LoEupGwYpg+501l3WAoO3Kq067ijx668jdG258dC8apC
   A9CLvIGGqt7xejEgeDGoYtC6Agph/Md2Cz1+s3zdf4uBQDqVWzfrkMCaM
   71ytFZwl7cIPjCFFko19JzO3pdQOC3mYzlTcc3CLGIz+mtWio9grKsTDr
   mrNJctjr2KP3ZGDwDomDctjtTytQiImNJmLYgOol/hHwMBHAqyhwU3n7V
   5pJr1a5EywovaOIFCnA9FwqkTjp/INNuxVZX6Muf4QWx+hQuDVhAjjTb6
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10617"; a="395034704"
X-IronPort-AV: E=Sophos;i="5.97,287,1669104000"; 
   d="scan'208";a="395034704"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2023 06:16:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10617"; a="996965267"
X-IronPort-AV: E=Sophos;i="5.97,287,1669104000"; 
   d="scan'208";a="996965267"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 10 Feb 2023 06:16:37 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pQUCa-0005pl-1e;
	Fri, 10 Feb 2023 14:16:36 +0000
Date: Fri, 10 Feb 2023 22:15:37 +0800
From: kernel test robot <lkp@intel.com>
To: Luciano Coelho <luciano.coelho@intel.com>,
	Golan Ben Ami <golan.ben.ami@intel.com>,
	Michael Golant <michael.golant@intel.com>,
	Johannes Berg <johannes.berg@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: ld.lld: error: drivers/thunderbolt/dma_test.o:(.riscv.attributes):
 rv64i2p0_m2p0_a2p0_c2p0_zicsr2p0_zifencei2p0: unsupported version number 2.0
 for extension 'zicsr'
Message-ID: <202302102212.9qOjEPBd-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Guenter,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/iwlwifi/chromeos.git chromeos-5.10__release/core59-42
head:   e3fe4ac2447d89b8dca61663851e12d2f1247b56
commit: e299e41caaf67e6efa1acb7363bdf49b7b9480ce Merge origin/chromeos-5.10-net
date:   2 years, 2 months ago
config: riscv-randconfig-r042-20230210 (https://download.01.org/0day-ci/archive/20230210/202302102212.9qOjEPBd-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project db0e6591612b53910a1b366863348bdb9d7d2fb1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/iwlwifi/chromeos.git/commit/?id=e299e41caaf67e6efa1acb7363bdf49b7b9480ce
        git remote add iwlwifi-chromeos https://git.kernel.org/pub/scm/linux/kernel/git/iwlwifi/chromeos.git
        git fetch --no-tags iwlwifi-chromeos chromeos-5.10__release/core59-42
        git checkout e299e41caaf67e6efa1acb7363bdf49b7b9480ce
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash drivers/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302102212.9qOjEPBd-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: drivers/thunderbolt/dma_test.o:(.riscv.attributes): rv64i2p0_m2p0_a2p0_c2p0_zicsr2p0_zifencei2p0: unsupported version number 2.0 for extension 'zicsr'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
