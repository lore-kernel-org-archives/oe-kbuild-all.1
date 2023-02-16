Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45FAF7B
	for <oe-kbuild-all@lists.linux.dev>; Thu, 16 Feb 2023 02:24:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676514255; x=1708050255;
  h=date:from:cc:subject:message-id:mime-version;
  bh=stP32c10cdclr7pAClsLYZUG3O+9MRZbh+uT3MwGdrU=;
  b=XmVx8SnX8qoPz5Yn11iVXDh4wdPiPyJSy9JSMQECrJHdaNEdMULUYtmR
   sTuRF5oAjwt33i0Qrpg/1NZWxd+rd+RjekezC7LS/L1rog+TknbsN1RzH
   5CWzDkUfUIfLOBWPbcdSADAe6KR6G+KZrrpSHnC9ol/JwDF4JuOX9JWMi
   +G39lD9poG8RwG0NrpzlRAvH9QwczDiqz7a13G2Kpz3iDctVnd8dUDKE9
   hqpGtAs7aU8mxFh8vdRiYfQhiYtkbQzQlS5z6FuXtf4HZyBsCmMoJmK4+
   b0mSzynaolDm0+Kc5luIw4R1G5+WMXLae9V1pyKESA0Dx/AgsIstpWw/m
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10622"; a="359032700"
X-IronPort-AV: E=Sophos;i="5.97,301,1669104000"; 
   d="scan'208";a="359032700"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Feb 2023 18:24:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10622"; a="647502501"
X-IronPort-AV: E=Sophos;i="5.97,301,1669104000"; 
   d="scan'208";a="647502501"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 15 Feb 2023 18:24:13 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pSTwS-0009wj-2X;
	Thu, 16 Feb 2023 02:24:12 +0000
Date: Thu, 16 Feb 2023 10:23:49 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, nanli2x <nanx.li@intel.com>
Subject: [intel-lts:5.10/yocto 17/19] ld.lld: error:
 drivers/soundwire/slave.o:(.riscv.attributes):
 rv32i2p0_m2p0_a2p0_zicsr2p0_zifencei2p0: unsupported version number 2.0 for
 extension 'zicsr'
Message-ID: <202302161027.rz6Xj82t-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel/linux-intel-lts.git 5.10/yocto
head:   a28867696061a1be54960089016434aee399da9d
commit: d1c4194ac9652b65062932bf065a58a8581ebf4f [17/19] soundwire: export sdw_compare_devid, sdw_extract_slave_id and sdw_slave_add
config: riscv-buildonly-randconfig-r003-20230214 (https://download.01.org/0day-ci/archive/20230216/202302161027.rz6Xj82t-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project db89896bbbd2251fff457699635acbbedeead27f)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv-linux-gnu
        # https://github.com/intel/linux-intel-lts/commit/d1c4194ac9652b65062932bf065a58a8581ebf4f
        git remote add intel-lts https://github.com/intel/linux-intel-lts.git
        git fetch --no-tags intel-lts 5.10/yocto
        git checkout d1c4194ac9652b65062932bf065a58a8581ebf4f
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash drivers/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302161027.rz6Xj82t-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: drivers/soundwire/slave.o:(.riscv.attributes): rv32i2p0_m2p0_a2p0_zicsr2p0_zifencei2p0: unsupported version number 2.0 for extension 'zicsr'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
