Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51C2E15A5
	for <oe-kbuild-all@lists.linux.dev>; Fri, 24 Feb 2023 01:52:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677203554; x=1708739554;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=TmCJdZaRFtNZP9Ll/bZl+G/stfdifPMlvDh3ILtyfVE=;
  b=WMQUfffqqgCIdbyWeM3WWuAW6I+wEKgggSl+wVBnqjhbtEIPdMgazkIp
   aTd+dQZBoDZbBxvWDr8EHizA5Dvvbdjep345K2mWsNCK17KlMQKFi5XmR
   tyYOeWNmMF+/3hQGUHplVWhUDzd9gLGHVwy15XSJxcAemlVWB9/rUUYKV
   8Qdr/cX6ld1mvMxpXEVFRzu69HwPr51OwsJtvjXaWTVZnXXEkl5rIz3wG
   wcNpKY0uHxRbwrYCug8bj4QmrWOE6gxpRxRYUOPBHmaA3/cntItkGNo0s
   4b8zJ4XcKBinkF78JwJ7j3HSIUzH4tLwI0rM7Sam4yFs8KHGg5VkEeDkM
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10630"; a="395885396"
X-IronPort-AV: E=Sophos;i="5.97,322,1669104000"; 
   d="scan'208";a="395885396"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Feb 2023 17:52:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10630"; a="622555669"
X-IronPort-AV: E=Sophos;i="5.97,322,1669104000"; 
   d="scan'208";a="622555669"
Received: from lkp-server01.sh.intel.com (HELO 3895f5c55ead) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 23 Feb 2023 17:52:32 -0800
Received: from kbuild by 3895f5c55ead with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pVNGB-00021Z-1U;
	Fri, 24 Feb 2023 01:52:31 +0000
Date: Fri, 24 Feb 2023 09:51:36 +0800
From: kernel test robot <lkp@intel.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev, nanli2x <nanx.li@intel.com>,
	Bard Liao <bard.liao@intel.com>,
	=?iso-8859-1?Q?P=E9ter?= Ujfalusi <peter.ujfalusi@linux.intel.com>
Subject: [intel-lts:5.10/yocto 18/19] ld.lld: error:
 sound/soc/codecs/rt711-sdca.o:(.riscv.attributes):
 rv64i2p0_m2p0_a2p0_zicsr2p0_zifencei2p0: unsupported version number 2.0 for
 extension 'zicsr'
Message-ID: <202302240932.fUf8hzTY-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel/linux-intel-lts.git 5.10/yocto
head:   e8844106f6fc41e1c8d5dbadbd62ac3e54030903
commit: 797a8164146d5587795a87dc42e0f87fdbfacc73 [18/19] soundwire: export sdw_update() and sdw_update_no_pm()
config: riscv-buildonly-randconfig-r004-20230222 (https://download.01.org/0day-ci/archive/20230224/202302240932.fUf8hzTY-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project db89896bbbd2251fff457699635acbbedeead27f)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://github.com/intel/linux-intel-lts/commit/797a8164146d5587795a87dc42e0f87fdbfacc73
        git remote add intel-lts https://github.com/intel/linux-intel-lts.git
        git fetch --no-tags intel-lts 5.10/yocto
        git checkout 797a8164146d5587795a87dc42e0f87fdbfacc73
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash sound/soc/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302240932.fUf8hzTY-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: sound/soc/codecs/rt711-sdca.o:(.riscv.attributes): rv64i2p0_m2p0_a2p0_zicsr2p0_zifencei2p0: unsupported version number 2.0 for extension 'zicsr'
>> ld.lld: error: sound/soc/codecs/rt711-sdca-sdw.o:(.riscv.attributes): rv64i2p0_m2p0_a2p0_zicsr2p0_zifencei2p0: unsupported version number 2.0 for extension 'zicsr'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
