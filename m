Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48D0DD312
	for <oe-kbuild-all@lists.linux.dev>; Thu, 16 Feb 2023 04:29:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676521757; x=1708057757;
  h=date:from:cc:subject:message-id:mime-version;
  bh=kp6q97RSqJcW5Ug8v45ZgdL22mtfWLhLaYpaYj/ynj8=;
  b=QqhvgOEyIAxfqD3S6D8T96cayg3L+oQIwVs41GZF/kSkBe5B3faF9uBr
   T45esg9aggocuJTfOpIKb2mneNMTbWAg8XASqBD6gPXdR3z6zLx1k5dgm
   D8DMCCr/bXwj7FPeAcP6zP6gLfVZke4vq/B5jgF2Y1OTugFHkUaLowHRP
   Fr5JHv2zMeNsz81I/7CH3OuRXG5n6ODi41L48Jti9GZjonarSfp8+5mal
   76CuAoGpJ9LUCXlg+3pBIH+y22hi7R4STnv3MCPSMz1waKLWcKeutmF0P
   5l3uT+86RUthB+vFOnVZVP448o0P/fu01LD96gxBvT0Fn7y+RfuZGyMRi
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10622"; a="315295046"
X-IronPort-AV: E=Sophos;i="5.97,301,1669104000"; 
   d="scan'208";a="315295046"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Feb 2023 20:29:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10622"; a="793885805"
X-IronPort-AV: E=Sophos;i="5.97,301,1669104000"; 
   d="scan'208";a="793885805"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 15 Feb 2023 20:29:15 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pSVtT-000A0j-0Q;
	Thu, 16 Feb 2023 04:29:15 +0000
Date: Thu, 16 Feb 2023 12:28:24 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, Junxiao Chang <junxiao.chang@intel.com>
Subject: [intel-lts:5.10/yocto 97/888] ld.lld: error:
 drivers/gpu/drm/mgag200/mgag200_pll.o:(.riscv.attributes):
 rv32i2p0_m2p0_a2p0_zicsr2p0_zifencei2p0: unsupported version number 2.0 for
 extension 'zicsr'
Message-ID: <202302161214.blmMSrgO-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Thomas,

First bad commit (maybe != root cause):

tree:   https://github.com/intel/linux-intel-lts.git 5.10/yocto
head:   a28867696061a1be54960089016434aee399da9d
commit: a56ca53929e95d8314e1129b8ee579755f06304e [97/888] drm/mgag200: Abstract pixel PLL via struct mgag200_pll
config: riscv-buildonly-randconfig-r003-20230214 (https://download.01.org/0day-ci/archive/20230216/202302161214.blmMSrgO-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project db89896bbbd2251fff457699635acbbedeead27f)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv-linux-gnu
        # https://github.com/intel/linux-intel-lts/commit/a56ca53929e95d8314e1129b8ee579755f06304e
        git remote add intel-lts https://github.com/intel/linux-intel-lts.git
        git fetch --no-tags intel-lts 5.10/yocto
        git checkout a56ca53929e95d8314e1129b8ee579755f06304e
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash drivers/gpu/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302161214.blmMSrgO-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld.lld: error: drivers/gpu/drm/mgag200/mgag200_drv.o:(.riscv.attributes): rv32i2p0_m2p0_a2p0_zicsr2p0_zifencei2p0: unsupported version number 2.0 for extension 'zicsr'
   ld.lld: error: drivers/gpu/drm/mgag200/mgag200_i2c.o:(.riscv.attributes): rv32i2p0_m2p0_a2p0_zicsr2p0_zifencei2p0: unsupported version number 2.0 for extension 'zicsr'
   ld.lld: error: drivers/gpu/drm/mgag200/mgag200_mm.o:(.riscv.attributes): rv32i2p0_m2p0_a2p0_zicsr2p0_zifencei2p0: unsupported version number 2.0 for extension 'zicsr'
   ld.lld: error: drivers/gpu/drm/mgag200/mgag200_mode.o:(.riscv.attributes): rv32i2p0_m2p0_a2p0_zicsr2p0_zifencei2p0: unsupported version number 2.0 for extension 'zicsr'
>> ld.lld: error: drivers/gpu/drm/mgag200/mgag200_pll.o:(.riscv.attributes): rv32i2p0_m2p0_a2p0_zicsr2p0_zifencei2p0: unsupported version number 2.0 for extension 'zicsr'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
