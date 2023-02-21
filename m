Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52C1A1390
	for <oe-kbuild-all@lists.linux.dev>; Tue, 21 Feb 2023 08:37:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676968621; x=1708504621;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=laHDrkI1d1GXuvfoXrLH0lhtixcqRRMKtsLUdVD4xSY=;
  b=fPJ9KqrpUoBEmAX4fMBNnMvCGpnEJF6PeNnVslg5ZPniHLDx9jvjd7Qb
   y/Wt+itsieIvjYKLUb9GC3kWaLjDrCwLHXXu/jTcYwNZPlu9X6Oe3yEEm
   JhgolnNAAGVI/hrYaMjq6rDwwFqgM6KwsBKSvsZ3EcNe6+yJsrBe3Dwbm
   Bnergp1V5IPUyIksA1HTY57gy5BP0TGazihjluhxM/Fne8nrbkXBlfI69
   0mFSVf2lF5JdE3Te53LRq4xwwMbibRzpJJ/or9ToIlCyqDGC30co9p8t3
   LUhi/LmwBU5jAtLyv9qN/MnqUl4xo9v3fng1Zk8Wq+49t5B+bkVtZbkGd
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10627"; a="395058869"
X-IronPort-AV: E=Sophos;i="5.97,315,1669104000"; 
   d="scan'208";a="395058869"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Feb 2023 00:36:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10627"; a="703953828"
X-IronPort-AV: E=Sophos;i="5.97,315,1669104000"; 
   d="scan'208";a="703953828"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 21 Feb 2023 00:36:52 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pUO8q-000Ean-0c;
	Tue, 21 Feb 2023 08:36:52 +0000
Date: Tue, 21 Feb 2023 16:36:31 +0800
From: kernel test robot <lkp@intel.com>
To: Luciano Coelho <luciano.coelho@intel.com>,
	Golan Ben Ami <golan.ben.ami@intel.com>,
	Michael Golant <michael.golant@intel.com>,
	Johannes Berg <johannes.berg@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: ld.lld: error: drivers/gpu/drm/drm_displayid.o:(.riscv.attributes):
 rv64i2p0_m2p0_a2p0_zicsr2p0_zifencei2p0: unsupported version number 2.0 for
 extension 'zicsr'
Message-ID: <202302211650.CfAv6PI0-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Jani,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/iwlwifi/chromeos.git chromeos-5.10__release/core62-50-1
head:   aa035fb1ea0a81817398b02a7ca3914558fe23a5
commit: ee0afd29a4747d36a8e4d94e4c5243fdfdc1ac82 UPSTREAM: drm/displayid: add separate drm_displayid.c
date:   1 year, 9 months ago
config: riscv-randconfig-r031-20230219 (https://download.01.org/0day-ci/archive/20230221/202302211650.CfAv6PI0-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project db89896bbbd2251fff457699635acbbedeead27f)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/iwlwifi/chromeos.git/commit/?id=ee0afd29a4747d36a8e4d94e4c5243fdfdc1ac82
        git remote add iwlwifi-chromeos https://git.kernel.org/pub/scm/linux/kernel/git/iwlwifi/chromeos.git
        git fetch --no-tags iwlwifi-chromeos chromeos-5.10__release/core62-50-1
        git checkout ee0afd29a4747d36a8e4d94e4c5243fdfdc1ac82
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash drivers/ net/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302211650.CfAv6PI0-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld.lld: error: drivers/gpu/drm/drm_auth.o:(.riscv.attributes): rv64i2p0_m2p0_a2p0_zicsr2p0_zifencei2p0: unsupported version number 2.0 for extension 'zicsr'
   ld.lld: error: drivers/gpu/drm/drm_cache.o:(.riscv.attributes): rv64i2p0_m2p0_a2p0_zicsr2p0_zifencei2p0: unsupported version number 2.0 for extension 'zicsr'
   ld.lld: error: drivers/gpu/drm/drm_file.o:(.riscv.attributes): rv64i2p0_m2p0_a2p0_zicsr2p0_zifencei2p0: unsupported version number 2.0 for extension 'zicsr'
   ld.lld: error: drivers/gpu/drm/drm_gem.o:(.riscv.attributes): rv64i2p0_m2p0_a2p0_zicsr2p0_zifencei2p0: unsupported version number 2.0 for extension 'zicsr'
   ld.lld: error: drivers/gpu/drm/drm_ioctl.o:(.riscv.attributes): rv64i2p0_m2p0_a2p0_zicsr2p0_zifencei2p0: unsupported version number 2.0 for extension 'zicsr'
   ld.lld: error: drivers/gpu/drm/drm_irq.o:(.riscv.attributes): rv64i2p0_m2p0_a2p0_zicsr2p0_zifencei2p0: unsupported version number 2.0 for extension 'zicsr'
   ld.lld: error: drivers/gpu/drm/drm_drv.o:(.riscv.attributes): rv64i2p0_m2p0_a2p0_zicsr2p0_zifencei2p0: unsupported version number 2.0 for extension 'zicsr'
   ld.lld: error: drivers/gpu/drm/drm_sysfs.o:(.riscv.attributes): rv64i2p0_m2p0_a2p0_zicsr2p0_zifencei2p0: unsupported version number 2.0 for extension 'zicsr'
   ld.lld: error: drivers/gpu/drm/drm_hashtab.o:(.riscv.attributes): rv64i2p0_m2p0_a2p0_zicsr2p0_zifencei2p0: unsupported version number 2.0 for extension 'zicsr'
   ld.lld: error: drivers/gpu/drm/drm_mm.o:(.riscv.attributes): rv64i2p0_m2p0_a2p0_zicsr2p0_zifencei2p0: unsupported version number 2.0 for extension 'zicsr'
   ld.lld: error: drivers/gpu/drm/drm_crtc.o:(.riscv.attributes): rv64i2p0_m2p0_a2p0_zicsr2p0_zifencei2p0: unsupported version number 2.0 for extension 'zicsr'
   ld.lld: error: drivers/gpu/drm/drm_fourcc.o:(.riscv.attributes): rv64i2p0_m2p0_a2p0_zicsr2p0_zifencei2p0: unsupported version number 2.0 for extension 'zicsr'
   ld.lld: error: drivers/gpu/drm/drm_modes.o:(.riscv.attributes): rv64i2p0_m2p0_a2p0_zicsr2p0_zifencei2p0: unsupported version number 2.0 for extension 'zicsr'
   ld.lld: error: drivers/gpu/drm/drm_edid.o:(.riscv.attributes): rv64i2p0_m2p0_a2p0_zicsr2p0_zifencei2p0: unsupported version number 2.0 for extension 'zicsr'
>> ld.lld: error: drivers/gpu/drm/drm_displayid.o:(.riscv.attributes): rv64i2p0_m2p0_a2p0_zicsr2p0_zifencei2p0: unsupported version number 2.0 for extension 'zicsr'
   ld.lld: error: drivers/gpu/drm/drm_encoder_slave.o:(.riscv.attributes): rv64i2p0_m2p0_a2p0_zicsr2p0_zifencei2p0: unsupported version number 2.0 for extension 'zicsr'
   ld.lld: error: drivers/gpu/drm/drm_trace_points.o:(.riscv.attributes): rv64i2p0_m2p0_a2p0_zicsr2p0_zifencei2p0: unsupported version number 2.0 for extension 'zicsr'
   ld.lld: error: drivers/gpu/drm/drm_prime.o:(.riscv.attributes): rv64i2p0_m2p0_a2p0_zicsr2p0_zifencei2p0: unsupported version number 2.0 for extension 'zicsr'
   ld.lld: error: drivers/gpu/drm/drm_rect.o:(.riscv.attributes): rv64i2p0_m2p0_a2p0_zicsr2p0_zifencei2p0: unsupported version number 2.0 for extension 'zicsr'
   ld.lld: error: drivers/gpu/drm/drm_vma_manager.o:(.riscv.attributes): rv64i2p0_m2p0_a2p0_zicsr2p0_zifencei2p0: unsupported version number 2.0 for extension 'zicsr'
   ld.lld: error: too many errors emitted, stopping now (use --error-limit=0 to see all errors)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
