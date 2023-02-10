Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 599BD7F4
	for <oe-kbuild-all@lists.linux.dev>; Fri, 10 Feb 2023 05:14:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676006066; x=1707542066;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=HXOpypt21tTMS3hOzwZXzgD6t+4vIak0ILSplGOwoD0=;
  b=OhJTHZCPvvQcFwJNIf0l7TgJngmrE4rvXB3P55JC6zPHW1F6UZ1kdcdm
   dXUURq/y95Fb6jisA+hd3sYSq7NAaAm8tqFM4i3xoniIV9MQfpoeRk2KU
   eviKo8trOd5r9LboiEn0pElXUh7D3FmnvxQvVfL0Y7/05FrwgjhW57yFo
   pXFibqOE1zL8eJL1xvqsUySF0KqcpNFlfIV/lJppxfAEgeYg9I959SI7V
   l7YOzrVA3zVixDQ5SYupvGhvq1M327vTkYMN2ul1Oi7n1DXBVTrvN3gPg
   ZdiVd+TGIczRv82MzMWpko1Gtij4UK0/my0ibV666Ko7bbBwW1bKyOb0a
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10616"; a="357738421"
X-IronPort-AV: E=Sophos;i="5.97,286,1669104000"; 
   d="scan'208";a="357738421"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Feb 2023 21:14:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10616"; a="756660381"
X-IronPort-AV: E=Sophos;i="5.97,286,1669104000"; 
   d="scan'208";a="756660381"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 09 Feb 2023 21:14:24 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pQLjr-0005ZR-39;
	Fri, 10 Feb 2023 05:14:23 +0000
Date: Fri, 10 Feb 2023 13:14:01 +0800
From: kernel test robot <lkp@intel.com>
To: Rahul T R <r-ravikumar@ti.com>
Cc: oe-kbuild-all@lists.linux.dev, vigneshr@ti.com, nm@ti.com
Subject: [ti:ti-rt-linux-5.10.y 17135/21442] ld.lld: error:
 drivers/gpu/drm/bridge/cadence/cdns-dsi-core.o:(.riscv.attributes):
 rv32i2p0_m2p0_a2p0_c2p0_zicsr2p0_zifencei2p0: unsupported version number 2.0
 for extension 'zicsr'
Message-ID: <202302101323.HiFiTzMW-lkp@intel.com>
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

tree:   git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git ti-rt-linux-5.10.y
head:   221424b9d0cea049e58d5ad93fcec93c90511744
commit: e9ae93444444ae408e3d70cd26efc9336648eee7 [17135/21442] drm/bridge: cdns-dsi: Move to drm/bridge/cadence
config: riscv-randconfig-r042-20230209 (https://download.01.org/0day-ci/archive/20230210/202302101323.HiFiTzMW-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project db0e6591612b53910a1b366863348bdb9d7d2fb1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv-linux-gnu
        git remote add ti git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git
        git fetch --no-tags ti ti-rt-linux-5.10.y
        git checkout e9ae93444444ae408e3d70cd26efc9336648eee7
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash drivers/gpu/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302101323.HiFiTzMW-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: drivers/gpu/drm/bridge/cadence/cdns-dsi-core.o:(.riscv.attributes): rv32i2p0_m2p0_a2p0_c2p0_zicsr2p0_zifencei2p0: unsupported version number 2.0 for extension 'zicsr'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
