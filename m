Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02429110A
	for <oe-kbuild-all@lists.linux.dev>; Sat, 10 Jun 2023 18:37:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686422221; x=1717958221;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=4Rk4v94cu3cKQUNEonH1AMBx5jx6eKtG4w6TXjPaqFc=;
  b=FL3kxKyM7Saia84rIG6LoQGc1HCvIV32rx+OuHQw5ZU3B19995Sitklx
   DIeJkUjVVV9RoXa0oAIn37O4ty7i1KcgaxejpClp3N2dixAOUDSudY70V
   +u8nSGs6NWpkr1LZoka8/auW03BzO9QXMtpGtXUMHaNlU4M9zAk6Q5P8E
   Z2dZW2riNGr+O//+J3aetqPje7RWV5fNr1mt2XDzpe1UdJ8gKzOdUnriD
   LonyfUtXWfgV7yXWNXPe0/ivdO/r3hqmnw1kZEsqnVRsxCIMQN3j7KQcs
   c0qd+/SsrVOcdgF3bj3w2xw2fEYrgmx3Up7BBxKVCPhuruzfX3TrBXz24
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10737"; a="421387918"
X-IronPort-AV: E=Sophos;i="6.00,232,1681196400"; 
   d="scan'208";a="421387918"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2023 11:37:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10737"; a="855099520"
X-IronPort-AV: E=Sophos;i="6.00,232,1681196400"; 
   d="scan'208";a="855099520"
Received: from lkp-server01.sh.intel.com (HELO 15ab08e44a81) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 10 Jun 2023 11:37:00 -0700
Received: from kbuild by 15ab08e44a81 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q83SN-000AMG-2s;
	Sat, 10 Jun 2023 18:36:59 +0000
Date: Sun, 11 Jun 2023 02:35:59 +0800
From: kernel test robot <lkp@intel.com>
To: Mark Brown <broonie@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [broonie-ci:regcache-raw-kunit 2/3] ERROR: modpost: vmlinux:
 '__regmap_init_ram' exported twice. Previous export was in vmlinux
Message-ID: <202306110218.7S4K5vMC-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/ci.git regcache-raw-kunit
head:   fb8380b5b67d85540ef032c2c48c5e9dc3c45f55
commit: 244625c861105612120a49dd6d0bb0f63c667d79 [2/3] regmap: Provide a ram backed regmap with raw support
config: csky-buildonly-randconfig-r005-20230611 (https://download.01.org/0day-ci/archive/20230611/202306110218.7S4K5vMC-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 12.3.0
reproduce (this is a W=1 build):
        mkdir -p ~/bin
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/broonie/ci.git/commit/?id=244625c861105612120a49dd6d0bb0f63c667d79
        git remote add broonie-ci https://git.kernel.org/pub/scm/linux/kernel/git/broonie/ci.git
        git fetch --no-tags broonie-ci regcache-raw-kunit
        git checkout 244625c861105612120a49dd6d0bb0f63c667d79
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.3.0 ~/bin/make.cross W=1 O=build_dir ARCH=csky olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.3.0 ~/bin/make.cross W=1 O=build_dir ARCH=csky SHELL=/bin/bash

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306110218.7S4K5vMC-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: vmlinux: '__regmap_init_ram' exported twice. Previous export was in vmlinux

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
