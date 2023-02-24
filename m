Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0767197
	for <oe-kbuild-all@lists.linux.dev>; Fri, 24 Feb 2023 17:18:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677259083; x=1708795083;
  h=date:from:cc:subject:message-id:mime-version;
  bh=zeG+Pm4hGlTIDc8TRAWUlT8toDe6ecRZUGY0TScU9oU=;
  b=QViTzZ0K1OTUehZn+wIbCF4E6c3JLBO647rklT9coTmTysZcXuTVA2Xj
   888H3WA22eA1mA66mvo0Zm0SJx1lFt2ACwCHub5mlC5CzjdghCw22MfSN
   tcGAzl+ZmwToK6mr+jLmwdztq80Pk1TG121gTGKsWC6TZhY0C3CxJE0ru
   2TNldV6pvg8FGsm2WDVDfUEIqX4rZyA7+teBhR1OEob1s86eZbGo6vqFR
   ofhiyuBnz/OH1EgGeWuS3ZtJkhWTSBT9CCr2aJCpr8QjLybvB/tdJxO3e
   UTeOTb7X33fuh4BWE8eGjHhM/xJoQ6jkDoRQEPEXl0euAwpZoy/8Lb2+P
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10631"; a="333537052"
X-IronPort-AV: E=Sophos;i="5.97,325,1669104000"; 
   d="scan'208";a="333537052"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Feb 2023 09:18:00 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10631"; a="782434515"
X-IronPort-AV: E=Sophos;i="5.97,325,1669104000"; 
   d="scan'208";a="782434515"
Received: from lkp-server01.sh.intel.com (HELO 3895f5c55ead) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 24 Feb 2023 09:17:59 -0800
Received: from kbuild by 3895f5c55ead with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pVbhm-0002Z5-2o;
	Fri, 24 Feb 2023 17:17:58 +0000
Date: Sat, 25 Feb 2023 01:17:17 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, vigneshr@ti.com, nm@ti.com,
	Praneeth Bajjuri <praneeth@ti.com>
Subject: [ti:ti-linux-5.10.y-cicd 19528/22018] ld.lld: error:
 drivers/counter/counter-core.o:(.riscv.attributes):
 rv64i2p0_m2p0_a2p0_zicsr2p0_zifencei2p0: unsupported version number 2.0 for
 extension 'zicsr'
Message-ID: <202302250126.yUtjriLC-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi William,

First bad commit (maybe != root cause):

tree:   git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git ti-linux-5.10.y-cicd
head:   2c23e6c538c879e380401ae4b236f54020618eaa
commit: b232ed3b2fe44ddc827995d70741cc21452e9e01 [19528/22018] counter: 104-quad-8: Remove IIO counter ABI
config: riscv-randconfig-r015-20230222 (https://download.01.org/0day-ci/archive/20230225/202302250126.yUtjriLC-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project db89896bbbd2251fff457699635acbbedeead27f)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        git remote add ti git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git
        git fetch --no-tags ti ti-linux-5.10.y-cicd
        git checkout b232ed3b2fe44ddc827995d70741cc21452e9e01
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash drivers/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302250126.yUtjriLC-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: drivers/counter/counter-core.o:(.riscv.attributes): rv64i2p0_m2p0_a2p0_zicsr2p0_zifencei2p0: unsupported version number 2.0 for extension 'zicsr'
>> ld.lld: error: drivers/counter/counter-sysfs.o:(.riscv.attributes): rv64i2p0_m2p0_a2p0_zicsr2p0_zifencei2p0: unsupported version number 2.0 for extension 'zicsr'
>> ld.lld: error: drivers/counter/counter-chrdev.o:(.riscv.attributes): rv64i2p0_m2p0_a2p0_zicsr2p0_zifencei2p0: unsupported version number 2.0 for extension 'zicsr'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
