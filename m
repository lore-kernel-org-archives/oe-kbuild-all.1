Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEE2B8C0D
	for <oe-kbuild-all@lists.linux.dev>; Tue, 11 Apr 2023 13:47:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681220833; x=1712756833;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/r9LwRr/fosiMhd/sokNFfdFCYHczsEvoYgkL9gEovk=;
  b=kzijyX62yQqp1l3RY0SMu/J9MAS4nb/0Qt0p/LIT380OBTodXlSBQ0AP
   dgMNAnE5g1QkZTgkI8Cz3J2uegaMsoeyae5HFw4/Wnjus2ueWbEiL5Lxb
   B8KFoU3iU31sUQd0P/dpz2CzUQ7OBx0zNTYtQb5B5nQ36MNNDcjINaXUE
   vmt6g+v0pUsot+TwIGXu+m0+9viZ6vDUcpfpwiiP+7XrXz5mbdacSz+a9
   B5/hqeXZ7KnzfjS8LR0sNWSus+aaVl6l6uURAPbWI2mKmq3tEfJGa4WTM
   s4mlfxh8KK1qhGg+VUm4Bju0IjP+rdYviOXG1g/hHGoJbogTKJlzkhzJJ
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10677"; a="332301671"
X-IronPort-AV: E=Sophos;i="5.98,336,1673942400"; 
   d="scan'208";a="332301671"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Apr 2023 06:47:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10677"; a="757847477"
X-IronPort-AV: E=Sophos;i="5.98,336,1673942400"; 
   d="scan'208";a="757847477"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 11 Apr 2023 06:47:12 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pmEL1-000WLb-19;
	Tue, 11 Apr 2023 13:47:11 +0000
Date: Tue, 11 Apr 2023 21:46:26 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com,
	Guenter Roeck <groeck@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-5.15 34/36] ld.lld: error: relocation
 R_PPC_ADDR16_HI cannot be used against local symbol; recompile with -fPIC
Message-ID: <202304112101.RUzjaWCe-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-5.15
head:   020ab985447386a383847518ecb9c4bb4730fa56
commit: 8bbc3e5423732ac191156098468b953539d81dfb [34/36] UPSTREAM: firmware: cs_dsp: Clear core reset for cache
config: powerpc-randconfig-r004-20230409 (https://download.01.org/0day-ci/archive/20230411/202304112101.RUzjaWCe-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project 2c57868e2e877f73c339796c3374ae660bb77f0d)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install powerpc cross compiling tool for clang build
        # apt-get install binutils-powerpc-linux-gnu
        git remote add chrome-os https://chromium.googlesource.com/chromiumos/third_party/kernel
        git fetch --no-tags chrome-os chromeos-5.15
        git checkout 8bbc3e5423732ac191156098468b953539d81dfb
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=powerpc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=powerpc SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304112101.RUzjaWCe-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: relocation R_PPC_ADDR16_HI cannot be used against local symbol; recompile with -fPIC
   >>> defined in arch/powerpc/kernel/head_fsl_booke.o
   >>> referenced by arch/powerpc/kernel/head_fsl_booke.o:(.head.text+0x3E6)
--
>> ld.lld: error: relocation R_PPC_ADDR16_HI cannot be used against local symbol; recompile with -fPIC
   >>> defined in arch/powerpc/kernel/head_fsl_booke.o
   >>> referenced by arch/powerpc/kernel/head_fsl_booke.o:(.head.text+0x1F7A)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
