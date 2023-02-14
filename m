Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA0FD7C
	for <oe-kbuild-all@lists.linux.dev>; Tue, 14 Feb 2023 01:40:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676338850; x=1707874850;
  h=date:from:cc:subject:message-id:mime-version;
  bh=rrUoBa9y6B/QLBmJiUU6ssyBHN1qod+se3NZcgXMr40=;
  b=X29sDeSRAyGn3gPPDQGv96qHNOOu6ua9+jYzMCbrA4b5pUmgBcmrVzOE
   G93MFPYD5YIxD8mV0/SbeCcwNp0qlb67V2aLobDASmlBvg+sjQMj6cxHi
   x/2Mf1WHQcK32tRHmyP54klkvp1CF8PnAtBmWfaJdoZERDqCAs2Co/6E7
   Im7SGl9Ld7pl6oEzX21dGwIpLsMPOk7mtqvObQ8kEdyx78KHBKWaFOsDy
   fwja3+ZNc4DgDNwtowPmhXxW+H1yYkior++x3aqykF9C3CcEYwoi2EswW
   Ra9eSEHlsuK07Er7r3ErSrbVxh8fFyO4tXxboZKt8tX1GWK3VrOcWJdMa
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10620"; a="332363595"
X-IronPort-AV: E=Sophos;i="5.97,294,1669104000"; 
   d="scan'208";a="332363595"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Feb 2023 17:40:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10620"; a="618855423"
X-IronPort-AV: E=Sophos;i="5.97,294,1669104000"; 
   d="scan'208";a="618855423"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 13 Feb 2023 17:40:48 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pRkJM-00087B-0g;
	Tue, 14 Feb 2023 01:40:48 +0000
Date: Tue, 14 Feb 2023 09:40:29 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, vigneshr@ti.com, nm@ti.com,
	Praneeth Bajjuri <praneeth@ti.com>
Subject: [ti:ti-linux-5.10.y 19528/20727] ld.lld: error:
 drivers/counter/counter-core.o:(.riscv.attributes):
 rv64i2p0_m2p0_a2p0_c2p0_zicsr2p0_zifencei2p0: unsupported version number 2.0
 for extension 'zicsr'
Message-ID: <202302140937.RUK9KkCh-lkp@intel.com>
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

tree:   git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git ti-linux-5.10.y
head:   49ac7a0fd28276c30778837c1fd6372b62ae13a6
commit: b232ed3b2fe44ddc827995d70741cc21452e9e01 [19528/20727] counter: 104-quad-8: Remove IIO counter ABI
config: riscv-randconfig-r042-20230212 (https://download.01.org/0day-ci/archive/20230214/202302140937.RUK9KkCh-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project db0e6591612b53910a1b366863348bdb9d7d2fb1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        git remote add ti git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git
        git fetch --no-tags ti ti-linux-5.10.y
        git checkout b232ed3b2fe44ddc827995d70741cc21452e9e01
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash drivers/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302140937.RUK9KkCh-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: drivers/counter/counter-core.o:(.riscv.attributes): rv64i2p0_m2p0_a2p0_c2p0_zicsr2p0_zifencei2p0: unsupported version number 2.0 for extension 'zicsr'
--
>> ld.lld: error: drivers/counter/counter-chrdev.o:(.riscv.attributes): rv64i2p0_m2p0_a2p0_c2p0_zicsr2p0_zifencei2p0: unsupported version number 2.0 for extension 'zicsr'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
