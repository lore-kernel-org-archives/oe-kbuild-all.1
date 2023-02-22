Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A162310E6
	for <oe-kbuild-all@lists.linux.dev>; Wed, 22 Feb 2023 22:37:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677105456; x=1708641456;
  h=date:from:cc:subject:message-id:mime-version;
  bh=lmXIPXd17qr2i5xJ1hjtfS4vxWmt1fvbTeGpFT4JNuU=;
  b=DCxAqnKILpQ0Ux/B8VGXkW+6nqSx25b7R/jCaQrAMBZrW53M4lNoXURE
   t3RMGqdBDT8Gxgi3QHxf5pMVPjQ5NGWf0g4DxjP7M5teze42KDpnTwEp3
   NZ1qwr9o/CBadwbH57qdTKQs1ZNsStalVFOaA2snDgZu3sUlKX0M8SB7s
   sni+PQDh+75AesnKJiYooU6MJo3cKvqW25OQdg/Ma/bSdG5fQ1PgJ3Mpw
   0KEk21HeNYEUlHeCiXWMkBKqoINDFfhSlOZEYAYgPJn+4sMOo0iDhvAnR
   ahX+DW0/DzNPkyXaWZJG9R7RUC9s+xcF1oU5879OUCgwlWC/7lOXFRh+/
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10629"; a="331721549"
X-IronPort-AV: E=Sophos;i="5.97,319,1669104000"; 
   d="scan'208";a="331721549"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Feb 2023 14:37:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10629"; a="665514418"
X-IronPort-AV: E=Sophos;i="5.97,319,1669104000"; 
   d="scan'208";a="665514418"
Received: from lkp-server01.sh.intel.com (HELO 3895f5c55ead) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 22 Feb 2023 14:37:34 -0800
Received: from kbuild by 3895f5c55ead with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pUxjx-0000mP-2d;
	Wed, 22 Feb 2023 22:37:33 +0000
Date: Thu, 23 Feb 2023 06:36:52 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, Ranjan Dutta <ranjan.dutta@intel.com>
Subject: [intel-lts:5.10/yocto 13/27] ld.lld: error:
 sound/soc/codecs/cs35l41-spi.o:(.riscv.attributes):
 rv32i2p0_m2p0_a2p0_c2p0_zicsr2p0_zifencei2p0: unsupported version number 2.0
 for extension 'zicsr'
Message-ID: <202302230645.McWDz1ay-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi David,

First bad commit (maybe != root cause):

tree:   https://github.com/intel/linux-intel-lts.git 5.10/yocto
head:   e8844106f6fc41e1c8d5dbadbd62ac3e54030903
commit: 077c8eff1284dace05920702fe0509f134d5c7a1 [13/27] ASoC: cs35l41: CS35L41 Boosted Smart Amplifier
config: riscv-randconfig-r042-20230220 (https://download.01.org/0day-ci/archive/20230223/202302230645.McWDz1ay-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project db89896bbbd2251fff457699635acbbedeead27f)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv-linux-gnu
        # https://github.com/intel/linux-intel-lts/commit/077c8eff1284dace05920702fe0509f134d5c7a1
        git remote add intel-lts https://github.com/intel/linux-intel-lts.git
        git fetch --no-tags intel-lts 5.10/yocto
        git checkout 077c8eff1284dace05920702fe0509f134d5c7a1
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash sound/soc/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302230645.McWDz1ay-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: sound/soc/codecs/cs35l41-spi.o:(.riscv.attributes): rv32i2p0_m2p0_a2p0_c2p0_zicsr2p0_zifencei2p0: unsupported version number 2.0 for extension 'zicsr'
>> ld.lld: error: sound/soc/codecs/cs35l41.o:(.riscv.attributes): rv32i2p0_m2p0_a2p0_c2p0_zicsr2p0_zifencei2p0: unsupported version number 2.0 for extension 'zicsr'
>> ld.lld: error: sound/soc/codecs/cs35l41-tables.o:(.riscv.attributes): rv32i2p0_m2p0_a2p0_c2p0_zicsr2p0_zifencei2p0: unsupported version number 2.0 for extension 'zicsr'
--
>> ld.lld: error: sound/soc/codecs/cs35l41-i2c.o:(.riscv.attributes): rv32i2p0_m2p0_a2p0_c2p0_zicsr2p0_zifencei2p0: unsupported version number 2.0 for extension 'zicsr'
>> ld.lld: error: sound/soc/codecs/cs35l41.o:(.riscv.attributes): rv32i2p0_m2p0_a2p0_c2p0_zicsr2p0_zifencei2p0: unsupported version number 2.0 for extension 'zicsr'
>> ld.lld: error: sound/soc/codecs/cs35l41-tables.o:(.riscv.attributes): rv32i2p0_m2p0_a2p0_c2p0_zicsr2p0_zifencei2p0: unsupported version number 2.0 for extension 'zicsr'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
