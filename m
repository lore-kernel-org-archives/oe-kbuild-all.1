Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C748B539D
	for <oe-kbuild-all@lists.linux.dev>; Fri, 24 Feb 2023 13:52:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677246774; x=1708782774;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=FV4wJY7P3iREpYwV64F76JRAZJsOuRd/aFmaOzw3t6g=;
  b=Ran9ISfaUobu28QJA4PL0lhYq2DNHZ5vxxcJCdr2RA6JiddwqbwFMpLe
   GzyNWfUmbUky1ZLTwFUoos9t55OYb5VQKLNu+vxWbb/zvUg27V4i/WHL4
   7WRusJbXII9G3rXjxvX5uaku2qXGXKeHen4bIySsHAhpCdezkuTql4Qtz
   AxTFTThNy1HZ2ON7wGo42Hz82bb6ZPo3QOJ6gd6y4HboO7LzviqVwvfFm
   3qq1WfG7OnquzYHE6GF/u6oj/GN62NKFJ/kocQam8DrmBn4OZyBM1bEKw
   Q4dkExpY8TdzgzicJuJZ91hdp/ZsiXT+o60GM7RI8QuiRMLt3WuinvhAN
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10630"; a="332163017"
X-IronPort-AV: E=Sophos;i="5.97,324,1669104000"; 
   d="scan'208";a="332163017"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Feb 2023 05:52:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10630"; a="703190507"
X-IronPort-AV: E=Sophos;i="5.97,324,1669104000"; 
   d="scan'208";a="703190507"
Received: from lkp-server01.sh.intel.com (HELO 3895f5c55ead) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 24 Feb 2023 05:52:52 -0800
Received: from kbuild by 3895f5c55ead with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pVYVH-0002Rx-25;
	Fri, 24 Feb 2023 13:52:51 +0000
Date: Fri, 24 Feb 2023 21:52:09 +0800
From: kernel test robot <lkp@intel.com>
To: Rahul T R <r-ravikumar@ti.com>
Cc: oe-kbuild-all@lists.linux.dev, vigneshr@ti.com, nm@ti.com
Subject: [ti:ti-linux-5.10.y-cicd 16582/22018] ld.lld: error:
 drivers/gpu/drm/bridge/cadence/cdns-dsi-j721e.o:(.riscv.attributes):
 rv64i2p0_m2p0_a2p0_zicsr2p0_zifencei2p0: unsupported version number 2.0 for
 extension 'zicsr'
Message-ID: <202302242131.bricU5Zi-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Rahul,

First bad commit (maybe != root cause):

tree:   git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git ti-linux-5.10.y-cicd
head:   2c23e6c538c879e380401ae4b236f54020618eaa
commit: de3c3af242ae34519098deef095637cf138eb509 [16582/22018] drm/bridge: cdns-dsi: Add support for J721E wrapper
config: riscv-randconfig-r015-20230222 (https://download.01.org/0day-ci/archive/20230224/202302242131.bricU5Zi-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project db89896bbbd2251fff457699635acbbedeead27f)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        git remote add ti git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git
        git fetch --no-tags ti ti-linux-5.10.y-cicd
        git checkout de3c3af242ae34519098deef095637cf138eb509
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash drivers/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302242131.bricU5Zi-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld.lld: error: drivers/gpu/drm/bridge/cadence/cdns-dsi-core.o:(.riscv.attributes): rv64i2p0_m2p0_a2p0_zicsr2p0_zifencei2p0: unsupported version number 2.0 for extension 'zicsr'
>> ld.lld: error: drivers/gpu/drm/bridge/cadence/cdns-dsi-j721e.o:(.riscv.attributes): rv64i2p0_m2p0_a2p0_zicsr2p0_zifencei2p0: unsupported version number 2.0 for extension 'zicsr'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
